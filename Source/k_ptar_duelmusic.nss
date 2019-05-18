////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired at the start of each duel in tar_m02ae (Taris Upper City Cantina).
	
	This an edit of the script that fires at the start of the duel after the
	player and opponent have spawned in. The player typically ends up facing
	off to one side (pointing at the announcer presumably) and stubbornly
	refuses to face their opponent. Getting them to co-operate required not
	only a SetFacingPoint command, but also playing an animation to get it
	to stick.
	
	Originally part of DP's "Taris Dueling Arena Adjustment" mod.
	
	DP 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {

	object oCrowd = GetObjectByTag("tar_duel_crowd", 0);
	object oFace = GetObjectByTag("tar02_wpopparena", 0);
	object oPC = GetPartyMemberByIndex(0);
	
	MusicBackgroundStop(GetArea(GetFirstPC()));
	AmbientSoundStop(GetArea(GetFirstPC()));
	DelayCommand(0.1, AssignCommand(oPC, ClearAllActions()));
	DelayCommand(0.1, AssignCommand(oPC, SetCommandable(1, OBJECT_SELF)));
	DelayCommand(0.1, AssignCommand(oPC, SetFacingPoint(GetPosition(oFace))));
	DelayCommand(0.1, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 1.0, 0.0)));
	DelayCommand(0.1, SoundObjectPlay(oCrowd));
}