//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_08hk47_01.dlg in tat_m17ac (Tatooine Droid Shop).
	
	This is the exit node script that fires when you buy HK-47. The original
	version of the script had the command to destroy the stunt HK after the
	party selection GUI command, since the DLG and the script are both owned
	by the stunt HK. If the player had him join the party immediately, stunt
	HK could be seen fading out next to party HK. In order to avoid this,
	the destroy function has been handed off to an invisible placeable.
	
	See also cp_tat17ac_hkjn, cp_tat17ac_hkutl.
	
	Issue #310: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/310
	
	DP 2021-01-14																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SignalEvent(GetObjectByTag("cp_tat17ac_hkutl"), EventUserDefined(47));
}
