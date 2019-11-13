//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar03_mechanic.dlg in tar_m03af (Taris Swoop Platform).
	
	This script fires on the opening node of the scene where the player returns
	to the mechanic after one of their swoop heats. It has been changed primarily
	to hide any equipped weapons for the post-final	heat sequence where they bow,
	during which they typically skewer themselves through the head if they have a
	sword equipped. That scene is in another DLG (tar03_brejik031.dlg) but it is
	run directly from one of this DLG's exit nodes. It can't be set to hide weapons
	directly in the DLG, because Bastila needs to be shown with a weapon equipped
	when breaking out of her cage. Instead, whatever weapons the player has equipped
	are duplicated in a couple of invisible placeables and they are unequipped. The
	duplicates act as references to grab the item tags from in order to reequip the
	player when the conversation ends. This script handles spawning in a new set of
	placeables (they are destroyed after every conversation), duplicating the items
	and unequipping the player.
	
	See also k_ptar_brejikatk, k_ptar_swoop0, k_ptar_swoopnew.
	
	Issue #301: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/301
	
	DP 2019-11-14																*/
//////////////////////////////////////////////////////////////////////////////////

void VictoryLane() {
	
	ActionMoveToObject(GetObjectByTag("tar03_wpraceover", 0), TRUE);
	
	if (GetGlobalNumber("Tar_SwoopStatus") == 2)
		{
			ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1);
		}
}

void CP_StripWeapons() {
	
	object oPC = GetFirstPC();
	object oRWeap = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oPC);
	object oLWeap = GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oPC);
	location lStoreR = Location(Vector(209.0,232.0,7.6), 0.0);
	location lStoreL = Location(Vector(209.0,230.0,7.6), 0.0);
	object oStoreR = CreateObject(OBJECT_TYPE_PLACEABLE, "cp_tar03_pchandr", lStoreR);
	object oStoreL = CreateObject(OBJECT_TYPE_PLACEABLE, "cp_tar03_pchandl", lStoreL);
	
	if (GetIsObjectValid(oRWeap))
		{
			CreateItemOnObject(GetTag(oRWeap), oStoreR, 1);
			
			AssignCommand(oPC, ActionUnequipItem(oRWeap, TRUE));
		}
	
	if (GetIsObjectValid(oLWeap))
		{
			CreateItemOnObject(GetTag(oLWeap), oStoreL, 1);
			
			AssignCommand(oPC, ActionUnequipItem(oLWeap, TRUE));
		}
	
	DelayCommand(0.5, AssignCommand(oPC, VictoryLane()));
}

void main() {
	
	ActionPauseConversation();
	
	CP_StripWeapons();
	
	DelayCommand(3.0, ActionResumeConversation());
}
