imgs{1} = imread('lena_512x512.bmp'); titles{1} = 'org';
imgs{2} = imnoise(imgs{1}, 'salt & pepper'); titles{2} = 'noised org';
imgs{3} = uint8(abstractFilter(imgs{2}, [3 3], @median)); titles{3} = 'median';

imgs{4} = rgb2gray(imgs{1}); titles{4} = 'gray';
imgs{5} = imnoise(imgs{4}, 'salt & pepper'); titles{5} = 'noised gray';
imgs{6} = uint8(abstractFilter(imgs{5}, [3 3], @filterLUM, 2)); titles{6} = 'median';

show_results(imgs, titles);