
function [ROII, ROIGT, ROIANT, IANTime] = GetROI(I, GT, ANT)
    [r,c,v] = ind2sub(size(ANT),find(ANT > 0));
    points = double([r,c,v]);
    inc = 2;
    x1 = min(points(:,1))-inc;
    if x1 < 1
        x1=1;
    end
    x2 = max(points(:,1))+inc;
    if x2 > size(ANT,1)
        x2=size(ANT,1);
    end
    y1 = min(points(:,2))-inc;
    if y1 < 1
        y1=1;
    end
    y2 = max(points(:,2))+inc;
    if y2 > size(ANT,2)
        y2=size(ANT,2);
    end
    z1 = min(points(:,3));
    
    z2 = max(points(:,3));
%     [x1 x2 y1 y2 z1 z2]
    % Crop images to process
    ROIANT = uint8(ANT(x1:x2, y1:y2, z1:z2));
%     croppedImgAN3DFilled = imgAN3D(x1:x2, y1:y2, z1:z2);
    ROII = uint8(I(x1:x2, y1:y2, z1:z2));
    ROIGT = GT(x1:x2, y1:y2, z1:z2);
    
    % Estimate Inside Annotation
    tic
    ROIANT = EstimateInteriorAnnotation(ROIANT, ROII);
    IANTime = toc;
    % get only the object in the center or the ROI
    % Discard parts from other elements in the GT
    [r,c,v] = ind2sub(size(ROIANT),find(ROIANT == 1));
    ROIGT = ROIGT == ROIGT(r(1),c(1),v(1));

    
%     subplot(3,1,1), imshow(squeeze(ROII(:,:, z1)), []);
%     subplot(3,1,2), imshow(squeeze(ROIGT(:,:, z1)), []);
%     subplot(3,1,3), imshow(squeeze(ROIANT(:,:, 1)), []);

    %% Testing codes, do not use unless you know what you are doing
    % Getting only the vertebral content for the actual vertebrae
%     if caso == 3 % Axial
%         for idx=1:size(croppedImgAN3D, 3)
%          croppedImgGT3D(:, :, idx) = reshape(getGroundTruthRegion(...
%              reshape(croppedImgGT3D(:, :, idx), size(croppedImgGT3D, 1), size(croppedImgGT3D, 2)), ...
%              reshape(croppedImgAN3D(:, :, idx), size(croppedImgGT3D, 1), size(croppedImgGT3D, 2)) == 2), ...
%              size(croppedImgGT3D, 1), size(croppedImgGT3D, 2));
%         end
%         % Fill non annotated slices with the previous annotation
%         for idx=2:size(croppedImgAN3DFilled, 3)
%          if (sum(sum(croppedImgAN3DFilled(:, :, idx) == 1)) < 5)
%              croppedImgAN3DFilled(:, :, idx) = croppedImgAN3DFilled(:, :, idx-1);
%          end
%         end
%          % Remove parts of others vertebral bodies
%         for idx=1:size(croppedImgAN3DFilled, 3)
%          if (sum(sum(croppedImgAN3DFilled(:, :, idx) == 1)) > 5)
%             GT = squeeze(croppedImgGT3D(:, :, idx));
%             AN = squeeze(croppedImgAN3DFilled(:, :, idx));
%             GT = removeOtherVertebralContent(GT, AN);
%             croppedImgGT3D(:, :, idx) = reshape(GT, size(croppedImgGT3D, 1), size(croppedImgGT3D, 2), 1);
%          end
%         end
%     elseif caso == 2 % Coronal
%         for idx=1:size(croppedImgAN3D, 2)
%          croppedImgGT3D(:, idx, :) = reshape(getGroundTruthRegion(...
%              reshape(croppedImgGT3D(:, idx, :), size(croppedImgGT3D, 1), size(croppedImgGT3D, 3)), ...
%              reshape(croppedImgAN3D(:, idx, :), size(croppedImgGT3D, 1), size(croppedImgGT3D, 3)) == 2), ...
%              size(croppedImgGT3D, 1), size(croppedImgGT3D, 3));
%         end
%         % Fill non annotated slices with the previous annotation
%         for idx=2:size(croppedImgAN3DFilled, 2)
%          if (sum(sum(croppedImgAN3DFilled(:, idx, :) == 1)) < 5)
%              croppedImgAN3DFilled(:, idx, :) = croppedImgAN3DFilled(:, idx-1, :);
%          end
%         end
%         
%         for idx=1:size(croppedImgAN3DFilled, 2)
% %          if (sum(sum(croppedImgAN3DFilled(:, :, idx) == 1)) > 0)
%             GT = squeeze(croppedImgGT3D(:, idx, :));
%             AN = squeeze(croppedImgAN3DFilled(:, idx, :));
%             GT = removeOtherVertebralContent(GT, AN);
%             croppedImgGT3D(:, idx, :) = reshape(GT, size(croppedImgGT3D, 1), 1, size(croppedImgGT3D, 3));
% %          end
%         end
%         
%     elseif caso == 1 % Sagital
%         for idx=1:size(croppedImgAN3D, 1)
%          croppedImgGT3D(idx, :, :) = reshape(getGroundTruthRegion(...
%              reshape(croppedImgGT3D(idx, :, :), size(croppedImgGT3D, 2), size(croppedImgGT3D, 3)), ...
%              reshape(croppedImgAN3D(idx, :, :), size(croppedImgGT3D, 2), size(croppedImgGT3D, 3)) == 2), ...
%              size(croppedImgGT3D, 2), size(croppedImgGT3D, 3));
%         end
%         % Fill non annotated slices with the previous annotation
%         for idx=2:size(croppedImgAN3DFilled, 1)
%          if (sum(sum(croppedImgAN3DFilled(idx, :, :) == 1)) < 5)
%              croppedImgAN3DFilled(idx, :, :) = croppedImgAN3DFilled(idx-1, :, :);
%          end
%         end
%         
%         for idx=1:size(croppedImgAN3DFilled, 1)
% %          if (sum(sum(croppedImgAN3DFilled(:, :, idx) == 1)) > 0)
%             GT = squeeze(croppedImgGT3D(idx, :, :));
%             AN = squeeze(croppedImgAN3DFilled(idx, :, :));
%             GT = removeOtherVertebralContent(GT, AN);
%             croppedImgGT3D(idx, :, :) = reshape(GT, 1, size(croppedImgGT3D, 2), size(croppedImgGT3D, 3));
% %          end
%         end
%     end
end