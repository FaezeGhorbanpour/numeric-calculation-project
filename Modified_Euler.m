function [Y ] = Modified_Euler(f,x0, y0,h,step)
format long
x=x0:h:x0+h*step;
Y(1)=y0;
for i=1:step
    k1=h*f(x(i),Y(i));
    k2=h*f(x(i+1),Y(i)+k1);
    Y(i+1)=Y(i)+0.5*(k1+k2);
      Y(i+1)=R(Y(i+1));
end
end