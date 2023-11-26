function  f=f2(x,t,y,C,kernel,kerneloption,csigma)
L=length(t);
K=svmkernel(t,kernel,kerneloption);
alpha2=x(1:L);
X1=alpha2'*K*alpha2;
a=alpha2'*y;
csigma2=csigma.*csigma;
f=1/2*X1-a+1/(2*(C/L))*((alpha2.*alpha2)'*csigma2);