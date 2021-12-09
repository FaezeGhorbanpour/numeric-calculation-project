function X = Cramer( A,B )
clear steps sIndex
global steps sIndex p
sIndex = 1;
steps = cell(1,1);
old = digits(p);
steps(sIndex) = cellstr('Cramer`s Rule Steps: ');
sIndex = sIndex+1; 

[m,n]=size(A);
a=zeros(m,n);
for i=1:m
    a = horzcat(A(:,1:i-1),B,A(:,i+1:n));
    X(i)=R(R(det(a))/R(det(A)));
    steps(sIndex) = cellstr(strcat('A(',num2str(i),') is :'));
    sIndex = sIndex+1; 
    MatrixToStr(a);
    steps(sIndex) = cellstr(strcat('It`s determinant is : ',num2str(R(det(a)),p),' and X(',num2str(i),') is : ',num2str(X(i),p)) );
    sIndex = sIndex+1; 
end
X=X';
end

