function flag = isSymetric(A)
[m,n]=size(A);
flag = 1;
for i=1:m
   if A(i,:) ~= (A(:,i))'
       flag = 0;
       return
   end
end
[~,p]=chol(A);
if p ~=0
    flag = 0;
    return
end


end

