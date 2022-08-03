

# Vertebral Bodies (VB)

We assembled a dataset of vertebral bodies with a total of 94 MRI exams with corresponding manual segmentation coming from three distincts dataset, described as follows.

## VB1
In the [first dataset](https://doi.org/10.1371/journal.pone.0143327),  there are 26 lumbar MRI exams, in which 22 exams are from pathological patients, and four are from healthy ones:

- Among the 26 exams, 17 are publicly available. The images came from different hospitals and scanning machines and were anonymized. Since this dataset came from seven different hospitals and the exams were taken by nine scanning stations (high voxel\textquotesingle s anisotropy), [Table 1](VB1/readme.md) reports the details of each one of the 17 exams used to compose the dataset.
- The MRI exams vary from the sacrum (S1) to the mid-thoracic (T6-T12) with several health conditions, such as scoliosis, vertebral fracture, and spondylolisthesis. 
- The MRI exams have $3.24 \pm 0.36$ mm of slice thickness and $3.87 \pm 0.36$ mm of spacing between slices. 
- Neurosurgeons and three experienced users under expert supervision made the manual tracing in three to six min per vertebra. The reference segmentations were produced by manually tracing the vertebral body edges in the primary acquisition plane (23 sagittal, two axial, one coronal). Summing up, the authors provided 160 segmented vertebral bodies.

```
Chu C, Belavý DL, Armbrecht G, Bansmann M, Felsenberg D, Zheng G (2015) Fully Automatic Localization and Segmentation of 3D Vertebral Bodies from CT/MR Images via a Learning-Based Method. PLoS ONE 10(11): e0143327. https://doi.org/10.1371/journal.pone.0143327
```

## VB2 
In the [second dataset](https://doi.org/10.1111/cgf.12343), the authors provided 23 annotated T2-weighted turbo spin echo MR of the lower spine:

- The images are from anonymous healthy patients, each with at least seven vertebral bodies of the lower spine (T11-L5). 
- Each patient was scanned with 1.5 Tesla MRI scanner of Siemens (Siemens Healthcare, Erlangen, Germany).
- Each exam presents reference manual segmentation for each vertebral body as binary masks, resulting in 161 labeled vertebral bodies. 
- They did not report any information regarding the total time spent on the manual segmentation.
- Repetition time is 5240 ms and echo time is 101 ms. 
<!-- % https://zenodo.org/record/22304#.XUmCeHVKhv9 -->

```
Zukić, D., Vlasák, A., Egger, J., Hořínek, D., Nimsky, C. and Kolb, A. (2014), Robust Detection and Segmentation for Diagnosis of Vertebral Diseases Using Routine MR Images. Computer Graphics Forum, 33: 190-204. https://doi.org/10.1111/cgf.12343
```

## VB3
In the [third VB dataset](https://doi.org/10.1186/s12891-019-2528-x) (from the same dataset of paravertebral muscles), the authors also made available the lumbar vertebral bodies (L1 to L5) of the 54 healthy volunteers.  

- The acquisition and segmentation of the vertebral bodies are the same as presented in the paravertebral muscle dataset. 
- Note that, the 54 subjects analyzed in this dataset are the same as in the paravertebral muscle dataset. 
- Lumbar muscle groups and lumbar vertebral bodies (L1 to L5) of 54 healthy volunteers were manually segmented in the images. 
- The manual segmentation took 1:40h for vertebral bodies on each subject.

```
Burian, E., Rohrmeier, A., Schlaeger, S. et al. Lumbar muscle and vertebral bodies segmentation of chemical shift encoding-based water-fat MRI: the reference database MyoSegmenTUM spine. BMC Musculoskelet Disord 20, 152 (2019). https://doi.org/10.1186/s12891-019-2528-x
```




