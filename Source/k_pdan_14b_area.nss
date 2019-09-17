////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_pdan_14b_area
	
	OnEnter for danm14ab
	
	Added some new conditions regarding Casus and his diary to fix some issues
	with the quest. The quest now plays out like this:
	
	- Casus' body and diary spawn once the player has received the Sandral-Matale
	  Feud quest.
	- If the player finds the diary and returns it to Nurik Sandral, Casus' body
	  is deleted.
	- If the player finishes the Sandral-Matale Feud before finding the diary,
	  the diary will still spawn so long as the families are still alive. The
	  player may return the diary to the Sandral droid outside the estate.
	- If the Sandrals & Matales kill each other before the player finds the
	  diary, it is removed and the player never gets the Dead Settler quest.
	  Casus' body and the rest of his inventory remain.
	
	2019-05-19 Updated to streamline code using vanilla include functions.
	
	Issue #27: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/27
	
	JC 2019-02-05                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_dan"

void main() {
	
	int int1;
	int int2 = 3;
	int int3 = (2 - GetNumberOfWanderingKathHounds());
	int nGlobal = GetGlobalNumber("DAN_ROMANCE_PLOT");
	string string1 = "dan14aa_casus";
	string string2 = "dan14_hound";
	object oEntering = GetEnteringObject();
	
	if ((GetIsPC(oEntering) && (GetLoadFromSaveGame() == 0))) {
		
		object oDan14_mdroid = GetObjectByTag("dan14_mdroid", 0);
		
		if (((GetGlobalNumber("DAN_ROMANCE_PLOT") == 7) && GetIsObjectValid(oDan14_mdroid))) {
			DestroyObject(oDan14_mdroid, 0.0, 0, 0.0);
		}
		
		object oZuulanspeeder;
		
		if ((GetGlobalNumber("K_Geno_Zuulan") == 1)) {
			CreateObject(64, "zuulanspeeder", GetLocation(GetObjectByTag("wp_ZuulanSpeeder", 0)), 0);
			CreateObject(64, "cut_bike", GetLocation(GetObjectByTag("wp_ZuulanBike", 0)), 0);
			object oDan_alarm_wp = GetObjectByTag("dan_alarm_wp", 0);
			vector vPosition = GetPosition(oDan_alarm_wp);
			vector struct4 = Vector(vPosition.x, vPosition.y, (vPosition.z + 0.65000004));
			location location3 = Location(struct4, GetFacing(oDan_alarm_wp));
			CreateObject(64, "dan_alarm", location3, 0);
		}
		
		if ((GetGlobalNumber("K_Geno_Zuulan") >= 2)) {
			oZuulanspeeder = GetObjectByTag("zuulanspeeder", 0);
			if (GetIsObjectValid(oZuulanspeeder)) {
				DestroyObject(oZuulanspeeder, 0.0, 1, 0.0);
			}
		}
		
		// Added different conditions regarding Casus and his diary ~JC
		string sDiary = "dan14_diary";
		string sCasusPLC = "dan14aa_casus";
		string sCasusBody = "cp_dan_casus";
		string sCasusBones = "plc_hmnskel";
		string sKathHound = "dan14_hound";
		location lCasusPLC = GetLocation(GetObjectByTag(("wp_" + sCasusPLC), 0));
		location lCasusBody = Location(GetPosition(GetObjectByTag("wp_" + sCasusPLC, 0)) + Vector(-0.5, 0.0, 0.0), 0.0);
		location lCasusBones = Location(GetPosition(GetObjectByTag(("wp_" + sCasusPLC), 0)) + Vector(-0.1, 0.0, 0.0), -35.0);
		
		// Spawn Casus and kath hounds if the Sandral-Matale Feud has started
		if ( GetGlobalNumber("DAN_ROMANCE_PLOT") > 0 && GetGlobalNumber("DAN_CASUS_PLOT") < 1 && HasNeverTriggered() ) {
			SetGlobalNumber("DAN_CASUS_PLOT", 1);
			CreateObject(OBJECT_TYPE_PLACEABLE, sCasusPLC, lCasusPLC, FALSE);			
			CreateObject(OBJECT_TYPE_CREATURE, sCasusBody, lCasusBody, FALSE);
			int1 = 1;
			while ((int1 <= int2)) {
				CreateObject(1, sKathHound, GetLocation(GetObjectByTag((("wp_" + sKathHound) + IntToString(int1)), 0)), 0);
				(int1++);
				}
			}
		
		// If the diary was returned, remove Casus
		if( GetGlobalNumber("DAN_CASUS_PLOT") >= 3 ){
			SetGlobalBoolean("DAN_DIARY_DONE", TRUE);
			if( GetIsObjectValid(GetObjectByTag(sCasusPLC, 0)) ) DestroyObject(GetObjectByTag(sCasusPLC, 0), 0.0, 0, 0.0);
			if( GetIsObjectValid(GetObjectByTag(sCasusBody, 0)) ) {
				AssignCommand(GetObjectByTag(sCasusBody, 0), SetIsDestroyable(TRUE));
				DestroyObject(GetObjectByTag(sCasusBody, 0), 0.0, 0, 0.0);
				}
			}
		
		// Make sure the player can't find the diary if the quest is over
		if( GetGlobalBoolean("DAN_DIARY_DONE") == TRUE ) {
			if( GetIsObjectValid(GetItemPossessedBy(GetObjectByTag(sCasusPLC, 0), sDiary)) ) {
				DestroyObject(GetItemPossessedBy(GetObjectByTag(sCasusPLC, 0), sDiary), 0.0, 0, 0.0);
				}
			}
		
		// If the Sandrals & Matales are dead, the diary quest has failed
		if( GetGlobalNumber("DAN_ROMANCE_PLOT") == 7 && GetIsObjectValid(GetObjectByTag(sCasusBody, 0)) ) {
			AssignCommand(GetObjectByTag(sCasusBody, 0), SetIsDestroyable(TRUE));
			DestroyObject(GetObjectByTag(sCasusBody, 0), 0.0, 0, 0.0);
			CreateObject(OBJECT_TYPE_PLACEABLE, sCasusBones, lCasusBones, FALSE);
			}
		
		if ((int3 > 0)) {
			SpawnWanderingKathHound(int3);
			}
		}
}
