## test PreCompose

gap> START_TEST( "PreCompose" );

#
gap> LoadPackage( "FinGSetsForCAP", false );
true
gap> S4 := SymmetricGroup( 4 );; StructureDescription( S4 );
"S4"
gap> TS4 := SkeletalCategoryOfTransitiveGSets( S4 );
SkeletalCategoryOfTransitiveGSets( S4 ) with 11 objects
gap> objs := SetOfObjects( TS4 );; Length( objs );
11
gap> Set( objs ) = objs;
true
gap> ForAll( Cartesian( objs, objs, objs ), o -> ForAll( MorphismsOfExternalHom( o[1], o[2] ), pre -> ForAll( MorphismsOfExternalHom( o[2], o[3] ), post -> IsWellDefined( PreCompose( pre, post ) ) ) ) );
true
gap> Omega1 := TS4.1;
S4 / U_1
gap> alpha := MorphismConstructor( Omega1, (1,2), Omega1 );
(1,2): S4 / U_1 -> S4 / U_1
gap> beta := MorphismConstructor( Omega1, (2,3), Omega1 );
(2,3): S4 / U_1 -> S4 / U_1
gap> PreCompose( alpha, Colift( alpha, beta ) ) = beta;
true
gap> PreCompose( Lift( alpha, beta ), beta ) = alpha;
true

#
gap> STOP_TEST( "PreCompose" );
