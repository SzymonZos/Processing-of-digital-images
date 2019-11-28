imgs = {circles, squares, triangles, hands, leafs};    
figure; 
hold on;

for i = 1:length(imgs)
    shapeShapeSeries = imgs{i};
    for j = 1:length(shapeShapeSeries)
        [K(j), ~, M(j)] = imgStats(shapeShapeSeries{j});
    end
    scatter(K, M);
end

xlabel('K');
ylabel('M');