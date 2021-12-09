function [a,b] = Diagnol( A,B )
global p

old = digits(p);
a=[A,B];
[m,n]=size(a);
x=zeros(m,n);
y=zeros(m,1);
for j=1:m
    for z=j:m
        if a(j,j)==0
            t=a(j,:);
            a(j,:)=a(z,:);
            a(z,:)=t;
        end
    end
end
for j=1:m-1
    for z=2:m
        if a(j,j)==0
            t=a(1,:);a(1,:)=a(z,:);
            a(z,:)=t;
        end
    end
    for i=j+1:m
        temp = R((a(i,j)/a(j,j)));
        for k = 1:n
        a(i,k)=R(a(i,k)-R(a(j,k)*temp));
        end
        if 2*abs(a(i,i)) > sum(abs(a(i,1:m))) && y(i) == 0
            x(i,:)=a(i,:);
            y(i)=1;
        end
    end
    
end
for j=m:-1:2
    for i=j-1:-1:1
        if i==1
            a(i,:)
        end
        temp=R(a(i,j)/a(j,j));
        for k=1:n
        a(i,k)=R(a(i,k)-R(a(j,k)*temp));
        end
        if 2*abs(a(i,i)) > sum(abs(a(i,1:m))) && y(i) == 0
            x(i,:)=a(i,:);
            y(i)=1;
        end
    end
end
b=x(:,n);
a=x(:,1:m);
end

