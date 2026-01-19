# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

InstallMethod( BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms,
        [  ],
        
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
    [ "overhead", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS )
    local name, Bisets;
    
    name := "BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms";
    
    Bisets :=
      CreateCapCategoryWithDataTypes( name,
              IsBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms,
              IsObjectInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms,
              IsMorphismInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms,
              IsCapCategoryTwoCell,
              IsGroup,
              CapJitDataTypeOfNTupleOf( 2,
                      rec( category := false, filter := IsObjectInSkeletalCategoryOfFiniteLeftGSets ),
                      CapJitDataTypeOfListOf( rec( category := false, filter := IsMorphismInSkeletalCategoryOfFiniteLeftGSets ) ) ),
              fail :
              overhead := CAP_NAMED_ARGUMENTS.overhead );
    
    Bisets!.category_as_first_argument := true;
    #Bisets!.supports_empty_limits := true;
    
    # this is a workhorse category -> no logic and caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( Bisets );
    
    #SetIsEquippedWithHomomorphismStructure( Bisets, true );
    #SetRangeCategoryOfHomomorphismStructure( Bisets, CategoryOfFgAbelianMonoids );
    
    ##
    AddObjectConstructor( Bisets,
      function ( Bisets, G )
        local GSets;
        
        GSets := SkeletalCategoryOfFiniteLeftGSets( G );
        
        return CreateCapCategoryObjectWithAttributes( Bisets,
                       UnderlyingGroup, G,
                       UnderlyingSkeletalCategoryOfFiniteLeftGSets, GSets );
        
    end );
    
    ##
    AddObjectDatum( Bisets,
      function ( Bisets, group_in_biset_category )
        
        return UnderlyingGroup( group_in_biset_category );
        
    end );
    
    ##
    AddMorphismConstructor( Bisets,
      function ( Bisets, source, action_pair, target )
        
        return CreateCapCategoryMorphismWithAttributes( Bisets,
                       source,
                       target,
                       UnderlyingActionPair, action_pair );
        
    end );
    
    ##
    AddMorphismDatum( Bisets,
      function ( Bisets, phi )
        
        return UnderlyingActionPair( phi );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( Bisets,
      function ( Bisets, group_in_biset_category )
        
        return IsGroup( UnderlyingGroup( group_in_biset_category ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( Bisets,
      function ( Bisets, phi )
        local HSet, pair;

        HSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( Target( phi ) );
        
        pair := UnderlyingActionPair( phi );
        
        return IsIdenticalObj( CapCategory( pair[1] ), HSet ) and
               ForAll( pair[2], mor -> IsIdenticalObj( CapCategory( mor ), HSet ) ) and
               ForAll( pair[2], mor -> IsEqualForObjects( HSet, Source( mor ), pair[1] ) ) and
               ForAll( pair[2], mor -> IsEqualForObjects( HSet, Target( mor ), pair[1] ) );
               #ForAll( pair[2], mor -> IsIsomorphism( HSet, mor ) );
        
    end );
    
    ##
    AddIsEqualForObjects( Bisets,
      function ( Bisets, group_in_biset_category1, group_in_biset_category2 )
        
        return IsIdenticalObj( UnderlyingGroup( group_in_biset_category1 ), UnderlyingGroup( group_in_biset_category2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( Bisets,
      function ( Bisets, mor1, mor2 )
        local HSet, pair1, pair2, l;
        
        HSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( Target( mor1 ) );
        
        pair1 := UnderlyingActionPair( mor1 );
        pair2 := UnderlyingActionPair( mor2 );
        
        l := Length( pair1[2] );
        
        return IsEqualForObjects( HSet, pair1[1], pair2[1] )and
               ForAll( [ 1 .. l ], i -> IsEqualForMorphisms( HSet, pair1[2][i], pair2[2][i] ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( Bisets,
      function ( Bisets, phi, psi )
        
        Error( "Not yet implemented\n" );
        
    end );
    
    ##
    AddIdentityMorphism( Bisets,
      function ( Bisets, group_in_biset_category )
        local GSet, G, u, gens, Y, PHS;
        
        GSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( group_in_biset_category );
        
        G := UnderlyingGroupAsCategory( GSet );
        
        u := GroupAsCategoryUniqueObject( G );
        
        gens := SetOfGeneratingMorphismsOfCategory( G );
        
        Y := EmbeddingOfUnderlyingGroupAsCategoryData( GSet )[2];
        
        ## the principal homogeneous G-set
        PHS := Y[1]( u );
        
        return MorphismConstructor( Bisets,
                       group_in_biset_category,
                       Pair( PHS,
                             List( gens, g -> Y[2]( PHS, g, PHS ) ) ),
                       group_in_biset_category );
        
    end );
    
    ##
    AddPreCompose( Bisets,
      function ( Bisets, mor_pre, mor_post )
        local GSet, HSet, KSet, H_as_category, H, pair_pre, pair_post, isos_and_inverse_of_Kset, obj_func, decompose, mor_func, pair, Kset;
        
        GSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( Source( mor_pre ) );
        HSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( Source( mor_post ) );
        KSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( Target( mor_post ) );
        
        H_as_category := UnderlyingGroupAsCategory( HSet );
        
        H := UnderlyingGroup( H_as_category );
        
        pair_pre := UnderlyingActionPair( mor_pre );
        pair_post := UnderlyingActionPair( mor_post );

        isos_and_inverse_of_Kset := Concatenation( pair_post[2], List( pair_post[2], mor -> InverseForMorphisms( KSet, mor ) ) );
        
        obj_func :=
          function ( objH )
            
            return pair_post[1];
            
        end;
        
        mor_func :=
          function ( source, morH, target )
            local morH_decomposed;
            
            morH_decomposed := Reversed( DecomposeGroupAsCategoryMorphism( morH ) );
            
            return PreComposeList( KSet,
                           source,
                           isos_and_inverse_of_Kset{morH_decomposed},
                           target );
            
        end;
        
        pair := ExtendFunctorToSkeletalCategoryOfFiniteLeftGSetsData( HSet, Pair( obj_func, mor_func ), KSet )[2];
        
        Kset := pair[1]( pair_pre[1] );
        
        return MorphismConstructor( Bisets,
                       Source( mor_pre ),
                       Pair( Kset, List( pair_pre[2], mor_HSet -> pair[2]( Kset, mor_HSet, Kset ) ) ),
                       Target( mor_post ) );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( Bisets );
    fi;
    
    return Bisets;
    
end ) );

BindGlobal( "BisetCategoryOfFinGroupsWithActionDataAsMorphisms", BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms( ) );

##
InstallMethod( BisetCategoryOfFiniteGroups,
               [  ],
               
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
  ],
  function ( CAP_NAMED_ARGUMENTS )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          BisetsWithActionDataAsMorphisms, Bisets,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, recomposition, modeling_tower_morphism_datum;
    
    ##
    object_datum_type := IsGroup;
    
    ##
    object_constructor :=
      function ( Bisets, G )
        local GSets;
        
        GSets := SkeletalCategoryOfFiniteLeftGSets( G );
        
        return CreateCapCategoryObjectWithAttributes( Bisets,
                       UnderlyingGroup, G,
                       UnderlyingSkeletalCategoryOfFiniteLeftGSets, GSets );
        
    end;
    
    ##
    object_datum :=
      function ( Bisets, group_in_biset_category )
        
        return UnderlyingGroup( group_in_biset_category );
        
    end;
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              IsBigInt,
              CapJitDataTypeOfListOf( IsBigInt ) );
    
    ##
    morphism_constructor :=
      function ( Bisets, source, pair_of_int_and_list, target )
        
        return CreateCapCategoryMorphismWithAttributes( Bisets,
                       source,
                       target,
                       PairOfIntAndList, pair_of_int_and_list );
        
    end;
    
    ##
    morphism_datum :=
      function ( Bisets, phi )
        
        return PairOfIntAndList( phi );
        
    end;
    
    ## building the categorical tower:
    BisetsWithActionDataAsMorphisms := BisetCategoryOfFiniteGroupsWithActionDataAsMorphisms( : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function ( Bisets, group )
        local BisetsWithActionDataAsMorphisms;
        
        BisetsWithActionDataAsMorphisms := ModelingCategory( Bisets );
        
        return ObjectConstructor( BisetsWithActionDataAsMorphisms, group );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function ( Bisets, object_in_category_of_bisets_with_functors_as_morphisms )
        
        return UnderlyingGroup( object_in_category_of_bisets_with_functors_as_morphisms );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function ( Bisets, source, pair_of_int_and_list, target )
        local BisetsWithActionDataAsMorphisms, H, Hgens, lhg, K, KSets, k, V, P, U, non_nul_pos, nnp, mult, p1s, p2s,
              K2s, K2s_pos, K2s_conj, phis, trs, ltrs, k_pos, offsets, multiplicities, biset_as_kset, perms, data_mors,
              maps, mors, endos;
        
        BisetsWithActionDataAsMorphisms := ModelingCategory( Bisets );
        
        H := UnderlyingGroup( source );
        Hgens := GeneratorsOfGroup( H );
        lhg := Length( Hgens );
        
        K := UnderlyingGroup( target );
        KSets := UnderlyingSkeletalCategoryOfFiniteLeftGSets( target );
        k := NumberOfObjects( UnderlyingCategory( ModelingCategory( KSets ) ) );
        V := RepresentativesOfSubgroupsUpToConjugation( UnderlyingCategory( ModelingCategory( KSets ) ) );
        
        P := DirectProduct( H, K );
        # rmk : pair_of_int_and_list[1] = Length( MarksTom( TableOfMarks ( P ) ) )
        U := List( [ 1 .. pair_of_int_and_list[1] ], i -> RepresentativeTom( TableOfMarks( P ), i ) );
        
        # Focus on nonzero position:
        non_nul_pos := PositionsProperty( pair_of_int_and_list[2], i -> i <> 0 );
        nnp := Length( non_nul_pos );
        
        # mult is the number of copies of each subgroups
        mult := pair_of_int_and_list[2]{ non_nul_pos };
        
        # Compute the p1's and the p2's for each subgroups
        p1s := List( non_nul_pos, i -> RestrictedMapping( Projection( P, 1 ), U[i] ) );
        p2s := List( non_nul_pos, i -> RestrictedMapping( Projection( P, 2 ), U[i] ) );
        
        # Compute the K2's, theirs corresponding object position in K-Set and the corresponding conjugaison
        K2s := List( [ 1 .. nnp ], i -> ImagesSource( RestrictedMapping( p2s[i], KernelOfMultiplicativeGeneralMapping( p1s[i] ) ) ) );
        K2s_pos := List( [ 1 .. nnp ], i -> PositionProperty( V, v -> IsConjugate( K, v, K2s[i] ) ) );
        K2s_conj := List( [ 1 .. nnp ], i -> RepresentativeAction( K, V[ K2s_pos[i] ], K2s[i] ) );
        
        # phi_i associate a element h of P1_i to an element k of P2_i such that (h,k) is in D_i
        phis := List( [ 1 .. nnp ], i -> CompositionMapping( p2s[i], InverseGeneralMapping( p1s[i] ) ) );
        trs := List( [ 1 .. nnp ], i -> RightTransversal( H, ImagesSource(p1s[i]) ) );
        ltrs := List( trs, Length );
        
        # For a given position object o in K-Set, give the positions i in our list such that K2s_pos[i] = o
        k_pos := List( [ 1 .. k ], o -> Positions( K2s_pos, o ) );
        offsets := List( [ 1 .. k ], o ->
                         Concatenation( [ 0 ],
                                 List( [ 1 .. Length( k_pos[ o ] ) ] , i ->
                                       Sum( List( k_pos[o]{[ 1 .. i ]}, pos -> ltrs[pos] * mult[pos] ) ) ) ) );
        
        # Construct the underlying K-set of the biset corresponding to the given subgroups.
        multiplicities := List( [ 1 .. k ], o -> Last( offsets[o] ) );
        biset_as_kset := ObjectConstructor( KSets , [ Sum( multiplicities ), multiplicities ] );
        
        perms := List( Hgens, h ->
                       List( [ 1 .. nnp ], p ->
                             List( [ 1 .. ltrs[p] ], i ->
                                   PositionCanonical( trs[p], trs[p][i] * Inverse(h) ) ) ) );
        
        data_mors := List( [ 1 .. lhg ], h ->
                           List( [ 1 .. nnp ], p ->
                                 List( [ 1 .. ltrs[p] ], i ->
                                       K2s_conj[p] *
                                       ImagesRepresentative( phis[p], trs[p][ perms[h][p][i] ] * Hgens[h] * Inverse( trs[p][i] ) ) *
                                       Inverse( K2s_conj[p] ) ) ) );
        
        # We need the offsets here to correctly construct the maps:
        maps := List( [ 1 .. lhg ], h ->
                      List( [ 1 .. k ], o ->
                            Pair( ListWithIdenticalEntries( multiplicities[o], o - 1 ),
                                  Concatenation( List( [ 1 .. Length( k_pos[o] ) ], j ->
                                          Concatenation( List( [ 1 .. mult[k_pos[o][j]] ], c ->
                                                  perms[h][k_pos[o][j]] + (c - 1)*ltrs[k_pos[o][j]] - 1 + offsets[o][j] ) ) ) ) ) ) );
        
        mors := List( [ 1 .. lhg ], h ->
                      List( [ 1 .. k ], o ->
                            Concatenation( List( [ 1 .. Length( k_pos[o] ) ], j ->
                                    Concatenation( ListWithIdenticalEntries( mult[ k_pos[o][j] ], data_mors[h][ k_pos[o][j] ] ) ) ) ) ) );
        
        endos := List( [ 1 .. lhg ], h ->
                       MorphismConstructor( KSets, biset_as_kset, Pair( maps[h], mors[h] ), biset_as_kset ) );
        
        return MorphismConstructor( BisetsWithActionDataAsMorphisms, source, [ biset_as_kset, endos ], target );
        
    end;
    
    recomposition :=
      function( action_pair, h_as_cat_morphism )
        local KSets, isos_and_inverse_of_Kset, decompose;
        
        KSets := CapCategory( action_pair[1] );
        
        isos_and_inverse_of_Kset := Concatenation( action_pair[2], List( action_pair[2], mor -> InverseForMorphisms( KSets, mor ) ) );
        
        decompose := Reversed( DecomposeGroupAsCategoryMorphism( h_as_cat_morphism ) );
        
        return PreComposeList( KSets, action_pair[1], isos_and_inverse_of_Kset{decompose}, action_pair[1] );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function ( Bisets, phi )
        local target, H, H_cat, K, KSets, k, V, P, tom, l, U, action_pair,
              biset_as_functor, multiplicities, data, Hgens, maps, positions, lp,
              map_perms, domains, orbits, transitifs, lt, P1s, K2s, phis, subgroups, subgroups_pos;
        
        target := Target( phi );
        
        H := UnderlyingGroup( Source( phi ) );
        Hgens := GeneratorsOfGroup( H );
        H_cat := GroupAsCategory( H );
        K := UnderlyingGroup( target );
        
        KSets := UnderlyingSkeletalCategoryOfFiniteLeftGSets( target );
        k := NumberOfObjects( UnderlyingCategory( ModelingCategory( KSets ) ) );
        V := RepresentativesOfSubgroupsUpToConjugation( UnderlyingCategory( ModelingCategory( KSets ) ) );
        
        P := DirectProduct( H, K );
        
        tom := TableOfMarks( P );
        l := Length( MarksTom( tom ) );
        U := List( [ 1 .. l ], i -> RepresentativeTom( tom, i ) );
        
        action_pair := UnderlyingActionPair( phi );
        
        multiplicities := PairOfSumAndListOfMultiplicities( action_pair[1] )[2];
        
        data := List( action_pair[2], f -> PairOfLists( f ) );
        
        maps := List( data, d -> d[1] );
        
        map_perms := List( [ 1 .. k ], o -> List( maps, m -> PermList( m[o][2] + 1 ) ) );
        
        orbits := List( [ 1 .. k ], o -> OrbitsDomain( Group( map_perms[o] ), [ 1 .. multiplicities[ o ] ] ) );
        
        transitifs := Concatenation( List( [ 1 .. k ], i -> List( orbits[i], l -> [ i, l ] ) ) );
        lt := Length( transitifs );
        
        P1s := List( transitifs, t -> Stabilizer( H, [ 1 .. multiplicities[t[1]] ], t[2][1], Hgens, List( map_perms[ t[1] ], Inverse ) ) );
        
        K2s := List( transitifs, t ->
                     ImagesSource( CompositionMapping( Embedding(P,2), RestrictedMapping( IdentityMapping(K), V[ t[ 1 ] ] ) ) ) );

        phis := List( [ 1 .. lt ], i ->
                      Subgroup( P,
                              List( GeneratorsOfGroup( P1s[i] ), h ->
                                    Embedding( P, 1 )( h ) *
                                    Embedding( P, 2 )( MorphismDatum( recomposition( action_pair,
                                            GroupAsCategoryMorphism( GroupAsCategory( H ), h ) ) )[2][ transitifs[i][1] ][ transitifs[i][2][1] ] ) ) ) );
        
        subgroups := List( [ 1 .. lt ], i -> ClosureSubgroup( K2s[i], phis[i] ) );
        
        subgroups_pos := List( [ 1 .. lt ], i -> PositionProperty( U, u -> IsConjugate( P, u, subgroups[i] ) ) );
        
        return Pair( l, List( [ 1 .. l ], o -> Number( subgroups_pos, u -> u = o ) ) );
        
    end;
    
    ##
    Bisets :=
      ReinterpretationOfCategory( BisetsWithActionDataAsMorphisms,
              rec( name := "BisetCategoryOfFiniteGroups",
                   category_filter := IsBisetCategoryOfFiniteGroups,
                   category_object_filter := IsObjectInBisetCategoryOfFiniteGroups,
                   category_morphism_filter := IsMorphismInBisetCategoryOfFiniteGroups,
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
    
    AddIsWellDefinedForMorphisms( Bisets,
      function ( Bisets, biset )
        local pair, tom, l;
        
        pair := PairOfIntAndList( biset );
        
        tom := UnderlyingTableOfMarks( biset );
        
        l := Length( MarksTom( tom ) );
        
        return l = pair[1] and
               pair[1] = Length( pair[2] ) and
               ForAll( pair[2], a -> a >= 0 );
        
    end );
    
    AddIsCongruentForMorphisms( Bisets,
      function ( Bisets, biset1, biset2 )
        
        return PairOfIntAndList( biset1 ) = PairOfIntAndList( biset2 );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( Bisets );
    fi;
    
    return Bisets;
    
end ) );

BindGlobal( "BisetCategoryOfFinGroups", BisetCategoryOfFiniteGroups( ) );

##
InstallMethod( UnderlyingTableOfMarks,
        "for a morphism in the biset category of finite groups",
        [ IsMorphismInBisetCategoryOfFiniteGroups ],
        
  function ( biset )
    
    return TableOfMarks( DirectProduct( UnderlyingGroup( Source( biset ) ), UnderlyingGroup( Target( biset ) ) ) );
    
end );

##################################
##
## String, View, and Display methods
##
##################################

##
InstallMethod( DisplayString,
        "for a group as an object in the biset category of finite groups with action data as morphisms",
        [ IsObjectInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms ],
        
  function ( group_in_biset_category )
    
    return String( UnderlyingGroup( group_in_biset_category ) );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in the biset category of finite groups with action data as morphisms",
        [ IsMorphismInBisetCategoryOfFiniteGroupsWithActionDataAsMorphisms ],
        
  function ( biset )
    
    Error( );
    
end );

##
InstallMethod( DisplayString,
        "for a group as an object in the biset category of finite groups",
        [ IsObjectInBisetCategoryOfFiniteGroups ],
        
  function ( group_in_biset_category )
    
    return String( UnderlyingGroup( group_in_biset_category ) );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in the biset category of finite groups",
        [ IsMorphismInBisetCategoryOfFiniteGroups ],
        
  function ( biset )
    
    return String( PairOfIntAndList( biset ) );
    
end );