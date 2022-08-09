/*******************************************************************
 * GrowCut algorithm
 * from "GrowCut" - Interactive Multi-Label N-D Image Segmentation
 *      By Cellular Autonoma
 * by Vladimir Vezhnevets and Vadim Konouchine
 *
 * coded by: Shawn Lankton (www.shawnlankton.com)
 *
 * usage: [labels, strengths] = growcutmex(image, labels)
 *        image must be a double matrix (RGB or grayscale)
 *        labels must be a double matrix with values:
 *         -1 (background), 1 (foreground), or 0 (undefined)
 *
 *        resulting labels will be either 0 (bg) or 1 (fg)
 *        resulting strengths will be between 0 and 1
 ******************************************************************/

#include <math.h>
#include <matrix.h>
#include <mex.h>
#include <cstdlib>
#include <cstdint>
#include <limits>
#include <vector>
#include "FibHeap.h"

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

//----------------------------------------------------------------------------
typedef float DistancePixelType;  // type for cost function
const int DistancePixelTypeID = 10;//VTK_FLOAT;

typedef unsigned char MaskPixelType;
const int MaskPixelTypeID = 5;//VTK_UNSIGNED_CHAR;

const DistancePixelType DIST_INF = std::numeric_limits<DistancePixelType>::max();
const DistancePixelType DIST_EPSILON = (DistancePixelType)1e-3;

typedef unsigned char LabelPixelType;
typedef unsigned char IntensityPixelType;

unsigned char NNGBH = 26;

//----------------------------------------------------------------------------
class HeapNode : public FibHeapNode
{
public:
  HeapNode()
  : FibHeapNode()
  , m_Key(0)
  , m_Index(-1)
  {
  }

  virtual void operator =(FibHeapNode& RHS)
  {
    FHN_Assign(RHS);
    m_Key = ((HeapNode&)RHS).m_Key;
  }

  virtual int operator ==(FibHeapNode& RHS)
  {
    if (FHN_Cmp(RHS))
      {
      return 0;
      }
    return m_Key == ((HeapNode&)RHS).m_Key ? 1 : 0;
  }

  virtual int operator <(FibHeapNode& RHS)
  {
    int x = FHN_Cmp(RHS);
    if (x != 0)
      {
      return x < 0 ? 1 : 0;
      }
    return m_Key < ((HeapNode&)RHS).m_Key ? 1 : 0;
  }

  virtual void operator =(DistancePixelType newKeyVal)
  {
    HeapNode tmp;
    tmp.m_Key = m_Key = newKeyVal;
    FHN_Assign(tmp);
  }

  inline DistancePixelType GetKeyValue() { return m_Key; }
  inline void SetKeyValue(DistancePixelType keyValue) { m_Key = keyValue; }
  inline long int GetIndexValue() { return m_Index; }
  inline void SetIndexValue(long int indexValue) { m_Index = indexValue; }

protected:
  DistancePixelType m_Key;
  long m_Index;
};


bool verifyInputs(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]);

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
   if (!verifyInputs(nlhs, plhs, nrhs, prhs))
       return;
   // Gets image dimensions
    mwSize numdims; 
    const mwSize *dims, *dims2; 
    //gets image dimensions
    numdims = mxGetNumberOfDimensions(prhs[0]);
    dims = mxGetDimensions(prhs[0]);
    dims2 = mxGetDimensions(prhs[1]);
    long m_DimX; long m_DimY; long m_DimZ; long dimxyz;
    std::vector<long> m_NeighborIndexOffsets;
    std::vector<unsigned char> m_NumberOfNeighbors; // size of neighborhood (everywhere the same except at the image boundary)
    
    int dimx = m_DimX = (int)dims[0];
    int dimy = m_DimY = (int)dims[1];

    if(!(dims[0] == dims2[0] && dims[1] == dims2[1] && dims[2] == dims2[2]))
        mexErrMsgTxt("Labels and Image must be the same size.");
    
    int dimz = m_DimZ = (int)dims[2];
    
    int dimxy = dimx*dimy;
    if (numdims == 2) // Not 3D matrix
        dimz = 1;
    
    dimxyz = dimxy*dimz;
    if(dimx < 3 || dimy < 3) // Matrix too smal to apply the neighbours comparison
        mexErrMsgTxt("Matrix size has to be larger than 3x3x1.");
    
    
    FibHeap *m_Heap;
    HeapNode *m_HeapNodes; 
    m_Heap = new FibHeap;
    long dimXYZ = m_DimX * m_DimY * m_DimZ;
    if ((m_HeapNodes = new HeapNode[dimXYZ + 1]) == NULL) {
        mexErrMsgTxt("Memory allocation failed.");
    }
    
    
    //declare variables
    mxArray *strens_m, *labels_m, *I_m; //labelsn_m
    uint8_t *imSrc, *resultLabelVolumePtr; //, *seedLabelVolumePtr
    DistancePixelType *distanceVolumePtr;
