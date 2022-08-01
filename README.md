# fastcleverseg
FastCleverSegMethod

## DataSets

We have used five MRI datasets, with respective manual segmentation (gold standard), and divided them into three categories. First, we consider a public dataset of paravertebral muscles \cite{Burian2019}. Then, we present an intervertebral disc dataset \cite{Rafael2016}, which will be publicly available. Finally, we assembled three datasets of vertebral bodies, which are publicly available \cite{SpineWeb11,Burian2019,Chengwen2015,ChengwenChuEtAl2015Dataset}. Therefore, we used the typical number of MRI scans and datasets for the validation of segmentation methods in our experiments. Table \ref{tab:scanParameters} reports the overall details for the aforementioned datasets.  The ground-truth segmentations were performed or supervised by a radiologist specialist in the field.


To assure the best conditions to all segmentation algorithms, since the majority of the original exams have 65,536 gray levels (16 bits/pixel), we normalized the gray-scale of the exams into 256 intensities (v<sub>i</sub> $\in$ $[1, 256]$, 8 bits/pixel):

![image](https://user-images.githubusercontent.com/3834596/182188895-8d5576dc-563b-4cb0-889e-ad8a0fedeb72.png)

in which $V$ represents the data volume of the exam.
All MRIs were normalized to the isotropic spatial resolution (1 $\times$ 1 $\times$ 1  mm<sup>3<sup>), employing a trilinear interpolation.
In general, semi-automatic segmentation techniques present better results with 8 bits/pixel.
Besides, using 16 bits/pixel may add unnecessary processing time.


### Paravertebral muscles
\label{subsec:muscles}

The reference database MyoSegmentTUM\cite{Burian2019} comprises lumbar muscles and vertebral bodies in chemical shift encoding-based water-fat MRI.
%
In total, there are 54 MRI exams (15 males and 39 females) of healthy, caucasian volunteers, with average age of $51.6 \pm 16.7$ years.
%
Each exam presents reference manual segmentation for four muscles (erector spinae left and right as well as psoas left and right) and five lumbar vertebral bodies (from L1 to L5).


The volunteers underwent MRI on a 3T system (Ingenia, Philips Healthcare, Best, Netherlands) using a whole-body coil, built-in 12-channel posterior coil, and a 16-channel anterior coil. 
%
Subjects were positioned head-first in a supine position.
%
The segmentations were performed by a board-certified radiologist using the image viewer software MITK (Medical Imaging Interaction Toolkit, Heidelberg, Germany).
s

The manual segmentation took 50 min for each paravertebral muscle.
%
The axial proton density fat fraction (PDFF) maps were used to separately segment the erector spine and the psoas muscle on both sides from the cranial part of L2 to the caudal part of L5.
