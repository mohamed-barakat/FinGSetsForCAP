# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The elementary topos of (skeletal) finite G-sets
#
# Implementations
#

##
InstallMethod( SkeletalTransitiveGSets,
        [ IsGroupAsCategory ],
        
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
    [ "overhead", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS, group_as_category )
    local group, name_of_group, tom, u, name, SkeletalTransitiveGSets;
    
    group := UnderlyingGroup( group_as_category );
    
    if HasName( group ) then
        name_of_group := Name( group );
    elif HasStructureDescription( group ) then
        name_of_group := StructureDescription( group );
    else
        name_of_group := "G";
    fi;
    
    tom := TableOfMarks( group );
    u := Length( MarksTom( tom ) );
    
    name := Concatenation( "SkeletalTransitiveGSets( ", name_of_group, " ) with ", String( u ), " objects" );
    
    SkeletalTransitiveGSets :=
      CreateCapCategoryWithDataTypes( name,
              IsSkeletalCategoryOfTransitiveGSets,
              IsObjectInSkeletalCategoryOfTransitiveGSets,
              IsMorphismInSkeletalCategoryOfTransitiveGSets,
              IsCapCategoryTwoCell,
              IsBigInt,
              IsMultiplicativeElementWithInverse,
              fail :
              overhead := CAP_NAMED_ARGUMENTS.overhead );
    
    SkeletalTransitiveGSets!.name_of_group := name_of_group;
    
    SkeletalTransitiveGSets!.category_as_first_argument := true;
    SkeletalTransitiveGSets!.supports_empty_limits := true;
    
    SetUnderlyingGroup( SkeletalTransitiveGSets, group );
    SetUnderlyingGroupAsCategory( SkeletalTransitiveGSets, group_as_category );
    SetUnderlyingTableOfMarks( SkeletalTransitiveGSets, tom );
    SetNumberOfObjects( SkeletalTransitiveGSets, u );
    SetCardinalitiesOfObjects( SkeletalTransitiveGSets, List( MarksTom( tom ), beta -> beta[1] ) );
    SetRepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets, List( [ 1 .. u ], i -> RepresentativeTom( tom, i ) ) );
    
    # this is a workhorse category -> no logic and caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( SkeletalTransitiveGSets );
    
    SetIsFiniteCategory( SkeletalTransitiveGSets, true );
    SetIsCategoryWithDecidableLifts( SkeletalTransitiveGSets, true );
    SetIsCategoryWithDecidableColifts( SkeletalTransitiveGSets, true );
    SetIsCategoryWithCoequalizers( SkeletalTransitiveGSets, true );
    SetIsCategoryWithTerminalObject( SkeletalTransitiveGSets, true );
    SetIsSkeletalCategory( SkeletalTransitiveGSets, true );
    
    SetIsEquippedWithHomomorphismStructure( SkeletalTransitiveGSets, true );
    SetRangeCategoryOfHomomorphismStructure( SkeletalTransitiveGSets, SkeletalFinSets );
    
    ##
    AddObjectConstructor( SkeletalTransitiveGSets,
      function( SkeletalTransitiveGSets, i )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        if not i in [ 1 .. NumberOfObjects( SkeletalTransitiveGSets ) ] then
            return Error( "i must be an integer in the interval ", [ 1 .. NumberOfObjects( SkeletalTransitiveGSets ) ] );
        fi;
        
        return CreateCapCategoryObjectWithAttributes( SkeletalTransitiveGSets,
                       IndexOfObject, i );
        
    end );
    
    ##
    AddObjectDatum( SkeletalTransitiveGSets,
      function( SkeletalTransitiveGSets, Omega )
        
        return IndexOfObject( Omega );
        
    end );
    
    ##
    AddMorphismConstructor( SkeletalTransitiveGSets,
      function( SkeletalTransitiveGSets, source, g, target )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        if not g in UnderlyingGroup( SkeletalTransitiveGSets ) then
            return false;
        fi;
        
        return CreateCapCategoryMorphismWithAttributes( SkeletalTransitiveGSets,
                       source,
                       target,
                       UnderlyingGroupElement, g );
        
    end );
    
    ##
    AddMorphismDatum( SkeletalTransitiveGSets,
      function( SkeletalTransitiveGSets, phi )
        
        return UnderlyingGroupElement( phi );
        
    end );
    
    ##
    AddSetOfObjectsOfCategory( SkeletalTransitiveGSets,
      function( SkeletalTransitiveGSets )
        
        return List( [ 1 .. NumberOfObjects( SkeletalTransitiveGSets ) ], i -> ObjectConstructor( SkeletalTransitiveGSets, i ) );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, Omega )
        
        return IndexOfObject( Omega ) in [ 1 .. NumberOfObjects( SkeletalTransitiveGSets ) ];
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, phi )
        local s, t, g, U;
        
        s := IndexOfObject( Source( phi ) );
        t := IndexOfObject( Target( phi ) );
        
        g := UnderlyingGroupElement( phi );
        
        U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
        
        return IsSubset( U[t], ConjugateSubgroup( U[s], Inverse( g ) ) );
        
    end );
    
    ##
    AddIsEqualForObjects( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, Omega1, Omega2 )
        
        return IndexOfObject( Omega1 ) = IndexOfObject( Omega2 );
        
    end );
    
    ##
    AddIsEqualForMorphisms( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, phi, psi )
        
        return UnderlyingGroupElement( phi ) = UnderlyingGroupElement( psi );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, phi, psi )
        local t, U;
        
        t := IndexOfObject( Target( phi ) );
        
        U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
        
        return RightCoset( U[t], UnderlyingGroupElement( phi ) ) = RightCoset( U[t], UnderlyingGroupElement( psi ) );
        
    end );
    
    ##
    AddIdentityMorphism( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, Omega )
        
        return MorphismConstructor( SkeletalTransitiveGSets,
                       Omega,
                       One( UnderlyingGroup( SkeletalTransitiveGSets ) ),
                       Omega );
        
    end );
    
    ##
    AddPreCompose( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, mor_pre, mor_post )
        
        return MorphismConstructor( SkeletalTransitiveGSets,
                       Source( mor_pre ),
                       UnderlyingGroupElement( mor_pre ) * UnderlyingGroupElement( mor_post ),
                       Target( mor_post ) );
        
    end );
    
    ##
    AddIsLiftable( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, alpha, beta )
        local s, t, g, U;
        
        s := IndexOfObject( Source( alpha ) );
        t := IndexOfObject( Source( beta ) );
        
        g := UnderlyingGroupElement( alpha ) * Inverse( UnderlyingGroupElement( beta ) );
        
        U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
        
        return IsSubset( U[t], ConjugateSubgroup( U[s], Inverse( g ) ) );
        
    end );
    
    ##
    AddLift( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, alpha, beta )
        
        return MorphismConstructor( SkeletalTransitiveGSets,
                       Source( alpha ),
                       UnderlyingGroupElement( alpha ) * Inverse( UnderlyingGroupElement( beta ) ),
                       Source( beta ) );
        
    end );
    
    ##
    AddIsColiftable( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, alpha, beta )
        local s, t, g, U;
        
        s := IndexOfObject( Target( alpha ) );
        t := IndexOfObject( Target( beta ) );
        
        g := Inverse( UnderlyingGroupElement( alpha ) ) * UnderlyingGroupElement( beta );
        
        U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
        
        return IsSubset( U[t], ConjugateSubgroup( U[s], Inverse( g ) ) );
        
    end );
    
    ##
    AddColift( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, alpha, beta )
        
        return MorphismConstructor( SkeletalTransitiveGSets,
                       Target( alpha ),
                       Inverse( UnderlyingGroupElement( alpha ) ) * UnderlyingGroupElement( beta ),
                       Target( beta ) );
        
    end );
    
    ##
    AddTerminalObject( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets )
        
        return ObjectConstructor( SkeletalTransitiveGSets, NumberOfObjects( SkeletalTransitiveGSets ) );
        
    end );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, Omega, trivial_G_set )
        
        return MorphismConstructor( SkeletalTransitiveGSets,
                       Omega,
                       One( UnderlyingGroup( SkeletalTransitiveGSets ) ),
                       trivial_G_set );
        
    end );
    
    ##
    AddProjectionOntoCoequalizer( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, Omega, diagram )
        local i, l, gs, U, Ucoeq, G, index, cards, positions, pos, g, coeq;
        
        i := IndexOfObject( Omega );
        
        l := Length( diagram );
        
        gs := List( [ 1 .. l ], i -> UnderlyingGroupElement( diagram[i] ) );
        
        U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
        
        Ucoeq := ClosureSubgroup( U[i],
                         List( [ 1 .. l - 1 ], i -> gs[i + 1] * Inverse( gs[i] ) ) ); ## gs[1] is taken 1 in CoequalizerMorphisms
        
        G := UnderlyingGroup( SkeletalTransitiveGSets );
        
        index := Index( G, Ucoeq );
        
        cards := CardinalitiesOfObjects( SkeletalTransitiveGSets );
        
        positions := Filtered( [ 1 .. NumberOfObjects( SkeletalTransitiveGSets ) ], i -> index = cards[i] );
        
        pos := SafeFirst( positions, i -> IsConjugate( G, Ucoeq, U[i] ) );
        
        g := RepresentativeAction( G, U[pos], Ucoeq );
        
        coeq := SetOfObjects( SkeletalTransitiveGSets )[pos];
        
        return MorphismConstructor( SkeletalTransitiveGSets,
                       Omega,
                       g,
                       coeq );
        
    end );
    
    ##
    AddIsHomSetInhabited( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, source, target )
        local s, t, U;
        
        s := IndexOfObject( source );
        t := IndexOfObject( target );
        
        U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
        
        return ForAny( RightTransversal( UnderlyingGroup( SkeletalTransitiveGSets ), U[t] ), g ->
                       IsSubset( U[t], ConjugateSubgroup( U[s], Inverse( g ) ) ) );
        
    end );
    
    ##
    AddMorphismsOfExternalHom( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, source, target )
        local s, t, U, L;
        
        s := IndexOfObject( source );
        t := IndexOfObject( target );
        
        U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
        
        L := RightTransversal( UnderlyingGroup( SkeletalTransitiveGSets ), U[t] );
        
        L := Filtered( L, g -> IsSubset( U[t], ConjugateSubgroup( U[s], Inverse( g ) ) ) );
        
        return List( L, g ->
                     MorphismConstructor( SkeletalTransitiveGSets,
                             source,
                             g,
                             target ) );
        
    end );
    
    ##
    AddIsEpimorphism( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, phi )
        
        return true;
        
    end );
    
    ##
    AddIsMonomorphism( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, phi )
        
        return IsEndomorphism( SkeletalTransitiveGSets, phi );
        
    end );
    
    ##
    AddIsIsomorphism( SkeletalTransitiveGSets,
      function ( SkeletalTransitiveGSets, phi )
        
        return IsMonomorphism( SkeletalTransitiveGSets, phi );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( SkeletalTransitiveGSets );
    fi;
    
    return SkeletalTransitiveGSets;
    
end ) );

