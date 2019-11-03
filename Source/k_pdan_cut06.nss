//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by and_mandtrig01.utt in danm14ab (Dantooine Matale Grounds).
	
	This is the trigger OnEnter script for the "Take my wife and children instead!"
	cutscene where the Mandalorian raiders kill a farmer. It has been altered to
	remove the Mando's vibrosword for the duration of the cutscene, since in rare
	instances he would try to use it instead of his blaster.
	
	See also k_pdan_cut08, k_pdan_mand56.
	
	Issue #111: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/111
	
	DP 2019-11-03																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			object oPC = GetFirstPC();
			object oMando = GetObjectByTag("dan14ab_mand01", 0);
			object oItem;
			
			oItem = GetFirstItemInInventory(oMando);
			
			while (GetIsObjectValid(oItem) == TRUE)
				{
					if (GetTag(oItem) == "g_w_vbroswrd01")
						{
							DestroyObject(oItem);
						}
					
					oItem = GetNextItemInInventory(oMando);
				}
			
			AssignCommand(oMando, ActionStartConversation(oPC, "dan14ab_cut01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
		}
}
