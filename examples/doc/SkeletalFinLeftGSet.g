#! @Chunk SkeletalFinLeftGSet

#! @Example
LoadPackage( "FinGSetsForCAP" );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
SetName( S3, "S3" );
w1 := FinLeftGSet( S3, Pair( 7, [ 1, 2, 3, 1 ] ) );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( w1 );
#! true
w2 := Pair( 7, [ 1, 2, 3, 1 ] ) / SkeletalCategoryOfFiniteLeftGSets( S3 );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
w1 = w2;
#! true

#! @EndExample
