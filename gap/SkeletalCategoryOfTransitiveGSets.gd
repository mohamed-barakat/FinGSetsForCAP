# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The elementary topos of (skeletal) finite G-sets
#
# Declarations
#

#! @Chapter The skeletal category of transitive G-sets

#! @Section GAP Categories

#! @Description
#! The GAP category of the skeletal category of transitive $G$-sets.
#! @Arguments object
DeclareCategory( "IsSkeletalCategoryOfTransitiveGSets",
                 IsCapCategory and IsSkeletalCategory );

#! @Description
#! The GAP category of objects in the skeletal category of transitive $G$-sets.
#! @Arguments object
DeclareCategory( "IsObjectInSkeletalCategoryOfTransitiveGSets",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the skeletal category of transitive $G$-sets.
#! @Arguments object
DeclareCategory( "IsMorphismInSkeletalCategoryOfTransitiveGSets",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The group $G$ underlying the skeletal category <A>C</A> of transitive $G$-set.
#! @Arguments C
#! @Returns a group
DeclareAttribute( "UnderlyingGroup",
        IsSkeletalCategoryOfTransitiveGSets );

#! @Description
#!  The table of marks of the group $G$ underlying the skeletal category <A>C</A> of transitive $G$-set.
#! @Arguments C
#! @Returns a table of marks
DeclareAttribute( "UnderlyingTableOfMarks",
        IsSkeletalCategoryOfTransitiveGSets );

#! @Description
#!  The number of objects of the skeletal category <A>C</A> of transitive $G$-set.
#! @Arguments C
#! @Returns a positive integer
DeclareAttribute( "NumberOfObjects",
        IsSkeletalCategoryOfTransitiveGSets );

#! @Description
#!  The list of cardinalities of objects of the skeletal category <A>C</A> of transitive $G$-set.
#! @Arguments C
#! @Returns a positive integer
DeclareAttribute( "CardinalitiesOfObjects",
        IsSkeletalCategoryOfTransitiveGSets );

#! @Description
#!  The number of objects of the skeletal category <A>C</A> of transitive $G$-set.
#! @Arguments C
#! @Returns a positive integer
DeclareAttribute( "RepresentativesOfSubgroupsUpToConjugation",
        IsSkeletalCategoryOfTransitiveGSets );

#! @Description
#!  The positive integer $i$ such that the transitive $G$-set <A>Omega</A> $\cong U_i \backslash G$, i.e.,
#!  <C>IndexOfObject( TransitiveGSet( G, i ) ) = i</C>.
#! @Arguments Omega
#! @Returns a positive integer
DeclareAttribute( "IndexOfObject",
        IsObjectInSkeletalCategoryOfTransitiveGSets );

#! @Description
#!  The group elements $g \in G$ defining the morphism <A>phi</A>: $\cong U_s \backslash G \to U_t \backslash G$
#!  satisfying $g U_s g^{-1} \leq U_t$, or, equivalently, $g U_s \subseteq U_t g$.
#! @Arguments phi
#! @Returns a group element
DeclareAttribute( "UnderlyingGroupElement",
        IsMorphismInSkeletalCategoryOfTransitiveGSets );

#! @Description
#!  The size of the transitive $G$-set <A>Omega</A>.
#! @Arguments Omega
#! @Returns a positive integer
DeclareAttribute( "Size",
        IsObjectInSkeletalCategoryOfTransitiveGSets );

#! @Description
#!  The input is a transitive $G$-set <A>Omega</A> $\cong G / U_i$.
#!  The output is the list of endomorphisms of the principal $G$-set $G / U_1$ defined by the generators of $U_i$.
#!  The coequalizers of these morphisms is the input object <A>Omega</A> $\cong G / U_i$.
#! @Arguments Omega
#! @Returns a list of morphisms
DeclareAttribute( "CoequalizerMorphisms",
        IsObjectInSkeletalCategoryOfTransitiveGSets );

#! @Section Constructors

#! @Description
#! The argument is a group $G$.
#! The output is the skeletal category of transitive $G$-Sets.
#! @Returns a category
#! @Arguments G
DeclareAttribute( "SkeletalTransitiveGSets",
                  IsGroup );
#! @InsertChunk SkeletalTransitiveGSets
