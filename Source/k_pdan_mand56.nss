//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan14ab_cut01.dlg in danm14ab (Dantooine Matale Grounds).
	
	This script is fired during the "Take my wife and children instead!" cutscene
	when the Mando shoots the farmer. The original version of the script used the
	ActionAttack function, but it wasn't actually applying the EffectAssuredHit
	function, causing the Mando to occasionally miss. Correctly applying it caused
	him to be too effective, dropping some blaster bolt VFX. It has instead been
	switched to the CutsceneAttack function.
	
	See also k_pdan_cut06, k_pdan_cut08.
	
	Issue #111: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/111
	
	DP 2019-11-03																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oVictim = GetObjectByTag("dan14_victim", 0);
	
	ChangeToStandardFaction(oVictim, STANDARD_FACTION_FRIENDLY_1);
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_FRIENDLY_2);
	
	ActionPauseConversation();
	
	// Rifle Rapid Shot anim (b7a2) = 240
	ActionDoCommand(CutsceneAttack(oVictim, 240, ATTACK_RESULT_AUTOMATIC_HIT, 3));
}
