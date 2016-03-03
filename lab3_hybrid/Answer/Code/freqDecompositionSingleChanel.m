function [ decomp ] = freqDecompositionSingleChanel( img,param )
        
    %Idealer Tieffpass, ja wohl dis ist schon fourier,
    lowPassIdeal=zeros(size(img));

    sizeGS=size(lowPassIdeal);
    for i=1:sizeGS(1)
        for j=1:sizeGS(2)
            dist=[i-(sizeGS(1)/2),j-(sizeGS(2)/2)];
            if norm(dist) < param
                lowPassIdeal(i,j)=1;
            end
        end
    end

    lowPassIdeal=fftshift(lowPassIdeal);
    IMG=fft2(img);

    %Tief bzw. hochpas rechnen
    LIMG=IMG.*lowPassIdeal;
    HIMG=IMG-LIMG;

    low=real(ifft2(LIMG));
    high=real(ifft2(HIMG));

    decomp=zeros(sizeGS(1),sizeGS(2),2);
    decomp(:,:,1)=low;
    decomp(:,:,2)=high;
    
    imshow(horzcat(mat2gray(low+high),mat2gray(low),mat2gray(high)))
end

