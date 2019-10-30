function images= comparisonImage(img)
imgSize = size(img);

img = mat2gray(img);
img = uint8(img*255);

fft2Img = zeros(imgSize(1),imgSize(2));
fft2Img = fft2(img);


psImg = log(1+abs(fftshift(fft2Img)));
psImg = mat2gray(psImg);
psImg = uint8(psImg*255);


freqImg = angle(fftshift(fft2Img));
%freqImg = angle(fft2Img);
freqImg = mat2gray(freqImg);
freqImg = uint8(freqImg*255);

images{1} = img;
images{2} = psImg;
images{3} = freqImg;

end

