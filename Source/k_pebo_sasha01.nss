////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pebo_sasha01
	
	Sasha exit script, dark side version. Edited to prevent an exploit.
	
	Issue #107: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/107
	
	JC 2019-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////

void SASHA_AdjustAlignment(object oTarget, int nAmount) {

	int nAlign = GetGoodEvilValue(oTarget);
	int nAlignType;
	if( nAmount == -6 || nAmount == -5 || nAmount == -4 ) {
		nAlignType = 3;
		}
	else {
		nAlignType = 2;
		}
	int nAdjust;
	int nDarkLevel;
	if( nAlign >= 85 ) {
		nDarkLevel = 1;
		}
	else {
		if( nAlign < 85 && nAlign > 60 ) {
			nDarkLevel = 2;
			}
		else {
			if( nAlign <= 60 && nAlign >= 40 ) {
				nDarkLevel = 3;
				}
			else {
				if( nAlign < 40 && nAlign >= 15 ) {
					nDarkLevel = 4;
					}
				else {
					nDarkLevel = 5;
					}
				}
			}
		}
	nAdjust = (nDarkLevel + nAmount) * 2;
	if( nAdjust < 0 ) {
		nAdjust = nAdjust * -1;
		}
	if( nAdjust == 0 ) {
		nAdjust = 1;
		}
	if( ((nDarkLevel == 1) && (nAmount == -2))) {
		nAdjust = 1;
		}
	else {
		if( nDarkLevel == 5 && nAmount == -4 ) {
			nAdjust = 1;
			}
		}
	AurPostString(("Hit = " + IntToString(nAdjust)), 5, 5, 4.0);
	AdjustAlignment(oTarget, nAlignType, nAdjust);

}

void SASHA_GiveDarkSide(object oTarget) {
	SASHA_AdjustAlignment(oTarget, -5);
}

void main() {

	object oSashaExit = GetObjectByTag("SashaExit", 0);
	
	RemoveJournalQuestEntry("ebo_supplies");
	SASHA_GiveDarkSide(GetFirstPC());
	SetGlobalNumber("EBO_SASHA_PLOT", 3);
	SetGlobalNumber("Ebo_Sasha_State", 99);
	ActionForceMoveToObject(oSashaExit, TRUE, 1.0, 30.0);
	ActionDoCommand(SetCommandable(TRUE));
	ActionDoCommand(DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
	SetCommandable(FALSE);
}
