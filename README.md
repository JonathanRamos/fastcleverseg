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
![image](https://user-images.githubusercontent.com/3834596/185267331-a82065f1-4d17-4549-8d09-4431d59949ad.png)

Figure 3: Overall results comparison
![image](https://user-images.githubusercontent.com/3834596/185266101-82bed07e-3745-40f5-a385-a3c9d2301871.png)


Figure 4: Segmentation Results Comparison.
![image](https://user-images.githubusercontent.com/3834596/185318153-70e867fb-b690-405c-9a15-48c32c5831c0.png)



