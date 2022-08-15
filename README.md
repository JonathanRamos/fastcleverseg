# FastCleverSeg
Since the manual segmentation is time-consuming and impractical to perform for a large number of exams, semi-automatic segmentation tools minimize the labor-intensiveness by using minimal user input. We propose FastCleverSeg, in which the experimental evaluation with several MRI databases from distinct hospitals showed that our approach can considerably speed up the manual annotation process with a Dice Score of 94\% and the fastest processing time ($25 \pm 30$ ms).
Therefore, our approaches can aid physicians in producing reliable ground-truths in a fast manner, speeding up the laborious task of manually segmenting regions of interest.

## Overview
**If you use any part of this repository, please cite:**

```
Ramos, et al. Fast and accurate spine MRI segmentation using FastCleverSeg. Journal here, 2022.
```


- [Algorithms and codes](Codes/OldMatlab)
- [Image Datasets](ImageDatasets)
- [Results](Results)



## Results


### Overall

 Table: Overall results without EANIS.
 Method          | HD (Voxels) | AUC   | Precision | Recall | Dice Score | Run Time
   :---:         | :---:       | :---: | :---:     | :---:  | :---:      | :---:
FastCleverSeg     | 3.63  $\pm$  2.32  | 79.61  $\pm$  0.16  | 88.67  $\pm$  0.21  | 81.70 $\pm$   0.17  | 84.41  $\pm$  0.19  | 16.40  $\pm$  0.29 |
FastGrowCut       | 3.76  $\pm$  2.48  | 77.00 $\pm$   0.15  | 86.49  $\pm$  0.20  | 84.26  $\pm$  0.15  | 84.58  $\pm$  0.18  | 22.35  $\pm$  0.34 |
CleverSeg         | 2.47  $\pm$  1.65  | 77.82  $\pm$  0.15  | 85.04  $\pm$  0.19  | 92.65  $\pm$  0.13  | 88.16  $\pm$  0.18  | 90.47  $\pm$  1.89 |
GrowCut           | 2.47  $\pm$  1.65  | 77.82  $\pm$  0.15  | 85.04  $\pm$  0.19  | 92.65  $\pm$  0.13  | 88.16  $\pm$  0.18  | 90.47  $\pm$  1.89 |


  

  


 Table: Overall results with EANIS.
 Method          | HD (Voxels) | AUC   | Precision | Recall | Dice Score | Run Time
   :---:         | :---:       | :---: | :---:     | :---:  | :---:      | :---:
FastCleverSeg    |  1.58  $\pm$  1.13 |  85.86  $\pm$  0.19 |  90.46  $\pm$  0.22 |  88.51  $\pm$  0.19 |  89.26  $\pm$  0.21 |   9.09  $\pm$  0.15 |
FastGrowCut      |  1.69  $\pm$  1.21 |  84.69  $\pm$  0.18 |  89.56  $\pm$  0.21 |  89.13 $\pm$   0.18 |  89.10  $\pm$  0.20 |  19.53 $\pm$   0.30 |
CleverSeg        |  1.50  $\pm$  1.25 |  85.69  $\pm$  0.19 |  89.82  $\pm$  0.21 |  90.33  $\pm$  0.19 |  89.85  $\pm$  0.21 |  33.96  $\pm$  0.65 |
GrowCut          |  1.88  $\pm$  1.40 |  83.89  $\pm$  0.18 |  89.13  $\pm$  0.21 |  88.27 $\pm$   0.18 |  88.42 $\pm$   0.20 |  57.99 $\pm$   1.20 |





 
 
 


### Paravertebral Muscles

### Intervertebral Discs

### Vertebral Bodies 1

### Vertebral Bodies 2

### Vertebral Bodies 3

### Vertebral Bodies 1-3



