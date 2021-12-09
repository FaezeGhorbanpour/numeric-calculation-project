function [Y] = Euler(f,x0,y0,h,step)
format long
syms x y
dfs(1) = symfun(f, [x y]);                      
df = matlabFunction(symfun(dfs,[x y]));                                                
X = zeros(1,step+1);
Y = zeros(1,step+1);
X(1) = x0;
Y(1) = y0;
for j=1:step
  xj = X(j);
  yj = Y(j);
  D = df(xj,yj);                          
  Y(j+1) = yj+h*D(1);
  X(j+1) = x0 + h*j;
  Y(j+1)=R(Y(j+1));
  X(j+1)=R(X(j+1));
end
end
