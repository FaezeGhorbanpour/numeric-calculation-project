function f_answer = curve6(X, Y)

p = zeros(1, 2);
A1 = zeros(2, 2);
B1 = zeros(2, 1);

syms 'x'
%y = 1/(ax+b) -> Y = a1*X + a0, a1=a, a0=b, Y=1/y
newY1 = 1./Y;
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(X.^(i+j-2));
    end
end
B1(1, 1) = sum(newY1);
B1(2, 1) = sum(X.*newY1);

p(1, 1:2 ) = A1\B1;
e = 1/(p(1, 1) + p(1, 2)*x);
f_answer = vpa(e);

end