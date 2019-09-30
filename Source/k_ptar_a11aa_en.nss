////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for tar_m11aa (Taris Hidden Bek Base).

	This is the OnEnter for the Bek base. There is an issue when you return to
	the base after having won the swoop race (if you sided with the Beks) where
	all of the wandering mooks would no longer be wandering, but just standing
	around. Speaking to anyone would force everyone's AI to kick in, but it was
	desirable for this to be resolved as soon as the player enters.
	
	Issue #254: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/254

	DP 2019-09-30                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"
#include "k_inc_generic"

void main() {
	
	SetGlobalBoolean("TAR_DUELINPROGRESS", TRUE);
	
	TAR_StripSithArmor();
	
	if (GetGlobalBoolean("Tar_KandonMission") && !GetGlobalBoolean("TAR_BEKGUARDSPAWNED"))
		{
			SetGlobalBoolean("TAR_BEKGUARDSPAWNED", TRUE);
			
			CreateObject(OBJECT_TYPE_CREATURE, "tar11_hidbek118", GetLocation(GetObjectByTag("tar11_wpcontrol", 0)));
			CreateObject(OBJECT_TYPE_CREATURE, "tar11_hidbek112", GetLocation(GetObjectByTag("tar11_wpdoor1", 0)));
			CreateObject(OBJECT_TYPE_CREATURE, "tar11_hidbek117", GetLocation(GetObjectByTag("tar11_wpdoor2", 0)));
			CreateObject(OBJECT_TYPE_CREATURE, "tar11_hidbek112", GetLocation(GetObjectByTag("tar11_wpdoor3", 0)));
			
			TAR_MarkForCleanup(GetObjectByTag("gadonthek112", 0));
		}

	TAR_CleanupDeadObjects(OBJECT_SELF);
	
	if (GetGlobalBoolean("Tar_GadonDead"))
		{
			object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
			
			while (GetIsObjectValid(oAreaObject))
				{
					if (!IsObjectPartyMember(oAreaObject))
						{
							ChangeToStandardFaction(oAreaObject, STANDARD_FACTION_HOSTILE_1);
						}
					
					oAreaObject = GetNextObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
				}
		}
	
	// If you return to the base after having sided with the Beks and won the race, the wandering NPCs will
	// all be static until you talk to someone, so give them a nudge to start moving straight away.
	if (GetGlobalBoolean("Tar_SwoopRace") && !GetGlobalBoolean("Tar_GadonDead"))
		{
			object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
			
			while (GetIsObjectValid(oAreaObject))
				{
					if (!IsObjectPartyMember(oAreaObject) && GetTag(oAreaObject)!= "Zaerdra111")
						{
							AssignCommand(oAreaObject, ActionDoCommand(GN_WalkWayPoints()));
						}
					
					oAreaObject = GetNextObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
				}
		}
}
