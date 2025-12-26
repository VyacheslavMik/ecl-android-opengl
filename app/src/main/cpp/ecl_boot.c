#include <stdlib.h>
#include <ecl/ecl.h>
#include <android/log.h>
#include <jni.h>

#define LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO, "ecl", __VA_ARGS__))
#define LOGW(...) ((void)__android_log_print(ANDROID_LOG_WARN, "ecl", __VA_ARGS__))
#define LOGE(...) ((void)__android_log_print(ANDROID_LOG_ERROR, "ecl", __VA_ARGS__))
#define LOGV(...) ((void)__android_log_print(ANDROID_LOG_VERBOSE, "ecl", __VA_ARGS__))

#include "ecl_boot.h"
#include "logging.h"

#include <android/asset_manager.h>
#include <android/asset_manager_jni.h>

#ifdef __cplusplus
#define ECL_CPP_TAG "C"
#else
#define ECL_CPP_TAG
#endif

extern void loadLispFromAssets(char* fn);

JavaVM  *jvm;
static jobject classLoader;
static jmethodID findClassMethod;

jclass findClass(JNIEnv *env, const char *name)
{
    jclass activityClass = (jclass)(*env)->CallObjectMethod(env,
							    classLoader,
							    findClassMethod,
							    (*env)->NewStringUTF(env, "ru/betelgeuse/dunpixpar/JNIActivity"));
    jfieldID amField = (*env)->GetStaticFieldID(env,
                                                 activityClass,
                                                 "sAssetManager",
                                                 "Landroid/content/res/AssetManager;");
    jobject am = (*env)->GetStaticObjectField(env, activityClass, amField);
    AAssetManager *assetmanager = AAssetManager_fromJava(env, am);

    LOGI("Debug print x: %p, %p, %p, %p", am, amField, activityClass, assetmanager);

    LOGI("findClass: %p, %s", env, name);
    return (jclass)(*env)->CallObjectMethod(env, classLoader, findClassMethod, (*env)->NewStringUTF(env, name));
}

int ecl_boot(const char *root_dir, JNIEnv *env, jobject this)
{
    start_logger("ecl-standard-output");

    char *ecl = "ecl";
    char tmp[2048];

    LOGI("ECL boot beginning\n");

    LOGI("Setting directories\n");
    setenv("HOME", root_dir, 1);

    sprintf(tmp, "%s/lib/", root_dir);
    setenv("ECLDIR", tmp, 1);

    sprintf(tmp, "%s/etc/", root_dir);
    setenv("ETC", tmp, 1);

    sprintf(tmp, "%s/home/", root_dir);
    setenv("HOME", tmp, 1);

    LOGI("Directories set\n");

    cl_boot(1, &ecl);

    LOGI("Installing bytecodes compiler\n");
    si_safe_eval(3, c_string_to_object("(si:install-bytecodes-compiler)"), ECL_NIL, OBJNULL);

    LOGI("writing some info to stdout\n");
    si_safe_eval
            (3, c_string_to_object
                     ("(format t \"ECL_BOOT, features = ~A ~%\" *features*)"),
             Cnil, OBJNULL);
    si_safe_eval
            (3, c_string_to_object
                     ("(format t \"(truename SYS:): ~A)\" (truename \"SYS:\"))"),
             Cnil, OBJNULL);

    LOGI("Getting jvm: %i", (*env)->GetJavaVM(env, &jvm));

    JNIEnv  *_env;
    JavaVMAttachArgs args;
    args.version = JNI_VERSION_1_6;
    (*jvm)->AttachCurrentThread(jvm, &_env, &args);

    jclass activityClass = (*_env)->FindClass(_env, "ru/betelgeuse/dunpixpar/JNIActivity");
    jclass classClass = (*_env)->GetObjectClass(_env, activityClass);
    jclass classLoaderClass = (*_env)->FindClass(_env, "java/lang/ClassLoader");
    jmethodID getClassLoaderMethod = (*_env)->GetMethodID(_env,
							  classClass,
							  "getClassLoader",
							  "()Ljava/lang/ClassLoader;");
    jobject classLoaderObj = (*_env)->CallObjectMethod(_env, activityClass, getClassLoaderMethod);
    classLoader = (*_env)->NewGlobalRef(_env, classLoaderObj);
    findClassMethod = (*_env)->GetMethodID(_env,
					   classLoaderClass,
					   "findClass",
					   "(Ljava/lang/String;)Ljava/lang/Class;");

    ecl_setq(ecl_process_env(), ecl_make_symbol("*JVM*", "CL-USER"), ecl_make_pointer(jvm));
    ecl_setq(ecl_process_env(), ecl_make_symbol("*CLASS-LOADER*", "CL-USER"), ecl_make_pointer(classLoader));
    ecl_setq(ecl_process_env(), ecl_make_symbol("*FIND-CLASS-PTR*", "CL-USER"), ecl_make_pointer(&findClass));

    ecl_toplevel(root_dir);

    LOGI("Debug print: %p, %p, %p, %p, %i, %p, %p", jvm, (*jvm)->AttachCurrentThread, *_env, (*_env)->GetVersion,
         (*_env)->GetVersion(_env),
         activityClass,
         NULL
    );

    return 0;
}

void ecl_toplevel(const char *home)
{
    char tmp[2048];

    LOGI("Executing the init scripts\n");

    CL_CATCH_ALL_BEGIN(ecl_process_env())
    {
        sprintf(tmp, "(setq *default-pathname-defaults* #p\"%s/\")", home);
        si_safe_eval(3, c_string_to_object(tmp), Cnil, OBJNULL);
        si_select_package(ecl_make_simple_base_string("CL-USER", 7));
        si_safe_eval(3, c_string_to_object("(load \"etc/init\")"), Cnil, OBJNULL);
    } CL_CATCH_ALL_END;

    LOGI("Toplevel initialization done\n");
}
