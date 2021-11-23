//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires on Carth's first line welcoming the player back. It has been
	tweaked slightly to face everyone towards the player's destination rather than
	his current position, since they get there before the player arrives. There's
	also an extended delay to ensure that the LS version of the scene doesn't
	progress before everyone is in position.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oCand = GetObjectByTag("cand", 0);
	object oMiss = GetObjectByTag("mission", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	object oHK = GetObjectByTag("HK47", 0);
	object oT3 = GetObjectByTag("T3M4", 0);
	location lT3NewEnd = Location(Vector(106.45,142.25,23.85), 38.12);
	vector vPC = GetPosition(GetObjectByTag("playerend", 0));
	
	ActionPauseConversation();
	
	NoClicksFor(5.5);
	
	CP_PartyMove(OBJECT_SELF, GetLocation(GetObjectByTag("carthend", 0)), TRUE);
	DelayCommand(1.0, ActionDoCommand(SetFacingPoint(vPC)));
	
	CP_PartyMove(oCand, GetLocation(GetObjectByTag("candend", 0)), TRUE);
	DelayCommand(1.0, AssignCommand(oCand, ActionDoCommand(SetFacingPoint(vPC))));
	
	CP_PartyMove(oMiss, GetLocation(GetObjectByTag("missionend", 0)), TRUE);
	DelayCommand(1.0, AssignCommand(oMiss, ActionDoCommand(SetFacingPoint(vPC))));
	
	CP_PartyMove(oZaal, GetLocation(GetObjectByTag("zaalbarend", 0)), TRUE);
	DelayCommand(1.0, AssignCommand(oZaal, ActionDoCommand(SetFacingPoint(vPC))));
	
	CP_PartyMove(oHK, GetLocation(GetObjectByTag("t3m4end", 0)), TRUE);
	DelayCommand(1.0, AssignCommand(oHK, ActionDoCommand(SetFacingPoint(vPC))));
	
	CP_PartyMove(oT3, lT3NewEnd, TRUE);
	DelayCommand(1.0, AssignCommand(oT3, ActionDoCommand(SetFacingPoint(vPC))));
	
	DelayCommand(5.5, ActionResumeConversation());
}
