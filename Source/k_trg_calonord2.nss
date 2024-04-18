//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for newgeneric003.utt in tat_m18ac (Tatooine Eastern Dune Sea).
	
	This is the trigger OnEnter that spawns either Calo Nord or Darth Bandon for
	their ambush outside the Krayt Dragon cave on Tatooine. Due to the way the
	original script was set up, it was possible to send a single party member
	into the cave in solo mode to loot the holocron belonging to Bastila's
	father and then switch back to the other two outside without triggering the
	showdown scene. The entering object check has now been changed to prevent
	such a bypass working. Also took the opportunity to streamline the original
	script's setup a little.
	
	See also cp_tat18_fgttrig.
	
	Issue #668: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/668
	
	DP 2024-04-18																*/
//////////////////////////////////////////////////////////////////////////////////

void SpawnBandon() {
	CreateObject(OBJECT_TYPE_CREATURE, "tat_bandon", GetLocation(GetObjectByTag("wp_tat_bandon", 0)), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "tat_bandon_thug1", GetLocation(GetObjectByTag("wp_tat_enemy1", 0)), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "tat_bandon_thug2", GetLocation(GetObjectByTag("wp_tat_enemy2", 0)), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bandon_bike2", GetLocation(GetObjectByTag("wp_bandon_bike1", 0)), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bandon_bike2", GetLocation(GetObjectByTag("wp_bandon_bike2", 0)), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bandon_bike2", GetLocation(GetObjectByTag("wp_bandon_bike3", 0)), 0);
}

void SpawnCalo() {
	vector vThug1 = GetPosition(GetObjectByTag("ambush_rider_walrus1", 0));
	vector vThug2 = GetPosition(GetObjectByTag("ambush_rider_walrus2", 0));
	vector vThug3 = GetPosition(GetObjectByTag("ambush_rider_rodian1", 0));
	vector vThug4 = GetPosition(GetObjectByTag("ambush_rider_rodian2", 0));
	
	CreateObject(OBJECT_TYPE_CREATURE, "bp_calo_ambush", GetLocation(GetObjectByTag("bp_calo_ambush_wp2", 0)), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "calo_leg_cover", GetLocation(GetObjectByTag("calo_leg_cover_wp", 0)), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "ambush_speeder2", GetLocation(GetObjectByTag("bp_calo_ambush_bike2_wp", 0)), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "ambush_speeder2", GetLocation(GetObjectByTag("bp_calo_ambush_bike3_wp", 0)), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_calo_bike", GetLocation(GetObjectByTag("bp_calo_ambush_wp", 0)), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "sittingselkath", Location(Vector(vThug1.x, vThug1.y, vThug1.z + 0.5), GetFacing(GetObjectByTag("ambush_rider_walrus1", 0))), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "sittingselkath", Location(Vector(vThug3.x, vThug3.y, vThug3.z + 0.5), GetFacing(GetObjectByTag("ambush_rider_rodian1", 0))), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "sittingrodian", Location(Vector(vThug2.x, vThug2.y, vThug2.z + 0.5), GetFacing(GetObjectByTag("ambush_rider_walrus2", 0))), 0);
	CreateObject(OBJECT_TYPE_PLACEABLE, "sittingrodian", Location(Vector(vThug4.x, vThug4.y, vThug4.z + 0.5), GetFacing(GetObjectByTag("ambush_rider_rodian2", 0))), 0);
	DelayCommand(0.5, AssignCommand(GetObjectByTag("SittingRodian", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP03)));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("SittingRodian", 1), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP03)));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("SittingSelkath", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01)));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("SittingSelkath", 1), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01)));
}

void main() {
	
	object oEntering = GetEnteringObject();
	int nGlobal = GetGlobalNumber("K_KALO_BANDON");
	
	if (IsObjectPartyMember(oEntering) && nGlobal == 10 && !GetGlobalBoolean("TAT_CALO_TRIGGER_SET"))
		{
			SetGlobalNumber("K_KALO_BANDON", 20);
			SetGlobalBoolean("TAT_CALO_TRIGGER_SET", TRUE);
			SpawnCalo();
		}
		else if (IsObjectPartyMember(oEntering) && nGlobal == 30 && !GetGlobalBoolean("TAT_CALO_TRIGGER_SET"))
			{
				SetGlobalNumber("K_KALO_BANDON", 40);
				SetGlobalBoolean("TAT_BANDON_TRIG_SET", TRUE);
				SpawnBandon();
			}
}
