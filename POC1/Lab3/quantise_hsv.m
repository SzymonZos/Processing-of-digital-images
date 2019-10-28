function img_quant = quantise_hsv(img, space, varargin)
    for i=1:size(img,3)
        img_quant(:,:,i) = min(floor(space(i)*(img(:,:,i)))/space(i)+1/(2*space(i)), 1-1/(2*space(i)));
    end
end