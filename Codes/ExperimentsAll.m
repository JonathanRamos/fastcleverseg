clc
clear all

% Paths to datasets
ImageDatasets = {
    '..\ImageDatasets\PM\Isotropic\Matlab\', ...
    '..\ImageDatasets\IVD\Isotropic\Matlab\', ...
    '..\ImageDatasets\VBs\VB1\Isotropic\Matlab\', ...
    '..\ImageDatasets\VBs\VB2\Isotropic\Matlab\', ...
    '..\ImageDatasets\VBs\VB3\Isotropic\Matlab\'};

SaveDir = '..\Results\ROIbyROI\';

NumberOfMeasures = 20; 

% For each image Dataset
for DatasetIdx=5:length(ImageDatasets)

    % Get exams list in matlab format (.m)
    ExamsList = dir(char(strcat(ImageDatasets(DatasetIdx), '*.mat')));
    
    % Get number of exams to be analyzed
    NumberOfExams = length(ExamsList);
    
    % For each exam
    for ExamIdx=1:NumberOfExams
        % Get Exam File Name
        ExamFileName = char(strcat(ExamsList(ExamIdx).folder, '\', ExamsList(ExamIdx).name));
        
        % Check if file really exists
        if ~exist(ExamFileName, 'file') == 2
            disp('Mat file does not exist')
            continue;
        end
        
        % Cler Previous Variables and Load New Ones
        clear I GT
        load(ExamFileName)
        
        % Check if MRI exam is in 8 bits per pixel, if not converts it
        I = squeeze(I(:,:,:,1));
        if ~isa(I, 'uint8')
            I = uint8(256*mat2gray(I));
        end
        
        % Check number of ROIS in Grount-truth
        NumberOfROIs = numel(unique(GT))-1;
        
        for ROIIdx=1:NumberOfROIs
            % Show in console the progress
            [DatasetIdx ExamIdx ROIIdx]
            
            % Load the annotation file
            clear AnnotationFilesList
            AnnotationFilesList = dir(char(strcat(ExamsList(ExamIdx).folder, ...
                '\Annotation\', num2str(ExamIdx, '%0.1d'), '-*.mat')));
            
            for AnnotationFileIdx=1:length(AnnotationFilesList)
                % Cat file name and folder
                AnnotationName = strcat( ...
                    AnnotationFilesList(AnnotationFileIdx).folder, '\', ...
                    AnnotationFilesList(AnnotationFileIdx).name);
                
                AnnotationROINumber = erase(AnnotationFilesList(AnnotationFileIdx).name,".mat");
                AnnotationROINumber = split(AnnotationROINumber,"-", 2);
                AnnotationROINumber = str2num(char(AnnotationROINumber(2)));
                
                % Check if annotation exists
                if ~(exist(AnnotationName, 'file') == 2)
                    disp('File does no exist.')
                    continue;
                end
                
                % Load Annotations
                clear ANT times
                load(char(AnnotationName));
                
                % Convert matrix type to single (4 bytes)
                Annotation = single(ANT);
           
                
                % Crop and Get Region of Interest (ROI)
                clear croppedImg croppedImgGT croppedImgAN 
                [ROII, ROIGT, ROIANT, IANTime] = GetROI(I, GT, Annotation);
                nROIAN = ROIANT;
   
                % Estimate annotation on intermediary slices
                [ROIANT, fillInRT] = FillNonAnnotatedSlices(ROII, ROIANT);
          
                % Segmentation without annotation on intermediary slices
                clear ss segmentacoes rtAll segmentacoes2 rtAll2 measures1 measures2
                ss = size(ROII);
                [Segmentations1, RunTimes1, Measures1] = ...
                SegmentationAllMethods(ROII, ROIGT, nROIAN, fillInRT);
            
            
                % Segmentations with annotation on intermediary slices 
                [Segmentations2, RunTimes2, Measures2] = ...
                SegmentationAllMethods(ROII, ROIGT, ROIANT, fillInRT);

                writetable(table([Measures1; Measures2]), strcat(SaveDir,...
                    strcat(num2str(DatasetIdx), ...
                    '-', num2str(ExamIdx), '-', num2str(ROIIdx), '-', ...
                    num2str(AnnotationROINumber), '-Measures.csv')) )
                writetable(table([IANTime,fillInRT]), strcat(SaveDir, ...
                    strcat(num2str(DatasetIdx), '-', num2str(ExamIdx), ...
                    '-', num2str(ROIIdx), '-', num2str(AnnotationROINumber), ...
                    '-RunTimes.csv')))
                
            end
        end
    end
end

