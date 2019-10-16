function stala_paleta16
[nz,s]=uigetfile('*.bmp','Wybierz obraz:');
obraz=imread([s,nz]);
[N]=size(obraz);
Nx=N(1);
Ny=N(2);

obraz_RGB(:, :, 1) = floor(obraz(:, :, 1)/64)*64;  
obraz_RGB(:, :, 2) = floor(obraz(:, :, 2)/128)*128;
obraz_RGB(:, :, 3) = floor(obraz(:, :, 3)/128)*128;

psnr1 = psnr(obraz,obraz_RGB,'RGB');
disp(['PSNR obrazu RGB dla kwantyzacji na 16 barw wynosi: ', num2str(psnr1)])
imwrite(obraz_RGB, '_RGB_16(1).bmp');

%HSV1 2x3x2+4
hsv_org = rgb2hsv(obraz);
hsv1=hsv_org;
for i=1:Nx
    for j=1:Ny
        %warstwa1
        if(hsv1(i,j,1)<0.5)
            hsv1(i,j,1) = 0.4;
        end
        if(hsv1(i,j,1)>=0.5)
            hsv1(i,j,1) = 0.7;
        end
        %warstwa2
         if(hsv1(i,j,2)<0.25)
            hsv1(i,j,2) = 0.2;
        end
        if(hsv1(i,j,2)>=0.25 && hsv1(i,j,2)<0.5)
            hsv1(i,j,2) = 0.4;
        end
        if(hsv1(i,j,2)>=0.5 && hsv1(i,j,2)<0.75)
            hsv1(i,j,2) = 0.6;
        end
         if(hsv1(i,j,2)>=0.75)
            hsv1(i,j,2) = 0.8;
        end
        %warstwa3
        if(hsv1(i,j,3)<0.5)
            hsv1(i,j,3) = 0.4;
        end
        if(hsv1(i,j,3)>=0.5)
            hsv1(i,j,3) = 0.7;
        end
    end
end
hsv1=hsv2rgb(hsv1);
psnr1 = psnr(obraz,hsv1,'hsv');
disp(['PSNR obrazu HSV1 dla kwantyzacji na 256 barw wynosi: ', num2str(psnr1)])
imwrite(hsv1,'_HSV1_16(1).bmp');

%HSV2 3x2x2+4
hsv2=hsv_org;
for i=1:Nx
    for j=1:Ny
        %warstwa1
        if(hsv2(i,j,1)<0.33)
            hsv2(i,j,1) = 0.2;
        end
        if(hsv2(i,j,1)>=0.33 && hsv2(i,j,2)<0.66)
            hsv2(i,j,1) = 0.5;
        end
        if(hsv2(i,j,1)>=0.66)
            hsv2(i,j,1) = 0.8;
        end
        %warstwa2
        if(hsv2(i,j,2)<0.5)
            hsv2(i,j,2) = 0.4;
        end
        if(hsv2(i,j,2)>=0.5)
            hsv2(i,j,2) = 0.8;
        end
        %warstwa3
        if(hsv2(i,j,3)<0.5)
            hsv2(i,j,3) = 0.4;
        end
        if(hsv2(i,j,3)>=0.5)
            hsv2(i,j,3) = 0.8;
        end   
    end
end
hsv2=hsv2rgb(hsv2);
psnr1 = psnr(obraz,hsv2,'hsv');
disp(['PSNR obrazu HSV2 dla kwantyzacji na 256 barw wynosi: ', num2str(psnr1)]);
imwrite(hsv2, '_HSV2_16(1).bmp');


I1 = 'HSV.bmp';
I2 = '_HSV1_16.bmp';
I3 = '_HSV1_256.bmp';
I4 = 'HSV(1).bmp';
I5 = '_HSV1_16(1).bmp';
I6 = '_HSV1_256(1).bmp';
% I2 = '_HSV2_16.bmp'
% I4 = obraz_RGB;
% I5 = hsv1;
% I6 = hsv2;
% I1='_RGB_16.bmp';
% I2='_HSV1_16.bmp';
% I3='_HSV2_16.bmp';
% 
subplot(2,3,1), imshow(I1), title('R1 PSNR')
subplot(2,3,2), imshow(I2), title('2x4x2 PSNR 11.3778')
subplot(2,3,3), imshow(I3), title('4x8x8 PSNR 26.785') 
subplot(2,3,4), imshow(I4), title('R2')
subplot(2,3,5), imshow(I5), title('2x4x2 PSNR 11.5013')
subplot(2,3,6), imshow(I6), title('4x8x8 PSNR 27.1175')
