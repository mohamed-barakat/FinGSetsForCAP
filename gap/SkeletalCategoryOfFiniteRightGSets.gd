# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Declarations
#

#! @Chapter The skeletal category of finite right $G$-sets

#! @Section GAP categories

#! @Description
#! The GAP category of the skeletal category of finite right $G$-sets.
#! @Arguments object
DeclareCategory( "IsSkeletalCategoryOfFiniteRightGSets",
                 IsCapCategory and IsSkeletalCategory );

#! @Description
#! The GAP category of objects in the skeletal category of finite right $G$-sets.
#! @Arguments object
DeclareCategory( "IsObjectInSkeletalCategoryOfFiniteRightGSets",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the skeletal category of finite right $G$-sets.
#! @Arguments object
DeclareCategory( "IsMorphismInSkeletalCategoryOfFiniteRightGSets",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The &GAP; set of the list used to construct a finite right $G$-set <A>Omega</A>, i.e.,
#!  <C>AsList( FinRightGSet( G, <A>L</A> ) ) = <A>L</A></C>.
#! @Arguments Omega
#! @Returns a &GAP; set
DeclareAttribute( "AsList",
        IsObjectInSkeletalCategoryOfFiniteRightGSets );

#! @Description
#!  The group $G$ underlying the finite right $G$-set <A>Omega</A>.
#! @Arguments Omega
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsObjectInSkeletalCategoryOfFiniteRightGSets );

#! @Section Constructors

#! @Description
#!  Construct a skeletal finite right $G$-set
#!  out of the group <A>G</A> and a list <A>L</A>, i.e.,
#!  an object in the &CAP; category <C>SkeletalCategoryOfFiniteRightGSets</C>.
#! @Arguments G, L
#! @Returns a &CAP; object
DeclareOperation( "FinRightGSet",
        [ IsGroup, IsList ] );
#! @InsertChunk SkeletalFinRightGSet

#! @Description
#!  Construct a map $\phi \colon$<A>s</A>$\to$<A>t</A> of the skeletal finite right $G$-sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category <C>SkeletalCategoryOfFiniteRightGSets</C>, where <A>images</A>
#!  is a list of lists describing the graph of $\phi$.
#! @Arguments s, images, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinGSets",
        [ IsObjectInSkeletalCategoryOfFiniteRightGSets, IsList, IsObjectInSkeletalCategoryOfFiniteRightGSets ] );
#! @InsertChunk SkeletalMapOfRightFinGSets

#! @Description
#! The argument is a group $G$.
#! The output is the skeletal category of finite right $G$-sets.
#! @Returns a category
#! @Arguments G
DeclareAttribute( "SkeletalCategoryOfFiniteRightGSets",
                  IsGroup );
