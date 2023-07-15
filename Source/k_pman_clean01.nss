//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_repdip.dlg in manm26ae (Manaan East Central).
	
	A minor edit of the cleanup script that fires at the end of the conversation
	with Roland Wann after the player returns from Hrakert Rift to inform him of
	what happened. It destroys the now extraneous related quest items. The vanilla
	script had an incorrect tag for the environment suit, meaning it didn't get
	destroyed. That has been corrected. Since a datapad about sharks and the Sith
	hangar key were left behind, those have also been added.
	
	Issue #142: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/142

	DP 2023-07-15																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	CP_DestroyPartyItem("W_REPKEY");			// Republic Enclave Key
	CP_DestroyPartyItem("W_REPKEY2");			// Submersible Bay Key
	CP_DestroyPartyItem("man28_toxic");			// Chemical Cannister
	CP_DestroyPartyItem("man28_envirosuit");	// Envirosuit
	CP_DestroyPartyItem("man28_sonic");			// Sonic Emitter
	CP_DestroyPartyItem("g_scijournal");		// Scientist's Memo
	CP_DestroyPartyItem("W_SITHKEY2");			// Sith Hangar Key
}
