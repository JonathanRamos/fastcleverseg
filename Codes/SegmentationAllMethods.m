 
function [Segados rtAll, measures] = SegmentationAllMethods(I, GT, AN, normalAN, fillInRT, theta)
%       fprintf('Running\n'); 
%       fprintf('FGC, ');
%       [SegFGC, RTFGC] = segmenter(I, AN, 'fgc');
%       fprintf(char(strcat({'RT: '}, num2str(RTFGC, '%2.4f'), {' '}, 'seconds\n')))
Segados = 0;
rtAll = 0;
measures = 0;

 
  
%       fprintf('FCS, ');
      [SegFCS, RTFCS, strFCS] = segmenter(I, AN, 'fcs2d', single(theta));
      
   
      

      slice = 1;
      
     subplot(1,3,1), imshow(squeeze(I(:,:,slice)))         
%      for i=1:5
subplot(2,4,1), imshow(squeeze(I(:,:,slice)))
subplot(2,4,2), imshow(squeeze(I(:,:,slice))); hold on
     BB = bwboundaries(imfill(squeeze(GT(:,:,slice))==1, 'holes'));
        for k = 1:length(BB)
            boundary = BB{k};
            plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1.5);
        end
%         
             BB = bwboundaries(imfill(squeeze(AN(:,:,slice))==1, 'holes'));
        for k = 1:length(BB)
            boundary = BB{k};
            plot(boundary(:,2), boundary(:,1), 'c', 'LineWidth', 2);
        end
        
             BB = bwboundaries(imfill(squeeze(AN(:,:,slice))==2, 'holes'));
        for k = 1:length(BB)
            boundary = BB{k};
            plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2);
        end
%       end
      

grayImage = squeeze(I(:,:,slice));
strs = strFCS;
strs1 = strs;
strs2 = strs;
lbls = SegFCS;
strs1(lbls == 2) = 0;
mymin = min(strs1(strs1>0));
mymax = max(strs1(strs1>0));
strs1 = strs1 - mymin;
strs1 = 255*(strs1./(mymax - mymin));


strs2(lbls == 1) = 0;
mymin2 = min(strs2(strs2>0));
mymax2 = max(strs2(strs2>0));
strs2 = strs2 - mymin2;
strs2 = 255*(strs2./(mymax2 - mymin2));


% / mymax - mymin );
% strs2(lbls == 1) = 0;
% 
% rgbImage = cat(3, grayImage,grayImage,grayImage);
% myones = ones(size(strs1,1),size(strs1,2));
myzeros = zeros(size(strs1,1),size(strs1,2));
% myones(:) = 1;
% myones(lbls == 2) = 0;
rgbImage2 = uint8(cat(3, myzeros ,strs1 , strs1 )); 
rgbImage3 = uint8(cat(3, myzeros, strs2, myzeros));
% whos rgbImage2 rgbImage
% rgbImage2 = (rgbImage+ 0.5*rgbImage2);
% rgbImage2 = (rgbImage2+ rgbImage3/2)/2;
% rgbImage(:, :, 1) = rgbImage(:, :, 1) + strs;

subplot(2,4,3), imshow(rgbImage2+rgbImage3, []); hold on



    BB = bwboundaries(imfill(squeeze(GT(:,:,slice))==1, 'holes'));
        for k = 1:length(BB)
            boundary = BB{k};
            plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1);
        end
%           BB = bwboundaries(strs1);
%         for k = 1:length(BB)
%             boundary = BB{k};
%             plot(boundary(:,2), boundary(:,1), 'c', 'LineWidth', 2);
%         end
        
%               BB = bwboundaries(strs2);
%         for k = 1:length(BB)
%             boundary = BB{k};
%             plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 1);
%         end
    

subplot(2,4,4), imshow(squeeze(I(:,:,slice))); hold on
    BB = bwboundaries(imfill(squeeze(GT(:,:,slice))==1, 'holes'));
        for k = 1:length(BB)
            boundary = BB{k};
            plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1);
        end
        
         BB = bwboundaries(lbls == 1);
        for k = 1:length(BB)
            boundary = BB{k};
            plot(boundary(:,2), boundary(:,1), 'c', 'LineWidth', 1);
        end
            
%       fprintf(char(strcat({'RT: '}, num2str(RTFCS, '%2.4f'), {' '}, 'seconds\n')))
   return
%       fprintf('CS, ');
      [SegCS, RTCS] = segmenter(I, AN, 'CleverSeg', single(theta));
%       fprintf(char(strcat({'RT: '}, num2str(RTCS, '%2.4f'), {' '}, 'seconds\n')))

%       fprintf('BG, ');
      [SegBG, RTBG] = segmenter(I, AN, 'BGrowth');
%       fprintf(char(strcat({'RT: '}, num2str(RTBG, '%2.4f'), {' '}, 'seconds\n')))
      
%       fprintf('GC, ');
      [SegGC, RTGC] = segmenter(I, AN, 'growcut');
%       fprintf(char(strcat({'RT: '}, num2str(RTGC, '%2.4f'), {' '}, 'seconds\n\n')))

        Segados{1} = SegFCS == 1;
        Segados{2} = SegFGC == 1;
        Segados{3} = SegCS == 1;
        Segados{4} = SegBG == 1;
        Segados{5} = SegGC == 1;
%         Segados{6} = SegFCS8 == 1;
        
        rtAll = [RTFCS, RTFGC, RTCS, RTBG, RTGC]';
%         rtAll = [RTFCS, RTCS]'; 

%       fprintf('FCS...');
      mFCS = [calcularMedidas(SegFCS==1, GT==1), RTFCS];
      
%       fprintf('FGC...');
      mFGC = [calcularMedidas(SegFGC==1, GT==1), RTFGC];
      
%       fprintf('CS...');
      mCS = [calcularMedidas(SegCS==1, GT==1), RTCS];
      
%       fprintf('BG...');
      mBG = [calcularMedidas(SegBG==1, GT==1), RTBG];
% %       
%       fprintf('GC...');
      mGC = [calcularMedidas(SegGC==1, GT==1), RTGC];

      measures = [mFCS; mFGC; mCS; mBG; mGC]; %
      methods = {'fCS', 'fGC', 'CS', 'BG', 'GC'}; % 
%       measures = [mFCS;mCS];
%       methods = {'FCS', 'CS'};
%       
      DSC = round(100*measures(:,8));
      HD  = round(measures(:,9),3);
      AUC = round(100*measures(:,2));
      AVD = round(measures(:,3),3);
      
      ACC = round(100*measures(:,4));
      PRE = round(100*measures(:,5));
      SEN = round(100*measures(:,6));
      SPE = round(100*measures(:,7));
      FM  = round(100*measures(:,8));
      RT  = round(rtAll,4);
%       
      dataSet = dataset(DSC, PRE, SEN, AUC, AVD, HD, RT, 'ObsNames', methods);
     
end