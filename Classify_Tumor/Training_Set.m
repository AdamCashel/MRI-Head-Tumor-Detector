clear;
clc;
close all;
training_glioma_tumor = zeros(224,224,826);
training_meningioma_tumor = zeros(224,224,822);
training_no_tumor = zeros(224,224,395);
training_pituitary_tumor = zeros(224,224,827);

Location = 'Training\glioma_tumor\*jpg';
ds = imageDatastore(Location);
counter = 1;
image_offset1 = 0;
image_offset2 = 0;
while hasdata(ds)
    tempImage = read(ds);
    [rows, columns, numberOfColorChannels] = size(tempImage);
    tempImage = tempImage(1+image_offset1:rows-image_offset1, 1+image_offset2:columns-image_offset2);
    tempImage = im2gray(tempImage);
    tempImage = imresize(tempImage,[224,224]);
    training_glioma_tumor(:,:,counter) = tempImage;
    counter = counter + 1;
end

Location = 'Training\meningioma_tumor\*jpg';
ds = imageDatastore(Location);
counter = 1;

while hasdata(ds)
    tempImage = read(ds);
    [rows, columns, numberOfColorChannels] = size(tempImage);
    tempImage = tempImage(1+image_offset1:rows-image_offset1, 1+image_offset2:columns-image_offset2);
    tempImage = im2gray(tempImage);
    tempImage = imresize(tempImage,[224,224]);
    training_meningioma_tumor(:,:,counter) = tempImage;
    counter = counter + 1;
end


Location = 'Training\no_tumor\*jpg';
ds = imageDatastore(Location);
counter = 1;

while hasdata(ds)
    tempImage = read(ds);
    [rows, columns, numberOfColorChannels] = size(tempImage);
    tempImage = tempImage(1+image_offset1:rows-image_offset1, 1+image_offset2:columns-image_offset2);
    tempImage = im2gray(tempImage);
    tempImage = imresize(tempImage,[224,224]);
    training_no_tumor(:,:,counter) = tempImage;
    counter = counter + 1;
end


Location = 'Training\pituitary_tumor\*jpg';
ds = imageDatastore(Location);
counter = 1;

while hasdata(ds)
    tempImage = read(ds);
    [rows, columns, numberOfColorChannels] = size(tempImage);
    tempImage = tempImage(1+image_offset1:rows-image_offset1, 1+image_offset2:columns-image_offset2);
    tempImage = im2gray(tempImage);
    tempImage = imresize(tempImage,[224,224]);
    training_pituitary_tumor(:,:,counter) = tempImage;
    counter = counter + 1;
end







































