SetAssertionLevel( 4 );


LoadPackage("FinSets");
LoadPackage("SkeletalGSets");

CapCategorySwitchLogicOff( FinSets );
CapCategorySwitchLogicOff( SkeletalFinSets );
DeactivateCachingOfCategory( FinSets );
DeactivateCachingOfCategory( SkeletalFinSets );

#S1 := FinSet( 0 );
#T1 := FinSet( 0 );
#L := [];

#for phi in [ 1 .. 6^6 ] do
#	MapOfFinSets( S1, L, T1 );
#	# FinSet( 0 );
#	Display( phi );
#od;

#quit;

G := SymmetricGroup( 3 );
F := FreeGroup("x");
G := F / [F.1^6];
#G := CyclicGroup( 6 );
# G := SmallGroup(4,2);
# G := SmallGroup(8,1);

#FinSet( [ MapOfGSets( GSet( G, [] ), [ ], GSet( G, [] ) ) ] ) = FinSet( [ MapOfFinSets( FinSet( [] ), [ ], FinSet( [] ) ) ] );

#IsWellDefined( FinSet( [ MapOfGSets( GSet( G, [] ), [ ], GSet( G, [] ) ) ] ) );
#IsWellDefined( FinSet( [ MapOfFinSets( FinSet( [] ), [ ], FinSet( [] ) ) ] ) );

#quit;

CapCategorySwitchLogicOff( SkeletalGSets( G ) );
DeactivateCachingOfCategory( SkeletalGSets( G ) );

# TODO unabhängig von konkretem G?
# TODO Asserts?
# TODO AsList( G ) stabil?
ForgetfulFunctor := CapFunctor( "Forgetful functor SkeletalGSets -> SkeletalFinSets", SkeletalGSets( G ), SkeletalFinSets );
AddObjectFunction( ForgetfulFunctor, function( obj )
	
	local M, group, int, ToM, k, i;
	
	M := AsList( obj );
	group := UnderlyingGroup( obj );
	
	int := 0;
	
	ToM := MatTom( TableOfMarks( group ) );
	
	k := Size( ToM );
	
	for i in [ 1 .. k ] do
		# TODO: erste Spalte immer Indizes?
		
		int := int + M[ i ] * ToM[ i ][ 1 ];
	od;

	return FinSet( int );
	
end );

#A := GSet( G, [ 1, 1, 1, 1 ] );
#Display(ApplyFunctor( ForgetfulFunctor, A ));

AddMorphismFunction( ForgetfulFunctor, function( obj1, mor, obj2 )
	local S, T, imgs, M, N, group, ToM, k, OffsetOfCopyInTarget, OffsetOfElementInCopy, set_imgs, i, U_i, l, r, g, j, h;
	
	S := Source( mor );
	T := Range( mor );
	imgs := AsList( mor );
	M := AsList( S );
	N := AsList( T );
	group := UnderlyingGroup( S );
	ToM := MatTom( TableOfMarks( group ) );
	k := Size( ToM );
	
	OffsetOfCopyInTarget := function( _r, _j )
		local int, j, r;
		int := 0;
		for j in [ 1 .. k ] do
			for r in [ 1 .. N[ j ] ] do
				if j = _j and r = _r then
					return int;
				fi;
				# TODO: erste Spalte immer Indizes?
				
				int := int + ToM[ j ][ 1 ];
			od;
		od;
	end;
	
	OffsetOfElementInCopy := function( g, j )
		local U_j, RC;
		
		U_j := RepresentativeTom( TableOfMarks( group ), j );
		RC := RightCosets( group, U_j );
		
		return Position( RC, g );
		
	end;
	
	set_imgs := [];
	for i in [ 1 .. k ] do
		U_i := RepresentativeTom( TableOfMarks( group ), i );
		for l in [ 1 .. M[ i ] ] do
			r := imgs[ i ][ l ][ 1 ];
			g := imgs[ i ][ l ][ 2 ];
			j := imgs[ i ][ l ][ 3 ];
			
			for h in RightTransversal( group, U_i ) do
				Add( set_imgs, OffsetOfCopyInTarget( r, j ) + OffsetOfElementInCopy( g * h, j ) );
			od;
		od;
	od;
	
	return MapOfFinSets( obj1, set_imgs, obj2 );
	
end );





