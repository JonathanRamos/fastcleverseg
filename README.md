# FastCleverSeg
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

 Table: Overall results with and without EANIS.
 Method          | \HD (Voxels) | AUC | Precision | Recall | DiceScore 
   :---:         | :---: | :---: | :---: | :---: | :---: 
FastGrowCut      | 3.76 $\pm$ 2.48  |   77.00 $\pm$ 0.15   |  86.49 $\pm$ 0.20   |  84.26 $\pm$ 0.15   |  84.58 $\pm$  0.18
FastCleverSeg    | 1.69 $\pm$ 1.21  |   84.69 $\pm$ 0.18   |  89.56 $\pm$ 0.21   |  89.13 $\pm$ 0.18   |  89.10 $\pm$  0.20
CleverSeg        | 2.59 $\pm$ 1.69  |   80.23 $\pm$ 0.16   |  87.17 $\pm$ 0.20   |  89.24 $\pm$ 0.16   |  87.71 $\pm$ 0.19
BalancedGrowth   | 1.49 $\pm$ 1.21  |   86.03 $\pm$ 0.19   |  90.23 $\pm$ 0.22   |  89.63 $\pm$ 0.19   |  89.72 $\pm$  0.21
GrowCut          | 2.43 $\pm$ 1.66  |   80.43 $\pm$ 0.16   |  86.94 $\pm$ 0.20   |  90.66 $\pm$ 0.15   |  88.28 $\pm$  0.19
                 | Test                                                                                ||||
FastGrowCut      | 1.50 $\pm$ 1.25  |   85.69 $\pm$ 0.19   |  89.82 $\pm$ 0.21   |  90.33 $\pm$ 0.19   |  89.85 $\pm$  0.21
FastCleverSeg    | 3.20 $\pm$ 2.17  |   79.55 $\pm$ 0.16   |  87.35 $\pm$ 0.20   |  86.83 $\pm$ 0.15   |  86.52 $\pm$ 0.18
CleverSeg        | 1.57 $\pm$ 1.21  |   85.04 $\pm$ 0.19   |  89.54 $\pm$ 0.21   |  89.97 $\pm$ 0.18   |  89.52 $\pm$ 0.20
BalancedGrowth   | 2.47 $\pm$ 1.65  |   77.82 $\pm$ 0.15   |  85.04 $\pm$ 0.19   |  92.65 $\pm$ 0.13   |  88.16 $\pm$ 0.18
GrowCut          | 1.88 $\pm$ 1.40  |   83.89 $\pm$ 0.18   |  89.13 $\pm$ 0.21   |  88.27 $\pm$ 0.18   |  88.42 $\pm$  0.20


### Paravertebral Muscles

### Intervertebral Discs

### Vertebral Bodies 1

### Vertebral Bodies 2

### Vertebral Bodies 3

### Vertebral Bodies 1-3



