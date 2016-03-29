addpath('/home/fuanka/Dokumente/CV/lab_vision/lab6_textons/lib')
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;

sizefb=size(fb)
filterSize=size(fb{1,1});


%%%%FILTER DRAWING
% fbCol1=zeros(0,0);
% for i=1:sizefb(1)
%     fbCol1=vertcat(fbCol1,fb{i,1});
% end
% 
% fbCol2=zeros(0,0);
% for i=1:sizefb(1)
%     fbCol2=vertcat(fbCol2,fb{i,2});
% end
% 
% size(fbCol1)
% size(fbCol2)
% imshow(mat2gray(fbCol1));
% imshow(mat2gray(fbCol2));
% drawnow;

% numero de textones en diccionario
km = 20;

D=dir('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/');

for i=3:numel(D)
    singleTextureFullTestSet=double(zeros(0,0));
    D(i).name
    F=dir(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/',D(i).name,'/*.jpg'));
    for j=1:numel(F)
        name=strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/',D(i).name,'/',F(j).name)
        im=double(imread(name))/255;
        singleTextureFullTestSet=[singleTextureFullTestSet im];
        size(singleTextureFullTestSet)
    end
    
    %singleTextureFullTestSet=[im im];
    
    % diccionario de textones
    warning('calculate textons')
    tic
    [map,textons] = computeTextons(fbRun(fb,singleTextureFullTestSet),km);
    toc
    
    save(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/calculatedTextons20/map',D(i).name,'.mat'),'map') 
    save(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/calculatedTextons20/textons',D(i).name,'.mat'),'textons') 
    
end


%im1=double(imread('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/T09_32.jpg'))/255;
%im = [im1 im2 im3 im4 im5 im6 im7 im8 im9 im10 ];


sizeMap=size(map)
sizeIM=size(im)
%%%this size is K (clusters), bu the numel of the texton dictionary
sizeTextons=size(textons)

figure;imshow(map,[]);colormap(jet);

D=dir('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/subSample/*.jpg');
% texton maps de dos nuevas imagenes
for i=1:numel(D),
    im2=double(imread(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/subSample/',D(i).name)))/255;
    tmap = assignTextons(fbRun(fb,im2),textons');

    % la distribucion de textones en la oveja deberia ser similar a la de la
    % imagen de referencia.
    figure;subplot(1,2,1);imshow(tmap,[]);colormap(jet);
    subplot(1,2,2);bar(histc(tmap(:),1:k)/numel(tmap));
    drawnow;
end