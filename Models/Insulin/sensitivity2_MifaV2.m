function [dS]=sensitivity2_MifaV2(x,theta,u,Jf,Sf)
m=16;
n=6;
%dJf_x
dJf_x(:,:,1)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_x(:,:,2)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_x(:,:,3)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,-exp(theta(8)),0;...
0,0,0,0,0,0];
dJf_x(:,:,4)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,-exp(theta(16))*(exp(theta(5))*(exp(theta(15))+x(6))^(-1)-exp(theta(5))*(exp(theta(15))+x(6))^(-2)*x(6));...
0,0,0,0,-exp(theta(8))*exp(theta(9)),0;...
0,0,0,0,0,0];
dJf_x(:,:,5)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,-exp(theta(8)),-exp(theta(8))*exp(theta(9)),0,0;...
0,0,0,0,0,-exp(theta(11))];
dJf_x(:,:,6)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,-exp(theta(16))*(exp(theta(5))*(exp(theta(15))+x(6))^(-1)-exp(theta(5))*(exp(theta(15))+x(6))^(-2)*x(6)),0,2*(exp(theta(5))*(exp(theta(15))+x(6))^(-2)-exp(theta(5))*(exp(theta(15))+x(6))^(-3)*x(6))*exp(theta(16))*x(4);...
0,0,0,0,0,0;...
0,0,0,0,-exp(theta(11)),0];
%dJf_theta
dJf_theta(:,:,1)=[...
-u(1)*exp(theta(1)),0,0,0,0,0;...
u(1)*exp(theta(1)),0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,2)=[...
-exp(theta(2)),0,0,0,0,0;...
exp(theta(2)),0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,3)=[...
0,exp(theta(3)),0,0,0,0;...
0,-exp(theta(3)),0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,4)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,-exp(theta(4))*exp(theta(16)),0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,5)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,-exp(theta(5))*(exp(theta(15))+x(6))^(-1)*exp(theta(16))*x(6),0,-exp(theta(16))*x(4)*(exp(theta(5))*(exp(theta(15))+x(6))^(-1)-exp(theta(5))*(exp(theta(15))+x(6))^(-2)*x(6));...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,6)=[...
0,0,exp(theta(6)),0,0,0;...
0,0,0,0,0,0;...
0,0,-exp(theta(6)),0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,7)=[...
-exp(theta(7)),-exp(theta(7)),-exp(theta(7)),-exp(theta(7)),0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,8)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,-(-10.0+x(5))*exp(theta(8)),-(-10.0+x(5))*exp(theta(8))*exp(theta(9)),-exp(theta(8))*(x(3)+x(4)*exp(theta(9))),0;...
0,0,0,0,0,0];
dJf_theta(:,:,9)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,-(-10.0+x(5))*exp(theta(8))*exp(theta(9)),-exp(theta(8))*x(4)*exp(theta(9)),0;...
0,0,0,0,0,0];
dJf_theta(:,:,10)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,-exp(theta(10)),0;...
0,0,0,0,0,0];
dJf_theta(:,:,11)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,-(-10.0+x(6))*exp(theta(11)),-x(5)*exp(theta(11))];
dJf_theta(:,:,12)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,-exp(theta(12))];
dJf_theta(:,:,13)=[...
0,0,0,0,0,0;...
0,-exp(theta(13)),0,0,0,0;...
0,exp(theta(13)),0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,14)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,-exp(theta(14)),0,0,0;...
0,0,exp(theta(14)),0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,15)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,exp(theta(15))*exp(theta(5))*(exp(theta(15))+x(6))^(-2)*exp(theta(16))*x(6),0,-exp(theta(16))*x(4)*(2*exp(theta(15))*exp(theta(5))*(exp(theta(15))+x(6))^(-3)*x(6)-exp(theta(15))*exp(theta(5))*(exp(theta(15))+x(6))^(-2));...
0,0,0,0,0,0;...
0,0,0,0,0,0];
dJf_theta(:,:,16)=[...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,0,0,0;...
0,0,0,-(exp(theta(5))*(exp(theta(15))+x(6))^(-1)*x(6)+exp(theta(4)))*exp(theta(16)),0,-exp(theta(16))*x(4)*(exp(theta(5))*(exp(theta(15))+x(6))^(-1)-exp(theta(5))*(exp(theta(15))+x(6))^(-2)*x(6));...
0,0,0,0,0,0;...
0,0,0,0,0,0];
%dKf_theta
dKf_theta(:,:,1)=[...
-u(1)*x(1)*exp(theta(1)),0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
u(1)*x(1)*exp(theta(1)),0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,2)=[...
0,-exp(theta(2))*x(1),0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,exp(theta(2))*x(1),0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,3)=[...
0,0,x(2)*exp(theta(3)),0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,-x(2)*exp(theta(3)),0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,4)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,-exp(theta(4))*exp(theta(16))*x(4),0,0,0,0,0,0,0,0,0,0,0,-exp(theta(4))*exp(theta(16))*x(4);...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,5)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,-exp(theta(5))*(exp(theta(15))+x(6))^(-1)*exp(theta(16))*x(4)*x(6),0,0,0,0,0,0,0,0,0,exp(theta(15))*exp(theta(5))*(exp(theta(15))+x(6))^(-2)*exp(theta(16))*x(4)*x(6),-exp(theta(5))*(exp(theta(15))+x(6))^(-1)*exp(theta(16))*x(4)*x(6);...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,6)=[...
0,0,0,0,0,x(3)*exp(theta(6)),0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,-x(3)*exp(theta(6)),0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,7)=[...
0,0,0,0,0,0,-exp(theta(7))*(-10.0+x(3)+x(2)+x(4)+x(1)),0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,8)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,-(-10.0+x(5))*exp(theta(8))*(x(3)+x(4)*exp(theta(9))),-(-10.0+x(5))*exp(theta(8))*x(4)*exp(theta(9)),0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,9)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,-(-10.0+x(5))*exp(theta(8))*x(4)*exp(theta(9)),-(-10.0+x(5))*exp(theta(8))*x(4)*exp(theta(9)),0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,10)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,-exp(theta(10))*x(5),0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,11)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,-x(5)*(-10.0+x(6))*exp(theta(11)),0,0,0,0,0];
dKf_theta(:,:,12)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,-exp(theta(12))*x(6),0,0,0,0];
dKf_theta(:,:,13)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,-exp(theta(13))*x(2),0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,exp(theta(13))*x(2),0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,14)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,-x(3)*exp(theta(14)),0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,x(3)*exp(theta(14)),0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,15)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,exp(theta(15))*exp(theta(5))*(exp(theta(15))+x(6))^(-2)*exp(theta(16))*x(4)*x(6),0,0,0,0,0,0,0,0,0,exp(theta(15))*exp(theta(5))*(exp(theta(15))+x(6))^(-2)*exp(theta(16))*x(4)*x(6)-2*exp(theta(15))^2*exp(theta(5))*(exp(theta(15))+x(6))^(-3)*exp(theta(16))*x(4)*x(6),exp(theta(15))*exp(theta(5))*(exp(theta(15))+x(6))^(-2)*exp(theta(16))*x(4)*x(6);...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
dKf_theta(:,:,16)=[...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,-exp(theta(4))*exp(theta(16))*x(4),-exp(theta(5))*(exp(theta(15))+x(6))^(-1)*exp(theta(16))*x(4)*x(6),0,0,0,0,0,0,0,0,0,exp(theta(15))*exp(theta(5))*(exp(theta(15))+x(6))^(-2)*exp(theta(16))*x(4)*x(6),-(exp(theta(5))*(exp(theta(15))+x(6))^(-1)*x(6)+exp(theta(4)))*exp(theta(16))*x(4);...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
 A=zeros(n,n,m);
 for k=1:m
  for l=1:n
   A(:,l,k)=dJf_x(:,:,l)*Sf(:,k)+dJf_theta(:,l,k);
  end%for
 end%for
 B=zeros(n,m,m);
 for k=1:m
  for i=1:m
   B(:,i,k)=dJf_theta(:,:,i)*Sf(:,k);
  end%for
 end%for
 for k=1:m
  dS(:,:,k)=-Jf\(A(:,:,k)*Sf+B(:,:,k)+dKf_theta(:,:,k));
 end%for
end%function
