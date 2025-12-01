#! @Chunk BisetCategoryOfFiniteGroupsUsingPreSheaves

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
s3 := GroupAsCategory( S3 ) / BisetCategoryOfFinGroupsUsingPreSheaves;
#! <An object in BisetCategoryOfFiniteGroupsUsingPreSheaves>
IsWellDefined( s3 );
#! true
id := IdentityMorphism( s3 );
#! <A morphism in BisetCategoryOfFiniteGroupsUsingPreSheaves>
IsWellDefined( id );
#! true
id2 := PreCompose( id, id );
#! <A morphism in BisetCategoryOfFiniteGroupsUsingPreSheaves>
IsWellDefined( id2 );
#! true
#! @EndExample
