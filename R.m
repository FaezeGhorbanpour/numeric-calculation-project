function x = R( x )
global p
p=6;
format long g

s1=char('0.%df');
 s2=strcat('%',sprintf(s1,p));
 x=str2num(sprintf(s2,x));
end

