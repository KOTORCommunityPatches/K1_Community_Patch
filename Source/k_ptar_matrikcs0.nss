//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_matrik031.dlg in tar_m03ad (Taris Lower City Apartments B).
	
	This script fires after you give Matrik the permacrete detonator, showing him
	set two explosive charges on either side of the room. The vanilla script had
	him stop 2m short of the spawn point of each charge for some reason, so this
	has been adjusted to position him more correctly. Because there was a delay
	in the original PlaySound firing the arming SFX that could not be resolved,
	this was switched to the use of SoundObjectPlay, in conjunction with a new
	UTS added to the GIT. Any party members are also now sent to individual spots
	to make sure they are out of the way in the post-explosion conversation. The
	vanilla version had them both move to a single location which was too close
	to the PC's destination, blocking the camera in a wide shot.
	
	See also k_ptar_matrik30x.
	
	Issue #300: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/300
	
	DP 2019-11-01																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void SpawnBomb(object oWP) {
	
	CreateItemOnFloor("G_I_TRAPKIT004", GetLocation(oWP));
}

void SetBomb(object oWP) {
	
	ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
	DelayCommand(0.84, SpawnBomb(oWP));
	DelayCommand(0.85, SoundObjectPlay(GetNearestObjectByTag("cp_tar03_setbomb")));
}

void PlantBomb(location lWP, object oWP) {
	
	if (GetTag(oWP) == "tar03_wpbomb1") 
		{
			SetDialogPlaceableCamera(7);
		}
	
	ActionMoveToLocation(lWP, FALSE);
	ActionDoCommand(SetBomb(oWP));
}

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oDet = GetItemPossessedBy(oPC, "ptar_permacrete");
	object oBomb1 = GetWaypointByTag("tar03_wpbomb0");
	object oBomb2 = GetWaypointByTag("tar03_wpbomb1");
	object oMatWP = GetWaypointByTag("tar03_wpmatrikexp");
	object oPM1WP = GetWaypointByTag("cp_matwp_pm1");
	object oPM2WP = GetWaypointByTag("cp_matwp_pm2");
	location lBomb1 = Location(Vector(140.047,90.69,0.0), 70.0);
	location lBomb2 = Location(Vector(135.873,83.908,0.0), 235.0);
	
	ActionPauseConversation();
	
	DestroyObject(oDet);
	
	CP_PartyMoveObject(oPM1, oPM1WP, TRUE);
	DelayCommand(1.0, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(oMatWP)))));
	
	DelayCommand(1.5, CP_PartyMoveObject(oPM2, oPM2WP, TRUE));
	DelayCommand(2.5, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(oMatWP)))));
	
	PlantBomb(lBomb1, oBomb1);
	DelayCommand(5.0, PlantBomb(lBomb2, oBomb2));
	
	DelayCommand(13.5, ActionResumeConversation());
}
