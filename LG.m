function result = LG(n,o,y)
syms 'x' 'b'
% y=[-3,0,5,12,32];
% o=[0,1,2,3,5];
% n=size(y,2);
% disp(n)
%answer=1;
sum=1;
for i=1:n 
    d=o(i);
    answer=1;
    for j = 1:n
        if i ~= j
            answer=subs(x-b,b,o(j))*answer;
            answer=answer/(d-o(j));
        end
    end
    sum=answer*y(i)+sum;
    
    
    
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


