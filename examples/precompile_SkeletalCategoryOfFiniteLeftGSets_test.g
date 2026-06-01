LoadPackage( "FinGSetsForCAP", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2026.06-03", false );
#! true
ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true
ReadPackageOnce( "FinGSetsForCAP", "gap/CompilerLogic.gi" );
#! true

C2 := CyclicGroup( 2 );; StructureDescription( C2 );; C2;
#! C2
GSet := FiniteStrictCoproductCompletionOfObjectFiniteCategory(
                SkeletalCategoryOfTransitiveLeftGSets(
                        GROUP_AS_CATEGORY( C2 : FinalizeCategory := true ) ) );;

implemented_func := { GSet, obj, autos } -> CoequalizerOfIdentityAndAutomorphisms( GSet, obj, autos );

StartTimer( "compile" );

#StopCompilationAtPrimitivelyInstalledOperationsOfCategory( GSet );

compiled_implemented_func :=
  CapJitCompiledFunction( implemented_func,
          GSet, [ "category", "object", "list_of_morphisms" ], "object" :
          number_of_objectified_objects_in_data_structure_of_object := 2,
          number_of_objectified_morphisms_in_data_structure_of_object := 0,
          number_of_objectified_objects_in_data_structure_of_morphism := 4,
          number_of_objectified_morphisms_in_data_structure_of_morphism := 2,
          apply_irreversible_optimizations := false );

StopTimer( "compile" );

DisplayTimer( "compile" );

Display( compiled_implemented_func );
