function Y = interpolacja_czerwony_niebieski(I) 
[Nx, Ny] = size(I); 
Y = uint8(zeros(Nx,Ny)); 
for i=2:1:Nx-1     
    for j=2:1:Ny-1         
        M = I(i-1:i+1,j-1:j+1);         
        if M(2,2)==0              
            if M(2,3)~=0                
                Y(i,j) = round(sum(M(:))/2);             
            elseif M(3,2)~=0                 
                Y(i,j) = round(sum(M(:))/2);             
            else
                Y(i,j) = round(sum(M(:))/4);             
            end
        else
            Y(i,j) = M(2,2);         
        end
    end
end
end