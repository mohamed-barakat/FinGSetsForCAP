# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Declarations
#

#! @Chapter The skeletal category of finite $G$-sets

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#! The GAP category of the skeletal category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsSkeletalCategoryOfFiniteGSets",
                 IsCapCategory and IsSkeletalCategory );

#! @Description
#! The GAP category of objects in the skeletal category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsObjectInSkeletalCategoryOfFiniteGSets",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the skeletal category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsMorphismInSkeletalCategoryOfFiniteGSets",
                 IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @InsertChunk SkeletalFinGSet
#! @Description
#! The argument is a group $G$.
#! The output is the skeletal category of finite $G$-Sets.
#! @Returns a category
#! @Arguments G
DeclareAttribute( "SkeletalCategoryOfFiniteGSets",
                  IsGroup );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The group $G$ underlying the skeletal category of finite $G$-sets.
#! @Arguments GSet
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsSkeletalCategoryOfFiniteGSets );

CapJitAddTypeSignature( "UnderlyingGroup", [ IsSkeletalCategoryOfFiniteGSets ], function ( input_types )
    
    return CapJitDataTypeOfGroup( UnderlyingGroup( input_types[1].category ) );
    
end );

#! @Description
#!  The group $G$ underlying the skeletal category of finite $G$-sets
#!  viewed as a category on one object.
#! @Arguments GSet
#! @Returns a category
DeclareAttribute( "UnderlyingGroupAsCategory",
        IsSkeletalCategoryOfFiniteGSets );

CapJitAddTypeSignature( "UnderlyingGroupAsCategory", [ IsSkeletalCategoryOfFiniteGSets ], function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingGroupAsCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The number of transitive G-sets.
#! @Arguments GSet
#! @Returns a group
DeclareAttribute( "NumberOfTransitiveGSets",
        IsSkeletalCategoryOfFiniteGSets );

CapJitAddTypeSignature( "NumberOfTransitiveGSets", [ IsSkeletalCategoryOfFiniteGSets ], IsBigInt );

#! @Description
#!  The input is a finite $G$-set <A>Omega</A>.
#!  The output is a pair.
#!  The second entry of this pair is list of multiplicities
#!  of the transitive $G$-sets of which <A>Omega</A> is the coproduct.
#!  The first entry is the sum of these multiplicities.
#! @Arguments Omega
#! @Returns a list
DeclareAttribute( "PairOfSumAndListOfMultiplicities",
        IsObjectInSkeletalCategoryOfFiniteGSets );

#! @Description
#!  The input is a finite $G$-set <A>Omega</A>.
#!  The output is a pair.
#!  The second entry of this pair is list of multiplicities
#!  of the transitive $G$-sets of which <A>Omega</A> is the coproduct.
#!  The first entry is the sum of these multiplicities.
#! @Arguments phi
#! @Returns a list
DeclareAttribute( "PairOfLists",
        IsMorphismInSkeletalCategoryOfFiniteGSets );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInSkeletalCategoryOfFiniteGSets ],
 function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfFiniteGSets( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfListOf( IsBigInt ),
                   CapJitDataTypeOfListOf( CapJitDataTypeOfElementOfGroup( UnderlyingGroup( input_types[1].category ) ) ) );
    
end );

DeclareAttribute( "EmbeddingOfUnderlyingGroupAsCategoryData",
        IsSkeletalCategoryOfFiniteGSets );

#! @Description
#!  The full embedding functor from the group $G$ underlying
#!  the skeletal category of finite $G$-sets <A>GSet</A> into <A>GSet</A>.
#! @Arguments GSet
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingGroupAsCategory",
        IsSkeletalCategoryOfFiniteGSets );

DeclareOperation( "ExtendFunctorToSkeletalCategoryOfFiniteGSetsData",
        [ IsSkeletalCategoryOfFiniteGSets, IsList, IsCategoryWithCoequalizers ] );

#! @Description
#!  The full embedding functor from the group $G$ underlying
#!  the finite colimit completion <A>sFinGSets</A> into <A>sFinGSets</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToSkeletalCategoryOfFiniteGSets",
        IsCapFunctor );
