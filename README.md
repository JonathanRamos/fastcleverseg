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

 Table 1: Overall results.
 Method          | HD (Voxels) | AUC (%)   | Precision (%) | Recall (%) | Dice Score  (%)
   :---:         | :---:       | :---: | :---:     | :---:  | :---:     
FastCleverSeg     | 9.70 $\pm$  4.41 | 81.07 $\pm$ 0.21 | 86.11 $\pm$ 0.25 | 87.16 $\pm$ 0.21 | 86.22 $\pm$ 0.24
CleverSeg         | 9.65 $\pm$  4.61 | 80.30 $\pm$ 0.21 | 85.46 $\pm$ 0.25 | 87.92 $\pm$ 0.21 | 86.26 $\pm$ 0.24
FastGrowCut       | 9.96 $\pm$  5.08 | 80.54 $\pm$ 0.21 | 85.90 $\pm$ 0.25 | 86.80 $\pm$ 0.21 | 85.95 $\pm$ 0.24
GrowCut           | 10.38 $\pm$ 5.40 | 77.70 $\pm$ 0.19 | 84.05 $\pm$ 0.24 | 87.64 $\pm$ 0.19 | 85.22 $\pm$ 0.22


### Results With EANIS






### RunTime Comparison

Figure 3: Run-Time comparison considering every segmentation method with and without EANIS. Average values represented by $\otimes$.
![image](https://user-images.githubusercontent.com/3834596/184704772-9acd11c5-8216-4858-83a8-c074f5f511de.png)



