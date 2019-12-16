#! @Chunk SectionsOctahedron

LoadPackage( "FinGSetsForCAP" );

#! @Example
S4 := SymmetricGroup( 4 );
#! Sym( [ 1 .. 4 ] )
C4 := Subgroup( S4, [ (1,2,3,4) ] );
#! Group([ (1,2,3,4) ])
S4 := Action( S4, RightCosets( S4, C4 ), OnRight );
#! Group([ (2,5,4,3), (1,4)(2,6)(3,5) ])
C := Center( Normalizer( SymmetricGroup( 6 ), S4 ) );
#! Group([ (1,6)(2,4)(3,5) ])
G := Concatenation( GeneratorsOfGroup( S4 ), GeneratorsOfGroup( C ) );;
G := Group( G );;
SetName( G, StructureDescription( G ) );
G;
#! C2 x S4
C := Center( G );
#! Group([ (1,6)(2,4)(3,5) ])
T := FinGSet( G, [ 1 .. 6 ], OnPoints );
#! <An object in Fin-C2 x S4-Sets>
B := FinGSet( G, Orbits( C ), OnSets );
#! <An object in Fin-C2 x S4-Sets>
id_B := IdentityMorphism( B );
#! <An identity morphism in Fin-C2 x S4-Sets>
pi := ProjectionOfFinSets( T, B );
#! <A morphism in Fin-C2 x S4-Sets>
pi_s := ExponentialOnMorphisms( id_B, pi );
#! <A morphism in Fin-C2 x S4-Sets>
lambda := CartesianLambdaIntroduction( id_B );
#! <A morphism in Fin-C2 x S4-Sets>
S := FiberProduct( pi_s, lambda );
#! <An object in Fin-C2 x S4-Sets>
Length( S );
#! 8
orbs := Orbits( S );
#! [ <An object in Fin-C2 x S4-Sets> ]
#! @EndExample
