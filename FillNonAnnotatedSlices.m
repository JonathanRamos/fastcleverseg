


function [croppedImgAN3D, rt] = FillNonAnnotatedSlices(I, croppedImgAN3D)

    slicesGT = find(squeeze(sum(sum(croppedImgAN3D == 1))) > 1);
   
	tic
   for idx=2:length(slicesGT)-2
       croppedImgAN3D = rasterizarLinhaReta(croppedImgAN3D,    slicesGT(idx), slicesGT(idx+1), 1, 1); % pos2-1
       
   end
   rt = toc;
   
  for idx=1:slicesGT(end)
        croppedImgAN3D(:, 2, idx) = 2;
       croppedImgAN3D(2, :, idx) = 2;
       croppedImgAN3D(end-2, :, idx) = 2;
       croppedImgAN3D(:, end-2, idx) = 2;
  end
    
end

function croppedImgAN3D = rasterizarLinhaReta(croppedImgAN3D, pos1, pos2, valor, v2)
%     tam = size(croppedImgAN3D, 3);
    BB = bwboundaries(croppedImgAN3D(:, :, pos1) == valor);
    BB2 = bwboundaries(croppedImgAN3D(:, :, pos2) == valor);
%     it = 81;
%     figure,
%     whos B B2
    if ~isempty(BB) && ~isempty(BB2)
        for ix=1:length(BB)
            clear vector
            vector = BB{ix, :};
%             size(vector)
            [vals idx] = sortrows(vector, [1 2]);
            B = [vector(idx(1):end,:); vector(1:idx(1)-1,:)];
            zcoord(size(B,1)) = 0;
            zcoord(:) = pos1;
%             plot3(B(:,1), B(:,2), zcoord, 's', 'Color', 'b', 'MarkerSize', 10, 'MarkerFaceColor', 'w'); hold on
            for iy=1:length(BB2)
                clear vector2 B2 idx2
                vector2 = BB2{iy, :};
%                 size(vector2)
                [vals idx2] = sortrows(vector2, [1 2]);
                B2 = [vector2(idx2(1):end,:); vector2(1:idx2(1)-1,:)];
                clear zcoord
                zcoord(size(B2,1)) = 0;
                zcoord(:) = pos2;
%                 plot3(B2(:,1), B2(:,2), zcoord, 's', 'Color', 'b', 'MarkerSize', 10, 'MarkerFaceColor', 'w'); hold on
%             view(-84,34)
                if (length(B) < length(B2))
                    cont = 1;
                    for j=1:length(B)
                        P1 = [B(j, 1) B(j, 2) pos1];
                        P2 = [B2(j, 1) B2(j, 2) pos2];
                        [X,Y,Z] = bresenham_line3d(P1, P2);
%                         plot3(X(2:end-1), Y(2:end-1), Z(2:end-1), 's', 'Color', 'k', 'MarkerSize', 8, 'MarkerFaceColor', 'c'); hold on
%                         pause(0.1)
%                          if cont==it
%                             return
%                         end
                        cont = cont + 1;
                        
                        for i=2:length(X)-1
                            croppedImgAN3D(X(i),Y(i),Z(i)) = v2;
                        end
                    end
                    c = 1;

                    for j=length(B)+1:length(B2)
                        P1 = [B(c, 1) B(c, 2) pos1];
                        P2 = [B2(j, 1) B2(j, 2) pos2];
                        [X,Y,Z] = bresenham_line3d(P1, P2);
%                         plot3(X(2:end-1), Y(2:end-1), Z(2:end-1), 's', 'Color', 'k', 'MarkerSize', 8, 'MarkerFaceColor', 'c'); hold on
%                         if cont==it
%                             return
%                         end
%                         cont = cont + 1;
%                         pause(0.1)
                        for i=2:length(X)-1
                            croppedImgAN3D(X(i),Y(i),Z(i)) = v2;
                        end
                        if c == size(B,1)
                            c = 1;
                        else
                            c = c + 1;
                        end
                    end
%                     cont
                else
                    cont = 1;
                    for j=1:length(B2)
                        P1 = [B2(j, 1) B2(j, 2) pos2];
                        P2 = [B(j, 1) B(j, 2) pos1];
                        [X,Y,Z] = bresenham_line3d(P1, P2);
%                         plot3(X(2:end-1), Y(2:end-1), Z(2:end-1), 's', 'Color', 'k', 'MarkerSize', 8, 'MarkerFaceColor', 'c'); hold on
%                          if cont==it
%                             return
%                          end
%                         pause(0.1)
                        cont = cont + 1;
                        
                        for i=2:length(X)-1
                            croppedImgAN3D(X(i),Y(i),Z(i)) = v2;
                        end
                    end
                     c = 1;
                    for j=length(B2)+1:length(B)
                        P1 = [B(j, 1) B(j, 2) pos1];
                        P2 = [B2(c, 1) B2(c, 2) pos2];
                        [X,Y,Z] = bresenham_line3d(P1, P2);
%                         plot3(X(2:end-1), Y(2:end-1), Z(2:end-1), 's', 'Color', 'k', 'MarkerSize', 8, 'MarkerFaceColor', 'c'); hold on
%                         pause(0.1)
%                          if cont==it
%                             return
%                         end
                        cont = cont + 1;
                        
                        for i=2:length(X)-1
                            croppedImgAN3D(X(i),Y(i),Z(i)) = v2;
                        end
                        if c == size(B2,1)
                            c = 1;
                        else
                            c = c + 1;
                        end
                    end
%                     cont
%                     return
                end
            end
        end
    else
        disp('Empty annotation')
    end
end