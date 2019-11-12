//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_sithmast.dlg in unk_m44aa (Unknown World Temple Main Floor).
	
	This script plays the scene of the Sith Master zapping the training droid. The
	vanilla version walked the player into the room. That has been changed to now
	walk the whole party forwards.
	
	See also k_punk_master03, k_punk_masktk_en.
	
	Issue #325: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/325
	
	DP 2019-11-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMaster = GetObjectByTag("darkjedi443");
	object oDroid = GetObjectByTag("unk44_traindroid", 0);
	location lPC = Location(Vector(78.685,64.308,0.436), 270.0);
	location lPM1 = Location(Vector(77.185,66.533,0.436), 270.0);
	location lPM2 = Location(Vector(80.185,66.533,0.436), 270.0);
	
	ActionPauseConversation();
	
	ActionUseTalentOnObject(TalentSpell(FORCE_POWER_LIGHTNING), oDroid);
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING_DARK_L, OBJECT_SELF, BODY_NODE_HAND_LEFT), oDroid, 2.0);
	DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oDroid));
	
	CP_PartyHerder(lPC, lPM1, lPM2, FALSE, FALSE);
	DelayCommand(2.0, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oMaster)))));
	DelayCommand(2.0, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(oMaster)))));
	DelayCommand(2.0, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(oMaster)))));
	
	DelayCommand(3.0, ActionResumeConversation());
}
