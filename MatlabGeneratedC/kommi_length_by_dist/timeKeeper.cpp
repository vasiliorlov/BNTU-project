//
// File: timeKeeper.cpp
//
// MATLAB Coder version            : 4.3
// C/C++ source code generated on  : 09-Mar-2021 18:51:36
//

// Include Files
#include "timeKeeper.h"
#include "kommi_length_by_dist.h"
#include "rt_nonfinite.h"

// Variable Definitions
static boolean_T savedTime_not_empty;

// Function Definitions

//
// Arguments    : void
// Return Type  : void
//
void savedTime_not_empty_init()
{
  savedTime_not_empty = false;
}

//
// Arguments    : void
// Return Type  : void
//
void timeKeeper()
{
  struct timespec b_timespec;
  if (!savedTime_not_empty) {
    clock_gettime(CLOCK_MONOTONIC, &b_timespec);
    savedTime_not_empty = true;
  }
}

//
// File trailer for timeKeeper.cpp
//
// [EOF]
//
