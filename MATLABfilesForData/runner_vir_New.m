clear all; clc;
mulf=1;
epsilon = 2.478385725999245;
omega = 0.33094892640811974;
mu = 3.411863047817261*10^(-5);
muI = 0.1;
muJ =0.07;
bI = sech(25*muI-2).^2;
bJ = sech(25*muJ-2).^2;
bA = 0.5497938413115383; 
bAJ=bA; 
% bA=0.4*(1-muI); % Uncomment when incorporate the transmission rate α 
% bAJ=0.4*(1-muJ); % Uncomment when incorporate the transmission rate α
nu = 0.03053968253968254;
p = 0.956;
para=[bA,bAJ,bI,bJ,epsilon,omega,mu,muI,muJ,nu,p];
%%
clc
D=400;
tspan = [0,D] ;
q=0.05;
y0 = [57.05 * 10^6,5*13.3*(1-q) ,5*13.3*q, 0,0, 0, 0, 0,0,0];
[t,y] = ode45(@(t,y) odefcnCovid(t,y,para), tspan, y0);
y0m = y(end,:);
mulf=0.7;
para=[bA,bAJ*mulf,bI,bJ*mulf,epsilon,omega,mu,muI,muJ,nu,p];
tspanm = [t(end),t(end)+D] ;
[t1,y1] = ode45(@(t,y) odefcnCovid(t,y,para), tspanm, y0m);

 rovalI=R0(muI,bA,bI,nu)
rovalJ=R0(muJ,bAJ,bJ,nu)

ResDen=sum(y(:,[2,4,6]),2)./sum(y(:,2:7),2);
MutDen=sum(y(:,[3,5,7]),2)./sum(y(:,2:7),2);
ResDen1=sum(y1(:,[2,4,6]),2)./sum(y1(:,2:7),2);
MutDen1=sum(y1(:,[3,5,7]),2)./sum(y1(:,2:7),2);
TotInfDen= sum(y(:,2:7),2)./sum(y(:,1:8),2);
TotInfDen1= sum(y1(:,2:7),2)./sum(y1(:,1:8),2);

%%
close all;
plot(t,ResDen,'k','LineWidth',2)
hold on
plot(t,MutDen,'r','LineWidth',2)
set(gca,'FontSize',14);
xlabel('t(days)','interpreter','latex') 
ylabel('density of variants','interpreter','latex')
legend('Resident strain(\mu_s=0.1)','Mutant strain(\mu_s=0.07)','Location','best')
