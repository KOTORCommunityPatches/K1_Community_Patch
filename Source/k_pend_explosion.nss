//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_room5.dlg in end_m01aa (Endar Spire Command Module).
	
	This script is fired during the third cutscene of Republic and Sith troopers
	fighting each other. It has a Sith trooper shot at a barrel next to a Republic
	soldier, blowing it up. In the vanilla script the Rep soldier didn't die until
	the following entry, which ended up getting lost in the background. Now he gets
	killed as soon as the barrel explodes.
	
	See also k_pend_cut2_1.
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2023-12-10																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_end"

void main() {
	
	object oRepSldA = GetObjectByTag("end_cut2_soldier3", 0);
	object oRepSldB = GetObjectByTag("end_cut2_soldier4", 0);
	object oExplode = GetObjectByTag("end_explosion", 0);
	location lExplode = GetLocation(oExplode);
	object oSithA = GetObjectByTag("end_cut2_sith5", 0);
	object oSithB = GetObjectByTag("end_cut2_sith3", 0);
	
	UT_ActionPauseConversation(3.5);
	
	AssignCommand(oSithA, CutsceneAttack(oExplode, 239, ATTACK_RESULT_HIT_SUCCESSFUL, 0));
	DelayCommand(0.3, AssignCommand(oRepSldA, CutsceneAttack(oSithA, 239, ATTACK_RESULT_MISS, 0)));
	
	DelayCommand(0.95, SetDialogPlaceableCamera(30));
	
	DelayCommand(1.0, PlayExplosion("end_cut2_explode1", TRUE, TRUE));
	
	DelayCommand(1.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(100), oExplode));
	DelayCommand(1.2, SetMinOneHP(oRepSldA, FALSE));
	DelayCommand(1.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oRepSldA));
}
