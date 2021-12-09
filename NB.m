function result = NB(n,o,y)

syms 'r' 'ri' 'x'

a = zeros(n,1);
a(1) = y(n);

for i=1:n-1
   for j=1:n-i
       g(j)= y(j+1)-y(j);
   end
   y = g;
   a(i+1)=g(n-i);
end

%disp(a)

sum=0;
answer=1;

for i=1:n
    javab=1;
    for j = 1:i-1
        javab = (subs(r+ri,ri,j-1))*javab/j;
    end
    answer = (a(i)* javab);
    sum=sum+ answer;
end
%disp(sum)
sum = subs(sum,r,(x-o(n))/(o(2)-o(1)));

s = sym2poly(sum);
m = size(s,2);
final=0;
for i=1:m-1
    final = s(i)*(x^(m-i))+final;
    
end
final = final + s(m);

result = final;
end

% sum = sym2poly(sum);
% disp(sum)
% 
% x1=min(o);
% x2=max(o);
% dx=x2-x1;
% 
% x=x1:dx/1000:x2;
% 
% figure
% plot(x,sum)