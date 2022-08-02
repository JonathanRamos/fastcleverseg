# Image Datasets

<p>We have used five MRI datasets, with respective manual segmentation (gold standard), and divided them into three categories. </p>
  
- First, we consider a public dataset of [paravertebral muscles](https://doi.org/10.1186/s12891-019-2528-x) avaialble at [PM](PM/readme.md). 
- Then, we present an [intervertebral discs dataset](https://doi.org/10.21037/qims.2016.08.01), available at [IVD](IVD/readme.md).
- Finally, we assembled three datasets of vertebral bodies ([1](https://doi.org/10.1111/cgf.12343), [2](https://doi.org/10.1371/journal.pone.0143327), [3](https://doi.org/10.1186/s12891-019-2528-x)), available at [VBs](VBs/readme.md).

<p>Therefore, we used the typical number of MRI scans and datasets for the validation of segmentation methods in our experiments. All ground-truth segmentations were performed or supervised by a radiologist specialist in the field. In Table 1, we report the overall details for the aforementioned datasets.</p>

**<p style='color:red'>If you use any of these datasets please cite its respective authors.</p>**

 Table: Datasets scan parameters (prior to the isotropic normalization).
  Dataset                                | #Exams | Age | #Males | #Females | #ROIs | Range | MRI Seq.      | TR/TE (ms) | Resolution (Voxel)                                   | Resolution (mm<sup>3</sup>)
   :---: | :---: | :---: | :---: | :---: | :---: |  :---: | :---: | :---: | :---: | :---:
 [Paravertebral Muscles](https://doi.org/10.1186/s12891-019-2528-x) | 54 | 51.6 $\pm$ 16.7 |  15 | 39 | 216 | right/left erector spinae and psoas  | T1 TFE             | 6.4/1.1    | 334&times;334&times;67 <br />$\pm$ 135&times;135&times;5.0 | 1.0&times;1.0&times;3.6 <br />$\pm$ 0&times;0&times;5 
 [Intervertebral Discs](https://doi.org/10.21037/qims.2016.08.01)  | 54 | 27.1 $\pm$ 4.8 | 24 | 31 | 270 | L5S1 - L1L2  | T2 SE              | 3,900/160  | 512&times;512&times;16 <br />$\pm$ 0&times;0&times;0       | 0.4&times;0.4&times;4.4 <br />$\pm$ 0&times;0&times;0 
[Vertebral Bodies 1](https://doi.org/10.1371/journal.pone.0143327)     | 17 | 40.2 $\pm$ 22.4 | 6 | 11 | 160 | T11-L5 | T2 TSE             | --/--      | 305&times;305&times;39 <br />$\pm$ 0&times;0&times;0     | 1.2&times;1.2&times;2.0 <br />$\pm$ 0&times;0&times;0 
[Vertebral Bodies 2](https://doi.org/10.1111/cgf.12343)       | 23 |  | | | 234 | T6-T12 | T1 F/TSE, T2 T/SE |  --/--     | 542&times;542&times;18 <br />$\pm$ 106&times;106&times;5   | 0.7&times;0.7&times;3.8 <br />$\pm$ 0.2&times;0.2&times;0.3 
[Vertebral Bodies 3](https://doi.org/10.1186/s12891-019-2528-x)       | 54 | 51.6 $\pm$ 16.7 | 15 | 39| | L1-L5 | T1 FFE             | 11/1.4     | 222&times;222&times;23 <br />$\pm$ 7&times;7&times;12    | 1.0&times;1.0&times;3.9 <br />$\pm$ 0&times;0&times;0.2

  
TE: Echo Time, TR: Repetition Time, SE: Spin-echo, TSE: Turbo Spin-echo, $\pm$: Standard Deviation. --: Information not reported in the paper neither present on the files's metadata.

## Isotropic Normalization

To assure the best conditions to all segmentation algorithms, since the majority of the original exams have 65,536 gray levels (16 bits/pixel), we normalized the gray-scale of the exams into 256 intensities (v<sub>i</sub> $\in$ $[1, 256]$, 8 bits/pixel):

![image](https://user-images.githubusercontent.com/3834596/182188895-8d5576dc-563b-4cb0-889e-ad8a0fedeb72.png)

in which $V$ represents the data volume of the exam.
All MRIs were normalized to the isotropic spatial resolution (1&times;1&times;1mm<sup>3</sup>), employing a trilinear interpolation.
In general, semi-automatic segmentation techniques present better results with 8 bits/pixel.
Besides, using 16 bits/pixel may add unnecessary processing time.

