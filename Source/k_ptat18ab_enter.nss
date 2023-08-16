//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnEnter script for tat_m18ab (Tatooine Sand People Territory).
	
	Fixes an issue with the Sand People	hostility state not being set correctly
	when the module loads.
	
	Updated 2023-08-16 to include the vanilla OnEnter functionality, thanks to
	clues from AmanoJyaku on getting DeNCS to decompile the original.
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	JC 2019-09-29 / DP 2023-08-16												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"
#include "k_inc_tat"

void Spawn_Guard() {
	object oWP = GetWaypointByTag("tat18_wp_sguard");
	location lSpawn = GetLocation(oWP);
	
	CreateObject(OBJECT_TYPE_CREATURE, "tat18_14sandg_01", lSpawn, FALSE);
}

void VornSpawn() {
	vector vBike = Vector(242.835114, 286.128601, 89.715797);
	location lBike = Location(vBike, 55.75);
	
	CreateObject(OBJECT_TYPE_PLACEABLE, "Vornsbike", lBike, FALSE);
	CreateObject(OBJECT_TYPE_CREATURE, "Vornsdroid", GetLocation(GetObjectByTag("wp_Vorndroidspawn", 0)), FALSE);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_hide", GetLocation(GetObjectByTag("tat_hide_wp", 0)), FALSE);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_junk", GetLocation(GetObjectByTag("tat_junk_wp", 0)), FALSE);
}

void main() {
	
	object oPC = GetFirstPC();
	object oGuard = GetObjectByTag("tat18_14sandg_01", 0);
	object oFac = GetObjectByTag("tat18_tuskanfac", 0);
	
	SandpeopleDisguiseUsable();
	
	CP_SandRepFix();
	
	if (GetGlobalNumber("K_Geno_Vorn") == 1 && !GetGlobalBoolean("K_VornSpawn"))
		{
			SetGlobalBoolean("K_VornSpawn", TRUE);
			DelayCommand(0.2, VornSpawn());
		}
	
	if (GetTuskenJobGlobal() == TRUE && !GetIsEnemy(oFac, oPC) && !GetIsObjectValid(oGuard) && !GetTuskenDoneLocal())
		{
			SetTuskenDoneLocal(TRUE);
			DelayCommand(1.0, Spawn_Guard());
		}
		else if (GetIsObjectValid(oGuard) && GetGlobalBoolean("tat_TuskenDead"))
			{
				DestroyObject(oGuard, 0.0, TRUE);
			}
	
	if (GetGlobalBoolean("tat_TuskenDead"))
		{
			object oTurret;
			
			oTurret = GetFirstObjectInArea();
			
			while (GetIsObjectValid(oTurret))
				{
					if (GetTag(oTurret) == "tat18_turret" || GetTag(oTurret) == "tat18_turret2")
						{
							ChangeToStandardFaction(oTurret, STANDARD_FACTION_NEUTRAL);
						}
					
					oTurret = GetNextObjectInArea();
				}
		}
}
