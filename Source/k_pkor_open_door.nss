////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k38a_door_locked.utd in korr_m38aa (Korriban Tomb of Marka Ragnos).

	This is the OnOpen script for the door to the rogue Assassin Droid's chamber
	in the Tomb of Marka Ragnos. It checks if the party lead is wearing a stealth
	belt and initiates the cutscene. The vanilla script went about this in an
	odd manner, and it caused a bug where simply having extra stealth belts in
	the inventory, even if the party lead had a correct belt equipped, caused
	the check to fail, turning the droid hostile. Additionally, since this script
	was from the base game, it didn't account for the additional stealth belt
	available from the store on Yavin station, since that was post-launch DLC
	for the original Xbox version of the game.
	
	It should be noted that while the design intent was clearly for the player
	to be stealthed when opening the door, K1 doesn't have a script function
	to check for a creature's current stealth status (an oversight that Obsidian
	would correct in TSL). The best that can be done is to check that a stealth
	belt is equipped.
	
	Issue #280: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/280

	DP 2019-09-23                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	if (!UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
		{
			object oPM0 = GetPartyMemberByIndex(0);
			object oEquipped = GetItemInSlot(INVENTORY_SLOT_BELT, oPM0);
			string sBelt = GetTag(oEquipped);
			string sBaragwin = "G1_I_BELT001";
			string sDampening = "G_I_BELT006";
			string sAdvanced = "G_I_BELT007";
			string sEriadu = "G_I_BELT008";
			string sGenerator = "G_I_BELT010";
			string sGeno = "Geno_stealth";
			
			if (GetIsObjectValid(oEquipped))
				{
					if (sBelt == sBaragwin || sBelt == sDampening || sBelt == sAdvanced || sBelt == sEriadu || sBelt == sGenerator || sBelt == sGeno)
						{
							UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_02, TRUE);
						}
				}
			
			NoClicksFor(0.7);
			AssignCommand(oPM0, ClearAllActions());
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			DelayCommand(0.5, UT_NPC_InitConversation("k38a_assassindrd", "", OBJECT_INVALID));
		}
}
