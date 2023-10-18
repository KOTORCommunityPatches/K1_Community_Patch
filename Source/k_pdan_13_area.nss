//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for danm13 (Dantooine Jedi Enclave).
	
	This is the OnEnter for the Dantooine Enclave. It destroys any of the Taris
	items that are left over. The vanilla script failed to delete the Twisted
	Rancor Trio datapad however, so this has been added.
	
	Updated 2023-10-18 to add the missing spawn block for Sharina, which Bioware
	had mistakenly put in danm14aa's OnEnter.
	
	Issue #504: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/504
	
	Issue #705: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/705	
	
	DP 2021-12-09 / DP 2023-10-18												*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_dan"

void DestroyTarisItems() {
	
	object oPC = GetFirstPC();
	object oInvItem = GetFirstItemInInventory(oPC);
	string sInvItem;
	
	while (GetIsObjectValid(oInvItem))
		{
			sInvItem = GetTag(oInvItem);
			
			if (sInvItem == "rakghoulserum" || sInvItem == "ptar_sbpasscrd" || sInvItem == "ptar_sithpapers" || sInvItem == "ptar_sitharmor" ||
			sInvItem == "tar02_sithbasekeycard" || sInvItem == "ptar_permacrete" || sInvItem == "ptar_appjournal" || sInvItem == "ptar_rukjournal" ||
			sInvItem == "tar05_synthodor" || sInvItem == "ptar_shieldcodes" || sInvItem == "tar10_mechid" || sInvItem == "tar10_garagekey" ||
			sInvItem == "tar10_accelerator" || sInvItem == "tar05_bekplan" || sInvItem == "tar08_comppass" || sInvItem == "tar09_techlog" ||
			sInvItem == "tar03_datapad")
				{
					DelayCommand(0.1, DestroyObject(oInvItem));
				}
			
			oInvItem = GetNextItemInInventory(oPC);
		}
}

void main() {
	
	if (!GetLoadFromSaveGame())
		{
			RevealMap();
			
			string sJuhani = "dan13_juhani";
			string sRahasia = "dan13_rahasia";
			string sShen = "dan13_shen";
			int nGlobal = GetGlobalNumber("DAN_JEDI_PLOT");
		
			if (!IsAvailableCreature(NPC_CARTH))
				{
					AddAvailableNPCByTemplate(NPC_CARTH, "p_carth");
				}
				
			if (!IsAvailableCreature(NPC_BASTILA))
				{
					AddAvailableNPCByTemplate(NPC_BASTILA, "p_bastilla");
				}
			
			if (GetIsPC(GetEnteringObject()))
				{
					DestroyTarisItems();
					
					if (GetGlobalNumber("DAN_JUHANI_PLOT") == 3 && !GetGlobalBoolean("DAN_JUHANI_JOINED"))
						{
							PlaceNPC(sJuhani, "");
						}
					
					if (GetGlobalNumber("DAN_ROMANCE_PLOT") == 4)
						{
							PlaceNPC(sRahasia, "");
							PlaceNPC(sShen, "");
						}
					
					if (nGlobal > 1 && nGlobal < 7)
						{
							AssignCommand(GetObjectByTag("dan13_zhar", 0), JumpToObject(GetObjectByTag("dan13_WP_zhar01", 0)));
						}
					
					if (!GetGlobalBoolean("DAN_BASTM_DONE") && GetGlobalBoolean("DAN_STARMAP_DONE"))
						{
							AssignCommand(GetBastila(), JumpToObject(GetObjectByTag("dan13_wp_bastzone6", 0)));
						}
					
					if (GetGlobalNumber("DAN_ROMANCE_PLOT") > 0)
						{
							DestroyObject(GetObjectByTag("dan13_ahlan", 0));
						}
					
					if (GetEliseInCompound() && !GetElisePlotDone())
						{
							PlaceNPC("dan13_elise", "");
							
							if (GetEliseDroidReturned())
								{
									PlaceNPC("dan13_c869", "");
								}
								else
									{
										PlaceNPC("dan13_samnt", "");
									}
						}
					
					if (GetGlobalNumber("KOR_KEL_DOUBT") == 4)
						{
							PlaceNPC("dan13_kelalgwinn", "");
						}
					
					if (GetGlobalBoolean("tat_SharinaPaidFull"))
						{
							PlaceNPC("dan13_zzshari", "");
						}
				}
				else
					{
						object oCarth = GetObjectByTag("carth", 0);
						object oBastila = GetObjectByTag("bastila", 0);
						
						if (GetIsObjectValid(oCarth))
							{
								SetAvailableNPCId(NPC_CARTH, oCarth);
							}
						
						if (GetIsObjectValid(oBastila))
							{
								SetAvailableNPCId(NPC_BASTILA, oBastila);
							}
					}
		}
}
