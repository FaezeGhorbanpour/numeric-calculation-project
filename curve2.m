function f_answer = curve2(X, Y)
p = zeros(1, 3);

syms 'x'
%  p2(x)=a0 + a1x + a2x^2
A2 = zeros(3, 3);

B1 = zeros(2, 1);
B1(1, 1) = sum(Y);
B1(2, 1) = sum(X.*Y);

B2 = zeros(3, 1);
B2(1:2, 1) = B1;
for i= 1:3
    for j= 1:3
        A2(i, j) = sum(X.^(i+j-2));
    end
end
B2(3, 1) = sum(X.*X.*Y);
 
p(1, 1:3 ) = A2\B2;
b = p(1, 1) + p(1, 2)*x + p(1, 3)*x*x;
f_answer = vpa(b);

end