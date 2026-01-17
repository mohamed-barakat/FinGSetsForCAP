#! @Chunk SkeletalFiberProduct_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
A := FinRightGSet( S3, [ 1, 0, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
B := FinRightGSet( S3, [ 2, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
C := FinRightGSet( S3, [ 2, 1, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 2, (), 1 ] ], [], [ [ 1, (), 3 ] ], [] ];;
tau1 := MapOfFinGSets( A, imgs, C );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 1, (), 1 ], [ 2, (), 1 ] ], [ [ 1, (), 2 ] ], [], [] ];;
tau2 := MapOfFinGSets( B, imgs, C );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
D := [ tau1, tau2 ];
#! [ <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>, 
#!  <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )> ]
F := FiberProduct( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
Display( F );
#! [ SymmetricGroup( [ 1 .. 3 ] ), [ 1, 0, 0, 0 ] ]
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
Display( pi1 );
#! [ [ [ 1, (), 1 ] ], [  ], [  ], [  ] ]
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
Display( pi2 );
#! [ [ [ 2, (), 1 ] ], [  ], [  ], [  ] ]



S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
m := FinRightGSet( S0, [ 5 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
n1 := FinRightGSet( S0, [ 3 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ] ] ];;
iota1 := MapOfFinGSets( n1, imgs, m );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsMonomorphism( iota1 );
#! true
n2 := FinRightGSet( S0, [ 4 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ] ] ];;
iota2 := MapOfFinGSets( n2, imgs, m );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsMonomorphism( iota2 );
#! true
D := [ iota1, iota2 ];
#! [ <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>,\
#!  <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )> ]
Fib := FiberProduct( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( Fib );
#! [ 3 ]
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi1 );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ] ] ]
int1 := ImageObject( pi1 );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( int1 );
#! [ 3 ]
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi2 );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ] ] ]
int2 := ImageObject( pi2 );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( int2 );
#! [ 3 ]
omega1 := PreCompose( pi1, iota1 );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
omega2 := PreCompose( pi2, iota2 );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
omega1 = omega2;
#! true
Display( omega1 );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ] ] ]


#! @EndExample
