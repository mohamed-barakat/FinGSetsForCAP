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
    local deduped_2_1, hoisted_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_13_1, hoisted_14_1, deduped_15_1, deduped_16_1, deduped_18_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1;
    deduped_36_1 := PairOfLists( tau_1 );
    deduped_35_1 := RepresentativesOfSubgroupsUpToConjugation( cat_1 );
    deduped_34_1 := ModelingCategory( cat_1 );
    deduped_33_1 := [ 1 .. Length( automorphisms_1 ) ];
    deduped_32_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    deduped_31_1 := UnderlyingCategory( deduped_34_1 );
    deduped_16_1 := UnderlyingGroup( cat_1 );
    deduped_2_1 := List( deduped_32_1, function ( i_2 )
            return CreateCapCategoryObjectWithAttributes( deduped_31_1, ObjectNumber, i_2 );
        end );
    hoisted_14_1 := List( automorphisms_1, function ( x_2 )
            local deduped_1_2, hoisted_2_2, hoisted_4_2, hoisted_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2;
            deduped_9_2 := PairOfLists( x_2 );
            deduped_8_2 := deduped_9_2[1];
            deduped_7_2 := PairOfSumAndListOfMultiplicities( Range( x_2 ) );
            deduped_6_2 := PairOfSumAndListOfMultiplicities( Source( x_2 ) );
            hoisted_5_2 := deduped_9_2[2];
            hoisted_2_2 := deduped_7_2[2];
            hoisted_4_2 := List( deduped_32_1, function ( o_3 )
                    return ListWithIdenticalEntries( hoisted_2_2[o_3], deduped_2_1[o_3] );
                end );
            deduped_1_2 := deduped_6_2[2];
            return CreateCapCategoryMorphismWithAttributes( deduped_34_1, CreateCapCategoryObjectWithAttributes( deduped_34_1, PairOfIntAndList, deduped_6_2 ), CreateCapCategoryObjectWithAttributes( deduped_34_1, PairOfIntAndList, deduped_7_2 ), PairOfLists, NTuple( 2, deduped_8_2, List( deduped_32_1, function ( o_3 )
                        local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3, deduped_6_3;
                        deduped_6_3 := deduped_8_2[o_3];
                        deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( o_3 );
                        hoisted_4_3 := hoisted_5_2[o_3];
                        hoisted_3_3 := deduped_6_3[2];
                        hoisted_2_3 := deduped_6_3[1];
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( ListWithIdenticalEntries( deduped_1_2[deduped_5_3], deduped_2_1[deduped_5_3] ) );
                        return List( [ 1 .. deduped_1_2[o_3] ], function ( i_4 )
                                return CreateCapCategoryMorphismWithAttributes( deduped_31_1, hoisted_1_3[i_4], hoisted_4_2[1 + hoisted_2_3[i_4]][1 + hoisted_3_3[i_4]], UnderlyingGroupElement, hoisted_4_3[i_4] );
                            end );
                    end ) ) );
        end );
    deduped_7_1 := PairOfSumAndListOfMultiplicities( Y_1 )[2];
    hoisted_4_1 := List( deduped_33_1, function ( r_2 )
            local deduped_1_2, hoisted_2_2, hoisted_4_2, hoisted_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := CAP_JIT_INCOMPLETE_LOGIC( automorphisms_1[r_2] );
            deduped_7_2 := PairOfLists( deduped_8_2 );
            deduped_6_2 := deduped_7_2[1];
            hoisted_5_2 := deduped_7_2[2];
            hoisted_2_2 := PairOfSumAndListOfMultiplicities( Range( deduped_8_2 ) )[2];
            hoisted_4_2 := List( deduped_32_1, function ( o_3 )
                    return ListWithIdenticalEntries( hoisted_2_2[o_3], deduped_2_1[o_3] );
                end );
            deduped_1_2 := PairOfSumAndListOfMultiplicities( Source( deduped_8_2 ) )[2];
            return CAP_JIT_INCOMPLETE_LOGIC( NTuple( 2, deduped_6_2, List( deduped_32_1, function ( o_3 )
                        local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3, deduped_6_3;
                        deduped_6_3 := deduped_6_2[o_3];
                        deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( o_3 );
                        hoisted_4_3 := hoisted_5_2[o_3];
                        hoisted_3_3 := deduped_6_3[2];
                        hoisted_2_3 := deduped_6_3[1];
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( ListWithIdenticalEntries( deduped_1_2[deduped_5_3], deduped_2_1[deduped_5_3] ) );
                        return List( [ 1 .. deduped_1_2[o_3] ], function ( i_4 )
                                return CreateCapCategoryMorphismWithAttributes( deduped_31_1, hoisted_1_3[i_4], hoisted_4_2[1 + hoisted_2_3[i_4]][1 + hoisted_3_3[i_4]], UnderlyingGroupElement, hoisted_4_3[i_4] );
                            end );
                    end ) ) );
        end );
    deduped_6_1 := List( deduped_32_1, function ( c_2 )
            return List( deduped_33_1, function ( r_3 )
                    return PermList( List( hoisted_4_1[r_3][1][c_2][2], function ( i_4 )
                              return 1 + i_4;
                          end ) );
                end );
        end );
    deduped_13_1 := List( deduped_32_1, function ( c_2 )
            return OrbitsPerms( deduped_6_1[c_2], [ 1 .. deduped_7_1[c_2] ] );
        end );
    deduped_8_1 := List( deduped_32_1, function ( c_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Length( OrbitsPerms( deduped_6_1[deduped_1_2], [ 1 .. deduped_7_1[deduped_1_2] ] ) ) );
        end );
    deduped_15_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( List( OrbitsPerms( deduped_6_1[deduped_3_2], [ 1 .. deduped_7_1[deduped_3_2] ] ), Length ) );
            hoisted_1_2 := deduped_13_1[c_2];
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    return SchreierSimsOnASingleOrbit( deduped_34_1, hoisted_14_1, c_2, hoisted_1_2[o_3][1], hoisted_2_2[o_3] );
                end );
        end );
    deduped_11_1 := List( deduped_35_1, GeneratorsOfMagmaWithInverses );
    deduped_10_1 := List( SetOfObjectsOfUnderlyingCategory( deduped_34_1 ), ObjectNumber );
    deduped_9_1 := CardinalitiesOfObjects( deduped_31_1 );
    deduped_29_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( c_2 );
            hoisted_2_2 := deduped_11_1[deduped_10_1[deduped_4_2]];
            hoisted_1_2 := deduped_15_1[deduped_4_2];
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_8_1[deduped_4_2] ], function ( o_3 )
                      local hoisted_2_3, deduped_4_3, deduped_5_3;
                      deduped_5_3 := hoisted_1_2[o_3][4];
                      deduped_4_3 := SubmagmaWithInverses( deduped_16_1, Concatenation( hoisted_2_2, List( [ 1 .. Length( deduped_5_3 ) ], function ( i_4 )
                                  return CAP_JIT_INCOMPLETE_LOGIC( UnderlyingGroupElement( CAP_JIT_INCOMPLETE_LOGIC( deduped_5_3[i_4] ) ) );
                              end ) ) );
                      hoisted_2_3 := Index( deduped_16_1, deduped_4_3 );
                      return SafeFirst( Filtered( deduped_32_1, function ( i_4 )
                                return deduped_9_1[i_4] = hoisted_2_3;
                            end ), function ( c_4 )
                              return IsConjugate( deduped_16_1, deduped_4_3, deduped_35_1[c_4] );
                          end );
                  end ) );
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_3_2[o_3];
                    return SafePositionProperty( deduped_32_1, function ( d_4 )
                            return hoisted_1_3 = deduped_10_1[d_4];
                        end );
                end );
        end );
    deduped_18_1 := Concatenation( deduped_29_1 );
    deduped_30_1 := List( deduped_32_1, function ( c_2 )
            return Number( deduped_18_1, function ( i_3 )
                    return i_3 = c_2;
                end );
        end );
    hoisted_27_1 := deduped_36_1[2];
    hoisted_26_1 := PairOfSumAndListOfMultiplicities( Source( tau_1 ) )[2];
    hoisted_28_1 := List( deduped_32_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_27_1[o_2];
            return List( [ 1 .. hoisted_26_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    deduped_21_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_29_1[c_2];
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_8_1{[ 1 .. CAP_JIT_INCOMPLETE_LOGIC( c_2 ) - 1 ]} ) );
            return List( [ 1 .. deduped_8_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    return Number( deduped_18_1{[ 1 .. hoisted_1_2 + o_3 ]}, function ( i_4 )
                            return i_4 = hoisted_1_3;
                        end );
                end );
        end );
    deduped_22_1 := List( deduped_32_1, function ( c_2 )
            return List( [ 1 .. deduped_30_1[c_2] ], function ( i_3 )
                    return SafeFirst( deduped_32_1, function ( d_4 )
                            return c_2 in deduped_29_1[d_4] and i_3 in deduped_21_1[d_4];
                        end );
                end );
        end );
    deduped_24_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_22_1[c_2];
            return List( [ 1 .. deduped_30_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_3_3;
                    deduped_3_3 := hoisted_1_2[i_3];
                    hoisted_2_3 := deduped_21_1[deduped_3_3];
                    hoisted_1_3 := deduped_29_1[deduped_3_3];
                    return SafeFirst( [ 1 .. deduped_8_1[deduped_3_3] ], function ( j_4 )
                            return hoisted_1_3[j_4] = c_2 and hoisted_2_3[j_4] = i_3;
                        end );
                end );
        end );
    deduped_25_1 := List( deduped_32_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_24_1[c_2];
            hoisted_1_2 := deduped_22_1[c_2];
            return List( [ 1 .. deduped_30_1[c_2] ], function ( i_3 )
                    return deduped_13_1[hoisted_1_2[i_3]][hoisted_2_2[i_3]][1];
                end );
        end );
    deduped_23_1 := deduped_36_1[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, PairOfSumAndListOfMultiplicities, NTuple( 2, Sum( deduped_30_1 ), deduped_30_1 ) ), T_1, PairOfLists, NTuple( 2, List( deduped_32_1, function ( c_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := [ 1 .. deduped_30_1[c_2] ];
                deduped_2_2 := deduped_25_1[c_2];
                deduped_1_2 := deduped_22_1[c_2];
                return NTuple( 2, List( deduped_3_2, function ( i_3 )
                          return deduped_23_1[deduped_1_2[i_3]][1][deduped_2_2[i_3]];
                      end ), List( deduped_3_2, function ( i_3 )
                          return deduped_23_1[deduped_1_2[i_3]][2][deduped_2_2[i_3]];
                      end ) );
            end ), List( deduped_32_1, function ( o_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2;
                deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( o_2 );
                hoisted_3_2 := deduped_25_1[deduped_5_2];
                hoisted_2_2 := deduped_24_1[deduped_5_2];
                hoisted_1_2 := deduped_22_1[deduped_5_2];
                hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. deduped_30_1[deduped_5_2] ], function ( i_3 )
                          local hoisted_2_3, deduped_4_3, deduped_5_3, deduped_6_3;
                          deduped_6_3 := hoisted_1_2[i_3];
                          deduped_5_3 := deduped_15_1[deduped_6_3][hoisted_2_2[i_3]][4];
                          deduped_4_3 := SubmagmaWithInverses( deduped_16_1, Concatenation( deduped_11_1[deduped_10_1[deduped_6_3]], List( [ 1 .. Length( deduped_5_3 ) ], function ( i_4 )
                                      return CAP_JIT_INCOMPLETE_LOGIC( UnderlyingGroupElement( CAP_JIT_INCOMPLETE_LOGIC( deduped_5_3[i_4] ) ) );
                                  end ) ) );
                          hoisted_2_3 := Index( deduped_16_1, deduped_4_3 );
                          return MultiplyGroupElements( InverseImmutable( RepresentativeAction( deduped_16_1, deduped_4_3, deduped_35_1[SafeFirst( Filtered( deduped_32_1, function ( i_4 )
                                           return deduped_9_1[i_4] = hoisted_2_3;
                                       end ), function ( c_4 )
                                         return IsConjugate( deduped_16_1, deduped_4_3, deduped_35_1[c_4] );
                                     end )] ) ), hoisted_28_1[deduped_6_3][hoisted_3_2[i_3]] );
                      end ) );
                return List( [ 1 .. deduped_30_1[o_2] ], function ( i_3 )
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
    local deduped_2_1, hoisted_4_1, hoisted_5_1, deduped_7_1, deduped_8_1, hoisted_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, deduped_19_1, hoisted_21_1, deduped_22_1, hoisted_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1;
    deduped_42_1 := PairOfLists( tau_1 );
    deduped_41_1 := RepresentativesOfSubgroupsUpToConjugation( cat_1 );
    deduped_40_1 := ModelingCategory( cat_1 );
    deduped_39_1 := [ 1 .. Length( automorphisms_1 ) ];
    deduped_38_1 := [ 1 .. NumberOfTransitiveGSets( cat_1 ) ];
    deduped_37_1 := UnderlyingCategory( deduped_40_1 );
    deduped_19_1 := UnderlyingGroup( cat_1 );
    deduped_2_1 := List( deduped_38_1, function ( i_2 )
            return CreateCapCategoryObjectWithAttributes( deduped_37_1, ObjectNumber, i_2 );
        end );
    hoisted_17_1 := List( automorphisms_1, function ( x_2 )
            local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
            deduped_10_2 := PairOfLists( x_2 );
            deduped_9_2 := deduped_10_2[1];
            deduped_8_2 := PairOfSumAndListOfMultiplicities( Range( x_2 ) );
            deduped_7_2 := PairOfSumAndListOfMultiplicities( Source( x_2 ) );
            hoisted_6_2 := deduped_10_2[2];
            hoisted_3_2 := deduped_8_2[2];
            hoisted_5_2 := List( deduped_38_1, function ( o_3 )
                    return ListWithIdenticalEntries( hoisted_3_2[o_3], deduped_2_1[o_3] );
                end );
            deduped_1_2 := deduped_7_2[2];
            hoisted_2_2 := List( deduped_38_1, function ( o_3 )
                    return ListWithIdenticalEntries( deduped_1_2[o_3], deduped_2_1[o_3] );
                end );
            return CreateCapCategoryMorphismWithAttributes( deduped_40_1, CreateCapCategoryObjectWithAttributes( deduped_40_1, PairOfIntAndList, deduped_7_2 ), CreateCapCategoryObjectWithAttributes( deduped_40_1, PairOfIntAndList, deduped_8_2 ), PairOfLists, NTuple( 2, deduped_9_2, List( deduped_38_1, function ( o_3 )
                        local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3;
                        deduped_5_3 := deduped_9_2[o_3];
                        hoisted_4_3 := hoisted_6_2[o_3];
                        hoisted_3_3 := deduped_5_3[2];
                        hoisted_2_3 := deduped_5_3[1];
                        hoisted_1_3 := hoisted_2_2[o_3];
                        return List( [ 1 .. deduped_1_2[o_3] ], function ( i_4 )
                                return CreateCapCategoryMorphismWithAttributes( deduped_37_1, hoisted_1_3[i_4], hoisted_5_2[1 + hoisted_2_3[i_4]][1 + hoisted_3_3[i_4]], UnderlyingGroupElement, hoisted_4_3[i_4] );
                            end );
                    end ) ) );
        end );
    deduped_8_1 := PairOfSumAndListOfMultiplicities( Y_1 )[2];
    hoisted_4_1 := List( automorphisms_1, function ( x_2 )
            local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := PairOfLists( x_2 );
            deduped_7_2 := deduped_8_2[1];
            hoisted_6_2 := deduped_8_2[2];
            hoisted_3_2 := PairOfSumAndListOfMultiplicities( Range( x_2 ) )[2];
            hoisted_5_2 := List( deduped_38_1, function ( o_3 )
                    return ListWithIdenticalEntries( hoisted_3_2[o_3], deduped_2_1[o_3] );
                end );
            deduped_1_2 := PairOfSumAndListOfMultiplicities( Source( x_2 ) )[2];
            hoisted_2_2 := List( deduped_38_1, function ( o_3 )
                    return ListWithIdenticalEntries( deduped_1_2[o_3], deduped_2_1[o_3] );
                end );
            return NTuple( 2, deduped_7_2, List( deduped_38_1, function ( o_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3;
                      deduped_5_3 := deduped_7_2[o_3];
                      hoisted_4_3 := hoisted_6_2[o_3];
                      hoisted_3_3 := deduped_5_3[2];
                      hoisted_2_3 := deduped_5_3[1];
                      hoisted_1_3 := hoisted_2_2[o_3];
                      return List( [ 1 .. deduped_1_2[o_3] ], function ( i_4 )
                              return CreateCapCategoryMorphismWithAttributes( deduped_37_1, hoisted_1_3[i_4], hoisted_5_2[1 + hoisted_2_3[i_4]][1 + hoisted_3_3[i_4]], UnderlyingGroupElement, hoisted_4_3[i_4] );
                          end );
                  end ) );
        end );
    hoisted_5_1 := List( deduped_39_1, function ( r_2 )
            return hoisted_4_1[r_2];
        end );
    deduped_7_1 := List( deduped_38_1, function ( c_2 )
            return List( deduped_39_1, function ( r_3 )
                    return PermList( List( hoisted_5_1[r_3][1][c_2][2], function ( i_4 )
                              return 1 + i_4;
                          end ) );
                end );
        end );
    hoisted_16_1 := List( deduped_38_1, function ( c_2 )
            return List( OrbitsPerms( deduped_7_1[c_2], [ 1 .. deduped_8_1[c_2] ] ), Length );
        end );
    deduped_15_1 := List( deduped_38_1, function ( c_2 )
            return OrbitsPerms( deduped_7_1[c_2], [ 1 .. deduped_8_1[c_2] ] );
        end );
    hoisted_9_1 := List( deduped_38_1, function ( c_2 )
            return Length( OrbitsPerms( deduped_7_1[c_2], [ 1 .. deduped_8_1[c_2] ] ) );
        end );
    deduped_10_1 := List( deduped_38_1, function ( c_2 )
            return hoisted_9_1[c_2];
        end );
    deduped_18_1 := List( deduped_38_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_16_1[c_2];
            hoisted_1_2 := deduped_15_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    return SchreierSimsOnASingleOrbit( deduped_40_1, hoisted_17_1, c_2, hoisted_1_2[o_3][1], hoisted_2_2[o_3] );
                end );
        end );
    deduped_13_1 := List( deduped_41_1, GeneratorsOfMagmaWithInverses );
    deduped_12_1 := List( SetOfObjectsOfUnderlyingCategory( deduped_40_1 ), ObjectNumber );
    deduped_11_1 := CardinalitiesOfObjects( deduped_37_1 );
    hoisted_21_1 := List( deduped_38_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_13_1[deduped_12_1[c_2]];
            hoisted_1_2 := deduped_18_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_4_3, deduped_5_3;
                    deduped_5_3 := hoisted_1_2[o_3][4];
                    hoisted_1_3 := List( deduped_5_3, UnderlyingGroupElement );
                    deduped_4_3 := SubmagmaWithInverses( deduped_19_1, Concatenation( hoisted_2_2, List( [ 1 .. Length( deduped_5_3 ) ], function ( i_4 )
                                return hoisted_1_3[i_4];
                            end ) ) );
                    hoisted_2_3 := Index( deduped_19_1, deduped_4_3 );
                    return SafeFirst( Filtered( deduped_38_1, function ( i_4 )
                              return deduped_11_1[i_4] = hoisted_2_3;
                          end ), function ( c_4 )
                            return IsConjugate( deduped_19_1, deduped_4_3, deduped_41_1[c_4] );
                        end );
                end );
        end );
    deduped_35_1 := List( deduped_38_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_21_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_1_2[o_3];
                    return SafePositionProperty( deduped_38_1, function ( d_4 )
                            return hoisted_1_3 = deduped_12_1[d_4];
                        end );
                end );
        end );
    deduped_22_1 := Concatenation( deduped_35_1 );
    deduped_36_1 := List( deduped_38_1, function ( c_2 )
            return Number( deduped_22_1, function ( i_3 )
                    return i_3 = c_2;
                end );
        end );
    hoisted_32_1 := deduped_42_1[2];
    hoisted_31_1 := PairOfSumAndListOfMultiplicities( Source( tau_1 ) )[2];
    hoisted_33_1 := List( deduped_38_1, function ( o_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_32_1[o_2];
            return List( [ 1 .. hoisted_31_1[o_2] ], function ( i_3 )
                    return hoisted_1_2[i_3];
                end );
        end );
    hoisted_25_1 := List( deduped_38_1, function ( c_2 )
            return Sum( deduped_10_1{[ 1 .. c_2 - 1 ]} );
        end );
    deduped_26_1 := List( deduped_38_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_35_1[c_2];
            hoisted_1_2 := hoisted_25_1[c_2];
            return List( [ 1 .. deduped_10_1[c_2] ], function ( o_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_2_2[o_3];
                    return Number( deduped_22_1{[ 1 .. hoisted_1_2 + o_3 ]}, function ( i_4 )
                            return i_4 = hoisted_1_3;
                        end );
                end );
        end );
    deduped_27_1 := List( deduped_38_1, function ( c_2 )
            return List( [ 1 .. deduped_36_1[c_2] ], function ( i_3 )
                    return SafeFirst( deduped_38_1, function ( d_4 )
                            return c_2 in deduped_35_1[d_4] and i_3 in deduped_26_1[d_4];
                        end );
                end );
        end );
    deduped_29_1 := List( deduped_38_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_27_1[c_2];
            return List( [ 1 .. deduped_36_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_3_3;
                    deduped_3_3 := hoisted_1_2[i_3];
                    hoisted_2_3 := deduped_26_1[deduped_3_3];
                    hoisted_1_3 := deduped_35_1[deduped_3_3];
                    return SafeFirst( [ 1 .. deduped_10_1[deduped_3_3] ], function ( j_4 )
                            return hoisted_1_3[j_4] = c_2 and hoisted_2_3[j_4] = i_3;
                        end );
                end );
        end );
    deduped_30_1 := List( deduped_38_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_29_1[c_2];
            hoisted_1_2 := deduped_27_1[c_2];
            return List( [ 1 .. deduped_36_1[c_2] ], function ( i_3 )
                    return deduped_15_1[hoisted_1_2[i_3]][hoisted_2_2[i_3]][1];
                end );
        end );
    hoisted_34_1 := List( deduped_38_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_30_1[c_2];
            hoisted_2_2 := deduped_29_1[c_2];
            hoisted_1_2 := deduped_27_1[c_2];
            return List( [ 1 .. deduped_36_1[c_2] ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_4_3, deduped_5_3, deduped_6_3;
                    deduped_6_3 := hoisted_1_2[i_3];
                    deduped_5_3 := deduped_18_1[deduped_6_3][hoisted_2_2[i_3]][4];
                    hoisted_1_3 := List( deduped_5_3, UnderlyingGroupElement );
                    deduped_4_3 := SubmagmaWithInverses( deduped_19_1, Concatenation( deduped_13_1[deduped_12_1[deduped_6_3]], List( [ 1 .. Length( deduped_5_3 ) ], function ( i_4 )
                                return hoisted_1_3[i_4];
                            end ) ) );
                    hoisted_2_3 := Index( deduped_19_1, deduped_4_3 );
                    return MultiplyGroupElements( InverseImmutable( RepresentativeAction( deduped_19_1, deduped_4_3, deduped_41_1[SafeFirst( Filtered( deduped_38_1, function ( i_4 )
                                     return deduped_11_1[i_4] = hoisted_2_3;
                                 end ), function ( c_4 )
                                   return IsConjugate( deduped_19_1, deduped_4_3, deduped_41_1[c_4] );
                               end )] ) ), hoisted_33_1[deduped_6_3][hoisted_3_2[i_3]] );
                end );
        end );
    deduped_28_1 := deduped_42_1[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, PairOfSumAndListOfMultiplicities, NTuple( 2, Sum( deduped_36_1 ), deduped_36_1 ) ), T_1, PairOfLists, NTuple( 2, List( deduped_38_1, function ( c_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := [ 1 .. deduped_36_1[c_2] ];
                deduped_2_2 := deduped_30_1[c_2];
                deduped_1_2 := deduped_27_1[c_2];
                return NTuple( 2, List( deduped_3_2, function ( i_3 )
                          return deduped_28_1[deduped_1_2[i_3]][1][deduped_2_2[i_3]];
                      end ), List( deduped_3_2, function ( i_3 )
                          return deduped_28_1[deduped_1_2[i_3]][2][deduped_2_2[i_3]];
                      end ) );
            end ), List( deduped_38_1, function ( o_2 )
                local hoisted_1_2;
                hoisted_1_2 := hoisted_34_1[o_2];
                return List( [ 1 .. deduped_36_1[o_2] ], function ( i_3 )
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
