# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

##
InstallMethod( SkeletalCategoryOfFinGSets,
        "for a group",
        [ IsGroup ],
        
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
  ],
  function ( CAP_NAMED_ARGUMENTS, group )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          TG, sFinGSets,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          name, SkeletalFinGSets;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              IsBigInt,
              CapJitDataTypeOfListOf( IsBigInt ) );
    
    ##
    object_constructor :=
      function( SkeletalFinGSets, pair_of_int_and_list )
        
        return CreateCapCategoryObjectWithAttributes( SkeletalFinGSets,
                       PairOfSumAndListOfMultiplicities, pair_of_int_and_list );
        
    end;
    
    ##
    object_datum :=
      function ( SkeletalFinGSets, Omega )
        
        return PairOfSumAndListOfMultiplicities( Omega );
        
    end;
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfListOf(
                      CapJitDataTypeOfNTupleOf( 2,
                              CapJitDataTypeOfListOf( IsBigInt ),
                              CapJitDataTypeOfListOf( IsBigInt ) ) ),
              CapJitDataTypeOfListOf(
                      CapJitDataTypeOfListOf(
                              CapJitDataTypeOfElementOfGroup( group ) ) ) );
    
    ##
    morphism_constructor :=
      function ( SkeletalFinGSets, S, pair_of_lists, T )
        local mor;
        
        mor := CreateCapCategoryMorphismWithAttributes( SkeletalFinGSets,
                       S,
                       T,
                       PairOfLists, pair_of_lists );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsWellDefined( mor ) );
        
        return mor;
        
    end;
    
    ##
    morphism_datum :=
      function( SkeletalFinGSets, phi )
        
        return PairOfLists( phi );
        
    end;
    
    ## building the categorical tower:
    TG := SkeletalTransitiveGSets( group : FinalizeCategory := true );
    
    sFinGSets := FiniteStrictCoproductCompletionOfObjectFiniteCategory( TG : FinalizeCategory := false );
    
    SetIsElementaryTopos( sFinGSets, true );
    
    Finalize( sFinGSets : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( SkeletalFinGSets, pair_of_int_and_list )
        local sFinGSets;
        
        sFinGSets := ModelingCategory( SkeletalFinGSets );
        
        return ObjectConstructor( sFinGSets, pair_of_int_and_list );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( SkeletalFinGSets, Omega )
        local sFinGSets, TG, pair;
        
        sFinGSets := ModelingCategory( SkeletalFinGSets );
        
        return PairOfIntAndList( Omega );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( SkeletalFinGSets, source, pair_of_lists, target )
        local l, sFinGSets, TG, maps, mors, transitives,
              multiplicities_of_source, transitives_of_source,
              multiplicities_of_target, transitives_of_target;
        
        l := NumberOfTransitiveGSets( SkeletalFinGSets );
        
        sFinGSets := ModelingCategory( SkeletalFinGSets );
        
        TG := UnderlyingCategory( sFinGSets );
        
        maps := pair_of_lists[1];
        mors := pair_of_lists[2];
        
        transitives := SetOfObjectsOfCategory( TG );
        
        multiplicities_of_source := PairOfIntAndList( source )[2];
        transitives_of_source := List( [ 1 .. l ], o ->
                                       ListWithIdenticalEntries( multiplicities_of_source[o], transitives[o] ) );
        
        multiplicities_of_target := PairOfIntAndList( target )[2];
        transitives_of_target := List( [ 1 .. l ], o ->
                                       ListWithIdenticalEntries( multiplicities_of_target[o], transitives[o] ) );
        
        return MorphismConstructor( sFinGSets,
                       source,
                       Pair( maps,
                             List( [ 1 .. l ], o ->
                                   List( [ 1 .. multiplicities_of_source[o] ], i ->
                                         MorphismConstructor( TG,
                                                 transitives_of_source[o][i],
                                                 mors[o][i],
                                                 transitives_of_target[1 + maps[o][1][i]][1 + maps[o][2][i]] ) ) ) ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( SkeletalFinGSets, phi )
        local l, multiplicities_of_source, pair_of_lists;
        
        l := NumberOfTransitiveGSets( SkeletalFinGSets );
        
        multiplicities_of_source := PairOfIntAndList( Source( phi ) )[2];
        
        pair_of_lists := PairOfLists( phi );
        
        return Pair( pair_of_lists[1],
                     List( [ 1 .. l ], o ->
                           List( [ 1 .. multiplicities_of_source[o] ], i ->
                                 UnderlyingGroupElement( pair_of_lists[2][o][i] ) ) ) );
        
    end;
    
    if HasName( group ) then
        name := Name( group );
    elif HasStructureDescription( group ) then
        name := StructureDescription( group );
    else
        name := String( group );
    fi;
    
    ##
    SkeletalFinGSets :=
      ReinterpretationOfCategory( sFinGSets,
              rec( name := Concatenation( "SkeletalCategoryOfFinGSets( ", name, " )" ),
                   category_filter := IsSkeletalCategoryOfFinGSets,
                   category_object_filter := IsObjectInSkeletalCategoryOfFinGSets,
                   category_morphism_filter := IsMorphismInSkeletalCategoryOfFinGSets,
                   object_datum_type := object_datum_type,
                   morphism_datum_type := morphism_datum_type,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true )
              : FinalizeCategory := false );
    
    SetIsElementaryTopos( SkeletalFinGSets, true );
    
    SetUnderlyingGroup( SkeletalFinGSets, group );
    SetUnderlyingGroupAsCategory( SkeletalFinGSets, GroupAsCategory( group ) );
    SetNumberOfTransitiveGSets( SkeletalFinGSets, NumberOfObjects( TG ) );
    SetRepresentativesOfSubgroupsUpToConjugation( SkeletalFinGSets, RepresentativesOfSubgroupsUpToConjugation( TG ) );
    
    Append( SkeletalFinGSets!.compiler_hints.category_attribute_names,
            [ "UnderlyingGroup",
              "UnderlyingGroupAsCategory",
              "NumberOfTransitiveGSets",
              "RepresentativesOfSubgroupsUpToConjugation",
              ] );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( SkeletalFinGSets );
    fi;
    
    return SkeletalFinGSets;
    
end ) );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingGroupAsCategoryData,
        "for a skeletal category of finite G-sets",
        [ IsSkeletalCategoryOfFinGSets ],
        
  function( SkeletalFinGSets )
    local UTG, TG, G, embedding_on_objects, embedding_on_morphisms;
    
    UTG := ModelingCategory( SkeletalFinGSets );
    
    TG := UnderlyingCategory( UTG );
    
    G := UnderlyingGroup( SkeletalFinGSets );
    
    embedding_on_objects :=
      function( objG )
        local obj_UTG;
        
        obj_UTG := EmbeddingOfUnderlyingCategoryData( UTG )[2][1](
                           EmbeddingOfUnderlyingGroupAsCategoryData( TG )[2][1]( objG ) );
                   
        return ReinterpretationOfObject( SkeletalFinGSets, obj_UTG );
        
    end;
    
    embedding_on_morphisms :=
      function( source, morG, target )
        local source_TG, source_UTG, target_TG, target_UTG, mor_UTG;
        
        source_TG := EmbeddingOfUnderlyingGroupAsCategoryData( TG )[2][1]( Source( morG ) );
        source_UTG := EmbeddingOfUnderlyingCategoryData( UTG )[2][1]( source_TG );
        
        target_TG := EmbeddingOfUnderlyingGroupAsCategoryData( TG )[2][1]( Target( morG ) );
        target_UTG := EmbeddingOfUnderlyingCategoryData( UTG )[2][1]( target_TG );
        
        mor_UTG := EmbeddingOfUnderlyingCategoryData( UTG )[2][2](
                           source_UTG,
                           EmbeddingOfUnderlyingGroupAsCategoryData( TG )[2][2](
                                   source_TG,
                                   morG,
                                   target_TG ),
                           target_UTG );
        
        return ReinterpretationOfMorphism( SkeletalFinGSets,
                       source,
                       mor_UTG,
                       target );
        
    end;
    
    return Triple( UnderlyingGroupAsCategory( SkeletalFinGSets ),
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   SkeletalFinGSets );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingGroupAsCategory,
        "for a skeletal category of finite G-sets",
        [ IsSkeletalCategoryOfFinGSets ],
        
  function( SkeletalFinGSets )
    local data, Y;
    
    data := EmbeddingOfUnderlyingGroupAsCategoryData( SkeletalFinGSets );
    
    Y := CapFunctor( "Embedding functor of underlying group as category into the skeletal category of finite G-sets", data[1], SkeletalFinGSets );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToSkeletalCategoryOfFinGSetsData,
        "for a two categories and a pair of functions",
        [ IsSkeletalCategoryOfFinGSets, IsList, IsCategoryWithCoequalizers ],
        
  function( SkeletalFinGSets, pair_of_funcs, cocomplete_category )
    local UTG, TG;
    
    UTG := ModelingCategory( SkeletalFinGSets );
    TG := UnderlyingCategory( UTG );
    
    ## the code below is the doctrine-specific ur-algorithm for the coequalizer completion
    
    return ExtendFunctorToReinterpretedCategoryData(
                   SkeletalFinGSets,
                   ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategoryData(
                           UTG,
                           ExtendFunctorToSkeletalCategoryOfTransitiveGSetsData(
                                   TG,
                                   pair_of_funcs,
                                   cocomplete_category )[2],
                           cocomplete_category )[2],
                   cocomplete_category );
    
end );

