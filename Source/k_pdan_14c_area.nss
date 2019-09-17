////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnEnter for module danm14ac (Grove).
	
	A minor edit of the OnEnter to add in an appropriate reference to the
	new creature-based corpse added by K1CP to the Murder Mystery quest.
	
	2019-05-19 Updated to streamline code using vanilla include functions and
	add in additional command to make sure the corpse is destroyed.
	
	Issue #37: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/37
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_dan"

void main() {
	
	object oEntering = GetEnteringObject();
	
	if ((GetIsPC(oEntering) && (GetLoadFromSaveGame() == 0))) {
		if (GetIsObjectValid(GetItemPossessedBy(GetFirstPC(), "dan_map2"))) {
			RevealMap([0.0,0.0,0.0], -1);
		}
		
		int int4 = (2 - GetNumberOfWanderingKathHounds());
		int nGlobal = GetGlobalNumber("DAN_MAND_STATE");
		
		if (((nGlobal == 4) && (UT_GetPlotBooleanFlag(OBJECT_SELF, 2) == FALSE))) {
			UT_SetPlotBooleanFlag(OBJECT_SELF, 2, TRUE);
			PlaceNPC("dan14_sherruk", "");
			PlaceNPC("dan14ac_mand03", "");
			PlaceNPC("dan14ac_mand04", "");
			PlaceNPC("dan14ac_duros03", "");
			PlaceNPC("dan14ac_duros04", "");
		}
		
		object oBolook = GetObjectByTag("dan14_bolook", 0);
		
		if (GetIsObjectValid(oBolook)) {
			if (UT_GetTalkedToBooleanFlag(oBolook)) {
				DestroyObject(oBolook, 0.0, 0, 0.0);
			}
			DestroyObject(GetObjectByTag("dan14_handon", 0), 0.0, 0, 0.0);
			DestroyObject(GetObjectByTag("dan14_rickard", 0), 0.0, 0, 0.0);
			DestroyObject(GetObjectByTag("dan14_idroid", 0), 0.0, 0, 0.0);
			DestroyObject(GetObjectByTag("dan14_corpse", 0), 0.0, 0, 0.0);
			AssignCommand(GetObjectByTag("cp_dan14ac_cpse", 0),SetIsDestroyable(TRUE));
			DestroyObject(GetObjectByTag("cp_dan14ac_cpse", 0), 0.0, 0, 0.0);
		}
		
		if ((int4 > 0)) {
			SpawnWanderingKathHound(int4);
		}
	}
}
