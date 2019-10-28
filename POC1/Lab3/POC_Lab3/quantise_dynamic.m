function img_quant = quantise_dynamic (img, intervals)
   for i=1:size(img,3)
   %{
    img_discretized = discretize(img(:,:,i), intervals{1,i});
    img_quant(:,:,i) = changem(img_discretized, intervals{2,i}, 1:length(intervals{2,i}));
   %}
   img_quant(:,:,i) = discretize(img(:,:,i), intervals{1,i}, intervals{2,i});
   end
end