//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_evilbast.dlg in unk_m44ac (Lehon Temple Summit).
	
	This is a custom facing script that forces the player to reorient towards
	Bastila after an interjection by Jolee or Juhani.
	
	See also cp_unk44_jjfcbas, exitheart, k_punk_bast_ud2, k_punk_bastatt03,
	k_punk_bastatt05, k_punk_bastesc, k_punk_bastjoin2.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2021-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBastila = GetObjectByTag("Bastilae", 0);
	
	AssignCommand(oPC, SetFacingPoint(GetPosition(oBastila)));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
}