ForgetfulFunctorNonSkeletal := CapFunctor( "Forgetful functor SkeletalGSets -> FinSets", SkeletalGSets( G ), FinSets );
AddObjectFunction( ForgetfulFunctorNonSkeletal, function( obj )
	
	local M, group, UnderlyingSet, ToM, k, i, U_i, l;
	
	M := AsList( obj );
	group := UnderlyingGroup( obj );
	
	UnderlyingSet := [];
	
	ToM := MatTom( TableOfMarks( group ) );
	
	k := Size( ToM );
	
	for i in [ 1 .. k ] do
		U_i := RepresentativeTom( TableOfMarks( group ), i );
		# TODO: erste Spalte immer Indizes?
		for l in [ 1 .. M[ i ] ] do
			# cosets must be indexed by l to distinguish different copies, also index by i to keep the notation similar to the notation of maps
			Append( UnderlyingSet, Immutable( List( RightCosets( group, U_i ), coset ->  [ l, coset, i ] ) ) );
		od;
	od;

	return FinSet( UnderlyingSet );
	
end );


#B := GSet( G, [ 2, 1, 0, 1 ] );
#phi := MapOfGSets( A, [ [ [ 2, (1,2), 1 ] ], [ [ 1, (), 2 ] ], [ [ 1, (), 4 ] ], [ [ 1, (), 4 ] ] ], B );
#set_phi := ApplyFunctor( ForgetfulFunctor, phi );
#Display( set_phi );
#IsWellDefined( set_phi );


HomFinSetsSkeletal := function ( S, T )
	local M, N;
	
	M := Length( S );
	N := Length( T );
	
	return FinSet( N^M );
end;


HomGSets := function( S, T )
	local M, N, group, k, homs, ImageLists, ImageList, graph, CurrentImageListPosition, i, U_i, l, img, r, g, j, U_j, WellDefined;
	
	M := AsList( S );
	N := AsList( T );
	
	group := UnderlyingGroup( S );
	k := Size( M );
	
	homs := [];
	
	# DirectProduct vs. Cartesian: use Cartesian to make explicit, that this is a set theoretic construction which might not work in general
	ImageLists := Cartesian( List( [ 1 .. Sum( M ) ], x -> AsList( ApplyFunctor( ForgetfulFunctorNonSkeletal, T ) ) ) );
	for ImageList in ImageLists do
		graph := List( [ 1 .. k ], x -> [] );
		CurrentImageListPosition := 1;
		WellDefined := true;
		for i in [ 1 .. k ] do
			U_i := RepresentativeTom( TableOfMarks( group ), i );
			for l in [ 1 .. M[ i ] ] do
				img := ImageList[ CurrentImageListPosition ];
				r := img[ 1 ];
				g := img[ 2 ];
				j := img[ 3 ];
				
				U_j := RepresentativeTom( TableOfMarks( group ), j );

				WellDefined := IsSubset( U_j, ConjugateSubgroup( U_i, Inverse( Representative( g ) ) ) );
				
				if not WellDefined then
					break;
				fi;
				
				Add( graph[ i ], img );
				CurrentImageListPosition := CurrentImageListPosition + 1;
			od;
			if not WellDefined then
				break;
			fi;
		od;
		if WellDefined then
			Add( homs, MapOfGSets( S, graph, T ) );
		fi;
	od;
	
	return FinSetNC( homs );
end;

HomGSetsSkeletal := function( S, T )
	local homs;
	
	homs := HomGSets( S, T );
	
	return FinSet( Length( homs ) );
end;

counter := 0;

IntToMorphism := function( S, int, T )
	local s, t, L, i, phi;
	s := Length( S );
	t := Length( T );
	L := ListWithIdenticalEntries( s, 1 );
	# lists start with entry 1, we want to start at 0 and add back 1 later
	int := int - 1;
	i := 1;
	while int <> 0 do
		L[ i ] := ( int mod t ) + 1;
		int := QuoInt( int, t );
		i := i + 1;
	od;
	phi := MapOfFinSets( S, L, T );

	return phi;