//     double  ;
    long its = 0, idx = 0, index;

   
    
   
    //mexPrintf("Dimension: [%d]\n", numdims);
    //mexPrintf("Matrix Size: [%d, %d, %d]\n", dimx, dimy, dimz);

    //sets up pointers
    // CREATE A COPY OF THE IMAGE
    I_m = mxDuplicateArray(prhs[0]);
    // CREATE A COPY OF THE LABELS
    labels_m = plhs[0] = mxDuplicateArray(prhs[1]); 
    // ANOTHER LABEL COPY
//     labelsn_m  = mxDuplicateArray(prhs[1]); 
    // MALLOC SPACE ON MEMORY FOR THE STRENGTHS
    strens_m = mxCreateNumericArray(numdims, dims, mxSINGLE_CLASS, mxREAL); 
    
    imSrc = (uint8_t *) mxGetPr(I_m);
    resultLabelVolumePtr = (uint8_t *) mxGetPr(labels_m);
//     seedLabelVolumePtr = (uint8_t *) mxGetPr(labelsn_m);
    distanceVolumePtr = (DistancePixelType *) mxGetPr(strens_m);
    
       

     // Compute index offset
    m_NeighborIndexOffsets.clear();
    // Neighbors are traversed in the order of m_NeighborIndexOffsets,
    // therefore one would expect that the offsets should
    // be as continuous as possible (e.g., x coordinate
    // should change most quickly), but that resulted in
    // about 5-6% longer computation time. Therefore,
    // we put indices in order x1y1z1, x1y1z2, x1y1z3, etc.
    for (int ix = -1; ix <= 1; ix++) 
      for (int iy = -1; iy <= 1; iy++) 
        for (int iz = -1; iz <= 1; iz++) 
          if (!(ix == 0 && iy == 0 && iz == 0))
                m_NeighborIndexOffsets.push_back(long(ix) + m_DimX*(long(iy) + m_DimY*long(iz)));
         
        
     
    
    // Determine neighborhood size for computation at each voxel.
    // The neighborhood size is everywhere the same (size of m_NeighborIndexOffsets)
    // except at the edges of the volume, where the neighborhood size is 0.
    m_NumberOfNeighbors.resize(dimXYZ);
    const unsigned char numberOfNeighbors = m_NeighborIndexOffsets.size();
    unsigned char* nbSizePtr = &(m_NumberOfNeighbors[0]);
    for (int z = 0; z < m_DimZ; z++)
      {
      bool zEdge = (z == 0 || z == m_DimZ - 1);
      for (int y = 0; y < m_DimY; y++)
        {
        bool yEdge = (y == 0 || y == m_DimY - 1);
        *(nbSizePtr++) = 0; // x == 0 (there is always padding, so we don'neighborNewDistance need to check if m_DimX>0)
        unsigned char nbSize = (zEdge || yEdge) ? 0 : numberOfNeighbors;
        for (int x = m_DimX-2; x > 0; x--)
          {
          *(nbSizePtr++) = nbSize;
          }
        *(nbSizePtr++) = 0; // x == m_DimX-1 (there is always padding, so we don'neighborNewDistance need to check if m_DimX>1)
        }
      }
    
