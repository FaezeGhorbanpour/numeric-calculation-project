function result = Romberg  ( f, interval, n)
%8 12 22 27 31 36
syms 'x'
global steps
global sIndex
a = R(double(interval(1)));
b = R(double(interval(2)));
F =inline(f,'x');
%'   '
steps(sIndex) = cellstr(strcat('Romberg,  number of steps=',num2str(n), '   function=', char(f), '    interval = [', num2str(a), ',', num2str(b),']'  ));
sIndex = sIndex+1;
h = zeros(n+1 , 1);
h(1) = b - a;
steps(sIndex) = cellstr(strcat('h(1) = ',num2str(b),' - ',num2str(a),' = ',num2str(h(1))));
    sIndex = sIndex+1;
for i=2:n+1
   h(i) = h(i-1)/2;
   steps(sIndex) = cellstr(strcat('h(',num2str(i),') = ',num2str(h(i-1)),'/2 = ', num2str(h(i))));
    sIndex = sIndex+1;
end

T = zeros(n+1 , 1);
T(1) = h(1)*(subs(f,x,b)+subs(f,x,a))/2;
steps(sIndex) = cellstr(strcat('T(1) = ',num2str(h(1)),' * ( f(',num2str(b),' + f(',num2str(a),')/2 = ', num2str(T(1))));
sIndex = sIndex+1;

A = zeros(n+1 , 1);
A(1)=2;

for i=2:(n+1)
   ftemp = 0; 
   for j= 1:(2*A(i-1)-1)
       if(j==1)
           ftemp = ftemp + subs(f,x,a);
           steps(sIndex) = cellstr(strcat('SumF += f(',num2str(a),') = ',char(subs(f,x,a)), ')'));
            sIndex = sIndex+1;
       end
       if(j == (2*A(i-1)-1))

           ftemp = ftemp + subs(f,x,b); 
            steps(sIndex) = cellstr(strcat('         + (f(',num2str(b),') = ',char(subs(f,x,b)), ')'));
        sIndex = sIndex+1; 
       end
       if(j~=1 && j ~= (2*A(i-1)-1) )
           l =a+(j-1)*h(i);
           ftemp = ftemp + 2 * subs(f,x,(l));
            steps(sIndex) = cellstr(strcat('         + (2f(',num2str(l),') = ',char(subs(f,x,(l))), ')'));
            sIndex = sIndex+1;
       end
   end
   A(i)= (2*A(i-1)-1);
   T(i) = (h(i)*ftemp)/2;
   steps(sIndex) = cellstr(strcat('T(',num2str(i),') = (',num2str(h(i)),' * ',char(ftemp),')/2 = ', num2str(T(i))));
sIndex = sIndex+1;
end

for i=1:n
   for j=1:n-i+1
       T(j)=R(R(4^i*T(j+1)-T(j))/(4^i-1));
   end
   
end
answer =R(T(j));
result = answer;
end