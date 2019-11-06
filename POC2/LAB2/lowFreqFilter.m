function imgFiltered = lowFreqFilter(img, frameSize, frame2Size)

img = mat2gray(img);
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

imgFiltered{1} = X;
%squareOutput = ifft2(ifftshift(X));
% Elipse
pw=Ny/2;
ps=Nx/2;
X=fftshift(fft2(img));
for y=1:Ny-1
    for x=1:Nx-1
        componentY=((frame2Size(2)-y)./(frame2Size(2)-frameSize(2))).^2;
        componentX=((frame2Size(1)-x)./(frame2Size(1)-frameSize(1))).^2;
        if sqrt(componentX + componentY)>1
            X(x,y)=0;
        end
    end  
end
imgFiltered{2}=X;

end
