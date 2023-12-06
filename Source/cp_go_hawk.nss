////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for cp_go_hawk.utt in kas_m22aa (Kashyyyk Landing Pad), korr_m33aa
	(Korriban Dreshdae), manm26ad (Manaan Docking Bay), tat_m17ab (Tatooine
	Docking Bay).
	
	This is the OnEnter for an added trigger that overlays the transition zone
	to the Ebon Hawk in each of the modules where the party fights Xor. The
	transition zones have had their LinkedToModule to field nulled out so that
	they no longer work, however they still show the GUI pop-up when approached.
	Now the actual transition is handled by an added trigger that overlays the
	original transition. This enables them to prevent a transition when the
	party is in active combat. Accidentally entering the Hawk while fighting
	Xor can be a problem, particularly in the cramped confines of the Manaan
	Docking Bay. The trigger areas themselves have also been physically reduced
	in size, pushing them closer to the Hawk. If the player enters the trigger
	while any of the party is in active combat and/or Xor or any of his mooks
	are still active, they will just get a barkbubble with the message that they
	can't enter during combat. This is a vanilla StrRef, so it seems this was the
	originally the intended behaviour at some point in development.
	
	See also cp_go_hawk2.
	
	Issue #704: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/704
	
	DP 2023-11-21																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oEntering = GetEnteringObject();
	object oXor;
	int bSafe = TRUE;
	int nRep;
	int nCnt;
	
	if (oEntering == GetPartyMemberByIndex(0))
		{
			nCnt = 1;
			oXor = GetObjectByTag("kas_xor" + IntToString(nCnt), 0);
			
			while (nCnt < 4)
				{
					// Safety check to catch the ~3 second window between loading a save made in combat and the combat AI kicking in.
					if (GetIsObjectValid(oXor) && !GetIsDead(oXor) && GetStandardFaction(oXor) == STANDARD_FACTION_GLB_XOR)
						{
							nRep = GetReputation(oXor, GetFirstPC());
							
							if (nRep >= 0 && nRep <= 10)
								{
									BarkString(OBJECT_INVALID, 42402);
									return;
								}
						}
					
					nCnt++;
					oXor = GetObjectByTag("kas_xor" + IntToString(nCnt), 0);
				}
			
			if (!GetIsInCombat(GetPartyMemberByIndex(0)) && !GetIsInCombat(GetPartyMemberByIndex(1)) && !GetIsInCombat(GetPartyMemberByIndex(2)))
					{
						NoClicksFor(1.0);
						SetGlobalFadeOut(0.0, 0.333);
						DelayCommand(0.666, ActionStartConversation(GetFirstPC(), "cp_go_hawk", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
					}
					else
						{
							BarkString(OBJECT_INVALID, 42402);
						}
		}
}
