function phaseDensityImg = phaseDensity(img)
    phaseDensityImg = mat2gray(angle(fftshift(fft2(img))));
end