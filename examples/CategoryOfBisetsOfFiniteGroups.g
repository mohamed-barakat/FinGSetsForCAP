#! @Chunk CategoryOfBisetsOfFiniteGroupsUsingFunctors

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
s3 := GroupAsCategory( S3 ) / CategoryOfBisetsOfFiniteGroups;
#! <An object in CategoryOfBisetsOfFiniteGroupsUsingFunctors( )>
IsWellDefined( s3 );
#! true
id := IdentityMorphism( s3 );
#! <A morphism in CategoryOfBisetsOfFiniteGroupsUsingFunctors( )>
IsWellDefined( id );
#! true

#! @EndExample
