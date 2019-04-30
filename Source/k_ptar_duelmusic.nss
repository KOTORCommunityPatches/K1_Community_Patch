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


// Globals
	int intGLOB_1 = 0;
	int intGLOB_2 = 1;
	int intGLOB_3 = 2;
	int intGLOB_4 = 3;
	int intGLOB_5 = 4;
	int intGLOB_6 = 5;
	int intGLOB_7 = 6;
	int intGLOB_8 = 7;
	int intGLOB_9 = 8;
	int intGLOB_10 = 9;
	int intGLOB_11 = 10;
	int intGLOB_12 = 11;
	int intGLOB_13 = 12;
	int intGLOB_14 = 13;
	int intGLOB_15 = 14;
	int intGLOB_16 = 15;
	int intGLOB_17 = 16;
	int intGLOB_18 = 17;
	int intGLOB_19 = 18;
	int intGLOB_20 = 19;
	int intGLOB_21 = 1100;
	int intGLOB_22 = (-6);
	int intGLOB_23 = (-5);
	int intGLOB_24 = (-4);
	int intGLOB_25 = (-2);
	int intGLOB_26 = (-1);
	int intGLOB_27 = 0;


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