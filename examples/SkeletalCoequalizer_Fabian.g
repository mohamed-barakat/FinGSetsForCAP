#! @Chunk SkeletalCoequalizer_Fabian

LoadPackage( "FinGSetsForCAP", false );

#! @Example

S5 := SymmetricGroup( 5 );; StructureDescription( S5 );; S5;
#! S5

S5Sets_Fabian := SkeletalCategoryOfFiniteRightGSets( S5 );
S5Sets := SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S5 );

g_1_1 := ();;
g_1_2 := (1,2);;
g_1_3 := (1,3);;
g_1_4 := (1,4);;

g_2_1 := ();;
g_2_2 := (1,2);;
g_2_3 := ();;
g_2_4 := (1,2);;

g_3_1 := ();;
g_3_2 := (1,2);;
g_3_3 := (1,3);;
g_3_4 := (1,3);;


A := FinRightGSet( S5,
             [ 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );

AA := ObjectConstructor( S5Sets, AsList( A ) );

#! <An object in SkeletalFinGSets>
B := FinRightGSet( S5,
             [ 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );

BB := ObjectConstructor( S5Sets, AsList( B ) );


#! <An object in SkeletalFinGSets>
imgs := [ [ [ 1, g_1_1, 2 ],
            [ 1, g_1_3, 2 ],
            [ 2, g_2_1, 2 ],
            [ 2, g_2_3, 2 ],
            [ 3, g_3_1, 2 ],
            [ 3, g_3_3, 2 ] ],
          [], [], [], [],
          [], [], [], [],
          [], [], [], [],
          [], [], [], [], [], [] ];;
f_1 := MapOfFinGSets(A, imgs, B);

ff_1 := MorphismConstructor( AA, AsList( f_1 ), BB );

#! <A morphism in SkeletalFinGSets>
imgs := [ [ [ 1, g_1_2, 4 ],
            [ 1, g_1_4, 4 ],
            [ 2, g_2_2, 4 ],
            [ 2, g_2_4, 4 ],
            [ 3, g_3_2, 4 ],
            [ 3, g_3_4, 4 ] ],
          [], [], [], [],
          [], [], [], [],
          [], [], [], [],
          [], [], [], [], [], [] ];;
f_2 := MapOfFinGSets(A, imgs, B);
#! <A morphism in SkeletalFinGSets>

ff_2 := MorphismConstructor( AA, AsList( f_2 ), BB );


IsWellDefined( f_1 );
#! true
IsWellDefined( f_2 );
#! true

IsWellDefined( ff_1 );
IsWellDefined( ff_2 );

D := [ f_1, f_2 ];;
DD := [ ff_1, ff_2 ];;

Cq := Coequalizer( D );
#! <An object in SkeletalFinGSets>

CCq := Coequalizer( DD );

AsList( Cq );
#! [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1 ]
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in SkeletalFinGSets>
IsWellDefined( pi );
#! true

ppi := ProjectionOntoCoequalizer( DD );
IsWellDefined( ppi );

id_to_be := UniversalMorphismFromCoequalizer( D, pi );
#! <A morphism in SkeletalFinGSets>
IsWellDefined( id_to_be );
#! true

iid_to_be := UniversalMorphismFromCoequalizer( DD, ppi );
IsWellDefined( iid_to_be );

Assert( 0, IsOne( UniversalMorphismFromCoequalizer( D, ProjectionOntoCoequalizer( D ) ) ) );
Assert( 0, IsOne( UniversalMorphismFromCoequalizer( DD, ProjectionOntoCoequalizer( DD ) ) ) );

#! @EndExample
