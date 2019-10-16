function img_quant = quantise_2_bits_once(img, varargin)
    img_quant = floor(double(img)/128)*255;
end