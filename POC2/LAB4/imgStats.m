function [K, C, M] = imgStats(img)
    S = bwarea(img);
    L = bwperim(img);
    L = sum(L(:));
    
    K = 4 * pi * S / L^2;
    C = 2 * sqrt(S / pi);
    M = L / (2 * sqrt(pi * S)) - 1;
end