//      mexPrintf("Total Voxels: %d\n", dimxyz);

    
    
            
            
    // Initilize seeds
    // no mask
    // no mask
      for (long int index = 0; index < dimXYZ; index++)
      {
        LabelPixelType seedValue = resultLabelVolumePtr[index];
//         resultLabelVolumePtr[index] = seedValue;
        if (seedValue == 0) {
          m_HeapNodes[index] = DIST_INF;
          distanceVolumePtr[index] = DIST_INF;
        }
        else {
          m_HeapNodes[index] =  DIST_EPSILON;
          distanceVolumePtr[index] =  DIST_EPSILON;
        }
        m_Heap->Insert(&m_HeapNodes[index]);
        m_HeapNodes[index].SetIndexValue(index);
     }
    
   
    
    // Full computation
    // Normal Dijkstra (to be used in initializing the segmenter for the current image)
     // Insert 0 then extract it, which will balance heap
      HeapNode hnZero;
      m_Heap->Insert(&hnZero);
      m_Heap->ExtractMin();

     HeapNode hnTmp;
     long int it = 0;
//       mexPrintf("Cheguei aqui\n");
     while (!m_Heap->IsEmpty())
     {
          HeapNode* hnMin = (HeapNode *)m_Heap->ExtractMin();
          long index = hnMin->GetIndexValue();
          DistancePixelType currentDistance = hnMin->GetKeyValue();
          LabelPixelType currentLabel = resultLabelVolumePtr[index];
          distanceVolumePtr[index] = currentDistance;

          // Update neighbors
          IntensityPixelType pixCenter = imSrc[index];
          unsigned char nbSize = m_NumberOfNeighbors[index];
          for (unsigned int i = 0; i < nbSize; i++)
          {
             long int indexNgbh = index + m_NeighborIndexOffsets[i];
             DistancePixelType neighborCurrentDistance = distanceVolumePtr[indexNgbh];
             DistancePixelType neighborNewDistance = fabs(pixCenter - imSrc[indexNgbh]) + currentDistance;
             if (neighborCurrentDistance > neighborNewDistance)
             {
                distanceVolumePtr[indexNgbh] = neighborNewDistance;
                resultLabelVolumePtr[indexNgbh] = currentLabel;

                hnTmp = m_HeapNodes[indexNgbh];
                hnTmp.SetKeyValue(neighborNewDistance);
                m_Heap->DecreaseKey(&m_HeapNodes[indexNgbh], hnTmp);
             }
          }
//           it++;
//           mexPrintf("Iteration r%d\n", it++);
   }
     
  

//     mexPrintf("FGC IT: %d\n", it);
   // Update previous labels and distance information
//    for(long int i = 0; i < dimxyz; i++) 
//      resultLabelVolumePtr[i] == 1 ? resultLabelVolumePtr[i] = 1 : resultLabelVolumePtr[i] = 0;
     
   mxDestroyArray(I_m);
   mxDestroyArray(strens_m);
   
   // Release memory
   if (m_Heap != NULL) {
        delete m_Heap;
        m_Heap = NULL;
   }
   //m_HeapNodes.clear();
   if (m_HeapNodes != NULL) {
        delete[] m_HeapNodes;
        m_HeapNodes = NULL;
   }

}



bool verifyInputs(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
    /*** Check inputs ***/
    if(nrhs != 2)
        mexErrMsgTxt("Must have 2 input arguments (Image and Labels).");
    if(nlhs > 2)
        mexErrMsgTxt("Too many output arguments.");
    if(mxIsComplex(prhs[0]) || mxGetNumberOfDimensions(prhs[0]) < 2
            || mxGetNumberOfDimensions(prhs[0]) > 3 
            || mxIsSparse(prhs[0]) || !mxIsUint8(prhs[0]))
        mexErrMsgTxt("The image must be a 2D or 3D full unsigned integer (8 bits) matrix.");
    
    if(mxIsComplex(prhs[1]) || mxGetNumberOfDimensions(prhs[1]) < 2
            || mxGetNumberOfDimensions(prhs[1]) > 3 
            || !mxIsUint8(prhs[1]))
        mexErrMsgTxt("The LabelMatrix must be 2D or 3D unsigned integer (8 bits) matrix.");
    
    const mwSize *dims, *dims2;
    dims = mxGetDimensions(prhs[0]);
    dims2 = mxGetDimensions(prhs[1]);
    
    if(!(dims[0] == dims2[0] && dims[1] == dims2[1] && dims[2] == dims2[2]))
        mexErrMsgTxt("Labels and Image must be the same size.");
    
    if((int)dims[0] < 3 || (int)dims[1] < 3) // Matrix too smal to apply the neighbours comparison
        mexErrMsgTxt("Matrix size has to be larger than 3x3x1.");
    return true;
}
