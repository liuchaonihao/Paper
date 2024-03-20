function [x,val,k]=NM(f,gf,x0,varargin)
maxk=5000;  
rho=0.55; sigma1=0.4; epsilon1=1e-5; 
k=0;   n=length(x0); 
Bk=eye(n);   
while(k<maxk)
    %gk=feval(gfun,x0,varargin{:},t,y,C,m,n,kernel,kerneloption); 
    gk=feval(gf,x0,varargin{:}); 
    gk_ifnan=isnan(gk);
    gk_ifinf=isinf(gk);
    Bk_ifnan=isnan(Bk);
    Bk_ifinf=isinf(Bk);
    if(norm(gk)<epsilon1 | length(find(gk_ifnan==1))>1 |length(find(gk_ifinf==1))>1 | length(find(Bk_ifnan==1))>1 |length(find(Bk_ifinf==1))>1); break; end  
    dk=-pinv(Bk)*gk;  
    dk_ifnan=isnan(dk);
    dk_ifinf=isinf(dk);
    if(length(find(dk_ifnan==1))>1 |length(find(dk_ifinf==1))>1); break; end  
% if (det(Bk)~=0)
%         dk=-inv(Bk)*gk;
%         
%     else
%        dk=-pinv(Bk)*gk;  
% end

    m=0; mk=0;
    while(m<28)  
       %newf=feval(fun,x0+rho^m*dk,varargin{:},t,y,C,m,n,kernel,kerneloption);

         newf=feval(f,x0+rho^m*dk,varargin{:});
%          newf=feval(fun,x0+rho^m*dk,varargin{:},t);
        oldf=feval(f,x0,varargin{:});
        if(newf<oldf+sigma1*rho^m*gk'*dk)
            mk=m; break;
        end
        m=m+1;
    end
    x=x0+rho^mk*dk;  
    sk=x-x0;  
    yk=feval(gf,x,varargin{:})-gk;
    if(yk'*sk>0)
        m11 = sk'*Bk*sk;
        m12 = (yk'*sk);
        Bk=Bk-(Bk*sk*sk'*Bk)/(m11)+(yk*yk')/(m12);
%          Bk=Bk-(Bk*sk*sk'*Bk)/(sk'*Bk*sk)+(yk*yk')/(yk'*sk);
    end
    
    k=k+1; x0=x;
end
%val=feval(fun,x0,varargin{:},t,y,C,m,n,kernel,kerneloption); 
val=feval(f,x0,varargin{:});

