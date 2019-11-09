//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_utharwynn.dlg in korr_m35aa (Korriban Sith Academy)
	
	This script is fired when Uthar and the player leave for the Tomb of Naga Sadow.
	They originally ran towards the back entrance, which seemed a bit odd, so they
	now take a more relaxed approach. Additionally, any party members (actually
	removed from the party by an earlier script) are walked away at the same time
	just in case they happen to be in-frame (and most likely blocking the shot).
	
	Updated 2019-10-03 to replace the party member definitions with the K1CP Include
	functions to streamline the code.
	
	Updated 2019-11-09 to revise the moving of the party with a modified function,
	since the vanilla script on the previous node removes any companions from the
	active party, thus causing the Include functions to skip them.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-08-07
	
//////////////////////////////////////////////////////////////////////////////////
	
	Additionally added in the removal of any prestige quests that weren't submitted
	to Uthar, since these have no closed state post-Tomb of	Naga Sadow to account
	for not having handed them in. They do get removed when reaching the Unknown
	World, but if you do Korriban early then they will be filling up your journal
	until then.
	
	Issue #225: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/225
	
	DP 2019-10-03																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_JrlCheck() {
	
	int iDoubt = GetJournalEntry("kor25_doubtsith"); // A Doubting Sith
	int iLash = GetJournalEntry("kor35_aidlashowe"); // Aiding Lashowe
	int iReneg = GetJournalEntry("kor35_renegadesith"); // Renegade Sith
	int iRogue = GetJournalEntry("kor38_roguedroid"); // Rogue Droid
	int iCode = GetJournalEntry("Category000"); // The Code of the Sith
	int iHermit = GetJournalEntry("kor38_hermit"); // The Hermit in the Hills
	int iMando = GetJournalEntry("kor35_mandalorian"); // The Mandalorian Weapons Cache
	int iAjunta = GetJournalEntry("kor37_ajuntapall"); // The Sword of Ajunta Pall
	
	if (iDoubt == 10)
		{
			RemoveJournalQuestEntry("kor25_doubtsith");
		}
	if (iLash > 0 && iLash < 35 || iLash == 40)
		{
			RemoveJournalQuestEntry("kor35_aidlashowe");
		}
	if (iReneg > 0 && iReneg <= 30)
		{
			RemoveJournalQuestEntry("kor35_renegadesith");
		}
	
	if (iRogue == 10 || iRogue == 30)
		{
			RemoveJournalQuestEntry("kor38_roguedroid");
		}
	if (iCode == 10)
		{
			RemoveJournalQuestEntry("Category000");
		}
	if (iHermit > 0 && iHermit < 40)
		{
			RemoveJournalQuestEntry("kor38_hermit");
		}
	if (iMando == 10 || iMando == 30 || iMando == 40)
		{
			RemoveJournalQuestEntry("kor35_mandalorian");
		}
	if (iAjunta == 5 || iAjunta == 10)
		{
			RemoveJournalQuestEntry("kor37_ajuntapall");
		}
}

// A modified version of CP_PartyHerder that removes the IsObjectPartyMember check, since
// any companions are removed from the party on the previous node by k_pkor_partyleav
void CP_WalkParty(location lPC, location lPM1, location lPM2) {

	object oPC = GetFirstPC();
	int i = 0;
	
	object oPM1 = OBJECT_INVALID;
	
	while (!GetIsObjectValid(oPM1) && i <= 8)
		{
			oPM1 = GetObjectByTag(CP_NPCToTag(i), 0);
			i++;
		}
	
	object oPM2 = OBJECT_INVALID;
	
	while (!GetIsObjectValid(oPM2) && i <= 8)
		{
			oPM2 = GetObjectByTag(CP_NPCToTag(i), 0);
			i++;
		}
	
	CP_PartyMove(oPC, lPC, FALSE);
	if (GetIsObjectValid(oPM1)) CP_PartyMove(oPM1, lPM1, FALSE);
	if (GetIsObjectValid(oPM2)) CP_PartyMove(oPM2, lPM2, FALSE);
}

void main() {
	
	object oPC = GetFirstPC();
	location lUthar = Location(Vector(123.0,92.5,3.15), 90.0);
	location lPC = Location(Vector(120.0,92.5,3.15), 90.0);
	location lPM1 = Location(Vector(101.0,71.25,3.15), 180.0);
	location lPM2 = Location(Vector(101.0,74.25,3.15), 180.0);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(2.5, 1.5);
	
	CP_PartyMove(OBJECT_SELF, lUthar, FALSE);
	CP_WalkParty(lPC, lPM1, lPM2);
	
	DelayCommand(4.3, CP_PartyJump(OBJECT_SELF, lUthar));
	DelayCommand(4.3, CP_PartyJump(oPC, lPC));
	
	CP_JrlCheck();
	
	DelayCommand(4.5, ActionResumeConversation());
}
