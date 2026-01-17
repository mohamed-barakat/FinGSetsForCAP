#! @Chunk SkeletalIdentityMorphism_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
M := FinRightGSet( S3, [ 1, 2, 1, 2 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
iota := IdentityMorphism( M );
#! <An identity morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( iota );
#! true
IsEpimorphism( iota );
#! true
Display( iota );
#! [ [ [ 1, (), 1 ] ],
#!   [ [ 1, (), 2 ], [ 2, (), 2 ] ],
#!   [ [ 1, (), 3 ] ],
#!   [ [ 1, (), 4 ], [ 2, (), 4 ] ] ]

#! @EndExample
