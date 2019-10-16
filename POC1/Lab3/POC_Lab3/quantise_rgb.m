function img_quant = quantise_rgb(img, space, varargin)

    for i=1:size(img,3)
        img_quant(:,:,i) = uint8(floor(double(space(i)/256*double(img(:,:,i))))*256/space(i)+256/(2*space(i)));
        %img_quant(:,:,3) = floor((img(:,:,3))/64)*64+32;
    end
end