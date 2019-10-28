function Y = psnr(oryginal,przerobka,przestrzen)
[N]=size(oryginal);
Nx=N(1);
Ny=N(2);
if strcmp(przestrzen,'hsv') == 1
    oryginal = double(oryginal);
    przerobka = przerobka * 255;
else
    oryginal = double(oryginal);
    przerobka = double(przerobka);
end
suma_a = 0;
suma_b = 0;
suma_c = 0;
for i=1:Nx
    for j=1:Ny
        suma_a = suma_a + (oryginal(i,j,1)-przerobka(i,j,1))^2;
        suma_b = suma_b + (oryginal(i,j,2)-przerobka(i,j,2))^2;
        suma_c = suma_c + (oryginal(i,j,3)-przerobka(i,j,3))^2;
    end
end
suma = suma_a + suma_b + suma_c;
RMSE = sqrt(suma/(3*Nx*Ny));
Y = 20*log10(255/RMSE);