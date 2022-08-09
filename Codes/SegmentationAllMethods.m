 
function [Segmentations, RunTimes, Measures] = SegmentationAllMethods(I, GT, AN, fillInRT)
      theta = single(0.01);
       
      fprintf('Running\n'); 
      
      % Fast Grow Cut
      fprintf('FGC, ');
      [SegFGC, RTFGC] = segmenter(I, AN, 'FGC');
      fprintf(char(strcat({'RT: '}, num2str(RTFGC, '%2.4f'), {' '}, 'seconds\n')));
      
      % Fast CleverSeg
      fprintf('FCS, ');
      [SegFCS, RTFCS, strFCS] = segmenter(I, AN, 'FCS', theta);
      fprintf(char(strcat({'RT: '}, num2str(RTFCS, '%2.4f'), {' '}, 'seconds\n')))
      
      % CleverSeg
      fprintf('CS, ');
      [SegCS, RTCS] = segmenter(I, AN, 'CleverSeg', single(theta));
      fprintf(char(strcat({'RT: '}, num2str(RTCS, '%2.4f'), {' '}, 'seconds\n')))

      % Blanaced Growth
      fprintf('BG, ');
      [SegBG, RTBG] = segmenter(I, AN, 'BGrowth');
      fprintf(char(strcat({'RT: '}, num2str(RTBG, '%2.4f'), {' '}, 'seconds\n')))
      
      % GrowCut
      fprintf('GC, ');
      [SegGC, RTGC] = segmenter(I, AN, 'GrowCut');
      fprintf(char(strcat({'RT: '}, num2str(RTGC, '%2.4f'), {' '}, 'seconds\n\n')))
      
      % Save Resulting segmentations for each method
      Segmentations{1} = SegFGC == 1;
      Segmentations{2} = SegFCS == 1;
      Segmentations{3} = SegCS == 1;
      Segmentations{4} = SegBG == 1;
      Segmentations{5} = SegGC == 1;
      
      % Save the RunTime Results for each Method
      RunTimes = [RTFGC, RTFCS, RTCS, RTBG, RTGC]';
      
      % Calculate the measures for each method
      Measures(1,:) = [CalculateMeasures(SegFGC==1, GT==1), RTFGC];
      Measures(2,:) = [CalculateMeasures(SegFCS==1, GT==1), RTFCS];
      Measures(3,:) = [CalculateMeasures(SegCS==1, GT==1), RTCS];
      Measures(4,:) = [CalculateMeasures(SegBG==1, GT==1), RTBG];
      Measures(5,:) = [CalculateMeasures(SegGC==1, GT==1), RTGC];
  
 
end