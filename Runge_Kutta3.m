function [Y] = Runge_Kutta3(f,x0, y0,h,step)
format long
Y(1)=y0;
for i=1:step
    k1=h*f(x0+(i-1)*h,Y(i));
    k2=h*f(x0+(i-1)*h+h/2,Y(i)+k1/2);
    k3=h*f(x0+i*h,Y(i)+2*k2-k1);   
    Y(i+1)=Y(i)+1/6*(k1+4*k2+k3);
      Y(i+1)=R(Y(i+1));
end
end