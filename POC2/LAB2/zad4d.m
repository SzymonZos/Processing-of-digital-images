imgs{1} = imread('lenna_512x512.bmp'); titles_c{1} = 'org';
imgs{2} = uint8(double(generateSin2D([512, 512], [1, 200])) + double(imgs{1}));
imgs{3} = generateSin2D([512, 512], [2, 200]);

spectralDensityImgs = cellfun(@spectralDensity, imgs, 'UniformOutput', 0);
phaseDensityImgs = cellfun(@phaseDensity, imgs, 'UniformOutput', 0);

imgFiltered = lowFreqFilter(imgs{2}, [100 100], [300 300]);
%imgs{i+2} = generateGauss2D([512, 512], [0, 150]); titles{i+2} = num2str(i+2);
imgs_comp{1} = imgs{1};
imgs_comp{2} = imgs{2};
imgs_comp{3} = imgs{3};
imgs_comp{4} = mat2gray(log(1 + abs(ifft2(ifftshift(imgFiltered{2})))));


imgs_comp{5} = spectralDensityImgs{1};
imgs_comp{6} = spectralDensityImgs{2};
imgs_comp{7} = spectralDensityImgs{3};
imgs_comp{8} = mat2gray(log(1 + abs(imgFiltered{2})));

titles = cell(1,8);
show_results(imgs_comp, titles);
