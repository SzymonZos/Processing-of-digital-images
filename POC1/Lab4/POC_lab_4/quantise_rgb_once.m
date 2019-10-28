function img_quant = quantise_rgb_once(img, space, varargin)
    img_quant = floor(double(space/256*double(max(min(img,255), 0))))*256/space+256/(2*space);
end