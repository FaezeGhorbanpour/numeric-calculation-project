function Y = Power( A,X0,step )
clear steps sIndex
global p steps sIndex
sIndex = 1;
steps = cell(1,1);
old = digits(p);

steps(sIndex) = cellstr('Power Method Steps: ');
sIndex = sIndex+1; 

Y=X0;
for i=1:step
     Y=A*Y;
     j=max(Y);
     Y=Y/j;
     steps(sIndex) = cellstr(strcat('Step (',num2str(i),') : '));
     sIndex = sIndex+1; 
     steps(sIndex) = cellstr(strcat('Approximation of eignvalue : ',num2str(j,p)));
     sIndex = sIndex+1; 
     steps(sIndex) = cellstr('Appriximation of dominant eigenvecter :');
    sIndex = sIndex+1; 
    MatrixToStr(Y);
end


end

