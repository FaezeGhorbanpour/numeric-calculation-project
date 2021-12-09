function result = NewtonRaphson( F,A,step,n) 
global steps
global sIndex
digitsOld = digits(n);
syms x
source = vpa(A(1));
f = sym(F);
f1 =diff(f);
for i=0:step-1
            steps(sIndex) = cellstr(strcat('........ step =',{' '},num2str(i+1),' ........'));
            sIndex = sIndex+1;
            steps(sIndex) = cellstr(strcat('point = ', char(source)));
            sIndex = sIndex+1;
            fSource = subs(f,x,source);
            steps(sIndex) = cellstr(strcat('f(point) = ',char(fSource)));
            sIndex = sIndex+1;
            f1Source = vpa(subs(f1,x,source));
            steps(sIndex) = cellstr(strcat('f''(source) = ',char(f1Source)));
            sIndex = sIndex+1;
            new = vpa(source - (fSource / f1Source));
            steps(sIndex) = cellstr(strcat('nextPoint = ',char(new)));
            sIndex = sIndex+1;
            source = new;
end
result = source;
end
