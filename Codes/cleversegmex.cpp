/*******************************************************************
 * BGrowth3D algorithm
 * from "BGrowth" - an efficient approach for the segmentation of 
 * vertebral compression fractures in magnet resonance imaging
 * by Jonathan Ramos and Agma Traina USP
 *
 * coded by: Jonathan Ramos (jonathan@usp.br)
 *
 * usage: [labels, strengths] = bgrowthmex(image, labels)
 *        image must be a double matrix (grayscale)
 *        labels must be a double matrix with values (ex.):
 *         -1 (background), 1 (foreground), or 0 (undefined)
 ******************************************************************/

#include <math.h>
#include <matrix.h>
#include <mex.h>
#include <cstdlib>
#include <cstdint>
#include <vector>

/* Definitions to keep compatibility with earlier versions of ML */
#ifndef MWSIZE_MAX
typedef int mwSize;
typedef int mwIndex;
typedef int mwSignedIndex;


#if (defined(_LP64) || defined(_WIN64)) && !defined(MX_COMPAT_32)
/* Currently 2^48 based on hardware limitations */
# define MWSIZE_MAX    281474976710655UL
# define MWINDEX_MAX   281474976710655UL
# define MWSINDEX_MAX  281474976710655L
# define MWSINDEX_MIN -281474976710655L
#else
# define MWSIZE_MAX    2147483647UL
# define MWINDEX_MAX   2147483647UL
# define MWSINDEX_MAX  2147483647L
# define MWSINDEX_MIN -2147483647L
#endif
#define MWSIZE_MIN    0UL
#define MWINDEX_MIN   0UL
#endif

using namespace std;

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
     /*** Check inputs ***/
    if(nrhs < 2)
        mexErrMsgTxt("Must have 2 input arguments (Image and Labels).");
    if(nlhs > 2)
        mexErrMsgTxt("Too many output arguments.");
    if(mxIsComplex(prhs[0]) || mxGetNumberOfDimensions(prhs[0]) < 2
            || mxGetNumberOfDimensions(prhs[0]) > 3 
            || mxIsSparse(prhs[0]) || !mxIsUint8(prhs[0]))
        mexErrMsgTxt("The image must be 2D or 3D unsigned integer (8 bits) matrix.");
    if(mxIsComplex(prhs[1]) || mxGetNumberOfDimensions(prhs[1]) < 2
            || mxGetNumberOfDimensions(prhs[1]) > 3 
            || !mxIsUint8(prhs[1]))
        mexErrMsgTxt("The LabelMatrix must be 2D or 3D unsigned integer (8 bits) matrix.");
    
      //declare variables
    mxArray *strens_m, *labels_m, *labelsn_m, *I_m, *mxTheta;
    mwSize numdims;
    const mwSize *dims, *dims2;
    uint8_t *labels, *I;
    long i,j,k,m, idxq, idxp, its = 0, m_NeighborIndexOffsets[26], idx = 0;
    float *strens, *strensn, MAX_ITS = 999, maxC = 256, C = 0, *theta, g;
    bool converged;
    
    //gets image dimensions
    numdims = mxGetNumberOfDimensions(prhs[0]);
    dims = mxGetDimensions(prhs[0]);
    dims2 = mxGetDimensions(prhs[1]);
    if(!(dims[0] == dims2[0] && dims[1] == dims2[1] && dims[2] == dims2[2]))
        mexErrMsgTxt("Labels and Image must be the same size.");
    
    int dimx, dimy, dimz, dimxy, dimxyz, colors;
    dimx = (int)dims[0];
    dimy = (int)dims[1];
    dimz = (int)dims[2];
    dimxy = dimx*dimy;
    if (numdims == 2) // not 3D matrix
        dimz = 1;
    
    dimxyz = dimxy*dimz;
    if(dimx < 3 || dimy < 3) // Matrix too smal to apply the neighbours comparison
        mexErrMsgTxt("Matrix size has to be larger than 3x3x1.");
    
    mxTheta = mxDuplicateArray(prhs[2]);
    theta = (float *)  mxGetPr(mxTheta);;
    float t = *theta;
    //mexPrintf("Dimensões: [%d]\n", numdims);
