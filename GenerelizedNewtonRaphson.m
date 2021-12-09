function result = GenerelizedNewtonRaphson(interval,f,step,n)
global steps
global sIndex
digitsOld = digits(n);
x0 = vpa(interval);
z = size(f);
N= z(1);
x = sym('x', [1,N]);
for i= 1:N
    for j=1:N
        J(i,j) = diff( f(i),x(j));
    end
end
s = step;
temp1 = char(J);
steps(sIndex) = cellstr(strcat('J= ',temp1(9:end-2) ));
 sIndex = sIndex+1;
xx = x0; % load initial guess
while (step>0)
    steps(sIndex) = cellstr(strcat('........ step =',{' '},num2str(s-step+1),' ........'));
 sIndex = sIndex+1;
 JJ = subs(J,x,xx);
 temp1 = char(JJ);
 temp2 = char(xx);
 steps(sIndex) = cellstr(strcat('J(',temp2(9:end-2),') = '));
 sIndex = sIndex+1;
 steps(sIndex) = cellstr(strcat(temp1(9:end-2)));
 sIndex = sIndex+1;
 DDi =(inv(JJ)*subs(f,x,xx))';
 xn = vpa(xx - DDi);
 temp1 = char(DDi);
 steps(sIndex) = cellstr(strcat('new x= ',temp2(9:end-2),'-',temp1(9:end-2)));
 sIndex = sIndex+1;
 temp2 = char(xn);
 steps(sIndex) = cellstr(strcat('= ',temp2(9:end-2)));
 sIndex = sIndex+1;
 step = step - 1;
 xx = xn;
end;
result = xn;
end
% end function