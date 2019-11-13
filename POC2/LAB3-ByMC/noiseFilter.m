
function out = noiseFilter(img,mask)

maskCenter = floor((size(mask,1))/2);

imgSizes = size(img);
out = zeros(imgSizes(1), imgSizes(2));
for i=1+maskCenter:imgSizes(1)-maskCenter
    for j=1+maskCenter:imgSizes(2)-maskCenter
        imgSection = img(i-maskCenter : i+maskCenter , j-maskCenter : j+maskCenter);
        filtered = double(mask*imgSection);
        average = sum(filtered(:)) / sum(mask(:));
        out(i,j) = average;
    end
end
out=uint8(out);
out=out(maskCenter+20:imgSizes(1)-maskCenter-20, maskCenter+20:imgSizes(2)-maskCenter-20);

end