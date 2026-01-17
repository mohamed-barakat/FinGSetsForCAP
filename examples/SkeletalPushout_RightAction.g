#! @Chunk SkeletalPushout_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
A := FinRightGSet( S3, [ 1, 0, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
B := FinRightGSet( S3, [ 2, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
C := FinRightGSet( S3, [ 3, 1, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 3, (), 1 ] ], [], [ [ 1, (), 3 ] ], [] ];;
tau1 := MapOfFinGSets( A, imgs, C );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 2, (), 1 ], [ 3, (), 1 ] ], [ [ 1, (), 2 ] ], [], [] ];;
tau2 := MapOfFinGSets( B, imgs, C );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
D := [ tau1, tau2 ];
#! [ <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>, 
#!  <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )> ]
F := FiberProduct( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
iota := UniversalMorphismFromPushout( [ pi1, pi2 ], [ tau1, tau2 ] );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
Display( iota );
#! [ [ [ 3, (), 1 ], [ 2, (), 1 ] ], [ [ 1, (), 2 ] ], [ [ 1, (), 3 ] ], [  ] ]



S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
M := FinRightGSet( S0, [ 5 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
N1 := FinRightGSet( S0, [ 3 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ] ] ];;
iota1 := MapOfFinGSets( N1, imgs, M );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsMonomorphism( iota1 );
#! true
N2 := FinRightGSet( S0, [ 2 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
iota2 := MapOfFinGSets( N2, [ [ [ 1, (), 1 ], [ 2, (), 1 ] ] ], M );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsMonomorphism( iota2 );
#! true
D := [ iota1, iota2 ];
#! [ <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>,\
#!  <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )> ]
Fib := FiberProduct( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( Fib );
#! [ 2 ]
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi1 );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ] ] ]
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi2 );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ] ] ]
D := [ pi1, pi2 ];
#! [ <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>,\
#!  <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )> ]
UU := Pushout( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( UU );
#! [ 3 ]
kappa1 := InjectionOfCofactorOfPushout( D, 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( kappa1 );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ] ] ]
kappa2 := InjectionOfCofactorOfPushout( D, 2 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( kappa2 );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ] ] ]
PreCompose( pi1, kappa1 ) = PreCompose( pi2, kappa2 );
#! true


#! @EndExample
