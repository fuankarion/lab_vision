function TrainSVM( trainDir,modelPath )

   
    clasesNames{1}='Bark';
    clasesNames{2}='Wood';
    clasesNames{3}='Water';
    clasesNames{4}='Granite';
    clasesNames{5}='Marble';
    clasesNames{6}='Floor';
    clasesNames{7}='Pebbles';
    clasesNames{8}='wall';
    clasesNames{9}='brick';
    clasesNames{10}='glass';
    clasesNames{11}='carpet';
    clasesNames{12}='Upholstery';
    clasesNames{13}='wallpaper';
    clasesNames{14}='fur';
    clasesNames{15}='knit';
    clasesNames{16}='corduroy';
    clasesNames{17}='plaid';

    
    sample=load(strcat(trainDir,'/Bark1.mat'));
    sampleSize=size(sample.tmap);
    
    
    trainData=zeros(781,sampleSize(1)*sampleSize(2));
    trainLabels=zeros(781,1)
    
    trainMatrixIdx=1;
    for i=1:length(clasesNames)
        
        clasesNames{i}
        
        D=dir(strcat(trainDir,'/',clasesNames{i},'*.mat')); 
                
        for textonDescriptorIdx=1:length(D)
            fileDescriptor=strcat(trainDir,'/',D(textonDescriptorIdx).name)
            aSample=load(fileDescriptor);
            trainData(trainMatrixIdx,:)=reshape(aSample.tmap,[1,sampleSize(1)*sampleSize(2)]);
            trainLabels(trainMatrixIdx,1)=i;
            
            trainMatrixIdx=trainMatrixIdx+1
        end            
    end
       
    Mdl = fitcecoc(trainData,trainLabels,'Verbose',2)
    
    save(modelPath,'Mdl','-v7.3')
end

