function result = NBC(n,o,y)
% n=3;
% o=[5;7;9];
% y=[3;4;1];


syms 'r' 'ri' 'x' 'xi'

a = zeros(n,1);
if(rem(n,2) == 0)
    a(1)=y(n/2);
end
if(rem(n,2) ~= 0)
    a(1) = y(floor(n/2)+1);
end

for i=1:n-1
   for j=1:n-i
       g(j)= y(j+1)-y(j);
   end
   y = g;
   if(rem(n-i,2) == 0)
    a(i+1)=g((n-i)/2);
   end
   if(rem(n-i,2) ~= 0)
    a(i+1) = g(floor((n-i)/2)+1);
   end
   
end

 %disp(a)
 
adad = zeros(n-1,1);
adad(1) = 0; 
for i=1:n-2
    if(adad(i) > 0)
        adad(i+1)= (-1)*adad(i);   
    end
    if(adad(i) <= 0)
        adad(i+1) = (-1) *adad(i)+1;
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

if(rem(n,2) == 0)
    l=o(n/2);
end
if(rem(n,2) ~= 0)
    l = o(floor(n/2)+1);
end

sum = subs(sum,r,(x-l)/(o(2)-o(1)));

s = sym2poly(sum);
m = size(s,2);
final=0;
for i=1:m-1
    final = s(i)*(x^(m-i))+final;
    
end
final = final + s(m);

result = final;
end
%sum = sym2poly(sum);
% disp(sum)
% m = size(sum,2);
% final=0;
% for i=m-1:0
%     final = sum(m-i)*subs(x^xi,xi,i)+final;
%     disp(final)
% end



% x1=min(o);
% x2=max(o);
% dx=x2-x1;
% 
% x=x1:dx/1000:x2;
% figure
% plot(x,sum)