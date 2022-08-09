


function [labels, runningTime, strengths] = segmenter(Image, LabelsMatrix, method, theta)
%       MEX FILES MUST BE COMPILED ONCE BEFORE USING IT
%
%     mex bgrowthmex.cpp
%     mex cleversegmex.cpp
%     mex fastcs.cpp
%     mex fastgc.cpp FibHeap.cpp 
%     mex growcutmex.cpp


    if (numel(unique(LabelsMatrix)) < 2)
        error(strcat('Labels must 0, 1, 2, etc. You have [', ...
               num2str(numel(unique(LabelsMatrix))), '] unique labels'));
           return
    end

    runningTime = 0;
    strengths = 0;
    switch method
       case 'GrowCut'
           tic
           labels = growcutmex(Image, LabelsMatrix);
           runningTime = toc;
           labels = labels==1;
        case 'BGrowth'
           tic
           labels = bgrowthmex(Image, LabelsMatrix);
           runningTime = toc;
           labels = labels==1;
        case 'CleverSeg'
           tic
           labels = cleversegmex(Image, LabelsMatrix, theta);
           runningTime = toc;
           labels = labels==1;
        case 'FCS'
           tic
           [labels strengths] = fastcs(Image, LabelsMatrix, theta);
           runningTime = toc;
%           labels = labels == 1;
        case 'fcs8'
           tic
           labels = fastcs8(Image, LabelsMatrix, theta);
           runningTime = toc;
          labels = labels == 1;
        case 'FGC'
           tic
           labels = fastgc(Image, LabelsMatrix);
           runningTime = toc;
           labels = labels == 1;
           
        otherwise
           error(strcat(method, ' is an invalid method. Please choose', ...
               ' "GrowCut", "BGrowth", "CleverSeg", "FCS", "FGC"'));
    end
end
