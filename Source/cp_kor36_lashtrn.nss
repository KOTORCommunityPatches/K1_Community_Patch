//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_lashowe.dlg in korr_m36aa (Korriban Valley of Dark Lords).
	
	This script fires just before the pack of Tuk'ata charge towards the party.
	It replaces the generic vanilla script that just changes the music. Now it
	turns Lashowe to face the Tuk'ata when she pauses in her VO. It also sets
	the Mother's corpse to not disappear once she dies.
	
	See also k36_las_takeholo, k36_ud_tukqueen.
	
	DP 2023-12-07																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMother = GetObjectByTag("kor36_tukataquee", 0);
	object oArea = GetArea(OBJECT_SELF);
	
	ActionPauseConversation();
	
	NoClicksFor(5.0);
	
	MusicBackgroundStop(oArea);
	DelayCommand(0.1, MusicBattlePlay(oArea));
	
	AssignCommand(oMother, SetIsDestroyable(FALSE, FALSE, FALSE));
	
	ActionDoCommand(DelayCommand(3.7, SetFacingPoint(GetPosition(oMother))));
	ActionDoCommand(DelayCommand(3.8, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1)));
	
	ActionResumeConversation();
}
