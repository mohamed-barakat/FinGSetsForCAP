#! @Chunk SkeletalFinRightGSet

#! @Example
LoadPackage( "FinGSetsForCAP" );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
SetName( S3, "S3" );
w1 := FinRightGSet( S3, [ 1, 2, 3, 1 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( w1 );
#! true
w2 := FinRightGSet( S3, [ 1, 2, 3, 1 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( w2 );
#! true
w1 = w2;
#! true

S := FinRightGSet( S3, [ 1 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( S );
#! false
S := FinRightGSet( S3, [ "a", 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( S );
#! false
S := FinRightGSet( S3, [ -1, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( S );
#! false

#! @EndExample
