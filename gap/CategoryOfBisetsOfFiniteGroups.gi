# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

InstallMethod( CategoryOfBisetsOfFiniteGroups,
        [  ],
        
 FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
    [ "overhead", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS )
    local name, Bisets;
    
    name := "CategoryOfBisetsOfFiniteGroups";
    
    Bisets :=
      CreateCapCategoryWithDataTypes( name,
              IsCategoryOfBisetsOfFiniteGroups,
              IsObjectInCategoryOfBisetsOfFiniteGroups,
              IsMorphismInCategoryOfBisetsOfFiniteGroups,
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
        local GSets_comp, GSets;

        GSets_comp := SkeletalCategoryOfFinGSetsWithFabianDataStructure( G );
        GSets := SkeletalCategoryOfFinGSets( G );
        
        return CreateCapCategoryObjectWithAttributes( Bisets,
                       UnderlyingGroup, G,
                       UnderlyingSkeletalCategoryOfFinGSets, GSets );
        
    end );
    
    ##
    AddObjectDatum( Bisets,
      function( Bisets, biset_object )
        
        return UnderlyingGroup( biset_object );
        
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
        
        return IsGroup( UnderlyingGroup( biset_object ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( Bisets,
      function ( Bisets, phi )
        local functor;
        
        functor := UnderlyingFunctorOfBisetMorphism( phi );
        
        return IsIdenticalObj( UnderlyingGroup( Source( phi ) ), UnderlyingGroup(SourceOfFunctor( functor ) )) and
               IsIdenticalObj( UnderlyingSkeletalCategoryOfFinGSets( Target( phi ) ), UnderlyingGroup(RangeOfFunctor( functor ) ) );
        
    end );
    
    ##
    AddIsEqualForObjects( Bisets,
      function ( Bisets, biset_object1, biset_object2 )
        
        return IsIdenticalObj( UnderlyingGroup( biset_object1 ), UnderlyingGroup( biset_object2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( Bisets,
      function ( Bisets, phi, psi )
        
        return IsIdenticalObj( UnderlyingFunctorOfBisetMorphism( phi ), UnderlyingFunctorOfBisetMorphism( psi ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( Bisets,
      function ( Bisets, phi, psi )
        
        Error("Not yet implemented");
        
    end );
    
    ##
    AddIdentityMorphism( Bisets,
      function ( Bisets, biset_object )
        
        return MorphismConstructor( Bisets,
                       biset_object,
                       EmbeddingOfUnderlyingGroupAsCategory( UnderlyingSkeletalCategoryOfFinGSets( biset_object ) ),
                       biset_object );
        
    end );
    
    ##
    AddPreCompose( Bisets,
      function ( Bisets, mor_pre, mor_post )
        
        return MorphismConstructor( Bisets,
                       Source( mor_pre ),
                       PreCompose( UnderlyingFunctorOfBisetMorphism( mor_pre ),
                                   ExtendFunctorToSkeletalCategoryOfFinGSets( UnderlyingFunctorOfBisetMorphism( mor_post ) ) ),
                       Target( mor_post ) );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( Bisets );
    fi;
    
    return Bisets;
    
end ) );

BindGlobal( "CategoryOfBisetsOfFinGroups", CategoryOfBisetsOfFiniteGroups( ) );


##################################
##
## String, View, and Display methods
##
##################################

##
InstallMethod( String,
        "for a group as an object in the category of bisets of finite groups using functors",
        [ IsObjectInCategoryOfBisetsOfFiniteGroups ],
        
  function ( biset_object )
    
    Error( );
    
end );

##
InstallMethod( String,
        "for a morphism in the category of bisets of finite groups using functors",
        [ IsMorphismInCategoryOfBisetsOfFiniteGroups ],
        
  function ( biset_morphism )
    
    Error( );
    
end );
