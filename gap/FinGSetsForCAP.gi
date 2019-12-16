#
# FinGSetsForCAP: FinGSets
#
# Implementations
#

##
InstallMethod( FinGSet,
        "for a group, a CAP finite set, and a function",
        [ IsGroup, IsFiniteSet, IsFunction ],
        
  function( G, M, act )
    local Omega;
    
    Omega := rec( );
    
    ObjectifyObjectForCAPWithAttributes( Omega, FinGSets( G ),
            UnderlyingGroup, G,
            UnderlyingCell, M,
            Length, Length( M ),
            UnderlyingAction, act
            );
    
    Assert( 4, IsWellDefined( Omega ) );
    
    return Omega;
    
end );

##
InstallMethod( FinGSet,
        "for a group, a list, and a function",
        [ IsGroup, IsList, IsFunction ],
        
  function( G, L, act )
    
    return FinGSet( G, FinSet( L ), act );
    
end );

##
InstallMethod( AsList,
        "for a CAP finite G-set",
        [ IsFinGSet ],
        
  function( M )
    
    return AsList( UnderlyingCell( M ) );
    
end );

##
InstallMethod( UnderlyingActionHomomorphism,
        "for a CAP finite G-set",
        [ IsFinGSet ],
        
  function( M )
    
    return ActionHomomorphism( UnderlyingGroup( M ), AsList( M ), UnderlyingAction( M ) );
    
end );

##
InstallMethod( Orbits,
        "for a CAP finite G-set",
        [ IsFinGSet ],
        
  function( M )
    local G, act;
    
    G := UnderlyingGroup( M );
    
    act := UnderlyingAction( M );
    
    return List( Orbits( UnderlyingGroup( M ), AsList( M ), UnderlyingAction( M ) ), O -> FinGSet( G, O, act ) );
    
end );

##
InstallMethod( \in,
        "for an object and a CAP finite G-set",
        [ IsObject, IsFinGSet ],
        
  function( y, M )
    
    return ForAny( AsList( M ), m -> IsEqualForElementsOfFinSets( m, y ) );
    
end );

##
InstallMethod( \[\],
        "for CAP finite G-sets",
        [ IsFinGSet, IsInt ],

  function( M, i )
    
    return AsList( M )[i];
    
end );

##
InstallMethod( Iterator,
        "for CAP finite G-sets",
        [ IsFinGSet ],

  function( M )
    
    return Iterator( AsList( M ) );
    
end );

##
InstallMethod( ListOp,
        "for a CAP finite G-set and a function",
        [ IsFinGSet, IsFunction ],
        
  function( M, f )
    
    return List( AsList( M ), f );
    
end );

##
InstallMethod( FilteredOp,
        "for a CAP finite G-set and a function",
        [ IsFinGSet, IsFunction ],
        
  function( M, f )
    
    return FinGSet( Filtered( AsList( M ), f ) );
    
end );

##
InstallMethod( FirstOp,
        "for a CAP finite G-set and a function",
        [ IsFinGSet, IsFunction ],
        
  function( M, f )
    
    return First( AsList( M ), f );
    
end );

