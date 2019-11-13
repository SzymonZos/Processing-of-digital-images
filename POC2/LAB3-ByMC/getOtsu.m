
function [level, out] = getOtsu(img)
level = graythresh(img);
out = im2bw(img, level);

end
