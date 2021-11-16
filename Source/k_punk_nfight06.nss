//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by newfight.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires on the exit node of the cutscene where the party encounters
	the Rakata warriors when exiting the Ebon Hawk the first time. The original
	script had a delay before turning the Rakata hostile, but this has now been
	changed to remove the delay. Original idea proposed by ebmar.
	
	See also k_punk_nfight01, k_punk_nfight05.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-16																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ChangeToStandardFaction(GetObjectByTag("unk41_blk1", 0), STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(GetObjectByTag("unk41_blk2", 0), STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(GetObjectByTag("unk41_blk3", 0), STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(GetObjectByTag("unk41_blk4", 0), STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(GetObjectByTag("unk41_blk5", 0), STANDARD_FACTION_HOSTILE_1);
}
