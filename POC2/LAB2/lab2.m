clear all
close all

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
imgs{i+3} = generateGauss2D([512, 512], [0, 150]); titles{i+3} = num2str(i+3);

spectralDensityImgs = cellfun(@spectralDensity, imgs, 'UniformOutput', 0);
phaseDensityImgs = cellfun(@phaseDensity, imgs, 'UniformOutput', 0);

show_results(imgs, titles);
show_results(spectralDensityImgs, titles);