function ANT =  EstimateInteriorAnnotation(ANT, croppedImg)
    tam = size(ANT, 3);
    meio = round(tam/2);
    ANT(:,:,2:meio-1) = 0;
    ANT(:,:,meio+1:end-1) = 0;
    pos = find(squeeze(sum(sum(ANT==1))) > 0);
    
    se = strel( 'disk', 3);
    AN(size(ANT,1), size(ANT,2)) = 0;
    
    for i=1:numel(pos)
        clear aux
        aux = squeeze(ANT(:,:,pos(i)));
        AN(:) = 0;
        clear filledOutside filledOutside totalIns
        filledOutside = imfill(aux > 0, 'holes');

          totalOut = sum(filledOutside(:));
            totalIns = sum(filledOutside(:));
            while totalIns/totalOut > 0.2
                backup = filledOutside;
                filledOutside = imerode(filledOutside , se);
                totalIns = sum(filledOutside(:));
                if totalIns < 5
                    filledOutside = backup;
                    break;
                end
            end
            AN(filledOutside > 0) = 1;
            AN(aux > 0) = 2;
            ANT(:,:,pos(i)) = AN;
    end
    ANT(:, :, 2) = ANT(:, :, 1);
    ANT(:, :, end-1) = ANT(:, :, end);
end