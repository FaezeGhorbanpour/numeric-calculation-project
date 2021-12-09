function result = Simpson13 ( F, interval, h)
syms 'x'
%5 12 15 19 23 30
global steps
global sIndex
a = R(double(interval(1)));
b = R(double(interval(2)));
f =inline(F,'x');
%f = sym(F);
%'   '

n = R((b - a)/h);
steps(sIndex) = cellstr(strcat('n =(',num2str(b), '-', num2str(a), ') / ',num2str(h)));
sIndex = sIndex+1;
ftemp = 0; 
flag = 1;

for j= 1:n+1
    if(j==1)
        ftemp = ftemp + f(a);  
        steps(sIndex) = cellstr(strcat('SumF = f(',num2str(a),') = ',num2str(f(a)), ')'));
        sIndex = sIndex+1;  
    elseif(j == (n+1))
        ftemp = ftemp + f(b); 
        steps(sIndex) = cellstr(strcat('         + (f(',num2str(b),') = ',num2str(f(b)), ')'));
        sIndex = sIndex+1; 
    else
        if(flag == 1)
            l =a+(j-1)*h;
            ftemp = ftemp + 4 * f(l);
            flag = 2;
            steps(sIndex) = cellstr(strcat('         + (4f(',num2str(l),') = ',num2str(f(l)), ')'));
            sIndex = sIndex+1;
        else
            l =a+(j-1)*h;
            ftemp = ftemp + 2 * f(l);
            flag = 1;
            steps(sIndex) = cellstr(strcat('         + (2f(',num2str(l),') = ',num2str(f(l)), ')'));
            sIndex = sIndex+1;            
        end
    end
end

answer = R(h*ftemp/3);
steps(sIndex) = cellstr(strcat('Integral = (h*SumF)/3 = ',num2str(R(h/3)),' * ',num2str(ftemp), ' = ',num2str(answer)));
sIndex = sIndex+1;  

result = R((answer));
end