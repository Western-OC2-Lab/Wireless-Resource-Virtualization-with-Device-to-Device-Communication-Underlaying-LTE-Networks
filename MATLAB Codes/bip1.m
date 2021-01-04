function [x_sol,value,exitflag]=bip1(objfunc,A_ineq,b_ineq)

intcon=1:max(size(objfunc));
lb=zeros(max(size(objfunc)),1);
ub=ones(max(size(objfunc)),1);

tic
[x_sol,value,exitflag,output]= intlinprog(objfunc,intcon,A_ineq,b_ineq,[],[],lb,ub);
%[x_sol,value,exitflag] = bintprog(objfunc,A_ineq,b_ineq);
toc

