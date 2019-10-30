

clear all
close all

imgs{1} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\linie1.png');
imgs{2} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\linie2.png');
imgs{3} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\linie3.png');

imgs{4} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\kolo1.png');
imgs{5} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\kolo2.png');
imgs{6} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\kolo3.png');

imgs{7} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\trojkat1.png');
imgs{8} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\trojkat2.png');
imgs{9} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\trojkat3.png');

imgs{10} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\gauss1.png');
imgs{11} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\gauss2.png');

imgs{12} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\sin1.png');
imgs{13} = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\sin2.png');

    for i = 1:length(imgs)
       figure
       images = comparisonImage(imgs{i});
       imshow([images{1} images{2} images{3}], []);
    end
