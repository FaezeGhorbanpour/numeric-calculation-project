function [y,z] = secondEuler(f,g,x0, y0,z0,h,step)
format long
x=x0:h:x0+h*step;
y(1)=y0;
z(1)=z0;
for i=1:step
   y(i+1)=h*f(x(i),y(i),z(i));
   z(i+1)=h*g(x(i),y(i),z(i));
     y(i+1)=R(y(i+1));
     z(i+1)=R(z(i+1));
end
end