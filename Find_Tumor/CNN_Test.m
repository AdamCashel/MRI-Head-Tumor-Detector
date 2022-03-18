%Test Set
testX = zeros(200, 200, 289);
testx = zeros(200, 200, 105);
testX1 = test_glioma_tumor(:,:,1:100);
testX2 = test_meningioma_tumor(:,:,1:115);
testX3 = test_pituitary_tumor(:,:,1:74);
testX4 = test_no_tumor(:,:,1:105);

for i = 1:100
    testX(:,:,i) = round(testX1(:,:,i));
end

for i = 101:215
    testX(:,:,i) = round(testX2(:,:,i-100));
end

for i = 216:289
    testX(:,:,i) = round(testX3(:,:,i-215));
end

for i = 1:105
    testx(:,:,i) = round(testX4(:,:,i));
end



Xtest = cat(3,testX,testx);

tumorlabels1 = ones(1,289);
tumorlabels0 = zeros(1,105);
tumorlabels = [tumorlabels1 tumorlabels0];
tumorlabels = tumorlabels';
Ytest = categorical(tumorlabels(1:394));
N_test = size(Xtest, 3); 
Xtest = reshape(Xtest, [h, w, c, N_test]);


Ypred = classify(net, Xtest); 

probY = classify(net, Xtest); 
                             
accuracy_tumor = sum(Ypred == Ytest)/numel(Ytest);
accuracy = sum(Ypred == Ytest)/numel(Ytest);
accuracy = accuracy * 100