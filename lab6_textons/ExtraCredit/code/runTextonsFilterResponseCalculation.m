setenv('LC_ALL','C')
addpath('/home/jcleon/storage/disk0/Other/code/lab_vision/lab6_textons/lib')
targetTextons='/home/jcleon/storage/disk0/Other/textures/gaussianFilters'
inputImages='/home/jcleon/storage/disk0/Other/textures/train/'

fb=createBank(16,2);

size(fb)
%extra gaussian filters
fb{33,1}=fspecial('gaussian',13,0.1);
fb{34,1}=fspecial('gaussian',13,0.5);
fb{35,1}=fspecial('gaussian',13,1);
fb{36,1}=fspecial('gaussian',13,5);
fb{37,1}=fspecial('gaussian',13,10);
fb{38,1}=fspecial('gaussian',13,50);

fb{33,2}=fspecial('gaussian',19,0.1);
fb{34,2}=fspecial('gaussian',19,0.5);
fb{35,2}=fspecial('gaussian',19,1);
fb{36,2}=fspecial('gaussian',19,5);
fb{37,2}=fspecial('gaussian',19,10);
fb{38,2}=fspecial('gaussian',19,50);


size(fb)


D=dir('/home/jcleon/storage/disk0/Other/textures/train/');

for i=3:numel(D)    
    D(i).name
    responses=filterResponseCalculation(fb,strcat(inputImages,D(i).name));
    size(responses)
    warning('write to disk')
    for j=1:numel(responses)
        j
        aResponse=responses{j};
        save(strcat(targetTextons,'/',D(i).name,num2str(j),'.mat'),'aResponse','-v7.3')
    end
end



