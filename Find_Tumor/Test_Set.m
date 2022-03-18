test_glioma_tumor = zeros(200,200,100);
test_meningioma_tumor = zeros(200,200,115);
test_no_tumor = zeros(200,200,105);
test_pituitary_tumor = zeros(200,200,74);

Location = 'Testing\glioma_tumor\*jpg';
ds = imageDatastore(Location);
counter = 1;

while hasdata(ds)
    tempImage = read(ds);
    tempImage = rgb2gray(tempImage);
    tempImage = imresize(tempImage,[200,200]);
    test_glioma_tumor(:,:,counter) = tempImage;
    counter = counter + 1;
end

Location = 'Testing\meningioma_tumor\*jpg';
ds = imageDatastore(Location);
counter = 1;

while hasdata(ds)
    tempImage = read(ds);
    tempImage = rgb2gray(tempImage);
    tempImage = imresize(tempImage,[200,200]);
    test_meningioma(:,:,counter) = tempImage;
    counter = counter + 1;
end


Location = 'Testing\no_tumor\*jpg';
ds = imageDatastore(Location);
counter = 1;

while hasdata(ds)
    tempImage = read(ds);
    tempImage = rgb2gray(tempImage);
    tempImage = imresize(tempImage,[200,200]);
    test_no_tumor(:,:,counter) = tempImage;
    counter = counter + 1;
end


Location = 'Testing\pituitary_tumor\*jpg';
ds = imageDatastore(Location);
counter = 1;

while hasdata(ds)
    tempImage = read(ds);
    tempImage = rgb2gray(tempImage);
    tempImage = imresize(tempImage,[200,200]);
    test_pituitary_tumor(:,:,counter) = tempImage;
    counter = counter + 1;
end

