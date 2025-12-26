(in-package :cl-user)

;; Proc return types
;; ("GLuint" "GLenum" "const GLubyte" "GLint" "GLboolean" "void")

;; Proc param types
;; ("const GLuint" "const GLchar" "const GLint" "const GLfloat" "const void")

(cffi:define-foreign-library gles
  (t "libGLESv2.so"))
   
(cffi:use-foreign-library gles)

(cffi:defctype gl/byte :char)
(cffi:defctype gl/clampf :float)
(cffi:defctype gl/fixed :int)
(cffi:defctype gl/short :short)
(cffi:defctype gl/ushort :unsigned-short)
(cffi:defctype gl/void :void)
(cffi:defctype gl/int64 :long)
(cffi:defctype gl/uint64 :unsigned-long)
(cffi:defctype gl/uint :unsigned-int)
(cffi:defctype gl/char :char)
(cffi:defctype gl/float :float)
(cffi:defctype gl/sizeiptr :long-long)
(cffi:defctype gl/intptr :long-long)
(cffi:defctype gl/bitfield :unsigned-int)
(cffi:defctype gl/int :int)
(cffi:defctype gl/boolean :unsigned-char)
(cffi:defctype gl/sizei :int)
(cffi:defctype gl/ubyte :unsigned-char)

(defparameter gl/true 1)
(defparameter gl/false 0)

(defun gl/falsep (v)
  (= v gl/false))

(defun gl/truep (v)
  (= v gl/true))

