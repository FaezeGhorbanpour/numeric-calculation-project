function [L,V] = Eigen( A )
clear steps sIndex
global p steps sIndex
sIndex = 1;
steps = cell(1,1);
olg = digits(p);
steps(sIndex) = cellstr('Steps for finding eigenvalues and eignevectors : ');
sIndex = sIndex+1; 
syms y
[m,n]=size(A);
eqn = det(A-y*eye(m));
L=eval(solve(eqn,y));
V=zeros(m);
for i=1:m
    L(i)=R(L(i));
end

steps(sIndex) = cellstr(strcat('After solving |A-yI|= ',char(eqn),'  we get eignevalues = '));
sIndex = sIndex+1; 
MatrixToStr(L');

for i=1:m
    a=A-L(i)*eye(m);
    b=[0;0];
for j=1:m-1
    for z=j:m
        if a(j,j)==0
            t=a(j,:);
            a(j,:)=a(z,:);
            a(z,:)=t;
        end
    end
    for z=j+1:m
        temp=R(a(z,j)/a(j,j));
        for k=1:n
           a(z,k)=R(a(z,k)-R(a(j,k)*temp));
        end
    end
end
b(m)=a(m,m);
X=(a^-1)*b;
tem=X(1);
for j=1:m
    X(j)=R(X(j)/tem);
end

steps(sIndex) = cellstr(strcat('EigenVector corresponding y = ',num2str(L(i),p),' after setting x0 = 1 is :'));
sIndex = sIndex+1; 
MatrixToStr(X');

V(:,i)=X;
end
L=L';

end

