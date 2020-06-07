//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by party selection GUI in tar_m05aa (Taris Lower Sewers)
	
	This is the exit script for the party selection GUI that pops up at the end
	of the Zaalbar rescue scene. It destroys the fake cutscene Zaalbar and removes
	the party Zaalbar's weapons if you make him an active party member. Edited to
	add a fade-in after the previous fade-out, and to jump party Zaalbar into the
	position fake Zaalbar used to be in (by default he will spawn right next to
	the player).
	
	See also cp_tar05_misswlk, k_ptar_addzaal, k_ptar_misunlock, k_ptar_trigdoor,
	k_ptar_zaalrun.
	
	Issue #65: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/65
	
	DP 2020-06-08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oZaalbar = GetObjectByTag("zaalbar", 0);
	object oFakeZaal = GetObjectByTag("Tar05_Zaalbar", 0);
	object oInvis = GetObjectByTag("tar05_zaaljunk", 0);
	location lBigZ = Location(Vector(233.868,190.156,29.96), 0.0);
	
	NoClicksFor(2.0);
	
	DestroyObject(oFakeZaal, 0.0, TRUE, 0.0);
	
	if (GetIsObjectValid(oZaalbar))
		{
			CP_PartyJump(oZaalbar, lBigZ);
			
			GiveItem(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oZaalbar), oInvis);
			GiveItem(GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oZaalbar), oInvis);
		}
	
	SetGlobalFadeIn(1.0, 3.0);
}