end;

MorphismToInt := function( phi )
	local S, T, s, t, imgs, int, i;
	
	S := Source( phi );
	T := Range( phi );
	s := Length( S );
	t := Length( T );
	imgs := AsList( phi );
	
	int := 0;
	for i in [ 0 .. ( s - 1 ) ] do
		int := int + ( imgs[ i + 1 ] - 1 ) * t^i;
	od;

	return int + 1;
end;


PseudoMorphismToInt := function( s, imgs, t )
	local int, i;
	
	int := 0;
	for i in [ 0 .. ( s - 1 ) ] do
		int := int + ( imgs[ i + 1 ] - 1 ) * t^i;
	od;

	return int + 1;
end;


ComposeInts := function(s, int1, m, int2, t)
	local int, i, img1, img2;
	
	int1 := int1 - 1;
	int2 := int2 - 1;
	
	int := 0;
	for i in [ 0 .. ( s - 1 ) ] do
		# get i-th digit of int1 w.r.t to base m
		img1 := QuoInt( int1, m^i ) mod m;
		# get img1-th digit of int2 w.r.t to base t
		img2 := QuoInt( int2, t^img1 ) mod t;
		int := int + img2 * t^i;
	od;

	return int + 1;
end;


GetRhoComponent := function( IndexSet, Projections, i_1, i_2 )
	local Omega_1, Omega_2, S, T, Graph, Graph1, pi, RhoComponent, IntsHomGSets, Length_HomGSetsSkeletal_Omega_1_Omega_2, Length_ApplyFunctor_ForgetfulFunctor_Omega_1, Length_ApplyFunctor_ForgetfulFunctor_Omega_2, Length_HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2, ApplyFunctor_ForgetfulFunctor_Omega_1, Forgetful_HomGSets, HomGSetsSkeletal_Omega_1_Omega_2, HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2;
	Display("RhoComponent");
	Display(i_1);
	Display(i_2);
	Display("started");
	Omega_1 := IndexSet[ i_1 ];
	Omega_2 := IndexSet[ i_2 ];
	
	S := HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_1 ), ApplyFunctor( ForgetfulFunctor, Omega_1 ) );
	T := HomFinSetsSkeletal( HomGSets( Omega_1, Omega_2), HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_1 ), ApplyFunctor( ForgetfulFunctor, Omega_2 ) ) );
	counter := 0;

	# this code is equal to the commented code below, but much faster since it only deals with integers and avoids polluting the GAP and CAP caches
	IntsHomGSets := List( HomGSets( Omega_1, Omega_2), f -> MorphismToInt( ApplyFunctor( ForgetfulFunctor, f ) ) );
	Length_HomGSetsSkeletal_Omega_1_Omega_2 := Length( HomGSetsSkeletal( Omega_1, Omega_2) );
	Length_ApplyFunctor_ForgetfulFunctor_Omega_1 := Length( ApplyFunctor( ForgetfulFunctor, Omega_1 ) );
	Length_ApplyFunctor_ForgetfulFunctor_Omega_2 := Length( ApplyFunctor( ForgetfulFunctor, Omega_2 ) );
	Length_HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2 := Length( HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_1 ), ApplyFunctor( ForgetfulFunctor, Omega_2 ) ) );
	
	Graph := List( [ 1 .. Length( S ) ], phi ->
		PseudoMorphismToInt(
			Length_HomGSetsSkeletal_Omega_1_Omega_2,
			List( IntsHomGSets, function( f )
				Display( counter );
				counter := counter + 1;
				
				return ComposeInts( Length_ApplyFunctor_ForgetfulFunctor_Omega_1, phi, Length_ApplyFunctor_ForgetfulFunctor_Omega_1, f, Length_ApplyFunctor_ForgetfulFunctor_Omega_2 );
			end ),
			Length_HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2
		)
	);

	# ApplyFunctor_ForgetfulFunctor_Omega_1 := ApplyFunctor( ForgetfulFunctor, Omega_1 );
	# Forgetful_HomGSets := List( HomGSets( Omega_1, Omega_2 ), f -> ApplyFunctor( ForgetfulFunctor, f ) );
	# HomGSetsSkeletal_Omega_1_Omega_2 := HomGSetsSkeletal( Omega_1, Omega_2 );
	# HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2 := HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_1 ), ApplyFunctor( ForgetfulFunctor, Omega_2 ) );

	# if true then
	# Graph := List( [ 0 .. Length( S ) - 1 ], phi -> 
	#  	MorphismToInt( MapOfFinSets(
	#  		HomGSetsSkeletal_Omega_1_Omega_2,
	#  		List( IntsHomGSets, function( f )
	# 			local x, category;
	# 			Display( counter );
	# 			counter := counter + 1;

	# 			# x := IntToMorphism( ApplyFunctor_ForgetfulFunctor_Omega_1, phi, ApplyFunctor_ForgetfulFunctor_Omega_1 );
	# 			
	# 			morphism := rec( );
	# 			
	# 			ObjectifyWithAttributes( morphism, TheTypeOfMapsOfSkeletalFiniteSets,
	# 					AsList, [],
	# 					Source, ApplyFunctor_ForgetfulFunctor_Omega_1,
	# 					Range, ApplyFunctor_ForgetfulFunctor_Omega_1 
	# 				);

	# 				
	# 				morphism2 := rec( );
	# 			
	# 			ObjectifyWithAttributes( morphism2, TheTypeOfMapsOfSkeletalFiniteSets,
	# 					AsList, [],
	# 					Source, ApplyFunctor_ForgetfulFunctor_Omega_1,
	# 					Range, ApplyFunctor_ForgetfulFunctor_Omega_1 
	# 				);
	# 				
	# 				Error();

	# 			SetFilterObj( morphism, IsCapCategoryMorphism );

	# 			category := SkeletalFinSets;

	# 			if HasCapCategory( morphism ) then
    #     
	# 				if IsIdenticalObj( CapCategory( morphism ), category ) then
	# 					
	# 					return;
	# 					
	# 				else
	# 					
	# 					Error( "this morphism already has a category" );
	# 					
	# 				fi;
	# 				
	# 			fi;

	# 			# Error();
	# 			
	# 			# AddObject( category, Source( morphism ) );
	# 			
	# 			# AddObject( category, Range( morphism ) );
	# 			
	# 			filter := MorphismFilter( category );
	# 			
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			# if filter( morphism ) then
	# 			# 	SetFilterObj( morphism, filter );
	# 			# fi;
	# 			
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			SetFilterObj( morphism, filter );
	# 			
	# 			#SetCapCategory( morphism, category );
	# 			#SetAsList( morphism, category );
	# 			
	# 			#Add( SkeletalFinSets, map );
	# 			
	# 			
	# 			# MapOfFinSets( ApplyFunctor_ForgetfulFunctor_Omega_1, [], ApplyFunctor_ForgetfulFunctor_Omega_1 );
	# 			
	# 			return 0;
	# 			
	# 			return ComposeInts( Length_ApplyFunctor_ForgetfulFunctor_Omega_1, phi, Length_ApplyFunctor_ForgetfulFunctor_Omega_1, f, Length_ApplyFunctor_ForgetfulFunctor_Omega_2 );

	# 			return MorphismToInt( PreCompose( x, f ) );
	#  		end ),
	#  		HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2
	#  	) )
	# );
	# fi;
	# Assert( 4, Graph = Graph1 );

	Display("Graph");
	Display(Runtimes());
	
	pi := Projections[ i_1 ];
	
	Display("pi");

	RhoComponent := PreCompose( pi, MapOfFinSets( S, Graph, T ) );

	Display("finished");

	return RhoComponent;
