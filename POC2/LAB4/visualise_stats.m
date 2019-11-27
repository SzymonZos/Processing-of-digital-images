function visualise_stats(imgs)
    figure; 
    hold on;
    for i = 1:length(imgs)
       shapeShapeSeries = imgs{i};
       for j = 1:length(shapeShapeSeries)
            [K(j), C(j), M(j)] = imgStats(shapeShapeSeries{j});
       end
       scatter3(K, C, M);
    end
    hold off;
    view(45, 45);
    xlabel('K'); ylabel('C1'); zlabel('M');
    legend('Circles', 'Squares', 'Triangles', 'Hands', 'Leaves');
end