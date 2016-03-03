function DoHybrid(  )

    img1=imread('/home/fuanka/Schreibtisch/wes2.jpg');
    img2=imread('/home/fuanka/Schreibtisch/zeus3.jpg');
  
    param=16
    d1R=freqDecompositionSingleChanel(img1(:,:,1),param);
    d1G=freqDecompositionSingleChanel(img1(:,:,2),param);
    d1B=freqDecompositionSingleChanel(img1(:,:,3),param);
    
    d2R=freqDecompositionSingleChanel(img2(:,:,1),param);
    d2G=freqDecompositionSingleChanel(img2(:,:,2),param);
    d2B=freqDecompositionSingleChanel(img2(:,:,3),param);
       
    HR=d1R(:,:,1)+d2R(:,:,2);
    HG=d1G(:,:,1)+d2G(:,:,2);
    HB=d1B(:,:,1)+d2B(:,:,2);
        
    H=cat(3,mat2gray(HR),mat2gray(HG),mat2gray(HB));
    
    imshow(H)
    
    imwrite(H,'/home/fuanka/Schreibtisch/Weus.jpg')
end

