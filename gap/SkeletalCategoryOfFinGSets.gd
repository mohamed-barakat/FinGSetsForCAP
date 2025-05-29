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
DeclareCategory( "IsSkeletalCategoryOfFinGSetCategory",
                 IsCapCategory and IsSkeletalCategory );

#! @Description
#! The GAP category of objects in the skeletal category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsObjectInSkeletalCategoryOfFinGSetCategory",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the skeletal category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsMorphismInSkeletalCategoryOfFinGSetCategory",
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
#!  The &GAP; set of the list used to construct a finite $G$-set <A>Omega</A>, i.e.,
#!  <C>AsList( FinGSet( G, <A>L</A> ) ) = <A>L</A></C>.
#! @Arguments Omega
#! @Returns a &GAP; set
DeclareAttribute( "ListOfMultiplicitiesOfTransitiveGSets",
        IsObjectInSkeletalCategoryOfFinGSetCategory );

#! @Description
#!  The group $G$ underlying the skeletal category of finite $G$-sets.
#! @Arguments GSet
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsSkeletalCategoryOfFinGSetCategory );

#! @Description
#!  The group $G$ underlying the skeletal category of finite $G$-sets
#!  viewed as a category on one object.
#! @Arguments GSet
#! @Returns a category
DeclareAttribute( "UnderlyingGroupAsCategory",
        IsSkeletalCategoryOfFinGSetCategory );

DeclareAttribute( "EmbeddingOfUnderlyingGroupAsCategoryData",
        IsSkeletalCategoryOfFinGSetCategory );

#! @Description
#!  The full embedding functor from the group $G$ underlying
#!  the skeletal category of finite $G$-sets <A>GSet</A> into <A>GSet</A>.
#! @Arguments GSet
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingGroupAsCategory",
        IsSkeletalCategoryOfFinGSetCategory );
