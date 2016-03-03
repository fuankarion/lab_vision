%takes an image and the size of the ideal filter, executes filtering on
%fourier domain and return tow images, low frecuencies and high frecuencies
function [ decomp ] = freqDecompositionSingleChanel( img,param )
    %'Ideal' low pass filter
    lowPassIdeal=zeros(size(img));

    %filter contains 1 at center on aradious if param pixels
    sizeGS=size(lowPassIdeal);
    for i=1:sizeGS(1)
        for j=1:sizeGS(2)
            dist=[i-(sizeGS(1)/2),j-(sizeGS(2)/2)];
            if norm(dist) < param
                lowPassIdeal(i,j)=1;
            end
        end
    end

    %do shift for peoper alignment uin the fourier domain
    lowPassIdeal=fftshift(lowPassIdeal);
    IMG=fft2(img);

    %Calculation of hign a low bands
    LIMG=IMG.*lowPassIdeal;
    HIMG=IMG-LIMG;

    %back to the sptial domain
    low=real(ifft2(LIMG));
    high=real(ifft2(HIMG));

    %pack into a single image
    decomp=zeros(sizeGS(1),sizeGS(2),2);
    decomp(:,:,1)=low;
    decomp(:,:,2)=high;
    
    imshow(horzcat(mat2gray(low+high),mat2gray(low),mat2gray(high)))
end

