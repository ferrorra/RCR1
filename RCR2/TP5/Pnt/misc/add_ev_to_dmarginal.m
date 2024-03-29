function fullm = add_ev_to_dmarginal(fmarginal, evidence, ns, cnodes)
% ADD_EV_TO_DMARGINAL 'pump up' observed nodes back to their original size.
% fullm = add_ev_to_dmarginal(fmarginal, evidence, ns, cnodes)
%
% We introduce 0s into the array in positions which are incompatible with the evidence.

dom = fmarginal.domain;
odom = dom(~isemptycell(evidence(dom)));
vals = cat(1, evidence{odom});
index = mk_multi_index(length(dom), find_equiv_posns(odom, dom), vals);
T = 0*myones(ns(dom));
T(index{:}) = fmarginal.T;
fullm.T = T;
