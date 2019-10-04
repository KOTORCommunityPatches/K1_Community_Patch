//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in ebo_m41aa (Ebon Hawk Lehon).

	This script fires at the end of the scene, turning everyone to face the
	PC. The vanilla script incorrectly used template ResRefs instead of Tags.
	A fadeout has been added to mask the reorienting, since it looks a little
	odd. Additionally, Mission is walked back to her starting waypoint from
	the computer panel she moved to earlier in the scene and head following
	is unlocked, since locking it was added to an earlier script.
	
	See also cp_ebo41_facejol, cp_ebo41_misswlk, cp_ebo41_pc2crth, cp_ebo41_pc3crth,
	k_punk_cut02, k_punk_joleeface, k_punk_juhface, k_punk_misfacep2, k_punk_misfacepc,
	k_punk_pcwalk
	
	Issue #174: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/174

	DP 2019-10-04																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oCand = GetObjectByTag("Cand");
	object oCarth = GetObjectByTag("Carth");
	object oHK = GetObjectByTag("HK47");
	object oJolee = GetObjectByTag("Jolee");
	object oJuhani = GetObjectByTag("Juhani");
	object oMiss = GetObjectByTag("Mission");
	object oT3 = GetObjectByTag("T3M4");
	object oZaal = GetObjectByTag("Zaalbar");
	location lMissWP = GetLocation(GetWaypointByTag("pebn_mission"));
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5,1.5);
	
	SetLockHeadFollowInDialog(oMiss, FALSE);
	AssignCommand(oMiss, ActionMoveToLocation(lMissWP));
	AssignCommand(oMiss, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
	AssignCommand(oCand, SetFacingPoint(GetPosition(oPC)));
	AssignCommand(oCarth, SetFacingPoint(GetPosition(oPC)));
	AssignCommand(oHK, SetFacingPoint(GetPosition(oPC)));
	AssignCommand(oJolee, SetFacingPoint(GetPosition(oPC)));
	AssignCommand(oJuhani, SetFacingPoint(GetPosition(oPC)));
	AssignCommand(oT3, SetFacingPoint(GetPosition(oPC)));
	AssignCommand(oZaal, SetFacingPoint(GetPosition(oPC)));
}
