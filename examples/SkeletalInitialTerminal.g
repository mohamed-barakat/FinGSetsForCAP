#! @Chunk SkeletalInitialTerminal

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
S := FinLeftGSet( S3, [ 2, 2, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
u := UniversalMorphismFromInitialObject( S );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( u );
#! true

S := FinLeftGSet( S3, [ 2, 2, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
u := UniversalMorphismIntoTerminalObject( S );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( u );
#! true



S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
m := FinLeftGSet( S0, [ 8 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( 1 )>
i := InitialObject( CapCategory( m ) );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( 1 )>
iota := UniversalMorphismFromInitialObject( m );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( 1 )>
ObjectDatum( i );
#! [ 0, [ 0 ] ]
t := TerminalObject( CapCategory( m ) );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( 1 )>
ObjectDatum( t );
#! [ 1, [ 1 ] ]
pi := UniversalMorphismIntoTerminalObject( m );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( 1 )>
IsIdenticalObj( Range( pi ), t );
#! true
pi_t := UniversalMorphismIntoTerminalObject( m );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( 1 )>
Display( pi_t );
#! [ 8, [ 8 ] ]
#!  |
#! [ [ [ [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ] ] ],\
#!  [ [ (), (), (), (), (), (), (), () ] ] ]
#!  |
#!  v
#! [ 1, [ 1 ] ]
pi = pi_t;
#! true


#! @EndExample
