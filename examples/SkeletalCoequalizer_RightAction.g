#! @Chunk SkeletalCoequalizer_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S5 := SymmetricGroup( 5 );; StructureDescription( S5 );; S5;
#! S5
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
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
B := FinRightGSet( S5,
             [ 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
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
f_1 := MapOfFinGSets( A, imgs, B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
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
f_2 := MapOfFinGSets( A, imgs, B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( f_1 );
#! true
IsWellDefined( f_2 );
#! true
D := [ f_1, f_2 ];;
Cq := Coequalizer( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
AsList( Cq );
#! [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1 ]
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( pi );
#! true

id_to_be := UniversalMorphismFromCoequalizer( D, pi );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( id_to_be );
#! true
id := IdentityMorphism( Cq );
#! <An identity morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
id = id_to_be;
#! true

A := FinRightGSet( S5,
             [ 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
B := FinRightGSet( S5,
             [ 0, 3, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
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
f_1 := MapOfFinGSets( A, imgs, B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
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
f_2 := MapOfFinGSets( A, imgs, B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( f_1 );
#! true
IsWellDefined( f_2 );
#! true
D := [ f_1, f_2 ];;
Cq := Coequalizer( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
AsList( Cq );
#! [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1 ]
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( pi );
#! true

id_to_be := UniversalMorphismFromCoequalizer( D, pi );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( id_to_be );
#! true
id := IdentityMorphism( Cq );
#! <An identity morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
id = id_to_be;
#! true



A := FinRightGSet( S5,
             [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
B := FinRightGSet( S5,
             [ 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
imgs := [ [ [ 1, (), 3 ] ],
          [], [], [], [],
          [], [], [], [],
          [], [], [], [],
          [], [], [], [], [], [] ];;
f_1 := MapOfFinGSets( A, imgs, B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
imgs := [ [ [ 1, (1,2,3), 4] ],
          [], [], [], [],
          [], [], [], [],
          [], [], [], [],
          [], [], [], [], [], [] ];;
f_2 := MapOfFinGSets( A, imgs, B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( f_1 );
#! true
IsWellDefined( f_2 );
#! true
D := [ f_1, f_2 ];;
Cq := Coequalizer( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S5 )>
AsList( Cq );
#! [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ]
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in SkeletalCategoryOfFiniteRightGSets( S5 )>
IsWellDefined( pi );
#! true



S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
s := FinRightGSet( S0, [ 5 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
t := FinRightGSet( S0, [ 4 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 3, (), 1 ],
            [ 4, (), 1 ],
            [ 4, (), 1 ],
            [ 2, (), 1 ],
            [ 4, (), 1 ] ] ];;
f := MapOfFinGSets( s, imgs, t );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 3, (), 1 ],
            [ 3, (), 1 ],
            [ 4, (), 1 ],
            [ 2, (), 1 ],
            [ 4, (), 1 ] ] ];;
g := MapOfFinGSets( s, imgs, t );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
D := [ f, g ];
#! [ <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>,\
#!  <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )> ]
C := Coequalizer( D );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( C );
#! [ 3 ]
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi );
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 3, (), 1 ] ] ]
imgs := [ [ [ 2, (), 1 ], [ 1, (), 1 ], [ 2, (), 1 ], [ 2, (), 1 ] ] ];;
tau := MapOfFinGSets( t, imgs, FinRightGSet( S0, [ 2 ] ) );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
phi := UniversalMorphismFromCoequalizer( D, tau );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( phi );
#! [ [ [ 2, (), 1 ], [ 1, (), 1 ], [ 2, (), 1 ] ] ]
PreCompose( pi, phi ) = tau;
#! true




A := FinRightGSet( S0, [ 2 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
B := FinRightGSet( S0, [ 3 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
f := MapOfFinGSets( A, [ [ [ 1, (), 1 ], [ 2, (), 1 ] ] ], B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsWellDefined( f );
#! true
g := MapOfFinGSets( A, [ [ [ 2, (), 1 ], [ 3, (), 1 ] ] ], B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsWellDefined( g );
#! true
D := [ f, g ];;
Cq := Coequalizer( D );;
Display( Cq );
#! [ Group( () ), [ 1 ] ]
pi := ProjectionOntoCoequalizer( D );;
IsWellDefined( pi );
#! true
PreCompose( f, pi ) = PreCompose( g, pi );
#! true


S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
A := FinRightGSet( S3, [ 0, 0, 0, 0 ] );;
id := IdentityMorphism( A );
#! <An identity morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
D := [ id, id ];;
Cq := Coequalizer( D );;
Display( Cq );
#! [ SymmetricGroup( [ 1 .. 3 ] ), [ 0, 0, 0, 0 ] ]
pi := ProjectionOntoCoequalizer( D );;
IsWellDefined( pi );
#! true
pi = id;
#! true


A := FinRightGSet( S3, [ 0, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
B := FinRightGSet( S3, [ 1, 1, 1, 1 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
f := MapOfFinGSets( A, [ [ ], [ ], [ ], [ ] ], B );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( f );
#! true
D := [ f, f ];;
Cq := Coequalizer( D );;
Display( Cq );
#! [ SymmetricGroup( [ 1 .. 3 ] ), [ 1, 1, 1, 1 ] ]
pi := ProjectionOntoCoequalizer( D );;
pi = IdentityMorphism( B );
#! true

#! @EndExample
