#ifndef _Included_Java_ru_betelgeuse_dunpixpar_JNILib
#define _Included_Java_ru_betelgeuse_dunpixpar_JNILib

extern "C" {
  JNIEXPORT void JNICALL Java_ru_betelgeuse_dunpixpar_JNILib_init(JNIEnv *, jobject, jstring);
  JNIEXPORT void JNICALL Java_ru_betelgeuse_dunpixpar_JNILib_resize(JNIEnv *, jobject, jint, jint);
  JNIEXPORT void JNICALL Java_ru_betelgeuse_dunpixpar_JNILib_step(JNIEnv *, jobject);
}

#endif
