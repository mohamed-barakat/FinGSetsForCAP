# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

InstallGlobalFunction( PositionAndConjugatorOfStabilizer, function ( args... )
    local S, G, ToM, U_i, i, g;
    
    S := CallFuncList( Stabilizer, args );
    
    # Stabilizer has done input type checks
    G := args[1];
    
    ToM := TableOfMarks( G );
    
    for i in [ 1 .. Length( MarksTom( ToM ) ) ] do
        U_i := RepresentativeTom( ToM, i );
        for g in G do
            if ConjugateSubgroup( S, g ) = U_i then
                return [ i, g ];
            fi;
        od;
    od;
    
end );

InstallMethod( DecomposeGroupAsCategoryMorphism,
        [ IsGroupAsCategoryMorphism ],

  function ( h )
    local H_as_category, g, H, list, l, func;
    
    H_as_category := CapCategory( h );
    
    g := Length( SetOfGeneratingMorphismsOfCategory( H_as_category ) );
    
    H := UnderlyingGroup( H_as_category );
    
    list := ExtRepOfObj( Factorization( H, UnderlyingGroupElement( h ) ) );
    
    l := Length( list );
    
    Assert( 0, IsEvenInt( l ) );
    
    l := l / 2;
    
    list := List( [ 1 .. l ], i -> list{[ 2 * i - 1 .. 2 * i ]} );
    
    func :=
      function ( pair )
        if not IsPosInt( pair[2] ) then
            return [ pair[1] + g, -pair[2] ];
        else
            return pair;
        fi;
    end;
    
    list := List( list, func );
    
    return Concatenation( List( list, pair -> ListWithIdenticalEntries( pair[2], pair[1] ) ) );
    
end );
