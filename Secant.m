function result = Secant( F,A,step,n) 
global steps
global sIndex
digitsOld = digits(n);
source = vpa(A(1));
dest = vpa(A(2));
f =inline(F,'x');
mid = dest;
for i=0:step-1
            steps(sIndex) = cellstr(strcat('........ step =',{' '},num2str(i+1),' ........'));
            sIndex = sIndex+1;
            steps(sIndex) = cellstr(strcat('[',char(source),',',char(dest),']'));
            sIndex = sIndex+1;
            %steps(sIndex) = cellstr(num2str(step));
            fSource = f(source);
            steps(sIndex) = cellstr(strcat('f(source) = ',char(fSource)));
            sIndex = sIndex+1;
            fDest = f(dest);
            steps(sIndex) = cellstr(strcat('f(dest) = ',char(fDest)));
            sIndex = sIndex+1;
            lastmid = mid;
            mid = dest - (fDest*(dest-source))/(fDest-fSource);
            fMid = f(mid);
            steps(sIndex) = cellstr(strcat('nextPoint = ',char(mid)));
            sIndex = sIndex+1;
            steps(sIndex) = cellstr(strcat('f(nextPoint) = ',char(fMid)));
            sIndex = sIndex+1;
            if (fMid==0)
                break;
            else
                if(mid<lastmid)
                    source = mid;
                    dest = lastmid;
                else
                    source = lastmid;
                    dest = mid;
                end
            end
           
end
result = mid;
end
