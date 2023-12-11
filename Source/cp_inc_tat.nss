//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_inc_tat
	
	Include script for Tatooine.
																				*/
//////////////////////////////////////////////////////////////////////////////////

//#include "cp_inc_debug"


// Adjusts Sand People reputation to either hostile or neutral.
void CP_AdjustSandRep(object oTarget, int nHostile);

// Corrects Sand People reputation when party is disguised.
void CP_SandRepFix();

// Spawns Griff and his guards inside the Sand People Enclave.
void CP_SpawnGriff();

// Removes the Sand People disguise from the target and equips basic clothing.
void CP_StripDisguise(object oTarget);

// Spawns a herd of Wraid type 1 in the Dune Sea.
void CP_SpawnWraidHerdA(location lLocation);

// Spawns a herd of Wraid type 2 in the Dune Sea.
void CP_SpawnWraidHerdB(location lLocation);

// Spawns a herd of Wraid type 3 in the Dune Sea.
void CP_SpawnWraidHerdC(location lLocation);

// Spawns the NPCs for the GenoHaradan fight in the Dune Sea.
void CP_SpawnGenoFight();

// Spawns the Sand People guard in the Sand People Territory outside their Enclave.
void CP_SpawnGuard();

// Spawns Vorn and his droid in the Sand People Territory for the GenoHaradan quest.
void CP_VornSpawn();

// Spawns the holocron of Bastila's father in the Krayt cave of the Eastern Dune Sea.
void CP_CreateHolocron();

// Sets any Sand People disguises the party has to useable. Taken from k_inc_tat.
void CP_SandpeopleDisguiseUsable();

// Returns the state of the global for working for the Sand People chieftain. Taken from k_inc_tat.
int CP_GetTuskenJobGlobal();

// Sets the state of the global for working for the Sand People chieftain. Taken from k_inc_tat.
void CP_SetTuskenJobGlobal(int bValue);

// Gets the state of the local for spawning the guard when working for the Sand People chieftain. Taken from k_inc_tat.
int CP_GetTuskenDoneLocal();

// Sets the state of the local for spawning the guard when working for the Sand People chieftain. Taken from k_inc_tat.
void CP_SetTuskenDoneLocal(int bValue);


