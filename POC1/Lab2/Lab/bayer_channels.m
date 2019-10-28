function [red_img, green_img, blue_img] = bayer_channels(rgb_img)
[dimX, dimY] = size(rgb_img);
red_img = uint8(zeros(dimX,dimY)); green_img = uint8(zeros(dimX,dimY)); blue_img = uint8(zeros(dimX,dimY));

for i = 1:2:dimX
    for j = 1:2:dimY
        red_img(i, j) = rgb_img(i, j);
        
        green_img(i+1, j) = rgb_img(i+1, j);
        green_img(i, j+1) = rgb_img(i, j+1);
        
        blue_img(i+1, j+1) = rgb_img(i+1, j+1);
    end
end
end