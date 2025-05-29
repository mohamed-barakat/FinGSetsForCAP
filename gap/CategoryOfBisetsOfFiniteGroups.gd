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
DeclareCategory( "IsCategoryOfBisetsOfFiniteGroups",
                 IsCapCategory );

#! @Description
#! The GAP category of objects in the category of bisets of finite groups.
#! @Arguments object
DeclareCategory( "IsObjectInCategoryOfBisetsOfFiniteGroups",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the category of bisets of finite groups.
#! @Arguments object
DeclareCategory( "IsMorphismInCategoryOfBisetsOfFiniteGroups",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments biset_object
#! @Returns a category
DeclareAttribute( "UnderlyingGroupAsCategory",
        IsObjectInCategoryOfBisetsOfFiniteGroups );

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments biset_object
#! @Returns a category
DeclareAttribute( "UnderlyingPreSheafCategoryOfGroupAsCategory",
        IsObjectInCategoryOfBisetsOfFiniteGroups );

#! @Description
#!  The group underlying the biset object as a category on one object
#! @Arguments biset_morphism
#! @Returns a functor
DeclareAttribute( "UnderlyingFunctorOfBisetMorphism",
        IsMorphismInCategoryOfBisetsOfFiniteGroups );

#! @Section Constructors

#! @Description
#! The output is the category of bisets of finite groups with morphisms being functors.
#! @Returns a category
#! @Arguments
DeclareOperation( "CategoryOfBisetsOfFiniteGroups",
                  [ ] );
#! @InsertChunk CategoryOfBisetsOfFiniteGroups

