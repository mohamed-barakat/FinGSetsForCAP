#! @Chunk CategoryOfBisetsOfFiniteGroups

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
s3 := S3 / CategoryOfBisetsOfFinGroups;
#! <An object in CategoryOfBisetsOfFiniteGroups>
IsWellDefined( s3 );
#! true
id := IdentityMorphism( s3 );
#! <A morphism in CategoryOfBisetsOfFiniteGroups>
IsWellDefined( id );
#! true
id2 := PreCompose( id, id );
#! <A morphism in CategoryOfBisetsOfFiniteGroups>
IsWellDefined( id2 );
#! true
#! @EndExample
