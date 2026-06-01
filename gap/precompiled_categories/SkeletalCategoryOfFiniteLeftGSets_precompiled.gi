# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_SkeletalCategoryOfFiniteLeftGSets_precompiled", function ( cat )
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := PairOfLists( beta_1 );
    deduped_10_1 := PairOfLists( alpha_1 );
    deduped_9_1 := Source( alpha_1 );
    deduped_8_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    hoisted_6_1 := deduped_11_1[2];
    hoisted_5_1 := PairOfSumAndListOfMultiplicities( Source( beta_1 ) )[2];
    hoisted_7_1 := List( deduped_8_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_6_1[o_2];
            return List( [ 1 .. hoisted_5_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    hoisted_4_1 := deduped_10_1[2];
    deduped_3_1 := deduped_11_1[1];
    deduped_2_1 := deduped_10_1[1];
    deduped_1_1 := PairOfSumAndListOfMultiplicities( deduped_9_1 )[2];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_9_1, Range( beta_1 ), PairOfLists, NTuple( 2, List( deduped_8_1, function ( o_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
                deduped_4_2 := deduped_2_1[o_2];
                deduped_3_2 := [ 1 .. deduped_1_1[o_2] ];
                deduped_2_2 := deduped_4_2[2];
                deduped_1_2 := deduped_4_2[1];
                return NTuple( 2, List( deduped_3_2, function ( i_3 )
                          return deduped_3_1[1 + deduped_1_2[i_3]][1][1 + deduped_2_2[i_3]];
                      end ), List( deduped_3_2, function ( i_3 )
                          return deduped_3_1[1 + deduped_1_2[i_3]][2][1 + deduped_2_2[i_3]];
                      end ) );
            end ), List( deduped_8_1, function ( o_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                deduped_6_2 := CAP_JIT_INCOMPLETE_LOGIC( o_2 );
                deduped_5_2 := deduped_2_1[deduped_6_2];
                hoisted_3_2 := deduped_5_2[2];
                hoisted_2_2 := deduped_5_2[1];
                hoisted_1_2 := hoisted_4_1[deduped_6_2];
                hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_1_1[deduped_6_2] ], function ( i_3 )
                          return MultiplyGroupElements( CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_2[CAP_JIT_INCOMPLETE_LOGIC( i_3 )] ), hoisted_7_1[1 + hoisted_2_2[i_3]][1 + hoisted_3_2[i_3]] );
                      end ) );
                return List( [ 1 .. deduped_1_1[o_2] ], function ( i_3 )
                        return hoisted_4_2[i_3];
                    end );
            end ) ) );
