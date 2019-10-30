function output= highPassFilter(img, mask)
    
centerMask=floor((size(mask,1))/2);
    imgSize = size(img);
    
    output = zeros(imgSize(1), imgSize(2));
    
    for i = 1+centerMask : imgSize(1) - centerMask
        for j = 1+centerMask : imgSize(2) - centerMask
            minor = img(i-centerMask : i+centerMask, j-centerMask : j+centerMask);
            maskedImg = double(minor).*mask;
            output(i,j) = sum(maskedImg(:));
        end
    end

end