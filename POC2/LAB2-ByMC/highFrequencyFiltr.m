function [squareOutput, elipseOutput] = highFrequencyFiltr(img, frameSizes)


X=fftshift(fft2(img));
[Nx, Ny] = size(X);
pw=Ny/2;
ps=Nx/2;
%Square

for y=1:2*frameSizes(2)-1
    for x=1:2*frameSizes(1)-1
       X(ps+x-frameSizes(1), pw+y-frameSizes(2))=0;
    end  
end
squareOutput=X;

%Elipse?
X=fftshift(fft2(img));
for y=1:Ny-1
    for x=1:Nx-1
        componentY = ((pw-y)/(frameSizes(2)))^2;
        componentX = ((ps-x)/(frameSizes(1)))^2;
        if sqrt(componentX + componentY)<1
            X(x,y)=0;
        end
    end  
end
elipseOutput=X;

end