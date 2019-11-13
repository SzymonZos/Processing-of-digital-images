clear all
close all

imageName= 'obrazki/coins.bmp';

img = imread(imageName);
binImg = getBinarization(img, graythresh(img));
noised = imgaussfilt(img,6);
binNoise = getBinarization(noised, graythresh(noised));

[labelBinImg, labelBinAmount] = bwlabel(binImg);
labelBinImg = label2rgb(labelBinImg);
[labelNoiseBinImg, labelNoiseBinAmount] = bwlabel(binNoise);
labelNoiseBinImg = label2rgb(labelNoiseBinImg);

imgs{1} = img;
imgs{2} = binImg;
imgs{3} = noised;
imgs{4} = binNoise;
imgs{6} = labelBinImg;
imgs{8} = labelNoiseBinImg;

titles{1} = 'orginal';
titles{2} = 'Bin';
titles{3} = 'Filtered';
titles{4} = 'Filtered Bin';
titles{5} = 'Orginal Hist';
titles{6} = ['Orginal Label', num2str(labelBinAmount)];
titles{7} = 'Filtered Hist';
titles{8} = ['Filtered Label: ', num2str(labelNoiseBinAmount)];

for i = 1:length(imgs)
   subplot(2, ceil(length(imgs)/2), i);
   if i == 5
       imhist(img);
   elseif i == 7
       imhist(noised);
   else
       imshow(imgs{i}, []);
   end
       title(titles{i});
end
clearvars -except imageName


img = imread(imageName);
img = imnoise(img, 'salt & pepper', 0.02);

binImg = getBinarization(img, graythresh(img));
noised = medfilt2(img, [3, 3]);
binNoise = getBinarization(noised, graythresh(noised));

[labelBinImg, labelBinAmount] = bwlabel(binImg);
labelBinImg = label2rgb(labelBinImg);
[labelNoiseBinImg, labelNoiseBinAmount] = bwlabel(binNoise);
labelNoiseBinImg = label2rgb(labelNoiseBinImg);


imgs{1} = img;
imgs{2} = binImg;
imgs{3} = noised;
imgs{4} = binNoise;
imgs{6} = labelBinImg;
imgs{8} = labelNoiseBinImg;

titles{1} = 'orginal Impulse';
titles{2} = 'Bin';
titles{3} = 'Median Filtr';
titles{4} = 'MF Bin';
titles{5} = 'Orginal Impulse Hist';
titles{6} = ['Orginal Impulse Label', num2str(labelBinAmount)];
titles{7} = 'MF Hist';
titles{8} = ['MF Label: ', num2str(labelNoiseBinAmount)];
figure
for i = 1:length(imgs)
   subplot(2, ceil(length(imgs)/2), i);
   if i == 5
       imhist(img);
   elseif i == 7
       imhist(noised);
   else
       imshow(imgs{i}, []);
   end
       title(titles{i});
end

clearvars -except imageName

img = imread(imageName);
img = imnoise(img, 'gaussian', 0.1);

binImg = getBinarization(img, graythresh(img));
noised = imgaussfilt(img, 10);
binNoise = getBinarization(noised, graythresh(noised));

%[labelBinImg, N] = bwlabel(binImg);
[labelBinImg, labelBinAmount] = bwlabel(binImg);
labelBinImg = label2rgb(labelBinImg);
[labelNoiseBinImg, labelNoiseBinAmount] = bwlabel(binNoise);
labelNoiseBinImg = label2rgb(labelNoiseBinImg);


imgs{1} = img;
imgs{2} = binImg;
imgs{3} = noised;
imgs{4} = binNoise;
imgs{6} = labelBinImg;
imgs{8} = labelNoiseBinImg;

titles{1} = 'orginal Gauss';
titles{2} = 'Bin';
titles{3} = 'Filtered';
titles{4} = 'Filtered Bin';
titles{5} = 'Orginal Gauss Hist';
titles{6} = ['Orginal Gauss Label', num2str(labelBinAmount)];
titles{7} = 'Filtered Hist';
titles{8} = ['Filtered Label: ', num2str(labelNoiseBinAmount)];

figure
for i = 1:length(imgs)
   subplot(2, ceil(length(imgs)/2), i);
   if i == 5
       imhist(img);
   elseif i == 7
       imhist(noised);
   else
       imshow(imgs{i}, []);
   end
       title(titles{i});
end