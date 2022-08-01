# Intervertebral discs

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
