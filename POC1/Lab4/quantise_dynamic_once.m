function img_quant = quantise_dynamic_once (img, intervals)
   img_quant = discretize(img, intervals{1}, intervals{2});
end