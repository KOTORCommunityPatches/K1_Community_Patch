////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_utharwynn.dlg in korr_m35aa (Korriban Sith Academy)
	
	This script is fired when Uthar and the player leave for the Tomb of
	Naga Sadow. They originally ran towards the back entrance, which seemed
	a bit odd, so they now take a more relaxed approach. Additionally, any
	party members (actually removed from the party by an earlier script)
	are walked away at the same time just in case they happen to be in-frame
	(and most likely blocking the shot).
	
	DP 2019-08-07                                                             */
////////////////////////////////////////////////////////////////////////////////

string CP_NPCToTag(int nNPC) {

	switch( nNPC )
		{
			case NPC_BASTILA: return "Bastila";
			case NPC_CANDEROUS: return "Cand";
			case NPC_CARTH: return "Carth";
			case NPC_HK_47: return "HK47";
			case NPC_JOLEE: return "Jolee";
			case NPC_JUHANI: return "Juhani";
			case NPC_MISSION: return "Mission";
			case NPC_T3_M4: return "T3M4";
			case NPC_ZAALBAR: return "Zaalbar";
		}
	return "";
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = OBJECT_INVALID;
	object oPM2 = OBJECT_INVALID;
	int i = 0;
	location lPC = Location(Vector(120.0,92.5,3.15), 90.0);
	location lUthar = Location(Vector(123.0,92.5,3.15), 90.0);
	location lPM1 = Location(Vector(101.0,71.25,3.15), 180.0);
	location lPM2 = Location(Vector(101.0,74.25,3.15), 180.0);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(3.0, 1.5);
	
	while (!GetIsObjectValid(oPM1) && i <= 8)
		{
			oPM1 = GetObjectByTag(CP_NPCToTag(i), 0);
			i++;
		}
	
	while (!GetIsObjectValid(oPM2) && i <= 8)
		{
			oPM2 = GetObjectByTag(CP_NPCToTag(i), 0);
			i++;
		}
	
	ActionMoveToLocation(lUthar, FALSE);
	AssignCommand(oPC, ActionMoveToLocation(lPC, FALSE));
	AssignCommand(oPM1, ActionMoveToLocation(lPM1, FALSE));
	AssignCommand(oPM2, ActionMoveToLocation(lPM2, FALSE));
	
	DelayCommand(4.4, AssignCommand(oPC, ClearAllActions()));
	DelayCommand(4.5, AssignCommand(oPC, ActionJumpToLocation(lPC)));
	DelayCommand(4.4, ClearAllActions());
	DelayCommand(4.5, ActionJumpToLocation(lUthar));
	
	DelayCommand(4.5, ActionResumeConversation());
}
