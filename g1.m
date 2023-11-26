function gi=g1(x,t,csigma,C1,nu)
% L=length(t);
% alpha1=x(1:L);
% alpha2=x(L+1:2*L);
% C=81;nu=0.5;
% gi=[C*nu-sum(alpha2+alpha1);alpha1;alpha2;(C/L)-alpha1;(C/L)-alpha2];
L=length(t);
alpha1=x(1:L);
% C1=50;nu=0.5;
csigma2=csigma.*csigma;
gi=[C1*nu-sum(alpha1);alpha1;(C1/(L*csigma2))'-alpha1];