end
########
        
    , 200 );
    
    ##
    cat!.cached_precompiled_functions.PreCompose :=
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1;
    deduped_13_1 := PairOfLists( beta_1 );
    deduped_12_1 := PairOfLists( alpha_1 );
    deduped_11_1 := Source( alpha_1 );
    deduped_10_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    hoisted_7_1 := deduped_13_1[2];
    hoisted_6_1 := PairOfSumAndListOfMultiplicities( Source( beta_1 ) )[2];
    hoisted_8_1 := List( deduped_10_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_7_1[o_2];
            return List( [ 1 .. hoisted_6_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    hoisted_4_1 := deduped_12_1[2];
    deduped_1_1 := PairOfSumAndListOfMultiplicities( deduped_11_1 )[2];
    hoisted_5_1 := List( deduped_10_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_4_1[o_2];
            return List( [ 1 .. deduped_1_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    deduped_2_1 := deduped_12_1[1];
    hoisted_9_1 := List( deduped_10_1, function ( o_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := deduped_2_1[o_2];
            hoisted_3_2 := deduped_4_2[2];
            hoisted_2_2 := deduped_4_2[1];
            hoisted_1_2 := hoisted_5_1[o_2];
            return List( [ 1 .. deduped_1_1[o_2] ], function ( i_3 )
                    return MultiplyGroupElements( hoisted_1_2[i_3], hoisted_8_1[1 + hoisted_2_2[i_3]][1 + hoisted_3_2[i_3]] );
                end );
        end );
    deduped_3_1 := deduped_13_1[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_11_1, Range( beta_1 ), PairOfLists, NTuple( 2, List( deduped_10_1, function ( o_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
                deduped_4_2 := deduped_2_1[o_2];
                deduped_3_2 := [ 1 .. deduped_1_1[o_2] ];
                deduped_2_2 := deduped_4_2[2];
                deduped_1_2 := deduped_4_2[1];
                return NTuple( 2, List( deduped_3_2, function ( i_3 )
                          return deduped_3_1[1 + deduped_1_2[i_3]][1][1 + deduped_2_2[i_3]];
                      end ), List( deduped_3_2, function ( i_3 )
                          return deduped_3_1[1 + deduped_1_2[i_3]][2][1 + deduped_2_2[i_3]];
                      end ) );
            end ), List( deduped_10_1, function ( o_2 )
                local hoisted_1_2;
                hoisted_1_2 := hoisted_9_1[o_2];
                return List( [ 1 .. deduped_1_1[o_2] ], function ( i_3 )
                        return hoisted_1_2[i_3];
                    end );
            end ) ) );
end
########
        
    ;
    
    ##
    AddProjectionOntoCoequalizerOfIdentityAndAutomorphisms( cat,
        
########
function ( cat_1, Y_1, automorphisms_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_21_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1;
    deduped_28_1 := UnderlyingGroup( cat_1 );
    deduped_27_1 := RepresentativesOfSubgroupsUpToConjugation( cat_1 );
    deduped_26_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    deduped_15_1 := OneImmutable( deduped_28_1 );
    deduped_10_1 := UnderlyingCategory( ModelingCategory( cat_1 ) );
    deduped_11_1 := List( deduped_26_1, function ( i_2 )
            return CreateCapCategoryObjectWithAttributes( deduped_10_1, ObjectNumber, i_2 );
        end );
    deduped_16_1 := List( deduped_26_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_11_1[c_2];
            return CreateCapCategoryMorphismWithAttributes( deduped_10_1, deduped_1_2, deduped_1_2, UnderlyingGroupElement, deduped_15_1 );
        end );
    deduped_14_1 := List( deduped_26_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            return List( automorphisms_1, function ( x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := PairOfLists( x_3 )[2][deduped_1_2];
                    return CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. PairOfSumAndListOfMultiplicities( Source( x_3 ) )[2][deduped_1_2] ], function ( i_4 )
                              return hoisted_1_3[i_4];
                          end ) );
                end );
        end );
    deduped_13_1 := List( deduped_26_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            return List( automorphisms_1, function ( x_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3;
                    deduped_5_3 := PairOfLists( x_3 )[1][deduped_1_2];
                    hoisted_4_3 := deduped_5_3[2];
                    hoisted_1_3 := PairOfSumAndListOfMultiplicities( Range( x_3 ) )[2];
                    hoisted_3_3 := List( deduped_26_1, function ( o_4 )
                            return ListWithIdenticalEntries( hoisted_1_3[o_4], deduped_11_1[o_4] );
                        end );
                    hoisted_2_3 := deduped_5_3[1];
                    return CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. PairOfSumAndListOfMultiplicities( Source( x_3 ) )[2][deduped_1_2] ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[i_4]][1 + hoisted_4_3[i_4]];
                          end ) );
                end );
        end );
    deduped_7_1 := Length( automorphisms_1 );
    deduped_2_1 := PairOfSumAndListOfMultiplicities( Y_1 )[2];
    deduped_1_1 := List( deduped_26_1, function ( c_2 )
            return List( automorphisms_1, function ( x_3 )
                    return PermList( List( PairOfLists( x_3 )[1][c_2][2], function ( i_4 )
                              return 1 + i_4;
                          end ) );
                end );
        end );
    deduped_3_1 := List( deduped_26_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Length( OrbitsPerms( deduped_1_1[deduped_1_2], [ 1 .. deduped_2_1[deduped_1_2] ] ) ) );
        end );
    deduped_6_1 := List( deduped_26_1, function ( c_2 )
            local hoisted_1_2, deduped_2_2;
            deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( OrbitsPerms( deduped_1_1[deduped_2_2], [ 1 .. deduped_2_1[deduped_2_2] ] ), Length ) );
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    return hoisted_1_2[o_3];
                end );
        end );
    deduped_9_1 := List( deduped_26_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_3_2 := deduped_1_1[c_2];
            hoisted_2_2 := deduped_6_1[c_2];
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( OrbitsPerms( deduped_1_1[deduped_4_2], [ 1 .. deduped_2_1[deduped_4_2] ] ) );
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    return SchreierSimsOnASingleOrbit( hoisted_3_2, deduped_7_1, hoisted_1_2[o_3][1], hoisted_2_2[o_3] );
                end );
        end );
    deduped_17_1 := List( deduped_26_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
            deduped_7_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_5_2 := [ deduped_16_1[deduped_7_2] ];
            hoisted_4_2 := deduped_14_1[deduped_7_2];
            hoisted_3_2 := deduped_13_1[deduped_7_2];
            hoisted_2_2 := deduped_9_1[deduped_7_2];
            hoisted_6_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_3_1[deduped_7_2] ], function ( o_3 )
                      return List( Iterated( hoisted_2_2[o_3][2], function ( eval_4, pair_4 )
                                local deduped_1_4, deduped_2_4, deduped_3_4;
                                deduped_3_4 := pair_4[2];
                                deduped_2_4 := pair_4[1];
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( eval_4[deduped_2_4] );
                                return Concatenation( eval_4, [ CreateCapCategoryMorphismWithAttributes( deduped_10_1, CAP_JIT_INCOMPLETE_LOGIC( Source( deduped_1_4 ) ), hoisted_3_2[deduped_3_4][deduped_2_4], UnderlyingGroupElement, MultiplyGroupElements( CAP_JIT_INCOMPLETE_LOGIC( UnderlyingGroupElement( deduped_1_4 ) ), hoisted_4_2[deduped_3_4][deduped_2_4] ) ) ] );
                            end, hoisted_5_2 ), function ( logic_new_func_x_4 )
                              return InverseImmutable( UnderlyingGroupElement( logic_new_func_x_4 ) );
                          end );
                  end ) );
            hoisted_1_2 := deduped_6_1[c_2];
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_6_2[o_3];
                    return List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                            return MultiplyGroupElements( deduped_15_1, hoisted_1_3[i_4] );
                        end );
                end );
        end );
    deduped_18_1 := List( deduped_26_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2;
            deduped_10_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_9_2 := deduped_17_1[c_2];
            hoisted_8_2 := deduped_14_1[c_2];
            hoisted_7_2 := deduped_9_1[c_2];
            hoisted_5_2 := [ deduped_16_1[deduped_10_2] ];
            hoisted_4_2 := deduped_14_1[deduped_10_2];
            hoisted_3_2 := deduped_13_1[deduped_10_2];
            hoisted_2_2 := deduped_9_1[deduped_10_2];
            hoisted_6_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_3_1[deduped_10_2] ], function ( o_3 )
                      return List( Iterated( hoisted_2_2[o_3][2], function ( eval_4, pair_4 )
                                local deduped_1_4, deduped_2_4, deduped_3_4;
                                deduped_3_4 := pair_4[2];
                                deduped_2_4 := pair_4[1];
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( eval_4[deduped_2_4] );
                                return Concatenation( eval_4, [ CreateCapCategoryMorphismWithAttributes( deduped_10_1, CAP_JIT_INCOMPLETE_LOGIC( Source( deduped_1_4 ) ), hoisted_3_2[deduped_3_4][deduped_2_4], UnderlyingGroupElement, MultiplyGroupElements( CAP_JIT_INCOMPLETE_LOGIC( UnderlyingGroupElement( deduped_1_4 ) ), hoisted_4_2[deduped_3_4][deduped_2_4] ) ) ] );
                            end, hoisted_5_2 ), UnderlyingGroupElement );
                  end ) );
            hoisted_1_2 := deduped_6_1[c_2];
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3;
                    deduped_4_3 := hoisted_1_2[o_3];
                    hoisted_3_3 := hoisted_9_2[o_3];
                    hoisted_2_3 := hoisted_6_2[o_3];
                    hoisted_1_3 := hoisted_7_2[o_3][3];
                    return List( [ 1 .. deduped_4_3 * deduped_7_1 - (deduped_4_3 - 1) ], function ( j_4 )
                            local deduped_1_4, deduped_2_4;
                            deduped_2_4 := hoisted_1_3[j_4];
                            deduped_1_4 := deduped_2_4[1];
                            return MultiplyGroupElements( MultiplyGroupElements( hoisted_2_3[deduped_1_4], hoisted_8_2[deduped_2_4[2]][deduped_1_4] ), hoisted_3_3[deduped_2_4[3]] );
                        end );
                end );
        end );
    deduped_8_1 := List( deduped_26_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_6_1[c_2];
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    local deduped_1_3;
                    deduped_1_3 := hoisted_1_2[o_3];
                    return deduped_1_3 * deduped_7_1 - (deduped_1_3 - 1);
                end );
        end );
    deduped_5_1 := List( deduped_27_1, GeneratorsOfMagmaWithInverses );
    deduped_4_1 := CardinalitiesOfTransitiveGSets( cat_1 );
    deduped_24_1 := List( deduped_26_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_3_2 := deduped_5_1[deduped_5_2];
            hoisted_2_2 := deduped_18_1[deduped_5_2];
            hoisted_1_2 := deduped_8_1[deduped_5_2];
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_3_1[deduped_5_2] ], function ( o_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_4_3;
                      hoisted_1_3 := hoisted_2_2[o_3];
                      deduped_4_3 := SubmagmaWithInverses( deduped_28_1, Concatenation( hoisted_3_2, List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                                  return hoisted_1_3[i_4];
                              end ) ) );
                      hoisted_2_3 := Index( deduped_28_1, deduped_4_3 );
                      return SafeFirst( Filtered( deduped_26_1, function ( i_4 )
                                return deduped_4_1[i_4] = hoisted_2_3;
                            end ), function ( c_4 )
                              return IsConjugate( deduped_28_1, deduped_4_3, deduped_27_1[c_4] );
                          end );
                  end ) );
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_4_2[o_3];
                    return SafePositionProperty( deduped_26_1, function ( d_4 )
                            return hoisted_1_3 = d_4;
                        end );
                end );
        end );
    deduped_21_1 := Concatenation( deduped_24_1 );
    deduped_25_1 := List( deduped_26_1, function ( c_2 )
            return Number( deduped_21_1, function ( i_3 )
                    return i_3 = c_2;
                end );
        end );
    deduped_23_1 := List( deduped_26_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_1_2 := deduped_9_1[deduped_3_2];
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( [ 1 .. deduped_3_1[deduped_3_2] ], function ( o_3 )
                        return hoisted_1_2[o_3][1];
                    end ) ) );
            return List( [ 1 .. deduped_2_1[c_2] ], function ( i_3 )
                    return SafePosition( hoisted_2_2, i_3 );
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Y_1, CreateCapCategoryObjectWithAttributes( cat_1, PairOfSumAndListOfMultiplicities, NTuple( 2, Sum( deduped_25_1 ), deduped_25_1 ) ), PairOfLists, NTuple( 2, List( deduped_26_1, function ( c_2 )
                local deduped_1_2, deduped_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2;
                deduped_6_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
                deduped_5_2 := deduped_23_1[deduped_6_2];
                deduped_4_2 := [ 1 .. deduped_3_1[deduped_6_2] ];
                hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_3_1{[ 1 .. deduped_6_2 - 1 ]} ) );
                deduped_2_2 := deduped_24_1[deduped_6_2];
                deduped_1_2 := deduped_6_1[deduped_6_2];
                return NTuple( 2, CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( deduped_4_2, function ( o_3 )
                                return ListWithIdenticalEntries( deduped_1_2[o_3], -1 + deduped_2_2[o_3] );
                            end ) ){deduped_5_2} ), CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( deduped_4_2, function ( o_3 )
                                local hoisted_1_3;
                                hoisted_1_3 := deduped_2_2[o_3];
                                return ListWithIdenticalEntries( deduped_1_2[o_3], Number( deduped_21_1{[ 1 .. hoisted_3_2 + o_3 - 1 ]}, function ( i_4 )
                                          return i_4 = hoisted_1_3;
                                      end ) );
                            end ) ){deduped_5_2} ) );
            end ), List( deduped_26_1, function ( o_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, deduped_8_2, deduped_9_2;
                deduped_9_2 := CAP_JIT_INCOMPLETE_LOGIC( o_2 );
                deduped_8_2 := deduped_9_2;
                hoisted_5_2 := deduped_5_1[deduped_8_2];
                hoisted_4_2 := deduped_18_1[deduped_8_2];
                hoisted_3_2 := deduped_8_1[deduped_8_2];
                hoisted_6_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_3_1[deduped_8_2] ], function ( o_3 )
                          local hoisted_1_3, hoisted_2_3, deduped_4_3;
                          hoisted_1_3 := hoisted_4_2[o_3];
                          deduped_4_3 := SubmagmaWithInverses( deduped_28_1, Concatenation( hoisted_5_2, List( [ 1 .. hoisted_3_2[o_3] ], function ( i_4 )
                                      return hoisted_1_3[i_4];
                                  end ) ) );
                          hoisted_2_3 := Index( deduped_28_1, deduped_4_3 );
                          return RepresentativeAction( deduped_28_1, deduped_4_3, deduped_27_1[SafeFirst( Filtered( deduped_26_1, function ( i_4 )
                                       return deduped_4_1[i_4] = hoisted_2_3;
                                   end ), function ( c_4 )
                                     return IsConjugate( deduped_28_1, deduped_4_3, deduped_27_1[c_4] );
                                 end )] );
                      end ) );
                hoisted_2_2 := deduped_17_1[deduped_9_2];
                hoisted_1_2 := deduped_6_1[deduped_9_2];
                hoisted_7_2 := CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( [ 1 .. deduped_3_1[deduped_9_2] ], function ( o_3 )
                                local hoisted_1_3, hoisted_2_3;
                                hoisted_2_3 := hoisted_6_2[o_3];
                                hoisted_1_3 := hoisted_2_2[o_3];
                                return List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                                        return MultiplyGroupElements( hoisted_1_3[i_4], hoisted_2_3 );
                                    end );
                            end ) ) ){deduped_23_1[deduped_9_2]} );
                return List( [ 1 .. deduped_2_1[o_2] ], function ( i_3 )
                        return hoisted_7_2[i_3];
                    end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.ProjectionOntoCoequalizerOfIdentityAndAutomorphisms :=
        
########
function ( cat_1, Y_1, automorphisms_1 )
    local deduped_1_1, deduped_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, hoisted_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, deduped_23_1, hoisted_26_1, deduped_27_1, hoisted_29_1, deduped_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1;
    deduped_41_1 := UnderlyingGroup( cat_1 );
    deduped_40_1 := RepresentativesOfSubgroupsUpToConjugation( cat_1 );
    deduped_39_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    deduped_18_1 := OneImmutable( deduped_41_1 );
    deduped_13_1 := UnderlyingCategory( ModelingCategory( cat_1 ) );
    deduped_14_1 := List( deduped_39_1, function ( i_2 )
            return CreateCapCategoryObjectWithAttributes( deduped_13_1, ObjectNumber, i_2 );
        end );
    deduped_19_1 := List( deduped_39_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_14_1[c_2];
            return CreateCapCategoryMorphismWithAttributes( deduped_13_1, deduped_1_2, deduped_1_2, UnderlyingGroupElement, deduped_18_1 );
        end );
    deduped_17_1 := List( deduped_39_1, function ( c_2 )
            return List( automorphisms_1, function ( x_3 )
                    local hoisted_1_3, hoisted_2_3;
                    hoisted_2_3 := PairOfLists( x_3 )[2];
                    hoisted_1_3 := PairOfSumAndListOfMultiplicities( Source( x_3 ) )[2];
                    return List( deduped_39_1, function ( o_4 )
                              local hoisted_1_4;
                              hoisted_1_4 := hoisted_2_3[o_4];
                              return List( [ 1 .. hoisted_1_3[o_4] ], function ( i_5 )
                                      return hoisted_1_4[i_5];
                                  end );
                          end )[c_2];
                end );
        end );
    deduped_16_1 := List( deduped_39_1, function ( c_2 )
            return List( automorphisms_1, function ( x_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3;
                    hoisted_2_3 := PairOfSumAndListOfMultiplicities( Range( x_3 ) )[2];
                    hoisted_4_3 := List( deduped_39_1, function ( o_4 )
                            return ListWithIdenticalEntries( hoisted_2_3[o_4], deduped_14_1[o_4] );
                        end );
                    hoisted_3_3 := PairOfLists( x_3 )[1];
                    hoisted_1_3 := PairOfSumAndListOfMultiplicities( Source( x_3 ) )[2];
                    return List( deduped_39_1, function ( o_4 )
                              local hoisted_1_4, hoisted_2_4, deduped_3_4;
                              deduped_3_4 := hoisted_3_3[o_4];
                              hoisted_2_4 := deduped_3_4[2];
                              hoisted_1_4 := deduped_3_4[1];
                              return List( [ 1 .. hoisted_1_3[o_4] ], function ( i_5 )
                                      return hoisted_4_3[1 + hoisted_1_4[i_5]][1 + hoisted_2_4[i_5]];
                                  end );
                          end )[c_2];
                end );
        end );
    deduped_2_1 := PairOfSumAndListOfMultiplicities( Y_1 )[2];
    deduped_1_1 := List( deduped_39_1, function ( c_2 )
            return List( automorphisms_1, function ( x_3 )
                    return PermList( List( PairOfLists( x_3 )[1][c_2][2], function ( i_4 )
                              return 1 + i_4;
                          end ) );
                end );
        end );
    hoisted_11_1 := List( deduped_39_1, function ( c_2 )
            return OrbitsPerms( deduped_1_1[c_2], [ 1 .. deduped_2_1[c_2] ] );
        end );
    deduped_9_1 := Length( automorphisms_1 );
    hoisted_7_1 := List( deduped_39_1, function ( c_2 )
            return List( OrbitsPerms( deduped_1_1[c_2], [ 1 .. deduped_2_1[c_2] ] ), Length );
        end );
    hoisted_3_1 := List( deduped_39_1, function ( c_2 )
            return Length( OrbitsPerms( deduped_1_1[c_2], [ 1 .. deduped_2_1[c_2] ] ) );
        end );
    deduped_4_1 := List( deduped_39_1, function ( c_2 )
            return hoisted_3_1[c_2];
        end );
    deduped_8_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_7_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    return hoisted_1_2[o_3];
                end );
        end );
    deduped_12_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_1_1[c_2];
            hoisted_2_2 := deduped_8_1[c_2];
            hoisted_1_2 := hoisted_11_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    return SchreierSimsOnASingleOrbit( hoisted_3_2, deduped_9_1, hoisted_1_2[o_3][1], hoisted_2_2[o_3] );
                end );
        end );
    hoisted_21_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := [ deduped_19_1[c_2] ];
            hoisted_3_2 := deduped_17_1[c_2];
            hoisted_2_2 := deduped_16_1[c_2];
            hoisted_1_2 := deduped_12_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    return List( Iterated( hoisted_1_2[o_3][2], function ( eval_4, pair_4 )
                              local deduped_1_4, deduped_2_4;
                              deduped_2_4 := pair_4[2];
                              deduped_1_4 := pair_4[1];
                              return Concatenation( eval_4, [ CreateCapCategoryMorphismWithAttributes( deduped_13_1, List( eval_4, Source )[deduped_1_4], hoisted_2_2[deduped_2_4][deduped_1_4], UnderlyingGroupElement, MultiplyGroupElements( List( eval_4, UnderlyingGroupElement )[deduped_1_4], hoisted_3_2[deduped_2_4][deduped_1_4] ) ) ] );
                          end, hoisted_4_2 ), function ( logic_new_func_x_4 )
                            return InverseImmutable( UnderlyingGroupElement( logic_new_func_x_4 ) );
                        end );
                end );
        end );
    deduped_22_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_21_1[c_2];
            hoisted_1_2 := deduped_8_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    return List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                            return MultiplyGroupElements( deduped_18_1, hoisted_1_3[i_4] );
                        end );
                end );
        end );
    hoisted_20_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := [ deduped_19_1[c_2] ];
            hoisted_3_2 := deduped_17_1[c_2];
            hoisted_2_2 := deduped_16_1[c_2];
            hoisted_1_2 := deduped_12_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    return List( Iterated( hoisted_1_2[o_3][2], function ( eval_4, pair_4 )
                              local deduped_1_4, deduped_2_4;
                              deduped_2_4 := pair_4[2];
                              deduped_1_4 := pair_4[1];
                              return Concatenation( eval_4, [ CreateCapCategoryMorphismWithAttributes( deduped_13_1, List( eval_4, Source )[deduped_1_4], hoisted_2_2[deduped_2_4][deduped_1_4], UnderlyingGroupElement, MultiplyGroupElements( List( eval_4, UnderlyingGroupElement )[deduped_1_4], hoisted_3_2[deduped_2_4][deduped_1_4] ) ) ] );
                          end, hoisted_4_2 ), UnderlyingGroupElement );
                end );
        end );
    deduped_23_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2;
            hoisted_5_2 := deduped_22_1[c_2];
            hoisted_4_2 := deduped_17_1[c_2];
            hoisted_3_2 := deduped_12_1[c_2];
            hoisted_2_2 := hoisted_20_1[c_2];
            hoisted_1_2 := deduped_8_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3;
                    deduped_4_3 := hoisted_1_2[o_3];
                    hoisted_3_3 := hoisted_5_2[o_3];
                    hoisted_2_3 := hoisted_2_2[o_3];
                    hoisted_1_3 := hoisted_3_2[o_3][3];
                    return List( [ 1 .. deduped_4_3 * deduped_9_1 - (deduped_4_3 - 1) ], function ( j_4 )
                            local deduped_1_4, deduped_2_4;
                            deduped_2_4 := hoisted_1_3[j_4];
                            deduped_1_4 := deduped_2_4[1];
                            return MultiplyGroupElements( MultiplyGroupElements( hoisted_2_3[deduped_1_4], hoisted_4_2[deduped_2_4[2]][deduped_1_4] ), hoisted_3_3[deduped_2_4[3]] );
                        end );
                end );
        end );
    deduped_10_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_8_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local deduped_1_3;
                    deduped_1_3 := hoisted_1_2[o_3];
                    return deduped_1_3 * deduped_9_1 - (deduped_1_3 - 1);
                end );
        end );
    deduped_6_1 := List( deduped_40_1, GeneratorsOfMagmaWithInverses );
    deduped_5_1 := CardinalitiesOfTransitiveGSets( cat_1 );
    hoisted_26_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_6_1[c_2];
            hoisted_2_2 := deduped_23_1[c_2];
            hoisted_1_2 := deduped_10_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_4_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    deduped_4_3 := SubmagmaWithInverses( deduped_41_1, Concatenation( hoisted_3_2, List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                                return hoisted_1_3[i_4];
                            end ) ) );
                    hoisted_2_3 := Index( deduped_41_1, deduped_4_3 );
                    return SafeFirst( Filtered( deduped_39_1, function ( i_4 )
                              return deduped_5_1[i_4] = hoisted_2_3;
                          end ), function ( c_4 )
                            return IsConjugate( deduped_41_1, deduped_4_3, deduped_40_1[c_4] );
                        end );
                end );
        end );
    deduped_37_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_26_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_1_2[o_3];
                    return SafePositionProperty( deduped_39_1, function ( d_4 )
                            return hoisted_1_3 = d_4;
                        end );
                end );
        end );
    deduped_27_1 := Concatenation( deduped_37_1 );
    deduped_38_1 := List( deduped_39_1, function ( c_2 )
            return Number( deduped_27_1, function ( i_3 )
                    return i_3 = c_2;
                end );
        end );
    hoisted_34_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_6_1[c_2];
            hoisted_2_2 := deduped_23_1[c_2];
            hoisted_1_2 := deduped_10_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_4_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    deduped_4_3 := SubmagmaWithInverses( deduped_41_1, Concatenation( hoisted_3_2, List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                                return hoisted_1_3[i_4];
                            end ) ) );
                    hoisted_2_3 := Index( deduped_41_1, deduped_4_3 );
                    return RepresentativeAction( deduped_41_1, deduped_4_3, deduped_40_1[SafeFirst( Filtered( deduped_39_1, function ( i_4 )
                                 return deduped_5_1[i_4] = hoisted_2_3;
                             end ), function ( c_4 )
                               return IsConjugate( deduped_41_1, deduped_4_3, deduped_40_1[c_4] );
                           end )] );
                end );
        end );
    hoisted_35_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_34_1[c_2];
            hoisted_2_2 := deduped_22_1[c_2];
            hoisted_1_2 := deduped_8_1[c_2];
            return Concatenation( List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_2_3 := hoisted_3_2[o_3];
                      hoisted_1_3 := hoisted_2_2[o_3];
                      return List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                              return MultiplyGroupElements( hoisted_1_3[i_4], hoisted_2_3 );
                          end );
                  end ) );
        end );
    hoisted_29_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_12_1[c_2];
            return Concatenation( List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                      return hoisted_1_2[o_3][1];
                  end ) );
        end );
    deduped_30_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_29_1[c_2];
            return List( [ 1 .. deduped_2_1[c_2] ], function ( i_3 )
                    return SafePosition( hoisted_1_2, i_3 );
                end );
        end );
    hoisted_36_1 := List( deduped_39_1, function ( c_2 )
            return hoisted_35_1[c_2]{deduped_30_1[c_2]};
        end );
    hoisted_32_1 := List( deduped_39_1, function ( c_2 )
            return Sum( deduped_4_1{[ 1 .. c_2 - 1 ]} );
        end );
    hoisted_33_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_37_1[c_2];
            hoisted_2_2 := hoisted_32_1[c_2];
            hoisted_1_2 := deduped_8_1[c_2];
            return Concatenation( List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := hoisted_3_2[o_3];
                        return ListWithIdenticalEntries( hoisted_1_2[o_3], Number( deduped_27_1{[ 1 .. hoisted_2_2 + o_3 - 1 ]}, function ( i_4 )
                                  return i_4 = hoisted_1_3;
                              end ) );
                    end ) ){deduped_30_1[c_2]};
        end );
    hoisted_31_1 := List( deduped_39_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_37_1[c_2];
            hoisted_1_2 := deduped_8_1[c_2];
            return Concatenation( List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                        return ListWithIdenticalEntries( hoisted_1_2[o_3], -1 + hoisted_2_2[o_3] );
                    end ) ){deduped_30_1[c_2]};
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Y_1, CreateCapCategoryObjectWithAttributes( cat_1, PairOfSumAndListOfMultiplicities, NTuple( 2, Sum( deduped_38_1 ), deduped_38_1 ) ), PairOfLists, NTuple( 2, List( deduped_39_1, function ( c_2 )
                return NTuple( 2, hoisted_31_1[c_2], hoisted_33_1[c_2] );
            end ), List( deduped_39_1, function ( o_2 )
                local hoisted_1_2;
                hoisted_1_2 := hoisted_36_1[o_2];
                return List( [ 1 .. deduped_2_1[o_2] ], function ( i_3 )
                        return hoisted_1_2[i_3];
                    end );
            end ) ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismFromCoequalizerOfIdentityAndAutomorphisms( cat,
        
########
function ( cat_1, Y_1, automorphisms_1, T_1, tau_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_19_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1;
    deduped_35_1 := PairOfLists( tau_1 );
    deduped_34_1 := UnderlyingGroup( cat_1 );
    deduped_33_1 := RepresentativesOfSubgroupsUpToConjugation( cat_1 );
    deduped_32_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    deduped_15_1 := OneImmutable( deduped_34_1 );
    deduped_14_1 := List( deduped_32_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            return List( automorphisms_1, function ( x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := PairOfLists( x_3 )[2][deduped_1_2];
                    return CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. PairOfSumAndListOfMultiplicities( Source( x_3 ) )[2][deduped_1_2] ], function ( i_4 )
                              return hoisted_1_3[i_4];
                          end ) );
                end );
        end );
    deduped_11_1 := UnderlyingCategory( ModelingCategory( cat_1 ) );
    deduped_12_1 := List( deduped_32_1, function ( i_2 )
            return CreateCapCategoryObjectWithAttributes( deduped_11_1, ObjectNumber, i_2 );
        end );
    deduped_2_1 := PairOfSumAndListOfMultiplicities( Y_1 )[2];
    deduped_1_1 := List( deduped_32_1, function ( c_2 )
            return List( automorphisms_1, function ( x_3 )
                    return PermList( List( PairOfLists( x_3 )[1][c_2][2], function ( i_4 )
                              return 1 + i_4;
                          end ) );
                end );
        end );
    deduped_9_1 := List( deduped_32_1, function ( c_2 )
            return OrbitsPerms( deduped_1_1[c_2], [ 1 .. deduped_2_1[c_2] ] );
        end );
    deduped_7_1 := Length( automorphisms_1 );
    deduped_3_1 := List( deduped_32_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Length( OrbitsPerms( deduped_1_1[deduped_1_2], [ 1 .. deduped_2_1[deduped_1_2] ] ) ) );
        end );
    deduped_6_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, deduped_2_2;
            deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( OrbitsPerms( deduped_1_1[deduped_2_2], [ 1 .. deduped_2_1[deduped_2_2] ] ), Length ) );
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    return hoisted_1_2[o_3];
                end );
        end );
    deduped_10_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_1_1[c_2];
            hoisted_2_2 := deduped_6_1[c_2];
            hoisted_1_2 := deduped_9_1[c_2];
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    return SchreierSimsOnASingleOrbit( hoisted_3_2, deduped_7_1, hoisted_1_2[o_3][1], hoisted_2_2[o_3] );
                end );
        end );
    deduped_16_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2, deduped_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, deduped_12_2, deduped_13_2, deduped_14_2;
            deduped_14_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            deduped_13_2 := deduped_12_1[deduped_14_2];
            deduped_12_2 := [ 1 .. deduped_3_1[deduped_14_2] ];
            hoisted_10_2 := deduped_6_1[deduped_14_2];
            deduped_6_2 := [ CAP_JIT_INCOMPLETE_LOGIC( CreateCapCategoryMorphismWithAttributes( deduped_11_1, deduped_13_2, deduped_13_2, UnderlyingGroupElement, deduped_15_1 ) ) ];
            deduped_5_2 := deduped_14_1[deduped_14_2];
            deduped_3_2 := deduped_14_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( automorphisms_1, function ( x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3;
                      deduped_5_3 := PairOfLists( x_3 )[1][deduped_3_2];
                      hoisted_4_3 := deduped_5_3[2];
                      hoisted_1_3 := PairOfSumAndListOfMultiplicities( Range( x_3 ) )[2];
                      hoisted_3_3 := List( deduped_32_1, function ( o_4 )
                              return ListWithIdenticalEntries( hoisted_1_3[o_4], deduped_12_1[o_4] );
                          end );
                      hoisted_2_3 := deduped_5_3[1];
                      return CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. PairOfSumAndListOfMultiplicities( Source( x_3 ) )[2][deduped_3_2] ], function ( i_4 )
                                return hoisted_3_3[1 + hoisted_2_3[i_4]][1 + hoisted_4_3[i_4]];
                            end ) );
                  end ) );
            deduped_2_2 := deduped_10_1[deduped_14_2];
            hoisted_11_2 := CAP_JIT_INCOMPLETE_LOGIC( List( deduped_12_2, function ( o_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( List( Iterated( deduped_2_2[CAP_JIT_INCOMPLETE_LOGIC( o_3 )][2], function ( eval_4, pair_4 )
                                  local deduped_1_4, deduped_2_4, deduped_3_4;
                                  deduped_3_4 := pair_4[2];
                                  deduped_2_4 := pair_4[1];
                                  deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( eval_4[deduped_2_4] );
                                  return Concatenation( eval_4, [ CreateCapCategoryMorphismWithAttributes( deduped_11_1, CAP_JIT_INCOMPLETE_LOGIC( Source( deduped_1_4 ) ), deduped_4_2[deduped_3_4][deduped_2_4], UnderlyingGroupElement, MultiplyGroupElements( CAP_JIT_INCOMPLETE_LOGIC( UnderlyingGroupElement( deduped_1_4 ) ), deduped_5_2[deduped_3_4][deduped_2_4] ) ) ] );
                              end, deduped_6_2 ), function ( logic_new_func_x_4 )
                                return InverseImmutable( UnderlyingGroupElement( logic_new_func_x_4 ) );
                            end ) );
                      return List( [ 1 .. hoisted_10_2[o_3] ], function ( i_4 )
                              return MultiplyGroupElements( deduped_15_1, hoisted_1_3[i_4] );
                          end );
                  end ) );
            hoisted_9_2 := deduped_14_1[c_2];
            hoisted_8_2 := deduped_10_1[c_2];
            hoisted_7_2 := CAP_JIT_INCOMPLETE_LOGIC( List( deduped_12_2, function ( o_3 )
                      return List( Iterated( deduped_2_2[o_3][2], function ( eval_4, pair_4 )
                                local deduped_1_4, deduped_2_4, deduped_3_4;
                                deduped_3_4 := pair_4[2];
                                deduped_2_4 := pair_4[1];
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( eval_4[deduped_2_4] );
                                return Concatenation( eval_4, [ CreateCapCategoryMorphismWithAttributes( deduped_11_1, CAP_JIT_INCOMPLETE_LOGIC( Source( deduped_1_4 ) ), deduped_4_2[deduped_3_4][deduped_2_4], UnderlyingGroupElement, MultiplyGroupElements( CAP_JIT_INCOMPLETE_LOGIC( UnderlyingGroupElement( deduped_1_4 ) ), deduped_5_2[deduped_3_4][deduped_2_4] ) ) ] );
                            end, deduped_6_2 ), UnderlyingGroupElement );
                  end ) );
            hoisted_1_2 := deduped_6_1[c_2];
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3;
                    deduped_4_3 := hoisted_1_2[o_3];
                    hoisted_3_3 := hoisted_11_2[o_3];
                    hoisted_2_3 := hoisted_7_2[o_3];
                    hoisted_1_3 := hoisted_8_2[o_3][3];
                    return List( [ 1 .. deduped_4_3 * deduped_7_1 - (deduped_4_3 - 1) ], function ( j_4 )
                            local deduped_1_4, deduped_2_4;
                            deduped_2_4 := hoisted_1_3[j_4];
                            deduped_1_4 := deduped_2_4[1];
                            return MultiplyGroupElements( MultiplyGroupElements( hoisted_2_3[deduped_1_4], hoisted_9_2[deduped_2_4[2]][deduped_1_4] ), hoisted_3_3[deduped_2_4[3]] );
                        end );
                end );
        end );
    deduped_8_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_6_1[c_2];
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    local deduped_1_3;
                    deduped_1_3 := hoisted_1_2[o_3];
                    return deduped_1_3 * deduped_7_1 - (deduped_1_3 - 1);
                end );
        end );
    deduped_5_1 := List( deduped_33_1, GeneratorsOfMagmaWithInverses );
    deduped_4_1 := CardinalitiesOfTransitiveGSets( cat_1 );
    deduped_30_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_3_2 := deduped_5_1[deduped_5_2];
            hoisted_2_2 := deduped_16_1[deduped_5_2];
            hoisted_1_2 := deduped_8_1[deduped_5_2];
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_3_1[deduped_5_2] ], function ( o_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_4_3;
                      hoisted_1_3 := hoisted_2_2[o_3];
                      deduped_4_3 := SubmagmaWithInverses( deduped_34_1, Concatenation( hoisted_3_2, List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                                  return hoisted_1_3[i_4];
                              end ) ) );
                      hoisted_2_3 := Index( deduped_34_1, deduped_4_3 );
                      return SafeFirst( Filtered( deduped_32_1, function ( i_4 )
                                return deduped_4_1[i_4] = hoisted_2_3;
                            end ), function ( c_4 )
                              return IsConjugate( deduped_34_1, deduped_4_3, deduped_33_1[c_4] );
                          end );
                  end ) );
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_4_2[o_3];
                    return SafePositionProperty( deduped_32_1, function ( d_4 )
                            return hoisted_1_3 = d_4;
                        end );
                end );
        end );
    deduped_19_1 := Concatenation( deduped_30_1 );
    deduped_31_1 := List( deduped_32_1, function ( c_2 )
            return Number( deduped_19_1, function ( i_3 )
                    return i_3 = c_2;
                end );
        end );
    hoisted_28_1 := deduped_35_1[2];
    hoisted_27_1 := PairOfSumAndListOfMultiplicities( Source( tau_1 ) )[2];
    hoisted_29_1 := List( deduped_32_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_28_1[o_2];
            return List( [ 1 .. hoisted_27_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    deduped_22_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_30_1[c_2];
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_3_1{[ 1 .. CAP_JIT_INCOMPLETE_LOGIC( c_2 ) - 1 ]} ) );
            return List( [ 1 .. deduped_3_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    return Number( deduped_19_1{[ 1 .. hoisted_1_2 + o_3 ]}, function ( i_4 )
                            return i_4 = hoisted_1_3;
                        end );
                end );
        end );
    deduped_23_1 := List( deduped_32_1, function ( c_2 )
            return List( [ 1 .. deduped_31_1[c_2] ], function ( i_3 )
                    return SafeFirst( deduped_32_1, function ( d_4 )
                            return c_2 in deduped_30_1[d_4] and i_3 in deduped_22_1[d_4];
                        end );
                end );
        end );
    deduped_25_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_23_1[c_2];
            return List( [ 1 .. deduped_31_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_3_3;
                    deduped_3_3 := hoisted_1_2[i_3];
                    hoisted_2_3 := deduped_22_1[deduped_3_3];
                    hoisted_1_3 := deduped_30_1[deduped_3_3];
                    return SafeFirst( [ 1 .. deduped_3_1[deduped_3_3] ], function ( j_4 )
                            return hoisted_1_3[j_4] = c_2 and hoisted_2_3[j_4] = i_3;
                        end );
                end );
        end );
    deduped_26_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_25_1[c_2];
            hoisted_1_2 := deduped_23_1[c_2];
            return List( [ 1 .. deduped_31_1[c_2] ], function ( i_3 )
                    return deduped_9_1[hoisted_1_2[i_3]][hoisted_2_2[i_3]][1];
                end );
        end );
    deduped_24_1 := deduped_35_1[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, PairOfSumAndListOfMultiplicities, NTuple( 2, Sum( deduped_31_1 ), deduped_31_1 ) ), T_1, PairOfLists, NTuple( 2, List( deduped_32_1, function ( c_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := [ 1 .. deduped_31_1[c_2] ];
                deduped_2_2 := deduped_26_1[c_2];
                deduped_1_2 := deduped_23_1[c_2];
                return NTuple( 2, List( deduped_3_2, function ( i_3 )
                          return deduped_24_1[deduped_1_2[i_3]][1][deduped_2_2[i_3]];
                      end ), List( deduped_3_2, function ( i_3 )
                          return deduped_24_1[deduped_1_2[i_3]][2][deduped_2_2[i_3]];
                      end ) );
            end ), List( deduped_32_1, function ( o_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2;
                deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( o_2 );
                hoisted_3_2 := deduped_26_1[deduped_5_2];
                hoisted_2_2 := deduped_25_1[deduped_5_2];
                hoisted_1_2 := deduped_23_1[deduped_5_2];
                hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_31_1[deduped_5_2] ], function ( i_3 )
                          local hoisted_1_3, hoisted_2_3, deduped_4_3, deduped_5_3, deduped_6_3;
                          deduped_6_3 := hoisted_2_2[i_3];
                          deduped_5_3 := hoisted_1_2[i_3];
                          hoisted_1_3 := deduped_16_1[deduped_5_3][deduped_6_3];
                          deduped_4_3 := SubmagmaWithInverses( deduped_34_1, Concatenation( deduped_5_1[deduped_5_3], List( [ 1 .. deduped_8_1[deduped_5_3][deduped_6_3] ], function ( i_4 )
                                      return hoisted_1_3[i_4];
                                  end ) ) );
                          hoisted_2_3 := Index( deduped_34_1, deduped_4_3 );
                          return MultiplyGroupElements( InverseImmutable( RepresentativeAction( deduped_34_1, deduped_4_3, deduped_33_1[SafeFirst( Filtered( deduped_32_1, function ( i_4 )
                                           return deduped_4_1[i_4] = hoisted_2_3;
                                       end ), function ( c_4 )
                                         return IsConjugate( deduped_34_1, deduped_4_3, deduped_33_1[c_4] );
                                     end )] ) ), hoisted_29_1[deduped_5_3][hoisted_3_2[i_3]] );
                      end ) );
                return List( [ 1 .. deduped_31_1[o_2] ], function ( i_3 )
                        return hoisted_4_2[i_3];
                    end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.UniversalMorphismFromCoequalizerOfIdentityAndAutomorphisms :=
        
########
function ( cat_1, Y_1, automorphisms_1, T_1, tau_1 )
    local deduped_1_1, deduped_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, deduped_23_1, hoisted_26_1, deduped_27_1, hoisted_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1;
    deduped_45_1 := PairOfLists( tau_1 );
    deduped_44_1 := UnderlyingGroup( cat_1 );
    deduped_43_1 := RepresentativesOfSubgroupsUpToConjugation( cat_1 );
    deduped_42_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    deduped_18_1 := OneImmutable( deduped_44_1 );
    deduped_13_1 := UnderlyingCategory( ModelingCategory( cat_1 ) );
    deduped_14_1 := List( deduped_42_1, function ( i_2 )
            return CreateCapCategoryObjectWithAttributes( deduped_13_1, ObjectNumber, i_2 );
        end );
    deduped_19_1 := List( deduped_42_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_14_1[c_2];
            return CreateCapCategoryMorphismWithAttributes( deduped_13_1, deduped_1_2, deduped_1_2, UnderlyingGroupElement, deduped_18_1 );
        end );
    deduped_17_1 := List( deduped_42_1, function ( c_2 )
            return List( automorphisms_1, function ( x_3 )
                    local hoisted_1_3, hoisted_2_3;
                    hoisted_2_3 := PairOfLists( x_3 )[2];
                    hoisted_1_3 := PairOfSumAndListOfMultiplicities( Source( x_3 ) )[2];
                    return List( deduped_42_1, function ( o_4 )
                              local hoisted_1_4;
                              hoisted_1_4 := hoisted_2_3[o_4];
                              return List( [ 1 .. hoisted_1_3[o_4] ], function ( i_5 )
                                      return hoisted_1_4[i_5];
                                  end );
                          end )[c_2];
                end );
        end );
    deduped_16_1 := List( deduped_42_1, function ( c_2 )
            return List( automorphisms_1, function ( x_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3;
                    hoisted_2_3 := PairOfSumAndListOfMultiplicities( Range( x_3 ) )[2];
                    hoisted_4_3 := List( deduped_42_1, function ( o_4 )
                            return ListWithIdenticalEntries( hoisted_2_3[o_4], deduped_14_1[o_4] );
                        end );
                    hoisted_3_3 := PairOfLists( x_3 )[1];
                    hoisted_1_3 := PairOfSumAndListOfMultiplicities( Source( x_3 ) )[2];
                    return List( deduped_42_1, function ( o_4 )
                              local hoisted_1_4, hoisted_2_4, deduped_3_4;
                              deduped_3_4 := hoisted_3_3[o_4];
                              hoisted_2_4 := deduped_3_4[2];
                              hoisted_1_4 := deduped_3_4[1];
                              return List( [ 1 .. hoisted_1_3[o_4] ], function ( i_5 )
                                      return hoisted_4_3[1 + hoisted_1_4[i_5]][1 + hoisted_2_4[i_5]];
                                  end );
                          end )[c_2];
                end );
        end );
    deduped_2_1 := PairOfSumAndListOfMultiplicities( Y_1 )[2];
    deduped_1_1 := List( deduped_42_1, function ( c_2 )
            return List( automorphisms_1, function ( x_3 )
                    return PermList( List( PairOfLists( x_3 )[1][c_2][2], function ( i_4 )
                              return 1 + i_4;
                          end ) );
                end );
        end );
    deduped_11_1 := List( deduped_42_1, function ( c_2 )
            return OrbitsPerms( deduped_1_1[c_2], [ 1 .. deduped_2_1[c_2] ] );
        end );
    deduped_9_1 := Length( automorphisms_1 );
    hoisted_7_1 := List( deduped_42_1, function ( c_2 )
            return List( OrbitsPerms( deduped_1_1[c_2], [ 1 .. deduped_2_1[c_2] ] ), Length );
        end );
    hoisted_3_1 := List( deduped_42_1, function ( c_2 )
            return Length( OrbitsPerms( deduped_1_1[c_2], [ 1 .. deduped_2_1[c_2] ] ) );
        end );
    deduped_4_1 := List( deduped_42_1, function ( c_2 )
            return hoisted_3_1[c_2];
        end );
    deduped_8_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_7_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    return hoisted_1_2[o_3];
                end );
        end );
    deduped_12_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_1_1[c_2];
            hoisted_2_2 := deduped_8_1[c_2];
            hoisted_1_2 := deduped_11_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    return SchreierSimsOnASingleOrbit( hoisted_3_2, deduped_9_1, hoisted_1_2[o_3][1], hoisted_2_2[o_3] );
                end );
        end );
    hoisted_21_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := [ deduped_19_1[c_2] ];
            hoisted_3_2 := deduped_17_1[c_2];
            hoisted_2_2 := deduped_16_1[c_2];
            hoisted_1_2 := deduped_12_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    return List( Iterated( hoisted_1_2[o_3][2], function ( eval_4, pair_4 )
                              local deduped_1_4, deduped_2_4;
                              deduped_2_4 := pair_4[2];
                              deduped_1_4 := pair_4[1];
                              return Concatenation( eval_4, [ CreateCapCategoryMorphismWithAttributes( deduped_13_1, List( eval_4, Source )[deduped_1_4], hoisted_2_2[deduped_2_4][deduped_1_4], UnderlyingGroupElement, MultiplyGroupElements( List( eval_4, UnderlyingGroupElement )[deduped_1_4], hoisted_3_2[deduped_2_4][deduped_1_4] ) ) ] );
                          end, hoisted_4_2 ), function ( logic_new_func_x_4 )
                            return InverseImmutable( UnderlyingGroupElement( logic_new_func_x_4 ) );
                        end );
                end );
        end );
    hoisted_22_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_21_1[c_2];
            hoisted_1_2 := deduped_8_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    return List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                            return MultiplyGroupElements( deduped_18_1, hoisted_1_3[i_4] );
                        end );
                end );
        end );
    hoisted_20_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := [ deduped_19_1[c_2] ];
            hoisted_3_2 := deduped_17_1[c_2];
            hoisted_2_2 := deduped_16_1[c_2];
            hoisted_1_2 := deduped_12_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    return List( Iterated( hoisted_1_2[o_3][2], function ( eval_4, pair_4 )
                              local deduped_1_4, deduped_2_4;
                              deduped_2_4 := pair_4[2];
                              deduped_1_4 := pair_4[1];
                              return Concatenation( eval_4, [ CreateCapCategoryMorphismWithAttributes( deduped_13_1, List( eval_4, Source )[deduped_1_4], hoisted_2_2[deduped_2_4][deduped_1_4], UnderlyingGroupElement, MultiplyGroupElements( List( eval_4, UnderlyingGroupElement )[deduped_1_4], hoisted_3_2[deduped_2_4][deduped_1_4] ) ) ] );
                          end, hoisted_4_2 ), UnderlyingGroupElement );
                end );
        end );
    deduped_23_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2;
            hoisted_5_2 := hoisted_22_1[c_2];
            hoisted_4_2 := deduped_17_1[c_2];
            hoisted_3_2 := deduped_12_1[c_2];
            hoisted_2_2 := hoisted_20_1[c_2];
            hoisted_1_2 := deduped_8_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3;
                    deduped_4_3 := hoisted_1_2[o_3];
                    hoisted_3_3 := hoisted_5_2[o_3];
                    hoisted_2_3 := hoisted_2_2[o_3];
                    hoisted_1_3 := hoisted_3_2[o_3][3];
                    return List( [ 1 .. deduped_4_3 * deduped_9_1 - (deduped_4_3 - 1) ], function ( j_4 )
                            local deduped_1_4, deduped_2_4;
                            deduped_2_4 := hoisted_1_3[j_4];
                            deduped_1_4 := deduped_2_4[1];
                            return MultiplyGroupElements( MultiplyGroupElements( hoisted_2_3[deduped_1_4], hoisted_4_2[deduped_2_4[2]][deduped_1_4] ), hoisted_3_3[deduped_2_4[3]] );
                        end );
                end );
        end );
    deduped_10_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_8_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local deduped_1_3;
                    deduped_1_3 := hoisted_1_2[o_3];
                    return deduped_1_3 * deduped_9_1 - (deduped_1_3 - 1);
                end );
        end );
    deduped_6_1 := List( deduped_43_1, GeneratorsOfMagmaWithInverses );
    deduped_5_1 := CardinalitiesOfTransitiveGSets( cat_1 );
    hoisted_26_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_6_1[c_2];
            hoisted_2_2 := deduped_23_1[c_2];
            hoisted_1_2 := deduped_10_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_4_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    deduped_4_3 := SubmagmaWithInverses( deduped_44_1, Concatenation( hoisted_3_2, List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                                return hoisted_1_3[i_4];
                            end ) ) );
                    hoisted_2_3 := Index( deduped_44_1, deduped_4_3 );
                    return SafeFirst( Filtered( deduped_42_1, function ( i_4 )
                              return deduped_5_1[i_4] = hoisted_2_3;
                          end ), function ( c_4 )
                            return IsConjugate( deduped_44_1, deduped_4_3, deduped_43_1[c_4] );
                        end );
                end );
        end );
    deduped_40_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_26_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_1_2[o_3];
                    return SafePositionProperty( deduped_42_1, function ( d_4 )
                            return hoisted_1_3 = d_4;
                        end );
                end );
        end );
    deduped_27_1 := Concatenation( deduped_40_1 );
    deduped_41_1 := List( deduped_42_1, function ( c_2 )
            return Number( deduped_27_1, function ( i_3 )
                    return i_3 = c_2;
                end );
        end );
    hoisted_37_1 := deduped_45_1[2];
    hoisted_36_1 := PairOfSumAndListOfMultiplicities( Source( tau_1 ) )[2];
    hoisted_38_1 := List( deduped_42_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_37_1[o_2];
            return List( [ 1 .. hoisted_36_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    hoisted_30_1 := List( deduped_42_1, function ( c_2 )
            return Sum( deduped_4_1{[ 1 .. c_2 - 1 ]} );
        end );
    deduped_31_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_40_1[c_2];
            hoisted_1_2 := hoisted_30_1[c_2];
            return List( [ 1 .. deduped_4_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    return Number( deduped_27_1{[ 1 .. hoisted_1_2 + o_3 ]}, function ( i_4 )
                            return i_4 = hoisted_1_3;
                        end );
                end );
        end );
    deduped_32_1 := List( deduped_42_1, function ( c_2 )
            return List( [ 1 .. deduped_41_1[c_2] ], function ( i_3 )
                    return SafeFirst( deduped_42_1, function ( d_4 )
                            return c_2 in deduped_40_1[d_4] and i_3 in deduped_31_1[d_4];
                        end );
                end );
        end );
    deduped_34_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_32_1[c_2];
            return List( [ 1 .. deduped_41_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_3_3;
                    deduped_3_3 := hoisted_1_2[i_3];
                    hoisted_2_3 := deduped_31_1[deduped_3_3];
                    hoisted_1_3 := deduped_40_1[deduped_3_3];
                    return SafeFirst( [ 1 .. deduped_4_1[deduped_3_3] ], function ( j_4 )
                            return hoisted_1_3[j_4] = c_2 and hoisted_2_3[j_4] = i_3;
                        end );
                end );
        end );
    deduped_35_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_34_1[c_2];
            hoisted_1_2 := deduped_32_1[c_2];
            return List( [ 1 .. deduped_41_1[c_2] ], function ( i_3 )
                    return deduped_11_1[hoisted_1_2[i_3]][hoisted_2_2[i_3]][1];
                end );
        end );
    hoisted_39_1 := List( deduped_42_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_35_1[c_2];
            hoisted_2_2 := deduped_34_1[c_2];
            hoisted_1_2 := deduped_32_1[c_2];
            return List( [ 1 .. deduped_41_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_4_3, deduped_5_3, deduped_6_3;
                    deduped_6_3 := hoisted_2_2[i_3];
                    deduped_5_3 := hoisted_1_2[i_3];
                    hoisted_1_3 := deduped_23_1[deduped_5_3][deduped_6_3];
                    deduped_4_3 := SubmagmaWithInverses( deduped_44_1, Concatenation( deduped_6_1[deduped_5_3], List( [ 1 .. deduped_10_1[deduped_5_3][deduped_6_3] ], function ( i_4 )
                                return hoisted_1_3[i_4];
                            end ) ) );
                    hoisted_2_3 := Index( deduped_44_1, deduped_4_3 );
                    return MultiplyGroupElements( InverseImmutable( RepresentativeAction( deduped_44_1, deduped_4_3, deduped_43_1[SafeFirst( Filtered( deduped_42_1, function ( i_4 )
                                     return deduped_5_1[i_4] = hoisted_2_3;
                                 end ), function ( c_4 )
                                   return IsConjugate( deduped_44_1, deduped_4_3, deduped_43_1[c_4] );
                               end )] ) ), hoisted_38_1[deduped_5_3][hoisted_3_2[i_3]] );
                end );
        end );
    deduped_33_1 := deduped_45_1[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, PairOfSumAndListOfMultiplicities, NTuple( 2, Sum( deduped_41_1 ), deduped_41_1 ) ), T_1, PairOfLists, NTuple( 2, List( deduped_42_1, function ( c_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := [ 1 .. deduped_41_1[c_2] ];
                deduped_2_2 := deduped_35_1[c_2];
                deduped_1_2 := deduped_32_1[c_2];
                return NTuple( 2, List( deduped_3_2, function ( i_3 )
                          return deduped_33_1[deduped_1_2[i_3]][1][deduped_2_2[i_3]];
                      end ), List( deduped_3_2, function ( i_3 )
                          return deduped_33_1[deduped_1_2[i_3]][2][deduped_2_2[i_3]];
                      end ) );
            end ), List( deduped_42_1, function ( o_2 )
                local hoisted_1_2;
                hoisted_1_2 := hoisted_39_1[o_2];
                return List( [ 1 .. deduped_41_1[o_2] ], function ( i_3 )
                        return hoisted_1_2[i_3];
                    end );
            end ) ) );
end
########
        
    ;
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "SkeletalCategoryOfFiniteLeftGSets_precompiled", function ( G )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( G )
    return SkeletalCategoryOfFiniteLeftGSets( GROUP_AS_CATEGORY( G : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor( G : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_SkeletalCategoryOfFiniteLeftGSets_precompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
