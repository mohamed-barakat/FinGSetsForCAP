#! @Chunk SectionsValentiner

LoadPackage( "FinGSetsForCAP" );

#! @Example
w:=E(3);;
t:=(1+Sqrt(5))/2;;
A:=[[-1,0,0],[0,1,0],[0,0,1]];;
B:=1/2*[[1,-w*t,-w^2/t],[-w^2*t,-1/t,-w],[-w/t,-w^2,t]];;
C:=[[0,-w^2,0],[-w,0,0],[0,0,1]];;
G:=Group(A,B,C) / Group( -[[1,0,0],[0,1,0],[0,0,1]] );
#! <permutation group with 3 generators>
U := RepresentativeTom( TableOfMarks( G ), 27 );
#! <permutation group of size 24 with 4 generators>
Index( G, U );
#! 45
G := Action( G, RightCosets( G, U ), OnRight );
#! <permutation group with 3 generators>
SetName( G, StructureDescription( G ) );
G;
#! C3 . A6
U := Stabilizer( G, 1 );
#! <permutation group of size 24 with 4 generators>
SetName( U, StructureDescription( U ) );
U;
#! S4
V := Normalizer( G, U );
#! <permutation group with 5 generators>
SetName( V, StructureDescription( V ) );
V;
#! C3 x S4
T := FinGSet( G, [ 1 .. Length( 1^G ) ], OnPoints );
#! <An object in Fin-C3 . A6-Sets>
Length( T );
#! 45
B := FinGSet( G, Orbit( G, Set( 1^V ), OnSets ), OnSets );
#! <An object in Fin-C3 . A6-Sets>
Length( B );
#! 15
pi := ProjectionOfFinSets( T, B );
#! <A morphism in Fin-C3 . A6-Sets>
IsWellDefined( pi );
#! true
IsEpimorphism( pi );
#! true
S := CartesianSectionsOfEpi( pi );
#! <An object in Fin-C3 . A6-Sets>
Length( S );
#! 14348907
orbs := Orbits( S );;
Length( orbs );
#! 
#! @EndExample
