clear all
close all

%% 1

pics = dir('pics/*.png');
imgs = cell(1, length(pics));
titles = cell(1, length(pics));
for i = 1 : length(pics)
    temp = imread(['pics/', pics(i).name]);
    imgs{i} = temp(:,:,1); %those imgs are binary so other 2 channels can be discarded
    titles{i} = num2str(i);
end
imgs{i+1} = generateSin2D([512, 512], [20, 50]); titles{i+1} = num2str(i+1);
imgs{i+2} = generateGauss2D([512, 512], [0, 150]); titles{i+2} = num2str(i+2);
imgs{i+3} = imread('lenna_512x512.bmp'); titles{i+3} = num2str(i+3);

spectralDensityImgs = cellfun(@spectralDensity, imgs, 'UniformOutput', 0);
phaseDensityImgs = cellfun(@phaseDensity, imgs, 'UniformOutput', 0);

show_results(imgs, titles);
show_results(spectralDensityImgs, titles);
show_results(phaseDensityImgs, titles);

%% circles
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

%% lines
imgs_comp = cell(1,12);
imgs_comp{1} = imgs{4};
imgs_comp{2} = spectralDensityImgs{4};
imgs_comp{3} = phaseDensityImgs{4};
imgs_comp{4} = imgs{4};

imgs_comp{5} = imgs{5};
imgs_comp{6} = spectralDensityImgs{5};
imgs_comp{7} = phaseDensityImgs{5};
imgs_comp{8} = imgs{5};


imgs_comp{9} = imgs{6};
imgs_comp{10} = spectralDensityImgs{6};
imgs_comp{11} = phaseDensityImgs{6};
imgs_comp{12} = imgs{6};

titles = cell(1,12);
show_results(imgs_comp, titles);

%% triangles
imgs_comp = cell(1,12);
imgs_comp{1} = imgs{7};
imgs_comp{2} = spectralDensityImgs{7};
imgs_comp{3} = phaseDensityImgs{7};
imgs_comp{4} = imgs{7};

imgs_comp{5} = imgs{8};
imgs_comp{6} = spectralDensityImgs{8};
imgs_comp{7} = phaseDensityImgs{8};
imgs_comp{8} = imgs{8};


imgs_comp{9} = imgs{9};
imgs_comp{10} = spectralDensityImgs{9};
imgs_comp{11} = phaseDensityImgs{9};
imgs_comp{12} = imgs{9};

titles = cell(1,12);
show_results(imgs_comp, titles);

%% others
imgs_comp = cell(1,12);
imgs_comp{1} = imgs{10};
imgs_comp{2} = spectralDensityImgs{10};
imgs_comp{3} = phaseDensityImgs{10};
imgs_comp{4} = imgs{10};

imgs_comp{5} = imgs{11};
imgs_comp{6} = spectralDensityImgs{11};
imgs_comp{7} = phaseDensityImgs{11};
imgs_comp{8} = imgs{11};


imgs_comp{9} = imgs{12};
imgs_comp{10} = spectralDensityImgs{12};
imgs_comp{11} = phaseDensityImgs{12};
imgs_comp{12} = imgs{12};

titles = cell(1,12);
show_results(imgs_comp, titles);


%% 2
masks{1} = [...
     0 -1  0;
    -1  4 -1;
     0 -1  0];
masks{2} = [...
    -1  0  1;
    -2  0  2;
    -1  0  1];
masks{3} = masks{2}';
denominators = get_denominator(masks);
for i = 12 : length(imgs)
    resultsMasks = cellfun(@(m, d) conv2(im2double(imgs{i})/d, m, 'same'), masks, denominators, 'UniformOutput', 0);
    spectralDensityImgs = cellfun(@spectralDensity, [imgs{i}, resultsMasks], 'UniformOutput', 0);
    phaseDensityImgs = cellfun(@phaseDensity, [imgs{i}, resultsMasks], 'UniformOutput', 0);
    show_results([imgs{i}, resultsMasks, spectralDensityImgs, phaseDensityImgs],...
        [{'Org', 'Filter down', 'Filter up 1', 'Filter up 2'},...
        {'Spec org', 'Spec down', 'Spec up 1', 'Spec up 2'},...
        {'Phase org', 'Phase down', 'Phase up 1', 'Phase up 2'}]);
end

