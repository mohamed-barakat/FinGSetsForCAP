# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

##
InstallMethod( SkeletalCategoryOfFiniteLeftGSets,
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
          name, SkeletalFinLeftGSets, PreimagePositions, FindConnectedcomponentsForCoequalizer;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              IsBigInt,
              CapJitDataTypeOfListOf( IsBigInt ) );
    
    ##
    object_constructor :=
      function ( SkeletalFinLeftGSets, pair_of_int_and_list )
        
        return CreateCapCategoryObjectWithAttributes( SkeletalFinLeftGSets,
                       PairOfSumAndListOfMultiplicities, pair_of_int_and_list );
        
    end;
    
    ##
    object_datum :=
      function ( SkeletalFinLeftGSets, Omega )
        
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
      function ( SkeletalFinLeftGSets, S, pair_of_lists, T )
        local mor;
        
        mor := CreateCapCategoryMorphismWithAttributes( SkeletalFinLeftGSets,
                       S,
                       T,
                       PairOfLists, pair_of_lists );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsWellDefined( mor ) );
        
        return mor;
        
    end;
    
    ##
    morphism_datum :=
      function ( SkeletalFinLeftGSets, phi )
        
        return PairOfLists( phi );
        
    end;
    
    ## building the categorical tower:
    
    TG := SkeletalCategoryOfTransitiveLeftGSets( group : FinalizeCategory := true );
    
    sFinGSets := FiniteStrictCoproductCompletionOfObjectFiniteCategory( TG : FinalizeCategory := false );
    
    SetIsElementaryTopos( sFinGSets, true );
    
    Finalize( sFinGSets : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function ( SkeletalFinLeftGSets, pair_of_int_and_list )
        local sFinGSets;
        
        sFinGSets := ModelingCategory( SkeletalFinLeftGSets );
        
        return ObjectConstructor( sFinGSets, pair_of_int_and_list );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function ( SkeletalFinLeftGSets, Omega )
        local sFinGSets, TG, pair;
        
        sFinGSets := ModelingCategory( SkeletalFinLeftGSets );
        
        return PairOfIntAndList( Omega );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function ( SkeletalFinLeftGSets, source, pair_of_lists, target )
        local l, sFinGSets, TG, maps, mors, transitives,
              multiplicities_of_source, transitives_of_source,
              multiplicities_of_target, transitives_of_target;
        
        l := NumberOfTransitiveGSets( SkeletalFinLeftGSets );
        
        sFinGSets := ModelingCategory( SkeletalFinLeftGSets );
        
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
      function ( SkeletalFinLeftGSets, phi )
        local l, multiplicities_of_source, pair_of_lists;
        
        l := NumberOfTransitiveGSets( SkeletalFinLeftGSets );
        
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
    SkeletalFinLeftGSets :=
      ReinterpretationOfCategory( sFinGSets,
              rec( name := Concatenation( "SkeletalCategoryOfFiniteLeftGSets( ", name, " )" ),
                   category_filter := IsSkeletalCategoryOfFiniteLeftGSets,
                   category_object_filter := IsObjectInSkeletalCategoryOfFiniteLeftGSets,
                   category_morphism_filter := IsMorphismInSkeletalCategoryOfFiniteLeftGSets,
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
    
    SetIsElementaryTopos( SkeletalFinLeftGSets, true );
    
    SetUnderlyingGroup( SkeletalFinLeftGSets, group );
    SetUnderlyingGroupAsCategory( SkeletalFinLeftGSets, GroupAsCategory( group ) );
    SetNumberOfTransitiveGSets( SkeletalFinLeftGSets, NumberOfObjects( TG ) );
    SetRepresentativesOfSubgroupsUpToConjugation( SkeletalFinLeftGSets, RepresentativesOfSubgroupsUpToConjugation( TG ) );
    
    Append( SkeletalFinLeftGSets!.compiler_hints.category_attribute_names,
            [ "UnderlyingGroup",
              "UnderlyingGroupAsCategory",
              "NumberOfTransitiveGSets",
              "RepresentativesOfSubgroupsUpToConjugation",
              ] );
    
    PreimagePositions :=
      function ( SkeletalFinLeftGSets, phi, image_positions )
        local l, ms, map, preimage;
        
        l := NumberOfTransitiveGSets( SkeletalFinLeftGSets );
        
        ms := PairOfSumAndListOfMultiplicities( Source( phi ) )[ 2 ];
        
        map := PairOfLists( phi )[ 1 ];

        preimage := List( [ 1 .. l ], o -> Filtered( [ 0 .. ms[o] - 1 ], i -> [ map[o][1][i+1], map[o][2][i+1] ] in image_positions ) );

        return Concatenation( List( [ 1 .. l ], o -> List( preimage[o], e -> [ o - 1 , e ] ) ) );
    
    end;

    AddColiftAlongEpimorphism( SkeletalFinLeftGSets,
      function ( SkeletalFinLeftGSets, pi, phi )
        local l, target_pi, m_target, preimage, dphi, mor_pi, map, mor;
        
        l := NumberOfTransitiveGSets( SkeletalFinLeftGSets );
        
        target_pi := Target( pi );
        
        m_target := PairOfSumAndListOfMultiplicities( target_pi )[2];
        
        preimage := List( [ 0 .. l-1 ], o -> List( [ 0 .. m_target[ o + 1 ] - 1 ], i -> PreimagePositions( SkeletalFinLeftGSets, pi, [ [ o , i ] ] )[ 1 ] ) );
        
        dphi := PairOfLists( phi );
        mor_pi := PairOfLists( pi )[2];
        
        map := List( [ 1 .. l ], o -> [ List( [ 1 .. m_target[o] ], i -> dphi[1][ preimage[o][i][1] + 1 ][1][ preimage[o][i][2] + 1 ] ),
                       List( [ 1 .. m_target[o] ], i -> dphi[1][ preimage[o][i][1] + 1 ][2][ preimage[o][i][2] + 1 ] )  ] );
        
        mor := List( [ 1 .. l ], o -> List( [ 1 .. m_target[o] ] , i->
                       dphi[2][ preimage[o][i][1] + 1 ][ preimage[o][i][2] + 1 ] * Inverse( mor_pi[ preimage[o][i][1] + 1 ][ preimage[o][i][2] + 1 ] ) ) );
        
        return MorphismConstructor( target_pi, [ map, mor ], Target( phi ) );
        
    end );

    FindConnectedcomponentsForCoequalizer :=
      function ( SkeletalFinLeftGSets, target, list_of_parallel_morphisms )
        local G, l, m_target, data, maps, mors, n, source_visited, target_visited, H, component_source,
              component_target, current_image, new_image, ofalse, xfalse, i, preimagepos, o_x, j, pos1, pos2;
        
        G := UnderlyingGroup( SkeletalFinLeftGSets );
        l := NumberOfTransitiveGSets( SkeletalFinLeftGSets );
        
        m_target := PairOfSumAndListOfMultiplicities( target )[ 2 ];
        
        data := List( list_of_parallel_morphisms, PairOfLists );
        maps := List( data, datum -> datum[1] );
        mors := List( data, datum -> datum[2] );
        n := Length( list_of_parallel_morphisms );
        
        source_visited := List( [ 1 .. l ], o -> [ ] );
        target_visited := List( [ 1 .. l ], o -> ListWithIdenticalEntries( m_target[o], false ) );
        
        H := List( [ 1 .. l ], o -> ListWithIdenticalEntries( m_target[o], One( G ) ) );
        
        component_source := [ ];
        component_target := [ ];
        #componentpos := List( [ 1 .. l ], o -> ListWithIdenticalEntries( m_target[o], fail ) );
        
        current_image := [ ];
        new_image := [ ];
        
        while ForAny( target_visited, e -> ForAny( e, b -> not b ) ) do
            
            #Add( component_source, List( [ 1 .. l ], o -> [ ] ) );
            Add( component_source, [ ] );
            Add( component_target, [ ] );

            # compute the first non yet visited position
            ofalse := PositionProperty( target_visited, e -> ForAny( e, b -> not b ) );
            xfalse := Position( target_visited[ ofalse ], false );
            
            ##
            current_image := [ [ ofalse - 1, xfalse - 1 ] ];

            target_visited[ofalse][xfalse] := true;
            Add( Last( component_target ), [ ofalse - 1, xfalse - 1 ] );
            #componentpos[ ofalse ][ xfalse ] := Length( component_source );

            ##
            while Length( current_image ) > 0 do
                
                new_image := [ ];

                for i in [ 1 .. n ] do
                    
                    preimagepos := PreimagePositions( SkeletalFinLeftGSets, list_of_parallel_morphisms[ i ], current_image );

                    for o_x in preimagepos do
                        # Only for optimization
                        if not o_x[2] in source_visited[o_x[1] + 1] then
                            AddSet( source_visited[o_x[1] + 1], o_x[2] );

                            Add( Last( component_source ), o_x );
                            
                            for j in [ 1 .. n ] do
                                
                                pos1 := maps[j][o_x[1] + 1][1][o_x[2] + 1] ;
                                pos2 := maps[j][o_x[1] + 1][2][o_x[2] + 1] ;
                                
                                if not target_visited[pos1 + 1][pos2 + 1] then
                                    
                                    target_visited[pos1 + 1][pos2 + 1] := true;

                                    Add( Last( component_target ), [ pos1, pos2 ] );
                                    Add( new_image, [ pos1, pos2 ] );
                                    
                                    H[pos1 + 1][pos2 + 1] := H[maps[i][o_x[1]+1][1][o_x[2]+1] + 1][maps[i][o_x[1]+1][2][o_x[2]+1] + 1] * mors[i][o_x[1]+1][o_x[2]+1] * Inverse( mors[j][o_x[1]+1][o_x[2]+1] );
                                    
                                fi;
                                
                            od;
                            
                        fi;
                    
                    od;
                    
                od;
                
                current_image := StructuralCopy( new_image );
                
            od;
            
        od;
        
        return [ component_source, component_target, H ];
        
    end;
    
    AddProjectionOntoCoequalizer( SkeletalFinLeftGSets,
      function ( cat, target, list_of_parallel_morphisms )
        local n, data, maps, mors, G, l, U, CHP, component_source, component_target, H, nc, m_target, componentpos,
              equations, welldefinednesspi, subgroups, subgroups_pos, conjugates, multiplicities_of_coequalizer, coequalizer, map_pos, map, mor;
        
        n := Length( list_of_parallel_morphisms );
        
        data := List( list_of_parallel_morphisms, phi -> PairOfLists( phi ) );
        maps := List( data, datum -> datum[1] );
        mors := List( data, datum -> datum[2] );
        
        G := UnderlyingGroup( SkeletalFinLeftGSets );
        l := NumberOfTransitiveGSets( SkeletalFinLeftGSets );
        U := RepresentativesOfSubgroupsUpToConjugation( SkeletalFinLeftGSets );
        
        CHP := FindConnectedcomponentsForCoequalizer( SkeletalFinLeftGSets, target, list_of_parallel_morphisms );
        component_source := CHP[ 1 ];
        component_target := CHP[ 2 ];
        H := CHP[ 3 ];
        
        nc := Length( component_source );
        
        m_target := PairOfSumAndListOfMultiplicities( target )[ 2 ];
        
        # componentpos store in which component_source lie the target at position [o][i]
        componentpos := List( [ 0 .. l-1 ], o ->
                              List( [ 0 .. m_target[ o + 1 ] - 1 ], i ->
                                    PositionProperty( component_target, c -> [ o , i ] in c ) ) );
        
        equations := List( component_source, c ->
                           Concatenation( List( Combinations( [ 1 .. n ], 2 ), a_b ->
                                  List( c, o_x ->
                                                H[ maps[a_b[1]][o_x[1]+1][1][o_x[2]+1] + 1 ][ maps[a_b[1]][o_x[1]+1][2][o_x[2]+1] + 1 ] *
                                                mors[a_b[1]][o_x[1]+1][o_x[2]+1] *
                                                Inverse( H[ maps[a_b[2]][o_x[1]+1][1][o_x[2]+1] + 1 ][ maps[a_b[2]][o_x[1]+1][2][o_x[2]+1] + 1 ] * mors[a_b[2]][o_x[1]+1][o_x[2]+1] )
                                        ) ) ) );
        
        welldefinednesspi := List( component_target, c -> Concatenation(
          List( c, o_x -> GeneratorsOfGroup( ConjugateSubgroup( U[o_x[1]+1], Inverse( H[o_x[1]+1][ o_x[2]+1 ] ) ) ) ) ) );
        
        # Define the corresponding groups :
        subgroups := List( [ 1 .. nc ] , i -> Subgroup( G, Concatenation( equations[i], welldefinednesspi[i] ) ) );
        
        # Find their representative object :
        subgroups_pos := List( subgroups, V -> SafeFirst( [ 1 .. Length(U) ], j -> IsConjugate( G, V, U[j] ) ) );
        
        # And the g_i such that V_i = g_i U_j g_i^-1 ( action in gap is : g^-1 X g ) :
        conjugates := List( [ 1 .. nc ], i -> RepresentativeAction( G, U[ subgroups_pos[ i ] ], subgroups[ i ] ) );
        
        # Construct the coequalizer object
        multiplicities_of_coequalizer := List( [ 1 .. l ], o -> Number( subgroups_pos, i -> i = o ) );
        coequalizer := ObjectConstructor( SkeletalFinLeftGSets, [ Sum( multiplicities_of_coequalizer ), multiplicities_of_coequalizer ] );
        
        # Construct the map :
        map_pos := List( [ 1 .. nc ], i ->
                         Number( subgroups_pos{ [ 1 .. i-1 ] }, j -> j = subgroups_pos[ i ] ) );
        
        map := List( [ 1 .. l ], o ->
                     [ List( [ 1 .. m_target[o] ], i -> subgroups_pos[ componentpos[o][i] ] - 1 ),
                       List( [ 1 .. m_target[o] ], i -> map_pos[ componentpos[o][i] ] ) ] );
        
        mor := List( [ 1 .. l ], o -> List( [ 1 .. m_target[o] ], i -> conjugates[ componentpos[o][i] ]*H[o][i] ) );
        
        return MorphismConstructor( SkeletalFinLeftGSets, target, [ map, mor ], coequalizer );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( SkeletalFinLeftGSets );
    fi;
    
    return SkeletalFinLeftGSets;
    
end ) );

##
InstallMethod( FinLeftGSet,
        "for a group and a list of nonnegative integers",
        [ IsGroup, IsList ],
        
  function ( group, multiplicities )
    local Omega;
    
    if not ( Length( multiplicities ) = 2 and IsList( multiplicities[2] ) ) then
        multiplicities := Pair( Sum( multiplicities ), ShallowCopy( multiplicities ) );
    fi;
    
    Omega := ObjectConstructor( SkeletalCategoryOfFiniteLeftGSets( group ), multiplicities );
    
    Assert( 4, IsWellDefined( Omega ) );
    
    return Omega;
    
end );

##
InstallMethod( FromListOfListsOfTriplesToPairOfLists,
        "for a skeletal category of finite left G-sets and a list",
        [ IsSkeletalCategoryOfFiniteLeftGSets, IsList ],
        
  function ( SkeletalFinLeftGSets, list_of_lists_of_triples )
    
    return Pair( List( list_of_lists_of_triples, list ->
                   Pair( List( list, triple -> -1 + triple[3] ),
                         List( list, triple -> -1 + triple[1] ) ) ),
                 List( list_of_lists_of_triples, list ->
                       List( list, triple -> Inverse( triple[2] ) ) ) );
    
end );

##
InstallMethod( FromPairOfListsToListOfListsOfTriples,
        "for a skeletal category of finite left G-sets and a list",
        [ IsSkeletalCategoryOfFiniteLeftGSets, IsList ],
        
  function ( SkeletalFinLeftGSets, pair_of_lists )
    local l;
    
    l := NumberOfObjectsOfUnderlyingCategory( SkeletalFinLeftGSets );
    
    return List( [ 1 .. l ], o ->
                 ListN( pair_of_lists[1][o][2], pair_of_lists[2][o], pair_of_lists[1][o][1], { i, g, j } ->
                        Triple( 1 + i, Inverse( g ), 1 + j ) ) );
    
end );

##
InstallMethod( MapOfFinGSets,
        "for two objects in the skeletal category of finite left G-sets and a list",
        [ IsObjectInSkeletalCategoryOfFiniteLeftGSets, IsList, IsObjectInSkeletalCategoryOfFiniteLeftGSets ],
        
  function ( S, images, T )
    local SkeletalFinLeftGSets, G, map;
    
    SkeletalFinLeftGSets := CapCategory( S );
    
    if not IsIdenticalObj( SkeletalFinLeftGSets, CapCategory( T ) ) then
        Error( "the underlying categories of G-sets of the source and the target are not the same with respect to IsIdenticalObj\n" );
    fi;
    
    G := UnderlyingGroup( SkeletalFinLeftGSets );
    
    if ForAll( images, list ->
               ForAll( list, triple ->
                       IsList( triple ) and
                       Length( triple ) = 3 and
                       IsBigInt( triple[1] ) and
                       triple[2] in G and
                       IsBigInt( triple[3] ) ) ) then
        
        images := FromListOfListsOfTriplesToPairOfLists( SkeletalFinLeftGSets, images );
        
    fi;
    
    map := MorphismConstructor( SkeletalFinLeftGSets,
                   S,
                   images,
                   T );
    
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingGroupAsCategoryData,
        "for a skeletal category of finite G-sets",
        [ IsSkeletalCategoryOfFiniteLeftGSets ],
        
  function ( SkeletalFinLeftGSets )
    local UTG, TG, G, embedding_on_objects, embedding_on_morphisms;
    
    UTG := ModelingCategory( SkeletalFinLeftGSets );
    
    TG := UnderlyingCategory( UTG );
    
    G := UnderlyingGroup( SkeletalFinLeftGSets );
    
    embedding_on_objects :=
      function ( objG )
        local obj_UTG;
        
        obj_UTG := EmbeddingOfUnderlyingCategoryData( UTG )[2][1](
                           EmbeddingOfUnderlyingGroupAsCategoryData( TG )[2][1]( objG ) );
                   
        return ReinterpretationOfObject( SkeletalFinLeftGSets, obj_UTG );
        
    end;
    
    embedding_on_morphisms :=
      function ( source, morG, target )
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
        
        return ReinterpretationOfMorphism( SkeletalFinLeftGSets,
                       source,
                       mor_UTG,
                       target );
        
    end;
    
    return Triple( UnderlyingGroupAsCategory( SkeletalFinLeftGSets ),
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   SkeletalFinLeftGSets );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingGroupAsCategory,
        "for a skeletal category of finite G-sets",
        [ IsSkeletalCategoryOfFiniteLeftGSets ],
        
  function ( SkeletalFinLeftGSets )
    local data, Y;
    
    data := EmbeddingOfUnderlyingGroupAsCategoryData( SkeletalFinLeftGSets );
    
    Y := CapFunctor( "Embedding functor of underlying group as category into the skeletal category of finite G-sets", data[1], SkeletalFinLeftGSets );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToSkeletalCategoryOfFiniteLeftGSetsData,
        "for a two categories and a pair of functions",
        [ IsSkeletalCategoryOfFiniteLeftGSets, IsList, IsCategoryWithCoequalizers ],
        
  function ( SkeletalFinLeftGSets, pair_of_funcs, cocomplete_category )
    local UTG, TG;
    
    UTG := ModelingCategory( SkeletalFinLeftGSets );
    TG := UnderlyingCategory( UTG );
    
    ## the code below is the doctrine-specific ur-algorithm for the coequalizer completion
    
    return ExtendFunctorToReinterpretedCategoryData(
                   SkeletalFinLeftGSets,
                   ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategoryData(
                           UTG,
                           ExtendFunctorToSkeletalCategoryOfTransitiveLeftGSetsData(
                                   TG,
                                   pair_of_funcs,
                                   cocomplete_category )[2],
                           cocomplete_category )[2],
                   cocomplete_category );
    
end );

##
InstallMethod( ExtendFunctorToSkeletalCategoryOfFiniteLeftGSets,
        "for a functor",
        [ IsCapFunctor ],
        
  function ( F )
    local C, D, SkeletalFinLeftGSets, data, Fhat;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    SkeletalFinLeftGSets := SkeletalCategoryOfFiniteLeftGSets( UnderlyingGroup( C ) );
    
    data := ExtendFunctorToSkeletalCategoryOfFiniteLeftGSetsData(
                    SkeletalFinLeftGSets,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    Fhat := CapFunctor( Concatenation( "Extension to SkeletalFinLeftGSets( Source( ", Name( F ), " ) )" ), SkeletalFinLeftGSets, D );
    
    AddObjectFunction( Fhat,
            data[2][1] );
    
    AddMorphismFunction( Fhat,
            data[2][2] );
    
    return Fhat;
    
end );

##
InstallMethod( \.,
        "for a skeletal category of finite G-sets and a positive integer",
        [ IsSkeletalCategoryOfFiniteLeftGSets, IsPosInt ],
        
  function ( SkeletalFinLeftGSets, string_as_int )
    local UTG, TG, name, Y;
    
    UTG := ModelingCategory( SkeletalFinLeftGSets );
    
    name := NameRNam( string_as_int );
    
    Y := ReinterpretationFunctor( SkeletalFinLeftGSets );
    
    return Y( UTG.(name) );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for an object in a skeletal category of finite G-sets",
        [ IsObjectInSkeletalCategoryOfFiniteLeftGSets ],
        
  function ( obj )
    
    return Concatenation( String( ObjectDatum( obj ) ), "\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in a skeletal category of finite G-sets",
        [ IsMorphismInSkeletalCategoryOfFiniteLeftGSets ],
        
  function ( mor )
    
    return Concatenation(
                   DisplayString( Source( mor ) ),
                   " |\n",
                   String( MorphismDatum( mor ) ), "\n",
                   " |\n",
                   " v\n",
                   DisplayString( Target( mor ) ) );
    
end );
