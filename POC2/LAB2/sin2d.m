
imgs{1} = generateSin2D([512, 512], [20, 50]);
imgs{2} = generateSin2D([512, 512], [40, 100]);
imgs{3} = generateSin2D([512, 512], [20, 10]);

spectralDensityImgs = cellfun(@spectralDensity, imgs, 'UniformOutput', 0);
phaseDensityImgs = cellfun(@phaseDensity, imgs, 'UniformOutput', 0);

%imgs{i+2} = generateGauss2D([512, 512], [0, 150]); titles{i+2} = num2str(i+2);

imgs_comp = cell(1,12);
imgs_comp{1} = imgs{1};
imgs_comp{2} = spectralDensityImgs{1};
imgs_comp{3} = phaseDensityImgs{1};
imgs_comp{4} = imgs{1};

imgs_comp{5} = imgs{2};
imgs_comp{6} = spectralDensityImgs{2};
imgs_comp{7} = phaseDensityImgs{2};
imgs_comp{8} = imgs{2};


imgs_comp{9} = imgs{3};
imgs_comp{10} = spectralDensityImgs{3};
imgs_comp{11} = phaseDensityImgs{3};
imgs_comp{12} = imgs{3};

titles = cell(1,12);
show_results(imgs_comp, titles);
