#! @Chunk SectionsDodecahedron

LoadPackage( "FinGSetsForCAP" );

#! @Example
A5 := AlternatingGroup( 5 );
#! Alt( [ 1 .. 5 ] )
C3 := Subgroup( A5, [ (1,2,3) ] );
#! Group([ (1,2,3) ])
A5 := Action( A5, RightCosets( A5, C3 ), OnRight );
#! Group([ (1,9,6,15,20)(2,11,5,13,19)(3,12,8,14,18)(4,10,7,16,17),
#!         (1,11,20)(2,10,18)(3,12,17)(4,9,19)(5,8,7)(13,15,16) ])
C := Center( Normalizer( SymmetricGroup( 20 ), A5 ) );
#! Group([ (1,12)(2,16)(3,20)(4,5)(6,14)(7,19)(8,9)(10,13)(11,17)(15,18) ])
G := Concatenation( GeneratorsOfGroup( A5 ), GeneratorsOfGroup( C ) );;
G := Group( G );;
StructureDescription( G );
#! "C2 x A5"
SetName( G, StructureDescription( G ) );
C := Center( G );
#! Group([ (1,12)(2,16)(3,20)(4,5)(6,14)(7,19)(8,9)(10,13)(11,17)(15,18) ])
T := FinGSet( G, [ 1 .. 20 ], OnPoints );
#! <An object in Fin-C2 x A5-Sets>
B := FinGSet( G, Orbits( C ), OnSets );
#! <An object in Fin-C2 x A5-Sets>
PositionAndConjugatorOfStabilizer( G, T[1], OnPoints );
#! [ 10, () ]
PositionAndConjugatorOfStabilizer( G, B[1], OnSets );
#! [ 18, () ]
pi := ProjectionOfFinSets( T, B );
#! <A morphism in Fin-C2 x A5-Sets>
S := CartesianSectionsOfEpi( pi );
#! <An object in Fin-C2 x A5-Sets>
Length( S );
#! 1024
orbs := Orbits( S );
#! [ <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets>,
#!   <An object in Fin-C2 x A5-Sets>, <An object in Fin-C2 x A5-Sets> ]
List( orbs, Length );
#! [ 60, 60, 40, 40, 120, 20, 20, 120, 60, 60,
#!   60, 60, 60, 60, 60, 60, 20, 20, 12, 12 ]
#! @EndExample
