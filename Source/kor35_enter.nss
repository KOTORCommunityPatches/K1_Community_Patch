//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Module OnEnter for korr_m35aa (Korriban Sith Academy)
	
	This is the OnEnter script for the Academy. A few changes have been made to
	deal with various issues. The datapad in Uthar's room for the Finding Dustil
	quest is now destroyed if the Academy has turned hostile. Party members being
	added back post-Tomb of Naga Sadow are now both jumped back to the rear
	entrance properly, rather than leaving one stranded in the central chamber.
	
	Updated 2022-06-23 to check for Ajunta Pall's sword and the Naga Sadow saber
	and remove the plot flags from them. Additionally cleaned up the code a little
	and switched to some CP include functions.
	
	DP 2019-08-11 / DP 2022-06-23												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

int GetFlag() {
	return UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01);
}

int DustilStatus() {
	return GetGlobalBoolean("KOR_DUSTIL_SPAWN");
}

int ShaardanStatus() {
	return GetGlobalNumber("KOR33_SHAARDAN");
}

void DestroyDatapad() {

	object oUthLocker = GetObjectByTag("k35_uthar_ftlckr", 0);
    object oItem = GetFirstItemInInventory(oUthLocker);
	
	if (GetIsObjectValid(oUthLocker))
		{
			while (GetIsObjectValid(oItem))
				{
					if (GetTag(oItem) == "datapad")
						{
							DestroyObject(oItem);
							return;
						}

					oItem = GetNextItemInInventory(oUthLocker);
				}
		}
}

void JumpParty() {
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPM1 = Location(Vector(119.25,150.0,0.15), 90.0);
	location lPM2 = Location(Vector(123.75,150.0,0.15), 90.0);
	
	AssignCommand(oPM1, CP_DisableAI(TRUE));
	AssignCommand(oPM2, CP_DisableAI(TRUE));
	
	DelayCommand(0.1, UT_TeleportPartyMember(oPM1, lPM1));
	DelayCommand(0.1, UT_TeleportPartyMember(oPM2, lPM2));
	
	DelayCommand(0.2, AssignCommand(oPM1, CP_DisableAI(FALSE)));
	DelayCommand(0.2, AssignCommand(oPM2, CP_DisableAI(FALSE)));
	
	DelayCommand(0.3, AssignCommand(oPM1, ActionMoveToObject(oPC, TRUE, 2.0)));
	DelayCommand(0.3, AssignCommand(oPM2, ActionMoveToObject(oPC, TRUE, 2.0)));
}

