function [x,mu,lambda,output]=multphr(f,hf,gf,df,dhf,dgf,x0,t,y,C,kernel,kerneloption,csigma,nu)
maxk=10; 
sigma=2.0;  
eta=2.0;  theta=0.8;  
k=0; ink=0;  
epsilon=1e-5; 
x=x0;  he=feval(hf,x,t); gi=feval(gf,x,t,csigma,C,nu);
n=length(x); l=length(he); m=length(gi);
mu=0.1*ones(l,1);  lambda=0.1*ones(m,1);
btak=10;  btaold=10; 
while(btak>epsilon & k<maxk)
    %function [alpha,val,k]=NM(fun,gfun,alpha0,varargin)
    [x,v,ik]=NM('mpsi','dmpsi',x0,f,hf,gf,df,dhf,dgf,mu,lambda,sigma,t,y,C,kernel,kerneloption,csigma,nu);
    ink=ink+ik;
    he=feval(hf,x,t); gi=feval(gf,x,t,csigma,C,nu);
    btak=0.0;
    for (i=1:l), btak=btak+he(i)^2;   end
    for i=1:m
        temp=min(gi(i),lambda(i)/sigma);
        btak=btak+temp^2;
    end
    btak=sqrt(btak);   
    if btak>epsilon
        if(k>=2 & btak > theta*btaold)
            sigma=eta*sigma;
        end
        %更新乘子向量
        for (i=1:l),  mu(i)=mu(i)-sigma*he(i);  end
        for (i=1:m)
            lambda(i)=max(0.0,lambda(i)-sigma*gi(i));
        end
    end
    k=k+1;
    btaold=btak;
    x0=x;
end
% aaa=1,pause
f=feval(f,x,t,y,C,kernel,kerneloption,csigma);
output.fval=f;
output.iter=k;
output.inner_iter=ink;
 output.bta=btak;
%xstar=[0.5*(sqrt(7)-1);0.25*(sqrt(7)+1)];
%err1=norm(x-xstar)
%%%%%%%%%%%%%%%%%% 增广Lagrange函数 %%%%%%%%%%%%%%%%%%%%%%%%
% function psi=mpsi(x,f,hf,gf,df,dhf,dgf,mu,lambda,sigma,t,y,C,kernel,kerneloption)
% f=feval(f,x,t);  he=feval(hf,x,t);  gi=feval(gf,x,t);
% l=length(he); m=length(gi);
% psi=f;  s1=0.0;
% 
% % psi=f-sum(he.*mu)+0.5*sigma*sum(he.^2);
% % psi=psi+sum(max(0,lambda - sigma*gi).^2-lambda.^2)/(2.0*sigma);
% 
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
% % %%%%%%%%%%%%%%%%%% 增广Lagrange函数的梯度 %%%%%%%%%%%%%%%%%%%%%%%%
% function dpsi=dmpsi(x,f,hf,gf,df,dhf,dgf,mu,lambda,sigma,t,y,C,kernel,kerneloption)
% dpsi=feval(df,x,t,y,C,p,q,kernel,kerneloption);
% he=feval(hf,x,t);  gi=feval(gf,x,t);
% dhe=feval(dhf,x,t);  dgi=feval(dgf,x,t);
% l=length(he); m=length(gi);
% 
% % dpsi1=dpsi+(sigma*he-mu)*dhe;
% % dpsi=dpsi1+dgi*(sigma*gi-lambda);
% 
% for(i=1:l)
%     dpsi=dpsi+(sigma*he(i)-mu(i))*dhe(:,i);
% end
% for(i=1:m)
%     dpsi=dpsi+(sigma*gi(i)-lambda(i))*dgi(:,i);
% end