##
InstallMethod( MapOfFinGSets,
        "for two CAP finite G-sets and a map of finite sets",
        [ IsFinGSet, IsFiniteSetMap, IsFinGSet ],
        
  function( S, phi, T )
    local map, G;
    
    map := rec( );
    
    G := UnderlyingGroup( S );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( map, FinGSets( G ),
            S,
            T,
            UnderlyingGroup, G,
            UnderlyingCell, phi
            );
    
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
InstallOtherMethod( UnderlyingCell,
        "for an integer",
        [ IsInt ],
        
  IdFunc );

##
InstallOtherMethod( UnderlyingCell,
        "for a list",
        [ IsList ],
        
  function( L )
    
    return List( L, UnderlyingCell );
    
end );

##
InstallMethod( CallFuncList,
        "for a CAP morphism of finite G-sets and a list",
        [ IsFinGSetMap, IsList ],
        
  function( phi, L )
    local x, y;
    
    x := L[1];
    
    y := First( AsList( phi ), pair -> IsEqualForElementsOfFinSets( pair[1], x ) );
    
    if y = fail then
        if HasIsWellDefined( phi ) then
            if IsWellDefined( phi ) then
                Error( "the element ", x, " is not in the source of the map\n" );
            else
                if not x in Source( phi ) then
                    Error( "the element ", x, " is not in the source of the map\n" );
                else
                    Error( "the element ", x, " is in the source of the map, however, the map is not well-defined\n" );
                fi;
            fi;
        else
            Error( "the element ", x, " may not be in the source of the map, please check if the map is well-defined\n" );
        fi;
    fi;
    
    return y[2];
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for a two CAP finite G-sets",
        [ IsFinGSet, IsFinGSet ],
        
  function ( S, T )
    
    return MapOfFinGSets( S, EmbeddingOfFinSets( UnderlyingCell( S ), UnderlyingCell( T ) ), T );
    
end );

##
InstallMethod( ProjectionOfFinSets,
        "for a two CAP finite G-sets",
        [ IsFinGSet, IsFinGSet ],
        
  function ( S, T )
    
    return MapOfFinGSets( S, ProjectionOfFinSets( UnderlyingCell( S ), UnderlyingCell( T ) ), T );
    
end );

##
InstallMethod( AsList,
        "for a CAP morphism of finite G-sets",
        [ IsFinGSetMap ],
        
  function( phi )
    
    return AsList( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( ListOp,
        "for a CAP finite G-set and a CAP morphism of finite G-sets",
        [ IsFinGSet, IsFinGSetMap ],
        
  function( F, phi )
    
    return List( AsList( F ), phi );
    
end );

##
InstallMethod( FinGSets,
        "for a group",
        [ IsGroup ],
        
  function( G )
    local name, create_func_bool, create_func_morphism, create_func_universal_morphism,
          list_of_operations_to_install, func, pos, properties, FinGSets;
    
    if HasName( G ) then
        name := Concatenation( "Fin-", Name( G ), "-Sets" );
    else
        name := "FinGSets";
    fi;
    
    ## e.g., IsEpimorphism
    create_func_bool :=
      function( name, FinGSets )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            local eval_arg;
            
            eval_arg := UnderlyingCell( arg );
            
            return CallFuncList( oper, eval_arg );
            
        end;
        
    end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name, FinGSets )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            local src_trg, S, T, eval_arg, result;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            eval_arg := List( arg, UnderlyingCell );
            
            result := CallFuncList( oper, eval_arg );
            
            return MapOfFinGSets( S, result, T );
            
          end;
          
      end;
    
    ## e.g., UniversalMorphismIntoDirectProductWithGivenDirectProduct
    create_func_universal_morphism :=
      function( name, FinGSets )
        local info, oper, type;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not info.with_given_without_given_name_pair[2] = name then
            Error( name, " is not the constructor of a universal morphism with a given universal object\n" );
        fi;
        
        oper := ValueGlobal( name );
        
        type := info.io_type;
        
        return
          function( arg )
            local src_trg, S, T, eval_arg, result;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            eval_arg := List( arg, UnderlyingCell );
            
            result := CallFuncList( oper, eval_arg );
            
            return MapOfFinGSets( S, result, T );
            
          end;
          
      end;
    
    ## TODO: remove `Primitively' for performance?
    list_of_operations_to_install := SortedList( ShallowCopy( ListPrimitivelyInstalledOperationsOfCategory( FinSets ) ) );
    
    for func in [
            "IsEqualForObjects",
            "IsEqualForMorphisms",
            "IsEqualForCacheForObjects",
            "IsEqualForCacheForMorphisms",
            "Lift",
            "Colift",
            "IsLiftable",
            "IsColiftable",
            "IsSplitMonomorphism",
            "IsSplitEpimorphism",
            ] do
        
        pos := Position( list_of_operations_to_install, func );
        if not pos = fail then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    properties := ListKnownCategoricalProperties( FinSets );
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( FinSets ) ] );
    
    FinGSets := CategoryConstructor( :
                        name := name,
                        category_object_filter := IsFinGSet,
                        category_morphism_filter := IsFinGSetMap,
                        properties := properties,
                        list_of_operations_to_install := list_of_operations_to_install,
                        create_func_bool := create_func_bool,
                        create_func_morphism := create_func_morphism,
                        create_func_universal_morphism := create_func_universal_morphism
                        );
    
    SetUnderlyingGroup( FinGSets, G );
    
    ##
    AddIsWellDefinedForObjects( FinGSets,
      function( obj )
        
        return IsWellDefinedForObjects( UnderlyingCell( obj ) );
        
    end );
    
    ##
    AddIsEqualForObjects( FinGSets,
      function( obj1, obj2 )
        
        return IsEqualForObjects( UnderlyingCell( obj1 ), UnderlyingCell( obj2 ) ) and
               UnderlyingActionHomomorphism( obj1 ) = UnderlyingActionHomomorphism( obj2 );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( FinGSets,
      function( mor )
        local phi;
        
        phi := UnderlyingCell( mor );
        
        return IsWellDefinedForMorphisms( phi ) and
               IsIdenticalObj( UnderlyingCell( Source( mor ) ), Source( phi ) ) and
               IsIdenticalObj( UnderlyingCell( Range( mor ) ), Range( phi ) );
        ## and test equivariance
        
    end );
    
    ##
    AddIsEqualForMorphisms( FinGSets,
      function( mor1, mor2 )
        
        return IsEqualForMorphisms( UnderlyingCell( mor1 ), UnderlyingCell( mor2 ) );
        
    end );
    
    ##
    AddTerminalObject( FinGSets,
      function( arg )
        
        return FinGSet( G, TerminalObject( FinSets ), {a,g} -> a );
        
    end );
    
    ##
    AddDirectProduct( FinGSets,
      function( L )
        local l, acts, act;
        
        l := Length( L );
        
        acts := List( L, UnderlyingAction );
        
        ## elements of the product are lists
        act := {a,g} -> List( [ 1 .. l ], i -> acts[i]( a[i], g ) );
        
        return FinGSet( G, DirectProduct( List( L, UnderlyingCell ) ), act );
        
    end );
    
    ##
    AddInitialObject( FinGSets,
      function( arg )
        
        return FinGSet( G, InitialObject( FinSets ), {a,g} -> a );
        
    end );
    
    ##
    AddCoproduct( FinGSets,
      function( L )
        local acts, act;
        
        acts := List( L, UnderlyingAction );
        
        ## elements of the coproduct are pairs
        act := {a,g} -> [ a[1], acts[a[1]]( a[2], g ) ];
        
        return FinGSet( G, Coproduct( List( L, UnderlyingCell ) ), act );
        
    end );
    
    ##
    AddEqualizer( FinGSets,
      function( D )
        
        ## the elements of the equalizer are elements of the source
        return FinGSet( G, Equalizer( List( D, UnderlyingCell ) ), UnderlyingAction( Source( D[1] ) ) );
        
    end );
    
    ##
    AddCoequalizer( FinGSets,
      function( D )
        local actT, act;
        
        actT := UnderlyingAction( Range( D[1] ) );
        
        ## elements of the coequalizer are lists of elements of the target
        act := {a,g} -> List( a, i -> actT( i, g ) );
        
        return FinGSet( G, Coequalizer( List( D, UnderlyingCell ) ), act );
        
    end );
    
    ## The cartesian monoidal structure
    
    ##
    AddExponentialOnObjects( FinGSets,
      function( S, T )
        local actS, actT, act;
        
        actS := UnderlyingAction( S );
        actT := UnderlyingAction( T );
        
        act := {mor,g} -> MapOfFinSets( Source( mor ), List( AsList( mor ), st -> [ actS( st[1], g ), actT( st[2], g ) ] ), Range( mor ) );
        
        return FinGSet( G, ExponentialOnObjects( UnderlyingCell( S ), UnderlyingCell( T ) ), act );
        
    end );
    
    ##
    AddCartesianLambdaIntroduction( FinGSets,
      function( map )
        local I;
        
        I := TerminalObject( CapCategory( map ) );
        
        return MapOfFinGSets( I, CartesianLambdaIntroduction( UnderlyingCell( map ) ), ExponentialOnObjects( Source( map ), Range( map ) ) );
        
    end );

    
    ##
    Finalize( FinGSets );
    
    return FinGSets;
    
end );

##
InstallMethod( CartesianSectionsOfEpi,
        "for a CAP morphism of finite G-sets",
        [ IsFinGSetMap ],

  function( pi )
    local S_pi, T_pi, actS, actT, act, sections;
    
    S_pi := Source( pi );
    T_pi := Range( pi );
    
    actS := UnderlyingAction( S_pi );
    actT := UnderlyingAction( T_pi );
    
    S_pi := UnderlyingCell( S_pi );
    T_pi := UnderlyingCell( T_pi );
    
    #act := {mor,g} -> MapOfFinSets( T_pi, List( AsList( mor ), st -> [ actT( st[1], g ), actS( st[2], g ) ] ), S_pi );
    
    act := {mor,g} -> Set( List( mor, st -> [ actT( st[1], g ), actS( st[2], g ) ] ) );
    
    sections := CartesianSectionsOfEpi( UnderlyingCell( pi ) );
    
    return FinGSet( UnderlyingGroup( pi ), AsList( sections ), act );
    
end );

##
InstallMethod( Display,
        "for a CAP finite G-set",
        [ IsFinGSet ],
        
  function( S )
    Print( AsList( S ), "\n" );
end );

##
InstallMethod( Display,
        "for a CAP morphism of finite G-sets",
        [ IsFinGSetMap ],
        
  function( phi )
    Print( [ AsList( Source( phi ) ), AsList( phi ), AsList( Range( phi ) ) ], "\n" );
end );
