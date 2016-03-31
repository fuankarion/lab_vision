function [ output_args ] = drawTextonFb( )
    addpath('/home/fuanka/Dokumente/CV/lab_vision/lab6_textons/lib')

    [fb] = fbCreate;
    sizefb=size(fb)

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
    imshow(imresize(mat2gray(fbCol2),3)');
    drawnow;
end

