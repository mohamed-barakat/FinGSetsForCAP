#! @Chunk BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
s3 := S3 / BisetCategoryOfFinGroupsWithActionDataAsMorphisms;
#! <An object in BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms>
IsWellDefined( s3 );
#! true
id := IdentityMorphism( s3 );
#! <A morphism in BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms>
IsWellDefined( id );
#! true
id2 := PreCompose( id, id );
#! <A morphism in BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms>
IsWellDefined( id2 );
#! true
#! @EndExample
