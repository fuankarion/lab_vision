%main method
function DoHybrid(  )
   %Read images
    img1=imread('/home/fuanka/Schreibtisch/wes2.jpg');
    img2=imread('/home/fuanka/Schreibtisch/zeus3.jpg');
    
    %Set the radious of the 'ideal' filter
    param=16
    
    %get decomposition of low-high frecuencies of image 1, per chanel
    d1R=freqDecompositionSingleChanel(img1(:,:,1),param);
    d1G=freqDecompositionSingleChanel(img1(:,:,2),param);
    d1B=freqDecompositionSingleChanel(img1(:,:,3),param);
    
    %get decomposition of low-high frecuencies of image 1, per chanel
    d2R=freqDecompositionSingleChanel(img2(:,:,1),param);
    d2G=freqDecompositionSingleChanel(img2(:,:,2),param);
    d2B=freqDecompositionSingleChanel(img2(:,:,3),param);
       
    %Compose each hybrid chanel
    HR=d1R(:,:,1)+d2R(:,:,2);
    HG=d1G(:,:,1)+d2G(:,:,2);
    HB=d1B(:,:,1)+d2B(:,:,2);
        
    %compose final hybrid image
    H=cat(3,mat2gray(HR),mat2gray(HG),mat2gray(HB));
    
    imshow(H)
    
    imwrite(H,'/home/fuanka/Schreibtisch/Weus.jpg')
end

