function spectralDensityImg = spectralDensity(img)
    img = mat2gray(img);
    temp = fftshift(fft2(img));
    spectralDensityImg = mat2gray(log(1+abs(temp)));   
end