#include <assert.h>
#include <android/log.h>
#include <string.h>
#include <jni.h>
#include <pthread.h>
#include <stdio.h>

#include <ecl/ecl.h>
#include <ecl/external.h>
#include <malloc.h>
#include "ecl_boot.h"

#include <GLES2/gl2.h>
#include <GLES2/gl2ext.h>

#define TAG "JNILib"
#define LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO, TAG, __VA_ARGS__))
#define LOGW(...) ((void)__android_log_print(ANDROID_LOG_WARN, TAG, __VA_ARGS__))
#define LOGE(...) ((void)__android_log_print(ANDROID_LOG_ERROR, TAG, __VA_ARGS__))
#define LOGV(...) ((void)__android_log_print(ANDROID_LOG_VERBOSE, TAG, __VA_ARGS__))

static void printGLString(const char *name, GLenum s) {
  const char *v = (const char *) glGetString(s);
  LOGI("GL %s = %s\n", name, v);
}

static void checkGlError(const char* op) {
  for (GLint error = glGetError(); error; error = glGetError()) {
    LOGI("after %s() glError (0x%x)\n", op, error);
  }
}

JNIEXPORT void JNICALL
Java_ru_betelgeuse_dunpixpar_JNILib_init(JNIEnv *env, jobject this, jstring path) {
  LOGI("ECL starting: %s", path);
  const char *lisp_dir = (*env)->GetStringUTFChars(env, path, NULL);
  LOGI("ECL starting: *default-pathname-defaults* to: %s\n", lisp_dir);
  ecl_boot(lisp_dir, env, this);
  LOGI("ECL started.");
};

JNIEXPORT void JNICALL
Java_ru_betelgeuse_dunpixpar_JNILib_resize(JNIEnv *env, jobject this, jint width, jint height) {
  char tmp[2048];

  LOGI("Resize: %d %d\n", width, height);

  ECL_CATCH_ALL_BEGIN(ecl_process_env()) {
    sprintf(tmp, "(CL-USER::JNILIB/RESIZE %d %d)", width, height);
    si_safe_eval(3, c_string_to_object(tmp), Cnil, OBJNULL);
  } ECL_CATCH_ALL_IF_CAUGHT {
    LOGI("Resize error!!!\n");
  } ECL_CATCH_ALL_END;

  LOGI("Resize finished\n");
};

JNIEXPORT void JNICALL
Java_ru_betelgeuse_dunpixpar_JNILib_step(JNIEnv *env, jobject this) {
  checkGlError("glClearColor");
  ECL_CATCH_ALL_BEGIN(ecl_process_env()) {
    si_safe_eval(3, c_string_to_object("(CL-USER::JNILIB/STEP)"), Cnil, OBJNULL);
  } ECL_CATCH_ALL_IF_CAUGHT {
    LOGI("Step error!!!\n");
  } ECL_CATCH_ALL_END;
};
