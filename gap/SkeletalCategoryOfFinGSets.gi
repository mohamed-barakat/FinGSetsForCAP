# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( SkeletalCategoryOfFinGSets,
        "for a group",
        [ IsGroup ],
        
  function ( G )
    local TG, SkeletalFinGSets;
    
    ## building the categorical tower:
    TG := SkeletalTransitiveGSets( G );
    
    SkeletalFinGSets := FiniteStrictCoproductCompletion( TG );

    ## temporary code
    SetUnderlyingGroup( SkeletalFinGSets, TG );
    
    SetFilterObj( SkeletalFinGSets, IsSkeletalCategoryOfFinGSetCategory );
    
    SetUnderlyingGroupAsCategory( SkeletalFinGSets, GroupAsCategory( G ) );
    
    return SkeletalFinGSets;
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingGroupAsCategoryData,
        "for a skeletal category of finite G-sets",
        [ IsSkeletalCategoryOfFinGSetCategory ],
        
  function( SkeletalFinGSets )
    local G, embedding_on_objects, embedding_on_morphisms;
    
    TG := UnderlyingCategory( SkeletalFinGSets );
    
    G := UnderlyingGroupAsCategory( SkeletalFinGSets );
    
    embedding_on_objects :=
      function( objG )
        
        return EmbeddingOfUnderlyingCategoryData( SkeletalFinGSets )[2][1]( EmbeddingOfUnderlyingGroupAsCategoryData( TG )[2][1]( objG ) );
        
    end;
    
    embedding_on_morphisms :=
      function( source, morG, target )
        
        return MorphismConstructor( SkeletalFinGSets,
                       embedding_on_objects( Source( morG ) ),
                       Pair( [ 0 ], [ EmbeddingOfUnderlyingGroupAsCategoryData( TG )[2][2]( morG ) ] ),
                       embedding_on_objects( Target( morG ) ) );
        
    end;
    
    return Triple( G,
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   SkeletalFinGSets );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingGroupAsCategory,
        "for a skeletal category of finite G-sets",
        [ IsSkeletalCategoryOfFinGSetCategory ],
        
  function( SkeletalFinGSets )
    local data, Y;
    
    data := EmbeddingOfUnderlyingGroupAsCategoryData( SkeletalFinGSets );
    
    Y := CapFunctor( "Embedding functor into the skeletal category of finite G-sets", data[1], SkeletalFinGSets );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );
