## test ProjectionOntoCoequalizer

gap> START_TEST( "ProjectionOntoCoequalizer" );

#
gap> LoadPackage( "FinGSetsForCAP", false );
true
gap> S5 := SymmetricGroup( 5 );; StructureDescription( S5 );
"S5"
gap> TS5 := SkeletalTransitiveGSets( S5 );
SkeletalTransitiveGSets( S5 ) with 19 objects
gap> phi := MorphismConstructor( TS5.1, (), TS5.3 );
(): S5 / U_1 -> S5 / U_3
gap> psi := MorphismConstructor( TS5.1, (1,2,3), TS5.3 );
(1,2,3): S5 / U_1 -> S5 / U_3
gap> pi := ProjectionOntoCoequalizer( [ phi, psi ] );
(1,4,2,5,3): S5 / U_3 -> S5 / U_11
gap> IsWellDefined( pi );
true

gap> STOP_TEST( "ProjectionOntoCoequalizer" );
