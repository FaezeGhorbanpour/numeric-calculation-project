function f_answer = curve7(X, Y)

p = zeros(1, 2);
A1 = zeros(2, 2);
B1 = zeros(2, 1);

syms 'x'
%y = a*(e^b*x) -> ln(y) = b*x + ln(a), a1=b, a0=ln(a), Y=ln(y)
newY2 = log(Y);
for i= 1:2
    for j= 1:2
        A1(i, j) = sum(X.^(i+j-2));
    end
end
B1(1, 1) = sum(newY2);
B1(2, 1) = sum(X.*newY2);

p(1, 1:2 ) = A1\B1;
h = exp(p(1,1))*(exp(p(1,2)*x));
f_answer = vpa(h);

end