

function [out, level] = getBinarization(img, levelIn)
level = levelIn;

out = im2bw(img, level);
end
