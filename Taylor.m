function [Y] = Taylor(f,x0,y0,h,step,n)
format long
syms x y
Y(1)=y0;
xx=x0:h:x0+h*step;
fp(1)=diff('y',y)*f;
for j=2:n
        fp(j)= diff(fp(j-1),x)+diff(fp(j-1),y)*fp(1);
end 
for i=1:step
    Y(i+1)=Y(i);
    for j=1:n
       Y(i+1)=Y(i+1)+eval(subs(fp(j),[x,y],[xx(i),Y(i)])*(h^j)/factorial(j));
         Y(i+1)=R(Y(i+1));
    end 

end