//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for kor36_tukataquee.utc in korr_m36aa (Korriban Valley of Dark Lords).
	
	This script is the OnUserDefine for the Tukata Mother. When teaming up with
	Lashowe to kill her, occasionally a placeable bench with no tag will spawn
	on top of her corpse. It seems likely that this is a bug caused by an
	invalid ResRef called by UT_CreateObject. Possibly this was cut content
	of some sort that wasn't excised from the vanilla script before shipping.
	
	Updated 2023-12-07 to have the OnDeath event store a global location for the
	Mother's corpse. It seems clear that Bioware's original intent was for there
	to be either a placeable corpse or an invisible placeable spawned when the
	mother dies that Lashowe would then walk to. For whatever reason that wasn't
	properly implemented. Now the approach used for the Taris Swoop Platform to
	have Bastila loot Brejik's corpse has been copied, since they created a global
	specifically for that purpose that does not appear to be utilised anywhere
	else in the game subsequently. Her corpse is now also set to not disappear by
	another script before combat begins.
	
	See also cp_kor36_lashtrn, k36_las_takeholo.
	
	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163
	
	DP 2019-08-03 / DP 2023-12-07												*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
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
			object oTukMook1 = GetObjectByTag("kor36_tukatahen1", 0);
			object oTukMook2 = GetObjectByTag("kor36_tukatahen2", 0);
			
			SetGlobalLocation("TAR_BREJIKCORPSE", GetLocation(OBJECT_SELF));
			SetGlobalBoolean("KOR_TUKATAQUEEN", TRUE);
			
			if (GetIsDead(oTukMook1) && GetIsDead(oTukMook2))
				{
					object oLashowe = GetObjectByTag("kor36_lashowe", 0);
					
					SetGlobalBoolean("KOR_TUKATA_GONE", TRUE);
					
					CancelCombat(oLashowe);
					ChangeToStandardFaction(oLashowe, STANDARD_FACTION_NEUTRAL);
					
					DelayCommand(0.5, UT_NPC_InitConversation("kor36_lashowe"));
				}
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
