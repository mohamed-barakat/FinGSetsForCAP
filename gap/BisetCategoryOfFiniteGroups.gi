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
    local name, Bisets, NN;
    
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
    
    NN := HomalgSemiringOfNaturalNumbers( );
    
    SetCommutativeSemiringOfLinearCategory( Bisets, NN );
    SetIsLinearCategoryOverCommutativeSemiringWithFinitelyGeneratedFreeExternalHoms( Bisets, true );
    
    SetIsEquippedWithHomomorphismStructure( Bisets, true );
    SetRangeCategoryOfHomomorphismStructure( Bisets, CategoryOfRows( NN ) );
    
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
    AddLinearCombinationOfMorphisms( Bisets,
      function ( Bisets, G, multiplicities, bisets, H )
        local HSet, nr_gens, l, action_pairs, diagram, coproduct;
        
        HSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( H );
        
        nr_gens := Length( GeneratorsOfGroup( UnderlyingGroup( G ) ) );
        
        l := Length( bisets );
        
        action_pairs := List( [ 1 .. l ], i -> UnderlyingActionPair( bisets[i] ) );
        
        diagram := Concatenation( List( [ 1 .. l ], i -> ListWithIdenticalEntries( multiplicities[i], action_pairs[i][1] ) ) );
        
        coproduct := Coproduct( HSet, diagram );
        
        return MorphismConstructor( Bisets,
                       G,
                       Pair( coproduct,
                             List( [ 1 .. nr_gens ], j ->
                                   CoproductFunctorialWithGivenCoproducts( HSet,
                                           coproduct,
                                           diagram,
                                           Concatenation( List( [ 1 .. l ], i -> ListWithIdenticalEntries( multiplicities[i], action_pairs[i][2][j] ) ) ),
                                           diagram,
                                           coproduct ) ) ),
                       H );
        
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
            
            morH_decomposed := DecomposeGroupAsCategoryMorphism( morH );
            
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
    
    ##
    AddBasisOfExternalHom( Bisets,
      function ( Bisets, source, target )
        local G, Ggens, H, HSet, l, V, P, Us, transitive;
        
        G := UnderlyingGroup( source );
        Ggens := GeneratorsOfGroup( G );
        
        H := UnderlyingGroup( target );
        HSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( target );
        l := NumberOfTransitiveGSets( HSet );
        V := RepresentativesOfSubgroupsUpToConjugation( HSet );
        
        P := DirectProduct( H, G );
        Us := List( [ 1 .. Length( MarksTom( TableOfMarks ( P ) ) ) ], i -> RepresentativeTom( TableOfMarks( P ), i ) );
        
        transitive :=
          function( U )
            local p1, p2, P2, K1, K1pos, K1conj, phi, t, n, m, perms, data_mors, maps, mors, j, hset, autos;

            # Compute the p1 and the p2 for U
            p1 := RestrictedMapping( Projection( P, 1 ), U );
            p2 := RestrictedMapping( Projection( P, 2 ), U );
            P2 := ImagesSource( p2 );

            K1 := ImagesSource( RestrictedMapping( p1, KernelOfMultiplicativeGeneralMapping( p2 ) ) );
            K1pos := PositionProperty( V, v -> IsConjugate( H, v, K1 ) );
            K1conj := RepresentativeAction( H, V[ K1pos ], K1 );

            phi := CompositionMapping( p1, InverseGeneralMapping( p2 ) );

            t := RightTransversal( G, P2 );
            n := Length( t );
            m := Length( Ggens );

            perms := List( [ 1 .. m ], j -> List( [ 1 .. n ], i -> PositionCanonical( t, t[i] * Ggens[j] ) ) );
            data_mors := List( [ 1 .. m ], j ->
                               List( [ 1 .. n ], i ->
                                     K1conj * ImagesRepresentative( phi, t[i] * Ggens[j] * Inverse( t[perms[j][i]] ) ) * Inverse( K1conj ) ) );

            maps := List( [ 1 .. m ], j -> Concatenation( ListWithIdenticalEntries( K1pos - 1, Pair( [ ], [ ] ) ),
                                                          [ Pair( ListWithIdenticalEntries( n, -1 + K1pos ), List( perms[j], i -> -1 + i ) ) ],
                                                          ListWithIdenticalEntries( l - K1pos, Pair( [ ], [ ] ) ) ) );

            mors := List( [ 1 .. m ], j -> Concatenation( ListWithIdenticalEntries( K1pos - 1 , [] ) ,
                                                          [ data_mors[j] ],
                                                          ListWithIdenticalEntries( l - K1pos, [] ) ) );

            hset := ObjectConstructor( HSet, Pair( n, Concatenation( ListWithIdenticalEntries( K1pos - 1, 0 ),
                                                                     [ n ],
                                                                     ListWithIdenticalEntries( l - K1pos, 0 )  ) ) );

            autos := List( [ 1 .. m ], j -> MorphismConstructor( HSet, hset, Pair( maps[j], mors[j] ), hset ) );
            
            return MorphismConstructor( Bisets, source, Pair( hset, autos ), target );
        end;

      return List( Us, transitive );

    end );
    
    ##
    AddCoefficientsOfMorphism( Bisets,
      function( Bisets, biset )
        local recomposition, target, G, Ggens, G_cat, H, HSet, l, V, P, tom, ltom, Us, action_pair,
              multiplicities, maps, perms, orbits, transitives, lt, P2s, K1s, phis, subgroups, subgroups_pos;

        recomposition :=
          function( action_pair, h_as_cat_morphism )
            local KSets, isos_and_inverse_of_Kset, decompose;
            
            KSets := CapCategory( action_pair[1] );
            
            isos_and_inverse_of_Kset := Concatenation( action_pair[2], List( action_pair[2], mor -> InverseForMorphisms( KSets, mor ) ) );
            
            decompose := DecomposeGroupAsCategoryMorphism( h_as_cat_morphism );
            
            return PreComposeList( KSets, action_pair[1], isos_and_inverse_of_Kset{decompose}, action_pair[1] );
            
        end;

        target := Target( biset );
        
        G := UnderlyingGroup( Source( biset ) );
        Ggens := GeneratorsOfGroup( G );
        G_cat := GroupAsCategory( G );
        H := UnderlyingGroup( target );
        
        HSet := UnderlyingSkeletalCategoryOfFiniteLeftGSets( target );
        l := NumberOfTransitiveGSets( HSet );
        V := RepresentativesOfSubgroupsUpToConjugation( UnderlyingCategory( ModelingCategory( HSet ) ) );
        
        P := DirectProduct( H, G );
        
        tom := TableOfMarks( P );
        ltom := Length( MarksTom( tom ) );
        Us := List( [ 1 .. ltom ], i -> RepresentativeTom( tom, i ) );
        
        action_pair := UnderlyingActionPair( biset );
        
        multiplicities := PairOfSumAndListOfMultiplicities( action_pair[1] )[2];
        
        maps := List( action_pair[2], auto -> PairOfLists( auto )[1] );
        perms := List( [ 1 .. l ], o -> List( maps, m -> PermList( 1 + m[o][2] ) ) );
        
        orbits := List( [ 1 .. l ], o -> OrbitsDomain( Group( perms[o] ), [ 1 .. multiplicities[ o ] ] ) );
        
        transitives := Concatenation( List( [ 1 .. l ], o -> List( orbits[o], i -> [ o, i ] ) ) );
        lt := Length( transitives );
        
        P2s := List( transitives, t -> Stabilizer( G, [ 1 .. multiplicities[t[1]] ], t[2][1], Ggens, perms[t[1]] ) );
        
        K1s := List( transitives, t ->
                     ImagesSource( CompositionMapping( Embedding( P, 1 ), RestrictedMapping( IdentityMapping( H ), V[t[1]] ) ) ) );

        phis := List( [ 1 .. lt ], i ->
                      Subgroup( P,
                              List( GeneratorsOfGroup( P2s[i] ), g ->
                                    Embedding( P, 2 )( g ) *
                                    Embedding( P, 1 )( MorphismDatum( recomposition( action_pair,
                                            GroupAsCategoryMorphism( G_cat, g ) ) )[2][ transitives[i][1] ][ transitives[i][2][1] ] ) ) ) );
        
        subgroups := List( [ 1 .. lt ], i -> ClosureSubgroup( K1s[i], phis[i] ) );
        
        subgroups_pos := List( [ 1 .. lt ], i -> PositionProperty( Us, u -> IsConjugate( P, u, subgroups[i] ) ) );
        
        return List( [ 1 .. ltom ], o -> Number( subgroups_pos, u -> u = o ) );
        
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
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum;
    
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
        local BisetsWithActionDataAsMorphisms, basis;
        
        BisetsWithActionDataAsMorphisms := ModelingCategory( Bisets );
        
        basis := BasisOfExternalHom( BisetsWithActionDataAsMorphisms, source, target );
        
        return LinearCombinationOfMorphisms( BisetsWithActionDataAsMorphisms,
                       source,
                       pair_of_int_and_list[2], basis,
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function ( Bisets, phi )
        local BisetsWithActionDataAsMorphisms, multiplicities;
        
        BisetsWithActionDataAsMorphisms := ModelingCategory( Bisets );

        multiplicities := CoefficientsOfMorphism( BisetsWithActionDataAsMorphisms, phi );
        
        return Pair( Length( multiplicities ), multiplicities );
        
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
