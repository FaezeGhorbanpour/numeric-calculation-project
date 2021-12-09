x = sym('x', [1,2]);
f= [(4/25)*x1^2+(4/9)*x2^2-1; x2-x1^2+2*x1-2]
for i= 1:2
    for j=1:2
        J(i,j) = diff( f(i),x(j));
    end
end
a = char(J)
a(8:end-1)