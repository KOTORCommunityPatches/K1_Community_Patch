//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for cp_man27aa_dr07.utd in manm27aa (Manaan Sith Base).
	
	This is the OnOpen script for an the door that replaces the side entrance of
	the foyer of the Sith Base. The vanilla module uses two copies of the same
	UTD for both the back and side entrances, but since the party can trigger the
	room's cutscene from either of those two entrances, or by coming in the front
	door, we needed a way to differentiate them. Those two doors are now unique,
	and set a local boolean on themselves when they are opened. The trigger OnEnter
	checks these to determine where to jump the party.
	
	See also cp_man27aa_dr08, k_pman_27_init01.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2021-01-16																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetLocalBoolean(OBJECT_SELF, 7, TRUE);
}
