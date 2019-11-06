function imgFiltered = highFreqFilter(img, frameSizes)
img=mat2gray(img);

imgFiltered{1} = fftshift(fft2(img));
imgFiltered{2} = imgFiltered{1};
[size_X, size_Y] = size(imgFiltered{1});
halveSize_Y = size_Y/2;
halveSize_X = size_X/2;

%Square
imgFiltered{1}(halveSize_X - frameSizes(1) + (1:(2*frameSizes(1)-1)), halveSize_Y - frameSizes(2) + (1:(2*frameSizes(2)-1))) = 0;

%Elipse

for y=1:size_Y-1
    for x=1:size_X-1
        componentY = ((halveSize_Y-y)/(frameSizes(2)))^2;
        componentX = ((halveSize_X-x)/(frameSizes(1)))^2;
        if sqrt(componentX + componentY)<1
            imgFiltered{2}(x,y)=0;
        end
    end  
end

end