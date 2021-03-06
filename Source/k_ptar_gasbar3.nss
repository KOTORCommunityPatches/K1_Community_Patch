////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptar_gasbar3
	
	Gas vent in Davik's estate. Fixes the radius value.
	
	Issue #49: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/49
	
	JC 2019-04-26                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	float fDelay = 1.5;
	int i;
	
	SetGlobalNumber("TAR_DAVGAS", (GetGlobalNumber("TAR_DAVGAS") | 8));
	
	i = 0;
	
	while ((i < 4))
		{
			DelayCommand(fDelay, UT_GasRoom(("tar08_wpgas3_" + IntToString(i)), 5.0, 1));
			(i++);
		}
	
	ActionPauseConversation();
	ActionWait(8.0);
	ActionResumeConversation();
}
