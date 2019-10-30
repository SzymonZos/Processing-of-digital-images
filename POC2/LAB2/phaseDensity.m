function phaseDensityImg = phaseDensity(img)
    phaseDensityImg = angle(fftshift(fft2(img)));
end