# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Declarations
#

#! @Chapter The biset category of finite groups

#! @Section GAP Categories

#! @Description
#!  The GAP category of the biset category with action data as morphisms.
#! @Arguments object
DeclareCategory( "IsBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms",
        IsCapCategory );

#! @Description
#!  The GAP category of objects in the biset category with action data as morphisms.
#! @Arguments object
DeclareCategory( "IsObjectInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms",
        IsCapCategoryObject );

#! @Description
#!  The GAP category of morphisms in the biset category with action data as morphisms.
#! @Arguments object
DeclareCategory( "IsMorphismInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms",
        IsCapCategoryMorphism );

#! @Description
#!  The GAP category of the biset category.
#! @Arguments object
DeclareCategory( "IsBisetCategoryOfFiniteGroups",
        IsCapCategory );

#! @Description
#!  The GAP category of objects in the biset category.
#! @Arguments object
DeclareCategory( "IsObjectInBisetCategoryOfFiniteGroups",
        IsCapCategoryObject );

#! @Description
#!  The GAP category of morphisms in the biset category.
#! @Arguments object
DeclareCategory( "IsMorphismInBisetCategoryOfFiniteGroups",
        IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments biset_object
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsObjectInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms );

#! @Description
#!  The skeletal category of finite G set underlying the biset object
#! @Arguments biset_object
#! @Returns a category
DeclareAttribute( "UnderlyingSkeletalCategoryOfFiniteLeftGSets",
        IsObjectInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms );

#! @Description
#!  The underlying action data of the GxH-biset.
#!  It is a pair consisting of an $H$-set $X$ and a list, which for each generator of G contains its action on $X$ as an automorphism of $X$.
#! @Arguments biset
#! @Returns a list
DeclareAttribute( "UnderlyingActionPair",
        IsMorphismInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms );

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments biset_object
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsObjectInBisetCategoryOfFiniteGroups );

#! @Description
#!  The skeletal category of finite G set underlying the biset object
#! @Arguments biset_object
#! @Returns a category
DeclareAttribute( "UnderlyingSkeletalCategoryOfFiniteLeftGSets",
        IsObjectInBisetCategoryOfFiniteGroups );

#! @Description
#!  A pair of containing an integer as a first entry and
#!  a list of nonnegative integers as a second entry.
#! @Arguments biset
#! @Returns a pair
DeclareAttribute( "PairOfIntAndList",
        IsMorphismInBisetCategoryOfFiniteGroups );

#! @Description
#!  The table of marks of the direct product of the source and target of the morphism.
#! @Arguments biset
#! @Returns a pair
DeclareAttribute( "UnderlyingTableOfMarks",
        IsMorphismInBisetCategoryOfFiniteGroups );

#! @Section Constructors

#! @Description
#!  The output is the biset category of finite groups with action data as morphisms.
#! @Returns a category
#! @Arguments
DeclareOperation( "BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms",
                  [ ] );
#! @InsertChunk BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms

#! @Description
#!  The output is the biset category of finite groups.
#! @Returns a category
#! @Arguments
DeclareOperation( "BisetCategoryOfFiniteGroups",
                  [ ] );
#! @InsertChunk BisetCategoryOfFiniteGroups
