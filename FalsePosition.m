function result = FalsePosition( F,A,step,n) 
global steps
global sIndex
digitsOld = digits(n);
source = vpa(A(1));
dest = vpa(A(2));
f =inline(F,'x');
for i=0:step-1
            steps(sIndex) = cellstr(strcat('........ step =',{' '},num2str(i+1),' ........'));
            sIndex = sIndex+1;
            steps(sIndex) = cellstr(strcat('[',char(source),',',char(dest),']'));
            sIndex = sIndex+1;
            fSource = f(source);
            steps(sIndex) = cellstr(strcat('f(source) = ',char(fSource)));
            sIndex = sIndex+1;
            fDest = f(dest);
            steps(sIndex) = cellstr(strcat('f(dest) = ',char(fDest)));
            sIndex = sIndex+1;
            mid = dest - (fDest*(dest-source))/(fDest-fSource);
            fMid = f(mid);
            steps(sIndex) = cellstr(strcat('nextPoint = ',char(mid)));
            sIndex = sIndex+1;
            steps(sIndex) = cellstr(strcat('f(nextPoint) = ',char(fMid)));
            sIndex = sIndex+1;
            if (fMid==0)
                break;
            elseif (fMid*fSource < 0)
                steps(sIndex) = cellstr('f(midPoint)f(source) < 0');
                sIndex = sIndex+1;
                dest = mid;
            elseif (fMid*fDest<0)
                steps(sIndex) = cellstr('f(midPoint)f(dest) < 0');
                sIndex = sIndex+1;
                source = mid;
            else 
                dest = mid;
            end
end
result = mid;
end
