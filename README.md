# FastCleverSeg
Since the manual segmentation is time-consuming and impractical to perform for a large number of exams, semi-automatic segmentation tools minimize the labor-intensiveness by using minimal user input. We propose FastCleverSeg, in which the experimental evaluation with several MRI databases from distinct hospitals showed that our approach can considerably speed up the manual annotation process with a Dice Score of 94\% and the fastest processing time ($25 \pm 30$ ms).
Therefore, our approaches can aid physicians in producing reliable ground-truths in a fast manner, speeding up the laborious task of manually segmenting regions of interest.

**If you use any part of this repository, please cite:**

```
Ramos, et al. Fast and accurate spine MRI segmentation using FastCleverSeg. Journal here, 2022.
```

We made avaiable all our codes, datasets and results as follows:
- [Algorithms and codes](Codes/OldMatlab)
- [Image Datasets](ImageDatasets)
- [Results](Results)



## Results

We present the results first considering all datasets (overall), then grouped by anatomical group (vertebrae, discs, and muscle).

### Overall

 Table 1: Overall results without EANIS.
 Method          | HD (Voxels) | AUC (%)   | Precision (%) | Recall (%) | Dice Score  (%)
   :---:         | :---:       | :---: | :---:     | :---:  | :---:     
FastCleverSeg     | 14.2 $\pm$   6.89 |  84.0  $\pm$  0.05 |  91.4  $\pm$  0.04 |  92.2  $\pm$  0.05 |  91.6  $\pm$   0.03
CleverSeg         | 13.1 $\pm$   6.43 |  84.3 $\pm$   0.05 |  91.1  $\pm$  0.04 |  93.7  $\pm$  0.04 |  92.2  $\pm$  0.02
FastGrowCut       | 17.9 $\pm$  10.08 |  80.1  $\pm$  0.07 |  90.4  $\pm$  0.06 |  86.5  $\pm$  0.08 |  88.0  $\pm$   0.05
GrowCut           | 12.3 $\pm$   5.95 |  81.4 $\pm$   0.05 |  88.7  $\pm$  0.05 |  95.3  $\pm$  0.03 |  91.8  $\pm$  0.02

 Table 2: Overall results with EANIS.
 Method          | HD (Voxels) | AUC (%)  | Precision (%) | Recall (%) | Dice Score  (%)
   :---:         | :---:       | :---: | :---:     | :---:  | :---:      
FastCleverSeg    |   8.2  $\pm$  3.03 |  89.8  $\pm$  0.04 |  94.6  $\pm$  0.03 |  94.2  $\pm$  0.02 |  94.3  $\pm$  0.01
CleverSeg        |   8.1  $\pm$  3.03 |  89.6  $\pm$  0.03 |  94.2  $\pm$  0.03 |  94.8  $\pm$  0.02 |  94.4 $\pm$   0.01
FastGrowCut      |   9.9  $\pm$  5.37 |  88.2  $\pm$  0.04 |  93.7  $\pm$  0.03 |  93.3 $\pm$   0.02 |  93.5  $\pm$  0.02
GrowCut          |   9.1  $\pm$  4.62 |  87.7  $\pm$  0.03 |  93.4  $\pm$  0.03 |  92.7  $\pm$  0.03 |  92.9  $\pm$  0.01





 
 
 


### Paravertebral Muscles

### Intervertebral Discs

### Vertebral Bodies 1

### Vertebral Bodies 2

### Vertebral Bodies 3

### Vertebral Bodies 1-3



