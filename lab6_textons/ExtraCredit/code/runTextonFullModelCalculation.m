setenv('LC_ALL','C') 
addpath('/home/jcleon/storage/disk0/Other/code/lab_vision/lab6_textons/lib')

textonsSource='/home/jcleon/storage/disk0/Other/textures/gaussianFilters/models/3';

k=50;

D=dir(strcat(textonsSource,'/*.mat'));

fullConcatResponsePath=strcat(textonsSource,'/',D(1).name);
fullSet=load(fullConcatResponsePath);
fullSet=fullSet.concatResponse;

sizeClassConcatResponse=size(fullSet)

for concatResponseIdx = 2:length(D)
    fullConcatResponsePath=strcat(textonsSource,'/',D(concatResponseIdx).name)
    tempSet=load(fullConcatResponsePath);  
    tempSet=tempSet.concatResponse;
    
    sizetempSet=size(tempSet)
    sizefullSet=size(fullSet)
    for i=1:sizeClassConcatResponse(1)
        for j=1:sizeClassConcatResponse(2)
            [concatResponseIdx, i,j]
            fullSet{i,j}=horzcat(fullSet{i,j},tempSet{i,j});
        end
    end
end

warning('calculate texton dictionary')
tic;
[map,textons] = computeTextons(fullSet,k);
toc;
warning('Done, save to disk')

save(strcat(textonsSource,'/full','/mapk',num2str(k),'.mat'),'map','-v7.3');
save(strcat(textonsSource,'/full','/textonsk',num2str(k),'.mat'),'textons','-v7.3');


