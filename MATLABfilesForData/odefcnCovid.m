function dydt = odefcnCovid(t,y,para)
%%This function shows the system of ODEs for the COVID-19 model
%%and will be used in the ODE45 solver.
    % %para(1)=p; para(2)=\alpha;para(3)=a; para(4)=\gamma
    % %para(5)=c1; para(6)=b;
    % %para(7)=c2;para(8)=c3;para(9)=KN;para(10)=r;para(11)=beta; para(12)=KI
 bA=para(1);bAJ=para(2);bI=para(3);bJ=para(4);epsilon=para(5);omega=para(6);
 mu=para(7); muI=para(8);muJ=para(9);nu=para(10);p=para(11);%gamma=para(12)
    S = y(1);
    E = y(2);
    EJ= y(3);
    A = y(4);
    AJ = y(5);
    I = y(6);
    J = y(7);
    R = y(8);
    
 dydt = zeros(7,1);
    N = S + E+EJ + A+AJ + I+J + R;
    L = (bA * A + bI * I)/N ;
    LJ = (bAJ * AJ +bJ*J)/N ;
    inc_pd = 5.5 ;
    omega = 1/(inc_pd - epsilon);
    dSdt = mu * (N - S) - (L+LJ) * S;
    dEdt = L * S - (1/epsilon + mu) * E;
    dEJdt = LJ * S - (1/epsilon + mu) * EJ;
    dAdt = (1/epsilon) * E - (omega + mu) * A;
    dAJdt = (1/epsilon) * EJ - (omega + mu) * AJ;
    dIdt = (1 - p) * omega * A - (nu + muI) * I;
    dJdt =(1 - p) * omega * AJ - (nu + muJ) * J;
    dRdt = p * omega * A +p * omega * AJ+ nu * (I+J) - mu * R;
    ddeth=muI*I;
    dmdeth = muI*J;
    dydt=[dSdt;dEdt;dEJdt;dAdt;dAJdt;dIdt; dJdt;dRdt;ddeth;dmdeth];
end