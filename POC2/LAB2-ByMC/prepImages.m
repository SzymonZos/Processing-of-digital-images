%function prepImages()
clear all
close all
%%sinusoidy
f=[3 50]; 


dire= [21 35];

for k=1:2
    for i = 1:512
         for j=1:512
         a(i,j,k)=uint8(128+127*sin(i/f(k)+j/dire(k)));
         end
    end
end
figure                     
subplot(1,2,1)
imshow(a(:,:,1));
subplot(1,2,2)
imshow(a(:,:,2));

imwrite(a(:,:,1), 'C:\Users\michal\Desktop\POC\POC_@\obrazki\sin1.png');
imwrite(a(:,:,2), 'C:\Users\michal\Desktop\POC\POC_@\obrazki\sin2.png');

var1=20;
var2=50;
var3=70;

%% Gauss

for i=1:512
    for j=1:512
        gauss1(i,j)= normpdf( norm([i-256 j-256]), 0,20);
        gauss2(i,j)= normpdf( norm([i-256 j-256]), 0,60);
    end
end
gauss1=uint8(gauss1*(255/max(max(gauss1))));
gauss2=uint8(gauss2*(255/max(max(gauss2))));

figure                     
subplot(1,2,1)
imshow(gauss1);
subplot(1,2,2)
imshow(gauss2);

imwrite(gauss1, 'C:\Users\michal\Desktop\POC\POC_@\obrazki\gauss1.png');
imwrite(gauss2, 'C:\Users\michal\Desktop\POC\POC_@\obrazki\gauss2.png');

%end