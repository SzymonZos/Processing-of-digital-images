function filteredImg = abstractFilter(img, maskSize, filterType, varargin)
    img = double(img);
    filteredImg = img;

    [img_X, img_Y, img_Z] = size(img); 
    mask_X = maskSize(1); mask_Y = maskSize(2);

    margin_X = floor(mask_X/2);
    margin_Y = floor(mask_Y/2);
    
    if ~isempty(varargin)
        img_Z = 1;
    end
    
    for k = 1 : img_Z
        for i = 1 + margin_X : img_X - margin_X
            for j = 1 + margin_Y : img_Y - margin_Y
                imgSubMatrix = img(i - margin_X : i + margin_X, j - margin_X : j + margin_X, k);
                imgSubMatrix = reshape(imgSubMatrix, 1, []);
                filteredImg(i,j,k) = filterType(imgSubMatrix);
            end
        end
    end
    filteredImg = uint8(filteredImg);
end
