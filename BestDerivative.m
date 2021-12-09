function [result,result2] = BestDerivative ( f, p, d, o, h)
syms 't' 'x'
global steps
global sIndex
%F =inline(f,'x');
%'   '
%steps(sIndex) = cellstr(strcat('BestDerivative,  number of steps=',num2str(n), '   function=', char(F), '    interval = [', num2str(a), ',', num2str(b),']'  ));
%sIndex = sIndex+1;
%f = function
%n = desire point
%d = degree
%o = order
%f = sym(F);
M= diff(f,x);
steps(sIndex) = cellstr(strcat('f''(x) = ',char(M) ));
sIndex = sIndex+1;
% disp(M);
meghdar = subs(M,x,p);
steps(sIndex) = cellstr(strcat('f''(',num2str(p),') = ',char(meghdar) ));
sIndex = sIndex+1;
meghdar = R(eval(meghdar));
steps(sIndex) = cellstr(strcat('       = ',num2str(meghdar) ));
sIndex = sIndex+1;
% disp(meghdar);

if(d == 1)
    if(o ==2)
        b = (subs(f,x,p+h) - subs(f,x,p-h))/(2*h); %central
        b = vpa(b);
        %disp(b);
        c = (-3*subs(f,x,p) + 4*subs(f,x,p+h) - subs(f,x,p+2*h)/(2*h)); %3point
        c = vpa(c);
        %disp(c);
        little = abs(meghdar - b);
        if(abs(meghdar - c) < little)
            javab = c;
        else
            javab = b;
        end
        answer=javab;
    elseif(o==1)
        answer = (subs(f,x,p+h) - subs(f,x,p))/h;%forwarding
    else
        answer = (-subs(f,x,p+2*h) + 8*subs(f,x,p+h) - 8*subs(f,x,p-h) + subs(f,x,p-2*h))/(12*h);%central
        
    end
    
elseif(d==2)
    if(o==2)
        answer = (subs(f,x,p+h) - 2*subs(f,x,p) + subs(f,x,p-h))/(h^2); %central
    elseif(o==4)
        answer = (-subs(f,x,p+2*h) +16*subs(f,x,p+h) -30*subs(f,x,p)+16*subs(f,x,p-h)-subs(f,x,p-2*h))/(12*h^2); %central
        
    end
    
elseif(d==3)
    if(o==2)
        answer = (subs(f,x,p+2*h) - 2*subs(f,x,p+h) + 2*subs(f,x,p-h) - subs(f,x,p-2*h))/(2*h^3);
    elseif(o==4)
        answer= (-subs(f,x,p+3*h) +8*subs(f,x,p+2*h) -13*subs(f,x,p+h) +13*subs(f,x,p-h) -8*subs(f,x,p-2*h) +subs(f,x,p-3*h))/(8*h^3);
    end
    
else
    if(o==2)
        answer = (subs(f,x,p+2*h) - 4*subs(f,x,p+h) + 6*subs(f,x,p) -4* subs(f,x,p-h) +subs(f,x,p-2*h))/(h^4);
    elseif(o==4)
        answer = (-subs(f,x,p+3*h) +12*subs(f,x,p+2*h) -39*subs(f,x,p+h) +56*subs(f,x,p) -39*subs(f,x,p-h) +12*subs(f,x,p-2*h) -subs(f,x,p-3*h))/(6*h^4);
    end
    
end
richardson = ((2^o)*subs(f,x,h/2) - subs(f,x,h) )/((2^o)-1);
%disp(vpa(richardson));
result =R(eval(answer));
result2 =R(eval(richardson));
end