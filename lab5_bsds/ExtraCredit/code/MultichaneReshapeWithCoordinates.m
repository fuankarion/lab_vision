function lineImageWithCoordinates = MultichaneReshapeWithCoordinates( img )
    originalSize=size(img);
    
    lineChanel1 = reshape(img(:,:,1),[originalSize(1)*originalSize(2),1]);
    lineChanel2 = reshape(img(:,:,2),[originalSize(1)*originalSize(2),1]);
    lineChanel3 = reshape(img(:,:,3),[originalSize(1)*originalSize(2),1]);

    lineImage=horzcat(lineChanel1,lineChanel2,lineChanel3);
    
    vecCoordinates=zeros(originalSize(1)*originalSize(2),2);
    for i=1:originalSize(2)
        for j=1:originalSize(1)
            vecCoordinates(((i-1)*originalSize(1))+j,1)=j;
            vecCoordinates(((i-1)*originalSize(1))+j,2)=i;
        end
    end

    
    %normalizing, cheap shot :)
    lineImage=mat2gray(lineImage);
    vecCoordinates=mat2gray(vecCoordinates);
    
    
    lineImageWithCoordinates=horzcat(lineImage,vecCoordinates);
    
end

