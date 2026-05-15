#! @BeginChunk SkeletalCoequalizerOfIdentityAndAutomorphisms

#! @Example
LoadPackage( "FinGSetsForCAP", false );
#! true

S5 := SymmetricGroup( 5 );; StructureDescription( S5 );; S5;
#! S5
x := FinLeftGSet( S5, [ 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S5 )>
cmaps1 := [ [ 0, 0, 0, 0, 0 ],
            [ 1, 1, 1, 1, 1, 1 ],
            [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ],
            [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ] ];;
fmaps1 := [ [ 0, 2, 4, 3, 1 ],
            [ 4, 1, 2, 3, 0, 5 ],
            [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ],
            [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ] ];;

mors1 := [ [ (4,5), (4,5), (), (), (1,2,3) ],
           [ (), (), (), (), (), () ],
           [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ],
           [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ] ];;
f1 := MorphismConstructor( x, Triple( cmaps1, fmaps1, mors1 ), x );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S5 )>
IsWellDefined( f1 );
#! true
cmaps2 := [ [ 0, 0, 0, 0, 0 ],
            [ 1, 1, 1, 1, 1, 1 ],
            [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ],
            [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ] ];;
fmaps2 := [ [ 3, 1, 4, 0, 2 ],
            [ 0, 3, 5, 1, 4, 2 ],
            [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ],
            [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ] ];;
mors2 := [ [ (), (), (), (2,3), () ],
           [ (2,3), (1,2,3), (2,3), (), (), () ],
           [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ],
           [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ] ];;
f2 := MorphismConstructor( x, Triple( cmaps2, fmaps2, mors2 ), x );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S5 )>
IsWellDefined( f2 );
#! true
D := [ f1, f2 ];;
Coeq := CoequalizerOfIdentityAndAutomorphisms( D );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S5 )>
PairOfSumAndListOfMultiplicities( Coeq )[2];
#! [ 0, 0, 0, 0, 0, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
pi := ProjectionOntoCoequalizerOfIdentityAndAutomorphisms( D );
#! <An epimorphism in SkeletalCategoryOfFiniteLeftGSets( S5 )>
IsWellDefined( pi );
#! true
PreCompose( f1, pi ) = pi;
#! true
PreCompose( f2, pi ) = pi;
#! true
IsOne( UniversalMorphismFromCoequalizerOfIdentityAndAutomorphisms( x, D, Coeq, pi ) );
#! true
D2 := Concatenation( [ IdentityMorphism( x ) ], D );;
Coeq = Coequalizer( D2 );
#! true
pi2 := ProjectionOntoCoequalizer( D2 );
#! <An epimorphism in SkeletalCategoryOfFiniteLeftGSets( S5 )>
IsWellDefined( pi2 );
#! true
IsEqualAsFactorobjects( pi, pi2 );
#! true

#! @EndExample
#! @EndChunk