(cffi:defbitfield gl/enum
  (:gl/points #x0000)
  (:gl/lines #x0001)
  (:gl/line-loop #x0002)
  (:gl/line-strip #x0003)
  (:gl/triangles #x0004)
  (:gl/triangle-strip #x0005)
  (:gl/triangle-fan #x0006)
  (:gl/depth-buffer-bit #x00000100)
  (:gl/never #x0200)
  (:gl/less #x0201)
  (:gl/equal #x0202)
  (:gl/lequal #x0203)
  (:gl/greater #x0204)
  (:gl/notequal #x0205)
  (:gl/gequal #x0206)
  (:gl/always #x0207)
  (:gl/src-color #x0300)
  (:gl/one-minus-src-color #x0301)
  (:gl/src-alpha #x0302)
  (:gl/one-minus-src-alpha #x0303)
  (:gl/dst-alpha #x0304)
  (:gl/one-minus-dst-alpha #x0305)
  (:gl/dst-color #x0306)
  (:gl/one-minus-dst-color #x0307)
  (:gl/src-alpha-saturate #x0308)
  (:gl/stencil-buffer-bit #x00000400)
  (:gl/front #x0404)
  (:gl/back #x0405)
  (:gl/front-and-back #x0408)
  (:gl/invalid-enum #x0500)
  (:gl/invalid-value #x0501)
  (:gl/invalid-operation #x0502)
  (:gl/out-of-memory #x0505)
  (:gl/invalid-framebuffer-operation #x0506)
  (:gl/cw #x0900)
  (:gl/ccw #x0901)
  (:gl/line-width #x0B21)
  (:gl/cull-face #x0B44)
  (:gl/cull-face-mode #x0B45)
  (:gl/front-face #x0B46)
  (:gl/depth-range #x0B70)
  (:gl/depth-test #x0B71)
  (:gl/depth-writemask #x0B72)
  (:gl/depth-clear-value #x0B73)
  (:gl/depth-func #x0B74)
  (:gl/stencil-test #x0B90)
  (:gl/stencil-clear-value #x0B91)
  (:gl/stencil-func #x0B92)
  (:gl/stencil-value-mask #x0B93)
  (:gl/stencil-fail #x0B94)
  (:gl/stencil-pass-depth-fail #x0B95)
  (:gl/stencil-pass-depth-pass #x0B96)
  (:gl/stencil-ref #x0B97)
  (:gl/stencil-writemask #x0B98)
  (:gl/viewport #x0BA2)
  (:gl/dither #x0BD0)
  (:gl/blend #x0BE2)
  (:gl/scissor-box #x0C10)
  (:gl/scissor-test #x0C11)
  (:gl/color-clear-value #x0C22)
  (:gl/color-writemask #x0C23)
  (:gl/unpack-alignment #x0CF5)
  (:gl/pack-alignment #x0D05)
  (:gl/max-texture-size #x0D33)
  (:gl/max-viewport-dims #x0D3A)
  (:gl/subpixel-bits #x0D50)
  (:gl/red-bits #x0D52)
  (:gl/green-bits #x0D53)
  (:gl/blue-bits #x0D54)
  (:gl/alpha-bits #x0D55)
  (:gl/depth-bits #x0D56)
  (:gl/stencil-bits #x0D57)
  (:gl/texture-2d #x0DE1)
  (:gl/dont-care #x1100)
  (:gl/fastest #x1101)
  (:gl/nicest #x1102)
  (:gl/byte #x1400)
  (:gl/unsigned-byte #x1401)
  (:gl/short #x1402)
  (:gl/unsigned-short #x1403)
  (:gl/int #x1404)
  (:gl/unsigned-int #x1405)
  (:gl/float #x1406)
  (:gl/fixed #x140C)
  (:gl/invert #x150A)
  (:gl/texture #x1702)
  (:gl/depth-component #x1902)
  (:gl/alpha #x1906)
  (:gl/rgb #x1907)
  (:gl/rgba #x1908)
  (:gl/luminance #x1909)
  (:gl/luminance-alpha #x190A)
  (:gl/keep #x1E00)
  (:gl/replace #x1E01)
  (:gl/incr #x1E02)
  (:gl/decr #x1E03)
  (:gl/vendor #x1F00)
  (:gl/renderer #x1F01)
  (:gl/version #x1F02)
  (:gl/extensions #x1F03)
  (:gl/nearest #x2600)
  (:gl/linear #x2601)
  (:gl/nearest-mipmap-nearest #x2700)
  (:gl/linear-mipmap-nearest #x2701)
  (:gl/nearest-mipmap-linear #x2702)
  (:gl/linear-mipmap-linear #x2703)
  (:gl/texture-mag-filter #x2800)
  (:gl/texture-min-filter #x2801)
  (:gl/texture-wrap-s #x2802)
  (:gl/texture-wrap-t #x2803)
  (:gl/repeat #x2901)
  (:gl/polygon-offset-units #x2A00)
  (:gl/color-buffer-bit #x00004000)
  (:gl/constant-color #x8001)
  (:gl/one-minus-constant-color #x8002)
  (:gl/constant-alpha #x8003)
  (:gl/one-minus-constant-alpha #x8004)
  (:gl/blend-color #x8005)
  (:gl/func-add #x8006)
  (:gl/blend-equation #x8009)
  (:gl/blend-equation-rgb #x8009)
  (:gl/func-subtract #x800A)
  (:gl/func-reverse-subtract #x800B)
  (:gl/unsigned-short-4-4-4-4 #x8033)
  (:gl/unsigned-short-5-5-5-1 #x8034)
  (:gl/polygon-offset-fill #x8037)
  (:gl/polygon-offset-factor #x8038)
  (:gl/rgba4 #x8056)
  (:gl/rgb5-a1 #x8057)
  (:gl/texture-binding-2d #x8069)
  (:gl/sample-alpha-to-coverage #x809E)
  (:gl/sample-coverage #x80A0)
  (:gl/sample-buffers #x80A8)
  (:gl/samples #x80A9)
  (:gl/sample-coverage-value #x80AA)
  (:gl/sample-coverage-invert #x80AB)
  (:gl/blend-dst-rgb #x80C8)
  (:gl/blend-src-rgb #x80C9)
  (:gl/blend-dst-alpha #x80CA)
  (:gl/blend-src-alpha #x80CB)
  (:gl/clamp-to-edge #x812F)
  (:gl/generate-mipmap-hint #x8192)
  (:gl/depth-component16 #x81A5)
  (:gl/unsigned-short-5-6-5 #x8363)
  (:gl/mirrored-repeat #x8370)
  (:gl/aliased-point-size-range #x846D)
  (:gl/aliased-line-width-range #x846E)
  (:gl/texture0 #x84C0)
  (:gl/texture1 #x84C1)
  (:gl/texture2 #x84C2)
  (:gl/texture3 #x84C3)
  (:gl/texture4 #x84C4)
  (:gl/texture5 #x84C5)
  (:gl/texture6 #x84C6)
  (:gl/texture7 #x84C7)
  (:gl/texture8 #x84C8)
  (:gl/texture9 #x84C9)
  (:gl/texture10 #x84CA)
  (:gl/texture11 #x84CB)
  (:gl/texture12 #x84CC)
  (:gl/texture13 #x84CD)
  (:gl/texture14 #x84CE)
  (:gl/texture15 #x84CF)
  (:gl/texture16 #x84D0)
  (:gl/texture17 #x84D1)
  (:gl/texture18 #x84D2)
  (:gl/texture19 #x84D3)
  (:gl/texture20 #x84D4)
  (:gl/texture21 #x84D5)
  (:gl/texture22 #x84D6)
  (:gl/texture23 #x84D7)
  (:gl/texture24 #x84D8)
  (:gl/texture25 #x84D9)
  (:gl/texture26 #x84DA)
  (:gl/texture27 #x84DB)
  (:gl/texture28 #x84DC)
  (:gl/texture29 #x84DD)
  (:gl/texture30 #x84DE)
  (:gl/texture31 #x84DF)
  (:gl/active-texture #x84E0)
  (:gl/max-renderbuffer-size #x84E8)
  (:gl/incr-wrap #x8507)
  (:gl/decr-wrap #x8508)
  (:gl/texture-cube-map #x8513)
  (:gl/texture-binding-cube-map #x8514)
  (:gl/texture-cube-map-positive-x #x8515)
  (:gl/texture-cube-map-negative-x #x8516)
  (:gl/texture-cube-map-positive-y #x8517)
  (:gl/texture-cube-map-negative-y #x8518)
  (:gl/texture-cube-map-positive-z #x8519)
  (:gl/texture-cube-map-negative-z #x851A)
  (:gl/max-cube-map-texture-size #x851C)
  (:gl/vertex-attrib-array-enabled #x8622)
  (:gl/vertex-attrib-array-size #x8623)
  (:gl/vertex-attrib-array-stride #x8624)
  (:gl/vertex-attrib-array-type #x8625)
  (:gl/current-vertex-attrib #x8626)
  (:gl/vertex-attrib-array-pointer #x8645)
  (:gl/num-compressed-texture-formats #x86A2)
  (:gl/compressed-texture-formats #x86A3)
  (:gl/buffer-size #x8764)
  (:gl/buffer-usage #x8765)
  (:gl/stencil-back-func #x8800)
  (:gl/stencil-back-fail #x8801)
  (:gl/stencil-back-pass-depth-fail #x8802)
  (:gl/stencil-back-pass-depth-pass #x8803)
  (:gl/blend-equation-alpha #x883D)
  (:gl/max-vertex-attribs #x8869)
  (:gl/vertex-attrib-array-normalized #x886A)
  (:gl/max-texture-image-units #x8872)
  (:gl/array-buffer #x8892)
  (:gl/element-array-buffer #x8893)
  (:gl/array-buffer-binding #x8894)
  (:gl/element-array-buffer-binding #x8895)
  (:gl/vertex-attrib-array-buffer-binding #x889F)
  (:gl/stream-draw #x88E0)
  (:gl/static-draw #x88E4)
  (:gl/dynamic-draw #x88E8)
  (:gl/fragment-shader #x8B30)
  (:gl/vertex-shader #x8B31)
  (:gl/max-vertex-texture-image-units #x8B4C)
  (:gl/max-combined-texture-image-units #x8B4D)
  (:gl/shader-type #x8B4F)
  (:gl/float-vec2 #x8B50)
  (:gl/float-vec3 #x8B51)
  (:gl/float-vec4 #x8B52)
  (:gl/int-vec2 #x8B53)
  (:gl/int-vec3 #x8B54)
  (:gl/int-vec4 #x8B55)
  (:gl/bool #x8B56)
  (:gl/bool-vec2 #x8B57)
  (:gl/bool-vec3 #x8B58)
  (:gl/bool-vec4 #x8B59)
  (:gl/float-mat2 #x8B5A)
  (:gl/float-mat3 #x8B5B)
  (:gl/float-mat4 #x8B5C)
  (:gl/sampler-2d #x8B5E)
  (:gl/sampler-cube #x8B60)
  (:gl/delete-status #x8B80)
  (:gl/compile-status #x8B81)
  (:gl/link-status #x8B82)
  (:gl/validate-status #x8B83)
  (:gl/info-log-length #x8B84)
  (:gl/attached-shaders #x8B85)
  (:gl/active-uniforms #x8B86)
  (:gl/active-uniform-max-length #x8B87)
  (:gl/shader-source-length #x8B88)
  (:gl/active-attributes #x8B89)
  (:gl/active-attribute-max-length #x8B8A)
  (:gl/shading-language-version #x8B8C)
  (:gl/current-program #x8B8D)
  (:gl/implementation-color-read-type #x8B9A)
  (:gl/implementation-color-read-format #x8B9B)
  (:gl/stencil-back-ref #x8CA3)
  (:gl/stencil-back-value-mask #x8CA4)
  (:gl/stencil-back-writemask #x8CA5)
  (:gl/framebuffer-binding #x8CA6)
  (:gl/renderbuffer-binding #x8CA7)
  (:gl/framebuffer-attachment-object-type #x8CD0)
  (:gl/framebuffer-attachment-object-name #x8CD1)
  (:gl/framebuffer-attachment-texture-level #x8CD2)
  (:gl/framebuffer-attachment-texture-cube-map-face #x8CD3)
  (:gl/framebuffer-complete #x8CD5)
  (:gl/framebuffer-incomplete-attachment #x8CD6)
  (:gl/framebuffer-incomplete-missing-attachment #x8CD7)
  (:gl/framebuffer-incomplete-dimensions #x8CD9)
  (:gl/framebuffer-unsupported #x8CDD)
  (:gl/color-attachment0 #x8CE0)
  (:gl/depth-attachment #x8D00)
  (:gl/stencil-attachment #x8D20)
  (:gl/framebuffer #x8D40)
  (:gl/renderbuffer #x8D41)
  (:gl/renderbuffer-width #x8D42)
  (:gl/renderbuffer-height #x8D43)
  (:gl/renderbuffer-internal-format #x8D44)
  (:gl/stencil-index8 #x8D48)
  (:gl/renderbuffer-red-size #x8D50)
  (:gl/renderbuffer-green-size #x8D51)
  (:gl/renderbuffer-blue-size #x8D52)
  (:gl/renderbuffer-alpha-size #x8D53)
  (:gl/renderbuffer-depth-size #x8D54)
  (:gl/renderbuffer-stencil-size #x8D55)
  (:gl/rgb565 #x8D62)
  (:gl/low-float #x8DF0)
  (:gl/medium-float #x8DF1)
  (:gl/high-float #x8DF2)
  (:gl/low-int #x8DF3)
  (:gl/medium-int #x8DF4)
  (:gl/high-int #x8DF5)
  (:gl/shader-binary-formats #x8DF8)
  (:gl/num-shader-binary-formats #x8DF9)
  (:gl/shader-compiler #x8DFA)
  (:gl/max-vertex-uniform-vectors #x8DFB)
  (:gl/max-varying-vectors #x8DFC)
  (:gl/max-fragment-uniform-vectors #x8DFD))

(cffi:defcfun ("glActiveTexture" |glActiveTexture|) :void
  (|texture| gl/enum))

(cffi:defcfun ("glAttachShader" |glAttachShader|) :void
  (|program| gl/uint)
  (|shader| gl/uint))

(cffi:defcfun ("glBindAttribLocation" |glBindAttribLocation|) :void
  (|program| gl/uint)
  (|index| gl/uint)
  (|name| :string))

(cffi:defcfun ("glBindBuffer" |glBindBuffer|) :void
  (|target| gl/enum)
  (|buffer| gl/uint))

(cffi:defcfun ("glBindFramebuffer" |glBindFramebuffer|) :void
  (|target| gl/enum)
  (|framebuffer| gl/uint))

(cffi:defcfun ("glBindRenderbuffer" |glBindRenderbuffer|) :void
  (|target| gl/enum)
  (|renderbuffer| gl/uint))

(cffi:defcfun ("glBindTexture" |glBindTexture|) :void
  (|target| gl/enum)
  (|texture| gl/uint))

(cffi:defcfun ("glBlendColor" |glBlendColor|) :void
  (|red| gl/float)
  (|green| gl/float)
  (|blue| gl/float)
  (|alpha| gl/float))

(cffi:defcfun ("glBlendEquation" |glBlendEquation|) :void
  (|mode| gl/enum))

(cffi:defcfun ("glBlendEquationSeparate" |glBlendEquationSeparate|) :void
  (|modeRGB| gl/enum)
  (|modeAlpha| gl/enum))

(cffi:defcfun ("glBlendFunc" |glBlendFunc|) :void
  (|sfactor| gl/enum)
  (|dfactor| gl/enum))

(cffi:defcfun ("glBlendFuncSeparate" |glBlendFuncSeparate|) :void
  (|sfactorRGB| gl/enum)
  (|dfactorRGB| gl/enum)
  (|sfactorAlpha| gl/enum)
  (|dfactorAlpha| gl/enum))

(cffi:defcfun ("glBufferData" |glBufferData|) :void
  (|target| gl/enum)
  (|size| gl/sizeiptr)
  (|data| :pointer)
  (|usage| gl/enum))

(cffi:defcfun ("glBufferSubData" |glBufferSubData|) :void
  (|target| gl/enum)
  (|offset| gl/intptr)
  (|size| gl/sizeiptr)
  (|data| :pointer))

(cffi:defcfun ("glCheckFramebufferStatus" |glCheckFramebufferStatus|) gl/enum
  (|target| gl/enum))

(cffi:defcfun ("glClear" |glClear|) :void
  (|mask| gl/bitfield))

(cffi:defcfun ("glClearColor" |glClearColor|) :void
  (|red| gl/float)
  (|green| gl/float)
  (|blue| gl/float)
  (|alpha| gl/float))

(cffi:defcfun ("glClearDepthf" |glClearDepthf|) :void
  (|d| gl/float))

(cffi:defcfun ("glClearStencil" |glClearStencil|) :void
  (|s| gl/int))

(cffi:defcfun ("glColorMask" |glColorMask|) :void
  (|red| gl/boolean)
  (|green| gl/boolean)
  (|blue| gl/boolean)
  (|alpha| gl/boolean))

(cffi:defcfun ("glCompileShader" |glCompileShader|) :void
  (|shader| gl/uint))

(cffi:defcfun ("glCompressedTexImage2D" |glCompressedTexImage2D|) :void
  (|target| gl/enum)
  (|level| gl/int)
  (|internalformat| gl/enum)
  (|width| gl/sizei)
  (|height| gl/sizei)
  (|border| gl/int)
  (|imageSize| gl/sizei)
  (|data| :pointer))

(cffi:defcfun ("glCompressedTexSubImage2D" |glCompressedTexSubImage2D|) :void
  (|target| gl/enum)
  (|level| gl/int)
  (|xoffset| gl/int)
  (|yoffset| gl/int)
  (|width| gl/sizei)
  (|height| gl/sizei)
  (|format| gl/enum)
  (|imageSize| gl/sizei)
  (|data| :pointer))

(cffi:defcfun ("glCopyTexImage2D" |glCopyTexImage2D|) :void
  (|target| gl/enum)
  (|level| gl/int)
  (|internalformat| gl/enum)
  (|x| gl/int)
  (|y| gl/int)
  (|width| gl/sizei)
  (|height| gl/sizei)
  (|border| gl/int))

(cffi:defcfun ("glCopyTexSubImage2D" |glCopyTexSubImage2D|) :void
  (|target| gl/enum)
  (|level| gl/int)
  (|xoffset| gl/int)
  (|yoffset| gl/int)
  (|x| gl/int)
  (|y| gl/int)
  (|width| gl/sizei)
  (|height| gl/sizei))

(cffi:defcfun ("glCreateProgram" |glCreateProgram|) gl/uint)

(cffi:defcfun ("glCreateShader" |glCreateShader|) gl/uint
  (|type| gl/enum))

(cffi:defcfun ("glCullFace" |glCullFace|) :void
  (|mode| gl/enum))

(cffi:defcfun ("glDeleteBuffers" |glDeleteBuffers|) :void
  (|n| gl/sizei)
  (|buffers| :pointer))

(cffi:defcfun ("glDeleteFramebuffers" |glDeleteFramebuffers|) :void
  (|n| gl/sizei)
  (|framebuffers| :pointer))

(cffi:defcfun ("glDeleteProgram" |glDeleteProgram|) :void
  (|program| gl/uint))

(cffi:defcfun ("glDeleteRenderbuffers" |glDeleteRenderbuffers|) :void
  (|n| gl/sizei)
  (|renderbuffers| :pointer))

(cffi:defcfun ("glDeleteShader" |glDeleteShader|) :void
  (|shader| gl/uint))

(cffi:defcfun ("glDeleteTextures" |glDeleteTextures|) :void
  (|n| gl/sizei)
  (|textures| :pointer))

(cffi:defcfun ("glDepthFunc" |glDepthFunc|) :void
  (|func| gl/enum))

(cffi:defcfun ("glDepthMask" |glDepthMask|) :void
  (|flag| gl/boolean))

(cffi:defcfun ("glDepthRangef" |glDepthRangef|) :void
  (|n| gl/float)
  (|f| gl/float))

(cffi:defcfun ("glDetachShader" |glDetachShader|) :void
  (|program| gl/uint)
  (|shader| gl/uint))

(cffi:defcfun ("glDisable" |glDisable|) :void
  (|cap| gl/enum))

(cffi:defcfun ("glDisableVertexAttribArray" |glDisableVertexAttribArray|) :void
  (|index| gl/uint))

(cffi:defcfun ("glDrawArrays" |glDrawArrays|) :void
  (|mode| gl/enum)
  (|first| gl/int)
  (|count| gl/sizei))

(cffi:defcfun ("glDrawElements" |glDrawElements|) :void
  (|mode| gl/enum)
  (|count| gl/sizei)
  (|type| gl/enum)
  (|indices| :pointer))

(cffi:defcfun ("glEnable" |glEnable|) :void
  (|cap| gl/enum))

(cffi:defcfun ("glEnableVertexAttribArray" |glEnableVertexAttribArray|) :void
  (|index| gl/uint))

(cffi:defcfun ("glFinish" |glFinish|) :void)

(cffi:defcfun ("glFlush" |glFlush|) :void)

(cffi:defcfun ("glFramebufferRenderbuffer" |glFramebufferRenderbuffer|) :void
  (|target| gl/enum)
  (|attachment| gl/enum)
  (|renderbuffertarget| gl/enum)
  (|renderbuffer| gl/uint))

(cffi:defcfun ("glFramebufferTexture2D" |glFramebufferTexture2D|) :void
  (|target| gl/enum)
  (|attachment| gl/enum)
  (|textarget| gl/enum)
  (|texture| gl/uint)
  (|level| gl/int))

(cffi:defcfun ("glFrontFace" |glFrontFace|) :void
  (|mode| gl/enum))

(cffi:defcfun ("glGenBuffers" |glGenBuffers|) :void
  (|n| gl/sizei)
  (|buffers| :pointer))

(cffi:defcfun ("glGenerateMipmap" |glGenerateMipmap|) :void
  (|target| gl/enum))

(cffi:defcfun ("glGenFramebuffers" |glGenFramebuffers|) :void
  (|n| gl/sizei)
  (|framebuffers| :pointer))

(cffi:defcfun ("glGenRenderbuffers" |glGenRenderbuffers|) :void
  (|n| gl/sizei)
  (|renderbuffers| :pointer))

(cffi:defcfun ("glGenTextures" |glGenTextures|) :void
  (|n| gl/sizei)
  (|textures| :pointer))

(cffi:defcfun ("glGetActiveAttrib" |glGetActiveAttrib|) :void
  (|program| gl/uint)
  (|index| gl/uint)
  (|bufSize| gl/sizei)
  (|length| :pointer)
  (|size| :pointer)
  (|type| :pointer)
  (|name| :string))

(cffi:defcfun ("glGetActiveUniform" |glGetActiveUniform|) :void
  (|program| gl/uint)
  (|index| gl/uint)
  (|bufSize| gl/sizei)
  (|length| :pointer)
  (|size| :pointer)
  (|type| :pointer)
  (|name| :string))

(cffi:defcfun ("glGetAttachedShaders" |glGetAttachedShaders|) :void
  (|program| gl/uint)
  (|maxCount| gl/sizei)
  (|count| :pointer)
  (|shaders| :pointer))

(cffi:defcfun ("glGetAttribLocation" |glGetAttribLocation|) gl/int
  (|program| gl/uint)
  (|name| :string))

(cffi:defcfun ("glGetBooleanv" |glGetBooleanv|) :void
  (|pname| gl/enum)
  (|data| :pointer))

(cffi:defcfun ("glGetBufferParameteriv" |glGetBufferParameteriv|) :void
  (|target| gl/enum)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetError" |glGetError|) gl/enum)

(cffi:defcfun ("glGetFloatv" |glGetFloatv|) :void
  (|pname| gl/enum)
  (|data| :pointer))

(cffi:defcfun ("glGetFramebufferAttachmentParameteriv" |glGetFramebufferAttachmentParameteriv|) :void
  (|target| gl/enum)
  (|attachment| gl/enum)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetIntegerv" |glGetIntegerv|) :void
  (|pname| gl/enum)
  (|data| :pointer))

(cffi:defcfun ("glGetProgramiv" |glGetProgramiv|) :void
  (|program| gl/uint)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetProgramInfoLog" |glGetProgramInfoLog|) :void
  (|program| gl/uint)
  (|bufSize| gl/sizei)
  (|length| :pointer)
  (|infoLog| :string))

(cffi:defcfun ("glGetRenderbufferParameteriv" |glGetRenderbufferParameteriv|) :void
  (|target| gl/enum)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetShaderiv" |glGetShaderiv|) :void
  (|shader| gl/uint)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetShaderInfoLog" |glGetShaderInfoLog|) :void
  (|shader| gl/uint)
  (|bufSize| gl/sizei)
  (|length| :pointer)
  (|infoLog| :string))

(cffi:defcfun ("glGetShaderPrecisionFormat" |glGetShaderPrecisionFormat|) :void
  (|shadertype| gl/enum)
  (|precisiontype| gl/enum)
  (|range| :pointer)
  (|precision| :pointer))

(cffi:defcfun ("glGetShaderSource" |glGetShaderSource|) :void
  (|shader| gl/uint)
  (|bufSize| gl/sizei)
  (|length| :pointer)
  (|source| :string))

(cffi:defcfun ("glGetString" |glGetString|) :pointer
  (|name| gl/enum))

(cffi:defcfun ("glGetTexParameterfv" |glGetTexParameterfv|) :void
  (|target| gl/enum)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetTexParameteriv" |glGetTexParameteriv|) :void
  (|target| gl/enum)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetUniformfv" |glGetUniformfv|) :void
  (|program| gl/uint)
  (|location| gl/int)
  (|params| :pointer))

(cffi:defcfun ("glGetUniformiv" |glGetUniformiv|) :void
  (|program| gl/uint)
  (|location| gl/int)
  (|params| :pointer))

(cffi:defcfun ("glGetUniformLocation" |glGetUniformLocation|) gl/int
  (|program| gl/uint)
  (|name| :string))

(cffi:defcfun ("glGetVertexAttribfv" |glGetVertexAttribfv|) :void
  (|index| gl/uint)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetVertexAttribiv" |glGetVertexAttribiv|) :void
  (|index| gl/uint)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glGetVertexAttribPointerv" |glGetVertexAttribPointerv|) :void
  (|index| gl/uint)
  (|pname| gl/enum)
  (|pointer| :pointer))

(cffi:defcfun ("glHint" |glHint|) :void
  (|target| gl/enum)
  (|mode| gl/enum))

(cffi:defcfun ("glIsBuffer" |glIsBuffer|) gl/boolean
  (|buffer| gl/uint))

(cffi:defcfun ("glIsEnabled" |glIsEnabled|) gl/boolean
  (|cap| gl/enum))

(cffi:defcfun ("glIsFramebuffer" |glIsFramebuffer|) gl/boolean
  (|framebuffer| gl/uint))

(cffi:defcfun ("glIsProgram" |glIsProgram|) gl/boolean
  (|program| gl/uint))

(cffi:defcfun ("glIsRenderbuffer" |glIsRenderbuffer|) gl/boolean
  (|renderbuffer| gl/uint))

(cffi:defcfun ("glIsShader" |glIsShader|) gl/boolean
  (|shader| gl/uint))

(cffi:defcfun ("glIsTexture" |glIsTexture|) gl/boolean
  (|texture| gl/uint))

(cffi:defcfun ("glLineWidth" |glLineWidth|) :void
  (|width| gl/float))

(cffi:defcfun ("glLinkProgram" |glLinkProgram|) :void
  (|program| gl/uint))

(cffi:defcfun ("glPixelStorei" |glPixelStorei|) :void
  (|pname| gl/enum)
  (|param| gl/int))

(cffi:defcfun ("glPolygonOffset" |glPolygonOffset|) :void
  (|factor| gl/float)
  (|units| gl/float))

(cffi:defcfun ("glReadPixels" |glReadPixels|) :void
  (|x| gl/int)
  (|y| gl/int)
  (|width| gl/sizei)
  (|height| gl/sizei)
  (|format| gl/enum)
  (|type| gl/enum)
  (|pixels| :pointer))

(cffi:defcfun ("glReleaseShaderCompiler" |glReleaseShaderCompiler|) :void)

(cffi:defcfun ("glRenderbufferStorage" |glRenderbufferStorage|) :void
  (|target| gl/enum)
  (|internalformat| gl/enum)
  (|width| gl/sizei)
  (|height| gl/sizei))

(cffi:defcfun ("glSampleCoverage" |glSampleCoverage|) :void
  (|value| gl/float)
  (|invert| gl/boolean))

(cffi:defcfun ("glScissor" |glScissor|) :void
  (|x| gl/int)
  (|y| gl/int)
  (|width| gl/sizei)
  (|height| gl/sizei))

(cffi:defcfun ("glShaderBinary" |glShaderBinary|) :void
  (|count| gl/sizei)
  (|shaders| :pointer)
  (|binaryformat| gl/enum)
  (|binary| :pointer)
  (|length| gl/sizei))

(cffi:defcfun ("glShaderSource" |glShaderSource|) :void
  (|shader| gl/uint)
  (|count| gl/sizei)
  (|string| :string)
  (|length| :pointer))

(cffi:defcfun ("glStencilFunc" |glStencilFunc|) :void
  (|func| gl/enum)
  (|ref| gl/int)
  (|mask| gl/uint))

(cffi:defcfun ("glStencilFuncSeparate" |glStencilFuncSeparate|) :void
  (|face| gl/enum)
  (|func| gl/enum)
  (|ref| gl/int)
  (|mask| gl/uint))

(cffi:defcfun ("glStencilMask" |glStencilMask|) :void
  (|mask| gl/uint))

(cffi:defcfun ("glStencilMaskSeparate" |glStencilMaskSeparate|) :void
  (|face| gl/enum)
  (|mask| gl/uint))

(cffi:defcfun ("glStencilOp" |glStencilOp|) :void
  (|fail| gl/enum)
  (|zfail| gl/enum)
  (|zpass| gl/enum))

(cffi:defcfun ("glStencilOpSeparate" |glStencilOpSeparate|) :void
  (|face| gl/enum)
  (|sfail| gl/enum)
  (|dpfail| gl/enum)
  (|dppass| gl/enum))

(cffi:defcfun ("glTexImage2D" |glTexImage2D|) :void
  (|target| gl/enum)
  (|level| gl/int)
  (|internalformat| gl/int)
  (|width| gl/sizei)
  (|height| gl/sizei)
  (|border| gl/int)
  (|format| gl/enum)
  (|type| gl/enum)
  (|pixels| :pointer))

(cffi:defcfun ("glTexParameterf" |glTexParameterf|) :void
  (|target| gl/enum)
  (|pname| gl/enum)
  (|param| gl/float))

(cffi:defcfun ("glTexParameterfv" |glTexParameterfv|) :void
  (|target| gl/enum)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glTexParameteri" |glTexParameteri|) :void
  (|target| gl/enum)
  (|pname| gl/enum)
  (|param| gl/int))

(cffi:defcfun ("glTexParameteriv" |glTexParameteriv|) :void
  (|target| gl/enum)
  (|pname| gl/enum)
  (|params| :pointer))

(cffi:defcfun ("glTexSubImage2D" |glTexSubImage2D|) :void
  (|target| gl/enum)
  (|level| gl/int)
  (|xoffset| gl/int)
  (|yoffset| gl/int)
  (|width| gl/sizei)
  (|height| gl/sizei)
  (|format| gl/enum)
  (|type| gl/enum)
  (|pixels| :pointer))

(cffi:defcfun ("glUniform1f" |glUniform1f|) :void
  (|location| gl/int)
  (|v0| gl/float))

(cffi:defcfun ("glUniform1fv" |glUniform1fv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|value| :pointer))

(cffi:defcfun ("glUniform1i" |glUniform1i|) :void
  (|location| gl/int)
  (|v0| gl/int))

(cffi:defcfun ("glUniform1iv" |glUniform1iv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|value| :pointer))

(cffi:defcfun ("glUniform2f" |glUniform2f|) :void
  (|location| gl/int)
  (|v0| gl/float)
  (|v1| gl/float))

(cffi:defcfun ("glUniform2fv" |glUniform2fv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|value| :pointer))

(cffi:defcfun ("glUniform2i" |glUniform2i|) :void
  (|location| gl/int)
  (|v0| gl/int)
  (|v1| gl/int))

(cffi:defcfun ("glUniform2iv" |glUniform2iv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|value| :pointer))

(cffi:defcfun ("glUniform3f" |glUniform3f|) :void
  (|location| gl/int)
  (|v0| gl/float)
  (|v1| gl/float)
  (|v2| gl/float))

(cffi:defcfun ("glUniform3fv" |glUniform3fv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|value| :pointer))

(cffi:defcfun ("glUniform3i" |glUniform3i|) :void
  (|location| gl/int)
  (|v0| gl/int)
  (|v1| gl/int)
  (|v2| gl/int))

(cffi:defcfun ("glUniform3iv" |glUniform3iv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|value| :pointer))

(cffi:defcfun ("glUniform4f" |glUniform4f|) :void
  (|location| gl/int)
  (|v0| gl/float)
  (|v1| gl/float)
  (|v2| gl/float)
  (|v3| gl/float))

(cffi:defcfun ("glUniform4fv" |glUniform4fv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|value| :pointer))

(cffi:defcfun ("glUniform4i" |glUniform4i|) :void
  (|location| gl/int)
  (|v0| gl/int)
  (|v1| gl/int)
  (|v2| gl/int)
  (|v3| gl/int))

(cffi:defcfun ("glUniform4iv" |glUniform4iv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|value| :pointer))

(cffi:defcfun ("glUniformMatrix2fv" |glUniformMatrix2fv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|transpose| gl/boolean)
  (|value| :pointer))

(cffi:defcfun ("glUniformMatrix3fv" |glUniformMatrix3fv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|transpose| gl/boolean)
  (|value| :pointer))

(cffi:defcfun ("glUniformMatrix4fv" |glUniformMatrix4fv|) :void
  (|location| gl/int)
  (|count| gl/sizei)
  (|transpose| gl/boolean)
  (|value| :pointer))

(cffi:defcfun ("glUseProgram" |glUseProgram|) :void
  (|program| gl/uint))

(cffi:defcfun ("glValidateProgram" |glValidateProgram|) :void
  (|program| gl/uint))

(cffi:defcfun ("glVertexAttrib1f" |glVertexAttrib1f|) :void
  (|index| gl/uint)
  (|x| gl/float))

(cffi:defcfun ("glVertexAttrib1fv" |glVertexAttrib1fv|) :void
  (|index| gl/uint)
  (|v| :pointer))

(cffi:defcfun ("glVertexAttrib2f" |glVertexAttrib2f|) :void
  (|index| gl/uint)
  (|x| gl/float)
  (|y| gl/float))

(cffi:defcfun ("glVertexAttrib2fv" |glVertexAttrib2fv|) :void
  (|index| gl/uint)
  (|v| :pointer))

(cffi:defcfun ("glVertexAttrib3f" |glVertexAttrib3f|) :void
  (|index| gl/uint)
  (|x| gl/float)
  (|y| gl/float)
  (|z| gl/float))

(cffi:defcfun ("glVertexAttrib3fv" |glVertexAttrib3fv|) :void
  (|index| gl/uint)
  (|v| :pointer))

(cffi:defcfun ("glVertexAttrib4f" |glVertexAttrib4f|) :void
  (|index| gl/uint)
  (|x| gl/float)
  (|y| gl/float)
  (|z| gl/float)
  (|w| gl/float))

(cffi:defcfun ("glVertexAttrib4fv" |glVertexAttrib4fv|) :void
  (|index| gl/uint)
  (|v| :pointer))

(cffi:defcfun ("glVertexAttribPointer" |glVertexAttribPointer|) :void
  (|index| gl/uint)
  (|size| gl/int)
  (|type| gl/enum)
  (|normalized| gl/boolean)
  (|stride| gl/sizei)
  (|pointer| :pointer))

(cffi:defcfun ("glViewport" |glViewport|) :void
  (|x| gl/int)
  (|y| gl/int)
  (|width| gl/sizei)
  (|height| gl/sizei))

(cffi:define-foreign-library android
  (t "libandroid.so"))

(cffi:use-foreign-library android)

(cffi:defcfun ("AAssetManager_fromJava" |AAssetManager_fromJava|) :pointer
  (env :pointer)
  (asset-manager :pointer))

(cffi:defcfun ("AAssetManager_open" |AAssetManager_open|) :pointer
  (mgr :pointer)
  (filename :string)
  (mode :int))

(cffi:defcfun ("AAsset_getLength" |AAsset_getLength|) :long
  (asset :pointer))

(cffi:defcfun ("AAsset_getBuffer" |AAsset_getBuffer|) :pointer
  (asset :pointer))

(defun asset-manager/get ()
  (with-env (env)
    (let ((am (jni/get-asset-manager env)))
      (|AAssetManager_fromJava| (cffi:mem-ref env :pointer) am))))

(defun asset-manager/open (mgr path)
  (|AAssetManager_open| mgr path 0))

(defun asset/get-length (asset)
  (|AAsset_getLength| asset))

(defun asset/get-buffer (asset)
  (|AAsset_getBuffer| asset))

(defun asset/get-data (asset)
  (let ((length (asset/get-length asset))
	(buffer (asset/get-buffer asset)))
    (loop for i from 0 below length
	  collect (cffi:mem-ref buffer :char i))))

(defparameter *g-vertex-shader*
  "attribute vec4 vPosition;
  void main() {
    gl_Position = vPosition;
  }")

(defparameter *g-fragment-shader*
  "precision mediump float;
  void main() {
    gl_FragColor = vec4(0.0, 1.0, 0.0, 1.0);
  }")

(defun gl/check-error (op)
  (loop for error = (|glGetError|)
	while error
	do (format t "after ~s gl error: %d" op error)))

(defun gl/print-string (name s)
  (let ((str (cffi:foreign-string-to-lisp (|glGetString| s))))
    (format t "~a: ~a~%" name str)))

(defmacro print-log (fmt &rest args)
  (if (zerop (length args))
      `(format t ,(concatenate 'string fmt "~%"))
      `(format t (format nil ,(concatenate 'string fmt "~%") ,@args))))

(defun gl/load-shader (shader-type source)
  (print-log "Loading shader...")
  (let ((shader (|glCreateShader| (list shader-type))))
    (print-log "Shader created: ~d" shader)

    (unless (zerop shader)
      (cffi:with-foreign-pointer (psource (cffi:foreign-type-size :pointer))
	(cffi:with-foreign-string (fsource source)
	  (setf (cffi:mem-ref psource :pointer) fsource)
	  (|glShaderSource| shader 1 psource (cffi:null-pointer))
	  (print-log "Shader sourced")

	  (|glCompileShader| shader)
	  (print-log "Shader compiled")

	  (cffi:with-foreign-pointer (compiledp (cffi:foreign-type-size 'gl/int))
	    (|glGetShaderiv| shader :gl/compile-status compiledp)
	    (print-log "Shader compile status: ~d" (cffi:mem-ref compiledp 'gl/int))

	    (unless (gl/truep (cffi:mem-ref compiledp 'gl/int))
	      (cffi:with-foreign-pointer (info-len (cffi:foreign-type-size 'gl/int))
		(|glGetShaderiv| shader :gl/info-log-length info-len)
		(print-log "Shader compile info len: ~d" (cffi:mem-ref info-len 'gl/int))

		(unless (zerop (cffi:mem-ref info-len 'gl/int))
		  (cffi:with-foreign-pointer-as-string (info (cffi:mem-ref info-len 'gl/int))
		    (|glGetShaderInfoLog|
		     shader (cffi:mem-ref info-len 'gl/int) (cffi:null-pointer) info)
		    (print-log "Could not compile shader ~d:~%~s~%"
			       shader-type
			       (cffi:foreign-string-to-lisp info)))
		  (|glDeleteShader| shader)))))))
      shader)))

(defun gl/create-program (vertex-source fragment-source)
  (let ((vertex-shader (gl/load-shader :gl/vertex-shader *g-vertex-shader*))
	(pixel-shader (gl/load-shader :gl/fragment-shader *g-fragment-shader*)))
    (when (or (zerop vertex-shader) (zerop pixel-shader))
      (return-from gl/create-program 0))

    (let ((program (|glCreateProgram|)))
      (unless (zerop program)
	(|glAttachShader| program vertex-shader)
	(gl/check-error "glAttachShader")
	(|glAttachShader| program pixel-shader)
	(gl/check-error "glAttachShader")
	(|glLinkProgram| program)
	(cffi:with-foreign-pointer (link-status (cffi:foreign-type-size 'gl/int))
	  (|glGetProgramiv| program :gl/link-status link-status)
	  (print-log "Program link status: ~d" (cffi:mem-ref link-status 'gl/int))

	  (unless (gl/truep (cffi:mem-ref link-status 'gl/int))
	    (cffi:with-foreign-pointer (info-len (cffi:foreign-type-size 'gl/int))
	      (|glGetProgramiv| program :gl/info-log-length info-len)
	      (print-log "Program link info len: ~d" (cffi:mem-ref info-len 'gl/int))

	      (unless (zerop (cffi:mem-ref info-len 'gl/int))
		(cffi:with-foreign-pointer-as-string (info (cffi:mem-ref info-len 'gl/int))
		  (|glGetProgramInfoLog| program (cffi:mem-ref info-len 'gl/int) (cffi:null-pointer) info)
		  (print-log "Could not link program:~%~s~%" (cffi:foreign-string-to-lisp info)))
		(|glDeleteProgram| program)
		(return-from gl/create-program 0))))))
      (print-log "Program created:  ~a" program)
      program)))

(defparameter *g-program* nil)
(defparameter *gv-position-handle* nil)

(defun setup-graphics (w h)
  (gl/print-string "Version" :gl/version)
  (gl/print-string "Vendor" :gl/vendor)
  (gl/print-string "Renderer" :gl/renderer)
  (gl/print-string "Extensions" :gl/extensions)

  (print-log "(setup-graphics ~d ~d)" w h)

  (setf *g-program* (gl/create-program *g-vertex-shader*
				       *g-fragment-shader*))
  (setf *gv-position-handle* (|glGetAttribLocation| *g-program* "vPosition"))
  (gl/check-error "glGetAttributeLocation")
  (print-log "(glGetAttributeLocation \"vPosition\") = ~d" gv-position-handle)

  (|glViewport| 0 0 w h)
  (gl/check-error "glViewport"))

(defparameter *donep* nil)
(defparameter *fn* nil)

(defmacro gl/do (&body body)
  `(progn
     (setf *fn* (lambda ()
		  ,@body))
     (setf *donep* nil)))

;; (gl/do (setup-graphics 1080 1794))

(defparameter *grey* 0.0)
(defparameter *g-triangle-vertices* (cffi:foreign-alloc
				     :float :initial-contents
				     '(0.0 0.5 -0.5 -0.5 0.5 -0.5)))

(defun load-texture ()
  (let* ((mrg (asset-manager/get))
	 (asset (asset-manager/open mrg "game/amulet.png"))
	 (buffer (asset/get-buffer asset)))
    (cffi:with-foreign-array (texture-id #(0) '(:array 'gl/int 1))
      (|glGenTextures| 1 texture-id)

    (print-log "mrg: ~a" mrg)
    (print-log "asset: ~a" asset)
    (print-log "length: ~d" (asset/get-length asset))
    #+()(print-log "data: ~a" data)))
  )

(defun jnilib/step ()
  (handler-case
      (progn
	(incf *grey* 0.01)
	(when (> *grey* 1.0)
	  (setf *grey* 0.0))

	(|glClearColor| *grey* *grey* *grey* 1.0)
	(gl/check-error "glClearColor")
	(|glClear| (cffi:foreign-bitfield-value
		    'gl/enum
		    '(:gl/color-buffer-bit
		      :gl/depth-buffer-bit)))
	(gl/check-error "glClear")

	(|glUseProgram| *g-program*)
	(gl/check-error "glUseProgram")

	(|glVertexAttribPointer| *gv-position-handle* 2 :gl/float gl/false 0 *g-triangle-vertices*)
	(gl/check-error "glVertexAttribPointer")
	(|glEnableVertexAttribArray| *gv-position-handle*)
	(gl/check-error "glEnableVertexAttribArray")
	(|glDrawArrays| :gl/triangles 0 3)
	(gl/check-error "glDrawArrays")

	(unless *donep*
	  (setf *donep* t)
	  (when *fn*
	    (funcall *fn*))))
    (error (c)
      (print-log "jnilib/step error: ~a" c))))

(defun jnilib/resize (width height)
  (setup-graphics width height)
  (format t "Resize ~a, ~a" width height))

#+()
(gl/do
  (let* ((mrg (asset-manager/get))
	 (asset (asset-manager/open mrg "game/amulet.png"))
	 (data (asset/get-data asset)))
    (print-log "mrg: ~a" mrg)
    (print-log "asset: ~a" asset)
    (print-log "length: ~d" (asset/get-length asset))
    #+()(print-log "data: ~a" data)))

#+()
(gl/do
  (let ((texture-ids (make-array '(1)
				 :element-type 'integer
				 :initial-element 0)))
    (cffi:with-foreign-array (p #(0) '(:array gl/int 1))
      (|glGenTextures| 1 p)
      (print-log "texture-ids: ~a ~a" texture-ids (cffi:mem-ref p 'gl/int))
      )
    (print-log "texture-ids: ~a" texture-ids)))
