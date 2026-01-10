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
DeclareCategory( "IsSkeletalCategoryOfFinGSets",
                 IsCapCategory and IsSkeletalCategory );

#! @Description
#! The GAP category of objects in the skeletal category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsObjectInSkeletalCategoryOfFinGSets",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the skeletal category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsMorphismInSkeletalCategoryOfFinGSets",
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
DeclareAttribute( "SkeletalCategoryOfFinGSets",
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
        IsSkeletalCategoryOfFinGSets );

CapJitAddTypeSignature( "UnderlyingGroup", [ IsSkeletalCategoryOfFinGSets ], function ( input_types )
    
    return CapJitDataTypeOfGroup( UnderlyingGroup( input_types[1].category ) );
    
end );

#! @Description
#!  The group $G$ underlying the skeletal category of finite $G$-sets
#!  viewed as a category on one object.
#! @Arguments GSet
#! @Returns a category
DeclareAttribute( "UnderlyingGroupAsCategory",
        IsSkeletalCategoryOfFinGSets );

CapJitAddTypeSignature( "UnderlyingGroupAsCategory", [ IsSkeletalCategoryOfFinGSets ], function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingGroupAsCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The number of transitive G-sets.
#! @Arguments GSet
#! @Returns a group
DeclareAttribute( "NumberOfTransitiveGSets",
        IsSkeletalCategoryOfFinGSets );

CapJitAddTypeSignature( "NumberOfTransitiveGSets", [ IsSkeletalCategoryOfFinGSets ], IsBigInt );

#! @Description
#!  The input is a finite $G$-set <A>Omega</A>.
#!  The output is a pair.
#!  The second entry of this pair is list of multiplicities
#!  of the transitive $G$-sets of which <A>Omega</A> is the coproduct.
#!  The first entry is the sum of these multiplicities.
#! @Arguments Omega
#! @Returns a list
DeclareAttribute( "PairOfSumAndListOfMultiplicities",
        IsObjectInSkeletalCategoryOfFinGSets );

#! @Description
#!  The input is a finite $G$-set <A>Omega</A>.
#!  The output is a pair.
#!  The second entry of this pair is list of multiplicities
#!  of the transitive $G$-sets of which <A>Omega</A> is the coproduct.
#!  The first entry is the sum of these multiplicities.
#! @Arguments phi
#! @Returns a list
DeclareAttribute( "PairOfLists",
        IsMorphismInSkeletalCategoryOfFinGSets );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInSkeletalCategoryOfFinGSets ],
 function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfFinGSets( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfListOf( IsBigInt ),
                   CapJitDataTypeOfListOf( CapJitDataTypeOfElementOfGroup( UnderlyingGroup( input_types[1].category ) ) ) );
    
end );

DeclareAttribute( "EmbeddingOfUnderlyingGroupAsCategoryData",
        IsSkeletalCategoryOfFinGSets );

#! @Description
#!  The full embedding functor from the group $G$ underlying
#!  the skeletal category of finite $G$-sets <A>GSet</A> into <A>GSet</A>.
#! @Arguments GSet
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingGroupAsCategory",
        IsSkeletalCategoryOfFinGSets );

DeclareOperation( "ExtendFunctorToSkeletalCategoryOfFinGSetsData",
        [ IsSkeletalCategoryOfFinGSets, IsList, IsCategoryWithCoequalizers ] );

#! @Description
#!  The full embedding functor from the group $G$ underlying
#!  the finite colimit completion <A>sFinGSets</A> into <A>sFinGSets</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToSkeletalCategoryOfFinGSets",
        IsCapFunctor );
