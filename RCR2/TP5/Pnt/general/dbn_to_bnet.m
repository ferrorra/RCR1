function bnet = dbn_to_bnet(dbn, T)
% DBN_TO_BNET Convert a DBN to a static network by unroll for T slices
% bnet = dbn_to_bnet(dbn, T)

ss = length(dbn.intra);
eclass = [dbn.equiv_class(:,1) repmat(dbn.equiv_class(:,2), 1, T-1)];
dnodes = unroll_set(dbn.dnodes_slice, ss, T);
ns = repmat(dbn.node_sizes_slice(:), 1, T);
dag = unroll_dbn_topology(dbn.intra1, dbn.intra, dbn.inter, T);
bnet = mk_bnet(dag, ns(:), dnodes(:), eclass(:));
bnet.CPD = dbn.CPD;
 
