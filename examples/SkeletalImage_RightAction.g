#! @Chunk SkeletalImage_RightAction

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
M := FinRightGSet( S3, [ 2, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 1, (), 2 ], [ 1, (), 2 ] ], [ [ 1, (), 2 ] ], [], [] ];;
phi := MapOfFinGSets( M, imgs, M );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( phi );
#! true
IsEpimorphism( phi );
#! false
I := ImageObject( phi );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
iota := ImageEmbedding( phi );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
phi_res := CoastrictionToImage( phi );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
phi = PreCompose( phi_res, iota );
#! true
T := FinRightGSet( S3, [ 1, 1, 0, 0 ] );;
imgs := [ [ [ 1, (), 2 ], [ 1, (), 2 ] ], [ [ 1, (), 2 ] ], [], [] ];;
tau1 := MapOfFinGSets( M, imgs, T );;
imgs := [ [ [ 1, (), 1 ] ], [ [ 1, (), 2 ] ], [], [] ];;
tau2 := MapOfFinGSets( T, imgs, M );;
IsMonomorphism( tau2 );
#! true
phi = PreCompose( tau1, tau2 );
#! true
u := UniversalMorphismFromImage( phi, [ tau1, tau2 ] );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
tau1 = PreCompose( phi_res, u );
#! true
iota = PreCompose( u, tau2 );
#! true



M := FinRightGSet( S3, [ 2, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
imgs := [ [ [ 2, (), 1 ], [ 1, (), 1 ] ], [ [ 1, (), 2 ] ], [], [] ];;
phi := MapOfFinGSets( M, imgs, M );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
IsWellDefined( phi );
#! true
IsEpimorphism( phi );
#! true
I := ImageObject( phi );
#! <An object in SkeletalCategoryOfFiniteRightGSets( S3 )>
psi := ImageEmbedding( phi );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
phi_res := CoastrictionToImage( phi );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( S3 )>
phi = PreCompose( phi_res, psi );
#! true



S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
m := FinRightGSet( S0, [ 7 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
n := FinRightGSet( S0, [ 3 ] );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
imgs := [ [ [ 7, (), 1 ], [ 5, (), 1 ], [ 5, (), 1 ] ] ];;
phi := MapOfFinGSets( n, imgs, m );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
IsWellDefined( phi );
#! true
ImageObject( phi );
#! <An object in SkeletalCategoryOfFiniteRightGSets( 1 )>
AsList( ImageObject( phi ) );
#! [ 2 ]
pi := ImageEmbedding( phi );
#! <A monomorphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
Display( pi );
#! [ [ [ 5, (), 1 ], [ 7, (), 1 ] ] ]
phi_res := CoastrictionToImage( phi );
#! <A morphism in SkeletalCategoryOfFiniteRightGSets( 1 )>
phi = PreCompose( phi_res, pi );
#! true

#! @EndExample
