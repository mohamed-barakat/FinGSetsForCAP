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
    AddUniversalMorphismFromCoequalizerOfIdentityAndAutomorphisms( cat,
        
########
function ( cat_1, Y_1, automorphisms_1, T_1, tau_1 )
    local deduped_2_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_22_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1;
    deduped_41_1 := PairOfLists( tau_1 );
    deduped_40_1 := UnderlyingGroup( cat_1 );
    deduped_39_1 := RepresentativesOfSubgroupsUpToConjugation( cat_1 );
    deduped_38_1 := Length( automorphisms_1 );
    deduped_37_1 := [ 1 .. deduped_38_1 ];
    deduped_36_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    deduped_35_1 := UnderlyingCategory( ModelingCategory( cat_1 ) );
    deduped_18_1 := OneImmutable( deduped_40_1 );
    deduped_2_1 := List( deduped_36_1, function ( i_2 )
            return CreateCapCategoryObjectWithAttributes( deduped_35_1, ObjectNumber, i_2 );
        end );
    deduped_4_1 := List( deduped_37_1, function ( r_2 )
            local deduped_1_2, hoisted_2_2, hoisted_4_2, hoisted_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := CAP_JIT_INCOMPLETE_LOGIC( automorphisms_1[r_2] );
            deduped_7_2 := PairOfLists( deduped_8_2 );
            deduped_6_2 := deduped_7_2[1];
            hoisted_5_2 := deduped_7_2[2];
            hoisted_2_2 := PairOfSumAndListOfMultiplicities( Range( deduped_8_2 ) )[2];
            hoisted_4_2 := List( deduped_36_1, function ( o_3 )
                    return ListWithIdenticalEntries( hoisted_2_2[o_3], deduped_2_1[o_3] );
                end );
            deduped_1_2 := PairOfSumAndListOfMultiplicities( Source( deduped_8_2 ) )[2];
            return CAP_JIT_INCOMPLETE_LOGIC( NTuple( 2, deduped_6_2, List( deduped_36_1, function ( o_3 )
                        local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3, deduped_6_3;
                        deduped_6_3 := deduped_6_2[o_3];
                        deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( o_3 );
                        hoisted_4_3 := hoisted_5_2[o_3];
                        hoisted_3_3 := deduped_6_3[2];
                        hoisted_2_3 := deduped_6_3[1];
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( ListWithIdenticalEntries( deduped_1_2[deduped_5_3], deduped_2_1[deduped_5_3] ) );
                        return List( [ 1 .. deduped_1_2[o_3] ], function ( i_4 )
                                return CreateCapCategoryMorphismWithAttributes( deduped_35_1, hoisted_1_3[i_4], hoisted_4_2[1 + hoisted_2_3[i_4]][1 + hoisted_3_3[i_4]], UnderlyingGroupElement, hoisted_4_3[i_4] );
                            end );
                    end ) ) );
        end );
    deduped_17_1 := List( deduped_36_1, function ( c_2 )
            return List( deduped_37_1, function ( r_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( List( CAP_JIT_INCOMPLETE_LOGIC( deduped_4_1[r_3][2][c_2] ), UnderlyingGroupElement ) );
                end );
        end );
    deduped_16_1 := List( deduped_36_1, function ( c_2 )
            return List( deduped_37_1, function ( r_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( List( CAP_JIT_INCOMPLETE_LOGIC( deduped_4_1[r_3][2][c_2] ), Range ) );
                end );
        end );
    deduped_7_1 := PairOfSumAndListOfMultiplicities( Y_1 )[2];
    deduped_6_1 := List( deduped_36_1, function ( c_2 )
            return List( deduped_37_1, function ( r_3 )
                    return PermList( List( deduped_4_1[r_3][1][c_2][2], function ( i_4 )
                              return 1 + i_4;
                          end ) );
                end );
        end );
    deduped_14_1 := List( deduped_36_1, function ( c_2 )
            return OrbitsPerms( deduped_6_1[c_2], [ 1 .. deduped_7_1[c_2] ] );
        end );
    deduped_8_1 := List( deduped_36_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Length( OrbitsPerms( deduped_6_1[deduped_1_2], [ 1 .. deduped_7_1[deduped_1_2] ] ) ) );
        end );
    deduped_11_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2, deduped_2_2;
            deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( OrbitsPerms( deduped_6_1[deduped_2_2], [ 1 .. deduped_7_1[deduped_2_2] ] ), Length ) );
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    return hoisted_1_2[o_3];
                end );
        end );
    deduped_15_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_6_1[c_2];
            hoisted_2_2 := deduped_11_1[c_2];
            hoisted_1_2 := deduped_14_1[c_2];
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    return SchreierSimsOnASingleOrbit( hoisted_3_2, deduped_38_1, hoisted_1_2[o_3][1], hoisted_2_2[o_3] );
                end );
        end );
    deduped_19_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
            deduped_10_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            deduped_9_2 := deduped_2_1[deduped_10_2];
            deduped_8_2 := [ 1 .. deduped_8_1[deduped_10_2] ];
            deduped_3_2 := NTuple( 2, [ CAP_JIT_INCOMPLETE_LOGIC( CreateCapCategoryMorphismWithAttributes( deduped_35_1, deduped_9_2, deduped_9_2, UnderlyingGroupElement, deduped_18_1 ) ) ], deduped_10_2 );
            deduped_2_2 := deduped_15_1[deduped_10_2];
            hoisted_7_2 := CAP_JIT_INCOMPLETE_LOGIC( List( deduped_8_2, function ( o_3 )
                      return List( Iterated( deduped_2_2[o_3][2], function ( eval_c_4, pair_4 )
                                  local deduped_1_4, deduped_2_4, deduped_3_4, deduped_4_4, deduped_5_4;
                                  deduped_5_4 := pair_4[2];
                                  deduped_4_4 := eval_c_4[2];
                                  deduped_3_4 := pair_4[1];
                                  deduped_2_4 := eval_c_4[1];
                                  deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( deduped_2_4[deduped_3_4] );
                                  return NTuple( 2, Concatenation( deduped_2_4, [ CreateCapCategoryMorphismWithAttributes( deduped_35_1, CAP_JIT_INCOMPLETE_LOGIC( Source( deduped_1_4 ) ), deduped_16_1[deduped_4_4][deduped_5_4][deduped_3_4], UnderlyingGroupElement, MultiplyGroupElements( CAP_JIT_INCOMPLETE_LOGIC( UnderlyingGroupElement( deduped_1_4 ) ), deduped_17_1[deduped_4_4][deduped_5_4][deduped_3_4] ) ) ] ), deduped_4_4 );
                              end, deduped_3_2 )[1], function ( logic_new_func_x_4 )
                              return InverseImmutable( UnderlyingGroupElement( logic_new_func_x_4 ) );
                          end );
                  end ) );
            hoisted_6_2 := deduped_17_1[c_2];
            hoisted_5_2 := deduped_15_1[c_2];
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( deduped_8_2, function ( o_3 )
                      return List( Iterated( deduped_2_2[o_3][2], function ( eval_c_4, pair_4 )
                                  local deduped_1_4, deduped_2_4, deduped_3_4, deduped_4_4, deduped_5_4;
                                  deduped_5_4 := pair_4[2];
                                  deduped_4_4 := eval_c_4[2];
                                  deduped_3_4 := pair_4[1];
                                  deduped_2_4 := eval_c_4[1];
                                  deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( deduped_2_4[deduped_3_4] );
                                  return NTuple( 2, Concatenation( deduped_2_4, [ CreateCapCategoryMorphismWithAttributes( deduped_35_1, CAP_JIT_INCOMPLETE_LOGIC( Source( deduped_1_4 ) ), deduped_16_1[deduped_4_4][deduped_5_4][deduped_3_4], UnderlyingGroupElement, MultiplyGroupElements( CAP_JIT_INCOMPLETE_LOGIC( UnderlyingGroupElement( deduped_1_4 ) ), deduped_17_1[deduped_4_4][deduped_5_4][deduped_3_4] ) ) ] ), deduped_4_4 );
                              end, deduped_3_2 )[1], UnderlyingGroupElement );
                  end ) );
            hoisted_1_2 := deduped_11_1[c_2];
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3;
                    deduped_4_3 := hoisted_1_2[o_3];
                    hoisted_3_3 := hoisted_7_2[o_3];
                    hoisted_2_3 := hoisted_4_2[o_3];
                    hoisted_1_3 := hoisted_5_2[o_3][3];
                    return List( [ 1 .. deduped_4_3 * deduped_38_1 - (deduped_4_3 - 1) ], function ( j_4 )
                            local deduped_1_4, deduped_2_4;
                            deduped_2_4 := hoisted_1_3[j_4];
                            deduped_1_4 := deduped_2_4[1];
                            return MultiplyGroupElements( MultiplyGroupElements( hoisted_2_3[deduped_1_4], hoisted_6_2[deduped_2_4[2]][deduped_1_4] ), MultiplyGroupElements( deduped_18_1, hoisted_3_3[deduped_2_4[3]] ) );
                        end );
                end );
        end );
    deduped_13_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_11_1[c_2];
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    local deduped_1_3;
                    deduped_1_3 := hoisted_1_2[o_3];
                    return deduped_1_3 * deduped_38_1 - (deduped_1_3 - 1);
                end );
        end );
    deduped_10_1 := List( deduped_39_1, GeneratorsOfMagmaWithInverses );
    deduped_9_1 := CardinalitiesOfObjects( deduped_35_1 );
    deduped_33_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_3_2 := deduped_10_1[deduped_5_2];
            hoisted_2_2 := deduped_19_1[deduped_5_2];
            hoisted_1_2 := deduped_13_1[deduped_5_2];
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_8_1[deduped_5_2] ], function ( o_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_4_3;
                      hoisted_1_3 := hoisted_2_2[o_3];
                      deduped_4_3 := SubmagmaWithInverses( deduped_40_1, Concatenation( hoisted_3_2, List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                                  return hoisted_1_3[i_4];
                              end ) ) );
                      hoisted_2_3 := Index( deduped_40_1, deduped_4_3 );
                      return SafeFirst( Filtered( deduped_36_1, function ( i_4 )
                                return deduped_9_1[i_4] = hoisted_2_3;
                            end ), function ( c_4 )
                              return IsConjugate( deduped_40_1, deduped_4_3, deduped_39_1[c_4] );
                          end );
                  end ) );
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_4_2[o_3];
                    return SafePositionProperty( deduped_36_1, function ( d_4 )
                            return hoisted_1_3 = d_4;
                        end );
                end );
        end );
    deduped_22_1 := Concatenation( deduped_33_1 );
    deduped_34_1 := List( deduped_36_1, function ( c_2 )
            return Number( deduped_22_1, function ( i_3 )
                    return i_3 = c_2;
                end );
        end );
    hoisted_31_1 := deduped_41_1[2];
    hoisted_30_1 := PairOfSumAndListOfMultiplicities( Source( tau_1 ) )[2];
    hoisted_32_1 := List( deduped_36_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_31_1[o_2];
            return List( [ 1 .. hoisted_30_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    deduped_25_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_33_1[c_2];
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_8_1{[ 1 .. CAP_JIT_INCOMPLETE_LOGIC( c_2 ) - 1 ]} ) );
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    return Number( deduped_22_1{[ 1 .. hoisted_1_2 + o_3 ]}, function ( i_4 )
                            return i_4 = hoisted_1_3;
                        end );
                end );
        end );
    deduped_26_1 := List( deduped_36_1, function ( c_2 )
            return List( [ 1 .. deduped_34_1[c_2] ], function ( i_3 )
                    return SafeFirst( deduped_36_1, function ( d_4 )
                            return c_2 in deduped_33_1[d_4] and i_3 in deduped_25_1[d_4];
                        end );
                end );
        end );
    deduped_28_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_26_1[c_2];
            return List( [ 1 .. deduped_34_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_3_3;
                    deduped_3_3 := hoisted_1_2[i_3];
                    hoisted_2_3 := deduped_25_1[deduped_3_3];
                    hoisted_1_3 := deduped_33_1[deduped_3_3];
                    return SafeFirst( [ 1 .. deduped_8_1[deduped_3_3] ], function ( j_4 )
                            return hoisted_1_3[j_4] = c_2 and hoisted_2_3[j_4] = i_3;
                        end );
                end );
        end );
    deduped_29_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_28_1[c_2];
            hoisted_1_2 := deduped_26_1[c_2];
            return List( [ 1 .. deduped_34_1[c_2] ], function ( i_3 )
                    return deduped_14_1[hoisted_1_2[i_3]][hoisted_2_2[i_3]][1];
                end );
        end );
    deduped_27_1 := deduped_41_1[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, PairOfSumAndListOfMultiplicities, NTuple( 2, Sum( deduped_34_1 ), deduped_34_1 ) ), T_1, PairOfLists, NTuple( 2, List( deduped_36_1, function ( c_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := [ 1 .. deduped_34_1[c_2] ];
                deduped_2_2 := deduped_29_1[c_2];
                deduped_1_2 := deduped_26_1[c_2];
                return NTuple( 2, List( deduped_3_2, function ( i_3 )
                          return deduped_27_1[deduped_1_2[i_3]][1][deduped_2_2[i_3]];
                      end ), List( deduped_3_2, function ( i_3 )
                          return deduped_27_1[deduped_1_2[i_3]][2][deduped_2_2[i_3]];
                      end ) );
            end ), List( deduped_36_1, function ( o_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2;
                deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( o_2 );
                hoisted_3_2 := deduped_29_1[deduped_5_2];
                hoisted_2_2 := deduped_28_1[deduped_5_2];
                hoisted_1_2 := deduped_26_1[deduped_5_2];
                hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_34_1[deduped_5_2] ], function ( i_3 )
                          local hoisted_1_3, hoisted_2_3, deduped_4_3, deduped_5_3, deduped_6_3;
                          deduped_6_3 := hoisted_2_2[i_3];
                          deduped_5_3 := hoisted_1_2[i_3];
                          hoisted_1_3 := deduped_19_1[deduped_5_3][deduped_6_3];
                          deduped_4_3 := SubmagmaWithInverses( deduped_40_1, Concatenation( deduped_10_1[deduped_5_3], List( [ 1 .. deduped_13_1[deduped_5_3][deduped_6_3] ], function ( i_4 )
                                      return hoisted_1_3[i_4];
                                  end ) ) );
                          hoisted_2_3 := Index( deduped_40_1, deduped_4_3 );
                          return MultiplyGroupElements( InverseImmutable( RepresentativeAction( deduped_40_1, deduped_4_3, deduped_39_1[SafeFirst( Filtered( deduped_36_1, function ( i_4 )
                                           return deduped_9_1[i_4] = hoisted_2_3;
                                       end ), function ( c_4 )
                                         return IsConjugate( deduped_40_1, deduped_4_3, deduped_39_1[c_4] );
                                     end )] ) ), hoisted_32_1[deduped_5_3][hoisted_3_2[i_3]] );
                      end ) );
                return List( [ 1 .. deduped_34_1[o_2] ], function ( i_3 )
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
    local deduped_2_1, hoisted_4_1, deduped_5_1, deduped_7_1, deduped_8_1, hoisted_9_1, deduped_10_1, deduped_11_1, deduped_12_1, hoisted_13_1, deduped_14_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, hoisted_23_1, hoisted_24_1, deduped_25_1, hoisted_28_1, deduped_29_1, hoisted_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1;
    deduped_50_1 := PairOfLists( tau_1 );
    deduped_49_1 := UnderlyingGroup( cat_1 );
    deduped_48_1 := RepresentativesOfSubgroupsUpToConjugation( cat_1 );
    deduped_47_1 := Length( automorphisms_1 );
    deduped_46_1 := [ 1 .. deduped_47_1 ];
    deduped_45_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    deduped_44_1 := UnderlyingCategory( ModelingCategory( cat_1 ) );
    deduped_21_1 := OneImmutable( deduped_49_1 );
    deduped_2_1 := List( deduped_45_1, function ( i_2 )
            return CreateCapCategoryObjectWithAttributes( deduped_44_1, ObjectNumber, i_2 );
        end );
    deduped_22_1 := List( deduped_45_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_2_1[c_2];
            return CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_1_2, deduped_1_2, UnderlyingGroupElement, deduped_21_1 );
        end );
    hoisted_4_1 := List( automorphisms_1, function ( x_2 )
            local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := PairOfLists( x_2 );
            deduped_7_2 := deduped_8_2[1];
            hoisted_6_2 := deduped_8_2[2];
            hoisted_3_2 := PairOfSumAndListOfMultiplicities( Range( x_2 ) )[2];
            hoisted_5_2 := List( deduped_45_1, function ( o_3 )
                    return ListWithIdenticalEntries( hoisted_3_2[o_3], deduped_2_1[o_3] );
                end );
            deduped_1_2 := PairOfSumAndListOfMultiplicities( Source( x_2 ) )[2];
            hoisted_2_2 := List( deduped_45_1, function ( o_3 )
                    return ListWithIdenticalEntries( deduped_1_2[o_3], deduped_2_1[o_3] );
                end );
            return NTuple( 2, deduped_7_2, List( deduped_45_1, function ( o_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3;
                      deduped_5_3 := deduped_7_2[o_3];
                      hoisted_4_3 := hoisted_6_2[o_3];
                      hoisted_3_3 := deduped_5_3[2];
                      hoisted_2_3 := deduped_5_3[1];
                      hoisted_1_3 := hoisted_2_2[o_3];
                      return List( [ 1 .. deduped_1_2[o_3] ], function ( i_4 )
                              return CreateCapCategoryMorphismWithAttributes( deduped_44_1, hoisted_1_3[i_4], hoisted_5_2[1 + hoisted_2_3[i_4]][1 + hoisted_3_3[i_4]], UnderlyingGroupElement, hoisted_4_3[i_4] );
                          end );
                  end ) );
        end );
    deduped_5_1 := List( deduped_46_1, function ( r_2 )
            return hoisted_4_1[r_2];
        end );
    deduped_20_1 := List( deduped_45_1, function ( c_2 )
            return List( deduped_46_1, function ( r_3 )
                    return List( deduped_5_1[r_3][2], function ( logic_new_func_list_4 )
                              return List( logic_new_func_list_4, UnderlyingGroupElement );
                          end )[c_2];
                end );
        end );
    deduped_19_1 := List( deduped_45_1, function ( c_2 )
            return List( deduped_46_1, function ( r_3 )
                    return List( deduped_5_1[r_3][2], function ( logic_new_func_list_4 )
                              return List( logic_new_func_list_4, Range );
                          end )[c_2];
                end );
        end );
    deduped_8_1 := PairOfSumAndListOfMultiplicities( Y_1 )[2];
    deduped_7_1 := List( deduped_45_1, function ( c_2 )
            return List( deduped_46_1, function ( r_3 )
                    return PermList( List( deduped_5_1[r_3][1][c_2][2], function ( i_4 )
                              return 1 + i_4;
                          end ) );
                end );
        end );
    deduped_17_1 := List( deduped_45_1, function ( c_2 )
            return OrbitsPerms( deduped_7_1[c_2], [ 1 .. deduped_8_1[c_2] ] );
        end );
    hoisted_13_1 := List( deduped_45_1, function ( c_2 )
            return List( OrbitsPerms( deduped_7_1[c_2], [ 1 .. deduped_8_1[c_2] ] ), Length );
        end );
    hoisted_9_1 := List( deduped_45_1, function ( c_2 )
            return Length( OrbitsPerms( deduped_7_1[c_2], [ 1 .. deduped_8_1[c_2] ] ) );
        end );
    deduped_10_1 := List( deduped_45_1, function ( c_2 )
            return hoisted_9_1[c_2];
        end );
    deduped_14_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_13_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    return hoisted_1_2[o_3];
                end );
        end );
    deduped_18_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_7_1[c_2];
            hoisted_2_2 := deduped_14_1[c_2];
            hoisted_1_2 := deduped_17_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    return SchreierSimsOnASingleOrbit( hoisted_3_2, deduped_47_1, hoisted_1_2[o_3][1], hoisted_2_2[o_3] );
                end );
        end );
    hoisted_24_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := NTuple( 2, [ deduped_22_1[c_2] ], c_2 );
            hoisted_1_2 := deduped_18_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    return List( Iterated( hoisted_1_2[o_3][2], function ( eval_c_4, pair_4 )
                                local deduped_1_4, deduped_2_4, deduped_3_4, deduped_4_4;
                                deduped_4_4 := pair_4[2];
                                deduped_3_4 := eval_c_4[2];
                                deduped_2_4 := pair_4[1];
                                deduped_1_4 := eval_c_4[1];
                                return NTuple( 2, Concatenation( deduped_1_4, [ CreateCapCategoryMorphismWithAttributes( deduped_44_1, List( deduped_1_4, Source )[deduped_2_4], deduped_19_1[deduped_3_4][deduped_4_4][deduped_2_4], UnderlyingGroupElement, MultiplyGroupElements( List( deduped_1_4, UnderlyingGroupElement )[deduped_2_4], deduped_20_1[deduped_3_4][deduped_4_4][deduped_2_4] ) ) ] ), deduped_3_4 );
                            end, hoisted_2_2 )[1], function ( logic_new_func_x_4 )
                            return InverseImmutable( UnderlyingGroupElement( logic_new_func_x_4 ) );
                        end );
                end );
        end );
    hoisted_23_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := NTuple( 2, [ deduped_22_1[c_2] ], c_2 );
            hoisted_1_2 := deduped_18_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    return List( Iterated( hoisted_1_2[o_3][2], function ( eval_c_4, pair_4 )
                                local deduped_1_4, deduped_2_4, deduped_3_4, deduped_4_4;
                                deduped_4_4 := pair_4[2];
                                deduped_3_4 := eval_c_4[2];
                                deduped_2_4 := pair_4[1];
                                deduped_1_4 := eval_c_4[1];
                                return NTuple( 2, Concatenation( deduped_1_4, [ CreateCapCategoryMorphismWithAttributes( deduped_44_1, List( deduped_1_4, Source )[deduped_2_4], deduped_19_1[deduped_3_4][deduped_4_4][deduped_2_4], UnderlyingGroupElement, MultiplyGroupElements( List( deduped_1_4, UnderlyingGroupElement )[deduped_2_4], deduped_20_1[deduped_3_4][deduped_4_4][deduped_2_4] ) ) ] ), deduped_3_4 );
                            end, hoisted_2_2 )[1], UnderlyingGroupElement );
                end );
        end );
    deduped_25_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2;
            hoisted_5_2 := hoisted_24_1[c_2];
            hoisted_4_2 := deduped_20_1[c_2];
            hoisted_3_2 := deduped_18_1[c_2];
            hoisted_2_2 := hoisted_23_1[c_2];
            hoisted_1_2 := deduped_14_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3;
                    deduped_4_3 := hoisted_1_2[o_3];
                    hoisted_3_3 := hoisted_5_2[o_3];
                    hoisted_2_3 := hoisted_2_2[o_3];
                    hoisted_1_3 := hoisted_3_2[o_3][3];
                    return List( [ 1 .. deduped_4_3 * deduped_47_1 - (deduped_4_3 - 1) ], function ( j_4 )
                            local deduped_1_4, deduped_2_4;
                            deduped_2_4 := hoisted_1_3[j_4];
                            deduped_1_4 := deduped_2_4[1];
                            return MultiplyGroupElements( MultiplyGroupElements( hoisted_2_3[deduped_1_4], hoisted_4_2[deduped_2_4[2]][deduped_1_4] ), MultiplyGroupElements( deduped_21_1, hoisted_3_3[deduped_2_4[3]] ) );
                        end );
                end );
        end );
    deduped_16_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_14_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    local deduped_1_3;
                    deduped_1_3 := hoisted_1_2[o_3];
                    return deduped_1_3 * deduped_47_1 - (deduped_1_3 - 1);
                end );
        end );
    deduped_12_1 := List( deduped_48_1, GeneratorsOfMagmaWithInverses );
    deduped_11_1 := CardinalitiesOfObjects( deduped_44_1 );
    hoisted_28_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_12_1[c_2];
            hoisted_2_2 := deduped_25_1[c_2];
            hoisted_1_2 := deduped_16_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_4_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    deduped_4_3 := SubmagmaWithInverses( deduped_49_1, Concatenation( hoisted_3_2, List( [ 1 .. hoisted_1_2[o_3] ], function ( i_4 )
                                return hoisted_1_3[i_4];
                            end ) ) );
                    hoisted_2_3 := Index( deduped_49_1, deduped_4_3 );
                    return SafeFirst( Filtered( deduped_45_1, function ( i_4 )
                              return deduped_11_1[i_4] = hoisted_2_3;
                          end ), function ( c_4 )
                            return IsConjugate( deduped_49_1, deduped_4_3, deduped_48_1[c_4] );
                        end );
                end );
        end );
    deduped_42_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_28_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_1_2[o_3];
                    return SafePositionProperty( deduped_45_1, function ( d_4 )
                            return hoisted_1_3 = d_4;
                        end );
                end );
        end );
    deduped_29_1 := Concatenation( deduped_42_1 );
    deduped_43_1 := List( deduped_45_1, function ( c_2 )
            return Number( deduped_29_1, function ( i_3 )
                    return i_3 = c_2;
                end );
        end );
    hoisted_39_1 := deduped_50_1[2];
    hoisted_38_1 := PairOfSumAndListOfMultiplicities( Source( tau_1 ) )[2];
    hoisted_40_1 := List( deduped_45_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_39_1[o_2];
            return List( [ 1 .. hoisted_38_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    hoisted_32_1 := List( deduped_45_1, function ( c_2 )
            return Sum( deduped_10_1{[ 1 .. c_2 - 1 ]} );
        end );
    deduped_33_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_42_1[c_2];
            hoisted_1_2 := hoisted_32_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    return Number( deduped_29_1{[ 1 .. hoisted_1_2 + o_3 ]}, function ( i_4 )
                            return i_4 = hoisted_1_3;
                        end );
                end );
        end );
    deduped_34_1 := List( deduped_45_1, function ( c_2 )
            return List( [ 1 .. deduped_43_1[c_2] ], function ( i_3 )
                    return SafeFirst( deduped_45_1, function ( d_4 )
                            return c_2 in deduped_42_1[d_4] and i_3 in deduped_33_1[d_4];
                        end );
                end );
        end );
    deduped_36_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_34_1[c_2];
            return List( [ 1 .. deduped_43_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_3_3;
                    deduped_3_3 := hoisted_1_2[i_3];
                    hoisted_2_3 := deduped_33_1[deduped_3_3];
                    hoisted_1_3 := deduped_42_1[deduped_3_3];
                    return SafeFirst( [ 1 .. deduped_10_1[deduped_3_3] ], function ( j_4 )
                            return hoisted_1_3[j_4] = c_2 and hoisted_2_3[j_4] = i_3;
                        end );
                end );
        end );
    deduped_37_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_36_1[c_2];
            hoisted_1_2 := deduped_34_1[c_2];
            return List( [ 1 .. deduped_43_1[c_2] ], function ( i_3 )
                    return deduped_17_1[hoisted_1_2[i_3]][hoisted_2_2[i_3]][1];
                end );
        end );
    hoisted_41_1 := List( deduped_45_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_37_1[c_2];
            hoisted_2_2 := deduped_36_1[c_2];
            hoisted_1_2 := deduped_34_1[c_2];
            return List( [ 1 .. deduped_43_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_4_3, deduped_5_3, deduped_6_3;
                    deduped_6_3 := hoisted_2_2[i_3];
                    deduped_5_3 := hoisted_1_2[i_3];
                    hoisted_1_3 := deduped_25_1[deduped_5_3][deduped_6_3];
                    deduped_4_3 := SubmagmaWithInverses( deduped_49_1, Concatenation( deduped_12_1[deduped_5_3], List( [ 1 .. deduped_16_1[deduped_5_3][deduped_6_3] ], function ( i_4 )
                                return hoisted_1_3[i_4];
                            end ) ) );
                    hoisted_2_3 := Index( deduped_49_1, deduped_4_3 );
                    return MultiplyGroupElements( InverseImmutable( RepresentativeAction( deduped_49_1, deduped_4_3, deduped_48_1[SafeFirst( Filtered( deduped_45_1, function ( i_4 )
                                     return deduped_11_1[i_4] = hoisted_2_3;
                                 end ), function ( c_4 )
                                   return IsConjugate( deduped_49_1, deduped_4_3, deduped_48_1[c_4] );
                               end )] ) ), hoisted_40_1[deduped_5_3][hoisted_3_2[i_3]] );
                end );
        end );
    deduped_35_1 := deduped_50_1[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, PairOfSumAndListOfMultiplicities, NTuple( 2, Sum( deduped_43_1 ), deduped_43_1 ) ), T_1, PairOfLists, NTuple( 2, List( deduped_45_1, function ( c_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := [ 1 .. deduped_43_1[c_2] ];
                deduped_2_2 := deduped_37_1[c_2];
                deduped_1_2 := deduped_34_1[c_2];
                return NTuple( 2, List( deduped_3_2, function ( i_3 )
                          return deduped_35_1[deduped_1_2[i_3]][1][deduped_2_2[i_3]];
                      end ), List( deduped_3_2, function ( i_3 )
                          return deduped_35_1[deduped_1_2[i_3]][2][deduped_2_2[i_3]];
                      end ) );
            end ), List( deduped_45_1, function ( o_2 )
                local hoisted_1_2;
                hoisted_1_2 := hoisted_41_1[o_2];
                return List( [ 1 .. deduped_43_1[o_2] ], function ( i_3 )
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