void RemoveItemPlotFlags() {
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oSword_PC = GetItemPossessedBy(oPC, "k37_itm_freedont");
	object oSword_PM1 = GetItemPossessedBy(oPM1, "k37_itm_freedont");
	object oSword_PM2 = GetItemPossessedBy(oPM2, "k37_itm_freedont");
	object oSaber = GetItemPossessedBy(oPC, "k39_itm_cersaber");
	
	if (GetIsObjectValid(oSword_PC))
		{
			SetPlotFlag(oSword_PC, FALSE);
		}
	
	if (GetIsObjectValid(oSword_PM1))
		{
			SetPlotFlag(oSword_PM1, FALSE);
		}
	
	if (GetIsObjectValid(oSword_PM2))
		{
			SetPlotFlag(oSword_PM2, FALSE);
		}
	
	if (GetIsObjectValid(oSaber))
		{
			SetPlotFlag(oSaber, FALSE);
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oEntering = GetEnteringObject();
	int nGlobal = GetGlobalNumber("KOR_FINAL_TEST");
	
	if (oEntering == oPC)
	{
		if (GetGlobalNumber("KOR_SHAARDAN_SWORD") == 2 && GetGlobalNumber("KOR33_SHAARDAN") != 5)
			{
				object oShaardanA = GetObjectByTag("kor35_shaardan", 0);
				
				if (GetIsObjectValid(oShaardanA))
					{
						object oWP_Shaardan = GetObjectByTag("k35_way_shaaswrd", 0);
						
						AssignCommand(oShaardanA, ClearAllActions());
						AssignCommand(oShaardanA, ActionJumpToObject(oWP_Shaardan));
					}
			}
		
		if (ShaardanStatus() >= 4)
			{
				object oShaardanB = GetObjectByTag("kor35_shaardan", 0);
				
				if (GetIsObjectValid(oShaardanB))
					{
						DestroyObject(oShaardanB);
					}
			}
		
		if (GetGlobalNumber("KOR_LASHOWE_PLOT") >= 5)
			{
				object oLashowe = GetObjectByTag("kor35_lashowe", 0);
				
				if (GetIsObjectValid(oLashowe))
					{
						DestroyObject(oLashowe);
					}
			}
		
		if (GetGlobalNumber("KOR_MEKEL_KILLED") >= 1 || GetGlobalBoolean("KOR_MEKEL_LIGHT"))
			{
				object oMekel = GetObjectByTag("kor35_mekel", 0);
				
				if (GetIsObjectValid(oMekel))
					{
						DestroyObject(oMekel);
					}
			}
		
		if (GetGlobalNumber("KOR_DANEL") == 2 && !DustilStatus())
			{
				object oWP_Locker = GetObjectByTag("k35_way_locker", 0);
				object oWP_Dustil = GetObjectByTag("k35_way_dustil", 0);
				location lDustil = GetLocation(oWP_Dustil);
				location lLocker = GetLocation(oWP_Locker);
				
				SetGlobalBoolean("KOR_DUSTIL_SPAWN", TRUE);
				
				CreateObject(OBJECT_TYPE_CREATURE, "kor35_dustil", lDustil);
				CreateObject(OBJECT_TYPE_PLACEABLE, "k35_uthar_ftlckr", lLocker);
			}
		
		if (nGlobal > 3 && !GetFlag())
			{
				int nCount;
				int nNPCID;
				string sNPC;
				
				SetGlobalBoolean("KOR_ADD_PARTY", TRUE);
				
				UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
				
				nCount = 0;
				
				while (nCount < GetGlobalNumber("KOR_REMOVE_PCS"))
					{
						nNPCID = GetGlobalNumber("KOR_REMOVE_PC" + IntToString(nCount));
						
						switch (nNPCID)
							{
								case 0:
									sNPC = "Bastila";
									break;
								case 1:
									sNPC = "Cand";
									break;
								case 2:
									sNPC = "Carth";
									break;
								case 3:
									sNPC = "HK47";
									break;
								case 4:
									sNPC = "Jolee";
									break;
								case 5:
									sNPC = "Juhani";
									break;
								case 6:
									sNPC = "Mission";
									break;
								case 7:
									sNPC = "T3M4";
									break;
								case 8:
									sNPC = "Zaalbar";
									break;
							}
						
						AddPartyMember(nNPCID, GetObjectByTag(sNPC, 0));
						
						nCount++;
					}
				
				// Delay the party jumping to make sure they have been
				// properly added back first by the above loop.
				DelayCommand(0.5, JumpParty());
				
				// Remove the plot flags from Ajunta Pall's sword and the Naga Sadow lightsaber.
				DelayCommand(1.0, RemoveItemPlotFlags());
			}
		
		if (nGlobal == 4 || nGlobal == 7)
			{
				object oUtharA = GetObjectByTag("kor35_utharwynn", 0);
				object oYuthuraA = GetObjectByTag("kor35_yuthura", 0);
				object oAdrenasA = GetObjectByTag("kor35_adrenas", 0);
				
				if (GetIsObjectValid(oUtharA))
					{
						DestroyObject(oUtharA);
					}
				
				if (GetIsObjectValid(oYuthuraA))
					{
						DestroyObject(oYuthuraA);
					}
				
				if (GetIsObjectValid(oAdrenasA))
					{
						DestroyObject(oAdrenasA);
					}
			}
			else if (nGlobal == 5)
				{
					object oAdrenasB = GetObjectByTag("kor35_adrenas", 0);
					object oUtharB = GetObjectByTag("kor35_utharwynn", 0);
					
					if (GetIsObjectValid(oAdrenasB))
						{
							DestroyObject(oAdrenasB);
						}
					
					if (GetIsObjectValid(oUtharB))
						{
							DestroyObject(oUtharB);
						}
				}
				else if (nGlobal == 6)
					{
						object oYuthuraB = GetObjectByTag("kor35_yuthura", 0);
						object oAdrenasC = GetObjectByTag("kor35_adrenas", 0);
						object oUtharC = GetObjectByTag("kor35_utharwynn", 0);
						object oWP_Uthar = GetObjectByTag("k35_way_utharstt", 0);
						
						if (GetIsObjectValid(oYuthuraB))
							{
								DestroyObject(oYuthuraB);
							}
						
						if (GetIsObjectValid(oAdrenasC))
							{
								DestroyObject(oAdrenasC);
							}
						
						AssignCommand(oUtharC, ActionJumpToObject(oWP_Uthar));
					}
		
		if (GetGlobalBoolean("KOR_END_HOSTILE"))
			{
				SetGlobalFadeOut(0.0, 2.0);
				
				object oCaptive = GetNearestObjectByTag("kor35_captive9", OBJECT_SELF, 1);
				object oVictim = GetObjectByTag("kor35_victim", 0);
				object oDuelist = GetObjectByTag("kor35_sithduel", 0);
				object oDroid = GetObjectByTag("kor35_deaddroid", 0);
				object oComp = GetObjectByTag("kor35_duelcomp", 0);
				object oTorturer = GetObjectByTag("kor35_torturer", 0);
				
				if (GetIsObjectValid(oCaptive))
					{
						DestroyObject(oCaptive);
					}
				
				if (GetIsObjectValid(oVictim))
					{
						DestroyObject(oVictim);
					}
				
				if (GetIsObjectValid(oDuelist))
					{
						DestroyObject(oDuelist);
					}
				
				if (!GetIsDead(oDroid))
					{
						ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oDroid);
					}
				
				if (GetIsObjectValid(oComp))
					{
						DestroyObject(oComp);
					}
				
				if (GetIsObjectValid(oTorturer))
					{
						DestroyObject(oTorturer);
					}
				
				// Destroy the datapad in Uthar's room, since Dustil is now hostile and he can't be told the truth.
				// Quest is resolved with additional journal entries set via his revised OnDeath script.
				DestroyDatapad();
				
				DelayCommand(1.0, ChangeFactionByFaction(STANDARD_FACTION_NEUTRAL, STANDARD_FACTION_HOSTILE_1));
				
				SetGlobalFadeIn(2.0, 1.0);
				
				SetGlobalBoolean("KOR_PRISONERS_FREE", TRUE);
			}
	}
}
