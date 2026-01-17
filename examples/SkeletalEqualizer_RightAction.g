#! @Chunk SkeletalEqualizer_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
s := FinRightGSet( S3, [ 1, 0, 2, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
r := FinRightGSet( S3, [ 1, 2, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 1, (1,2), 1 ] ],
          [],
          [ [ 1, (), 3 ], [ 1, (1,2,3), 3 ] ],
          [] ];;
psi1 := MapOfFinGSets( s, imgs, r );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( psi1 );
#! true
imgs := [ [[ 1, (1,2), 3 ]], [], [[ 1, (), 3 ], [ 1, (), 3 ]], [] ];;
psi2 := MapOfFinGSets( s, imgs, r );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( psi2 );
#! true
D := [ psi1, psi2 ];;
Eq := Equalizer( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
AsList( Eq );
#! [ 0, 0, 2, 0 ]
psi := EmbeddingOfEqualizer( D );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( psi );
#! true
Display( psi );
#! [ [  ], [  ], [ [ 1, (), 3 ], [ 2, (), 3 ] ], [  ] ]
PreCompose( psi, psi1 ) = PreCompose( psi, psi2 );
#! true
t := FinRightGSet( S3, [ 1, 0, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 2, (1,2), 3 ] ], [], [ [ 1, (1,2,3), 3 ] ], [] ];;
tau := MapOfFinGSets( t, imgs , s );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( tau );
#! true
phi := UniversalMorphismIntoEqualizer( D, tau );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
Display( phi );
#! [ [ [ 2, (1,2), 3 ] ], [  ], [ [ 1, (1,2,3), 3 ] ], [  ] ]
IsWellDefined( phi );
#! true
PreCompose( phi, psi ) = tau;
#! true


S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
S := FinRightGSet( S0, [ 5 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
T := FinRightGSet( S0, [ 3 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 3, (), 1 ],
            [ 3, (), 1 ],
            [ 1, (), 1 ],
            [ 2, (), 1 ],
            [ 2, (), 1 ] ] ];;
f1 := MapOfFinGSets( S, imgs, T );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 3, (), 1 ],
            [ 2, (), 1 ],
            [ 3, (), 1 ],
            [ 1, (), 1 ],
            [ 2, (), 1 ] ] ];;
f2 := MapOfFinGSets( S, imgs, T );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 3, (), 1 ],
            [ 1, (), 1 ],
            [ 2, (), 1 ],
            [ 1, (), 1 ],
            [ 2, (), 1 ] ] ];;
f3 := MapOfFinGSets( S, imgs, T );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
D := [ f1, f2, f3 ];;
Eq := Equalizer( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( Eq );
#! [ 2 ]
psi := EmbeddingOfEqualizer( D );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( psi );
#! [ [ [ 1, (), 1 ], [ 5, (), 1 ] ] ]
PreCompose( psi, f1 ) = PreCompose( psi, f2 );
#! true
PreCompose( psi, f1 ) = PreCompose( psi, f3 );
#! true
D := [ f2, f3 ];
#! [ <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>,\
#!  <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )> ]
Eq := Equalizer( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( Eq );
#! [ 3 ]
psi := EmbeddingOfEqualizer( D );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( psi );
#! [ [ [ 1, (), 1 ], [ 4, (), 1 ], [ 5, (), 1 ] ] ]

#! @EndExample
