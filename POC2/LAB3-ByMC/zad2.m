
clear all
close all


orginal = imread('obrazki/obrazek.png');
orginal = rgb2gray(orginal);
orginal = im2double(orginal);
histogram = histeq(orginal);
noisedImg = imnoise(orginal,'salt & pepper',0.02);
afterFilter = noiseFilter(noisedImg,ones(3,3));

[levelOrginal, otsuOrginal] = getOtsu(orginal);
[levelHistogram, otsuHistogram] = getOtsu(histogram);
[levelNoised, otsuNoised] = getOtsu(noisedImg);
[levelFilter, otsuFilter] = getOtsu(afterFilter);
imgs{1} = orginal;
imgs{2} = histogram;
imgs{3} = noisedImg;
imgs{4} = afterFilter;
imgs{5} = label2rgb(bwlabel(otsuOrginal));
imgs{6} = label2rgb(bwlabel(otsuHistogram));
imgs{7} = label2rgb(bwlabel(otsuNoised));
imgs{8} = label2rgb(bwlabel(otsuFilter));

titles{1} = 'orginal';
titles{2} = 'hist';
titles{3} = 'noised';
titles{4} = 'filtered';
titles{5} = ['Osu - Orginal level: ', num2str(levelOrginal)];
titles{6} = ['Osu - Hist level: ', num2str(levelHistogram)];
titles{7} = ['Osu - Noised level: ', num2str(levelNoised)];
titles{8} = ['Osu - Filtered level: ', num2str(levelFilter)];
for i = 1:length(imgs)
   subplot(2, ceil(length(imgs)/2), i);
    imshow(imgs{i}, []);
    title(titles{i});
end
