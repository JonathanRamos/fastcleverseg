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

Results considering each anatomical group available at: [Muscles](PM/readme.md), [Discs](IVD/readme.md), and [Vertebrae](VBs/readme.md).

Here, we present the overall results as follows: 


### Results Without EANIS

Figure 2: Example of annotations. 
![image](https://user-images.githubusercontent.com/3834596/185255452-388fc85d-9fd7-4cba-a47d-665b0b415d0d.png)

 Table 1: Overall average results (standard deviation represented by $\pm$ ).
 Method          | HD (Voxels) | AUC (%)   | Precision (%) | Recall (%) | Dice Score  (%) | Run Time (milliseconds)
   :---:         | :---:       | :---: | :---:     | :---:  | :---:  | :---:    
FastCleverSeg     | 8.16  $\pm$  3.03  |   89.81  $\pm$  0.04  |   94.57 $\pm$   0.03  |   94.22  $\pm$  0.02  |   94.34 $\pm$   0.01  |    0.04  $\pm$  0.07
CleverSeg         | 8.09  $\pm$  3.03  |   89.56  $\pm$  0.03  |   94.18 $\pm$   0.03  |   94.80  $\pm$  0.02  |   94.43 $\pm$   0.01  |    0.32 $\pm$   0.59
FastGrowCut       | 9.90  $\pm$  5.37  |   88.23  $\pm$  0.04  |   93.74 $\pm$   0.03  |   93.35  $\pm$  0.02  |   93.48 $\pm$   0.02  |    0.13 $\pm$   0.18
GrowCut           | 9.11  $\pm$  4.62  |   87.71  $\pm$  0.03  |   93.37 $\pm$   0.03  |   92.69 $\pm$   0.03  |   92.92 $\pm$   0.01  |    0.48 $\pm$   0.93


    
    
    
    


### Results With EANIS



### RunTime Comparison

Figure 3: Run-Time comparison considering every segmentation method with and without EANIS. Average values represented by $\otimes$.
![image](https://user-images.githubusercontent.com/3834596/185266101-82bed07e-3745-40f5-a385-a3c9d2301871.png)



