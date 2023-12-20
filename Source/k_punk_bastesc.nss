//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_evilbast.dlg in unk_m44ac (Lehon Temple Summit).
	
	This is the final script that fires at the end of the second conversation if
	the player chooses the Light Side and Bastila runs away. Everyone's lightsaber
	blade activation override is now disabled so that they aren't stuck on after
	the cutscene ends (the blades have to be forced off first). Jolee and Juhani
	are now also jumped into position behind the player. Their positions need to
	be reversed from the previous cutscene positions to prevent the AI running
	them into each other due to wanting the index 1 party member (Jolee in this
	case) to be on the right and index 2 on the left.
	
	Updated 2023-12-20 to toggle off the party member's AI to ensure that they
	obey their jump commands.
	
	See also cp_unk44_jjfcbas, cp_unk44_pcfcbas, exitheart, k_punk_bast_ud2,
	k_punk_bastatt03, k_punk_bastatt05, k_punk_bastjoin2.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2021-11-05 / DP 2023-12-20												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oJolee = GetObjectByTag("jolee", 0);
	object oJuhani = GetObjectByTag("juhani", 0);
	location lJuh = Location(Vector(103.00,72.65,13.75), -10.00);
	location lJol = Location(Vector(103.00,69.65,13.75), 10.00);
	
	PlayMovie("05_8E");
	
	SetGlobalFadeIn(1.0, 2.0);
	
	NoClicksFor(1.5);
	
	if (IsNPCPartyMember(NPC_JUHANI) == TRUE)
		{
			AddJournalQuestEntry("k_swg_juhani", 120);
		}
	
	SetGlobalNumber("G_FinalChoice", 2);
	
	ActionJumpToLocation(GetLocation(GetObjectByTag("playerend", 0)));
	
	DestroyObject(GetObjectByTag("GWing", 0), 0.0, TRUE);
	
	// Force everyone's saber blade/s to off, then disable the override.
	SetLightsaberPowered(oPC, TRUE, FALSE, FALSE);
	SetLightsaberPowered(oJolee, TRUE, FALSE, FALSE);
	SetLightsaberPowered(oJuhani, TRUE, FALSE, FALSE);
	SetLightsaberPowered(oPC, FALSE, FALSE, FALSE);
	SetLightsaberPowered(oJolee, FALSE, FALSE, FALSE);
	SetLightsaberPowered(oJuhani, FALSE, FALSE, FALSE);
	
	CP_ToggleAI(oJolee, 0.4);
	CP_ToggleAI(oJuhani, 0.4);
	DelayCommand(0.1, CP_PartyJump(oJolee, lJol));
	DelayCommand(0.1, CP_PartyJump(oJuhani, lJuh));
	
	DelayCommand(0.6, DestroyObject(OBJECT_SELF, 0.0, TRUE));
}
