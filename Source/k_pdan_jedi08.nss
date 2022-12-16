//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_crattis.dlg in danm13 (Dantooine Jedi Enclave).
	
	The merchant in the Enclave has a one-time offer to buy lightsaber crystals,
	but this can easily be missed due to being gated by a narrow window in the
	main plot progression. The developer comment from the vanilla script:
	
		Checks to see if DAN_JEDI_PLOT is 4 (meaning that the
		player has successfully cleansed the grove) and
		DAN_CRATISL_DONE is FALSE (meaning that Crattis has
		not yet offered to buy lightsaber crystals off the
		player). This conversation will not repeat since
		DAN_CRATISL_DONE is set to TRUE to show that this
		conversation has taken place.
	
	Since it checked that global DAN_JEDI_PLOT == 4, the option would only appear
	if the player spoke to Crattis after defeating Juhani but before informing
	Zhar. That check is now changed to >= 4, so it can occur any time the player
	speaks to Crattis after defeating Juhani, regardless of the subsequent main
	plot progression.
	
	Issue #658: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/658
	
	DP 2022-12-16																*/
//////////////////////////////////////////////////////////////////////////////////


int StartingConditional() {
	
    if (!GetGlobalBoolean("DAN_CRATISL_DONE") && GetGlobalNumber("DAN_JEDI_PLOT") >= 4)
		{
			SetGlobalBoolean("DAN_CRATISL_DONE", TRUE);
			
			return TRUE;
		}

    return FALSE;
}
