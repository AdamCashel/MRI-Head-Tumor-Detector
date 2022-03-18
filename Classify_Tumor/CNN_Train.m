%Training Set
X = zeros(224, 224, 2475);
x = zeros(224, 224, 395);
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
facelabels3 = 3.* ones(length(827),827);
facelabels2 = 2.* ones(length(822),822);
facelabels1 = ones(1,826);
facelabels0 = zeros(1,395);
Ytrain = [facelabels3 facelabels2 facelabels1 facelabels0];
Ytrain = Ytrain';
           

h = size(Xtrain, 1);
w = size(Xtrain, 2);
c = 1; 

N_train = size(Xtrain, 3); 

Xtrain = reshape(Xtrain, [h, w, c, N_train]);
Ytrain = categorical(Ytrain); 
                              

layers = [
    
    imageInputLayer([h w c]) 
    %Layer2
    convolution2dLayer(6, 128, 'Padding',[0 0 0 0],'stride',4)                    
    reluLayer 
    %Layer4
    crossChannelNormalizationLayer(3)
    maxPooling2dLayer(2, 'Stride', 2,'padding',0)
    %Layer6
    convolution2dLayer(6, 96, 'Padding', 2,'stride',2)
    reluLayer
    %Layer8
    maxPooling2dLayer(2, 'Stride', 2)
    convolution2dLayer(6, 96, 'Padding', 2,'stride',2)
    %Layer10
    reluLayer
    maxPooling2dLayer(2, 'Stride', 2)
    %Layer12
    convolution2dLayer(6, 96, 'Padding', 2, 'stride',2)
    reluLayer
    %Layer14
    maxPooling2dLayer(2, 'Stride', 2,'padding',0)
    convolution2dLayer(6, 96, 'Padding',2, 'stride',1)
    %Layer16
    reluLayer
    maxPooling2dLayer(2, 'Stride', 2,'padding',0)
    %Layer18
    convolution2dLayer(4, 96, 'Padding',2, 'stride',1)
    reluLayer
    %Layer20
    maxPooling2dLayer(2, 'Stride', 2,'padding',[0 0 0 0])
    fullyConnectedLayer(512)
    %Layer22
    dropoutLayer(.30);
    fullyConnectedLayer(4)
    %Layer24
    softmaxLayer
    classificationLayer];


layers

options = trainingOptions('sgdm', ... 
    'InitialLearnRate', 0.01, ...     
    'MaxEpochs', 40, ...               
    'Shuffle', 'every-epoch', ...     
    'Verbose', true, ...              
    'Plots', 'training-progress');    


net = trainNetwork(Xtrain, Ytrain, layers, options);



