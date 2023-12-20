//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_lashowe.dlg in korr_m36aa (Korriban Valley of Dark Lords).
	
	This script fires after defeating the pack of Tuk'ata with Lashowe. Originally
	she was commanded to walk to a placeable that the Tuk'ata Mother was supposed
	to spawn in her OnDeath event, but that never actually happened. This has now
	been changed to mimic the behaviour of Bastila in the Taris Swoop Platform
	where she will mimic looting Brejik's corpse after the Mother sets a global
	location for her corpse's position.
	
	Updated 2023-12-20 to have Lashowe face the PC before walking to them, to
	prevent her moonwalking if the PC is behind her and in close proximity.
	
	See also cp_kor36_lashtrn, k36_ud_tukqueen.
	
	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163
	
	DP 2023-12-07 / DP 2023-12-20												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oLash = OBJECT_SELF;
	
	ActionPauseConversation();
	
	NoClicksFor(5.0);
	
	ActionMoveToLocation(GetGlobalLocation("TAR_BREJIKCORPSE"), 0);
	ActionDoCommand(AssignCommand(oPC, SetFacingPoint(GetPosition(oLash))));
	ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
	ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
	ActionMoveToObject(oPC, FALSE, 1.5);
	
	CreateItemOnObject("k36_itm_holocron", oLash, 1);
	
	ActionResumeConversation();
}
