function [ output_args ] = drawTextonFb( fb )

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
    imshow(mat2gray(fbCol2));
    drawnow;
end

