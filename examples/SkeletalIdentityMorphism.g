#! @Chunk SkeletalIdentityMorphism

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
M := FinLeftGSet( S3, [ 1, 2, 1, 2 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
iota := IdentityMorphism( M );
#! <An identity morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( iota );
#! true
IsEpimorphism( iota );
#! true
Display( iota );
#! [ 6, [ 1, 2, 1, 2 ] ]
#!  |
#! [ [ [ [ 0 ], [ 0 ] ], [ [ 1, 1 ], [ 0 .. 1 ] ],\
#!     [ [ 2 ], [ 0 ] ], [ [ 3, 3 ], [ 0 .. 1 ] ] ],\
#!   [ [ () ], [ (), () ], [ () ], [ (), () ] ] ]
#!  |
#!  v
#! [ 6, [ 1, 2, 1, 2 ] ]

#! @EndExample
