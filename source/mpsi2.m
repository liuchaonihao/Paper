function psi=mpsi2(x,f,hf,gf,df,dhf,dgf,mu,lambda,sigma,t,y,C,kernel,kerneloption,csigma,nu)
% f=f1(x,t,y,C,m,n,kernel,kerneloption)
f=feval(f,x,t,y,C,kernel,kerneloption,sigma);  
he=feval(hf,x,t);  gi=feval(gf,x,t,csigma,C,nu);
l=length(he); m=length(gi);
psi=f;  s1=0.0;
% for(i=1:l)
%     psi=psi-he(i)*mu(i);
%     s1=s1+he(i)^2;
% end
% psi=psi+0.5*sigma*s1;
% s2=0.0;
% for(i=1:m)
%     s3=max(0.0, lambda(i) - sigma*gi(i));
%     s2=s2+s3^2-lambda(i)^2;
% end
% psi=psi+s2/(2.0*sigma);

psi=f-sum(he.*mu)+0.5*sigma*sum(he.^2);
psi=psi+sum(max(0,lambda - sigma*gi).^2-lambda.^2)/(2.0*sigma);