function clustered = WatershedSegment(img)

img= medfilt2(img,[10,10]);


borders= edge(img,'Canny');


se = strel('rectangle',[4,4]);

bordersD = imdilate(borders,se);
bordersF1=1-bordersD;


%imshow(horzcat(mat2gray(bordersF2),mat2gray(bordersF1),mat2gray(bordersD),mat2gray(borders),mat2gray(img)))


img = imimposemin(img, bordersF1);
hy = fspecial('sobel');
hx = hy';%Filter for the borders in the other orientation

Iy = imfilter(double(img), hy, 'replicate');
Ix = imfilter(double(img), hx, 'replicate');
grad = sqrt(Ix.^2 + Iy.^2);
% watersheds
clustered = watershed(grad);

end


