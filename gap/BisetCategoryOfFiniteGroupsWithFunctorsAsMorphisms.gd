# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Declarations
#

#! @Chapter The biset category of finite groups

#! @Section GAP Categories

#! @Description
#!  The GAP category of the biset category with functors as morphisms.
#! @Arguments object
DeclareCategory( "IsBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms",
        IsCapCategory );

#! @Description
#!  The GAP category of objects in the biset category with functors as morphisms.
#! @Arguments object
DeclareCategory( "IsObjectInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms",
        IsCapCategoryObject );

#! @Description
#!  The GAP category of morphisms in the biset category with functors as morphisms.
#! @Arguments object
DeclareCategory( "IsMorphismInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms",
        IsCapCategoryMorphism );

#! @Description
#!  The GAP category of the biset category.
#! @Arguments object
DeclareCategory( "IsBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms",
        IsCapCategory );

#! @Description
#!  The GAP category of objects in the biset category.
#! @Arguments object
DeclareCategory( "IsObjectInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms",
        IsCapCategoryObject );

#! @Description
#!  The GAP category of morphisms in the biset category.
#! @Arguments object
DeclareCategory( "IsMorphismInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms",
        IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments biset_object
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsObjectInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms );

#! @Description
#!  The skeletal category of finite G set underlying the biset object
#! @Arguments biset_object
#! @Returns a category
DeclareAttribute( "UnderlyingSkeletalCategoryOfFinGSets",
        IsObjectInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms );

#! @Description
#!  The functor underlying the biset
#! @Arguments biset
#! @Returns a functor
DeclareAttribute( "UnderlyingFunctorOfBiset",
        IsMorphismInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms );

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments biset_object
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsObjectInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms );

#! @Description
#!  The skeletal category of finite G set underlying the biset object
#! @Arguments biset_object
#! @Returns a category
DeclareAttribute( "UnderlyingSkeletalCategoryOfFinGSets",
        IsObjectInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms );

#! @Description
#!  A pair of containing an integer as a first entry and
#!  a list of nonnegative integers as a second entry.
#! @Arguments biset
#! @Returns a pair
DeclareAttribute( "PairOfIntAndList",
        IsMorphismInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms );

#! @Description
#!  The table of marks of the direct product of the source and target of the morphism.
#! @Arguments biset
#! @Returns a pair
DeclareAttribute( "UnderlyingTableOfMarks",
        IsMorphismInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms );

#! @Section Constructors

#! @Description
#!  The output is the biset category of finite groups with functors as morphisms.
#! @Returns a category
#! @Arguments
DeclareOperation( "BisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms",
                  [ ] );
#! @InsertChunk BisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms

#! @Description
#!  The output is the biset category of finite groups.
#! @Returns a category
#! @Arguments
DeclareOperation( "BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms",
                  [ ] );
#! @InsertChunk BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms
