function output=filtrowanie(img,mask)
imgSize=size(img);
centerMask=floor((size(mask,1))/2);
output = zeros(imgSize(1), imgSize(2));
for i=1+centerMask:imgSize(1)-centerMask
    for j=1+centerMask:imgSize(2)-centerMask
        temp=img(i-centerMask:i+centerMask,j-centerMask:j+centerMask);
        wynik=double(mask.*temp);
        suma=sum(wynik(:));
        srednia=suma/sum(mask(:));
        output(i,j)=srednia;
    end
end
