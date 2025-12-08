# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

InstallMethod( BisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms,
        [  ],
        
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
    [ "overhead", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS )
    local name, Bisets;
    
    name := "BisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms";
    
    Bisets :=
      CreateCapCategoryWithDataTypes( name,
              IsBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms,
              IsObjectInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms,
              IsMorphismInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms,
              IsCapCategoryTwoCell,
              IsGroup,
              rec( category := false, filter := IsCapFunctor ),
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
      function ( Bisets, source, functor, target )
        
        return CreateCapCategoryMorphismWithAttributes( Bisets,
                       source,
                       target,
                       UnderlyingFunctorOfBiset, functor );
        
    end );
    
    ##
    AddMorphismDatum( Bisets,
      function ( Bisets, phi )
        
        return UnderlyingFunctorOfBiset( phi );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( Bisets,
      function ( Bisets, group_in_biset_category )
        
        return IsGroup( UnderlyingGroup( group_in_biset_category ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( Bisets,
      function ( Bisets, phi )
        local functor;
        
        functor := UnderlyingFunctorOfBiset( phi );
        
        return IsIdenticalObj( UnderlyingGroup( Source( phi ) ), UnderlyingGroup( SourceOfFunctor( functor ) ) ) and
               IsIdenticalObj( UnderlyingSkeletalCategoryOfFiniteLeftGSets( Target( phi ) ), RangeOfFunctor( functor ) );
        
    end );
    
    ##
    AddIsEqualForObjects( Bisets,
      function ( Bisets, group_in_biset_category1, group_in_biset_category2 )
        
        return IsIdenticalObj( UnderlyingGroup( group_in_biset_category1 ), UnderlyingGroup( group_in_biset_category2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( Bisets,
      function ( Bisets, phi, psi )
        
        return IsIdenticalObj( UnderlyingFunctorOfBiset( phi ), UnderlyingFunctorOfBiset( psi ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( Bisets,
      function ( Bisets, phi, psi )
        
        Error( "Not yet implemented\n" );
        
    end );
    
    ##
    AddIdentityMorphism( Bisets,
      function ( Bisets, group_in_biset_category )
        
        return MorphismConstructor( Bisets,
                       group_in_biset_category,
                       EmbeddingOfUnderlyingGroupAsCategory( UnderlyingSkeletalCategoryOfFiniteLeftGSets( group_in_biset_category ) ),
                       group_in_biset_category );
        
    end );
    
    ##
    AddPreCompose( Bisets,
      function ( Bisets, mor_pre, mor_post )
        
        return MorphismConstructor( Bisets,
                       Source( mor_pre ),
                       PreCompose( UnderlyingFunctorOfBiset( mor_pre ),
                               ## TODO: compile the entire next line, Marc did it compilation by hand for transitive bisets
                               ExtendFunctorToSkeletalCategoryOfFiniteLeftGSets( UnderlyingFunctorOfBiset( mor_post ) ) ),
                       Target( mor_post ) );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( Bisets );
    fi;
    
    return Bisets;
    
end ) );

BindGlobal( "BisetCategoryOfFinGroupsWithFunctorsAsMorphisms", BisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms( ) );

##
InstallMethod( BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms,
               [  ],
               
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
  ],
  function ( CAP_NAMED_ARGUMENTS )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          BisetsWithFunctorsAsMorphisms, Bisets,
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
    BisetsWithFunctorsAsMorphisms := BisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms( : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function ( Bisets, group )
        local BisetsWithFunctorsAsMorphisms;
        
        BisetsWithFunctorsAsMorphisms := ModelingCategory( Bisets );
        
        return ObjectConstructor( BisetsWithFunctorsAsMorphisms, group );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function ( Bisets, object_in_category_of_bisets_with_functors_as_morphisms )
        
        return UnderlyingGroup( object_in_category_of_bisets_with_functors_as_morphisms );
        
    end;

    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function ( Bisets, source, pair_of_int_and_list, target )
        local BisetsWithFunctorsAsMorphisms, H, K, KSets, k, P, U, V, non_nul_pos, nnp, mult, p1s, p2s, K2s, K2s_pos, K2s_conj,
              phis, trs, ltrs, k_pos, offsets, multiplicities, biset_as_kset, object_func, morphism_func, B;
        
        BisetsWithFunctorsAsMorphisms := ModelingCategory( Bisets );
        
        H := UnderlyingGroup( source );
        K := UnderlyingGroup( target );
        KSets := UnderlyingSkeletalCategoryOfFiniteLeftGSets( target );
        # can we recover this number more easly than decompile the tower ?
        k := NumberOfObjects( UnderlyingCategory( ModelingCategory( KSets ) ) );
        
        P := DirectProduct( H, K );
        # rmk : pair_of_int_and_list[1] = Length( MarksTom( TableOfMarks ( P ) ) )
        U := List( [ 1 .. pair_of_int_and_list[1] ], i -> RepresentativeTom( TableOfMarks( P ), i ) );
        
        V := RepresentativesOfSubgroupsUpToConjugation( UnderlyingCategory( ModelingCategory( KSets ) ) );
        
        non_nul_pos := PositionsProperty( pair_of_int_and_list[2], i -> i <> 0 );
        nnp := Length( non_nul_pos );
        
        mult := pair_of_int_and_list[2]{ non_nul_pos };
        
        p1s := List( non_nul_pos, i -> RestrictedMapping( Projection( P, 1 ), U[i] ) );
        p2s := List( non_nul_pos, i -> RestrictedMapping( Projection( P, 2 ), U[i] ) );
        #
        K2s := List( [ 1 .. nnp ], i -> ImagesSource( RestrictedMapping( p2s[i], KernelOfMultiplicativeGeneralMapping( p1s[i] ) ) ) );
        K2s_pos := List( [ 1 .. nnp ], i -> PositionProperty( V, v -> IsConjugate( K, v, K2s[i] ) ) );
        K2s_conj := List( [ 1 .. nnp ], i -> RepresentativeAction( K, V[ K2s_pos[i] ], K2s[i] ) );
        #
        phis := List( [ 1 .. nnp ], i -> CompositionMapping( p2s[i], InverseGeneralMapping( p1s[i] ) ) );
        trs := List( [ 1 .. nnp ], i -> RightTransversal( H, ImagesSource(p1s[i]) ) );
        ltrs := List( trs, Length ); 
        
        k_pos := List( [ 1 .. k ], o -> Positions( K2s_pos, o ) );
        
        offsets := List( [ 1 .. k ], o ->
                         Concatenation( [ 0 ],
                                 List( [ 1 .. Length( k_pos[ o ] ) ] , i -> 
                                  Sum( List( k_pos[o]{[ 1 .. i ]}, pos -> ltrs[pos] * mult[pos] ) ) ) ) );
        
        multiplicities := List( [ 1 .. k ], o -> Last( offsets[o] ) );
        
        biset_as_kset := ObjectConstructor( KSets , [ Sum( multiplicities ), multiplicities ] );
        
        object_func :=
          function ( unique_object_in_group_H_as_category )
            
            return biset_as_kset;
            
        end;
        
        morphism_func :=
          function ( source, mor_in_group_H_as_category, target )
            local h, perms, dmors, map, mor;
            
            h := UnderlyingGroupElement( mor_in_group_H_as_category );
            
            #perms := List( trs, t -> List( [ 1 .. Length(t) ], i -> PositionCanonical( t, t[i] * Inverse(h) ) ) );
            perms := List( [ 1 .. nnp ], p ->
                           List( [ 1 .. ltrs[p] ], i -> 
                                 PositionCanonical( trs[p], trs[p][i] * Inverse(h) ) ) );
            
            dmors := List( [ 1 .. nnp ], p ->
                           List( [ 1 .. ltrs[p] ], i ->
                                 K2s_conj[p] *
                                 ImagesRepresentative( phis[p], trs[p][ perms[p][i] ] * h * Inverse( trs[p][i] ) )
                                 * Inverse( K2s_conj[p] ) ) );
            
            map := List( [ 1 .. k ], o -> Pair(
                      ListWithIdenticalEntries( multiplicities[o], o - 1 ),
                           Concatenation( List( [ 1 .. Length( k_pos[o] ) ], j ->
                                   Concatenation( List( [ 1 .. mult[k_pos[o][j]] ], c -> perms[k_pos[o][j]] + (c - 1)*ltrs[k_pos[o][j]] - 1 + offsets[o][j] ) ) ) ) ) );
            
            mor := List( [ 1 .. k ], o -> 
                         Concatenation( List( [ 1 .. Length( k_pos[o] ) ],
                              j -> Concatenation( ListWithIdenticalEntries( mult[ k_pos[o][j] ], dmors[ k_pos[o][j] ] ) ) ) ) );
            
            return MorphismConstructor( KSets, biset_as_kset, Pair( map, mor ), biset_as_kset );
            
        end;
        
        B := CapFunctor( "A functor corresponding to a biset", GroupAsCategory( H ), KSets );
        
        AddObjectFunction( B, object_func );
        AddMorphismFunction( B, morphism_func );
        
        return MorphismConstructor( BisetsWithFunctorsAsMorphisms, source, B, target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function ( Bisets, phi )
        
        Error( "2\n" );
        
    end;
    
    ##
    Bisets :=
      ReinterpretationOfCategory( BisetsWithFunctorsAsMorphisms,
              rec( name := "BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms",
                   category_filter := IsBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms,
                   category_object_filter := IsObjectInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms,
                   category_morphism_filter := IsMorphismInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms,
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

BindGlobal( "BisetCategoryOfFinGroupsUsingFunctorsAsMorphisms", BisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms( ) );

##
InstallMethod( UnderlyingTableOfMarks,
        "for a morphism in the biset category of finite groups",
        [ IsMorphismInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms ],
        
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
        "for a group as an object in the biset category of finite groups with functors as morphisms",
        [ IsObjectInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms ],
        
  function ( group_in_biset_category )
    
    return String( UnderlyingGroup( group_in_biset_category ) );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in the biset category of finite groups with functors as morphisms",
        [ IsMorphismInBisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms ],
        
  function ( biset )
    
    return String( UnderlyingGroup( biset ) );
    
end );

##
InstallMethod( DisplayString,
        "for a group as an object in the biset category of finite groups",
        [ IsObjectInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms ],
        
  function ( group_in_biset_category )
    
    return String( UnderlyingGroup( group_in_biset_category ) );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in the biset category of finite groups",
        [ IsMorphismInBisetCategoryOfFiniteGroupsUsingFunctorsAsMorphisms ],
        
  function ( biset )
    
    return String( PairOfIntAndList( biset ) );
    
end );
