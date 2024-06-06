function y = betaFun(mu)
%%mu: virulence
%%rational Beta
% a1=0.01;
% a2=1;
% y= a2.*mu./(a1+mu);
a1=2;
a2=25;
%%hyper Tan
%  y= (tanh(a2.*mu-a1)).^2;
%%hyper sec
y= (sech(a2.*mu-a1)).^2;
%%sin
% y= (sin(a2.*mu-a1)).^2;
end