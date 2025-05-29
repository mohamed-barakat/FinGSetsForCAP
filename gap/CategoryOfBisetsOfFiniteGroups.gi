# SPDX-License-Identifier: GPL-2.0-or-later
# FinGSetsForCAP: The (skeletal) elementary topos of finite G-sets
#
# Implementations
#

##################################
##
## String, View, and Display methods
##
##################################

##
InstallMethod( String,
        "for a group as an object in the category of bisets of finite groups using functors",
        [ IsObjectInCategoryOfBisetsOfFiniteGroups ],
        
  function ( biset_object )
    
    Error( );
    
end );

##
InstallMethod( String,
        "for a morphism in the category of bisets of finite groups using functors",
        [ IsMorphismInCategoryOfBisetsOfFiniteGroups ],
        
  function ( biset_morphism )
    
    Error( );
    
end );