end;


GetLambdaComponent := function( IndexSet, Projections, i_1, i_2 )
	local Omega_1, Omega_2, S, T, Graph, Graph1, pi, LambdaComponent, IntsHomGSets, Length_HomGSetsSkeletal_Omega_1_Omega_2, Length_ApplyFunctor_ForgetfulFunctor_Omega_1, Length_ApplyFunctor_ForgetfulFunctor_Omega_2, Length_HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2;
	Display("LambdaComponent");
	Display(i_1);
	Display(i_2);
	Display("started");
	Omega_1 := IndexSet[ i_1 ];
	Omega_2 := IndexSet[ i_2 ];
	
	S := HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_2 ), ApplyFunctor( ForgetfulFunctor, Omega_2 ) );
	T := HomFinSetsSkeletal( HomGSets( Omega_1, Omega_2), HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_1 ), ApplyFunctor( ForgetfulFunctor, Omega_2 ) ) );

	# this code is equal to the commented code below, but much faster since it only deals with integers and avoids polluting the GAP and CAP caches
	IntsHomGSets := List( HomGSets( Omega_1, Omega_2), f -> MorphismToInt( ApplyFunctor( ForgetfulFunctor, f ) ) );
	Length_HomGSetsSkeletal_Omega_1_Omega_2 := Length( HomGSetsSkeletal( Omega_1, Omega_2) );
	Length_ApplyFunctor_ForgetfulFunctor_Omega_1 := Length( ApplyFunctor( ForgetfulFunctor, Omega_1 ) );
	Length_ApplyFunctor_ForgetfulFunctor_Omega_2 := Length( ApplyFunctor( ForgetfulFunctor, Omega_2 ) );
	Length_HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2 := Length( HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_1 ), ApplyFunctor( ForgetfulFunctor, Omega_2 ) ) );

	Graph := List( [ 1 .. Length( S ) ], phi ->
		PseudoMorphismToInt(
			Length_HomGSetsSkeletal_Omega_1_Omega_2,
			List( IntsHomGSets, f ->
				ComposeInts( Length_ApplyFunctor_ForgetfulFunctor_Omega_1, f, Length_ApplyFunctor_ForgetfulFunctor_Omega_2, phi, Length_ApplyFunctor_ForgetfulFunctor_Omega_2 )
			),
			Length_HomFinSetsSkeletal_ApplyFunctor_ForgetfulFunctor_Omega_1_ApplyFunctor_ForgetfulFunctor_Omega_2
		)
	);

	# Graph1 := List( [ 1 .. Length( S ) ], phi -> 
	#  	MorphismToInt( MapOfFinSets(
	#  		HomGSetsSkeletal( Omega_1, Omega_2),
	#  		List( HomGSets( Omega_1, Omega_2), f ->
	#  			MorphismToInt( PreCompose( ApplyFunctor( ForgetfulFunctor, f ), IntToMorphism( ApplyFunctor( ForgetfulFunctor, Omega_2 ), phi, ApplyFunctor( ForgetfulFunctor, Omega_2 ) ) ) )
	#  		),
	#  		HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_1 ), ApplyFunctor( ForgetfulFunctor, Omega_2 ) )
	#  	) )
	# );
	# Assert( 4, Graph = Graph1 );

	Display("Graph");
	
	pi := Projections[ i_2 ];
	
	Display("pi");

	LambdaComponent := PreCompose( pi, MapOfFinSets( S, Graph, T ) );

	Display("finished");

	return LambdaComponent;
