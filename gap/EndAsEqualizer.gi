# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

InstallGlobalFunction( EndAsEqualizer, function ( C, HomC, ForgetfulFunctor, IndexSet )
    local IntToMorphism, MorphismToInt, PseudoMorphismToInt, HomFinSetsSkeletal, GetRhoComponent, GetLambdaComponent, SourceComponents, S, Projections, TargetComponents, T, RhoComponents, Rho, LambdaComponents, Lambda, iota, EndSkeletal, End;

    IntToMorphism := function ( S, int, T )
        local s, t, L, i, phi;
        s := Length( S );
        t := Length( T );
        L := ListWithIdenticalEntries( s, 0 );
        i := 1;
        while int <> 0 do
            L[ i ] := ( int mod t );
            int := QuoInt( int, t );
            i := i + 1;
        od;
        phi := MapOfFinSets( S, L, T );

        return phi;
    end;

    MorphismToInt := function ( phi )
        local S, T, s, t, imgs, int, i;
        
        S := Source( phi );
        T := Range( phi );
        s := Length( S );
        t := Length( T );
        imgs := AsList( phi );

        return PseudoMorphismToInt( s, imgs, t );
    end;

    PseudoMorphismToInt := function ( s, imgs, t )
        local int, i;
        
        int := 0;
        for i in [ 0 .. ( s - 1 ) ] do
            int := int + imgs[ i + 1 ] * t^i;
        od;

        return int;
    end;
    
    HomFinSetsSkeletal := function ( S, T )
        local M, N;
        
        M := Length( S );
        N := Length( T );
        
        return FinSet( N ^ M );
    end;

    GetRhoComponent := function ( IndexSet, Projections, c_1, c_2 )
        local C_1, C_2, Set_C_1, Set_C_2, HomSets_C_1_C_2, HomC_C_1_C_2, HomC_C_1_C_2_as_maps, S_C_1, T_C_1_C_2, graph, pi, rhoComponent;
        
        C_1 := IndexSet[c_1];
        C_2 := IndexSet[c_2];

        Set_C_1 := ApplyFunctor( ForgetfulFunctor, C_1 );
        Set_C_2 := ApplyFunctor( ForgetfulFunctor, C_2 );
        HomSets_C_1_C_2 := HomFinSetsSkeletal( Set_C_1, Set_C_2 );
        HomC_C_1_C_2 := HomC( C_1, C_2 );
        HomC_C_1_C_2_as_maps := List( HomC( C_1, C_2 ), phi -> ApplyFunctor( ForgetfulFunctor, phi ) );
        
        S_C_1 := HomFinSetsSkeletal( Set_C_1, Set_C_1 );
        T_C_1_C_2 := HomFinSetsSkeletal( HomC_C_1_C_2, HomSets_C_1_C_2 );

        graph := List( AsList( S_C_1 ), function ( x )
            local f;

            f := IntToMorphism( Set_C_1, x, Set_C_1 );
            
            return PseudoMorphismToInt(
                Length( HomC_C_1_C_2 ),
                
                List( HomC_C_1_C_2_as_maps, phi -> MorphismToInt( PreCompose( f, phi ) ) ),
                
                Length( HomSets_C_1_C_2 )
            );
        end );
        
        pi := Projections[c_1];
        rhoComponent := PreCompose( pi, MapOfFinSets( S_C_1, graph, T_C_1_C_2 ) );

        return rhoComponent;
    end;
    
    GetLambdaComponent := function ( IndexSet, Projections, c_1, c_2 )
        local C_1, C_2, Set_C_1, Set_C_2, HomSets_C_1_C_2, HomC_C_1_C_2, HomC_C_1_C_2_as_maps, S_C_2, T_C_1_C_2, graph, pi, lambdaComponent;
        
        C_1 := IndexSet[c_1];
        C_2 := IndexSet[c_2];

        Set_C_1 := ApplyFunctor( ForgetfulFunctor, C_1 );
        Set_C_2 := ApplyFunctor( ForgetfulFunctor, C_2 );
        HomSets_C_1_C_2 := HomFinSetsSkeletal( Set_C_1, Set_C_2 );
        HomC_C_1_C_2 := HomC( C_1, C_2 );
        HomC_C_1_C_2_as_maps := List( HomC( C_1, C_2 ), phi -> ApplyFunctor( ForgetfulFunctor, phi ) );
        
        S_C_2 := HomFinSetsSkeletal( Set_C_2, Set_C_2 );
        T_C_1_C_2 := HomFinSetsSkeletal( HomC_C_1_C_2, HomSets_C_1_C_2 );

        graph := List( AsList( S_C_2 ), function ( x )
            local f;

            f := IntToMorphism( Set_C_2, x, Set_C_2 );
            
            return PseudoMorphismToInt(
                Length( HomC_C_1_C_2 ),
                
                List( HomC_C_1_C_2_as_maps, phi -> MorphismToInt( PreCompose( phi, f ) ) ),
                
                Length( HomSets_C_1_C_2 )
            );
        end );
        
        pi := Projections[c_2];
        lambdaComponent := PreCompose( pi, MapOfFinSets( S_C_2, graph, T_C_1_C_2 ) );

        return lambdaComponent;
    end;

    SourceComponents := List( IndexSet, C -> HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, C ), ApplyFunctor( ForgetfulFunctor, C ) ) );
    S := DirectProduct( SourceComponents );
    Projections := List( [ 1 .. Length( IndexSet ) ], i -> ProjectionInFactorOfDirectProduct( SourceComponents, i ) );

    TargetComponents := Concatenation( List( IndexSet, C_1 -> List( IndexSet, C_2 -> HomFinSetsSkeletal( HomC( C_1, C_2 ), HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, C_1 ), ApplyFunctor( ForgetfulFunctor, C_2 ) ) ) ) ) );
    T := DirectProduct( TargetComponents );

    RhoComponents := Concatenation( List( [ 1 .. Size( IndexSet ) ], c_1 -> List( [ 1 .. Size( IndexSet ) ], c_2 -> GetRhoComponent( IndexSet, Projections, c_1, c_2 ) ) ) );
    Rho := UniversalMorphismIntoDirectProduct( RhoComponents );

    LambdaComponents := Concatenation( List( [ 1 .. Size( IndexSet ) ], c_1 -> List( [ 1 .. Size( IndexSet ) ], c_2 -> GetLambdaComponent( IndexSet, Projections, c_1, c_2 ) ) ) );
    Lambda := UniversalMorphismIntoDirectProduct( LambdaComponents );

    iota := EmbeddingOfEqualizer( S, [ Rho, Lambda ] );
    EndSkeletal := Source( iota );
    
    # each element x in EndSkeletal corresponds to a tuple of integers by taking all projections of the image of x under the embedding iota
    # these integers in turn correspond to morphisms by applying IntToMorphism
    End := List( EndSkeletal, x -> List( [ 1 .. Length( Projections ) ], function ( j )
        local Set_C_j;
        
        Set_C_j := ApplyFunctor( ForgetfulFunctor, IndexSet[j] );
        
        return IntToMorphism(
            Set_C_j,
            
            Projections[j]( iota( x ) ),
            
            Set_C_j
        );
    end ) );

    return End;
end );
