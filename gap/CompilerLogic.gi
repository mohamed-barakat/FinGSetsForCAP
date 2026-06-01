# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "v", "b" ],
        variable_filters := [ IsBigInt, IsBigInt ],
        src_template := "DigitInPositionalNotation( v, BigInt( 0 ), BigInt( 1 ), b )",
        dst_template := "v",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "gs", "U", "TG", "source", "target", "h" ],
        variable_filters := [ IsList, IsList, IsSkeletalCategoryOfTransitiveLeftGSets, IsObjectInSkeletalCategoryOfTransitiveLeftGSets, IsObjectInSkeletalCategoryOfTransitiveLeftGSets, IsMultiplicativeElementWithInverse ],
        src_template := "SafeUniquePositionProperty( List( gs, g -> CreateCapCategoryMorphismWithAttributes( TG, source, target, UnderlyingGroupElement, g ) ), mor -> MultiplyGroupElements( InverseImmutable( UnderlyingGroupElement( mor ) ), h ) in U[ObjectNumber( Range( mor ) )] )",
        dst_template := "SafeUniquePositionProperty( gs, g -> MultiplyGroupElements( InverseImmutable( g ), h ) in U[ObjectNumber( target )] )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "iota", "func" ],
        variable_filters := [ IsMorphismInSkeletalCategoryOfFiniteSets, IsFunction ],
        src_template := "SafeUniquePositionProperty( List( [ 0 .. Cardinality( Target( iota ) ) - 1 ], func ), mor -> AsList( mor ) = AsList( iota ) )",
        dst_template := "1 + AsList( iota )[1]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "G", "g" ],
        variable_filters := [ IsGroup, IsMultiplicativeElementWithInverse ],
        src_template := "MultiplyGroupElements( OneImmutable( G ), g )",
        dst_template := "g",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "G", "g" ],
        variable_filters := [ IsGroup, IsMultiplicativeElementWithInverse ],
        src_template := "MultiplyGroupElements( g, OneImmutable( G ) )",
        dst_template := "g",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "n", "func" ],
        #variable_filters := [ IsInt, IsFunction ],
        src_template := "List( [ 1 .. n ], c -> List( [ 1 .. n ], func )[c] )",
        dst_template := "List( [ 1 .. n ], func )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "n", "perms", "mults" ],
        #variable_filters := [ IsInt, IsList, IsList ],
        src_template := "List( [ 1 .. n ], c -> List( [ 1 .. List( [ 1 .. n ], e -> Length( OrbitsPerms( perms[e], [ 1 .. mults[e] ] ) ) )[c] ], o -> List( [ 1 .. n ], d -> List( OrbitsPerms( perms[d], [ 1 .. mults[d] ] ), Length ) )[c][o] ) )",
        dst_template := "List( [ 1 .. n ], d -> List( OrbitsPerms( perms[d], [ 1 .. mults[d] ] ), Length ) )",
    )
);
