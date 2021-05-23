//
// File: kommi_length_by_dist_initialize.cpp
//
// MATLAB Coder version            : 4.3
// C/C++ source code generated on  : 09-Mar-2021 18:51:36
//

// Include Files
#include "kommi_length_by_dist_initialize.h"
#include "eml_rand_mt19937ar_stateful.h"
#include "kommi_length_by_dist.h"
#include "kommi_length_by_dist_data.h"
#include "rt_nonfinite.h"
#include "timeKeeper.h"

// Function Definitions

//
// Arguments    : void
// Return Type  : void
//
void kommi_length_by_dist_initialize()
{
  rt_InitInfAndNaN();
  savedTime_not_empty_init();
  c_eml_rand_mt19937ar_stateful_i();
  isInitialized_kommi_length_by_dist = true;
}

//
// File trailer for kommi_length_by_dist_initialize.cpp
//
// [EOF]
//
