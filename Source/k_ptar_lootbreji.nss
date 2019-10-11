//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_bastila.dlg in tar_m03af (Taris Swoop Platform).
	
	This script is gated behind a starting conditional in Bastila's post-fight
	conversation after winning the swoop race. The conditional (k_ptar_hassaber)
	checks whether or not the player has looted the lightsaber from Brejik's
	corpse. If not, it fires this script, which makes Bastila walk to the corpse
	and pretend to loot it herself, while spawning the items into the party's
	inventory.
	
	Issue #298: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/298
	
	DP 2019-10-12																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBelt = GetItemPossessedBy(oPC, "tar03_brejikbelt");
	object oForearm = GetItemPossessedBy(oPC, "tar03_brejikband");
	object oGloves = GetItemPossessedBy(oPC, "tar03_brejikglov");
	
	if (!GetIsObjectValid(oBelt)) CreateItemOnObject("tar03_brejikbelt", oPC, 1);
	if (!GetIsObjectValid(oForearm)) CreateItemOnObject("tar03_brejikband", oPC, 1);
	if (!GetIsObjectValid(oGloves)) CreateItemOnObject("tar03_brejikglov", oPC, 1);
	CreateItemOnObject("G_W_DBLSBR004", oPC, 1);
	
	ActionPauseConversation();
	
	ActionMoveToLocation(GetGlobalLocation("TAR_BREJIKCORPSE"), 0);
	ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
	
	ActionResumeConversation();
}