##
InstallMethod( SkeletalTransitiveGSets,
        [ IsGroup ],
        
  function( G )
    
    return SkeletalTransitiveGSets( GroupAsCategory( G ) );
    
end );

##
InstallMethod( \<,
        "for two skeletal transitive G-sets",
        [ IsObjectInSkeletalCategoryOfTransitiveGSets, IsObjectInSkeletalCategoryOfTransitiveGSets ],
        
  function( Omega1, Omega2 )
    
    return IndexOfObject( Omega1 ) < IndexOfObject( Omega2 );
    
end );

##
InstallMethod( \<,
        "for two morphisms of skeletal transitive G-sets",
        [ IsMorphismInSkeletalCategoryOfTransitiveGSets, IsMorphismInSkeletalCategoryOfTransitiveGSets ],
        
  function( mor1, mor2 )
    
    return [ Source( mor1 ), Target( mor1 ), UnderlyingGroupElement( mor1 ) ] < [ Source( mor2 ), Target( mor2 ), UnderlyingGroupElement( mor2 ) ];
    
end );

##
InstallMethod( \.,
        "for the skeletal category of transitive G-sets and a positive integer",
        [ IsSkeletalCategoryOfTransitiveGSets, IsPosInt ],

  function( SkeletalTransitiveGSets, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    return EvalString( name ) / SkeletalTransitiveGSets;
    
end );

##
InstallMethod( SetOfObjects,
        "for the skeletal category of transitive G-sets",
        [ IsSkeletalCategoryOfTransitiveGSets ],
        
  function ( SkeletalTransitiveGSets )
    
    return SetOfObjectsOfCategory( SkeletalTransitiveGSets );
    
end );

##
InstallMethod( Size,
        "for a skeletal transitive G-set",
        [ IsObjectInSkeletalCategoryOfTransitiveGSets ],
        
  function ( Omega )
    local SkeletalTransitiveGSets, U;
    
    SkeletalTransitiveGSets := CapCategory( Omega );
    
    U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
    
    return Index( UnderlyingGroup( SkeletalTransitiveGSets ), U[IndexOfObject( Omega )] );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoequalizerMorphisms,
        "for the skeletal category of transitive G-sets and a transitive G-set therein",
        [ IsSkeletalCategoryOfTransitiveGSets, IsObjectInSkeletalCategoryOfTransitiveGSets ],
        
  function ( SkeletalTransitiveGSets, Omega )
    local U, P, gs;
    
    U := RepresentativesOfSubgroupsUpToConjugation( SkeletalTransitiveGSets );
    
    P := ObjectConstructor( SkeletalTransitiveGSets, 1 );
    
    gs := Concatenation( [ One( UnderlyingGroup( SkeletalTransitiveGSets ) ) ], GeneratorsOfGroup( U[IndexOfObject( Omega )] ) );
    
    return List( gs, g ->
                 MorphismConstructor( SkeletalTransitiveGSets,
                         P,
                         g,
                         P ) );
    
end );

##
InstallMethod( CoequalizerMorphisms,
        "for a skeletal transitive G-set",
        [ IsObjectInSkeletalCategoryOfTransitiveGSets ],
        
  function ( Omega )
    
    return CoequalizerMorphisms( CapCategory( Omega ), Omega );
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingGroupAsCategoryData,
        "for a skeletal category of transitive G-sets",
        [ IsSkeletalCategoryOfTransitiveGSets ],
        
  function( TG )
    local embedding_on_objects, embedding_on_morphisms;
    
    embedding_on_objects :=
      uniq_object -> SetOfObjectsOfCategory( TG )[1];
    
    embedding_on_morphisms :=
      { source, morG, target } -> MorphismConstructor( TG, source, UnderlyingGroupElement( morG ), target );
    
    return Triple( UnderlyingGroupAsCategory( TG ),
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   TG );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingGroupAsCategory,
        "for a skeletal category of transitive G-sets",
        [ IsSkeletalCategoryOfTransitiveGSets ],
        
  function( TG )
    local data, Y;
    
    data := EmbeddingOfUnderlyingGroupAsCategoryData( TG );
    
    Y := CapFunctor( "Embedding functor into the skeletal category of transitive G-sets", data[1], TG );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToSkeletalCategoryOfTransitiveGSetsData,
        "for a two categories and a pair of functions",
        [ IsSkeletalCategoryOfTransitiveGSets, IsList, IsCategoryWithCoequalizers ],
        
  function( TG, pair_of_funcs, category_with_coequalizers )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];

    ## the code below is the doctrine-specific ur-algorithm for the coequalizer completion
    
    extended_functor_on_objects :=
      function( objTG )
        local L;
        
        L := CoequalizerMorphisms( TG, objTG );
        
        return Coequalizer( category_with_coequalizers,
                       List( L, morTG ->
                             functor_on_morphisms(
                                     functor_on_objects( Source( morTG ) ),
                                     morTG,
                                     functor_on_objects( Target( morTG ) ) ) ) );
        
    end;
    
    extended_functor_on_morphisms :=
      function( source, morTG, target )
        local source_coeq_mor, target_coeq_mor;
        
        source_coeq_mor := CoequalizerMorphisms( TG, Source( morTG ) );
        target_coeq_mor := CoequalizerMorphisms( TG, Target( morTG ) );
        
        if not IsEqualForObjects( category_with_coequalizers, source, Coequalizer( category_with_coequalizers, source_coeq_mor ) ) then
            Error( "source and Coequalizer( source_coeq_mor ) do not coincide\n" );
        fi;
        
        if not IsEqualForObjects( category_with_coequalizers, target, Coequalizer( category_with_coequalizers, target_coeq_mor ) ) then
            Error( "target and Coequalizer( target_coeq_mor ) do not coincide\n" );
        fi;
        
        return CoequalizerFunctorialWithGivenCoequalizers( category_with_coequalizers,
                        source,
                        source_coeq_mor,
                        morTG,
                        target_coeq_mor,
                        target );
        
    end;
    
    return Triple( TG,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   category_with_coequalizers );
    
end );

