function result = NFC(n,o,y)
% n=5;
% o=[5;7;9;11;13];
% y=[3;4;1;3;6];
syms 'r' 'ri' 'x'

a = zeros(n,1);
a(1) = y(floor(n/2)+1);

for i=1:n-1
   for j=1:n-i
       g(j)= y(j+1)-y(j);
   end
   y = g;
   a(i+1)=g(floor((n-i)/2)+1);
end

 %disp(a)
 
adad = zeros(n-1,1);
adad(1) = 0; 
for i=1:n-2
    if(adad(i) >= 0)
        adad(i+1)= (-1)*(adad(i)+1);   
    end
    if(adad(i) < 0)
        adad(i+1) = (-1) *adad(i);
    end
end

%disp(adad)

sum=0;
answer=1;

for i=1:n
    javab=1;
    for j = 1:i-1
        javab = (subs(r+ri,ri,adad(j)))*javab/j;
    end
    answer = (a(i)* javab);
    sum=sum+ answer;
end
%disp(sum)

sum = subs(sum,r,(x-o(floor(n/2)+1))/(o(2)-o(1)));

s = sym2poly(sum);
m = size(s,2);
final=0;
for i=1:m-1
    final = s(i)*(x^(m-i))+final;
    
end
final = final + s(m);

result = final;
%disp(sum)
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
end