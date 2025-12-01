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
      function ( Bisets, source, pair_of_int_list, target )
        local BisetsWithFunctorsAsMorphisms;
        
        BisetsWithFunctorsAsMorphisms := ModelingCategory( Bisets );
        
        Error( "1\n" );
        
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
