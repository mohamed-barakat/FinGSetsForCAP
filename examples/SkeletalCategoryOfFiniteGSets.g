#! @Chunk SkeletalCategoryOfFiniteGSets

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
StructureDescription( S3 );
#! S3
SetName( S3, StructureDescription( S3 ) );

GSets := SkeletalCategoryOfFiniteGSets( S3 );
#! SkeletalCategoryOfFiniteGSets( S3 )
Display( GSets );
#! A CAP category with name SkeletalCategoryOfFiniteGSets( S3 ):
#! 
#! 15 primitive operations were used to derive 58 operations for this category \
#! which algorithmically
#! * IsCocartesianCategory
#! and not yet algorithmically
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSkeletalCategory
#! * IsStrictCocartesianCategory
Y := EmbeddingOfUnderlyingGroupAsCategory( GSets );
#! Embedding functor of underlying group as category into the skeletal category of finite G-sets
AA := Pair( 4, [ 2, 1, 0, 1 ] ) / GSets;
#! <An object in SkeletalCategoryOfFiniteGSets( S3 )>
BB := Pair( 6, [ 1, 1, 3, 1 ] ) / GSets;
#! <An object in SkeletalCategoryOfFiniteGSets( S3 )>
diagram := [ AA, BB ];
#! [ <An object in SkeletalCategoryOfFiniteGSets( S3 )>,\
#!  <An object in SkeletalCategoryOfFiniteGSets( S3 )> ]
CC := Coproduct( diagram );
#! <An object in SkeletalCategoryOfFiniteGSets( S3 )>
Inj1 := InjectionOfCofactorOfCoproduct( diagram, 1 );
#! <A morphism in SkeletalCategoryOfFiniteGSets( S3 )>
Inj2 := InjectionOfCofactorOfCoproduct( diagram, 2 );
#! <A morphism in SkeletalCategoryOfFiniteGSets( S3 )>
U := UniversalMorphismFromCoproduct( [ Inj1, Inj2 ] );
#! <A morphism in SkeletalCategoryOfFiniteGSets( S3 )>
IsOne( U );
#! true
Id := ExtendFunctorToSkeletalCategoryOfFiniteGSets( Y );
#! Extension to SkeletalFinGSets( Source( Embedding functor of underlying group as category into the skeletal category of finite G-sets ) )

GSets_Fabian := SkeletalFinGSets( S3 );
#! SkeletalFin-S3-Sets
a := FinGSet( S3, ObjectDatum( AA )[2] );
#! <An object in SkeletalFin-S3-Sets>
b := FinGSet( S3, ObjectDatum( BB )[2] );
#! <An object in SkeletalFin-S3-Sets>
c := FinGSet( S3, ObjectDatum( CC )[2] );
#! <An object in SkeletalFin-S3-Sets>
Assert( 0, c = Coproduct( a, b ) );
#! @EndExample

