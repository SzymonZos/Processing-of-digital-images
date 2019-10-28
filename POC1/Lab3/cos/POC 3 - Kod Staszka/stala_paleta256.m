function stala_paleta256
[nz,s]=uigetfile('*.bmp','Wybierz obraz:');
obraz=imread([s,nz]);
[N]=size(obraz);
Nx=N(1);
Ny=N(2);

obraz_RGB(:, :, 1) = floor(obraz(:, :, 1)/32)*32;  
obraz_RGB(:, :, 2) = floor(obraz(:, :, 2)/32)*32;
obraz_RGB(:, :, 3) = floor(obraz(:, :, 3)/64)*64;

psnr1 = psnr(obraz,obraz_RGB,'RGB');
disp(['PSNR obrazu RGB dla kwantyzacji na 256 barw wynosi: ', num2str(psnr1)])
imwrite(obraz_RGB, '_RGB_256.bmp');

%HSV1
hsv_org = rgb2hsv(obraz);
hsv1=hsv_org;
for i=1:Nx
    for j=1:Ny
            %wartwa1  4
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
            %wartwa2
         if(hsv1(i,j,2)<0.125)
            hsv1(i,j,2) = 0.12;
        end
        if(hsv1(i,j,2)>=0.125 && hsv1(i,j,2)<0.250)
            hsv1(i,j,2) = 0.24;
        end
         if(hsv1(i,j,2)>=0.250 && hsv1(i,j,2)<0.375)
            hsv1(i,j,2) = 0.36;
         end
         if(hsv1(i,j,2)>=0.375 && hsv1(i,j,2)<0.5)
            hsv1(i,j,2) = 0.48;
         end
           if(hsv1(i,j,2)>=0.5 && hsv1(i,j,2)<0.625)
            hsv1(i,j,2) = 0.6;
           end
           if(hsv1(i,j,2)>=0.625 && hsv1(i,j,2)<0.75)
            hsv1(i,j,2) = 0.72;
            end
          if(hsv1(i,j,2)>=0.75 && hsv1(i,j,2)<0.875)
            hsv1(i,j,2) = 0.86;
          end
         if(hsv1(i,j,2)>=0.875)
            hsv1(i,j,2) = 0.98;
         end
    end
end


            %wartwa3
                     if(hsv1(i,j,2)<0.125)
            hsv1(i,j,2) = 0.12;
        end
        if(hsv1(i,j,2)>=0.125 && hsv1(i,j,2)<0.250)
            hsv1(i,j,2) = 0.24;
        end
         if(hsv1(i,j,2)>=0.250 && hsv1(i,j,2)<0.375)
            hsv1(i,j,2) = 0.36;
         end
         if(hsv1(i,j,2)>=0.375 && hsv1(i,j,2)<0.5)
            hsv1(i,j,2) = 0.48;
         end
           if(hsv1(i,j,2)>=0.5 && hsv1(i,j,2)<0.625)
            hsv1(i,j,2) = 0.6;
           end
           if(hsv1(i,j,2)>=0.625 && hsv1(i,j,2)<0.75)
            hsv1(i,j,2) = 0.72;
            end
          if(hsv1(i,j,2)>=0.75 && hsv1(i,j,2)<0.875)
            hsv1(i,j,2) = 0.86;
          end
         if(hsv1(i,j,2)>=0.875)
            hsv1(i,j,2) = 0.98;
         end
hsv1=hsv2rgb(hsv1);
psnr1 = psnr(obraz,hsv1,'hsv');
disp(['PSNR obrazu HSV1 dla kwantyzacji na 256 barw wynosi: ', num2str(psnr1)])
imwrite(hsv1, '_HSV1_256.bmp');

%HSV2
hsv2=hsv_org;
hsv2(:, :, 1) = round(hsv2(:, :, 1)*360);
hsv2(:, :, 2) = round(hsv2(:, :, 2)*200);
for i=1:Nx
    for j=1:Ny
            %wartwa1
            if(hsv2(i,j,1)<30)
                hsv2(i,j,1) = 15;
            end
            if(hsv2(i,j,1)>=30 && hsv2(i,j,1)<60)
                hsv2(i,j,1) = 45;
            end
            if(hsv2(i,j,1)>=60 && hsv2(i,j,1)<90)
                hsv2(i,j,1) = 75;
            end
            if(hsv2(i,j,1)>=90 && hsv2(i,j,1)<120)
                hsv2(i,j,1) = 105;
            end
            if(hsv2(i,j,1)>=120 && hsv2(i,j,1)<150)
                hsv2(i,j,1) = 135;
            end
            if(hsv2(i,j,1)>=150 && hsv2(i,j,1)<180)
                hsv2(i,j,1) = 165;
            end
            if(hsv2(i,j,1)>=180 && hsv2(i,j,1)<210)
                hsv2(i,j,1) = 195;
            end
            if(hsv2(i,j,1)>=210 && hsv2(i,j,1)<240)
                hsv2(i,j,1) = 225;
            end
            if(hsv2(i,j,1)>=240 && hsv2(i,j,1)<270)
                hsv2(i,j,1) = 255;
            end
            if(hsv2(i,j,1)>=270 && hsv2(i,j,1)<300)
                hsv2(i,j,1) = 285;
            end
            if(hsv2(i,j,1)>=300 && hsv2(i,j,1)<330)
                hsv2(i,j,1) = 315;
            end
            if(hsv2(i,j,1)>=330)
                hsv2(i,j,1) = 345;
            end
            %warstwa2
            if hsv2(i,j,2)<50
                hsv2(i,j,2) = 25;
            end
            if(hsv2(i,j,2)>=50 && hsv2(i,j,2)<100)
                hsv2(i,j,2) = 75;
            end
            if(hsv2(i,j,2)>=100 && hsv2(i,j,2)<150)
                hsv2(i,j,2) = 125;
            end
            if hsv2(i,j,2)>=150
                hsv2(i,j,2) = 175;
            end
            %warstwa3
            if(hsv2(i,j,3)<0.2)
                hsv2(i,j,3) = 0.1;
            end
            if(hsv2(i,j,3)>=0.2 && hsv2(i,j,3)<0.4)
                hsv2(i,j,3) = 0.3;
            end
            if(hsv2(i,j,3)>=0.4 && hsv2(i,j,3)<0.6)
                hsv2(i,j,3) = 0.5;
            end
            if(hsv2(i,j,3)>=0.6 && hsv2(i,j,3)<0.8)
                hsv2(i,j,3) = 0.7;
            end
            if(hsv2(i,j,3)>=0.8)
                hsv2(i,j,3) = 0.9;
            end
    end
end
hsv2(:, :, 1) = hsv2(:, :, 1)/360;
hsv2(:, :, 2) = hsv2(:, :, 2)/200;
hsv2=hsv2rgb(hsv2);
psnr1 = psnr(obraz,hsv2,'hsv');
disp(['PSNR obrazu HSV2 dla kwantyzacji na 256 barw wynosi: ', num2str(psnr1)]);
imwrite(hsv2, '_HSV2_256.bmp');