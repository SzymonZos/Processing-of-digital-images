close all; clear all; clc;
img = imread('lena_cropped.bmp');
mask = 3;
img = double(img);
[x,y,layers] = size(img);
img_out = zeros(x,y,layers);
offset = (mask - 1) / 2;
for i = (1 + offset):(x - offset)
    for j = (1 + offset):(y - offset)
        width = mask^2;
        height = 1;
        vector = zeros(width, layers);
        for k = 1:layers
            section = img(i-offset:i+offset,j-offset:j+offset,k)';
            vector(1:width, k) = reshape(section, width, height);
        end
        euclid_dist = dist(vector, vector');
        sum_matrix = sum(euclid_dist);
        img_out(i,j,:) = vector(find(sum_matrix==min(sum_matrix), 1),:);
    end
end
img_out = img_out/255;
imshow(img_out);