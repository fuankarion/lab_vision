function lineImage = MultiChanelReshape( img )
    originalSize=size(img);
    
    lineChanel1 = reshape(img(:,:,1),[originalSize(1)*originalSize(2),1]);
    lineChanel2 = reshape(img(:,:,2),[originalSize(1)*originalSize(2),1]);
    lineChanel3 = reshape(img(:,:,3),[originalSize(1)*originalSize(2),1]);

    lineImage=mat2gray(horzcat(lineChanel1,lineChanel2,lineChanel3));
end

