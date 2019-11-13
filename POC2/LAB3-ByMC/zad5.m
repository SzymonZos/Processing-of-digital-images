clear all
close all

orginal = imread('obrazki/coins.bmp');
img = imgaussfilt(orginal, 3);
binImg = getBinarization(img, graythresh(img));

seErode = strel('square', 30);
erodeImg = imerode(binImg, seErode);

seErode = strel('square', 8);

closeImg = imclose(erodeImg, seErode);

seDilate = strel('square', 3);
dilateImg = imdilate(binImg, seDilate);

[labelBin, labelBinAmount] = bwlabel(binImg);
labelBin = label2rgb(labelBin);

[labelClose, labelCloseAmount] = bwlabel(closeImg);
labelClose = label2rgb(labelClose);

[labelDilate, labelDilateAmount] = bwlabel(dilateImg);
labelDilate = label2rgb(labelDilate);


imgs{1} = orginal;
imgs{2} = binImg;
imgs{3} = closeImg;
imgs{4} = dilateImg;
imgs{5} = labelBin;
imgs{6} = labelClose;
imgs{7} = labelDilate;

titles{1} = 'orginal';
titles{2} = 'Bin';
titles{3} = 'Erod+Close';
titles{4} = 'Dilate';
titles{5} = ['Bin Label: ', num2str(labelBinAmount)];
titles{6} = ['Erod+Close Label: ', num2str(labelCloseAmount)];
titles{7} = ['Dilate Label: ', num2str(labelDilateAmount)];

for i = 1:length(imgs)
   subplot(2, ceil(length(imgs)/2), i);
   imshow(imgs{i}, []);
   title(titles{i});
end