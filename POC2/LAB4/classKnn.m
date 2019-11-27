function class = classKnn(imgs, unknown, k)
    numOfShapes = length(imgs);
    ind = 1;
    
    unknownStats = imgStats(unknown);

    for i = 1:numOfShapes
        shapeShapeSeries = imgs{i};
        for j = 1:length(shapeShapeSeries)
            knownStats = imgStats(shapeShapeSeries{j});
            scores(ind, 1:2) = [i, sum(abs(knownStats - unknownStats) ... 
                                    ./ abs(knownStats + unknownStats))];
            ind = ind + 1;
        end
    end
    
    scores = sortrows(scores, 2);
    kscores = scores(k, 1);
    class = mode(kscores);
end
