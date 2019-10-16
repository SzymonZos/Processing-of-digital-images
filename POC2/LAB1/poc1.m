%% Init
img = imread('lena_cropped.bmp');

%% Median filter
img_gray = rgb2gray(img);
imgs{1} = imnoise(img_gray, 'salt & pepper', 0.02); titles{1} = 'Noise 2%'; titles{4} = 'Noise 2% - median';
imgs{2} = imnoise(img_gray, 'salt & pepper', 0.05); titles{2} = 'Noise 5%'; titles{5} = 'Noise 5% - median';
imgs{3} = imnoise(img_gray, 'salt & pepper', 0.20); titles{3} = 'Noise 20%'; titles{6} = 'Noise 20% - median';

imgs_filtered_median = cellfun(@(img)abstractFilter(img, [3 3], @median), imgs, 'UniformOutput', 0);
show_results([imgs imgs_filtered_median], titles);

%% LUM filter
titles = cellfun(@(str)strrep(str, 'median', 'LUM'), titles, 'UniformOutput', 0);
imgs_filtered_LUM = cellfun(@(img)abstractFilter(img, [3 3], @median), imgs, 'UniformOutput', 0);
