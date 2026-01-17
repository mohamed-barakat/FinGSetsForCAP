#! @Chunk SkeletalInitialTerminal_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
S := FinRightGSet( S3, [ 2, 2, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
u := UniversalMorphismFromInitialObject( S );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( u );
#! true

S := FinRightGSet( S3, [ 2, 2, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
u := UniversalMorphismIntoTerminalObject( S );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( u );
#! true



S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
m := FinRightGSet( S0, [ 8 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
i := InitialObject( CapCategory( m ) );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
iota := UniversalMorphismFromInitialObject( m );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( i );
#! [ 0 ]
t := TerminalObject( CapCategory( m ) );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( t );
#! [ 1 ]
pi := UniversalMorphismIntoTerminalObject( m );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsIdenticalObj( Range( pi ), t );
#! true
pi_t := UniversalMorphismIntoTerminalObject( m );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi_t );
#! [ [ [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], 
#!       [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ], [ 1, (), 1 ] ] ]
pi = pi_t;
#! true


#! @EndExample
