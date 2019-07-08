////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg in lev_m40ad (Leviathan Bridge).
	
	This script fires on Saul's final "Remember my dying words" line. The vanilla
	script just sets a journal entry (although for males it set the female one and
	then overwrote it with the final/closed entry, which has now been corrected),
	but due to his death cry being talked over the top of by Carth on the following
	line, it has been edited to pause the conversation and kill him off properly
	before proceeding by merging in the relevant contents of the script that fires
	on Carth's subsequent line. In order to avoid having to restructure the DLG to
	add in intermediate entry, this also necessitated doing a preemptive camera swap
	before Carth's line to hide Saul playing the death animation (since that forces
	him to stand up). See also k_plev_killsaul.
	
	DP 2019-07-08                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oSaul = GetObjectByTag("SaulKarath402", 0);
	object oCarth = GetObjectByTag("Carth", 0);
	int nGender = GetGender(GetFirstPC());
	
	ActionPauseConversation();
	
	if(nGender == GENDER_FEMALE)
		{
			AddJournalQuestEntry("k_swg_carthtalk", 3, TRUE);
		}
		else
			{
				AddJournalQuestEntry("k_swg_carthtalk", 99);
			}
	
	DelayCommand(10.5, SetPlotFlag(oSaul, FALSE));
	DelayCommand(10.5, SetMinOneHP(oSaul, FALSE));
	
	DelayCommand(10.5, SetDialogPlaceableCamera(8));
	DelayCommand(10.5, AssignCommand(oCarth, ClearAllActions()));
	DelayCommand(10.6, AssignCommand(oCarth, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE)));
	
	DelayCommand(10.75, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oSaul));
	
	DelayCommand(12.0, ActionResumeConversation());
}
