%% 1
circles = {im2bw(imread('img/circle_1_512x512.png')), ...
           im2bw(imread('img/circle_2_512x512.png')), ...
           im2bw(imread('img/circle_3_512x512.png')), ...
           im2bw(imread('img/circle_4_512x512.png')), ...
           im2bw(imread('img/circle_5_512x512.png'))};
squares = {im2bw(imread('img/square_1_512x512.png')), ... 
           im2bw(imread('img/square_2_512x512.png')), ...
           im2bw(imread('img/square_3_512x512.png')), ...
           im2bw(imread('img/square_4_512x512.png')), ...
           im2bw(imread('img/square_6_512x512.png'))};
triangles = {im2bw(imread('img/triangle_1_512x512.png')), ... 
             im2bw(imread('img/triangle_2_512x512.png')), ...
             im2bw(imread('img/triangle_3_512x512.png')), ...
             im2bw(imread('img/triangle_4_512x512.png')), ...
             im2bw(imread('img/triangle_5_512x512.png'))};
hands = {im2bw(imread('img/hand_1_512x512.png')), ... 
         im2bw(imread('img/hand_2_512x512.png')), ...
         im2bw(imread('img/hand_3_512x512.png')), ...
         im2bw(imread('img/hand_4_512x512.png')), ...
         im2bw(imread('img/hand_5_512x512.png'))};
leafs = {im2bw(imread('img/leaf_1_512x512.png')), ... 
         im2bw(imread('img/leaf_2_512x512.png')), ...
         im2bw(imread('img/leaf_3_512x512.png')), ...
         im2bw(imread('img/leaf_4_512x512.png')), ...
         im2bw(imread('img/leaf_5_512x512.png'))};
%% 2 rot   
test_rot = {circles{1}, squares{1}, triangles{1}, hands{1}, leafs{1}};
[Krot, Crot, Mrot] = cellfun(@demoRotStat, test_rot, 'UniformOutput', 0);
%%
figure;
hold on;
for i=1:5
    plot(0:360, Krot{i});
end
title('K rot');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

figure;
hold on;
for i=1:5
    plot(0:360, Crot{i});
end
title('C rot');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

figure;
hold on;
for i=1:5
    plot(0:360, Mrot{i});
end
title('M rot');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

%% 2 trans
test_trans = {circles{1}, squares{1}, triangles{1}, hands{1}, leafs{1}};
[Ktrans, Ctrans, Mtrans] = cellfun(@demoTransStat, test_trans, 'UniformOutput', 0);
%%
figure;
hold on;
for i=1:5
    plot(1:101, Ktrans{i});
end
title('K trans');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

figure;
hold on;
for i=1:5
    plot(1:101, Ctrans{i});
end
title('C trans');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

figure;
hold on;
for i=1:5
    plot(1:101, Mtrans{i});
end
title('M trans');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

%% 2 scale
test_scale = {circles{1}, squares{1}, triangles{1}, hands{1}, leafs{1}};
[Kscale, Cscale, Mscale] = cellfun(@demoScaleStat, test_scale, 'UniformOutput', 0);
%%
figure;
hold on;
for i=1:5
    plot(1:9, Kscale{i});
end
title('K scale');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

figure;
hold on;
for i=1:5
    plot(1:9, Cscale{i});
end
title('C scale');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

figure;
hold on;
for i=1:5
    plot(1:9, Mscale{i});
end
title('M scale');
legend('circles', 'squares', 'triangles', 'hands', 'leafs');

%% 3
visualise_stats({circles, squares, triangles, hands, leafs});

%% 4
unclass = {im2bw(imread('img/circle_7_512x512.png')), ... 
                im2bw(imread('img/square_6_512x512.png')), ...
                im2bw(imread('img/triangle_6_512x512.png')), ...
                im2bw(imread('img/hand_6_512x512.png')), ...
                im2bw(imread('img/leaf_6_512x512.png'))};
            
res(1) = classKnn({circles, squares, triangles, hands, leafs}, circles{2}, 5);
res(2) = classKnn({circles, squares, triangles, hands, leafs}, squares{1}, 5);
res(3) = classKnn({circles, squares, triangles, hands, leafs}, triangles{1}, 5);
res(4) = classKnn({circles, squares, triangles, hands, leafs}, hands{1}, 5);
res(5) = classKnn({circles, squares, triangles, hands, leafs}, leafs{1}, 5);
disp(res);

%% 5
[res(1), scores{1}] = classKnn({circles, squares, triangles, hands, leafs}, unclass{1}, 5);
[res(2), scores{2}] = classKnn({circles, squares, triangles, hands, leafs}, unclass{2}, 5);
[res(3), scores{3}] = classKnn({circles, squares, triangles, hands, leafs}, unclass{3}, 5);
[res(4), scores{4}] = classKnn({circles, squares, triangles, hands, leafs}, unclass{4}, 5);
[res(5), scores{5}] = classKnn({circles, squares, triangles, hands, leafs}, unclass{5}, 5);
disp(res);