//////////////////////////////////////////////////////////////////////////////////
/*	CP_AdjustSandRep()
	
	This automatically sets the Sand People reputation so their faction will
	never have a value other than 0 (hostile) or 50 (neutral).
	
	- oTarget:	Object of faction to change. An invisible placeable is used for
				controlling the Sand People faction.
	- nHostile:	hostile = TRUE, neutral = FALSE.
	
	JC 2019-09-01																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_AdjustSandRep(object oTarget, int nHostile) {
	
	object oPC = GetFirstPC();
	
	if (nHostile == TRUE)
		{
			//CP_DebugMsg("SAND PEOPLE REP CURRENTLY " + IntToString(GetReputation(oTarget, oPC)) + ", ADJUSTING TO HOSTILE.");
			AdjustReputation(oPC, oTarget, -GetReputation(oTarget, oPC));
		}
		else
			{
				//CP_DebugMsg("SAND PEOPLE REP CURRENTLY " + IntToString(GetReputation(oTarget, oPC)) + ", ADJUSTING TO NEUTRAL.");
				AdjustReputation(oPC, oTarget, 50 - GetReputation(oTarget, oPC));
			}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SandRepFix()
	
	Triggers the Sand People to be hostile or neutral depending on various
	circumstances. Fixes several issues with their faction being wrong.
	
	Used in area enter and heartbeat scripts.
	
	Updated 2023-08-16 to correctly set the disguise global to true when the whole
	party is all wearing disguises (and/or made up of droids).
	
	Updated 2023-12-11 to set the suit global to false when the party is no longer
	disguised. Prevents it getting permanently set true when working for the chief
	even when not wearing them, which can mess with certain dialogues.
	
	JC 2019-09-01 / DP 2023-12-11												*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SandRepFix() {

	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oSandFaction = GetObjectByTag("tat18_tuskanfac", 0); // An invisible placeable controls the attitude of the Sand People faction
	int nCheck0 = FALSE;
	int nCheck1 = FALSE;
	int nCheck2 = FALSE;
	string sDisguise = "tat17_sandperdis";
	
	// Check the party leader to see if they're disguised (or a droid or not there)
	if (!GetIsObjectValid(oPM0) || GetTag(oPM0) == "HK47" || GetTag(oPM0) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM0)) == sDisguise)
		{
			nCheck0 = TRUE;
		}
	
	// Check the first party member to see if they're disguised (or a droid or not there)
	if (!GetIsObjectValid(oPM1) || GetTag(oPM1) == "HK47" || GetTag(oPM1) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM1)) == sDisguise)
		{
			nCheck1 = TRUE;
		}
	
	// Check the second party member to see if they're disguised (or a droid or not there)
	if (!GetIsObjectValid(oPM2) || GetTag(oPM2) == "HK47" || GetTag(oPM2) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM2)) == sDisguise)
		{
			nCheck2 = TRUE;
		}
	
	/*CP_DebugMsg(CP_GetGlobalState("tat_TuskenSuit") + " / " + CP_GetGlobalState("tat_TuskenJob") + " / " + CP_GetGlobalState("tat_TuskenMad")
	+ " / " + CP_NPCName(oPM0) + " SUIT = " + CP_BoolToString(nCheck0) + " / " + CP_NPCName(oPM1) + " SUIT = " + CP_BoolToString(nCheck1)
	+ " / " + CP_NPCName(oPM2) + " SUIT = " + CP_BoolToString(nCheck2));*/
	
	// If the disguise global is true but the party is not wearing the disguise then set the global back to false but don't adjust rep. Prevents it getting
	// permanently set true if working for the chief, since some DLGs use it to gate specific lines about wearing the disguise.
		if (GetGlobalBoolean("tat_TuskenSuit") == TRUE && ( nCheck0 == FALSE || nCheck1 == FALSE || nCheck2 == FALSE ))
			{
				//CP_DebugMsg("SUIT GLOBAL TRUE BUT PARTY NOT DISGUISED. SET GLOBAL FALSE.");
				SetGlobalBoolean("tat_TuskenSuit", FALSE);
			}
	
	// If the player is working for the Chieftain, make the Sand People friendly
	if (GetGlobalBoolean("tat_TuskenJob") == TRUE & GetGlobalBoolean("tat_TuskenMad") == FALSE)
		{
			//CP_DebugMsg("WORKING FOR CHIEFTAIN AND SAND PEOPLE NOT MAD. ADJUST REP NEUTRAL.");
			CP_AdjustSandRep(oSandFaction, FALSE);
		}
	
	// If the player hasn't angered the Sand People, but the disguise global isn't set, correct the Sand People attitude
	if (GetGlobalBoolean("tat_TuskenSuit") == FALSE && GetGlobalBoolean("tat_TuskenMad") == FALSE)
		{
			// If the whole party is disguised, set the disguise global and make Sand People friendly
			if (nCheck0 == TRUE && nCheck1 == TRUE && nCheck2 == TRUE)
				{
					//CP_DebugMsg("PARTY DISGUISED AND SAND PEOPLE NOT MAD. SUIT GLOBAL FALSE, SET TRUE AND ADJUST REP NEUTRAL.");
					CP_AdjustSandRep(oSandFaction, FALSE);
					SetGlobalBoolean("tat_TuskenSuit", TRUE);
				}
				// If somebody isn't disguised and the player isn't working for the Chieftain, make Sand People hostile but don't change the disguise global
				else if (GetGlobalBoolean("tat_TuskenJob") == FALSE)
					{
						//CP_DebugMsg("NOT WORKING FOR CHIEFTAIN, SAND PEOPLE NOT MAD, PARTY NOT DISGUISED. SUIT GLOBAL FALSE BUT DON'T CHANGE. ADJUST REP HOSTILE.");
						CP_AdjustSandRep(oSandFaction, TRUE);
					}
		}
	
	// Disguise global is already set or player has angered Sand People
	else
		{
			// If anybody isn't disguised or if the Sand People have been angered, and the player isn't working for the Chieftain, make Sand People hostile and set the disguise global
			if ((nCheck0 == FALSE || nCheck1 == FALSE || nCheck2 == FALSE || GetGlobalBoolean("tat_TuskenMad") == TRUE) && GetGlobalBoolean("tat_TuskenJob") == FALSE)
				{
					//CP_DebugMsg("NOT WORKING FOR CHIEFTAIN, PARTY NOT DISGUISED OR SAND PEOPLE MAD. ADJUST REP HOSTILE, SET SUIT GLOBAL FALSE.");
					CP_AdjustSandRep(oSandFaction, TRUE);
					SetGlobalBoolean("tat_TuskenSuit", FALSE);
				}
		}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpawnGriff()
	
	Spawns Mission's brother Griff and his four Sand People guards inside the
	Enclave when Mission's quest is at the right stage. The vanilla function
	used a local boolean on the module to prevent spawning duplicates, but
	occasionally the function would trigger without actually spawning him,
	meaning that he would never spawn due to the local, breaking the quest.
	
	Used in the Sand People Enclave OnEnter (k_ptat20aa_enter).
	
	Issue #512: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/512
	
	DP 2021-11-29																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SpawnGriff() {
	
	if (GetGlobalNumber("Mis_MissionTalk") == 9 && !GetIsObjectValid(GetObjectByTag("tat20_griff")))
		{
			int SW_PLOT_BOOLEAN_01 = 0;
			// Original vanilla Griff check which could fail.
			// SetGriffSpawnLocal(TRUE);
			// Still set the boolean in case it is used elsewhere, but cut out extraneous include guff.
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_griff", GetLocation(GetWaypointByTag("tat20_wp_griff")));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 0)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 1)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 2)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 3)));
			//DelayCommand(0.5, CP_DebugMsg("SPAWNING GRIFF AND 4 GUARDS"));
		}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_StripDisguise()
	
	Removes the Sand People disguise if it is equipped on the target NPC and equips
	basic clothing.
	
	Updated 2022-12-22 to simply things by equipping clothing directly rather than
	doing so via a different function, since that was apparently causing crashes.
	
	DP 2021-12-18 / DP 2022-12-22												*/
//////////////////////////////////////////////////////////////////////////////////
void CP_StripDisguise(object oTarget) {
	
	object oTorsoItem = GetItemInSlot(INVENTORY_SLOT_BODY, oTarget);
	object oClothes = CreateItemOnObject("g_a_clothes01", oTarget);

	if (GetTag(oTorsoItem) == "tat17_sandperdis")
		{
			AssignCommand(oTarget, ClearAllActions());
			AssignCommand(oTarget, ActionUnequipItem(oTorsoItem, TRUE));
			DestroyObject(oTorsoItem);
			AssignCommand(oTarget, ClearAllEffects());
			DelayCommand(0.1, AssignCommand(oTarget, ActionEquipItem(oClothes, INVENTORY_SLOT_BODY, TRUE)));
		}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpawnWraidHerdA()
	
	Spawns a herd of Wraid type 1 in the Dune Sea.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SpawnWraidHerdA(location lLocation) {
	
	object oPC = GetFirstPC();
	int nLevel = (GetLevelByPosition(1, oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC));
	
	if (nLevel > 11)
		{
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid21", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid21", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid21", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid21", lLocation, FALSE);
			//DelayCommand(0.5, CP_DebugMsg("SPAWN WRAID HERD A > 11"));
		}
		else
			{
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid01", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid01", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid01", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid01", lLocation, FALSE);
				//DelayCommand(0.5, CP_DebugMsg("SPAWN WRAID HERD A <= 11"));
			}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpawnWraidHerdB()
	
	Spawns a herd of Wraid type 2 in the Dune Sea.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SpawnWraidHerdB(location lLocation) {
	
	object oPC = GetFirstPC();
	int nLevel = (GetLevelByPosition(1, oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC));
	
	if (nLevel > 11)
		{
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid22", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid22", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid22", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid22", lLocation, FALSE);
			//DelayCommand(0.5, CP_DebugMsg("SPAWN WRAID HERD B > 11"));
		}
		else
			{
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid02", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid02", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid02", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid02", lLocation, FALSE);
				//DelayCommand(0.5, CP_DebugMsg("SPAWN WRAID HERD B <= 11"));
			}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpawnWraidHerdC()
	
	Spawns a herd of Wraid type 3 in the Dune Sea.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SpawnWraidHerdC(location lLocation) {
	
	object oPC = GetFirstPC();
	int nLevel = (GetLevelByPosition(1, oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC));
	
	if (nLevel > 11)
		{
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid23", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid23", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid23", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid23", lLocation, FALSE);
			//DelayCommand(0.5, CP_DebugMsg("SPAWN WRAID HERD C > 11"));
		}
		else
			{
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid03", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid03", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid03", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid03", lLocation, FALSE);
				//DelayCommand(0.5, CP_DebugMsg("SPAWN WRAID HERD C <= 11"));
			}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpawnGenoFight()
	
	Spawns the NPCs for the GenoHaradan fight in the Dune Sea.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SpawnGenoFight() {
			location location1 = GetLocation(GetObjectByTag("tat_bh_hulas_wp", 0));
			location location3 = GetLocation(GetObjectByTag("tat_bh_senni_wp", 0));
			location location5 = GetLocation(GetObjectByTag("tat_bh_bounty_wp", 0));
			location location7 = GetLocation(GetObjectByTag("tat_bh_thug1_wp", 0));
			location location9 = GetLocation(GetObjectByTag("tat_bh_thug2_wp", 0));
			location location11 = GetLocation(GetObjectByTag("tat_bh_thug3_wp", 0));
			location location13 = GetLocation(GetObjectByTag("tat_bh_thug4_wp", 0));
			location location15 = GetLocation(GetObjectByTag("tat_bh_bike1_wp", 0));
			location location17 = GetLocation(GetObjectByTag("tat_bh_bike2_wp", 0));
			location location19 = GetLocation(GetObjectByTag("tat_bh_bike3_wp", 0));
			location location21 = GetLocation(GetObjectByTag("tat_bh_speeder1_wp", 0));
			location location23 = GetLocation(GetObjectByTag("tat_bh_speeder2_wp", 0));
			
			CreateObject(OBJECT_TYPE_CREATURE, "n_duros001", location1, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_senni", location3, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_bounty", location5, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_thug1", location7, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_thug2", location9, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_thug3", location11, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_thug4", location13, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bike1", location15, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bike1", location17, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bike1", location19, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_speeder1", location21, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_speeder1", location23, 0);
			//DelayCommand(0.5, CP_DebugMsg("SPAWNING GENO FIGHT"));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpawnGuard()
	
	Spawns the Sand People guard in the Sand People Territory outside their Enclave.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SpawnGuard() {
	object oWP = GetWaypointByTag("tat18_wp_sguard");
	location lSpawn = GetLocation(oWP);
	
	CreateObject(OBJECT_TYPE_CREATURE, "tat18_14sandg_01", lSpawn, FALSE);
	//DelayCommand(0.5, CP_DebugMsg("SPAWNING SAND PEOPLE GUARD"));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_VornSpawn()
	
	Spawns Vorn and his droid in the Sand People Territory for the GenoHaradan quest.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_VornSpawn() {
	vector vBike = Vector(242.835114, 286.128601, 89.715797);
	location lBike = Location(vBike, 55.75);
	
	CreateObject(OBJECT_TYPE_PLACEABLE, "Vornsbike", lBike, FALSE);
	CreateObject(OBJECT_TYPE_CREATURE, "Vornsdroid", GetLocation(GetObjectByTag("wp_Vorndroidspawn", 0)), FALSE);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_hide", GetLocation(GetObjectByTag("tat_hide_wp", 0)), FALSE);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_junk", GetLocation(GetObjectByTag("tat_junk_wp", 0)), FALSE);
	//DelayCommand(0.5, CP_DebugMsg("SPAWNING GENO VORN"));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_CreateHolocron()
	
	Spawns the holocron of Bastila's father in the Krayt cave of the Eastern Dune
	Sea as part of her personal quest.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_CreateHolocron() {
	
	object oWP = GetWaypointByTag("K_SWG_BODY_LOC");
	location lWP = GetLocation(oWP);
	
	CreateObject(OBJECT_TYPE_PLACEABLE, "k_swg_helena01", lWP);
	//DelayCommand(0.5, CP_DebugMsg("SPAWNING BASTILA'S HOLOCRON"));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SandpeopleDisguiseUsable()
	
	Sets any Sand People disguises the party has to useable. Taken from k_inc_tat.
	Added here to reduce unnecessary vanilla include guff.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SandpeopleDisguiseUsable() {
	object oPC = GetFirstPC();
	object oItem = GetFirstItemInInventory(oPC);
	
	while (GetIsObjectValid(oItem))
		{
			if (GetTag(oItem) == "tat17_sandperdis")
				{
					SetItemNonEquippable(oItem, FALSE);
				}
			
			oItem = GetNextItemInInventory(oPC);
		}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetTuskenJobGlobal()
	
	Returns the state of the global for working for the Sand People chieftain.
	Taken from k_inc_tat. Added here to reduce unnecessary vanilla include guff.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
int CP_GetTuskenJobGlobal() {
	return GetGlobalBoolean("tat_TuskenJob");
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SetTuskenJobGlobal()
	
	Sets the state of the global for working for the Sand People chieftain. Taken
	from k_inc_tat. Added here to reduce unnecessary vanilla include guff.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SetTuskenJobGlobal(int bValue) {
	if (bValue == TRUE || bValue == FALSE)
		{
			SetGlobalBoolean("tat_TuskenJob", bValue);
		}
	
	return;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetTuskenDoneLocal()
	
	Gets the state of the local for spawning the guard when working for the Sand
	People chieftain. Taken from k_inc_tat. Added here to reduce unnecessary vanilla
	include guff.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
int CP_GetTuskenDoneLocal() {
	int SW_PLOT_BOOLEAN_01 = 0;
	
	return GetLocalBoolean(GetArea(OBJECT_SELF), SW_PLOT_BOOLEAN_01);
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SetTuskenDoneLocal()
	
	Sets the state of the local for spawning the guard when working for the Sand
	People chieftain. Taken from k_inc_tat. Added here to reduce unnecessary vanilla
	include guff.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SetTuskenDoneLocal(int bValue) {
	int SW_PLOT_BOOLEAN_01 = 0;
	
	if (bValue == TRUE || bValue == FALSE)
		{
			SetLocalBoolean(GetArea(OBJECT_SELF), SW_PLOT_BOOLEAN_01, bValue);
		}
    
	return;
}