end;

#G := SmallGroup(4,2);
ToM := MatTom( TableOfMarks( G ) );
k := Size( ToM );

IndexSet := [];

for i in [ 1 ] do
	M := ListWithIdenticalEntries( k, 0 );
	M[ i ] := 1;
	Add( IndexSet, GSet( G, M ) );
od;

# Error();

Display("start");
SourceComponents := List( IndexSet, Omega -> HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega ), ApplyFunctor( ForgetfulFunctor, Omega ) ) );
Display("SourceComponents");
S := DirectProduct( SourceComponents );
Display("Source");
# Projections := [];
Projections := List( [ 1 .. Length( IndexSet ) ], i -> ProjectionInFactorOfDirectProduct( SourceComponents, i ) );
Display("Projections");
TargetComponents := Concatenation( List( IndexSet, Omega_1 -> List( IndexSet, Omega_2 -> HomFinSetsSkeletal( HomGSets( Omega_1, Omega_2 ), HomFinSetsSkeletal( ApplyFunctor( ForgetfulFunctor, Omega_1 ), ApplyFunctor( ForgetfulFunctor, Omega_2 ) ) ) ) ) );
Display("TargetComponents");
T := DirectProduct( TargetComponents );
Display("Target");
Display(Runtimes());
RhoComponents := Concatenation( List( [ 1 .. Size( IndexSet ) ], i_1 -> List( [ 1 .. Size( IndexSet ) ], i_2 -> GetRhoComponent(IndexSet, Projections, i_1, i_2) ) ) );
Display(Runtimes());
Display("RhoComponents");
Rho := UniversalMorphismIntoDirectProduct( RhoComponents );
Display("Rho");
LambdaComponents := Concatenation( List( [ 1 .. Size( IndexSet ) ], i_1 -> List( [ 1 .. Size( IndexSet ) ], i_2 -> GetLambdaComponent(IndexSet, Projections, i_1, i_2) ) ) );
Display("LambdaComponents");
Lambdaa := UniversalMorphismIntoDirectProduct( LambdaComponents );
Display("Lambda");
emb := EmbeddingOfEqualizer( [ Rho, Lambdaa ] );
Enda := Source( emb );



