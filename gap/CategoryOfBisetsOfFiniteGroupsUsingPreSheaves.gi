# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

##
InstallMethod( CategoryOfBisetsOfFiniteGroupsUsingPreSheavesUsingFunctors,
        [  ],
        
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
    [ "overhead", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS )
    local name, Bisets;
    
    name := "CategoryOfBisetsOfFiniteGroupsUsingPreSheavesUsingFunctors( )";
    
    Bisets :=
      CreateCapCategoryWithDataTypes( name,
              IsCategoryOfBisetsOfFiniteGroupsUsingPreSheaves,
              IsObjectInCategoryOfBisetsOfFiniteGroupsUsingPreSheaves,
              IsMorphismInCategoryOfBisetsOfFiniteGroupsUsingPreSheaves,
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
      function( Bisets, biset_object )
        
        return UnderlyingGroupAsCategory( biset_object );
        
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
      function ( Bisets, biset_object )
        
        return IsGroupAsCategory( UnderlyingGroupAsCategory( biset_object ) );
        
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
      function ( Bisets, biset_object1, biset_object2 )
        
        return IsIdenticalObj( UnderlyingGroupAsCategory( biset_object1 ), UnderlyingGroupAsCategory( biset_object2 ) );
        
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
      function ( Bisets, biset_object )
        
        return MorphismConstructor( Bisets,
                       biset_object,
                       YonedaEmbeddingOfSourceCategory( UnderlyingPreSheafCategoryOfGroupAsCategory( biset_object ) ),
                       biset_object );
        
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

BindGlobal( "CategoryOfBisetsOfFiniteGroupsUsingPreSheaves", CategoryOfBisetsOfFiniteGroupsUsingPreSheavesUsingFunctors( ) );

##
InstallMethod( UnderlyingPreSheafCategoryOfGroupAsCategory,
        "for a group as an object in the category of bisets of finite groups using functors",
        [ IsObjectInCategoryOfBisetsOfFiniteGroupsUsingPreSheaves ],
        
  function ( biset_object )
    
    return PreSheaves( UnderlyingGroupAsCategory( biset_object ) );
    
end );

##################################
##
## String, View, and Display methods
##
##################################

##
InstallMethod( String,
        "for a group as an object in the category of bisets of finite groups using functors",
        [ IsObjectInCategoryOfBisetsOfFiniteGroupsUsingPreSheaves ],
        
  function ( biset_object )
    
    Error( );
    
end );

##
InstallMethod( String,
        "for a morphism in the category of bisets of finite groups using functors",
        [ IsMorphismInCategoryOfBisetsOfFiniteGroupsUsingPreSheaves ],
        
  function ( biset_morphism )
    
    Error( );
    
end );
