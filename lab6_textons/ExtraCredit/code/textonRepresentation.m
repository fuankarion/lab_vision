function tmap = textonRepresentation( fb,textons,img )
   
    im2=double(img)/255;
    tmap = assignTextons(fbRun(fb,im2),textons');
     
end

