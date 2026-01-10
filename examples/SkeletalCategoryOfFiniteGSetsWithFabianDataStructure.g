#! @Chunk SkeletalCategoryOfFiniteGSetsWithFabianDataStructure

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
StructureDescription( S3 );
#! S3
SetName( S3, StructureDescription( S3 ) );

GSets_comp := SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 );
#! SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )
A := [ 2, 1, 0, 1 ] / GSets_comp;
#! <An object in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>
B := [ 1, 1, 3, 1 ] / GSets_comp;
#! <An object in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>
diagram := [ A, B ];
#! [ <An object in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>,
#!   <An object in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )> ]
C := Coproduct( diagram );
#! <An object in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>
inj1 := InjectionOfCofactorOfCoproduct( diagram, 1 );
#! <A morphism in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>
inj2 := InjectionOfCofactorOfCoproduct( diagram, 2 );
#! <A morphism in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>
u := UniversalMorphismFromCoproduct( [ inj1, inj2 ] );
#! <A morphism in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>
IsOne( u );
#! true

GSets := SkeletalCategoryOfFiniteLeftGSets( S3 );
#! SkeletalCategoryOfFiniteLeftGSets( S3 )
Display( GSets );
#! A CAP category with name SkeletalCategoryOfFiniteLeftGSets( S3 ):
#! 
#! 19 primitive operations were used to derive 90 operations for this category \
#! which algorithmically
#! * IsCategoryWithTerminalObject
#! * IsCocartesianCategory
#! and not yet algorithmically
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSkeletalCategory
#! * IsStrictCocartesianCategory
Assert( 0, GSets = ModelingCategory( GSets_comp ) );
Y := EmbeddingOfUnderlyingGroupAsCategory( GSets );
#! Embedding functor into the skeletal category of finite G-sets
AA := Pair( 4, AsList( A ) ) / GSets;
#! <An object in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>
BB := Pair( 6, AsList( B ) ) / GSets;
#! <An object in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>
Id := ExtendFunctorToSkeletalCategoryOfFiniteLeftGSets( Y );
#! Extension to SkeletalCategoryOfFiniteLeftGSets( Source( Embedding functor into the skeletal category of finite G-sets ) )
uu := ModelingMorphism( GSets_comp, u );
#! <A morphism in SkeletalCategoryOfFiniteGSetsWithFabianDataStructure( S3 )>

Assert( 0, Id( uu ) = uu );

GSets_Fabian := SkeletalCategoryOfFiniteRightGSets( S3 );
#! SkeletalFinGSets( S3 )
a := FinRightGSet( S3, ObjectDatum( A ) );
b := FinRightGSet( S3, ObjectDatum( B ) );
c := FinRightGSet( S3, ObjectDatum( C ) );
Assert( 0, c = Coproduct( a, b ) );
i1 := MapOfFinGSets( a, MorphismDatum( inj1 ), c );
i2 := MapOfFinGSets( b, MorphismDatum( inj2 ), c );
u := MapOfFinGSets( c, MorphismDatum( u ), c );
Assert( 0, i1 = InjectionOfCofactorOfCoproduct( [ a, b ], 1 ) );
Assert( 0, i2 = InjectionOfCofactorOfCoproduct( [ a, b ], 2 ) );
Assert( 0, u = UniversalMorphismFromCoproduct( [ i1, i2 ] ) );
#! @EndExample
