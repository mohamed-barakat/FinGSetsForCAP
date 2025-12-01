# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Declarations
#

#! @Chapter The category of bisets of finite groups

#! @Section GAP Categories

#! @Description
#! The GAP category of the category of bisets of finite groups.
#! @Arguments object
DeclareCategory( "IsBisetCategoryOfFiniteGroupsUsingPreSheaves",
                 IsCapCategory );

#! @Description
#! The GAP category of objects in the category of bisets of finite groups.
#! @Arguments object
DeclareCategory( "IsObjectInBisetCategoryOfFiniteGroupsUsingPreSheaves",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the category of bisets of finite groups.
#! @Arguments object
DeclareCategory( "IsMorphismInBisetCategoryOfFiniteGroupsUsingPreSheaves",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments group_in_biset_category
#! @Returns a category
DeclareAttribute( "UnderlyingGroupAsCategory",
        IsObjectInBisetCategoryOfFiniteGroupsUsingPreSheaves );

#! @Description
#!  The presheaf category of the group underlying the biset object as a category on one object
#! @Arguments group_in_biset_category
#! @Returns a category
DeclareAttribute( "UnderlyingPreSheafCategoryOfGroupAsCategory",
        IsObjectInBisetCategoryOfFiniteGroupsUsingPreSheaves );

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments biset
#! @Returns a functor
DeclareAttribute( "UnderlyingFunctorOfBisetMorphism",
        IsMorphismInBisetCategoryOfFiniteGroupsUsingPreSheaves );

#! @Section Constructors

#! @Description
#! The output is the biset category of finite groups with morphisms being functors.
#! @Returns a category
#! @Arguments
DeclareOperation( "BisetCategoryOfFiniteGroupsUsingPreSheaves",
                  [ ] );
#! @InsertChunk BisetCategoryOfFiniteGroupsUsingPreSheaves

