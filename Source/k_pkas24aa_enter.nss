////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	This is the OnEnter script for kas_m24aa (Upper Shadowlands).
	
	A fix by AFP for the player potentially missing out on getting a Tach
	gland for Griff's quest if the Czerka bin containing it had previously
	been looted.
	
	2019-05-18 Updated to streamline code using some vanilla include functions.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

// Prototypes
void FreyyrBasket(int intParam1, string stringParam2, location locationParam3);
void RulanSetup();
void TachFix();

void FreyyrBasket(int intParam1, string stringParam2, location locationParam3) {
	object object1 = CreateObject(intParam1, stringParam2, locationParam3, 0);
}

void RulanSetup() {
	if (((GetGlobalBoolean("RulanSpawn") == 0) && (GetGlobalNumber("K_Geno_Rulan") == 1)))
		{
			SetGlobalBoolean("RulanSpawn", 1);
			CreateObject(1, "Rulan", GetLocation(GetObjectByTag("wp_rulanspawn", 0)), 0);
			CreateObject(64, "plc_firepit", GetLocation(GetObjectByTag("wp_rulanfirespawn", 0)), 0);
			CreateObject(64, "Grarwwaar", GetLocation(GetObjectByTag("wp_GrarwwaarSpawn", 0)), 0);
			SoundObjectPlay(GetNearestObjectByTag("cut_campfire", OBJECT_SELF, 1));
		}
}

void TachFix() {
  
  object oPC = GetFirstPC();
  object oHasGland = GetItemPossessedBy(oPC, "kas24_tachgland");
  
  int iMisTalk = GetGlobalNumber("Mis_MissionTalk");
  
  // If we've been given the tach gland mission, and haven't completed it, and don't currently have a tach gland
  if((iMisTalk >= 11) && (iMisTalk <= 14) && (!GetIsObjectValid(oHasGland)))
	  {

		object oGland = GetObjectByTag("kas24_tachgland");
		object oBox = GetObjectByTag("kas24aa_cont_05");
		object oFirstInv = GetFirstItemInInventory(oBox);
		
		if(oFirstInv == OBJECT_INVALID)
			{
			  // There's nothing in the box. Add a tach gland.
			  GiveItem(oGland, oBox);
			}
			else if(oFirstInv == oGland)
				{
				  // Do nothing. There's already a gland in the box
				}
				else
					{
					  object oNextInv = GetNextItemInInventory(oBox);
					  int iFoundGland = 0;
					 
					 // When they're the same, we've looped through everything
					  while(oNextInv != oFirstInv)
						  {
							if(oNextInv == oGland)
								{
								  iFoundGland = 1;
								  break;
								}
							oNextInv = GetNextItemInInventory(oBox);
						  }
					  
					  if(iFoundGland == 0)
						  {
							GiveItem(oGland, oBox);
						  }
					}
	  }
}

void main() {

	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oKas24_gorwook_01 = GetObjectByTag("kas24_gorwook_01", 0);
	object oKas24_basketup = GetObjectByTag("kas24_basketup", 0);
	object oKas24_baskettalk = GetObjectByTag("kas24_baskettalk", 0);
	object oKas24_gormove_1 = GetWaypointByTag("kas24_gormove_1");
	object oKas24_basketspwn = GetWaypointByTag("kas24_basketspwn");
	location location1 = GetLocation(oKas24_basketspwn);
	
	DelayCommand(0.2, RulanSetup());
	
	if ((GetForceFieldInfoLocal(OBJECT_SELF) == 0))
		{
			object oAreaObject = GetFirstObjectInArea(OBJECT_SELF, 256);
			
			while (GetIsObjectValid(oAreaObject))
				{
					if ((GetTag(oAreaObject) == "kas24_tachenc"))
						{
							SetEncounterActive(0, oAreaObject);
						}
					oAreaObject = GetNextObjectInArea(OBJECT_SELF, 32767);
				}
			SetForceFieldInfoLocal(1, OBJECT_SELF);
		}
	
	if (((GetHelpedFreyyrGlobal() == TRUE) && (GetIsObjectValid(oKas24_baskettalk) == FALSE)))
		{
			AssignCommand(oKas24_gorwook_01, JumpToObject(oKas24_gormove_1, 1));
			DestroyObject(oKas24_basketup, 0.0, 0, 0.0);
			FreyyrBasket(64, "kas24_baskettalk", location1);
		}
	
	AddJournalQuestEntry("kas23_mainwookplot", 25, 0);
	
	object oForcefieldloop = GetObjectByTag("forcefieldloop", 0);
	SoundObjectPlay(oForcefieldloop);

  DelayCommand(1.0, TachFix());
}
