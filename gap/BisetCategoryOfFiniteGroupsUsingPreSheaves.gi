# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

##
InstallMethod( BisetCategoryOfFiniteGroupsUsingPreSheaves,
        [  ],
        
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
    [ "overhead", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS )
    local name, Bisets;
    
    name := "BisetCategoryOfFiniteGroupsUsingPreSheaves";
    
    Bisets :=
      CreateCapCategoryWithDataTypes( name,
              IsBisetCategoryOfFiniteGroupsUsingPreSheaves,
              IsObjectInBisetCategoryOfFiniteGroupsUsingPreSheaves,
              IsMorphismInBisetCategoryOfFiniteGroupsUsingPreSheaves,
              IsCapCategoryTwoCell,
              fail,
              fail,
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
        
        return CreateCapCategoryObjectWithAttributes( Bisets,
                       UnderlyingGroupAsCategory, G );
        
    end );
    
    ##
    AddObjectDatum( Bisets,
      function( Bisets, group_in_biset_category )
        
        return UnderlyingGroupAsCategory( group_in_biset_category );
        
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
        
        return IsGroupAsCategory( UnderlyingGroupAsCategory( group_in_biset_category ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( Bisets,
      function ( Bisets, phi )
        local functor;
        
        functor := UnderlyingFunctorOfBisetMorphism( phi );
        
        return IsIdenticalObj( UnderlyingGroupAsCategory( Source( phi ) ), SourceOfFunctor( functor ) ) and
               IsIdenticalObj( UnderlyingPreSheafCategoryOfGroupAsCategory( Target( phi ) ), RangeOfFunctor( functor ) );
        
    end );
    
    ##
    AddIsEqualForObjects( Bisets,
      function ( Bisets, group_in_biset_category1, group_in_biset_category2 )
        
        return IsIdenticalObj( UnderlyingGroupAsCategory( group_in_biset_category1 ), UnderlyingGroupAsCategory( group_in_biset_category2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( Bisets,
      function ( Bisets, phi, psi )
        
        return IsIdenticalObj( UnderlyingFunctorOfBisetMorphism( phi ), UnderlyingFunctorOfBisetMorphism( psi ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( Bisets,
      function ( Bisets, phi, psi )
        
        Error( );
        
    end );
    
    ##
    AddIdentityMorphism( Bisets,
      function ( Bisets, group_in_biset_category )
        
        return MorphismConstructor( Bisets,
                       group_in_biset_category,
                       YonedaEmbeddingOfSourceCategory( UnderlyingPreSheafCategoryOfGroupAsCategory( group_in_biset_category ) ),
                       group_in_biset_category );
        
    end );
    
    ##
    AddPreCompose( Bisets,
      function ( Bisets, mor_pre, mor_post )
        
        return MorphismConstructor( Bisets,
                       Source( mor_pre ),
                       PreCompose( UnderlyingFunctorOfBisetMorphism( mor_pre ),
                               ExtendFunctorToCategoryOfPreSheaves( UnderlyingFunctorOfBisetMorphism( mor_post ) ) ),
                       Target( mor_post ) );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( Bisets );
    fi;
    
    return Bisets;
    
end ) );

BindGlobal( "BisetCategoryOfFinGroupsUsingPreSheaves", BisetCategoryOfFiniteGroupsUsingPreSheaves( ) );

##
InstallMethod( UnderlyingPreSheafCategoryOfGroupAsCategory,
        "for a group as an object in the biset category of finite groups using functors",
        [ IsObjectInBisetCategoryOfFiniteGroupsUsingPreSheaves ],
        
  function ( group_in_biset_category )
    
    return PreSheaves( UnderlyingGroupAsCategory( group_in_biset_category ) );
    
end );

##################################
##
## String, View, and Display methods
##
##################################

##
InstallMethod( DisplayString,
        "for a group as an object in the biset category of finite groups using functors",
        [ IsObjectInBisetCategoryOfFiniteGroupsUsingPreSheaves ],
        
  function ( group_in_biset_category )
    
    return Name( UnderlyingGroupAsCategory( group_in_biset_category ) );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in the biset category of finite groups using functors",
        [ IsMorphismInBisetCategoryOfFiniteGroupsUsingPreSheaves ],
        
  function ( biset )
    
    Error( );
    
end );
