function flag = Check( A )
[m,n]=size(A);
flag = 1;
for i=1:m
    if 2*abs(A(i,i)) <= sum(abs(A(i,:)))
        flag = 0;
        return
    end
end
end


