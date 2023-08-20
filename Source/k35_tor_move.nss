//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor35_torturer.dlg in korr_m35aa (Korriban Sith Academy).
	
	This is the exit script when the player agrees to interrogate the Mando
	prisoner in the Korriban Sith Academy. It walks the torturer away from
	the torture console to a waypoint next to the room's doorway. This has
	been tweaked to give him a facing command back towards the console once
	he reaches his destination so he isn't staring out the doorway.
	
	See also k35_init_torture, k35_plc_startvic, k35_vic_collapse, k35_vic_drugged,
	k35_vic_narc, k_pkor_destvictm, k_pkor_painreset, k_pkor_tort01.
	
	Issue #434: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/434
	
	DP 2023-08-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oWP = GetObjectByTag("k35_way_torturer", 0);
	object oFace = GetObjectByTag("kor35_torturecomp", 0);
	
	ActionMoveToObject(oWP);
	ActionDoCommand(SetFacingPoint(GetPosition(oFace)));
	ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
	SetCommandable(FALSE, OBJECT_SELF);
}
