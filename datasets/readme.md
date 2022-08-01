# Image Datasets

<p>We have used five MRI datasets, with respective manual segmentation (gold standard), and divided them into three categories. </p>
  
- First, we consider a public dataset of paravertebral muscles \cite{Burian2019}. 
- Then, we present an intervertebral disc dataset \cite{Rafael2016}, available at [a relative link](other_file.md).
- Finally, we assembled three datasets of vertebral bodies, which are publicly available \cite{SpineWeb11,Burian2019,Chengwen2015,ChengwenChuEtAl2015Dataset}.

<p>Therefore, we used the typical number of MRI scans and datasets for the validation of segmentation methods in our experiments. </p>
  <p>Table \ref{tab:scanParameters} reports the overall details for the aforementioned datasets.  The ground-truth segmentations were performed or supervised by a radiologist specialist in the field.</p>
  
 
  Dataset                                | Number of exams | Average Age | Number of Males | Number of Females | Number of Volumetric ROIs | MRI Sequences      | TR/TE (ms) | Resolution (Voxel)                                   | Resolution (mm<sup>3</sup>)
   :---: | :---: | :---: | :---: | :---: |  :---: | :---: | :---: | :---: | :---:
 [Paravertebral Muscles](https://doi.org/10.1186/s12891-019-2528-x) | 54 | 51.6 $\pm$ 16.7 |  15 | 39 | |T1 TFE             | 6.4/1.1    | 334&times;334&times;67 <br />$\pm$ 135&times;135&times;5.0 | 1.0&times;1.0&times;3.6 <br />$\pm$ 0&times;0&times;5 
 [Intervertebral Discs](https://doi.org/10.21037/qims.2016.08.01)  | 54 | 27.1 $\pm$ 4.8 | | | | T2 SE              | 3,900/160  | 512&times;512&times;16 <br />$\pm$ 0&times;0&times;0       | 0.4&times;0.4&times;4.4 <br />$\pm$ 0&times;0&times;0 
 [Vertebra Bodies](https://doi.org/10.1111/cgf.12343)       |  |  | | | | T1 F/TSE, T2 T/SE |  --/--     | 542&times;542&times;18 <br />$\pm$ 106&times;106&times;5   | 0.7&times;0.7&times;3.8 <br />$\pm$ 0.2&times;0.2&times;0.3 
[Vertebral Bodies](https://doi.org/10.1186/s12891-019-2528-x)       | 54 | 51.6 $\pm$ 16.7 | 15 | 39| |T1 FFE             | 11/1.4     | 222&times;222&times;23 <br />$\pm$ 7&times;7&times;12    | 1.0&times;1.0&times;3.9 <br />$\pm$ 0&times;0&times;0.2
[Vertebral Bodies](https://doi.org/10.1371/journal.pone.0143327)     | |  |  | | |T2 TSE             | --/--      | 305&times;305&times;39 <br />$\pm$ 0&times;0&times;0     | 1.2&times;1.2&times;2.0 <br />$\pm$ 0&times;0&times;0 
  
<!--   \begin{table}[!t]
\centering
  \caption{\bf Datasets scan parameters (prior to the normalization).}
    \end{tabular}
    \begin{flushleft} TE: Echo Time, TR: Repetition Time, SE: Spin-echo, TSE: Turbo Spin-echo, $\pm$: Standard Deviation. --: Information not reported in the paper neither present on the files\textquotesingle s metadata.
\end{table} -->


To assure the best conditions to all segmentation algorithms, since the majority of the original exams have 65,536 gray levels (16 bits/pixel), we normalized the gray-scale of the exams into 256 intensities (v<sub>i</sub> $\in$ $[1, 256]$, 8 bits/pixel):

![image](https://user-images.githubusercontent.com/3834596/182188895-8d5576dc-563b-4cb0-889e-ad8a0fedeb72.png)

in which $V$ represents the data volume of the exam.
All MRIs were normalized to the isotropic spatial resolution (1 $\times$ 1 $\times$ 1  mm<sup>3</sup>), employing a trilinear interpolation.
In general, semi-automatic segmentation techniques present better results with 8 bits/pixel.
Besides, using 16 bits/pixel may add unnecessary processing time.


## Paravertebral muscles

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


## Intervertebral discs

The dataset \cite{Rafael2016} consists of 54 MRI exams of adult volunteers with an average age of $27.1 \pm 4.8$ years.
%
Lumbar spine MRI was performed using a 1.5T scanner (Achieva; Philips Healthcare, Best, Netherlands) with a 16-channel spinal coil (SENSE-SPINE; Philips). 
%
The volunteers were positioned in a supine position with the lower limbs extended and relaxed.
%
The study protocol included a 2D fast spin-echo sequence with the following characteristics: orientation sagittal, FOV $22\times22$ cm, thickness  $4$mm, number of sections 16, the matrix  $256\times256$ and no intersection gap.

The anthropometric measurements of the subjects were as follows: height: $1.69\pm0.09$ m ($1.46-1.90$ m), weight: $68.36\pm14.49$ kg ($44-122$ kg), and body mass index (BMI): $23.4\pm3.6$ kg/m$^2$ ($15.9-39.0$ kg/m$^2$).
%
The authors in \cite{Rafael2016} considered in the study only subjects that were between 20 and 40 years old, and used an Oswestry Disability Index (ODI) score of less than 10, and were classified as sedentary or irregularly active according to the International Physical Activity Questionnaire (IPAQ). 
%
They did not considered in the analysis individuals who reported persistent low back pain longer than three months, or who had spine or hip diseases or previous hip or spine surgery.

To manually segment the intervertebral discs from the exams, they used the MINC tools and Display software (McConnell Brain Imaging Center, Montreal, Quebec, Canada). 
%
The authors in \cite{Rafael2016} considered five lumbar IVDs for manually segmenting and considered full extent, i.e., encompassing the complete nucleus pulposus and annulus fibrosus, taking into account all sagittal slices and avoiding segmenting the subchondral bone and vertebral endplate.
%
The authors did not report how long it took to segment the intervertebral discs manually.
%
The Ethics Research Committee of the Ribeir\~ao Preto Medical School - USP, where the dataset was acquired, approved the study. 
%  
This dataset is anonymized and available at \url{https://github.com/JonathanRamos/fastcleverseg}.
%



## Vertebral Bodies

We assembled a dataset of vertebral bodies with a total of 94 MRI exams with corresponding manual segmentation.
%
We compose a dataset with a more significant number of exams as follows.


% \begin{enumerate}
    % \item 
    In the first dataset \cite{SpineWeb11},  there are 26 lumbar MRI exams, in which 22 exams are from pathological patients, and four are from healthy ones.
%
Among the 26 exams, 17 are publicly available.
%, summing up a total of 303 image slices.
The images came from different hospitals and scanning machines and were anonymized.
%
The MRI exams vary from the sacrum (S1) to the mid-thoracic (T6-T12) with several health conditions, such as scoliosis, vertebral fracture, and spondylolisthesis.


The MRI exams have $3.24 \pm 0.36$ mm of slice thickness and $3.87 \pm 0.36$ mm of spacing between slices.
%
The reference segmentations were produced by manually tracing the vertebral body edges in the primary acquisition plane (23 sagittal, two axial, one coronal).
%
Neurosurgeons and three experienced users under expert supervision made the manual tracing in three to six min per vertebra.
%
Both the training and testing sets have varied MRI sequences, anisotropy factors, and at least one of the three identifiable pathologies.
%
The considered pathologies are scoliosis, vertebra fracture, and spondylolisthesis.
%
Summing up, the authors provided 160 segmented vertebral bodies.
%
Since this dataset came from seven different hospitals and the exams were taken by nine scanning stations (high voxel\textquotesingle s anisotropy), \autoref{tb:dataSetsDzenan} reports the details of each one of the 17 exams used to compose the dataset.

\begin{table}
\caption{\bf Details of the exams used to compose the MRI dataset in \cite{SpineWeb11}.}
\label{tb:dataSetsDzenan}
\centering	
% \setlength{\tabcolsep}{2.5pt} % Default value: 6pt
% \renewcommand{\arraystretch}{1} % Default value: 1
\begin{tabular}{rccccc} 
Exam & Sequence  &  Resolution (voxels)  &  Resolution ($\textrm{mm}^3$)& Pathology & \#VB\\ \thickhline
DzZ\_T1 & TI TSE   & $512\times512\times12$  & $0.68\times0.68\times4.4$  	& None	      & 9\\
DzZ\_T2 & T2 TSE   & $640\times640\times12$  & $0.55\times0.55\times4.4$ 	& None	      & 9\\ 
AKa2    & T2 frFSE & $512\times512\times15$  & $0.70\times0.70\times4.0$    & +           & 9\\ 
AKa3*   & T1 FSE   & $512\times512\times15$  & $0.70\times0.70\times4.0$    & +           & 9 \\ 
AKa4    & TIRM     & $512\times512\times15$  & $0.70\times0.70\times4.0$    & +           & 9 \\ 
AKs5*   & T2 frFSE &  $512\times512\times15$ & $0.70\times0.70\times4.0$    & +           & 9\\ 
AKs6    & T1 FSE   &  $512\times512\times15$ & $0.70\times0.70\times4.0$    & +           & 9\\ 
AKs7*   & TIRM     &  $512\times512\times15$ & $0.70\times0.70\times4.0$    & +           & 9\\ 
AKs8*   & T1 FSE   &  $512\times512\times15$ & $0.70\times0.70\times4.0$    & +           & 9\\ 
S01*    & T2 SE    &  $640\times640\times15$ & $0.47\times0.47\times3.8$   & SL          & 7\\  
S02*    & T2 SE    &  $640\times640\times15$ & $0.47\times0.47\times3.8$   & SL          & 8\\   
F02*    & T2 SE    &  $768\times768\times18$ & $0.50\times0.50\times3.8$   & VF,SL       & 9\\  
St1*    & T2 SE    &  $704\times704\times20$ & $0.50\times0.50\times3.8$   & St          & 8\\  
F04     & T2 TSE   &  $448\times448\times23$ & $1.12\times1.12\times3.0$   & VF+         & 17\\  
AKs3    & T2 frFSE &  $512\times512\times25$ & $0.70\times0.70\times4.0$    & +           & 10\\ 
F03     & T2 TSE   &  $320\times320\times25$ & $1.19\times1.19\times3.3$    & VF          & 7 \\ 
C002*   & T2 TSE   &  $448\times448\times31$ & $1.12\times1.12\times3.3$    & Sco         & 13\\

\thickhline      
\end{tabular}
    \begin{flushleft} 
    \#VB: Total of segmented vertebral bodies in the exam. Pathologies: scoliosis (Sco), vertebra fracture (VF), spondylolisthesis (SL), and + represents other pathologies not diagnosable from vertebra segmentation.
\end{flushleft}
\end{table}

% ---------------------------------

% \item 
In the second dataset \cite{ChengwenChuEtAl2015Dataset}, the authors provided annotated T2-weighted turbo spin echo MR of the lower spine.
The images are from 23 anonymous healthy patients, each with at least seven vertebral bodies of the lower spine (T11-L5).
%
Each exam presents reference manual segmentation for each vertebral body as binary masks, resulting in 161 labeled vertebral bodies.
%
They did not report any information regarding the total time spent on the manual segmentation.
% https://zenodo.org/record/22304#.XUmCeHVKhv9

% \item 
In the third dataset (from the same dataset of paravertebral muscles \cite{Burian2019}), the authors also made available the lumbar vertebral bodies (L1 to L5) of the 54 healthy volunteers. 
%
The acquisition and segmentation of the vertebral bodies are the same as presented in the paravertebral muscle dataset.
%
Note that, the 54 subjects analyzed in this dataset are the same as in the paravertebral muscle dataset.
%
Lumbar muscle groups and lumbar vertebral bodies (L1 to L5) of 54 healthy volunteers were manually segmented in the images.
% %
The manual segmentation took 1:40h for vertebral bodies on each subject.
