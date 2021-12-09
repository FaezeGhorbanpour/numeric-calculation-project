function result= FixedPoint( F,G,A,x0,step,n)
global steps
global sIndex
syms x
digitsOld = digits(n);
source = vpa(A(1));
dest = vpa(A(2));
f =inline(F,'x');
g = sym(G);
gDiff =diff(g);
mid = vpa((source + dest)/2);

steps(sIndex) = cellstr(strcat('[',char(source),',',char(dest),']'));
sIndex = sIndex+1;
for i = 0:step-1
    steps(sIndex) = cellstr(strcat('........ step =',{' '},num2str(i+1),' ........'));
    sIndex = sIndex+1;
    steps(sIndex) =cellstr( strcat('next x :' , char(mid)));
    sIndex=sIndex + 1;
    temp = abs(subs(gDiff,x,mid));
    if mid > dest || mid <= source || eval(temp) > 1
        steps(sIndex) = cellstr('This function is not correct one');
        sIndex=sIndex+1;
        break;
    else
        steps(sIndex) = cellstr('This point has all conditions');
        sIndex=sIndex+1;
        mid = subs(g,x,mid);
    end
    
end
 result = mid;
 
end

