%%db is te original texton file with ALL the images set to the training set
function net =TrainCNN(db)
    setup ;
    net = InitializeTextonNetwork() ;
    
    trainOpts.batchSize = 180 ;
    trainOpts.numEpochs = 10 ;
    trainOpts.continue = true ;
    trainOpts.useGpu = true ;
    trainOpts.learningRate = 0.001 ;
    trainOpts.expDir = '/home/jcleon/Software/practical-cnn-2015a/data/chars-experimentLabTexton2' ;
          
    size(db.images.data)
    
    % 50 50
    tic;
    warning('Create trainign and test sets');
    tSamples=floor(rand(1,12500)*24999)+1;
    for idx = tSamples
        db.images.set(idx)=2;
    end
    toc;
     
    %change data type of images to single 
    tic;
    warning('resizing and changing data type');
    tempImgs=db.images.data;
    originalSizeImages=size(db.images.data)
    db.images=rmfield(db.images,'data');
    db.images.data=single(zeros(64,64,originalSizeImages(3)));    
    for idx = 1:originalSizeImages(3)
        tempResized= imresize(tempImgs(:,:,idx),[64,64]);
        tempSingle=single(tempResized);
        db.images.data(:,:,idx)=tempSingle;
    end
    sizeAfterPreprocessing=size(db.images.data);
    toc;
    
    warning('Start learning at ');
    datestr(now) 
    
    % Take the average image out
    tic;
    imageMean = mean(db.images.data(:))    
    db.images.data = db.images.data - imageMean ;
    toc;
            
    finalSize=size(db.images.data)
    class(db.images.data)
    % Convert to a GPU array if needed
    if trainOpts.useGpu
      db.images.data = gpuArray(db.images.data) ;
    end
    
    % Call training function in MatConvNet
    [net,info] = cnn_train(net, db, @getBatchWithJitter64, trainOpts) ;

    % Move the CNN back to the CPU if it was trained on the GPU
    if trainOpts.useGpu
      net = vl_simplenn_move(net, 'cpu') ;
    end
    
    % Save the result for later use
    net.layers(end) = [] ;
    net.imageMean = imageMean ;
    save('/home/jcleon/Software/practical-cnn-2015a/data/chars-experimentLabTexton2/model/textonCNN', '-struct', 'net') ;
    
    figure(2) ; clf ; colormap gray ;
    vl_imarraysc(squeeze(net.layers{1}.filters),'spacing',2)
    axis equal ; title('filters in the first layer') ;
   
end

% --------------------------------------------------------------------
function [im, labels] = getBatchWithJitter64(imdb, batch)
% --------------------------------------------------------------------
im = imdb.images.data(:,:,batch) ;
labels = imdb.images.label(1,batch);

n = numel(batch) ;
train = find(imdb.images.set == 1) ;

sel = randperm(numel(train), n) ;
im1 = imdb.images.data(:,:,sel) ;

sel = randperm(numel(train), n) ;
im2 = imdb.images.data(:,:,sel) ;

ctx = [im1 im2] ;

ctx(:,32:95,:) =im ;

dx = randi(22) - 22 ;
im = ctx(:,(32:95)+dx,:) ;
sx = (32:95) + dx ;

dy = randi(20) - 4 ;
sy = max(1, min(64, (1:64) + dy)) ;

im = ctx(sy,sx,:) ;

% Visualize the batch:
figure(100) ; clf ;
vl_imarraysc(im) ;

im = 256 * reshape(im, 64, 64, 1, []) ;

%imJitterSize=size(im)

end


% --------------------------------------------------------------------
function [im, labels] = getBatchWithJitter128(imdb, batch)
% --------------------------------------------------------------------
im = imdb.images.data(:,:,batch) ;
labels = imdb.images.label(1,batch);

n = numel(batch) ;
train = find(imdb.images.set == 1) ;

sel = randperm(numel(train), n) ;
im1 = imdb.images.data(:,:,sel) ;

sel = randperm(numel(train), n) ;
im2 = imdb.images.data(:,:,sel) ;

ctx = [im1 im2] ;
%sizeCTX=size(ctx(:,65:192,:))
%sizeIm=size(im)
%ctx(:,65:192,:) = min(ctx(:,65:192,:), im) ;
ctx(:,65:192,:) =im ;

dx = randi(44) - 22 ;
%ssSizeCTX=size(ctx)
im = ctx(:,(65:192)+dx,:) ;
%ssSizeIM=size(im)
sx = (65:192) + dx ;
%sizsSX=size(sx)

dy = randi(20) - 8 ;
sy = max(1, min(128, (1:128) + dy)) ;
%sizsSY=size(sy)

im = ctx(sy,sx,:) ;
%sizeInteIM=size(im)

% Visualize the batch:
figure(100) ; clf ;
vl_imarraysc(im) ;

im = 256 * reshape(im, 128, 128, 1, []) ;
%size(im)
%figure(100) ; clf ;
%imshow(mat2gray(im(:,:,1,randi(99))))

%imFinalSize=size(im)
%labelsFinalSize=size(labels)
end

