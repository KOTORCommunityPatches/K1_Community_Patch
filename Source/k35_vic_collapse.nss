//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor35_victim.dlg in korr_m35aa (Korriban Sith Academy).
	
	This script fires on the exit node of the interrogation scene with the Mando
	prisoner in the Korriban Sith Academy when the player ends up overdosing and
	killing them. Like the other exit scripts, it has been tweaked to reposition
	the Mando before killing him in an attempt to prevent him clipping through
	the cage as much as possible when playing the dead animation. Also sets the
	corpse to non-destroyable so that it sticks around if the player chooses to
	kill the torturer.
	
	See also k35_init_torture, k35_plc_startvic, k35_tor_move, k35_vic_drugged,
	k35_vic_narc, k_pkor_destvictm, k_pkor_painreset, k_pkor_tort01.
	
	Issue #434: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/434
	
	DP 2023-08-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oTorturer = GetObjectByTag("kor35_torturer", 0);
	location lVic = Location(Vector(180.69,92.25,6.15), 0.00);
	
	NoClicksFor(0.7);
	
	SetGlobalBoolean("KOR_VICTIM_UNCON", TRUE);
	
	SetIsDestroyable(FALSE, FALSE, FALSE);
	ClearAllActions();
	JumpToLocation(lVic);
	DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF));
	
	SetCommandable(TRUE, oTorturer);
	
	DelayCommand(0.5, AssignCommand(oTorturer, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
}