NaturalTransformations := List( Enda, i -> List( [ 1 .. Length( Projections ) ], j -> IntToMorphism( ApplyFunctor( ForgetfulFunctor, IndexSet[ j ] ), PreCompose( emb, Projections[ j ] )( i ), ApplyFunctor( ForgetfulFunctor, IndexSet[ j ] ) ) ) );


DeclareRepresentation( "IsMyGroupElement", IsMultiplicativeElementWithInverse and IsAttributeStoringRep, [] );
TheTypeOfMyGroupElements := NewType( NewFamily( "TheFamilyOfMyGroupElements" ), IsMyGroupElement );


DeclareAttribute( "AsList", IsMyGroupElement );
DeclareAttribute( "MyIndex", IsMyGroupElement );


NaturalTransformationElements := List( [ 1 .. Length( NaturalTransformations ) ], function( i )
	local element;
	element := rec( );
	ObjectifyWithAttributes( element, TheTypeOfMyGroupElements, AsList, NaturalTransformations[ i ], MyIndex, i );
	return element;
end );

InstallMethodWithCache( String,
  "for my group elements",
  [ IsMyGroupElement ],
        
  function( x )
    
	return Concatenation( "<My group element with index ", String( MyIndex( x ) ), ">" );
	
end );

InstallMethodWithCache( \*,
  "for my group elements",
  [ IsMyGroupElement, IsMyGroupElement ],
        
  function( x, y )
    local i, L, element;
	
	Display("multiplying");
	
	L := [];
	for i in [ 1 .. Length( AsList( x ) ) ] do
		L[i] := PreCompose( AsList(y)[ i ], AsList(x)[ i ] );
	od;
	
	for element in NaturalTransformationElements do
		if L = AsList( element ) then
			return element;
		fi;
	od;

	Error( "should never get here" );

end );

InstallMethodWithCache( \=,
  "for my group elements",
  [ IsMyGroupElement, IsMyGroupElement ],
	function( x, y )
	
		return MyIndex( x ) = MyIndex( y );
	
	end );

InstallMethodWithCache( \<,
  "for my group elements",
  [ IsMyGroupElement, IsMyGroupElement ],
     
  function( x, y )
    
	if MyIndex( x ) <> Position( NaturalTransformationElements, x ) then
		Error( "hi" );
	fi;
	return( MyIndex( x ) < MyIndex( y ) );

end );

MyOne := false;
for element in NaturalTransformationElements do
	if ForAll( AsList( element ), f -> f = IdentityMorphism( Source( f ) ) ) then
		MyOne := element;
		break;
	fi;
od;

if MyOne = false then
	Error( "MyOne not found" );
fi;

Display( MyOne );


InstallMethodWithCache( One,
  "for my group elements",
  [ IsMyGroupElement ],
        
  function( x )
    
	return MyOne;
	
end );

InstallMethodWithCache( InverseOp,
  "for my group elements",
  [ IsMyGroupElement ],
        
  function( x )

    Display("inverting");
    
	return x^( Length( NaturalTransformationElements ) - 1 );
	
end );

MyGroup := Group( NaturalTransformationElements );

Display( IsomorphismGroups( MyGroup, G ) );