function result = ND(n,o,y)
% n = 6;
% o =[1 ;2 ;3 ;4 ;5 ;6];
% y =[-3; 0; 15; 48;105;192];
syms 'x'  'xi' 

a = zeros(n,1);
a(1) = y(1);
%f = y;
%g = f;
for i=1:n-1
   for j=1:n-i
       g(j)=(y(j)-y(j+1))/(o(j)-o(j+i));
   end
   y = g;
   a(i+1)=g(1);
end

%disp(a);

% p = a(n);
% for i=2:n
%     p = p*(subs(x-xi, xi, o(n-i+1))) + a(n-i+1);
% end
% disp(p);
sum=0;
answer=1;

for i=1:n
    javab=1;
    for j = 1:i-1
        javab = (subs(x-xi,xi,o(j)))*javab;
    end
    %disp(javab)
    answer = a(i)* javab;
    sum=sum+ answer;
end

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
% m= size(sum,2);
% disp(m)
% 
% x1=min(o);
% x2=max(o);
% dx=x2-x1;
% 
% x=x1:dx/1000:x2;
% 
% figure
% plot(x,sum)





