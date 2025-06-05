# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Reading the implementation part of the package.
#

ReadPackage( "FinGSetsForCAP", "gap/Tools.gi" );

ReadPackage( "FinGSetsForCAP", "gap/SkeletalCategoryOfFinGSets.gi" );
ReadPackage( "FinGSetsForCAP", "gap/SkeletalFinGSetsForCAP.gi" );
ReadPackage( "FinGSetsForCAP", "gap/SkeletalCategoryOfTransitiveGSets.gi" );
ReadPackage( "FinGSetsForCAP", "gap/CategoryOfBisetsOfFiniteGroupsUsingPreSheaves.gi" );
ReadPackage( "FinGSetsForCAP", "gap/CategoryOfBisetsOfFiniteGroups.gi" );

if IsPackageMarkedForLoading( "FinSetsForCAP", ">= 2018.09.17" ) then
    ReadPackage( "FinGSetsForCAP", "gap/EndAsEqualizer.gi" );
    ReadPackage( "FinGSetsForCAP", "gap/EndByLifts.gi" );
    ReadPackage( "FinGSetsForCAP", "gap/ReconstructTableOfMarks.gi" );
    ReadPackage( "FinGSetsForCAP", "gap/HomSkeletalFinGSets.gi" );
    ReadPackage( "FinGSetsForCAP", "gap/ForgetfulFunctorSkeletalGSets.gi" );
    ReadPackage( "FinGSetsForCAP", "gap/ReconstructGroup.gi" );
fi;
