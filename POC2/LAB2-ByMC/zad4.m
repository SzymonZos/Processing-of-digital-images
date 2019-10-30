%%
clear all
close all
iterations=5;

mask = [0 -1 0; -1 5 -1;0 -1 0];
test = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\trojkat1.png');
test = rgb2gray(test);
test = im2double(test);
imgs{1} = test;
titles{1} = 'HPF orginal';

imgs{2} = filtrowanie(test, mask);
titles{2} = ['HPF Iteracja 1 psnr:', num2str(psnr(imgs{2},test))];

if iterations >1
    for i=2:iterations
        imgs{i+1} = filtrowanie(imgs{i},mask);
        titles{i+1} = ['HPF Iteracja ',num2str(i), ' psnr: ', num2str(psnr(imgs{i+1},test))];
    end
end

figure
for i = 1:length(imgs)
    subplot(2, ceil(length(imgs)/2), i);
    imshow(imgs{i}, []);
    title(titles{i});
end

for i = 1:length(imgs)
    figure
       images = comparisonImage(imgs{i});
       imshow([images{1} images{2} images{3}], []);
    title(titles{i});
end

imgs{2} = filtrowanie(test, ones(3));
titles{1} = 'LPF orginal';
titles{2} = ['LPF Iteracja 1 psnr:', num2str(psnr(imgs{2},test))];
if iterations >1
    for i=2:iterations
        imgs{i+1} = filtrowanie(imgs{i},ones(3));
        titles{i+1} = ['LPF Iteracja ',num2str(i), ' psnr: ', num2str(psnr(imgs{i+1},test))];
    end
end

figure
for i = 1:length(imgs)
    subplot(2, ceil(length(imgs)/2), i);
    imshow(imgs{i}, []);
    title(titles{i});
end

for i = 1:length(imgs)
    figure
       images = comparisonImage(imgs{i});
       imshow([images{1} images{2} images{3}], []);
    title(titles{i});
end