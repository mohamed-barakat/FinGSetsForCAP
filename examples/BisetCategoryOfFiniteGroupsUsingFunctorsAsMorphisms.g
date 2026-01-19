#! @Chunk BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
s3 := S3 / BisetCategoryOfFinGroupsUsingFunctorsAsMorphisms;
#! <An object in BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms>
IsWellDefined( s3 );
#! true
mul := [ 22,
         [ 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ];;
mor := MorphismConstructor( s3, mul, s3 );
#! <A morphism in BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms>
IsWellDefined( mor );
#! true
mor_as_functor :=
  UnderlyingFunctorOfBiset( ModelingMorphism(
          BisetCategoryOfFinGroupsUsingFunctorsAsMorphisms, mor ) );
#! A functor corresponding to a biset
id := IdentityMorphism( s3 );
#! <A morphism in BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms>
IsWellDefined( id );
#! true
id2 := PreCompose( id, id );
#! <An isomorphism in BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms>
IsWellDefined( id2 );
#! true
id2 = id;
#! true
id_mor := PreCompose( id, mor );
#! <A morphism in BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms>
IsWellDefined( id_mor );
#! true
id_mor = mor;
#! true
PreCompose( mor, id ) = mor;
#! true
mor2 := PreCompose( mor, mor );
#! <A morphism in BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms>
PairOfIntAndList( mor2 );
#! [ 22, [ 3, 0, 0, 0, 3, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 6, 0, 0, 0, 6, 0, 0 ] ]

#! @EndExample
