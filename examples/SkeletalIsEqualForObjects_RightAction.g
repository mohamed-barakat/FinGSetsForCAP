#! @Chunk SkeletalIsEqualForObjects_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
# Groups have to be the same with respect to IsIdenticalObj
C6 := CyclicGroup( 6 );; StructureDescription( C6 );; C6;
#! C6

w1 := FinRightGSet( C6, [ 1, 2, 3, 1 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( C6 )>

IsWellDefined( w1 );
#! true

S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3

w2 := FinRightGSet( S3, [ 1, 2, 3, 1 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>

IsWellDefined( w2 );
#! true

w1 = w2;
#! Error, the object "An object in SkeletalCategoryOfFiniteRightGSets( C6 )" and \
#! the object "An object in SkeletalCategoryOfFiniteRightGSets( S3 )" do not belo\
#! ng to the same CAP category


#! @EndExample
