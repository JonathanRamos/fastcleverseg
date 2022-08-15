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

 Table: Overall results without EANIS.
 Method          | HD (Voxels) | AUC   | Precision | Recall | Dice Score 
   :---:         | :---:       | :---: | :---:     | :---:  | :---:     
FastCleverSeg     | 14.16 $\pm$   6.89 |  84.02  $\pm$  0.05 |  91.44  $\pm$  0.04 |  92.17  $\pm$  0.05 |  91.65  $\pm$   0.03
FastGrowCut       | 17.91 $\pm$  10.08 |  80.12  $\pm$  0.07 |  90.43  $\pm$  0.06 |  86.52  $\pm$  0.08 |  88.04  $\pm$   0.05
CleverSeg         | 13.13 $\pm$   6.43 |  84.26 $\pm$   0.05 |  91.13  $\pm$  0.04 |  93.67  $\pm$  0.04 |  92.25  $\pm$  0.02
GrowCut           | 12.29 $\pm$   5.95 |  81.40 $\pm$   0.05 |  88.76  $\pm$  0.05 |  95.31  $\pm$  0.03 |  91.81  $\pm$  0.02


  

     
  
   


   
   
  
    
    


 Table: Overall results with EANIS.
 Method          | HD (Voxels) | AUC   | Precision | Recall | Dice Score 
   :---:         | :---:       | :---: | :---:     | :---:  | :---:      
FastCleverSeg    |   8.16  $\pm$  3.03 |  89.81  $\pm$  0.04 |  94.57  $\pm$  0.03 |  94.22  $\pm$  0.02 |  94.34  $\pm$  0.01
FastGrowCut      |   9.90  $\pm$  5.37 |  88.23  $\pm$  0.04 |  93.74  $\pm$  0.03 |  93.35 $\pm$   0.02 |  93.48  $\pm$  0.02
CleverSeg        |   8.09  $\pm$  3.03 |  89.56  $\pm$  0.03 |  94.18  $\pm$  0.03 |  94.80  $\pm$  0.02 |  94.43 $\pm$   0.01
GrowCut          |   9.11  $\pm$  4.62 |  87.71  $\pm$  0.03 |  93.37  $\pm$  0.03 |  92.69  $\pm$  0.03 |  92.92  $\pm$  0.01





 
 
 


### Paravertebral Muscles

### Intervertebral Discs

### Vertebral Bodies 1

### Vertebral Bodies 2

### Vertebral Bodies 3

### Vertebral Bodies 1-3



