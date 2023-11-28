//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    UserDefine for invis_xor_conv.utt in kas_m22aa (Kashyyyk Landing Pad), korr_m33aa
	(Korriban Dreshdae), manm26ad (Manaan Docking Bay), tat_m17ab (Tatooine
	Docking Bay).
	
    This is an added OUD for the invisible placeable that handles the final Xor
	scene in all eligible landing bay modules. It works in conjunction with an
	added OnDeath event for Xor, telling Juhani to talk to the PC since she has
	unique dialogue for either killing him or letting him die.
	
	See also cp_xor_ptyjmpend, k_kas_xor_user.
	
	Issue #397: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	DP 2023-11-28																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oJuh = GetObjectByTag("Juhani", 0);
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 99)
		{
			DelayCommand(0.5, AssignCommand(oJuh, CancelCombat(oJuh)));
			DelayCommand(1.0, AssignCommand(oJuh, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
	else if (nUser == 1001) // HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
}
