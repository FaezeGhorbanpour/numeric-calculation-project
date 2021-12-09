function f_answer = polynomial3(X, Y)

p = zeros(1,4);

syms 'x'
%  p3(x)=a0 + a1x + a2x^2 + a3x^3
A3 = zeros(4, 4);
B3 = zeros(4, 1);
B3(1,1) = sum(Y);
B3(2, 1) = sum(X.*Y);
B3(3, 1) = sum(X.*X.*Y);
for i= 1:4
    for j= 1:4
        A3(i, j) = sum(X.^(i+j-2));
    end
end
B3(4, 1) = sum(X.*X.*X.*Y);
 
p(7, : ) = A3\B3;
g = p(7, 1) + p(7, 2)*x + p(7, 3)*x*x + p(7, 4)*x*x*x;

f_answer = g;

end