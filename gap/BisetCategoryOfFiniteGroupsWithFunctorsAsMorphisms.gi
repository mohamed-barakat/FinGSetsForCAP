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
