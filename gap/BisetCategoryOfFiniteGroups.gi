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
      function ( Bisets, source, functor, target )
        
        return CreateCapCategoryMorphismWithAttributes( Bisets,
                       source,
                       target,
                       UnderlyingActionPair, functor );
        
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
        
        Error( "1\n" );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function ( Bisets, phi )
        
        Error( "2\n" );
        
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