##
InstallMethod( ExtendFunctorToSkeletalCategoryOfFinGSets,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, SkeletalFinGSets, data, Fhat;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    SkeletalFinGSets := SkeletalCategoryOfFinGSets( UnderlyingGroup( C ) );
    
    data := ExtendFunctorToSkeletalCategoryOfFinGSetsData(
                    SkeletalFinGSets,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    Fhat := CapFunctor( Concatenation( "Extension to SkeletalFinGSets( Source( ", Name( F ), " ) )" ), SkeletalFinGSets, D );
    
    AddObjectFunction( Fhat,
            data[2][1] );
    
    AddMorphismFunction( Fhat,
            data[2][2] );
    
    return Fhat;
    
end );

##
InstallMethod( \.,
        "for a skeletal category of finite G-sets and a positive integer",
        [ IsSkeletalCategoryOfFinGSets, IsPosInt ],
        
  function( SkeletalFinGSets, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    return EvalString( name ) / SkeletalFinGSets;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for an object in a skeletal category of finite G-sets",
        [ IsObjectInSkeletalCategoryOfFinGSets ],
        
  function ( obj )
    
    return Concatenation( String( ObjectDatum( obj ) ), "\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in a skeletal category of finite G-sets",
        [ IsMorphismInSkeletalCategoryOfFinGSets ],
        
  function ( mor )
    
    return Concatenation(
                   DisplayString( Source( mor ) ),
                   " |\n",
                   String( MorphismDatum( mor ) ), "\n",
                   " |\n",
                   " v\n",
                   DisplayString( Target( mor ) ) );
    
end );
