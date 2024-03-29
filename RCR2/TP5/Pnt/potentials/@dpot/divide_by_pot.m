function Tbig = divide_by_pot(Tbig, Tsmall)
% DIVIDE_BY_POT Tbig /= Tsmall
% Tbig = divide_by_pot(Tbig, Tsmall)
%
% Tsmall's domain must be a subset of Tbig's domain.

Ts = extend_domain_table(Tsmall.T, Tsmall.domain, Tsmall.sizes, Tbig.domain, Tbig.sizes);
% Replace 0s by 1s before dividing. This is valid, Ts(i)=0 iff Tbig(i)=0.
Ts = Ts + (Ts==0);
Tbig.T = Tbig.T ./ Ts;

