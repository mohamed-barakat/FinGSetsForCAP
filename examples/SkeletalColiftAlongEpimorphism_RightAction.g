#! @Chunk SkeletalColiftAlongEpimorphism_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
M := FinRightGSet( S3, [ 2, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
N := FinRightGSet( S3, [ 1, 0, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
O := FinRightGSet( S3, [ 2, 0, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 1, (1,2), 1 ], [ 1, (), 3 ] ], [], [], [] ];;
tau := MapOfFinGSets( M, imgs, O );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( tau );
#! true
imgs := [ [ [ 1, (1,2,3), 1 ], [ 1, (1,2), 3 ] ], [], [], [] ];;
epsilon := MapOfFinGSets( M, imgs, N );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( epsilon );
#! true
IsEpimorphism( epsilon );
#! true
u := ColiftAlongEpimorphism( epsilon, tau );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( u );
#! true
tau = PreCompose( epsilon, u );
#! true

#! @EndExample
