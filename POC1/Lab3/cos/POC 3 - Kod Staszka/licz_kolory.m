function [czas,liczba_kolorow]=licz_kolory(obraz, przestrzen)
start=clock;
[N]=size(obraz);
Nx=N(1);
Ny=N(2);
Nxy=Nx*Ny;
kolor=zeros(1,Nxy);

if strcmp(przestrzen,'HSV') == 1
    obraz=obraz*255;
    obraz=double(obraz);
else
    obraz=double(obraz);
end

k=1;
for i=1:Nx
    for j=1:Ny
         kolor(k)=65536*obraz(i,j,1)+256*obraz(i,j,2)+obraz(i,j,3);
         k=k+1;
    end
end
kolor_sort=sort(kolor);
liczba_kolorow=1;
for i=2:size(kolor_sort,2)
    if kolor_sort(i) ~= kolor_sort(i-1)
        liczba_kolorow=liczba_kolorow+1;
    end
end
stop=clock;
czas=etime(stop,start);