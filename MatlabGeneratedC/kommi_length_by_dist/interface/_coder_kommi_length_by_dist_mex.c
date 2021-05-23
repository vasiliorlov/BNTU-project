/*
 * File: _coder_kommi_length_by_dist_mex.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 09-Mar-2021 18:51:36
 */

/* Include Files */
#include "_coder_kommi_length_by_dist_mex.h"
#include "_coder_kommi_length_by_dist_api.h"

/* Function Declarations */
MEXFUNCTION_LINKAGE void c_kommi_length_by_dist_mexFunct(int32_T nlhs, mxArray
  *plhs[1], int32_T nrhs, const mxArray *prhs[1]);

/* Function Definitions */

/*
 * Arguments    : int32_T nlhs
 *                mxArray *plhs[1]
 *                int32_T nrhs
 *                const mxArray *prhs[1]
 * Return Type  : void
 */
void c_kommi_length_by_dist_mexFunct(int32_T nlhs, mxArray *plhs[1], int32_T
  nrhs, const mxArray *prhs[1])
{
  const mxArray *outputs[1];
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 1, 4,
                        20, "kommi_length_by_dist");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 20,
                        "kommi_length_by_dist");
  }

  /* Call the function. */
  kommi_length_by_dist_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, plhs, outputs);
}

/*
 * Arguments    : int32_T nlhs
 *                mxArray *plhs[]
 *                int32_T nrhs
 *                const mxArray *prhs[]
 * Return Type  : void
 */
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(kommi_length_by_dist_atexit);

  /* Module initialization. */
  kommi_length_by_dist_initialize();

  /* Dispatch the entry-point. */
  c_kommi_length_by_dist_mexFunct(nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  kommi_length_by_dist_terminate();
}

/*
 * Arguments    : void
 * Return Type  : emlrtCTX
 */
emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/*
 * File trailer for _coder_kommi_length_by_dist_mex.c
 *
 * [EOF]
 */
