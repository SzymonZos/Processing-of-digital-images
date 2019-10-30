function img = generateGauss2D(sizes, params)
    img = zeros(sizes);
    halveSize = max(sizes / 2);
    for i = 1 : sizes(1)
        for j = 1 : sizes(2)
            img(i,j) = normpdf(norm([i - halveSize, j - halveSize]), params(1), params(2));
        end
    end
    img = uint8(img*((halveSize-1)/max(max(img))));
end