function img = generateSin2D(sizes, params)
    img = zeros(sizes);
    quarterSize = max(sizes / 4);
    for i = 1 : sizes(1)
        for j = 1 : sizes(2)
            img(i,j) = uint8(quarterSize - 1 + quarterSize * sin(i/params(1) + j/params(2)));
        end
    end
end