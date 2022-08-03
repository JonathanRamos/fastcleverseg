clc
clear all

load('C:\JournalCMPB2019\Vertebrae1\Isotropic\results.mat');
myFCS = FCS;
myFGC = FGC;
myCS = CS;
myBG = BG;
myGC = GC;
load('C:\JournalCMPB2019\Vertebrae2\Isotropic\results.mat');
FCS(1:161, :) = [];
FGC(1:161, :) = [];
CS(1:161, :) = [];
BG(1:161, :) = [];
GC(1:161, :) = [];

myFCS = [myFCS; FCS];
myFGC = [myFGC; FGC];
myCS  = [myCS; CS];
myBG = [myBG; BG];
myGC = [myGC; GC];
load('C:\JournalCMPB2019\Vertebrae3\Isotropic\results.mat');
FCS(1:322, :) = [];
FGC(1:322, :) = [];
CS(1:322, :) = [];
BG(1:322, :) = [];
GC(1:322, :) = [];
myFCS = [myFCS; FCS];
FCS = myFCS;
myFGC = [myFGC; FGC];
FGC = myFGC;
myCS  = [myCS; CS];
CS = myCS;
myBG = [myBG; BG];
BG = myBG;
myGC = [myGC; GC];
GC = myGC;
% return


% 
% load('C:\JournalCMPB2019\Muscle1\Isotropic\resultEANIS.mat');
% 
% FBG = [myFCS FBG];
% FCS = FBG;
% FGC = [FGC myFGC];
% CS= [CS myCS];
% BG = [BG myBG];
% GC = [GC myGC];

medida = 3;
% Method = ["FastCleverSeg"];
% EANIS(1:1080) = true;
% EANIS(1081:2160) = false;
% EANIS = EANIS';
% for i=1:215
%     Method  = [Method; "FastCleverSeg"];
% end
% for i=1:216
%     Method  = [Method; "CleverSeg"];
% end
% for i=1:216
%     Method  = [Method; "BGrowth"];
% end
% for i=1:216
%     Method  = [Method; "FastGrowCut"];
% end
% for i=1:216
%     Method  = [Method; "GrowCut"];
% end
% 
% Method = [Method; Method];

increment = 10;

% Hausdorf = [FCS(:, medida); CS(:, medida); BG(:, medida); FGC(:, medida); GC(:, medida);FCS(:, medida+10); CS(:, medida+10); BG(:, medida+10); FGC(:, medida+10); GC(:, medida+10)];
Hausdorf = [FCS(:, medida), FCS(:, medida+increment), ... % 
        FGC(:, medida), FGC(:, medida+increment),...
    CS(:, medida),  CS(:, medida+increment), ...
    BG(:, medida), BG(:, medida+increment),...
    GC(:, medida), GC(:, medida+increment)];

% resultados1 = table(Method, Hausdorf, EANIS);
% eanis = categorical(resultados1.EANIS);
% Method = categorical(Method);
% EANIS = Method.*eanis;
% 
% 
% 
% 
% Order = {'GrowCut', 'FastGrowCut', 'BGrowth', 'CleverSeg','FastCleverSeg'};
% resultados1.Method = categorical(resultados1.Method,Order);


h = boxplot(Hausdorf);
% get the handles to each line object
ax = gca();                 %axis handle (assumes 1 axis)
bph = ax.Children;          %box plot handle (assumes 1 set of boxplots)
bpchil = bph.Children      %handles to all boxplot elements
 
mins = min(Hausdorf);
maxs = max(Hausdorf);
quantiles = quantile(Hausdorf,[.25 .5 .75]);
means = mean(Hausdorf);
stds = std(Hausdorf);

string = "";
for i=1:10
    string = strcat(string, " \addplot+ [black, fill=white, boxplot prepared={lower whisker=", num2str(mins(i)), ...
        ",lower quartile=",num2str(quantiles(1,i)),",upper quartile=",num2str(quantiles(3,i)),...
        ",upper whisker=",num2str(maxs(i)),",median=",num2str(quantiles(2,i)),",average=",num2str(means(i)),",sample size=216}] coordinates {};");
end

% h =  boxplot(Hausdorf)
% %boxchart(resultados1.Method,resultados1.Hausdorf,'GroupByColor',EANIS,'Notch', 'on'), %
% % title('With EANIS')
% xlabel('Hausdorf (Vox.)')
% a = handle(h)

% Hausdorf = [FCS(:, medida+10); CS(:, medida+10); BG(:, medida+10); FGC(:, medida+10); GC(:, medida+10)];
% resultados2 = table(Method, Hausdorf);
% resultados2.Method = categorical(resultados2.Method,Order);
% subplot(6,4,2), 
% boxchart(resultados2.Method,resultados2.Hausdorf,'Notch','on', 'Orientation', 'horizontal'), title('Without EANIS')
% xlabel('Hausdorf (Vox.)')
