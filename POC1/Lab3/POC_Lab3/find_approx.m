function img_quant = find_approx(img, approx)
img_quant = zeros(size(img));
for i=1:size(img,1)
    for j=1:size(img,2)
        [~, img_quant(i,j)] = min(abs(img(i,j)-approx));
    end
end
img_quant = changem(img_quant, approx, 1:length(approx));
end