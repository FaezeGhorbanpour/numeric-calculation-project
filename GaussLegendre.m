function result = GaussLegendre ( f, interval,n)
syms 't' 'x'
global steps
global sIndex
a = R(double(interval(1)));
b = R(double(interval(2)));
F =inline(f,'x');
%'   '
steps(sIndex) = cellstr(strcat('GaussLegendre,  number of steps=',num2str(n), '   function=', char(F), '    interval = [', num2str(a), ',', num2str(b),']'  ));
sIndex = sIndex+1;

newx = R((b-a)/2)*t+R((b+a)/2);
steps(sIndex) = cellstr(strcat('newX=(',num2str(b), '-', num2str(a), ')/2 * t + (',num2str(b), '-', num2str(a), ')/2'  ));
sIndex = sIndex+1;
steps(sIndex) = cellstr(strcat('-> newX=',char(newx)  ));
sIndex = sIndex+1;
dx = R((b-a)/2);
f = subs(f, x, newx);
steps(sIndex) = cellstr(strcat('f(newX)=',char(f)));
sIndex = sIndex+1;
f = f*dx;
m = n;
q = sym('x',[1,m+1]);
q(1) = '1';
q(2) = 'x';
steps(sIndex) = cellstr('P(1) = 1 , P(2) = x');
sIndex = sIndex+1;
for i= 2:m
    q(i+1)=((2*i-1)*x*q(i)-(i-1)*q(i-1))/i;
    steps(sIndex) = cellstr(strcat('P(',num2str(i+1),') = ((2 * ',num2str(i-1),') * x * P(',num2str(i),') - (',num2str(i-1),') * P(',num2str(i-1),')) / ',num2str(i)));
    sIndex = sIndex+1;
end

roots = solve(q(m+1),x);
w = zeros(1, m);
pr = diff(q(m+1), x);
for i= 1:m
    temp = pr;
    w(i)=2 / ( (1 - roots(i)^2)* (subs(temp, x, roots(i)))^2 );
    steps(sIndex) = cellstr(strcat('W(',num2str(i),') = 2/((1 - ',char(roots(i)),'^2) * (P''',num2str(i),'(',char(roots(i)),')^2)'));
    sIndex = sIndex+1;
    steps(sIndex) = cellstr(strcat('-> W(',num2str(i),') = ',num2str(w(i))));
    sIndex = sIndex+1;
end

s=0;
for i= 1:m
    temp = f;
    s = s + w(i)*subs(temp, t, roots(i));
end
result = R(eval(s));
end