//     mexPrintf("Theta = %f\n", t);
    
//     return

    //sets up pointers
    // CREATE A COPY OF THE IMAGE
    I_m = mxDuplicateArray(prhs[0]);
    // CREATE A COPY OF THE LABELS
    labels_m = plhs[0] = mxDuplicateArray(prhs[1]); 
    // MALLOC SPACE ON MEMORY FOR THE STRENGTHS
    strens_m = mxCreateNumericArray(numdims, dims, mxSINGLE_CLASS, mxREAL); 
    
    I = (uint8_t *) mxGetPr(I_m);
    labels = (uint8_t *) mxGetPr(labels_m);
    strens = (float *) mxGetPr(strens_m);
    


        // Define Neighbours
    idx = 0;
    // K = 0
//     for(i = -1; i <= 1; i++)
//          for(j = -1; j <= 1; j++)
//              if (!(i == 0 && j == 0))
//                  m_NeighborIndexOffsets[idx++] = i + j*(int)dims[0];
    for(k = -1; k <= 1; k++)
            for(i = -1; i <= 1; i++)
                 for(j = -1; j <= 1; j++)
                     if (!(i == 0 && j == 0 && k == 0))
                         m_NeighborIndexOffsets[idx++] = i + j*(int)dims[0] + k*((int)dims[0]*(int)dims[1]);
    
   
    long index;
     // Determine neighborhood size at each vertice and Initilize seeds
     std::vector<unsigned char> m_NBSIZE = std::vector<unsigned char>(dimxyz, 0);
     for(i = 1; i < dimx - 1; i++) {
         for(j = 1; j < dimy - 1; j++) {
             for(k = 1; k < dimz - 1; k++) {
                 index = i + j*dimx + k*dimxy;
                 m_NBSIZE[index] = 26;
                 ((uint8_t)labels[index]) < 1 ? strens[index] = 0.0: strens[index] = 1.0;
//                  if (I[index] > maxC) {
//                     maxC = I[index];
//                  }
                 
             }
         }
    }
    
    
   
    
    //start main loop
    converged = false;
    double diff, s;
    
    while(!converged){
        its++;
        converged = true; //unless we make a change
       
        for(k = 1; k < dimz-1; k++) {
            for(j = 1; j < dimy-1; j++) {
                for(i = 1; i < dimx-1; i++) {
                      
                    idxp = i + j*dimx  + k*dimxy;
//                     idxp < dimxy ? zinit = 9 : zinit = 0; // first slice
//                     idxp > (dimxyz-dimxy) ? zend = 17 : zend = 26; // last slice
                    if(labels[idxp] != 0) {
                        //for every neighbor q
                        for(m = 0; m <  m_NBSIZE[idxp]; m++) {
                            idxq = idxp + m_NeighborIndexOffsets[m];

                            C = fabs(I[idxp] - I[idxq]);
                            g = (maxC-C)/maxC;
//                             g = ; //attack force
                            s = g*strens[idxp];

                            if((s-strens[idxq]) > t) //attack succeeds
                            {
                                strens[idxq] = (s + strens[idxq])/2;
    //                                 strens[idxq] = theta;
                                labels[idxq] = labels[idxp];
                                converged = false; // keep iterating
                            }
                        }
                    }
                }
            }
        } 
          
        //lets not go crazy...
//         if(its == MAX_ITS)
//            break;
    }
    
    // Condition final result
//    for(i = 0; i < dimxyz; i++) 
//       labels[i] == 1 ? labels[i] = 1: labels[i] = 0;

//     mexPrintf("CS Iterations [ %d ]",its);
    mxDestroyArray(I_m);
    mxDestroyArray(strens_m);
    
    //mexPrintf("Funcionou! Cheirinho de sucesso! \n");
}
