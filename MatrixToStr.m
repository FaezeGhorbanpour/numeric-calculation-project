function MatrixToStr( A )
global steps sIndex p

[m,n] = size(A);
for i=1:m
    s = '';
    for j=1:n
        if j == 1
            s=strcat(s,num2str(A(i,j)));
        else
            s=strcat(s,'  ,  ',num2str(A(i,j),p));
        end
    end
     steps(sIndex) = cellstr(strcat('[  ',s,'  ]'));
     sIndex = sIndex+1; 
end
     
end

