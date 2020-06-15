////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for korr_m33ab (Sith Academy Entrance).
	
	Fixes an issue with Xor refusing to appear unless the rapid transit system
	was used. This fix is attached to every module adjacent to a spaceport, so
	when the player exits any spaceport the encounter will be set to begin when
	they return, via rapid transit or otherwise. Now merged directly into the
	vanilla script rather than hijacking.
	
	Issue #29: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/29
	
	JC 2019-04-13 / DP 2020-06-15                                             */
////////////////////////////////////////////////////////////////////////////////

void PlaceNPC(int nObjectType, string sTemplate, location lLocal) {
    object oCreate = CreateObject(nObjectType, sTemplate, lLocal);
}

void main() {
	
	object oPC = GetFirstPC();
	int SW_PLOT_BOOLEAN_01 = 0;
	
	if (GetEnteringObject() == oPC)
		{
			RevealMap();
			
			object oDoor = GetObjectByTag("k33b_dor_academy", 0);
			
			if (GetGlobalNumber("KOR_SITHJOIN") > 0)
				{
					if (!GetGlobalBoolean("KOR_END_HOSTILE"))
						{
							SetLocked(oDoor, FALSE);
						}
					
					object oMekel = GetObjectByTag("kor33_mekel", 0);
					object oGoon1 = GetObjectByTag("kor33_mekfight1", 0);
					object oGoon2 = GetObjectByTag("kor33_mekfight2", 0);
					object oGoon3 = GetObjectByTag("kor33_mekfight3", 0);
					
					if (GetIsObjectValid(oMekel))
						{
							DestroyObject(oMekel, 0.0, TRUE);
						}
					if (GetIsObjectValid(oGoon1))
						{
							DestroyObject(oGoon1, 0.0, TRUE);
						}
					if (GetIsObjectValid(oGoon2))
						{
							DestroyObject(oGoon2, 0.0, TRUE);
						}
					if (GetIsObjectValid(oGoon3))
						{
							DestroyObject(oGoon3, 0.0, TRUE);
						}
				}
			
			if (GetGlobalBoolean("KOR_END_HOSTILE"))
				{
					object oMedal = GetItemPossessedBy(oPC, "k33_itm_sithmdln");
					
					if (GetIsObjectValid(oMedal))
						{
							DestroyObject(oMedal);
						}
					
					AssignCommand(oDoor, ActionCloseDoor(oDoor));
					DelayCommand(0.5, SetLocked(oDoor, TRUE));
					
					object oGuard = GetObjectByTag("k33_academyguard", 0);
					
					SetPlotFlag(oGuard, FALSE);
					ChangeToStandardFaction(oGuard, STANDARD_FACTION_HOSTILE_1);
				}
			
			if (GetAreaUnescapable() && GetGlobalBoolean("KOR_MURDER_DEAD"))
				{
					SetAreaUnescapable(FALSE);
				}
			
			if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_01) && GetGlobalBoolean("DAN_BELAYA_DEFECT") && GetGlobalNumber("DAN_JUHANI_PLOT") == 2)
				{
					SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
					
					DelayCommand(0.5, PlaceNPC(OBJECT_TYPE_CREATURE, "kor33b_belaya", GetLocation(GetObjectByTag("k33b_way_belaya", 0))));
				}
			
			// If the first Xor encounter is done, make him appear for the second one.
			if (GetGlobalBoolean("K_MESS_JUHANI") == TRUE)
				{
					if (GetGlobalNumber("K_XOR_AMBUSH") < 1 )
						{
							SetGlobalNumber("K_XOR_AMBUSH", 1);
						}
				}
		}
}
