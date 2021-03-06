% ode rhs f
F.f=@(x,theta,u) [...
-exp(theta(1))*x(1)*u(1)+exp(theta(6))*x(3)-(-10.0+x(4)+x(1)+x(3)+x(2))*exp(theta(7))-x(1)*exp(theta(2))+exp(theta(3))*x(2);...
exp(theta(1))*x(1)*u(1)-exp(theta(13))*x(2)+x(1)*exp(theta(2))-exp(theta(3))*x(2);...
exp(theta(13))*x(2)-exp(theta(6))*x(3)-exp(theta(14))*x(3);...
exp(theta(14))*x(3)-x(4)*(x(6)*exp(theta(5))*(1.0+x(6))^(-1)+exp(theta(4)));...
-exp(theta(10))*x(5)-(x(4)*exp(theta(9))+x(3))*exp(theta(8))*(-10.0+x(5));...
-(-10.0+x(6))*exp(theta(11))*x(5)-x(6)*exp(theta(12))];
% parameterised model output matrix
F.C=[...
 0.000000  0.000000  0.000000  0.000000  13740.432000  0.000000 ];
% Jacobian of f (df/dx)
F.Jf=@(x,theta,u) [...
-exp(theta(1))*u(1)-exp(theta(7))-exp(theta(2)),exp(theta(3))-exp(theta(7)),exp(theta(6))-exp(theta(7)),-exp(theta(7)),0,0;...
exp(theta(1))*u(1)+exp(theta(2)),-exp(theta(3))-exp(theta(13)),0,0,0,0;...
0,exp(theta(13)),-exp(theta(6))-exp(theta(14)),0,0,0;...
0,0,exp(theta(14)),-x(6)*exp(theta(5))*(1.0+x(6))^(-1)-exp(theta(4)),0,-x(4)*(exp(theta(5))*(1.0+x(6))^(-1)-x(6)*exp(theta(5))*(1.0+x(6))^(-2));...
0,0,-exp(theta(8))*(-10.0+x(5)),-exp(theta(8))*(-10.0+x(5))*exp(theta(9)),-(x(4)*exp(theta(9))+x(3))*exp(theta(8))-exp(theta(10)),0;...
0,0,0,0,-(-10.0+x(6))*exp(theta(11)),-exp(theta(11))*x(5)-exp(theta(12))];
% steady state sensitivity (dx(t→∞,ρ)/dρ)
F.Sf=@(x,theta,u) -[...
-exp(theta(1))*u(1)-exp(theta(7))-exp(theta(2)),exp(theta(3))-exp(theta(7)),exp(theta(6))-exp(theta(7)),-exp(theta(7)),0,0;...
exp(theta(1))*u(1)+exp(theta(2)),-exp(theta(3))-exp(theta(13)),0,0,0,0;...
0,exp(theta(13)),-exp(theta(6))-exp(theta(14)),0,0,0;...
0,0,exp(theta(14)),-x(6)*exp(theta(5))*(1.0+x(6))^(-1)-exp(theta(4)),0,-x(4)*(exp(theta(5))*(1.0+x(6))^(-1)-x(6)*exp(theta(5))*(1.0+x(6))^(-2));...
0,0,-exp(theta(8))*(-10.0+x(5)),-exp(theta(8))*(-10.0+x(5))*exp(theta(9)),-(x(4)*exp(theta(9))+x(3))*exp(theta(8))-exp(theta(10)),0;...
0,0,0,0,-(-10.0+x(6))*exp(theta(11)),-exp(theta(11))*x(5)-exp(theta(12))]\[...
-exp(theta(1))*x(1)*u(1),-x(1)*exp(theta(2)),exp(theta(3))*x(2),0,0,exp(theta(6))*x(3),-(-10.0+x(4)+x(1)+x(3)+x(2))*exp(theta(7)),0,0,0,0,0,0,0;...
exp(theta(1))*x(1)*u(1),x(1)*exp(theta(2)),-exp(theta(3))*x(2),0,0,0,0,0,0,0,0,0,-exp(theta(13))*x(2),0;...
0,0,0,0,0,-exp(theta(6))*x(3),0,0,0,0,0,0,exp(theta(13))*x(2),-exp(theta(14))*x(3);...
0,0,0,-x(4)*exp(theta(4)),-x(4)*x(6)*exp(theta(5))*(1.0+x(6))^(-1),0,0,0,0,0,0,0,0,exp(theta(14))*x(3);...
0,0,0,0,0,0,0,-(x(4)*exp(theta(9))+x(3))*exp(theta(8))*(-10.0+x(5)),-x(4)*exp(theta(8))*(-10.0+x(5))*exp(theta(9)),-exp(theta(10))*x(5),0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,-(-10.0+x(6))*exp(theta(11))*x(5),-x(6)*exp(theta(12)),0,0];
% model dimensions: number of state variables $n$; number of parameters $m$; number of outputs $l$;
F.n=6;
F.m=14;
F.l=1;
% initial conditions; either constant or function of parameters ρ and inputs u
F.x0=[10;0;0;0;0;0];
% done.% link to second order sensitivity function
F.dSf=@(x,theta,u,Jf,Sf) sensitivity2_Mifa(x,theta,u,Jf,Sf);
