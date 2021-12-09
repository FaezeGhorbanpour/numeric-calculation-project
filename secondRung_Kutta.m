function [y,z] = secondRung_Kutta(f,g,x0, y0,z0,h,step)
format long
x=x0:h:x0+h*step;
y(1)=y0;
z(1)=z0;
for i=1:step
    kf1 = f(x(i),y(i),z(i));
    kg1 = g(x(i),y(i),z(i));
    kf2 = f(x(i)+h/2,y(i)+h/2*kf1,z(i)+h/2*kg1);
    kg2 = g(x(i)+h/2,y(i)+h/2*kf1,z(i)+h/2*kg1);
    kf3 = f(x(i)+h/2,y(i)+h/2*kf2,z(i)+h/2*kg2);
     kg3 = g(x(i)+h/2,y(i)+h/2*kf2,z(i)+h/2*kg2);
    kf4 = f(x(i)+h,y(i)+h*kf3,z(i)+h*kg3);
    kg4 = g(x(i)+h,y(i)+h*kf3,z(i)+h*kg3);
   y(i+1)=y(i)+ h/6*(kf1+2*kf2+2*kf3+kf4);
   z(i+1)=z(i)+ h/6*(kg1+2*kg2+2*kg3+kg4);
        y(i+1)=R(y(i+1));
     z(i+1)=R(z(i+1));

end
end