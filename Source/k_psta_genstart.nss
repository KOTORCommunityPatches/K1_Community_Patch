//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_sta_darthmalak.dlg in sta_m45ac (Star Forge Deck 3/Command Center).
	
	This script fires at the end of the scene where the player confronts Malak
	at the end of Deck 3. It plays the sequence of the fabricators spawning all
	the droids. Since the player tends to freeze after the scene ends due to their
	facing in this script, they have been given an animation to flush them. Also
	streamlined the original droid spawning.
	
	See also k_psta_malakdoor.
	
	Issue #173: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/173
	
	DP 2023-12-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_SpawnDroid(object oTarget, int nCam, string sResRef, location lLoc, float fDelay) {
	object oBeam1, oBeam2;
	string sBeam = "sta_invis_beam";
	effect efVisual = EffectVisualEffect(VFX_FNF_GRENADE_ION);
	int nCnt = 1;
	
	oBeam1 = GetNearestObjectByTag(sBeam + IntToString(1), oTarget, 1);
	
	while (nCnt < 6)
		{
			oBeam2 = GetNearestObjectByTag(sBeam + IntToString(nCnt + 1), oTarget, 1);
			DelayCommand(1.8 + fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING_DARK_S, oBeam1, BODY_NODE_CHEST), oBeam2, 1.2));
			nCnt++;
		}
	
	DelayCommand(1.5 + fDelay, SetDialogPlaceableCamera(nCam));
	DelayCommand(2.5 + fDelay, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, efVisual, lLoc, 0.0));
	DelayCommand(2.5 + fDelay, UT_CreateObject(OBJECT_TYPE_CREATURE, sResRef, lLoc));
}

void main() {
	
	object oPC = GetFirstPC();
	object oDoor = GetObjectByTag("k45_door_malak", 0);
	location lAssDrd = GetLocation(GetObjectByTag("sta_way_assdroid", 0));
	location lMk2Drd = GetLocation(GetObjectByTag("sta_way_mk2droid", 0));
	location lMk4Drd = GetLocation(GetObjectByTag("sta_way_mk4droid", 0));
	location lPrbDrd = GetLocation(GetObjectByTag("sta_way_prbdroid", 0));
	location lSpyDrd = GetLocation(GetObjectByTag("k45c_way_explosi", 0));
	location lWarDrd = GetLocation(GetObjectByTag("sta_way_wardroid", 0));
	object oFace = GetObjectByTag("sta45_pc_facing_wp", 0);
	
	UT_ActionPauseConversation(16.5);
	
	SetGlobalBoolean("STA_MALAK_START", TRUE);
	SetGlobalNumber("STA_ASSASSIN_DROID", 1);
	SetGlobalNumber("STA_MARK2_DROID", 1);
	SetGlobalNumber("STA_MARK4_DROID", 1);
	SetGlobalNumber("STA_PROBE_DROID", 1);
	SetGlobalNumber("STA_SPYDER_DROID", 1);
	SetGlobalNumber("STA_WAR_DROID", 1);
	
	DelayCommand(0.1, PlaySound("cs_sfgenstart"));
	DelayCommand(1.5, SoundObjectPlay(GetObjectByTag("sta_generator", 0)));
	
	AssignCommand(oPC, SetFacing(GetFacing(oFace)));
	DelayCommand(0.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
	
	SetLocked(oDoor, TRUE);
	
	CP_SpawnDroid(GetObjectByTag("sta_way_wardroid", 0), 47, "sta_war", lWarDrd, 0.0);
	CP_SpawnDroid(GetObjectByTag("k45c_way_explosi", 0), 48, "sta_spyder", lSpyDrd, 2.5);
	CP_SpawnDroid(GetObjectByTag("sta_way_mk2droid", 0), 49, "sta_a2", lMk2Drd, 5.0);
	CP_SpawnDroid(GetObjectByTag("sta_way_assdroid", 0), 50, "sta_ass2", lAssDrd, 7.5);
	CP_SpawnDroid(GetObjectByTag("sta_way_mk4droid", 0), 51, "sta_a4", lMk4Drd, 10.0);
	CP_SpawnDroid(GetObjectByTag("sta_way_prbdroid", 0), 14, "sta_probe", lPrbDrd, 12.5);
	
	DelayCommand(16.5, ChangeToStandardFaction(GetObjectByTag("k45_gen_assdroid", 0), STANDARD_FACTION_HOSTILE_1));
	DelayCommand(16.5, ChangeToStandardFaction(GetObjectByTag("k45_gen_mk2droid", 0), STANDARD_FACTION_HOSTILE_1));
	DelayCommand(16.5, ChangeToStandardFaction(GetObjectByTag("k45_gen_mk4droid", 0), STANDARD_FACTION_HOSTILE_1));
	DelayCommand(16.5, ChangeToStandardFaction(GetObjectByTag("k45_gen_prbdroid", 0), STANDARD_FACTION_HOSTILE_1));
	DelayCommand(16.5, ChangeToStandardFaction(GetObjectByTag("k45_gen_spydroid", 0), STANDARD_FACTION_HOSTILE_1));
	DelayCommand(16.5, ChangeToStandardFaction(GetObjectByTag("k45_gen_wardroid", 0), STANDARD_FACTION_HOSTILE_1));
}
