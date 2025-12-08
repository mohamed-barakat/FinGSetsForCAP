# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Declarations
#

#! @Chapter Tools

#! @Section Helper functions

#! @Description
#! Returns a pair `[ i, g ]` such that `ConjugateSubgroup( S, g ) = RepresentativeTom( ToM, i )`
#! where `S = Stabilizer( `<A>args...</A>` )` and `ToM = TableOfMarks( `<A>args</A>`[1] )`.
#! See <C>Stabilizer</C> for a specification of <A>args</A>.
#! @Arguments args...
#! @Returns a list with first entry an integer and second entry a group element
DeclareGlobalFunction( "PositionAndConjugatorOfStabilizer" );
#! @InsertChunk PositionAndConjugatorOfStabilizer

#! @Description
#!  The input is a morphism <A>h</A> in a group as category.
#!  The output is a list of positions in the list generators and their inverses of the decomposition of <A>h</A>.
#! @Arguments h
#! @Returns a list integers
DeclareAttribute( "DecomposeGroupAsCategoryMorphism",
        IsGroupAsCategoryMorphism );

CapJitAddTypeSignature( "DecomposeGroupAsCategoryMorphism", [ IsGroupAsCategoryMorphism ], input_types -> CapJitDataTypeOfListOf( IsInt ) );
