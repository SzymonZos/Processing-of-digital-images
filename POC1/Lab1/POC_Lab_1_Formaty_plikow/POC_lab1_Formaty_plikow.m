clear
Color_photo = imread('./Sample pictures/Color_photo.bmp');
Color_chart = imread('./Sample pictures/Color_chart.bmp');

imwrite(Color_photo, 'Color_photo_light_compression.jpg', 'jpg', 'quality', 80);
imwrite(Color_chart, 'Color_chart_light_compression.jpg', 'jpg', 'quality', 80);

imwrite(Color_photo, 'Color_photo_coarse_compression.jpg', 'jpg', 'quality', 10);
imwrite(Color_chart, 'Color_chart_coarse_compression.jpg', 'jpg', 'quality', 10);

imwrite(Color_photo, 'Color_photo_light_compression.j2k', 'j2k', 'CompressionRatio', 50);
imwrite(Color_chart, 'Color_chart_light_compression.j2k', 'j2k', 'CompressionRatio', 50);

imwrite(Color_photo, 'Color_photo_coarse_compression.j2k', 'j2k', 'CompressionRatio', 500);
imwrite(Color_chart, 'Color_chart_coarse_compression.j2k', 'j2k', 'CompressionRatio', 500);

imwrite(Color_photo, 'Color_photo.png', 'png');
imwrite(Color_chart, 'Color_chart.png', 'png');

[imind, cm] = rgb2ind(Color_photo, 256); 
imwrite(imind, cm, 'Color_photo.gif', 'gif');
[imind, cm] = rgb2ind(Color_chart, 256); 
imwrite(imind, cm, 'Color_chart.gif', 'gif');

Color_photo_lc_jpg = imread('Color_photo_light_compression.jpg');
Color_chart_lc_jpg = imread('Color_chart_light_compression.jpg');
Color_photo_cc_jpg = imread('Color_photo_coarse_compression.jpg');
Color_chart_cc_jpg = imread('Color_chart_coarse_compression.jpg');
Color_photo_lc_j2k = imread('Color_photo_light_compression.j2k');
Color_chart_lc_j2k = imread('Color_chart_light_compression.j2k');
Color_photo_cc_j2k = imread('Color_photo_coarse_compression.j2k');
Color_chart_cc_j2k = imread('Color_chart_coarse_compression.j2k');
Color_photo_png = imread('Color_photo.png');
Color_chart_png = imread('Color_chart.png');
[Color_photo_gif, cmap] = imread('Color_photo.gif');
Color_photo_gif = ind2rgb(Color_photo_gif, cmap);
[Color_chart_gif, cmap] = imread('Color_chart.gif');
Color_chart_gif = ind2rgb(Color_chart_gif, cmap);


figure
photoJoinUpperRow = cat(2, Color_photo,Color_photo_lc_jpg, Color_photo_cc_jpg, Color_photo_lc_j2k);
photoJoinLowerRow = cat(2, Color_photo_cc_j2k, Color_photo_png, im2uint8(Color_photo_gif), 0 * Color_photo);
imshow(cat(1, photoJoinUpperRow, photoJoinLowerRow))
legend('Source \n Jpg light compression \n Jpg coarse compression \n Jpg2000 light compression \n Jpg2000 coarse compression \n Png \n Gif');

figure
chartJoinUpperRow = cat(2, Color_chart,Color_chart_lc_jpg, Color_chart_cc_jpg, Color_chart_lc_j2k);
chartJoinLowerRow = cat(2, Color_chart_cc_j2k, Color_chart_png, im2uint8(Color_chart_gif), 0 * Color_chart);
imshow(cat(1, chartJoinUpperRow, chartJoinLowerRow))
legend('Source \n Jpg light compression \n Jpg coarse compression \n Jpg2000 light compression \n Jpg2000 coarse compression \n Png \n Gif');

figure
chartJoinUpperRow = cat(2, imcrop(Color_photo,[300 100 100 100]),imcrop(Color_photo_lc_jpg,[300 100 100 100]), imcrop(Color_photo_cc_jpg,[300 100 100 100]), imcrop(Color_photo_lc_j2k,[300 100 100 100]));
chartJoinLowerRow = cat(2, imcrop(Color_photo_cc_j2k,[300 100 100 100]), imcrop(Color_photo_png,[300 100 100 100]), im2uint8(imcrop(Color_photo_gif,[300 100 100 100])), 0 * imcrop(Color_photo,[300 100 100 100]));
imshow(cat(1, chartJoinUpperRow, chartJoinLowerRow))
legend('Source \n Jpg light compression \n Jpg coarse compression \n Jpg2000 light compression \n Jpg2000 coarse compression \n Png \n Gif');
figure(3)

figure
chartJoinUpperRow = cat(2, imcrop(Color_chart,[200 500 250 200]),imcrop(Color_chart_lc_jpg,[200 500 250 200]), imcrop(Color_chart_cc_jpg,[200 500 250 200]), imcrop(Color_chart_lc_j2k,[200 500 250 200]));
chartJoinLowerRow = cat(2, imcrop(Color_chart_cc_j2k,[200 500 250 200]), imcrop(Color_chart_png,[200 500 250 200]), im2uint8(imcrop(Color_chart_gif,[200 500 250 200])), 0 * imcrop(Color_chart,[200 500 250 200]));
imshow(cat(1, chartJoinUpperRow, chartJoinLowerRow))
legend('Source \n Jpg light compression \n Jpg coarse compression \n Jpg2000 light compression \n Jpg2000 coarse compression \n Png \n Gif');

psnrSizes = 1 : 5;
psnrPlot = 1 : 5;

figure
for i = 1 : 5
    imgPath = strcat('./Comparison Jpeg/Color_photo_compression', num2str(i), '.jpg');
    imwrite(Color_photo, imgPath, 'jpg', 'quality', 2 * i * i);
    temp = imread(imgPath);
    file = dir(imgPath);
    psnrSizes(i) = file.bytes;
    psnrPlot(i) = psnr(temp, Color_photo);
end

subplot(2, 2, 1); plot(psnrSizes, psnrPlot, '-o');
grid on;

for i = 1 : 5
    imgPath = strcat('./Comparison Jpeg/Color_chart_compression', num2str(i), '.jpg');
    imwrite(Color_chart, imgPath, 'jpg', 'quality', 2 * i * i);
    temp = imread(imgPath);
    file = dir(imgPath);
    psnrSizes(i) = file.bytes;
    psnrPlot(i) = psnr(temp, Color_chart);
end

subplot(2, 2, 2); plot(psnrSizes, psnrPlot, '-o');
grid on;

for i = 1 : 5
    imgPath = strcat('./Comparison Jpeg2000/Color_photo_compression', num2str(i), '.j2k');
    imwrite(Color_photo, imgPath, 'j2k', 'CompressionRatio', 2 * i * i);
    temp = imread(imgPath);
    file = dir(imgPath);
    psnrSizes(i) = file.bytes;
    psnrPlot(i) = psnr(temp, Color_photo);
end

subplot(2, 2, 3); plot(psnrSizes, psnrPlot, '-o');
grid on;

for i = 1 : 5
    imgPath = strcat('./Comparison Jpeg2000/Color_chart_light_compression', num2str(i), '.j2k');
    imwrite(Color_chart, imgPath, 'j2k', 'CompressionRatio', 50 * i);
    temp = imread(imgPath);
    file = dir(imgPath);
    psnrSizes(i) = file.bytes;
    psnrPlot(i) = psnr(temp, Color_chart);
end

subplot(2, 2, 4); plot(psnrSizes, psnrPlot, '-o');
grid on;