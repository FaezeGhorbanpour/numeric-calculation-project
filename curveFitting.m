function f_answer = curveFitting(X, Y)


n = size(X, 1);
E = zeros(1, 8);
rms = zeros(1, 8);
p = zeros(8, 4);

syms 'x'
% p1(x)=a0 + a1x
A1 = zeros(2, 2);
B1 = zeros(2, 1);
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(X.^(i+j-2));
    end
end
B1(1, 1) = sum(Y);
B1(2, 1) = sum(X.*Y);

p(1, 1:2 ) = A1\B1;
a = p(1, 1) + p(1, 2)*x; 


for i= 1:n
    E(1) = E(1) + (Y(i) - subs(a, x, X(i)))^2;
end

%  p2(x)=a0 + a1x + a2x^2
A2 = zeros(3, 3);
B2 = zeros(3, 1);
B2(1:2, 1) = B1;
for i= 1:3
    for j= 1:3
        A2(i, j) = sum(X.^(i+j-2));
    end
end
B2(3, 1) = sum(X.*X.*Y);
 
p(2, 1:3 ) = A2\B2;
b = p(2, 1) + p(2, 2)*x + p(2, 3)*x*x;


for i= 1:n
    E(2) = E(2) + (Y(i) - subs(b, x, X(i)))^2;
end

%y = a/x + b -> Y = a1*X + a0, a1=a, a0=b, X=1/x
newX1 = 1./X;
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(newX1.^(i+j-2));
    end
end
B1(1, 1) = sum(Y);
B1(2, 1) = sum(newX1.*Y);

p(3, 1:2 ) = A1\B1;
c = p(3, 1) + p(3, 2)/x;

for i= 1:n
    E(3) = E(3) + (Y(i) - subs(c, x, X(i)))^2;
end

%y = a*ln(x) + b -> Y = a1*X + a0, a1=a, a0=b, X=ln(x)
newX2 = log(X);
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(newX2.^(i+j-2));
    end
end
B1(1, 1) = sum(Y);
B1(2, 1) = sum(newX2.*Y);

p(4, 1:2 ) = A1\B1;
d = p(4, 1) + p(4, 2)*log(x);

for i= 1:n
    E(4) = E(4) + (Y(i) - subs(d, x, X(i)))^2;
end

%y = 1/(ax+b) -> Y = a1*X + a0, a1=a, a0=b, Y=1/y
newY1 = 1./Y;
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(X.^(i+j-2));
    end
end
B1(1, 1) = sum(newY1);
B1(2, 1) = sum(X.*newY1);

p(5, 1:2 ) = A1\B1;
e = 1/(p(5, 1) + p(5, 2)*x);

for i= 1:n
    E(5) = E(5) + (Y(i) - subs(e, x, X(i)))^2;
end

%y = 1/(ax+b)^2  -> Y = a1*X + a0, a1=a, a0=b, Y=sqrt(1/y)
newY2 = sqrt(1./Y);
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(X.^(i+j-2));
    end
end
B1(1, 1) = sum(newY2);
B1(2, 1) = sum(X.*newY2);

p(6, 1:2 ) = A1\B1;
f = 1/(p(6, 1) + p(6, 2)*x)^2;

for i= 1:n
    E(6) = E(6) + (Y(i) - subs(f, x, X(i)))^2;
end

%  p3(x)=a0 + a1x + a2x^2 + a3x^3
A3 = zeros(4, 4);
B3 = zeros(4, 1);
B3(1:3, 1) = B2;
for i= 1:4
    for j= 1:4
        A3(i, j) = sum(X.^(i+j-2));
    end
end
B3(4, 1) = sum(X.*X.*X.*Y);
 
p(7, : ) = A3\B3;
g = p(7, 1) + p(7, 2)*x + p(7, 3)*x*x + p(7, 4)*x*x*x;

for i= 1:n
    E(7) = E(7) + (Y(i) - subs(g, x, X(i)))^2;
end

%y = a*(e^b*x) -> ln(y) = b*x + ln(a), a1=b, a0=ln(a), Y=ln(y)
newY2 = log(Y);
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(X.^(i+j-2));
    end
end
B1(1, 1) = sum(newY2);
B1(2, 1) = sum(X.*newY2);

p(8, 1:2 ) = A1\B1;
h = exp(p(8,1))*(exp(p(8,2)*x));

for i= 1:n
    E(8) = E(8) + (Y(i) - subs(h, x, X(i)))^2;
end

for i= 1:8
    rms(i) = (E(i)/n)^0.5;
end    

m = min(rms);
idx = 0;
for i = 1:5
   if rms(i)== m
       idx = i;
       break;
   end    
end 

if idx==1
    answer=a;
end

if idx==2
    answer=b;
end

if idx==3
    answer=c;
end

if idx==4
    answer=d;
end

if idx==5
    answer=e;
end

if idx==6
    answer=f;
end

if idx==7
    answer=g;
end

if idx==8
    answer=h;
end
f_answer = answer;

end