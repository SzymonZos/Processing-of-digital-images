function spectralDensityImg = spectralDensity(img)
    spectralDensityImg = log(1+abs(fftshift(fft2(img))));
end