#! @Chunk SectionsSquare

LoadPackage( "FinGSetsForCAP" );

#! @Example
D8 := Group( (1,2,3,4), (1,3) );
#! Group([ (1,2,3,4), (1,3) ])
StructureDescription( D8 );
#! "D8"
SetName( D8, StructureDescription( D8 ) );
D8;
#! D8
C := Center( D8 );
#! Group([ (1,3)(2,4) ])
T := FinGSet( D8, [ 1 .. Length( 1^D8 ) ], OnPoints );
#! <An object in Fin-D8-Sets>
B := FinGSet( D8, Orbits( C ), OnSets );
#! <An object in Fin-D8-Sets>
id_B := IdentityMorphism( B );
#! <An identity morphism in Fin-D8-Sets>
pi := ProjectionOfFinSets( T, B );
#! <A morphism in Fin-D8-Sets>
pi_s := ExponentialOnMorphisms( id_B, pi );
#! <A morphism in Fin-D8-Sets>
lambda := CartesianLambdaIntroduction( id_B );
#! <A morphism in Fin-D8-Sets>
S := FiberProduct( pi_s, lambda );
#! <An object in Fin-D8-Sets>
Length( S );
#! 4
orbs := Orbits( S );
#! [ <An object in Fin-D8-Sets> ]
Perform( List( AsList( orbs[1] ), a -> a[1] ), Display );
#! [ [ [ 1, 3 ], [ 2, 4 ] ], [ [ [ 1, 3 ], 1 ], [ [ 2, 4 ], 2 ] ], [ 1 .. 4 ] ]
#! [ [ [ 1, 3 ], [ 2, 4 ] ], [ [ [ 1, 3 ], 1 ], [ [ 2, 4 ], 4 ] ], [ 1 .. 4 ] ]
#! [ [ [ 1, 3 ], [ 2, 4 ] ], [ [ [ 1, 3 ], 3 ], [ [ 2, 4 ], 2 ] ], [ 1 .. 4 ] ]
#! [ [ [ 1, 3 ], [ 2, 4 ] ], [ [ [ 1, 3 ], 3 ], [ [ 2, 4 ], 4 ] ], [ 1 .. 4 ] ]
#! @EndExample
