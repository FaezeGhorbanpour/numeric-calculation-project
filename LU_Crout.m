function X = LU_Crout( A,B )
clear steps sIndex
global p steps sIndex
sIndex = 1;
steps = cell(1,1);


steps(sIndex) = cellstr('Crout`s Method steps : ');
sIndex = sIndex+1; 

old = digits(p);
[m,n]=size(A);
 L = zeros(m);
 U = zeros(m);
for j=1:m
    for z=j:m
        if A(j,j)==0
            t=A(j,:);
            s=B(j);
            B(j)=B(z);
            B(z)=s;
            A(j,:)=A(z,:);
            A(z,:)=t;
        end
    end
end
 for j = 1:m
     for i = 1:m
         sum = 0;
         for k = 1:j-1
             sum = sum+R(L(i,k)*U(k,j));
         end
         if i == j
             U(i,j)=1;
         end
         if i >= j 
             L(i,j)= R(A(i,j)-sum); 
         else
             U(i,j)=R(R(1/L(i,i))*R(A(i,j)-sum));
         end
     end
 end
  
steps(sIndex) = cellstr('L : ');
sIndex = sIndex+1; 
MatrixToStr(L);
steps(sIndex) = cellstr('U : ');
sIndex = sIndex+1; 
MatrixToStr(U);

LB = [L,B];
Y=zeros(1,m);
for s=1:m
    c=0;
    for k=1:s
        c=c+R(LB(s,k)*Y(k));
    end
    Y(s)=R(R(LB(s,m+1)-c)/LB(s,s));
end

steps(sIndex) = cellstr('Y : ');
sIndex = sIndex+1; 
MatrixToStr(Y);

Y=Y';
X=zeros(1,m);
UY=[U,Y];
for s=m:-1:1
    c=0;
    for k=2:m
        c=c+R(UY(s,k)*X(k));
    end
    X(s)=R(R(UY(s,m+1)-c)/UY(s,s));
end

steps(sIndex) = cellstr('X : ');
sIndex = sIndex+1; 
MatrixToStr(X);
X=X';

end

