function f_answer = curve3(X, Y)
p = zeros(1, 4);

syms 'x'
%  p3(x)=a0 + a1x + a2x^2 + a3x^3
A3 = zeros(4, 4);

B1 = zeros(2, 1);
B1(1, 1) = sum(Y);
B1(2, 1) = sum(X.*Y);

B2 = zeros(3, 1);
B2(1:2, 1) = B1;
B2(3, 1) = sum(X.*X.*Y);

B3 = zeros(4, 1);
B3(1:3, 1) = B2;
for i= 1:4
    for j= 1:4
        A3(i, j) = sum(X.^(i+j-2));
    end
end
B3(4, 1) = sum(X.*X.*X.*Y);
 
p(1, 1:4 ) = A3\B3;
g = p(1, 1) + p(1, 2)*x + p(1, 3)*x*x + p(1, 4)*x*x*x;
f_answer = vpa(g);

end