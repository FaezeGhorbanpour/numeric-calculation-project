function f_answer = curve5(X, Y)

p = zeros(1, 2);
A1 = zeros(2, 2);
B1 = zeros(2, 1);

syms 'x'
%y = a*ln(x) + b -> Y = a1*X + a0, a1=a, a0=b, X=ln(x)

newX2 = log(X);
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(newX2.^(i+j-2));
    end
end
B1(1, 1) = sum(Y);
B1(2, 1) = sum(newX2.*Y);

p(1, 1:2 ) = A1\B1;
d = p(1, 1) + p(1, 2)*log(x);
f_answer = vpa(d);

end