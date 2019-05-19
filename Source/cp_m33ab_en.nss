////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Vanilla OnEnter script for korr_m33ab (Sith Academy Entrance).
	
	See k33b_openacademy.nss for further details.
	
	2019-05-19 Updated to streamline code using vanilla include functions.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

// Prototypes
void PlaceNPC(int iType, string sTag, location lLocation);
int PlotState();


void PlaceNPC(int iType, string sTag, location lLocation) {
	object oNPC = CreateObject(iType, sTag, lLocation, 0);
}

int PlotState() {
	return UT_GetPlotBooleanFlag(OBJECT_SELF, 0);
}

void main() {
	object oPC = GetFirstPC();
	if ((GetEnteringObject() == oPC)) {
		RevealMap([0.0,0.0,0.0], -1);
		object oK33b_dor_academy = GetObjectByTag("k33b_dor_academy", 0);
		if ((GetGlobalNumber("KOR_SITHJOIN") > 0)) {
			if ((!GetGlobalBoolean("KOR_END_HOSTILE"))) {
				SetLocked(oK33b_dor_academy, 0);
			}
			object oKor33_mekel = GetObjectByTag("kor33_mekel", 0);
			object oKor33_mekfight1 = GetObjectByTag("kor33_mekfight1", 0);
			object oKor33_mekfight2 = GetObjectByTag("kor33_mekfight2", 0);
			object oKor33_mekfight3 = GetObjectByTag("kor33_mekfight3", 0);
			if (GetIsObjectValid(oKor33_mekel)) {
				DestroyObject(oKor33_mekel, 0.0, 1, 0.0);
			}
			if (GetIsObjectValid(oKor33_mekfight1)) {
				DestroyObject(oKor33_mekfight1, 0.0, 1, 0.0);
			}
			if (GetIsObjectValid(oKor33_mekfight2)) {
				DestroyObject(oKor33_mekfight2, 0.0, 1, 0.0);
			}
			if (GetIsObjectValid(oKor33_mekfight3)) {
				DestroyObject(oKor33_mekfight3, 0.0, 1, 0.0);
			}
		}
		if (GetGlobalBoolean("KOR_END_HOSTILE")) {
			object object14 = GetItemPossessedBy(oPC, "k33_itm_sithmdln");
			if (GetIsObjectValid(object14)) {
				DestroyObject(object14, 0.0, 0, 0.0);
			}
			AssignCommand(oK33b_dor_academy, ActionCloseDoor(oK33b_dor_academy));
			DelayCommand(0.5, SetLocked(oK33b_dor_academy, 1));
			object oK33_academyguard = GetObjectByTag("k33_academyguard", 0);
			SetPlotFlag(oK33_academyguard, 0);
			ChangeToStandardFaction(oK33_academyguard, 1);
		}
		if ((GetAreaUnescapable() && GetGlobalBoolean("KOR_MURDER_DEAD"))) {
			SetAreaUnescapable(0);
		}
		if ((((!PlotState()) && GetGlobalBoolean("DAN_BELAYA_DEFECT")) && (GetGlobalNumber("DAN_JUHANI_PLOT") == 2))) {
			UT_SetPlotBooleanFlag(OBJECT_SELF, 0, 1);
			object oK33b_way_belaya = GetObjectByTag("k33b_way_belaya", 0);
			location location1 = GetLocation(oK33b_way_belaya);
			DelayCommand(0.5, PlaceNPC(1, "kor33b_belaya", location1));
		}
	}
}