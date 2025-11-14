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
          name, SkeletalFinGSets, PreimagePositions, FindConnectedcomponentsForCoequalizer;
    
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
    
    PreimagePositions :=
      function ( SkeletalFinGSets, phi, image_positions )
        local l, ms, map;
        
        l := NumberOfObjects( UnderlyingCategory( ModelingCategory( SkeletalFinGSets ) ) );
        
        ms := PairOfSumAndListOfMultiplicities( Source( phi ) )[ 2 ];
        
        map := PairOfLists( phi )[ 1 ];
        
        return List( [ 1 .. l ], o -> Filtered( [ 1 .. ms[o] ], i -> map[o][2][i] in image_positions[ map[o][1][i] ] ) );
        
    end;
    
    FindConnectedcomponentsForCoequalizer :=
      function ( SkeletalFinGSets, source, list_of_parallel_morphisms, target )
        local TG, G, l, m_source, m_target, data, maps, mors, n, source_visited, target_visited, H, components,
              current_image, new_image, ofalse, xfalse, i, preimagepos, o, x, j, pos1, pos2;
        
        TG := UnderlyingCategory( ModelingCategory( SkeletalFinGSets ) );
        G := UnderlyingGroup( TG );
        l := NumberOfObjects( TG );
        
        m_source := PairOfSumAndListOfMultiplicities( source )[ 2 ];
        m_target := PairOfSumAndListOfMultiplicities( target )[ 2 ];
        
        data := List( list_of_parallel_morphisms, mor -> PairOfLists( mor ) );
        maps := List( data, datum -> datum[1] );
        mors := List( data, datum -> datum[2] );
        n := Length( list_of_parallel_morphisms );
        
        source_visited := List( [ 1 .. l ], o -> ListWithIdenticalEntries( m_source[o], false ) );
        target_visited := List( [ 1 .. l ], o -> ListWithIdenticalEntries( m_target[o], false ) );
        
        H := List( [ 1 .. l ], o -> ListWithIdenticalEntries( m_target[o], One( G ) ) );
        
        components := [];
        #componentpos := List( [ 1 .. l ], o -> List( m_target[o], [] ) );
        
        current_image := [];
        new_image := [];
        
        while ForAny( target_visited, e -> ForAny( e, b -> not b ) ) do
            
            Add( components, List( [ 1 .. l ], o -> [ ] ) );
            
            # compute the first non yet visited position
            ofalse := PositionProperty( target_visited, e -> ForAny( e, b -> not b ) );
            xfalse := Position( target_visited[ ofalse ], false );
            
            ##
            current_image := List( [ 1 .. l ], o -> [] );
            Add( current_image[ ofalse ], xfalse );
            target_visited[ ofalse ][ xfalse ] := true;
            
            ##
            while ForAny( current_image, e -> Length(e) > 0 ) do
                
                new_image := List( [ 1 .. l ], o -> Set([]) );
                
                for i in [ 1 .. n ] do
                    
                    preimagepos := PreimagePositions( SkeletalFinGSets, list_of_parallel_morphisms[ i ], current_image );
                    
                    for o in [ 1 .. l ] do
                        for x in preimagepos[ o ] do
                            
                            # Only for optimization
                            if not source_visited[ o ][ x ] then
                                source_visited[ o ][ x ] := true;
                                
                                #AddSet( Last( components )[ 1 ][ o ], x );
                                AddSet( Last( components )[ o ], x );
                                
                                for j in [ 1 .. n ] do
                                    
                                    pos1 := maps[j][o][1][x];
                                    pos2 := maps[j][o][2][x];
                                    
                                    if not target_visited[ pos1 ][ pos2 ] then
                                        
                                        target_visited[ pos1 ][ pos2 ] := true;
                                        #componentpos[ pos1 ][ pos2 ] := Length( components );
                                        
                                        AddSet( new_image[ pos1 ], pos2 );
                                        
                                        H[ pos1 ][ pos2 ] := H[ maps[i][o][1][x] ][ maps[i][o][2][x] ] * mors[i][o][x] * Inverse( mors[j][o][x] );
                                        
                                    fi;
                                    
                                od;
                                
                            fi;

                        od;
                        
                    od;
                    
                od;
                
                current_image := StructuralCopy( new_image );
                
            od;
            
        od;
        
        return [ components, H ];
        
    end;
    
    AddProjectionOntoCoequalizer( SkeletalFinGSets,
      function ( cat, target, list_of_parallel_morphisms )
        local source, n, data, maps, mors, TG, G, l, U, CH, components, H, m_target, componentpos, equations, welldefinednesspi,
              subgroups, subgroups_pos, conjugates, multiplicities_of_coequalizer, coequalizer, map_pos, map, mor;
        
        source := Source( list_of_parallel_morphisms[1] );
        n := Length( list_of_parallel_morphisms );
        
        data := List( list_of_parallel_morphisms, phi -> PairOfLists( phi ) );      
        maps := List( data, datum -> datum[1] );
        mors := List( data, datum -> datum[2] );
        
        TG := UnderlyingCategory( ModelingCategory( SkeletalFinGSets ) );
        G := UnderlyingGroup( TG );
        l := NumberOfObjects( TG );
        U := RepresentativesOfSubgroupsUpToConjugation( TG );
        
        CH := FindConnectedcomponentsForCoequalizer( SkeletalFinGSets, source, list_of_parallel_morphisms, target );
        components := CH[ 1 ];
        H := CH[ 2 ];
        
        m_target := PairOfSumAndListOfMultiplicities( target )[ 2 ];
        
        # componentpos store in which components lie the target at position [o][i] ?
        # it can be compute directly in the previous big loops
        componentpos := List( [ 1 .. l ], o -> List( [ 1 .. m_target[o] ], i -> Position( components, e -> i in e[o] ) ) );

        equations := List( components, c ->
                           Concatenation( List( Combinations( [ 1 .. n ], 2 ), a_b ->
                                   Concatenation( List( [ 1 .. l ], o ->
                                           List( c[o], i ->
                                                 H[ maps[a_b[1]][o][1][i] ][ maps[a_b[1]][o][2][i] ] *
                                                 mors[a_b[1]][o][i] *
                                                 Inverse( H[ maps[a_b[2]][o][1][i] ][ maps[a_b[2]][o][2][i] ] * mors[a_b[2]][o][i] ) ) ) ) ) ) );
        
        welldefinednesspi := List( components, c -> 
                                   Concatenation( List( [ 1 .. l ], o ->
                                           List( c[o], i -> GeneratorsOfGroup( ConjugateSubgroup( U[o], Inverse( H[ o ][ i ] ) ) ) ) ) ) );
        
        # Define the corresponding groups :
        subgroups := List( [ 1 .. Length( components ) ] , c -> Subgroup( G, Concatenation( equations[c], welldefinednesspi[c] ) ) );
        
        # Find their representative object :
        subgroups_pos := List( subgroups, V -> SafeFirst( [ 1 .. Length(U) ], j -> IsConjugate( G, V, U[j] ) ) );
        
        # And the g_i such that V_i = g_i U_j g_i^-1 :
        conjugates := List( [ 1 .. Length( components ) ], c -> RepresentativeAction( G, subgroups[ c ], U[ subgroups_pos[ c ] ] ) );
        
        # Construct the coequalizer object
        multiplicities_of_coequalizer := List( [ 1 .. l ], o -> Number( subgroups_pos, i -> i = o ) );
        coequalizer := ObjectConstructor( SkeletalFinGSets, [ Sum( multiplicities_of_coequalizer ), multiplicities_of_coequalizer ] );
        
        # Construct the map :
        map_pos := List( [ 1 .. Length(subgroups_pos) ], i ->
                         Number( subgroups_pos{ [ 1 .. i-1 ] }, j -> j = subgroups_pos[ i ] ) );
        
        map := List( [ 1 .. l ], o ->
                     [ List( [ 1 .. m_target[o] ], i -> subgroups_pos[ componentpos[o][i] ] ),
                       List( [ 1 .. m_target[o] ], i -> map_pos[ componentpos[o][i] ] ) ] );
        #
        mor := List( [ 1 .. l ], o -> List( [ 1 .. m_target[o] ], i -> conjugates[ componentpos[o][i] ]*H[o][i] ) );
        
        return MorphismConstructor( SkeletalFinGSets, target, [ map, mor ], coequalizer );
        
    end );
    
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
