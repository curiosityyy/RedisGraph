function test109
%TEST109 terminal monoid with user-defined type

% SuiteSparse:GraphBLAS, Timothy A. Davis, (c) 2017-2020, All Rights Reserved.
% http://suitesparse.com   See GraphBLAS/Doc/License.txt for license.

fprintf ('\ntest109: terminal monoid with user-defined type\n') ;

rng ('default') ;

A = sparse (rand (4) + 1i * rand (4)) ;

[i j x] = find (A) ;
s = prod (prod (x)) ;
A
t = GB_mex_reduce_complex (A) ;
err = norm (s-t) ;
assert (err < 1e-12)

A (3,1) = 0 ;

[i j x] = find (A) ;
s = prod (prod (x)) ;
t = GB_mex_reduce_complex (A) ;
err = norm (s-t) ;
assert (err < 1e-12)

t = GB_mex_reduce_complex (A, 4) ;
assert (t == 0)

fprintf ('\ntest109: all tests passed\n') ;
