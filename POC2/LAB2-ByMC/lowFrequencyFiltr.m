function [squareOutput, elipseOutput] = lowFrequencyFiltr(img, frameSize)

X=fftshift(fft2(img));
[Nx, Ny] = size(X);

%Square

for x=1:Nx-1
    for y=1:frameSize-1
       X(x,y)=0;
       X(x,Ny-1-y)=0;
       
    end  
end

for x=1:frameSize-1
    for y=1:Ny-1
       X(x,y)=0;
       X(Nx-1-x,y)=0;
       
    end  
end

squareOutput = ifft2(ifftshift(X));
% Elipse
pw=Ny/2;
ps=Nx/2;
X=fftshift(fft2(img));
for y=1:Ny-1
    for x=1:Nx-1
        componentY=((pw-y)/(pw-frameSize))^2;
        componentX=((ps-x)/(ps-frameSize))^2;
        if sqrt(componentX + componentY)>1
            X(x,y)=0;
        end
    end  
end
elipseOutput=X;

end
