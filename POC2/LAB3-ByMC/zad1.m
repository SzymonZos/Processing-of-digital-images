
clear all
%close all


orginal = imread('obrazki/coins.bmp');
binarizationLevel = 76/255;

hist=imhist(orginal);
binarization = getBinarization(orginal,binarizationLevel);

[level1, otsu] = getOtsu(orginal);
imgs{1} = orginal;
imgs{3} = binarization;
imgs{4} = label2rgb(bwlabel(binarization));
imgs{5} = im2bw(orginal, level1);
imgs{6} = label2rgb(bwlabel(otsu));

titles{1} = 'orginal';
titles{2} = 'hist';
titles{3} = ['Bin level: ' , num2str(binarizationLevel)];
titles{4} = ['Bin Label level: ' , num2str(binarizationLevel)];
titles{5} = ['Bin Thresh level: ', num2str(level1)];
titles{6} = ['Bin Thresh Label level: ', num2str(level1)];


figure
for i = 1:length(imgs)
   subplot(3, ceil(length(imgs)/4), i);
   if i == 2
       imhist(imgs{1});
   else
    imshow(imgs{i}, []);
   end
   title(titles{i});
end