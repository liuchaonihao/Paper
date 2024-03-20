function pre_output=f11(C1,C2,x,x2,t,y,testd,kernel,kerneloption,csigma)

% L=length(t);
% alpha1=x(1:L);
% alpha2=x(L+1:2*L);
% 
% K=svmkernel(t,kernel,kerneloption,t);
% K=K';
% alpha_m=alpha1-alpha2;
% [loc_a,loc_b]=find(alpha_m~=0);
% 
% b=1/2*(y(loc_a(1))-(alpha2-alpha1)'*K(:,loc_a(1))+y(loc_a(2))-(alpha2-alpha1)'*K(:,loc_a(2))); 
% %epsilon=-y(1)+(alpha2-alpha1)*K(:,1)+b;
% K=svmkernel(testd,kernel,kerneloption,t);
% K=K';
% pre_output=K'*(alpha1)+b;
L=length(t);
alpha1=x(1:L);
alpha2=x2(1:L);
csigma2=csigma.*csigma;
E=ones(1,L);
K=svmkernel(t,kernel,kerneloption,t);
% C1=10;
% C2=10;
% K=K';
% alpha_m=alpha1
% [loc_a,loc_b]=find(alpha_m~=0);
b1=1/L*E*y+1/C1*alpha1'*csigma2+1/L*E*K*alpha1
b2=1/L*E*y-1/C2*alpha2'*csigma2-1/L*E*K*alpha2
%b=1/2*(y(loc_a(1))-(alpha1)'*K(:,loc_a(1))+y(loc_a(2))-(alpha1)'*K(:,loc_a(2)))
%epsilon=-y(1)+(alpha2-alpha1)*K(:,1)+b;
% K=svmkernel(testd,kernel,kerneloption,t);
K=svmkernel(testd,kernel,kerneloption,t);
K=K';
f1=(-alpha1'*K)'+b1;
f2=(alpha2'*K)'+b2;
pre_output=1/2*(f1+f2);