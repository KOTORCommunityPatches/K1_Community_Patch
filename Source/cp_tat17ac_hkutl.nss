//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for cp_tat17ac_hkutl.utp in tat_m17ac (Tatooine Droid Shop).
	
	This is the UserDefine script for an added invisible placeable that handles
	hiding the transition between stunt HK and party HK. It was necessary to
	push certain functions to a third party, since the original dialogue and
	script handling the destroy function were owned by stunt HK, and destroying
	and object instantly terminates any script it was running. It jumps stunt
	HK to the other side of the room and destroy him under the cover of the
	fade-out. Additionally, an added exit script for the GUI now also jumps
	party HK into the position of stunt HK for visual continuity if the player
	chooses to add him to the party immediately.
	
	See also cp_tat17ac_hkjn, k_ptat_hk47add.
	
	Issue #310: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/310
	
	DP 2021-01-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 47)
		{
			object oStunt = GetObjectByTag("tat17_08hk47_01", 0);
			location lWoodshed = Location(Vector(5.18,-7.71,1.39), 90.00);
			
			SetGlobalFadeOut();
			
			CP_PartyJump(oStunt, lWoodshed);
			
			AddAvailableNPCByTemplate(NPC_HK_47, "p_hk47");
			
			DestroyObject(oStunt, 0.0, TRUE);
			
			ShowPartySelectionGUI("cp_tat17ac_hkjn");
		}
	else if (nUser == 1001) // HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
}
