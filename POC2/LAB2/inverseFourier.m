function img = inverseFourier(spectral)
    img{2} = ifft2(ifftshift(spectral));
    img{1} = uint8(255*mat2gray(log(1+abs(img{2}))));
end