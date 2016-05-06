%use todos los canales
%las escala de las coordenandas y la escala de los colores
function my_segmentation = segment_by_clustering( img,feature_space,method,numclusters)

scaleFactor=4
originalSize=size(img);
imgResized=imresize(img,1/scaleFactor);
resizedSize=size(imgResized);
watershedImage=img;

switch feature_space
    case 'rgb'
        warning('Using RGB color space')
        
        imgTransformed=img;
        imgTransformedResized=imgResized;
        
        lineImage = MultiChanelReshape(imgTransformed);
        lineImageResize = MultiChanelReshape(imgTransformedResized);
        
    case 'lab'
        warning('Using LAB color space')
        
        imgTransformed=rgb2lab(img);
        imgTransformedResized=rgb2lab(imgResized);
        
        lineImage = MultiChanelReshape(imgTransformed);
        lineImageResize = MultiChanelReshape(imgTransformedResized);
    case 'hsv'
        warning('Using HSV color space')
        
        imgTransformed=rgb2hsv(img);
        imgTransformedResized=rgb2hsv(imgResized);
        
        lineImage = MultiChanelReshape(imgTransformed);
        lineImageResize = MultiChanelReshape(imgTransformedResized);
    case 'rgb+xy'
        warning('Using RGB+xy space')
        
        imgTransformed=img;
        imgTransformedResized=imgResized;
        
        lineImage = MultichaneReshapeWithCoordinates(imgTransformed);
        lineImageResize = MultichaneReshapeWithCoordinates(imgTransformedResized);
        
    case 'lab+xy'
        warning('Using LAB+xy space')
        
        imgTransformed=rgb2lab(img);
        imgTransformedResized=rgb2lab(imgResized);
        
        
        lineImage = MultichaneReshapeWithCoordinates(imgTransformed);
        lineImageResize = MultichaneReshapeWithCoordinates(imgTransformedResized);
        
    case 'hsv+xy'
        warning('Using HSV+xy space')
        
        imgTransformed=rgb2hsv(img);
        imgTransformedResized=rgb2hsv(imgResized);
        
        
        lineImage = MultichaneReshapeWithCoordinates(imgTransformed);
        lineImageResize = MultichaneReshapeWithCoordinates(imgTransformedResized);
    otherwise
        warning('Dafuq1?')
end

clustered=zeros(originalSize(1),originalSize(2));

switch method
    case 'k-means'
        clustered=KmeansSegment(lineImage,originalSize,numclusters);
    case 'gmm'
        clustered=GMMSegment(lineImage,originalSize,numclusters);
    case 'hierarchical'
        clustered=HierachicalSegment(lineImageResize,resizedSize,numclusters);
        clustered=imresize(clustered,[originalSize(1),originalSize(2)]);
    case 'watershed'
        clustered=WatershedSegment(watershedImage);
    otherwise
        warning('Dafuq2?')
end

my_segmentation=clustered;

end

