function [class, scores] = classKnn(imgs, unknown, k)
    numOfShapes = length(imgs);
    ind = 1;
    
    [unknownStats(1), ~, unknownStats(2)] = imgStats(unknown);

    for i = 1:numOfShapes
        shapeShapeSeries = imgs{i};
        for j = 1:length(shapeShapeSeries)
            [knownStats(1), ~, knownStats(2)] = imgStats(shapeShapeSeries{j});
            scores(ind, 1:2) = [i, sum(abs(knownStats - unknownStats) ... 
                                    ./ abs(knownStats + unknownStats))];
            ind = ind + 1;
        end
    end
    
    scores = sortrows(scores, 2);
    kscores = scores(1:k, 1);
    class = mode(kscores);
end
