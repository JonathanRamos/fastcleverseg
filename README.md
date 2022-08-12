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

 Table: Overall results without EANIS.
 Method          |\ HD (Voxels) | AUC | Precision | Recall | DiceScore 
   :---:         | :---: | :---: | :---: | :---: | :---: 
FastCleverSeg       |  2.3000  $\pm$  0.7400  | 85.8300  $\pm$  0.0500  | 91.5600  $\pm$  0.0500  | 92.5000 $\pm$   0.0500  | 91.9400 $\pm$   0.0500  |  4.4900  $\pm$  0.0200
FastGrowCut       |  1.0600  $\pm$  0.3600 |  91.6800  $\pm$  0.0500  | 95.0200  $\pm$  0.0600 |  94.9600  $\pm$  0.0400 |  94.9500 $\pm$   0.0500 |   3.3300  $\pm$  0.0100
CleverSeg          |  3.7200  $\pm$  0.9900 |  83.3100 $\pm$   0.0500  | 92.2700  $\pm$  0.0600 |  84.2700  $\pm$  0.0700  | 87.8800 $\pm$   0.0500 |  13.8300 $\pm$   0.0600
BalancedGrowth    |  1.3100  $\pm$  0.3300 |  90.3100  $\pm$ 0.0500 |  94.4000 $\pm$   0.0600 |  93.8000  $\pm$  0.0400 |  94.0600  $\pm$  0.0500  | 11.9900  $\pm$  0.0400
GrowCut           | 3.7300  $\pm$  0.9900  | 83.2000  $\pm$  0.0500 |  92.2000 $\pm$   0.0600  | 84.2200  $\pm$  0.0700 |  87.8200  $\pm$  0.0500 | 299.5200  $\pm$  1.8700


 Table: Overall results with EANIS.
 Method          |\ HD (Voxels) | AUC | Precision | Recall | DiceScore 
   :---:         | :---: | :---: | :---: | :---: | :---: 
FastCleverSeg    | 3.20 $\pm$ 2.17  |   79.55 $\pm$ 0.16   |  87.35 $\pm$ 0.20   |  86.83 $\pm$ 0.15   |  86.52 $\pm$ 0.18
FastGrowCut      | 1.50 $\pm$ 1.25  |   85.69 $\pm$ 0.19   |  89.82 $\pm$ 0.21   |  90.33 $\pm$ 0.19   |  89.85 $\pm$  0.21
CleverSeg        | 1.57 $\pm$ 1.21  |   85.04 $\pm$ 0.19   |  89.54 $\pm$ 0.21   |  89.97 $\pm$ 0.18   |  89.52 $\pm$ 0.20
BalancedGrowth   | 2.47 $\pm$ 1.65  |   77.82 $\pm$ 0.15   |  85.04 $\pm$ 0.19   |  92.65 $\pm$ 0.13   |  88.16 $\pm$ 0.18
GrowCut          | 1.88 $\pm$ 1.40  |   83.89 $\pm$ 0.18   |  89.13 $\pm$ 0.21   |  88.27 $\pm$ 0.18   |  88.42 $\pm$  0.20

    1.3000    0.3300   90.2700    0.0500   94.3800    0.0600   93.7900    0.0400   94.0400    0.0500  441.9000   64.7500
    2.1500    0.7000   85.4000    0.0500   90.8300    0.0500   94.0800    0.0400   92.3400    0.0500   30.2900    0.1200
    1.0800    0.3700   91.0600    0.0500   94.3300    0.0600   95.6800    0.0400   94.9600    0.0500   18.9900    0.0700
    2.1600    0.7900   82.5500    0.0500   88.5100    0.0500   95.2100    0.0300   91.6700    0.0400   33.9700    0.1500
    1.3000    0.3400   89.2200    0.0400   93.1600    0.0500   94.8500    0.0400   93.9500    0.0500   24.1700    0.1000


### Paravertebral Muscles

### Intervertebral Discs

### Vertebral Bodies 1

### Vertebral Bodies 2

### Vertebral Bodies 3

### Vertebral Bodies 1-3



