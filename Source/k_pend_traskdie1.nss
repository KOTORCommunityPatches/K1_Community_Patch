//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnFailToOpen for end_door19.utd in end_m01aa (Endar Spire Command Module).
	
	This is the OnFailToOpen script for the door past the bridge that triggers
	the Darth Bandon confrontation/Trask's sacrifice cutscene. In the opening
	shot of the vanilla scene, Trask is unarmed and he has the little "hiccup"
	that creatures get when their weapons have just been unequipped. Then in
	the next shot he suddenly has a sword equipped. This script was originally
	the door's OnOpen, but that has now been changed to the OnFailToOpen in
	conjunction with setting the door to an initial locked state. This allows
	the door to be scripted to open, providing for adjusting the timing to fit
	the scene better. The order of things in this and subsequent scripts have
	been changed around, giving Trask the sword before the cutscene starts so
	that he is already holding it in the opening shot. The triggering of the
	cutscene has also been delayed in order to hide	the unequip hiccup.
	
	See also k_pend_cut02, k_pend_cut14, k_pend_cut23, k_pend_cut32.
	
	Issue #230: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/230
	
	DP 2019-10-08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	if (CP_HasNeverTriggered())
		{
			object oPC = GetFirstPC();
			object oTrask = GetObjectByTag("end_trask");
			object oHelper = GetObjectByTag("end01_sceneobj03");
			location lPC = GetLocation(GetObjectByTag("wp_pc_final", 0));
			location lTrask = GetLocation(GetObjectByTag("wp_trask_final", 0));
			
			SetGlobalFadeOut();
			
			NoClicksFor(0.6);
			
			// Unequip all of Trask's gear in case the player gave him anything
			ExecuteScript("k_pend_trasknkd", oTrask, -1);
			
			SetPartyLeader(NPC_PLAYER);
			RemovePartyMember(0);
			RemoveAvailableNPC(0);
			
			AssignCommand(oPC, ActionJumpToLocation(lPC));
			
			// Give Trask a sword for his upcoming fight
			object oSword = CreateItemOnObject("g_w_shortswrd01", oTrask, 1);
			AssignCommand(oTrask, ActionEquipItem(oSword, INVENTORY_SLOT_RIGHTWEAPON, TRUE));
			
			AssignCommand(oTrask, ActionJumpToLocation(lTrask));
			
			// Queue the triggering of the cutscene into Trask's action stack so it doesn't fire too early.
			// The cutscene helper already had an OUD event for this, but it appears it was previously unused.
			AssignCommand(oTrask, ActionDoCommand(SignalEvent(oHelper, EventUserDefined(50))));
		}
}
