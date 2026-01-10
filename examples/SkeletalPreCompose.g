#! @Chunk SkeletalPreCompose

#! @Example

LoadPackage( "FinGSetsForCAP", false );
#! true
S3 := SymmetricGroup( 3 );; StructureDescription( S3 );; S3;
#! S3
S := FinLeftGSet( S3, [ 1, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
R := FinLeftGSet( S3, [ 1, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
T := FinLeftGSet( S3, [ 1, 0, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
psi1 := MapOfFinGSets( S, [ [ [ 1, (1,2), 1 ] ], [], [], [] ], R );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( psi1 );
#! true
psi2 := MapOfFinGSets( R, [ [ [ 1, (1,2,3), 1 ] ] , [], [], [] ] , T );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( psi2 );
#! true
PreCompose( psi1, psi2 );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
phi := PreCompose( psi1, psi2 );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( phi );
#! true
Display( phi );
#! [ 1, [ 1, 0, 0, 0 ] ]
#!  |
#! [ [ [ [ 0 ], [ 0 ] ], [ [  ], [  ] ], [ [  ], [  ] ], [ [  ], [  ] ] ],\
#!  [ [ (2,3) ], [  ], [  ], [  ] ] ]
#!  |
#!  v
#! [ 1, [ 1, 0, 0, 0 ] ]

S := FinLeftGSet( S3, [ 2, 2, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
R := FinLeftGSet( S3, [ 2, 1, 0, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
T := FinLeftGSet( S3,  [ 2, 1, 1, 0 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( S3 )>
imgs := [ [ [ 2, (1,2), 1 ], [ 1, (1,2,3), 2 ] ],
          [ [ 1, (), 2 ], [ 1, (2,3), 2 ] ],
          [ ],
          [ ] ];;
psi1 := MapOfFinGSets( S, imgs, R );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( psi1 );
#! true
imgs := [ [ [ 1, (1,3), 1 ], [ 1, (1,2,3), 3 ] ],
          [ [ 1, (), 2 ] ],
          [ ],
          [ ] ];;
psi2 := MapOfFinGSets( R, imgs, T );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
IsWellDefined( psi2 );
#! true
pi := PreCompose( psi1, psi2 );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( S3 )>
Display( pi );
#! [ 4, [ 2, 2, 0, 0 ] ]
#!  |
#! [ [ [ [ 2, 1 ], [ 0, 0 ] ], [ [ 1, 1 ], [ 0, 0 ] ], [ [  ], [  ] ], [ [  ], [ \
#!  ] ] ], [ [ (2,3), (1,3,2) ], [ (), (2,3) ], [  ], [  ] ] ]
#!  |
#!  v
#! [ 4, [ 2, 1, 1, 0 ] ]


S0 := SymmetricGroup( 0 );; StructureDescription( S0 );; S0;
#! 1
m := FinLeftGSet( S0, [ 3 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( 1 )>
n := FinLeftGSet( S0, [ 5 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( 1 )>
p := FinLeftGSet( S0, [ 7 ] );
#! <An object in SkeletalCategoryOfFiniteLeftGSets( 1 )>
imgs := [ [ [ 2, (), 1 ], [ 5, (), 1 ], [ 3, (), 1 ] ] ];;
psi := MapOfFinGSets( m, imgs, n );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( 1 )>
imgs := [ [ [ 1, (), 1 ],
            [ 4, (), 1 ],
            [ 6, (), 1 ],
            [ 6, (), 1 ],
            [ 3, (), 1 ] ] ];;
phi := MapOfFinGSets( n, imgs, p );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( 1 )>
alpha := PreCompose( psi, phi );
#! <A morphism in SkeletalCategoryOfFiniteLeftGSets( 1 )>
Display( alpha );
#! [ 3, [ 3 ] ]
#!  |
#! [ [ [ [ 0, 0, 0 ], [ 3, 2, 5 ] ] ], [ [ (), (), () ] ] ]
#!  |
#!  v
#! [ 7, [ 7 ] ]


#! @EndExample
