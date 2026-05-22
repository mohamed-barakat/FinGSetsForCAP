#! @Chapter Precompilation

#! @Section Precompiling the skeletal category of finite left G-sets

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FinGSetsForCAP", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2026.05-01", false );
#! true
ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

#SetInfoLevel( InfoCapJit, 1 );

category_constructor :=
  G -> SkeletalCategoryOfFiniteLeftGSets(
          GROUP_AS_CATEGORY( G : FinalizeCategory := true ) );;
C2 := CyclicGroup( 2 );; StructureDescription( C2 );; C2;
#! C2
given_arguments := [ C2 ];;
compiled_category_name :=
  "SkeletalCategoryOfFiniteLeftGSets_precompiled";;
package_name := "FinGSetsForCAP";;
#primitive_operations :=
#  ListPrimitivelyInstalledOperationsOfCategory(
#          category_constructor( given_arguments[1]
#          : no_precompiled_code := true ) );;
list_of_operations :=
  #SortedList( Concatenation( primitive_operations,
          [ "PreCompose",
            "UniversalMorphismFromCoequalizerOfIdentityAndAutomorphisms",
            ];;
  #) );;

CapJitPrecompileCategoryAndCompareResult(
        category_constructor,
        given_arguments,
        package_name,
        compiled_category_name
        : operations := list_of_operations,
        number_of_objectified_objects_in_data_structure_of_object := 1,
        number_of_objectified_morphisms_in_data_structure_of_object := 0,
        number_of_objectified_objects_in_data_structure_of_morphism := 2,
        number_of_objectified_morphisms_in_data_structure_of_morphism := 1
);;

SkeletalCategoryOfFiniteLeftGSets_precompiled( C2 );
#! SkeletalCategoryOfFiniteLeftGSets( C2 )

cat := SkeletalCategoryOfFiniteLeftGSets( C2 );
#! SkeletalCategoryOfFiniteLeftGSets( C2 )

cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample

## 6:09, 11.79 GB
## WARNING: Found more than the expected number of occurrences of `CreateCapCategoryMorphismWithAttributes` or `AsCapCategoryMorphism` while precompiling UniversalMorphimFromCoequalizerOfIdentityAndAutomorphisms.
## List( B1, B -> PreCompose( B, B2[3] ) ); TimeToString( time ); ## now "12.541 sec."
