function testSVM( testDir,modelPath )

    model=load(modelPath)
   
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
    
    sample=load(strcat(testDir,'/Bark1.mat'));
    sampleSize=size(sample.tmap);
    
    testData=zeros(250,sampleSize(1)*sampleSize(2));
    gtLabels=zeros(250,1)
    
    
    testMatrixIdx=1;
    for i=1:length(clasesNames)
        
        clasesNames{i}        
        D=dir(strcat(testDir,'/',clasesNames{i},'*.mat')); 
                
        for textonDescriptorIdx=1:length(D)
            fileDescriptor=strcat(testDir,'/',D(textonDescriptorIdx).name)
            aSample=load(fileDescriptor);
            testData(testMatrixIdx,:)=reshape(aSample.tmap,[1,sampleSize(1)*sampleSize(2)]);
            gtLabels(testMatrixIdx,1)=i;
            
            testMatrixIdx=testMatrixIdx+1
        end            
    end
     
    predictions=predict(model.Mdl,testData);
    horzcat(predictions,gtLabels)
    
    classperf(gtLabels, predictions)
       

end

