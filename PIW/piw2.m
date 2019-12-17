clc;
clear all;
close all;


img1 = imread('baboon.bmp');  %% insert the path to your image here
img2 = imread('lena.bmp');



% K =3;
iter = 50;

%% K = 3
K = 5;
[Cost3K] = KMeansIm(K,img1,iter);

%% Cost plot
figure();
plot(Cost3K);
grid on;
xlabel('Iteration Count'); ylabel('Cost');
legend('K=3','K=5','K=7');
