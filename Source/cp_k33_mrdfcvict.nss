//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	fired by kor33_murderer.dlg in korr_m33aa (Korriban Dreshdae).
	
	This is an added facing script for the scene of the Sith student killing a
	Rodian and about to kill a Twi'lek in the middle of Dreshdae, once the player
	has spoken to the Academy door guard and found out they require a medallion
	in order to enter. The DLG originally used a script (k_pkor_murdface) that
	faces the murderer to the other victim that is used on earlier nodes in the
	conversation, but that NPC is dead by this point so this script has been
	added pointing to the correct NPC.
	
	See also k33b_murder_init.
	
	Issue #283: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/283
	
	DP 2021-12-11																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oVictim2 = GetObjectByTag("kor33b_murdered", 0);
	vector vVictim2 = GetPosition(oVictim2);
	
	SetFacingPoint(vVictim2);
}
