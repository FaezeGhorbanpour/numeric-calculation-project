function [y] = Adams3(f,x0, y0,h,step)
format long
x=x0:h:x0+h*step;
y=Runge_Kutta4(f,x0, y0,h,step);
for i=step:step
    ys(i+1)=y(i)+h/12*(23*f(x(i),y(i))-16*f(x(i-1),y(i-1))+5*f(x(i-2),y(i-2)));
    y(i+1)=y(i)+h/12*(5*f(x(i+1),ys(i+1))+8*f(x(i),y(i))-f(x(i-1),y(i-1)));
             y(i+1)=R(y(i+1));
end
end