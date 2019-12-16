#
# FinGSetsForCAP: FinGSets
#
# Declarations
#

#! @Chapter The category of finite G-sets

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in the category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsFinGSet",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in the category of finite $G$-sets.
#! @Arguments object
DeclareCategory( "IsFinGSetMap",
        IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The group $G$ underlying the finite $G$-set <A>Omega</A>.
#! @Arguments Omega
#! @Returns a group
#! @Group UnderlyingGroup
DeclareAttribute( "UnderlyingGroup",
        IsFinGSet );

#! @Arguments phi
#! @Group UnderlyingGroup
DeclareAttribute( "UnderlyingGroup",
        IsFinGSetMap );

#! @Description
#!  The set underlying the finite $G$-set <A>Omega</A>.
#! @Arguments Omega
#! @Returns an object in the CAP category FinSets
DeclareAttribute( "UnderlyingCell",
        IsFinGSet );

#! @Description
#!  The action function underlying the finite $G$-set <A>Omega</A>.
#! @Arguments Omega
#! @Returns a 2-argument function
DeclareAttribute( "UnderlyingAction",
        IsFinGSet );

#! @Description
#!  The list of the set underlying the finite $G$-set <A>Omega</A>.
#! @Arguments Omega
#! @Returns a list
DeclareAttribute( "AsList",
        IsFinGSet );

#! @Description
#!  The action homomorphism of the finite $G$-set <A>Omega</A>.
#! @Arguments Omega
#! @Returns a general mapping
DeclareAttribute( "UnderlyingActionHomomorphism",
        IsFinGSet );

#! @Description
#!  The orbits of the finite $G$-set <A>Omega</A>.
#! @Arguments Omega
#! @Returns a general mapping
DeclareAttribute( "Orbits",
        IsFinGSet );

#! @Description
#!  The morphism underlying the finite $G$-equivariant map <A>phi</A>.
#! @Arguments phi
#! @Returns a morphism in the CAP category FinSets
DeclareAttribute( "UnderlyingCell",
        IsFinGSetMap );

#! @Section Constructors

#! @Description
#!  Construct a skeletal finite $G$-set of the action homomorphism
#!  <A>act</A>$\colon G \to \mathrm{S}_n$.
#!  The output is an object in the &CAP; category <C>FinGSets</C>.
#! @Arguments G, M, act
#! @Returns a &CAP; object
#! @Group FinGSet
DeclareOperation( "FinGSet",
        [ IsGroup, IsFiniteSet, IsFunction ] );

#! @Group FinGSet
#! @Arguments G, L, act
DeclareOperation( "FinGSet",
        [ IsGroup, IsList, IsFunction ] );
#! @InsertChunk FinGSet

#! @Description
#!  Construct a map $\phi \colon$<A>S</A>$\to$<A>T</A> of the finite $G$-sets <A>S</A> and <A>T</A>,
#!  where <A>phi</A> is a $G$-equivariant map of the underlying sets.
#!  The output is a morphism in the &CAP; category <C>FinGSets</C>.
#! @Arguments S, phi, T
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinGSets",
        [ IsFinGSet, IsFiniteSetMap, IsFinGSet ] );
#! @InsertChunk  MapOfFinGSets

#! @Description
#!  The relation underlying a map between finite $G$-sets,
#!  i.e., <C>AsList( MapOfFinSets( S, <A>G</A>, T ) ) = <A>G</A></C>.
#! @Arguments f
#! @Returns a list
DeclareAttribute( "AsList",
        IsFinGSetMap );

#! @Description
#!  Construct the embedding $\iota:$<A>S</A>$\to$<A>T</A> of the finite $G$-sets <A>S</A> and <A>T</A>,
#!  where <A>S</A> must be subset of <A>T</A>.
#! @Arguments S, T
#! @Returns a &CAP; morphism
DeclareOperation( "EmbeddingOfFinSets",
        [ IsFinGSet, IsFinGSet ] );

#! @Description
#!  Construct the projection $\pi:$<A>S</A>$\to$<A>T</A> of the finite $G$-sets <A>S</A> and <A>T</A>,
#!  where <A>T</A> is a partition of <A>S</A>.
#! @Arguments S, T
#! @Returns a &CAP; morphism
DeclareOperation( "ProjectionOfFinSets",
        [ IsFinGSet, IsFinGSet ] );

#! @Description
#! The argument is a group $G$.
#! The output is the category of skeletal finite $G$-Sets.
#! @Returns a category
#! @Arguments G
DeclareAttribute( "FinGSets",
                  IsGroup );

#! @Section Tools

#! @Description
#!  Returns the <A>i</A>-th entry of the &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>FinSet( <A>L</A> )[ i ] = Set( <A>L</A> )[ i ]</C>.
#! @Arguments M, i
#! @Returns an object
DeclareOperation( "[]",
        [ IsFinGSet, IsInt ] );

#! @Description
#!  An iterator of the &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>Iterator( FinSet( <A>L</A> ) ) = Iterator( Set( <A>L</A> ) )</C>.
#! @Arguments M
#! @Returns an iterator
DeclareOperation( "Iterator",
        [ IsFinGSet ] );

#! @Description
#!  Returns <C>List( AsList( <A>M</A> ), <A>f</A> )</C>.
#! @Arguments M, f
#! @Returns a list
DeclareOperation( "ListOp",
        [ IsFinGSet, IsFunction ] );

#! @Description
#!  Returns <C>FinSetNC( Filtered( AsList( <A>M</A> ), <A>f</A> ) )</C>.
#! @Arguments M, f
#! @Returns a list
DeclareOperation( "FilteredOp",
        [ IsFinGSet, IsFunction ] );

#! @Description
#!  Returns <C>First( AsList( <A>M</A> ), <A>f</A> )</C>.
#! @Arguments M, f
#! @Returns a list
DeclareOperation( "FirstOp",
        [ IsFinGSet, IsFunction ] );

#! @Description
#!  Returns <C>List( AsList( <A>F</A> ), <A>phi</A> )</C>.
#! @Arguments F, phi
#! @Returns a list
DeclareOperation( "ListOp",
        [ IsFinGSet, IsFinGSetMap ] );

#! @Description
#!  
#! @Arguments pi
#! @Returns a &CAP; object
DeclareAttribute( "CartesianSectionsOfEpi",
        IsFinGSetMap );