##
InstallMethod( ExtendFunctorToSkeletalCategoryOfTransitiveGSets,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, TG, data, UF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    TG := SkeletalTransitiveGSets( C );
    
    data := ExtendFunctorToSkeletalCategoryOfTransitiveGSetsData(
                    TG,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    UF := CapFunctor( Concatenation( "Extension to SkeletalTransitiveGSets( Source( ", Name( F ), " ) )" ), TG, D );
    
    AddObjectFunction( UF,
            data[2][1] );
    
    AddMorphismFunction( UF,
            data[2][2] );
    
    return UF;
    
end );

##################################
##
## String, View, and Display methods
##
##################################

##
InstallMethod( String,
        "for a skeletal transitive G-set",
        [ IsObjectInSkeletalCategoryOfTransitiveGSets ],
        
  function ( Omega )
    
    return Concatenation( CapCategory( Omega )!.name_of_group, " / U_", String( IndexOfObject( Omega ) ) );
    
end );

##
InstallMethod( ViewString,
        "for a skeletal transitive G-set",
        [ IsObjectInSkeletalCategoryOfTransitiveGSets ],
        
  function ( Omega )
    
    return String( Omega );
    
end );

##
InstallMethod( String,
        "for a morphism of skeletal transitive G-sets",
        [ IsMorphismInSkeletalCategoryOfTransitiveGSets ],
        
  function ( mor )
    
    return Concatenation( String( UnderlyingGroupElement( mor ) ), ": ", ViewString( Source( mor ) ), " -> ", ViewString( Target( mor ) ) );
    
end );

##
InstallMethod( ViewString,
        "for a morphism of skeletal transitive G-sets",
        [ IsMorphismInSkeletalCategoryOfTransitiveGSets ],
        
  function ( mor )
    
    return String( mor );
    
end );
