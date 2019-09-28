////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_spwcan.utt in tar_m03ae (Taris Lower City Javyar's Cantina).

	This is the trigger OnEnter script that spawns Canderous in the Lower City
	cantina after you have spoken to him in the Upper City cantina. Since we
	are reusing the same party herding setup from the UC cantina (the modules
	share most of the same layout), this script has been edited to match the
	spawn location.
	
	See also k_ptar_candtlk, cp_tar03_candtlk.
	
	Issue #251: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/251
	
	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oCand;
	object oEntering = GetEnteringObject();
	location lCand_WP = Location(Vector(117.272,105.348,0.0), 73.0);
	
	if ((!GetGlobalBoolean("TAR_CANDSPAWN") && GetIsPC(oEntering) && GetGlobalBoolean("Tar_SwoopRace")) || GetGlobalNumber("TAR_CANDMEET") == 1)
		{
			SetGlobalBoolean("TAR_CANDSPAWN", TRUE);
			
			if (GetGlobalNumber("TAR_CANDMEET") == 1)
				{
					SetGlobalNumber("TAR_CANDMEET", 2);
				}
			
			oCand = CreateObject(OBJECT_TYPE_CREATURE, "tar03_cander031", lCand_WP);
		}
}
