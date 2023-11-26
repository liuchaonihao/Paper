function g=df1(x,t,y,C,kernel,kerneloption,csigma)
% L=length(t);
% K=svmkernel(t,kernel,kerneloption);
% alpha1=x(1:L);
% alpha2=x(L+1:2*L);
% temp1=K*(alpha1-alpha2);
% G1=temp1'+y'+1/(C/L)*alpha1';
% 
% temp2=K*(alpha2-alpha1);
% G2=temp2'-y'+1/(C/L)*alpha2';
% g=[G1';G2']
L=length(t);
K=svmkernel(t,kernel,kerneloption);
alpha1=x(1:L);
temp1=alpha1'*K;
csigma2=csigma.*csigma;
G1=temp1+y'+1/(C/L)*alpha1'*csigma2;
g=G1';
% f(alpha1)=1/2*alpha1'*K*alpha1+alpha1'*y+1/(2*(C/L))*((alpha1.*alpha1)'*csigma2);
% g=diff(f(alpha1));

% for i=1:L
%    temp1=0;
%    for k1=1:L
%      temp1 = temp1 + (-x(k1+L)+x(k1))*K(i,k1);
%    end
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %    X_F = x(1:L);X_S = x(L+1:2*L);
% %    Ki = K(i,:);temp1 = Ki*(X_F-X_S);
%    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     g(i)=temp1+y(i)+1/(C/L)*alpha1(i);
% 
%   end
%   for j=L+1:2*L
%     temp2=0;
%     for k2=L+1:2*L
%     temp2 = temp2 + (-x(k2-L)+x(k2))*K(j-L,k2-L);
%    end   
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %    X_F = x(1:L);X_S = x(L+1:2*L);
% %    Kj = K(:,j-L);temp2 = (X_S-X_F)'*Kj;
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    g(j)=temp2-y(j-L)+1/(C/L)*alpha2(j-L);
%   end
% g= g'; 
