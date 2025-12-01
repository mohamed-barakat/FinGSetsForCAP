#! @Chunk BisetCategoryOfFiniteGroups

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
s3 := S3 / BisetCategoryOfFinGroups;
#! <An object in BisetCategoryOfFiniteGroups>
IsWellDefined( s3 );
#! true
mor := MorphismConstructor( s3, Pair( 22, ListWithIdenticalEntries( 0, 22 ) ), s3 );
#! <A morphism in BisetCategoryOfFiniteGroups>
IsWellDefined( mor );
#! true
id := IdentityMorphism( s3 );
#! <A morphism in BisetCategoryOfFiniteGroups>
IsWellDefined( id );
#! true
id2 := PreCompose( id, id );
#! <A morphism in BisetCategoryOfFiniteGroups>
IsWellDefined( id2 );
#! true
#! @EndExample
