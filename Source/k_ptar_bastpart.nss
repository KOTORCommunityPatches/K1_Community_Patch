//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_bastila.dlg in tar_m03af (Taris Swoop Platform).
	
	This script fires on the exit node of the conversation between Bastila and the
	PC after the fight with Brejik and the Vulkars post-swoop race. It transitions
	to the hideout module. The original played the Bastila vs Revan vision video
	to cover the loading screen, but this has now been moved to take place between
	the two conversations with Bastila in the hideout.
	
	See also cp_tar02af_pchor, k_con_bastcon.
	
	Issue #603: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/603
	
	DP 2023-11-14																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	AddAvailableNPCByTemplate(NPC_BASTILA, "p_bastilla");
	
	DelayCommand(0.1, StartNewModule("tar_m02af", "tar02_wpcarbascs"));
}
