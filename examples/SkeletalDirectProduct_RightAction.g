#! @Chunk SkeletalDirectProduct_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
A := FinRightGSet( S3, [ 0, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
B := FinRightGSet( S3, [ 0, 0, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
Display( DirectProduct( A, B ) );
#! [ SymmetricGroup( [ 1 .. 3 ] ), [ 1, 0, 0, 0 ] ]

S4 := SymmetricGroup( 4 );; StructureDescription( S4 );; S4;
#! S4
A := FinRightGSet( S4, [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S4 )>
B := FinRightGSet( S4, [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S4 )>
Display( DirectProduct( A, B ) );
#! [ SymmetricGroup( [ 1 .. 4 ] ), [ 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]

pi := ProjectionInFactorOfDirectProduct( [ A, A ], 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S4 )>
IsWellDefined( pi );
#! true
Display( pi );
#! [ [ [ 1, (), 3 ], [ 1, (), 3 ], [ 1, (), 3 ], [ 1, (), 3 ], 
#!       [ 1, (), 3 ] ], [  ], [ [ 1, (), 3 ], [ 1, (), 3 ] ], [  ], 
#!   [  ], [  ], [  ], [  ], [  ], [  ], [  ] ]



S5 := SymmetricGroup( 5 );; StructureDescription( S5 );; S5;
#! S5
A := FinRightGSet( S5,
             [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
B := FinRightGSet( S5,
             [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
D := [ A, B ];
#! [ <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>, 
#!   <An object in SkeletalCategoryOfFiniteRightGSets( S5 )> ]
pi1 := ProjectionInFactorOfDirectProduct( D, 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( pi1 );
#! true
pi2 := ProjectionInFactorOfDirectProduct( D, 2 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( pi2 );
#! true
tau := [ pi1, pi2 ];
#! [ <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>,\
#!  <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )> ]
u := UniversalMorphismIntoDirectProduct( D, tau );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( u );
#! true


A := FinRightGSet( S3, [ 0, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
B := FinRightGSet( S3, [ 0, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi1 := ProjectionInFactorOfDirectProduct( [ A, B ], 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi2 := ProjectionInFactorOfDirectProduct( [ A, B ], 2 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
Display( pi1 );
#! [ [ [ 1, (), 2 ] ], [ [ 1, (), 2 ] ], [  ], [  ] ]
Display( pi2 );
#! [ [ [ 1, (1,3), 2 ] ], [ [ 1, (), 2 ] ], [  ], [  ] ]


M := FinRightGSet( S3, [ 1, 2, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
N := FinRightGSet( S3, [ 1, 0, 1, 2 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
D := [ M, N ];
#! [ <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>, 
#!   <An object in SkeletalCategoryOfFiniteRightGSets( S3 )> ]
tau1 := ProjectionInFactorOfDirectProduct( D, 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau2 := ProjectionInFactorOfDirectProduct( D, 2 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau := [ tau1, tau2 ];
#! [ <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>,\
#!  <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )> ]
u := UniversalMorphismIntoDirectProduct( D, tau );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( u );
#! true
Display( u );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 5, (), 1 ], [ 6, (), 1 ], [ 7, (), 1 ], [ 8, (), 1 ], 
#!       [ 9, (), 1 ], [ 10, (), 1 ], [ 11, (), 1 ], [ 12, (), 1 ], 
#!       [ 13, (), 1 ], [ 14, (), 1 ], [ 15, (), 1 ], [ 16, (), 1 ], 
#!       [ 17, (), 1 ], [ 18, (), 1 ] ], 
#!   [ [ 1, (), 2 ], [ 2, (), 2 ], [ 3, (), 2 ], [ 4, (), 2 ] ], [  ], 
#!   [  ] ]

L := FinRightGSet( S3, [ 2, 1, 0, 1 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
D := [ M, N, L ];
#! [ <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>,
#!   <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>, 
#!   <An object in SkeletalCategoryOfFiniteRightGSets( S3 )> ]
tau := ProjectionInFactorOfDirectProduct( D, 3 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( tau );
#! true



S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
m := FinRightGSet( S0, [ 7 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
n := FinRightGSet( S0, [ 3 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
p := FinRightGSet( S0, [ 4 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
d := DirectProduct( [ m, n, p ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( d );
#! [ 84 ]
pi1 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi1 );
#! [ [ [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], 
#!       [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], 
#!       [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], 
#!       [ 2, (), 1 ], [ 2, (), 1 ], [ 2, (), 1 ], [ 2, (), 1 ], 
#!       [ 2, (), 1 ], [ 2, (), 1 ], [ 2, (), 1 ], [ 2, (), 1 ], 
#!       [ 2, (), 1 ], [ 2, (), 1 ], [ 2, (), 1 ], [ 2, (), 1 ], 
#!       [ 3, (), 1 ], [ 3, (), 1 ], [ 3, (), 1 ], [ 3, (), 1 ], 
#!       [ 3, (), 1 ], [ 3, (), 1 ], [ 3, (), 1 ], [ 3, (), 1 ], 
#!       [ 3, (), 1 ], [ 3, (), 1 ], [ 3, (), 1 ], [ 3, (), 1 ], 
#!       [ 4, (), 1 ], [ 4, (), 1 ], [ 4, (), 1 ], [ 4, (), 1 ], 
#!       [ 4, (), 1 ], [ 4, (), 1 ], [ 4, (), 1 ], [ 4, (), 1 ], 
#!       [ 4, (), 1 ], [ 4, (), 1 ], [ 4, (), 1 ], [ 4, (), 1 ], 
#!       [ 5, (), 1 ], [ 5, (), 1 ], [ 5, (), 1 ], [ 5, (), 1 ], 
#!       [ 5, (), 1 ], [ 5, (), 1 ], [ 5, (), 1 ], [ 5, (), 1 ], 
#!       [ 5, (), 1 ], [ 5, (), 1 ], [ 5, (), 1 ], [ 5, (), 1 ], 
#!       [ 6, (), 1 ], [ 6, (), 1 ], [ 6, (), 1 ], [ 6, (), 1 ], 
#!       [ 6, (), 1 ], [ 6, (), 1 ], [ 6, (), 1 ], [ 6, (), 1 ], 
#!       [ 6, (), 1 ], [ 6, (), 1 ], [ 6, (), 1 ], [ 6, (), 1 ], 
#!       [ 7, (), 1 ], [ 7, (), 1 ], [ 7, (), 1 ], [ 7, (), 1 ], 
#!       [ 7, (), 1 ], [ 7, (), 1 ], [ 7, (), 1 ], [ 7, (), 1 ], 
#!       [ 7, (), 1 ], [ 7, (), 1 ], [ 7, (), 1 ], [ 7, (), 1 ] ] ]
pi3 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 3 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi3 );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], 
#!       [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ] ] ]

#! @EndExample
