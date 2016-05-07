setenv('LC_ALL','C') 
addpath('/home/jcleon/storage/disk0/Other/code/lab_vision/lab6_textons/lib')

clasesNames={}
clasesNames{1}='Bark';
clasesNames{2}='Wood';
clasesNames{3}='water';
clasesNames{4}='granite';
clasesNames{5}='marble';
clasesNames{6}='floor';
clasesNames{7}='pebbles';
clasesNames{8}='wall';
clasesNames{9}='brick';
clasesNames{10}='glass';
clasesNames{11}='carpet';
clasesNames{12}='upholstery';
clasesNames{13}='wallpaper';
clasesNames{14}='fur';
clasesNames{15}='knit';
clasesNames{16}='corduroy';
clasesNames{17}='plaid';


for i=1:length(clasesNames)
    concatResponse=perClassConcatTextonResponse('/home/jcleon/storage/disk0/Other/textures/gaussianFilters',clasesNames{i},3);
    save(strcat('/home/jcleon/storage/disk0/Other/textures/gaussianFilters/models/3/',clasesNames{i},'concat3.mat'),'concatResponse','-v7.3');
end



