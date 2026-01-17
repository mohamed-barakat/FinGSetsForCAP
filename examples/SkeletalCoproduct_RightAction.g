#! @Chunk SkeletalCoproduct_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
M1 := FinRightGSet( S3, [ 2, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
M2 := FinRightGSet( S3, [ 1, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
M3 := FinRightGSet( S3, [ 2, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
M4 := FinRightGSet( S3, [ 2, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
C := Coproduct( [ M1, M2, M3, M4 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau1 := InjectionOfCofactorOfCoproduct( [ M1, M2, M3, M4 ], 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau2 := InjectionOfCofactorOfCoproduct( [ M1, M2, M3, M4 ], 2 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau3 := InjectionOfCofactorOfCoproduct( [ M1, M2, M3, M4 ], 3 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau4 := InjectionOfCofactorOfCoproduct( [ M1, M2, M3, M4 ], 4 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau := [ tau1, tau2, tau3, tau4 ];;
D := [ M1, M2, M3, M4 ];;
id_to_be := UniversalMorphismFromCoproduct( D, tau );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
id := IdentityMorphism( C );
#! <An identity morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
id_to_be = id;
#! true

T := TerminalObject( CapCategory( M1 ) );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi1 := UniversalMorphismIntoTerminalObject( M1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi2 := UniversalMorphismIntoTerminalObject( M2 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi3 := UniversalMorphismIntoTerminalObject( M3 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi4 := UniversalMorphismIntoTerminalObject( M4 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
pi := [ pi1, pi2, pi3, pi4 ];;
psi := UniversalMorphismFromCoproduct( D, pi );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
psi = UniversalMorphismIntoTerminalObject( C );
#! true
IsEpimorphism( psi );
#! true


S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
m := FinRightGSet( S0, [ 7 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
n := FinRightGSet( S0, [ 3 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
p := FinRightGSet( S0, [ 4 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
c := Coproduct( m, n, p );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( c );
#! [ 14 ]
iota1 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsWellDefined( iota1 );
#! true
Display( iota1 );
#! [ [ [ 1, (), 1 ],
#!     [ 2, (), 1 ],
#!     [ 3, (), 1 ],
#!     [ 4, (), 1 ],
#!     [ 5, (), 1 ],
#!     [ 6, (), 1 ],
#!     [ 7, (), 1 ] ] ]
iota3 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( iota3 );
#! [ [ [ 11, (), 1 ], [ 12, (), 1 ], [ 13, (), 1 ], [ 14, (), 1 ] ] ]

#! @EndExample
