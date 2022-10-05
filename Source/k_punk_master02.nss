//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_sithmast.dlg in unk_m44aa (Unknown World Temple Main Floor).
	
	This script plays the scene of the Sith Master zapping the training droid. The
	vanilla version walked the player into the room. That has been changed to now
	walk the whole party forwards.
	
	Updated 2022-10-05 to adjust the timing for the lightning VFX, since it started
	while he was still in an idle pose, and continued past when he had stopped the
	casting animation and reverted back to an idle pose. Also added an additional
	"electrified" VFX to the droid after it is zapped.
	
	See also cp_unk44_mastend, k_punk_master03, k_punk_masktk_en.
	
	Issue #325: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/325
	
	DP 2019-11-12 / DP 2022-10-05												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMaster = GetObjectByTag("darkjedi443");
	object oDroid = GetObjectByTag("unk44_traindroid", 0);
	effect efBeam = EffectBeam(VFX_BEAM_LIGHTNING_DARK_L, OBJECT_SELF, BODY_NODE_HAND_LEFT);
	effect eVFX = EffectVisualEffect(VFX_PRO_LIGHTNING_S);
	location lPC = Location(Vector(78.685,64.308,0.436), 270.0);
	location lPM1 = Location(Vector(77.185,66.533,0.436), 270.0);
	location lPM2 = Location(Vector(80.185,66.533,0.436), 270.0);
	
	ActionPauseConversation();
	
	ActionCastFakeSpellAtObject(FORCE_POWER_LIGHTNING, oDroid);
	DelayCommand(1.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, efBeam, oDroid, 0.35));
	DelayCommand(1.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oDroid, 0.5));
	DelayCommand(1.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oDroid));
	
	CP_PartyHerder(lPC, lPM1, lPM2, FALSE, FALSE);
	
	DelayCommand(2.0, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oMaster)))));
	DelayCommand(2.0, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(oMaster)))));
	DelayCommand(2.0, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(oMaster)))));
	
	DelayCommand(3.0, ActionResumeConversation());
}
