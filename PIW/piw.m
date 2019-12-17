% This script uses the k-means function on an example with randomly created
% data points in 2D and visualaizes its result.

close all; clear; clc;

%% Input args (and print them)

k = 2;     % number of clusters
numP = 300; % number of points
xMax = 100; % x between 0 and xMax
yMax = 100; % y between 0 and yMax

am = 10;

for i=1:am
   clusters{i} = i+1;
   points{i} = 50*i;
end

for i=1:am
simulate(clusters{i},points{i},100,100)
end
