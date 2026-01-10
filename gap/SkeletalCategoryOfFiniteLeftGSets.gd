# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Declarations
#

#! @Chapter The skeletal category of finite left $G$-sets

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#! The GAP category of the skeletal category of finite left $G$-sets.
#! @Arguments object
DeclareCategory( "IsSkeletalCategoryOfFiniteLeftGSets",
                 IsCapCategory and IsSkeletalCategory );

#! @Description
#! The GAP category of objects in the skeletal category of finite left $G$-sets.
#! @Arguments object
DeclareCategory( "IsObjectInSkeletalCategoryOfFiniteLeftGSets",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the skeletal category of finite left $G$-sets.
#! @Arguments object
DeclareCategory( "IsMorphismInSkeletalCategoryOfFiniteLeftGSets",
                 IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @InsertChunk SkeletalCategoryOfFiniteLeftGSets
#! @Description
#! The argument is a group $G$.
#! The output is the skeletal category of finite left $G$-sets.
#! @Returns a category
#! @Arguments G
DeclareAttribute( "SkeletalCategoryOfFiniteLeftGSets",
                  IsGroup );

#! @Description
#!  Construct a skeletal finite left $G$-set
#!  out of the group <A>G</A> and a list <A>L</A>, i.e.,
#!  an object in the &CAP; category <C>SkeletalCategoryOfFiniteLeftGSets</C>.
#! @Arguments G, L
#! @Returns a &CAP; object
DeclareOperation( "FinLeftGSet",
        [ IsGroup, IsList ] );
#! @InsertChunk SkeletalFinLeftGSet

#! @Description
#!  Construct a map $\phi \colon$<A>s</A>$\to$<A>t</A> of the skeletal finite left $G$-sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category <C>SkeletalCategoryOfFiniteLeftGSets</C>, where <A>images</A> is a pair,
#!  where the first entry is a list of pairs of lists of integers and the second entry is a list of lists of group elements.
#! @Arguments s, images, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinGSets",
        [ IsObjectInSkeletalCategoryOfFiniteLeftGSets, IsList, IsObjectInSkeletalCategoryOfFiniteLeftGSets ] );
#! @InsertChunk SkeletalMapOfLeftFinGSets

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The group $G$ underlying the skeletal category of finite left $G$-sets.
#! @Arguments GSet
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsSkeletalCategoryOfFiniteLeftGSets );

CapJitAddTypeSignature( "UnderlyingGroup", [ IsSkeletalCategoryOfFiniteLeftGSets ], function ( input_types )
    
    return CapJitDataTypeOfGroup( UnderlyingGroup( input_types[1].category ) );
    
end );

#! @Description
#!  The group $G$ underlying the skeletal category of finite left $G$-sets
#!  viewed as a category on one object.
#! @Arguments GSet
#! @Returns a category
DeclareAttribute( "UnderlyingGroupAsCategory",
        IsSkeletalCategoryOfFiniteLeftGSets );

CapJitAddTypeSignature( "UnderlyingGroupAsCategory", [ IsSkeletalCategoryOfFiniteLeftGSets ], function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingGroupAsCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The number of transitive G-sets.
#! @Arguments GSet
#! @Returns a group
DeclareAttribute( "NumberOfTransitiveGSets",
        IsSkeletalCategoryOfFiniteLeftGSets );

CapJitAddTypeSignature( "NumberOfTransitiveGSets", [ IsSkeletalCategoryOfFiniteLeftGSets ], IsBigInt );

#! @Description
#!  The input is a finite left $G$-set <A>Omega</A>.
#!  The output is a pair.
#!  The second entry of this pair is list of multiplicities
#!  of the transitive $G$-sets of which <A>Omega</A> is the coproduct.
#!  The first entry is the sum of these multiplicities.
#! @Arguments Omega
#! @Returns a list
DeclareAttribute( "PairOfSumAndListOfMultiplicities",
        IsObjectInSkeletalCategoryOfFiniteLeftGSets );

#! @Description
#!  The input is a finite left $G$-set <A>Omega</A>.
#!  The output is a pair.
#!  The second entry of this pair is list of multiplicities
#!  of the transitive $G$-sets of which <A>Omega</A> is the coproduct.
#!  The first entry is the sum of these multiplicities.
#! @Arguments phi
#! @Returns a list
DeclareAttribute( "PairOfLists",
        IsMorphismInSkeletalCategoryOfFiniteLeftGSets );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInSkeletalCategoryOfFiniteLeftGSets ],
 function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfFiniteLeftGSets( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfListOf( IsBigInt ),
                   CapJitDataTypeOfListOf( CapJitDataTypeOfElementOfGroup( UnderlyingGroup( input_types[1].category ) ) ) );
    
end );

DeclareAttribute( "EmbeddingOfUnderlyingGroupAsCategoryData",
        IsSkeletalCategoryOfFiniteLeftGSets );

#! @Description
#!  The full embedding functor from the group $G$ underlying
#!  the skeletal category of finite left $G$-sets <A>GSet</A> into <A>GSet</A>.
#! @Arguments GSet
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingGroupAsCategory",
        IsSkeletalCategoryOfFiniteLeftGSets );

DeclareOperation( "ExtendFunctorToSkeletalCategoryOfFiniteLeftGSetsData",
        [ IsSkeletalCategoryOfFiniteLeftGSets, IsList, IsCategoryWithCoequalizers ] );

#! @Description
#!  The full embedding functor from the group $G$ underlying
#!  the finite colimit completion <A>sFinGSets</A> into <A>sFinGSets</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToSkeletalCategoryOfFiniteLeftGSets",
        IsCapFunctor );

####################################
#
#! @Section Operations
#
####################################

DeclareOperation( "FromListOfListsOfTriplesToPairOfLists",
        [ IsSkeletalCategoryOfFiniteLeftGSets, IsList ] );

DeclareOperation( "FromPairOfListsToListOfListsOfTriples",
        [ IsSkeletalCategoryOfFiniteLeftGSets, IsList ] );
