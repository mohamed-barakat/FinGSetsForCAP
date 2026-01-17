#! @Chunk SkeletalLiftAlongMonomorphism_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
M := FinRightGSet( S3, [ 1, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
N := FinRightGSet( S3, [ 2, 0, 2, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
O := FinRightGSet( S3, [ 2, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau := MapOfFinGSets( M, [ [ [ 1, (1,2), 1 ] ], [], [], [] ], N );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( tau );
#! true
imgs := [ [ [ 2, (), 1 ], [ 1, (1,3,2), 1 ] ], [], [], [] ];;
iota := MapOfFinGSets( O, imgs, N );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( iota );
#! true
IsMonomorphism( iota );
#! true
u := LiftAlongMonomorphism( iota, tau );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( u );
#! true
tau = PreCompose( u, iota );
#! true

#! @EndExample
