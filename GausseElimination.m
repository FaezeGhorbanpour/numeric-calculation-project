function X = GausseElimination( A,B )
clear steps sIndex
global p steps sIndex
sIndex = 1;
steps = cell(1,1);

old = digits(p);

steps(sIndex) = cellstr('Gausse Elimination Steps: ');
sIndex = sIndex+1; 

a=[A,B];
[m,n]=size(a);

for j=1:m-1
    flag = 0;
    for z=j:m
        if a(j,j)==0
            flag = 1;
            t=a(j,:);
            a(j,:)=a(z,:);
            a(z,:)=t;
        end
    end
    if flag == 1
        steps(sIndex) = cellstr(strcat('Row Num.(',num2str(z),') with the row Num.(',num2str(j,p),'was substituted'));
        sIndex = sIndex+1; 
    end
    for i=j+1:m
        temp=R(a(i,j)/a(j,j));
        for k=1:n
           a(i,k)=R(a(i,k)-R(a(j,k)*temp));
        end
        steps(sIndex) = cellstr(strcat('Numbers in row Num.(',num2str(j),') subtracted from the row Num.(',num2str(i,p),') '));
        sIndex = sIndex+1; 
    end
        steps(sIndex) = cellstr('Augmented Matrix is: ');
        sIndex = sIndex+1; 
        MatrixToStr(a);
     
end
x=zeros(1,m);
for i=m:-1:1
    c=0;
    for j=2:m
        c=c+R(a(i,j)*x(j));
    end
    x(i)=R(R(a(i,n)-c)/a(i,i));
end
X=x';
end

