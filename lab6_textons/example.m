
addpath('/home/fuanka/Dokumente/CV/lab_vision/lab6_textons/lib')
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;

sizefb=size(fb)
filterSize=fb{1,1}

fbCol1=zeros(0,0);
for i=1:sizefb(1)
    fbCol1=vertcat(fbCol1,fb{i,1});
end

fbCol2=zeros(0,0);
for i=1:sizefb(1)
    fbCol2=vertcat(fbCol2,fb{i,2});
end

size(fbCol1)
size(fbCol2)
imshow(mat2gray(fbCol1));
imshow(mat2gray(fbCol2));
drawnow;

% imagen de referencia para construir diccionario de textones
im1=double(imread('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/T09_32.jpg'))/255;
im2=double(imread('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/T04_38.jpg'))/255;

im = [im1 im2];
% numero de textones en diccionario
k = 10;

% diccionario de textones
[map,textons] = computeTextons(fbRun(fb,im),k);


size(map)
size(im)
size(textons)
textons


% figure;imshow(map,[]);colormap(jet);
% 
% D=dir('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/subSample/*.jpg');
% % texton maps de dos nuevas imagenes
% for i=1:numel(D),
%     im2=double(imread(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/subSample/',D(i).name)))/255;
%     tmap = assignTextons(fbRun(fb,im2),textons');
%     
%     % la distribucion de textones en la oveja deberia ser similar a la de la
%     % imagen de referencia.
%     figure;subplot(1,2,1);imshow(tmap,[]);colormap(jet);
%     subplot(1,2,2);bar(histc(tmap(:),1:k)/numel(tmap));
%     drawnow;
% end

