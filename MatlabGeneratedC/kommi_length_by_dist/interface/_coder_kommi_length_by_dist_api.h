/*
 * File: _coder_kommi_length_by_dist_api.h
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 09-Mar-2021 18:51:36
 */

#ifndef _CODER_KOMMI_LENGTH_BY_DIST_API_H
#define _CODER_KOMMI_LENGTH_BY_DIST_API_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"

/* Type Definitions */
#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T

struct emxArray_real_T
{
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_real_T*/

#ifndef typedef_emxArray_real_T
#define typedef_emxArray_real_T

typedef struct emxArray_real_T emxArray_real_T;

#endif                                 /*typedef_emxArray_real_T*/

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void kommi_length_by_dist(real_T d[144], emxArray_real_T *order);
extern void kommi_length_by_dist_api(const mxArray * const prhs[1], int32_T nlhs,
  const mxArray *plhs[1]);
extern void kommi_length_by_dist_atexit(void);
extern void kommi_length_by_dist_initialize(void);
extern void kommi_length_by_dist_terminate(void);
extern void kommi_length_by_dist_xil_shutdown(void);
extern void kommi_length_by_dist_xil_terminate(void);

#endif

/*
 * File trailer for _coder_kommi_length_by_dist_api.h
 *
 * [EOF]
 */
