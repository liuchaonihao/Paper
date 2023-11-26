function dgi =dg2(x,t)
L=length(t);
dgi =[-ones(1,L);eye(L);-eye(L)]';