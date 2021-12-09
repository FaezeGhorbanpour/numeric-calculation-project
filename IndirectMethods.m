
function X = IndirectMethods(type,A,B,X0,step)
clear steps sIndex
global p steps sIndex
sIndex = 1;
steps = cell(1,1);

if(type==1)
    steps(sIndex) = cellstr('Jacobi Method steps : ');
else
    steps(sIndex) = cellstr('Gauss-Seidel Method steps : ');
end
sIndex = sIndex+1; 
steps(sIndex) = cellstr('Stricly Diagnoal Matrix is : ');
sIndex = sIndex+1; 
MatrixToStr(A);
old = digits(p);
[m,n]=size(A);
X=X0';
for k=1:step
   for i=1:m
       temp = 0;
       for j=1:m
           if j ~= i
               if(type==1)
                    temp = temp + R(A(i,j)*X0(j));
               else
                    temp = temp + R(A(i,j)*X(j));
               end
           end
       end
      X(i)=R(R(B(i)-temp)/A(i,i));
   end
   steps(sIndex) = cellstr(strcat('X(',num2str(k,p),')='));
    sIndex = sIndex+1; 
    MatrixToStr(X);
   X0=X';
end
X=X';
end