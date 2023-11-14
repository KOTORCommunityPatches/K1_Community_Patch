//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_bastila.dlg in tar_m03af (Taris Swoop Platform).
	
	This script is gated behind a starting conditional in Bastila's post-fight
	conversation after winning the swoop race. The conditional (k_ptar_hassaber)
	checks whether or not the player has looted the lightsaber from Brejik's
	corpse. If not, it fires this script, which makes Bastila walk to the corpse
	and pretend to loot it herself, while spawning the items into the party's
	inventory. The original script didn't do any checks thus it was possible
	to obtain duplicates of Brejik's items if the player managed to loot those
	without taking the saber. Now it checks for those as well.
	
	Updated 2023-11-14 to have the player face Brejik's corpse as Bastila walks
	to it.
	
	Issue #298: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/298
	
	Issue #345: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/345
	
	DP 2019-10-12 / DP 2023-11-14												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBelt = GetItemPossessedBy(oPC, "tar03_brejikbelt");
	object oForearm = GetItemPossessedBy(oPC, "tar03_brejikband");
	object oGloves = GetItemPossessedBy(oPC, "tar03_brejikglov");
	location lCorpse = GetGlobalLocation("TAR_BREJIKCORPSE");
	
	if (!GetIsObjectValid(oBelt)) CreateItemOnObject("tar03_brejikbelt", oPC, 1);
	if (!GetIsObjectValid(oForearm)) CreateItemOnObject("tar03_brejikband", oPC, 1);
	if (!GetIsObjectValid(oGloves)) CreateItemOnObject("tar03_brejikglov", oPC, 1);
	CreateItemOnObject("G_W_DBLSBR004", oPC, 1);
	
	ActionPauseConversation();
	
	AssignCommand(oPC, ActionDoCommand(DelayCommand(1.0, SetFacingPoint(GetPositionFromLocation(lCorpse)))));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.2));
	
	ActionMoveToLocation(lCorpse, FALSE);
	ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
	
	ActionResumeConversation();
}
