

# Vertebral Bodies (VB)

We assembled a dataset of vertebral bodies with a total of 94 MRI exams with corresponding manual segmentation coming from three distincts dataset, described as follows.

## VB1
In the [first dataset](https://doi.org/10.1371/journal.pone.0143327),  there are 26 lumbar MRI exams, in which 22 exams are from pathological patients, and four are from healthy ones:

- Among the 26 exams, 17 are publicly available. The images came from different hospitals and scanning machines and were anonymized. 
- The MRI exams vary from the sacrum (S1) to the mid-thoracic (T6-T12) with several health conditions, such as scoliosis, vertebral fracture, and spondylolisthesis. 
- The MRI exams have $3.24 \pm 0.36$ mm of slice thickness and $3.87 \pm 0.36$ mm of spacing between slices. 
- The reference segmentations were produced by manually tracing the vertebral body edges in the primary acquisition plane (23 sagittal, two axial, one coronal).

<p>Neurosurgeons and three experienced users under expert supervision made the manual tracing in three to six min per vertebra. Both the training and testing sets have varied MRI sequences, anisotropy factors, and at least one of the three identifiable pathologies. The considered pathologies are scoliosis, vertebra fracture, and spondylolisthesis. Summing up, the authors provided 160 segmented vertebral bodies. Since this dataset came from seven different hospitals and the exams were taken by nine scanning stations (high voxel\textquotesingle s anisotropy), Table 1 reports the details of each one of the 17 exams used to compose the dataset.</p>

Table 1: <bf>Details of the exams used to compose [the MRI dataset](https://doi.org/10.1371/journal.pone.0143327).</bf> 
Exam | Sequence  |  Resolution (voxels)  |  Resolution (mm<sup>3</sup>) | Pathology | #VB
:--: | :--: | :--: | :--: | :--: | :--: | 
DzZ_T1 | TI TSE   | 512&times;512&times;12   | 0.68&times;0.68&times;4.4  	| None	      | 9
DzZ_T2 | T2 TSE   | 640&times;640&times;12   | 0.55&times;0.55&times;4.4 	| None	      | 9
AKa2    | T2 frFSE | 512&times;512&times;15  | 0.70&times;0.70&times;4.0    | +           | 9 
AKa3*   | T1 FSE   | 512&times;512&times;15  | 0.70&times;0.70&times;4.0    | +           | 9 
AKa4    | TIRM     | 512&times;512&times;15  | 0.70&times;0.70&times;4.0    | +           | 9
AKs5*   | T2 frFSE | 512&times;512&times;15  | 0.70&times;0.70&times;4.0    | +           | 9
AKs6    | T1 FSE   | 512&times;512&times;15  | 0.70&times;0.70&times;4.0    | +           | 9
AKs7*   | TIRM     | 512&times;512&times;15  | 0.70&times;0.70&times;4.0    | +           | 9
AKs8*   | T1 FSE   | 512&times;512&times;15  | 0.70&times;0.70&times;4.0    | +           | 9
S01*    | T2 SE    | 640&times;640&times;15  | 0.47&times;0.47&times;3.8    | SL          | 7 
S02*    | T2 SE    | 640&times;640&times;15  | 0.47&times;0.47&times;3.8    | SL          | 8  
F02*    | T2 SE    | 768&times;768&times;18  | 0.50&times;0.50&times;3.8    | VF,SL       | 9 
St1*    | T2 SE    | 704&times;704&times;20  | 0.50&times;0.50&times;3.8    | St          | 8  
F04     | T2 TSE   | 448&times;448&times;23  | 1.12&times;1.12&times;3.0    | VF+         | 17 
AKs3    | T2 frFSE | 512&times;512&times;25  | 0.70&times;0.70&times;4.0    | +           | 10
F03     | T2 TSE   | 320&times;320&times;25  | 1.19&times;1.19&times;3.3    | VF          | 7 
C002*   | T2 TSE   | 448&times;448&times;31  | 1.12&times;1.12&times;3.3    | Sco         | 13

\#VB: Total of segmented vertebral bodies in the exam. Pathologies: scoliosis (Sco), vertebra fracture (VF), spondylolisthesis (SL), and + represents other pathologies not diagnosable from vertebra segmentation.

## VB2 
In the second dataset \cite{ChengwenChuEtAl2015Dataset}, the authors provided annotated T2-weighted turbo spin echo MR of the lower spine.
The images are from 23 anonymous healthy patients, each with at least seven vertebral bodies of the lower spine (T11-L5).  Each exam presents reference manual segmentation for each vertebral body as binary masks, resulting in 161 labeled vertebral bodies. They did not report any information regarding the total time spent on the manual segmentation.
<!-- % https://zenodo.org/record/22304#.XUmCeHVKhv9 -->

## VB3
In the third dataset (from the same dataset of paravertebral muscles \cite{Burian2019}), the authors also made available the lumbar vertebral bodies (L1 to L5) of the 54 healthy volunteers.  The acquisition and segmentation of the vertebral bodies are the same as presented in the paravertebral muscle dataset. Note that, the 54 subjects analyzed in this dataset are the same as in the paravertebral muscle dataset. Lumbar muscle groups and lumbar vertebral bodies (L1 to L5) of 54 healthy volunteers were manually segmented in the images. The manual segmentation took 1:40h for vertebral bodies on each subject.




