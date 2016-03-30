%%KM is ke for the k-means algorithm
%%assumes there are n subdir in mainDir, with the images, each subdir is a
%%class
function calculateTextonDictAndMap(km,mainDir,targetDir)
    addpath('/home/jcleon/storage/disk0/Other/code/lab_vision/lab6_textons/lib')
    clear all;close all;clc;

    % create filter bank
    [fb] = fbCreate;

    D=dir(mainDir);

    singleTextureFullTestSet=double(zeros(0,0));
    for i=3:numel(D)% skip .. and . which are files in linux
        D(i).name
        F=dir(strcat(mainDir,D(i).name,'/*.jpg'));
        randomImgIdx=round(rand(1,5)*29)
        for j=1:numel(randomImgIdx)
            name=strcat(mainDir,D(i).name,'/',F(randomImgIdx(j)).name)
            im=double(imread(name))/255;
            singleTextureFullTestSet=[singleTextureFullTestSet im];
            size(singleTextureFullTestSet)
        end
    end

    % diccionario de textones
    warning('calculate textons')
    tic
    [map,textons] = computeTextons(fbRun(fb,singleTextureFullTestSet),km);
    toc

    save(strcat(targetDir,'/map.mat'),'map') 
    save(strcat(targetDir,'/textons.mat'),'textons') 
end



