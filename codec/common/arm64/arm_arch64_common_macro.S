/*!
 * \copy
 *     Copyright (c)  2013, Cisco Systems
 *     All rights reserved.
 *
 *     Redistribution and use in source and binary forms, with or without
 *     modification, are permitted provided that the following conditions
 *     are met:
 *
 *        * Redistributions of source code must retain the above copyright
 *          notice, this list of conditions and the following disclaimer.
 *
 *        * Redistributions in binary form must reproduce the above copyright
 *          notice, this list of conditions and the following disclaimer in
 *          the documentation and/or other materials provided with the
 *          distribution.
 *
 *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *     "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *     LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *     FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *     COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *     INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *     BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *     CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *     LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *     ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *     POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include "arm_aarch64_common.h"

#ifdef __APPLE__

.text

.macro WELS_ASM_AARCH64_FUNC_BEGIN
.align 2
.globl _$0
_$0:
.endm

.macro WELS_ASM_AARCH64_FUNC_END
ret
.endm
#else

#ifdef __ELF__
.section .note.GNU-stack,"",%progbits // Mark stack as non-executable
#endif
.text

.macro WELS_ASM_AARCH64_FUNC_BEGIN funcName
.align 2
.global \funcName
#ifdef __ELF__
.type \funcName, %function
#endif
#ifndef __clang__
.func \funcName
#endif
\funcName:
    BTI_C
.endm

.macro WELS_ASM_AARCH64_FUNC_END
ret
#ifndef __clang__
.endfunc
#endif
.endm

#endif

.macro SIGN_EXTENSION arg0, arg1
  sxtw \arg0, \arg1
.endm
