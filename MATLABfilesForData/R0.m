function r0val=R0(mut,alpa,beta,nu)
%%This function computes the basic reproduction number R0 for the COVID-19 model.
bA = alpa;
bI = beta;
epsilon = 2.478385725999245;
%omega = 0.33094892640811974;
mu = 3.411863047817261*10^(-5);
muI = mut;
p = 0.956;
%nu =0.03053968253968254;
inc_pd = 5.5 ;
omega = 1/(inc_pd - epsilon);
eps=1/epsilon;
exit_rates1=(eps + mu) .* (mu + omega);
%exit_rates = (eps + mu) .* (muI + nu) .* (mu + omega);
C=eps .* bA ./exit_rates1;
Cdash= eps.* (1 - p) * omega/exit_rates1;
r0val =C + Cdash.*  bI  ./ (muI + nu);