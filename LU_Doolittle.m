function X = LU_Doolittle( A,B )
clear steps sIndex
global p steps sIndex
sIndex = 1;
steps = cell(1,1);

steps(sIndex) = cellstr('Doolittle`s Method steps : ');
sIndex = sIndex+1; 

old = digits(p);
[m,n]=size(A);
L=zeros(m,m);
U=zeros(m,m);
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
for s=1:m
  for k=1:s-1
    L(s,k)=A(s,k);
    for j=1:k-1
        L(s,k)= R(L(s,k)-R(L(s,j)*U(j,k)));
    end
    L(s,k) = R(L(s,k)/U(k,k));
  end
  for k=s:m
    U(s,k) = A(s,k);
    for j=1:s-1
        U(s,k)= R(U(s,k)-R(L(s,j)*U(j,k)));
    end
  end
end
for s=1:m
    L(s,s)=1;
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
    sum=0;
    for k=1:s
        sum=sum+R(LB(s,k)*Y(k));
    end
    Y(s)=R(R(LB(s,m+1)-sum)/LB(s,s));
end

steps(sIndex) = cellstr('Y : ');
sIndex = sIndex+1; 
MatrixToStr(Y);

Y=Y';
X=zeros(1,m);
UY=[U,Y];
for s=m:-1:1
    sum=0;
    for k=2:m
        sum=sum+R(UY(s,k)*X(k));
    end
    X(s)=R(R(UY(s,m+1)-sum)/UY(s,s));
end

steps(sIndex) = cellstr('X : ');
sIndex = sIndex+1; 
MatrixToStr(X);

X=X';

end

