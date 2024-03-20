function he=h1(x,t)
L=length(t);
alpha1=x(1:L);
he=sum(alpha1);

%{
syms i
he=symsum(x(i),1,l);
l=length(temp1);
for i=1:l
he=sum(x(i))
end
%}
