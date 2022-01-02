//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for kas_m24aa (Upper Shadowlands).
	
	A fix by AFP for the player potentially missing out on getting a Tach
	gland for Griff's quest if the Czerka bin containing it had previously
	been looted.
	
	2019-05-18 Updated to streamline code using some vanilla include functions.
	
	2022-01-02 Updated to fix an incorrect include function reference.
	
	2019-03-18 / DP 2019-05-18 / DP 2022-01-02									*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

void CreateBasket(int nType, string sTemplate, location lLocation) {
	object oBasket = CreateObject(nType, sTemplate, lLocation);
}

void RulanSetup() {
	if (GetGlobalBoolean("RulanSpawn") == FALSE && GetGlobalNumber("K_Geno_Rulan") == 1)
		{
			SetGlobalBoolean("RulanSpawn", TRUE);
			CreateObject(OBJECT_TYPE_CREATURE, "Rulan", GetLocation(GetObjectByTag("wp_rulanspawn", 0)), 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "plc_firepit", GetLocation(GetObjectByTag("wp_rulanfirespawn", 0)), 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "Grarwwaar", GetLocation(GetObjectByTag("wp_GrarwwaarSpawn", 0)), 0);
			SoundObjectPlay(GetNearestObjectByTag("cut_campfire", OBJECT_SELF, 1));
		}
}

void TachFix() {
  object oPC = GetFirstPC();
  object oHasGland = GetItemPossessedBy(oPC, "kas24_tachgland");
  
  int nMisTalk = GetGlobalNumber("Mis_MissionTalk");
  
	// If we've been given the tach gland mission, and haven't completed it, and don't currently have a tach gland
	if (nMisTalk >= 11 && nMisTalk <= 14 && !GetIsObjectValid(oHasGland))
		{
			object oGland = GetObjectByTag("kas24_tachgland");
			object oBox = GetObjectByTag("kas24aa_cont_05");
			object oFirstInv = GetFirstItemInInventory(oBox);
			
			if (oFirstInv == OBJECT_INVALID)
				{
					// There's nothing in the box. Add a tach gland.
					GiveItem(oGland, oBox);
				}
				else if (oFirstInv == oGland)
					{
						// Do nothing. There's already a gland in the box
					}
					else
						{
							object oNextInv = GetNextItemInInventory(oBox);
							int nFoundGland = 0;
							
							// When they're the same, we've looped through everything
							while (oNextInv != oFirstInv)
								{
									if (oNextInv == oGland)
										{
											nFoundGland = 1;
											break;
										}
								
									oNextInv = GetNextItemInInventory(oBox);
								}
							
							if (nFoundGland == 0)
								{
									GiveItem(oGland, oBox);
								}
						}
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oEntering = GetEnteringObject();
	object oGorwook = GetObjectByTag("kas24_gorwook_01", 0);
	object oBasket = GetObjectByTag("kas24_basketup", 0);
	object oBasketTalk = GetObjectByTag("kas24_baskettalk", 0);
	object oWP_Gor = GetWaypointByTag("kas24_gormove_1");
	object oWP_Bask = GetWaypointByTag("kas24_basketspwn");
	object oFieldSFX = GetObjectByTag("forcefieldloop", 0);
	object oForceField = GetObjectByTag("kas24_forcefield", 0);
	location lBasket = GetLocation(oWP_Bask);
	
	DelayCommand(0.2, RulanSetup());
	
	if (GetEnteredShadowlandsLocal(OBJECT_SELF) == FALSE)
		{
			object oAreaObject = GetFirstObjectInArea(OBJECT_SELF, OBJECT_TYPE_ENCOUNTER);
			
			while (GetIsObjectValid(oAreaObject))
				{
					if (GetTag(oAreaObject) == "kas24_tachenc")
						{
							SetEncounterActive(FALSE, oAreaObject);
						}
					
					oAreaObject = GetNextObjectInArea(OBJECT_SELF, OBJECT_TYPE_ALL);
				}
			
			SetEnteredShadowlandsLocal(TRUE, OBJECT_SELF);
		}
	
	if (GetHelpedFreyyrGlobal() == TRUE && GetIsObjectValid(oBasketTalk) == FALSE)
		{
			AssignCommand(oGorwook, JumpToObject(oWP_Gor));
			DestroyObject(oBasket);
			CreateBasket(OBJECT_TYPE_PLACEABLE, "kas24_baskettalk", lBasket);
		}
	
	AddJournalQuestEntry("kas23_mainwookplot", 25);
	
	SoundObjectPlay(oFieldSFX);

	DelayCommand(1.0, TachFix());
}
