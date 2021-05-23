//
// File: rand.cpp
//
// MATLAB Coder version            : 4.3
// C/C++ source code generated on  : 09-Mar-2021 18:51:36
//

// Include Files
#include "rand.h"
#include "kommi_length_by_dist.h"
#include "kommi_length_by_dist_data.h"
#include "rt_nonfinite.h"

// Function Definitions

//
// Arguments    : double r[144]
// Return Type  : void
//
void b_rand(double r[144])
{
  int k;
  int j;
  unsigned int u[2];
  unsigned int mti;
  double b_r;
  int kk;
  unsigned int y;
  for (k = 0; k < 144; k++) {
    // ========================= COPYRIGHT NOTICE ============================
    //  This is a uniform (0,1) pseudorandom number generator based on:
    //
    //  A C-program for MT19937, with initialization improved 2002/1/26.
    //  Coded by Takuji Nishimura and Makoto Matsumoto.
    //
    //  Copyright (C) 1997 - 2002, Makoto Matsumoto and Takuji Nishimura,
    //  All rights reserved.
    //
    //  Redistribution and use in source and binary forms, with or without
    //  modification, are permitted provided that the following conditions
    //  are met:
    //
    //    1. Redistributions of source code must retain the above copyright
    //       notice, this list of conditions and the following disclaimer.
    //
    //    2. Redistributions in binary form must reproduce the above copyright
    //       notice, this list of conditions and the following disclaimer
    //       in the documentation and/or other materials provided with the
    //       distribution.
    //
    //    3. The names of its contributors may not be used to endorse or
    //       promote products derived from this software without specific
    //       prior written permission.
    //
    //  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    //  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    //  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
    //  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
    //  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    //  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    //  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    //  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    //  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    //  (INCLUDING  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    //  OF THIS  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    //
    // =============================   END   =================================
    do {
      for (j = 0; j < 2; j++) {
        mti = state[624] + 1U;
        if (mti >= 625U) {
          for (kk = 0; kk < 227; kk++) {
            y = (state[kk] & 2147483648U) | (state[kk + 1] & 2147483647U);
            if ((y & 1U) == 0U) {
              y >>= 1U;
            } else {
              y = y >> 1U ^ 2567483615U;
            }

            state[kk] = state[kk + 397] ^ y;
          }

          for (kk = 0; kk < 396; kk++) {
            y = (state[kk + 227] & 2147483648U) | (state[kk + 228] & 2147483647U);
            if ((y & 1U) == 0U) {
              y >>= 1U;
            } else {
              y = y >> 1U ^ 2567483615U;
            }

            state[kk + 227] = state[kk] ^ y;
          }

          y = (state[623] & 2147483648U) | (state[0] & 2147483647U);
          if ((y & 1U) == 0U) {
            y >>= 1U;
          } else {
            y = y >> 1U ^ 2567483615U;
          }

          state[623] = state[396] ^ y;
          mti = 1U;
        }

        y = state[static_cast<int>(mti) - 1];
        state[624] = mti;
        y ^= y >> 11U;
        y ^= y << 7U & 2636928640U;
        y ^= y << 15U & 4022730752U;
        u[j] = y ^ y >> 18U;
      }

      u[0] >>= 5U;
      u[1] >>= 6U;
      b_r = 1.1102230246251565E-16 * (static_cast<double>(u[0]) * 6.7108864E+7 +
        static_cast<double>(u[1]));
    } while (b_r == 0.0);

    r[k] = b_r;
  }
}

//
// File trailer for rand.cpp
//
// [EOF]
//
