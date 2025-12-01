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
      function( Bisets, G )
        local GSets;
        
        GSets := SkeletalCategoryOfFinGSets( G );
        
        return CreateCapCategoryObjectWithAttributes( Bisets,
                       UnderlyingGroup, G,
                       UnderlyingSkeletalCategoryOfFinGSets, GSets );
        
    end );
    
    ##
    AddObjectDatum( Bisets,
      function( Bisets, group_in_biset_category )
        
        return UnderlyingGroup( group_in_biset_category );
        
    end );
    
    ##
    AddMorphismConstructor( Bisets,
      function( Bisets, source, functor, target )
        
        return CreateCapCategoryMorphismWithAttributes( Bisets,
                       source,
                       target,
                       UnderlyingFunctorOfBisetMorphism, functor );
        
    end );
    
    ##
    AddMorphismDatum( Bisets,
      function( Bisets, phi )
        
        return UnderlyingFunctorOfBisetMorphism( phi );
        
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
        
        functor := UnderlyingFunctorOfBisetMorphism( phi );
        
        return IsIdenticalObj( UnderlyingGroup( Source( phi ) ), UnderlyingGroup( SourceOfFunctor( functor ) ) ) and
               IsIdenticalObj( UnderlyingSkeletalCategoryOfFinGSets( Target( phi ) ), RangeOfFunctor( functor ) );
        
    end );
    
    ##
    AddIsEqualForObjects( Bisets,
      function ( Bisets, group_in_biset_category1, group_in_biset_category2 )
        
        return IsIdenticalObj( UnderlyingGroup( group_in_biset_category1 ), UnderlyingGroup( group_in_biset_category2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( Bisets,
      function ( Bisets, phi, psi )
        
        return IsIdenticalObj( UnderlyingFunctorOfBisetMorphism( phi ), UnderlyingFunctorOfBisetMorphism( psi ) );
        
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
                       EmbeddingOfUnderlyingGroupAsCategory( UnderlyingSkeletalCategoryOfFinGSets( group_in_biset_category ) ),
                       group_in_biset_category );
        
    end );
    
    ##
    AddPreCompose( Bisets,
      function ( Bisets, mor_pre, mor_post )
        
        return MorphismConstructor( Bisets,
                       Source( mor_pre ),
                       PreCompose( UnderlyingFunctorOfBisetMorphism( mor_pre ),
                               ## TODO: compile the entire next line, Marc did it compilation by hand for transitive bisets
                               ExtendFunctorToSkeletalCategoryOfFinGSets( UnderlyingFunctorOfBisetMorphism( mor_post ) ) ),
                       Target( mor_post ) );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( Bisets );
    fi;
    
    return Bisets;
    
end ) );

BindGlobal( "BisetCategoryOfFinGroupsWithFunctorsAsMorphisms", BisetCategoryOfFiniteGroupsWithFunctorsAsMorphisms( ) );

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
          BisetsWithFunctorsAsMorphisms, Bisets,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          name, SkeletalFinGSetsWithFabianDataStructure;
    
    ##
    object_datum_type := IsGroup;
    
    ##
    object_constructor :=
      function( Bisets, G )
        local GSets;
        
        GSets := SkeletalCategoryOfFinGSets( G );
        
        return CreateCapCategoryObjectWithAttributes( Bisets,
                       UnderlyingGroup, G,
                       UnderlyingSkeletalCategoryOfFinGSets, GSets );
        
    end;
    
    ##
    object_datum :=
      function( Bisets, group_in_biset_category )
        
        return UnderlyingGroup( group_in_biset_category );
        
    end;
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              IsBigInt,
              CapJitDataTypeOfListOf( IsBigInt ) );
    
    ##
    morphism_constructor :=
      function ( Bisets, source, pair_of_int_list, target )
        
        return CreateCapCategoryMorphismWithAttributes( Bisets,
                       source,
                       target,
                       PairOfIntAndList, pair_of_int_list );
        
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
      function( Bisets, group )
        local BisetsWithFunctorsAsMorphisms;
        
        BisetsWithFunctorsAsMorphisms := ModelingCategory( Bisets );
        
        return ObjectConstructor( BisetsWithFunctorsAsMorphisms, group );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( Bisets, object_in_category_of_bisets_with_functors_as_morphisms )
        
        return UnderlyingGroup( object_in_category_of_bisets_with_functors_as_morphisms );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( Bisets, source, pair_of_int_list, target )
        local BisetsWithFunctorsAsMorphisms;
        
        BisetsWithFunctorsAsMorphisms := ModelingCategory( Bisets );
        
        Error( "1\n" );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( Bisets, phi )
        
        Error( "2\n" );
        
    end;
    
    ##
    Bisets :=
      ReinterpretationOfCategory( BisetsWithFunctorsAsMorphisms,
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
      function( Bisets, biset )
        local pair, tom, l;
        
        pair := PairOfIntAndList( biset );
        
        tom := UnderlyingTableOfMarks( biset );
        
        l := Length( MarksTom( tom ) );
        
        return l = pair[1] and
               pair[1] = Length( pair[2] ) and
               ForAll( pair[2], a -> a >= 0 );
        
    end );
    
    AddIsCongruentForMorphisms( Bisets,
      function( Bisets, biset1, biset2 )
        
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
