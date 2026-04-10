#! @Chunk BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
s3 := S3 / BisetCategoryOfFinGroups;
#! <An object in BisetCategoryOfFiniteGroups>
IsWellDefined( s3 );
#! true
id := IdentityMorphism( s3 );
#! <A morphism in BisetCategoryOfFiniteGroups>
IsWellDefined( id );
#! true
id2 := PreCompose( id, id );
#! <A morphism in BisetCategoryOfFiniteGroups>
IsWellDefined( id2 );
#! true
2 * id = id + id;
#! true
0 * id = ZeroMorphism( s3, s3 );
#! true
S4 := SymmetricGroup( 4 );
#! Sym( [ 1 .. 4 ] )
s4 := S4 / BisetCategoryOfFinGroups;
#! <An object in BisetCategoryOfFiniteGroups>
IsWellDefined( s4 );
#! true
#! @EndExample
