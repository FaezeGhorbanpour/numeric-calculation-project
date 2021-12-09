function [y] = Adams4(s,f,x0, y0,h,step)
format long
x=x0:h:x0+h*step;
y=Taylor(s,x0,y0,h,step,5)
for i=step:step
    ys(i+1)=y(i)+h/24*(55*f(x(i),y(i))-59*f(x(i-1),y(i-1))+37*f(x(i-2),y(i-2))-9*f(x(i-3),y(i-3)));
    y(i+1)=y(i)+h/24*(9*f(x(i+1),ys(i+1))+19*f(x(i),y(i))-5*f(x(i-1),y(i-1))+f(x(i-2),y(i-2)));
         y(i+1)=R(y(i+1));
end
end