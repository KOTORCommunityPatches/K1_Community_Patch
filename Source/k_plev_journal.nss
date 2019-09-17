////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg on Entry 10 in lev_m40ad (Leviathan Bridge).
	
	This script fires on Saul's final "Remember my dying words" line. The vanilla
	script incorrectly set the journal entry for female PCs for everyone and then
	overwrote it with the final/closed entry for male PCs, so this has now been
	corrected. Additionally, as part of changes to prevent Saul's death cry being
	talked over the top of by Carth on the following line, the line has been paused
	to play out a new death animation added via a stunt model. The death cry has
	been changed using one of the player soundset files. See also k_plev_killsaul.
	
	Issue #131: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/131
	
	DP 2019-07-09                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
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
	
	DelayCommand(10.75, PlaySound("p_plyermw_dead2"));
	
	DelayCommand(12.0, ActionResumeConversation());
}
