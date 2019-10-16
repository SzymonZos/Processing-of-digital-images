function Y = najblizszego_sasiada(I) 
[Nx, Ny] = size(I); 
Y = uint8(zeros(Nx,Ny)); 
for i=1:1:(Nx-1)     
    for j=1:1:(Ny-1)       
        M = I(i:i+1,j:j+1);         
        if M(1,1)==0             
            if M(2,1)~=0                     
                Y(i,j) = M(2,1);                 
            elseif M(1,2)~=0                     
                Y(i,j) = M(1,2);                
            elseif M(2,2)~=0                   
                Y(i,j) = M(2,2);      
            end
        else
            Y(i,j) = I(i,j);      
        end
    end 
end