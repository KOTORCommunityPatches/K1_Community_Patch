//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnSpawn script for tar10_vulkpoo005.utc in tar_m10aa (Taris Black Vulkar
	Base (Upper)).

	This is an intermediate OnSpawn script that has one of the Vulkar lieutenants
	in the pool area destroy his duplicate pass card before firing the vanilla
	OnSpawn. Replaces the previous approach of destroying the extra card via
	custom OnDeath and UserDefine scripts. Simpler and bypasses overloading the
	electrical conduit not allowing enough time between entity deaths for that
	approach to work.

	DP 2023-07-22																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {

	DestroyObject(GetItemPossessedBy(OBJECT_SELF, "tar10_mechid"));
	
	// Fire original OnSpawn.
	DelayCommand(0.2, ExecuteScript("k_ptar_ambcom_sp", OBJECT_SELF, -1));
}
