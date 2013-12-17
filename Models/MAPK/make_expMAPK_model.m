% ode rhs f
F.f=@(x,theta,u) [...
-x(1)*((2.0)*(1.0+u(1))^(-1)*exp(theta(1))+exp(theta(2)))+u(1)*(1.0+u(1))^(-1)*exp(theta(1))-((1.0+u(1))^(-1)*exp(theta(1))-exp(theta(2)))*x(2);...
-x(2)*exp(theta(2))+x(1)*(1.0+u(1))^(-1)*exp(theta(1))];
% parameterised model output matrix
F.C=[...
 0.000000  1.000000 ];
% Jacobian of f (df/dx)
F.Jf=@(x,theta,u) [...
-(2.0)*(1.0+u(1))^(-1)*exp(theta(1))-exp(theta(2)),-(1.0+u(1))^(-1)*exp(theta(1))+exp(theta(2));...
(1.0+u(1))^(-1)*exp(theta(1)),-exp(theta(2))];
% steady state sensitivity (dx(t→∞,ρ)/dρ)
F.Sf=@(x,theta,u) -[...
-(2.0)*(1.0+u(1))^(-1)*exp(theta(1))-exp(theta(2)),-(1.0+u(1))^(-1)*exp(theta(1))+exp(theta(2));...
(1.0+u(1))^(-1)*exp(theta(1)),-exp(theta(2))]\[...
-x(2)*(1.0+u(1))^(-1)*exp(theta(1))-(2.0)*x(1)*(1.0+u(1))^(-1)*exp(theta(1))+u(1)*(1.0+u(1))^(-1)*exp(theta(1)),x(2)*exp(theta(2))-x(1)*exp(theta(2));...
x(1)*(1.0+u(1))^(-1)*exp(theta(1)),-x(2)*exp(theta(2))];
% model dimensions: number of state variables $n$; number of parameters $m$; number of outputs $l$;
F.n=2;
F.m=2;
F.l=1;
% initial conditions; either constant or function of parameters ρ and inputs u
F.x0=ones(F.n,1);
% done.% link to second order sensitivity function
F.dSf=@(x,theta,u,Jf,Sf) sensitivity2_expMAPK(x,theta,u,Jf,Sf);
