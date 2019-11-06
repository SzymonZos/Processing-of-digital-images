imgs_c{1} = imread('lenna_512x512.bmp'); titles_c{1} = 'org';
spectralDensityImg = spectralDensity(imgs_c{1});
imgs_c{2} = spectralDensityImg{1};
inverseFourierImg = inverseFourier(spectralDensityImg{2});
imgs_c{3} = inverseFourierImg{1};

imgFiltered = lowFreqFilter(imgs_c{1}, [200 200]);

imgs_c{4} = mat2gray(log(1 + abs(imgFiltered{1})));
imgs_c{5} = mat2gray(log(1 + abs(imgFiltered{1})));
imgs_c{6} = mat2gray(log(1 + abs(ifft2(ifftshift(imgFiltered{1})))));

imgFiltered = lowFreqFilter(imgs_c{1}, [100 100]);
imgs_c{7} = mat2gray(log(1 + abs(imgFiltered{1})));
imgs_c{8} = mat2gray(log(1 + abs(imgFiltered{1})));
imgs_c{9} = mat2gray(log(1 + abs(ifft2(ifftshift(imgFiltered{1})))));


titles_c = cell(1,9);
show_results(imgs_c, titles_c);

%%
imgs_c{1} = imread('lenna_512x512.bmp'); titles_c{1} = 'org';
spectralDensityImg = spectralDensity(imgs_c{1});
imgs_c{2} = spectralDensityImg{1};
inverseFourierImg = inverseFourier(spectralDensityImg{2});
imgs_c{3} = inverseFourierImg{1};

imgFiltered = highFreqFilter(imgs_c{1}, [200 200]);

imgs_c{4} = mat2gray(log(1 + abs(imgFiltered{1})));
imgs_c{5} = mat2gray(log(1 + abs(imgFiltered{1})));
imgs_c{6} = mat2gray(log(1 + abs(ifft2(ifftshift(imgFiltered{1})))));

imgFiltered = highFreqFilter(imgs_c{1}, [100 100]);
imgs_c{7} = mat2gray(log(1 + abs(imgFiltered{1})));
imgs_c{8} = mat2gray(log(1 + abs(imgFiltered{1})));
imgs_c{9} = mat2gray(log(1 + abs(ifft2(ifftshift(imgFiltered{1})))));


titles_c = cell(1,9);
show_results(imgs_c, titles_c);
