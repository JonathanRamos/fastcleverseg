clc
clear all

% Paths to datasets
ImageDatasets = {
    '..\ImageDatasets\PM\Isotropic\Matlab\', ...
    '..\ImageDatasets\IVD\Isotropic\Matlab\', ...
    '..\ImageDatasets\VBs\VB1\Isotropic\Matlab\', ...
    '..\ImageDatasets\VBs\VB2\Isotropic\Matlab\', ...
    '..\ImageDatasets\VBs\VB3\Isotropic\Matlab\'};

NumberOfMeasures = 20; 
% For each image Dataset
for DatasetIdx=1:length(ImageDatasets)

    % Get exams list in matlab format (.m)
    ExamsList = dir(char(strcat(ImageDatasets(DatasetIdx), '*.mat')));
    
    % Get number of exams to be analyzed
    NumberOfExams = length(ExamsList);
    
    clear FCS FGC CS BG GC EstimationTime AnnotationTime
    % Create matrix to save the results measures for each method
    FCS(NumberOfExams, NumberOfMeasures) = 0; % FastCleverSeg
    FGC(NumberOfExams, NumberOfMeasures) = 0; % FastGrowCut
    CS (NumberOfExams, NumberOfMeasures) = 0; % CleverSeg
    BG (NumberOfExams, NumberOfMeasures) = 0; % BalancedGrowth
    GC (NumberOfExams, NumberOfMeasures) = 0; % GrowCut 
    
    % Auxiliar matrices
    EstimationTime(NumberOfExams, 2) = 0;
    AnnotationTime(NumberOfExams, 1) = 0;
    
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
            
            for AnnotationFileIdx=1:lenght(AnnotationFilesList)
                
                if ~(exist(char(AnnotationFilesList(AnnotationFileIdx)), 'file') == 2)
                    disp('File does no exist.')
                    continue;
                end
                
                % Load Annotations
                clear ANT times
                load(char(AnnotationFilesList(AnnotationFileIdx)));
                
                Annotation = single(ANT);
                
                % Crop and Get Region of Interest (ROI)
                clear croppedImg croppedImgGT croppedImgAN 
                [ROII, ROIGT, ROIANT] = GetROI(I, GT, Annotation, AnnotationFileIdx);
                
                
                % Estimate Inside Annotation
                tic
                ROIANT = EstimateInteriorAnnotation(ROIANT, ROII);
                InteriorANTTime = toc;
                It = single(mat2gray(I));
                pos = find(squeeze(sum(sum(ANT==1))) > 0);
                
                normalAN = croppedImgAN;
        
                if pathCount < 6
                    [croppedImgAN, fillInRT] = FillNonAnnotatedSlices(croppedImg, croppedImgAN);
                else
                    fillInRT = 0;
                end

                cont2 = 1;
                theta = 0.01;
                clear ss segmentacoes rtAll segmentacoes2 rtAll2 measures1 measures2
                ss = size(croppedImgGT);
                [segmentacoes2 rtAll2, measures2] = SegmentationAllMethods(croppedImg, ...
                croppedImgGT, normalAN(1:ss(1), 1:ss(2), 1:ss(3)), normalAN, fillInRT, single(theta));
            
                [segmentacoes rtAll, measures1] = SegmentationAllMethods(croppedImg, ...
                croppedImgGT, croppedImgAN(1:ss(1), 1:ss(2), 1:ss(3)), normalAN, fillInRT, single(theta));

                [measures1 measures2]
                
            end
            return
            
        end
        
        
        return
        
    end

    
end