function hist = getHistogram(img)

img = im2double(img);
hist = imhist(img);
end