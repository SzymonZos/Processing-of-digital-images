function filteredPixel = filterLUM(imgSubMatrix, k)
    [imgSubMatrix_X, imgSubMatrix_Y] = size(imgSubMatrix); 
    medianIndex = ceil(imgSubMatrix_X * imgSubMatrix_Y / 2);
    imgSubMatrix_X0 = imgSubMatrix(medianIndex);
    imgSubMatrix = sort(imgSubMatrix);
    imgSubMatrix_L = imgSubMatrix(medianIndex - k);
    imgSubMatrix_U = imgSubMatrix(medianIndex + k);
    filteredPixel = median([imgSubMatrix_X0, imgSubMatrix_L, imgSubMatrix_U]);
end
