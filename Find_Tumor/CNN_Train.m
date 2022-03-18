%Training Set
X = zeros(200, 200, 2475);
x = zeros(200, 200, 395);
X1 = training_glioma_tumor(:,:,1:826);
X2 = training_meningioma_tumor(:,:,1:822);
X3 = training_pituitary_tumor(:,:,1:827);
X4 = training_no_tumor(:,:,1:395);

for i = 1:826
    X(:,:,i) = round(X1(:,:,i));
end

for i = 827:1648
    X(:,:,i) = round(X2(:,:,i-826));
end

for i = 1649:2475
    X(:,:,i) = round(X3(:,:,i-1648));
end

for i = 1:395
    x(:,:,i) = round(X4(:,:,i));
end

Xtrain = cat(3,X,x);

check2 = X(:,:,2);
[rows, columns, numberOfColorChannels] = size(check2);
tumorlabels1 = ones(1,2475);
tumorlabels0 = zeros(1,395);
Ytrain = [tumorlabels1 tumorlabels0];
Ytrain = Ytrain';
           

h = size(Xtrain, 1);
w = size(Xtrain, 2);
c = 1; 

N_train = size(Xtrain, 3); 

Xtrain = reshape(Xtrain, [h, w, c, N_train]);
Ytrain = categorical(Ytrain); 
                              

layers = [
    imageInputLayer([h w c]) 
    
    convolution2dLayer(3, 32, 'Padding','same') 
    batchNormalizationLayer                    
    reluLayer                                  
    
    maxPooling2dLayer(2, 'Stride', 2)         
    
    convolution2dLayer(3, 32, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2, 'Stride', 2)
    
    convolution2dLayer(3, 64, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2, 'Stride', 2)
    
    convolution2dLayer(3, 80, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2, 'Stride', 2)
    
    
   
    fullyConnectedLayer(2)
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];


layers

options = trainingOptions('sgdm', ... 
    'InitialLearnRate', 0.01, ...     
    'MaxEpochs', 80, ...               
    'Shuffle', 'every-epoch', ...     
    'Verbose', true, ...              
    'Plots', 'training-progress');    


net = trainNetwork(Xtrain, Ytrain, layers, options);


