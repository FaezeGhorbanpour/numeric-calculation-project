function f_answer = curve1(X, Y)

p = zeros(1, 2);

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
f_answer = vpa(a);

end