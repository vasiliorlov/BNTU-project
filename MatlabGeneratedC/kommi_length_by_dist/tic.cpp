//
// File: tic.cpp
//
// MATLAB Coder version            : 4.3
// C/C++ source code generated on  : 09-Mar-2021 18:51:36
//

// Include Files
#include "tic.h"
#include "kommi_length_by_dist.h"
#include "rt_nonfinite.h"
#include "timeKeeper.h"

// Function Definitions

//
// Arguments    : void
// Return Type  : void
//
void tic()
{
  struct timespec b_timespec;
  clock_gettime(CLOCK_MONOTONIC, &b_timespec);
  timeKeeper();
}

//
// File trailer for tic.cpp
//
// [EOF]
//
