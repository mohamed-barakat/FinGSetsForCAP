# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Reading the declaration part of the package.
#

ReadPackage( "FinGSetsForCAP", "gap/Tools.gd" );

ReadPackage( "FinGSetsForCAP", "gap/SkeletalCategoryOfTransitiveLeftGSets.gd" );
ReadPackage( "FinGSetsForCAP", "gap/SkeletalCategoryOfFiniteLeftGSets.gd" );

ReadPackage( "FinGSetsForCAP", "gap/SkeletalCategoryOfFiniteRightGSets.gd" );

if IsPackageMarkedForLoading( "FinSetsForCAP", ">= 2018.09.17" ) then
    ReadPackage( "FinGSetsForCAP", "gap/Reconstruction.gd" );
fi;
