//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    Fired by kas_xor_dialog.dlg in kas_m22aa (Kashyyyk Landing Pad), korr_m33aa
	(Korriban Dreshdae), manm26ad (Manaan Docking Bay), tat_m17ab (Tatooine
	Docking Bay).
	
    This script fires on the exit node of the post-combat scene in the final Xor
	encounter in all eligible landing bay modules when goading Juhani into killing
	him. The vanilla script changed Xor back to his unique faction (he gets set to
	neutral if he is downed first) and then set the reputation to hostile. But this
	causes the whole party to aggro. Now he is set to a faction presumably intended
	to be iced in cutscenes so that everyone else stands back and passively watches
	Juhani do her thing.

	Issue #397: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	DP 2023-11-28																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oJuh = GetObjectByTag("Juhani", 0);
	object oXor = GetObjectByTag("kas_xor1", 0);
	
	NoClicksFor(3.0);
	
	SetMinOneHP(oXor, FALSE);
	ChangeToStandardFaction(oXor, STANDARD_FACTION_SURRENDER_2);
	
	DelayCommand(0.5, AssignCommand(oJuh, ActionDoCommand(CutsceneAttack(oXor, 247, ATTACK_RESULT_HIT_SUCCESSFUL, 100))));
}
