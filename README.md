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

 Table 1: Overall results (averages values and standar deviation represented by $\pm$ ).
 Method          | HD (Voxels) | AUC (%)   | Precision (%) | Recall (%) | Dice Score  (%) | Run Time (seconds)
   :---:         | :---:       | :---: | :---:     | :---:  | :---:  | :---:    
FastCleverSeg     | 9.7 $\pm$  4.41 | 81.1 $\pm$ 0.21 | 86.1 $\pm$ 0.25 | 87.2 $\pm$ 0.21 | 86.2 $\pm$ 0.24 |  0.035 $\pm$   0.048
CleverSeg         | 9.6 $\pm$  4.61 | 80.3 $\pm$ 0.21 | 85.5 $\pm$ 0.25 | 87.9 $\pm$ 0.21 | 86.3 $\pm$ 0.24 |  0.345 $\pm$   0.569
FastGrowCut       | 9.9 $\pm$  5.08 | 80.5 $\pm$ 0.21 | 85.9 $\pm$ 0.25 | 86.8 $\pm$ 0.21 | 85.9 $\pm$ 0.24 |  0.084 $\pm$   0.139
GrowCut           | 10.4 $\pm$ 5.40 | 77.7 $\pm$ 0.19 | 84.1 $\pm$ 0.24 | 87.6 $\pm$ 0.19 | 85.2 $\pm$ 0.22 |  0.254 $\pm$   0.502


### Results With EANIS



### RunTime Comparison

Figure 3: Run-Time comparison considering every segmentation method with and without EANIS. Average values represented by $\otimes$.
![image](https://user-images.githubusercontent.com/3834596/184704772-9acd11c5-8216-4858-83a8-c074f5f511de.png)



