function f_answer = curve4(X, Y)

p = zeros(1, 2);

syms 'x'
%y = a/x + b -> Y = a1*X + a0, a1=a, a0=b, X=1/x
A1 = zeros(2, 2);
B1 = zeros(2, 1);
newX1 = 1./X;
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(newX1.^(i+j-2));
    end
end
B1(1, 1) = sum(Y);
B1(2, 1) = sum(newX1.*Y);

p(1, 1:2 ) = A1\B1;
c = p(1, 1) + p(1, 2)/x;
f_answer = vpa(c);

end