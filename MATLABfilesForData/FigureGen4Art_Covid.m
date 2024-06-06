%%
clc;clear all;close all;
mulf=1.2;
bA = 0.5497938413115383;
bAJ=0.5497938413115383*mulf;
bI = 0.4909463148261044;
bJ = 0.4909463148261044*mulf;
epsilon = 2.478385725999245;
omega = 0.33094892640811974;
mu = 3.411863047817261*10^(-5);
muI = 0.0015851390386414379;
muJ = 0.0015851390386414379*mulf;
nu = 0.03053968253968254;
p = 0.956;
para=[bA,bAJ,bI,bJ,epsilon,omega,mu,muI,muJ,nu,p];
 %rovalI=R0(muI,bA,bI)
 %rovalJ=R0(muJ,bAJ,bJ)
%%
hfig = figure; 
h1=fplot(@(x) 1000*x/((0.1+x)*(0.2+x)),[0,1],'LineWidth',2);
hold on
grid on
xlabel('$\mu_k$');
ylabel('$\phi(\mu_k)$');
%set(gca,'FontSize',18);
[val1 ind1]=max(h1.YData);
plot([h1.XData(ind1) h1.XData(ind1)],[0 h1.YData(ind1)],':k','LineWidth',3)
text(h1.XData(ind1)-0.03,-90,'$\mu_k^*$','FontSize',14)
fname='myFig';
picturewidth = 20; 
hw_ratio = 0.65; 
set(findall(hfig,'-property','FontSize'),'FontSize',17)

set(findall(hfig,'-property','Box'),'Box','off') % optional
set(findall(hfig,'-property','Interpreter'),'Interpreter','latex') 
set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
pos = get(hfig,'Position');
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
print(hfig,fname,'-dpdf','-painters','-fillpage')
%print(hfig,fname,'-dpng','-vector')
%%
clc;clear all;close all;
hfig = figure; 
h1=fplot(@(x) 1000*x/((0.1+x)*(0.2+x)),[0,1],'LineWidth',2); 
grid on
xlabel('$\mu_k$');
ylabel('$\phi(\mu_k)$');
set(gca,'FontSize',18);
hold on
h2=fplot(@(x) 1000*x/((0.1+0.25*x)*(0.2+x)),[0,1],'LineWidth',2);
[val1 ind1]=max(h1.YData);
[val2 ind2]=max(h2.YData);
plot([h1.XData(ind1) h1.XData(ind1)],[0 h1.YData(ind1)],':k','LineWidth',3)
text(h1.XData(ind1)-0.07,-150,'$\mu_k^*(y_1)$','FontSize',14)
plot([h2.XData(ind2) h2.XData(ind1)],[0 h2.YData(ind2)],':k','LineWidth',3)
text(h2.XData(ind2)-0.04,-150,'$\mu_k^*(y_2)$','FontSize',14)

fname='myFig';
picturewidth = 20; 
hw_ratio = 0.65; 
set(findall(hfig,'-property','FontSize'),'FontSize',17) 

set(findall(hfig,'-property','Box'),'Box','off') % optional
set(findall(hfig,'-property','Interpreter'),'Interpreter','latex') 
set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
pos = get(hfig,'Position');
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
print(hfig,fname,'-dpdf','-painters','-fillpage')
%%
close all;
h1=fplot(@betaFun,[0,1],'LineWidth',2);
hold on
grid on
xlabel('\mu_S');
% ylabel('$\beta(\mu_S)=\frac{\mu_S}{0.01+\mu_S}$',Interpreter='latex');
ylabel('$\beta(\mu_S)=\tanh^2(25\mu_S-2)$',Interpreter='latex');
% ylabel('$\beta(\mu_S)=sech^2(25\mu_S-2)$',Interpreter='latex');
% ylabel('$\beta(\mu_S)=\sin^2(25\mu_S-2)$',Interpreter='latex');
set(gca,'FontSize',18);
%[val1,ind1]=max(h1.YData);
%plot([h1.XData(ind1) h1.XData(ind1)],[0 h1.YData(ind1)],':k','LineWidth',3)
%text(h1.XData(ind1)-0.03,-90,'\mu_k^*','FontSize',14)
%%
close all;
c0=1.6610;
c1=0.0440;
c2=0.03;
h1=fplot(@betaFun,[0,1],'LineWidth',2);
hold on
grid on
xlabel('\mu_S');
h2=fplot(@(x) c0+c1.*(betaFun(x)./(c2+x)),[0,1],'LineWidth',2);
set(gca,'FontSize',18);
% ylabel('$\beta=\frac{\mu_S}{0.01+\mu_S},\ \Phi$',Interpreter='latex');
% ylabel('$\beta=\tanh^2(25\mu_S-2),\ \Phi$',Interpreter='latex');
% ylabel('$\beta=sech^2(25\mu_S-2),\ \Phi$',Interpreter='latex');
ylabel('$\beta=\sin^2(25\mu_S-2),\ \Phi$',Interpreter='latex');
legend('\beta','Fitness')
%%
close all;
c0=3.02113;
c1=0.0440;
c2=0.03;
h1=fplot(@betaFun,[0,1],'LineWidth',2);
hold on
grid on
xlabel('\mu_S');
h2=fplot(@alphaFun,[0,1],'LineWidth',2);
h3=fplot(@(x) c0.*alphaFun(x)+c1.*(betaFun(x)./(c2+x)),[0,1],'LineWidth',2);
set(gca,'FontSize',18);
% ylabel('$\beta=\frac{\mu_S}{0.01+\mu_S},\ \Phi$',Interpreter='latex');
% ylabel('$\beta=\tanh^2(25\mu_S-2),\ \Phi$',Interpreter='latex');
 ylabel('$\beta=sech^2(25\mu_S-2),\ \alpha=0.4(1-x),\ \Phi$',Interpreter='latex');
 %ylabel('$\beta=\sin^2(25\mu_S-2),\ \Phi$',Interpreter='latex');
%ylabel('$y$',Interpreter='latex');
legend('\beta','\alpha','Fitness','Location','best')