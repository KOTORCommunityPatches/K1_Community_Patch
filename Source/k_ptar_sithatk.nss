//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_sithintero.dlg in tar_m02ad (Taris Upper City North Apartments).
	
	This is fired during one of the conversations with the Sith troopers that are
	interrogating someone about stolen Sith uniforms, turning them all hostile. The
	vanilla script did this via signals to each troop's OnUserDefine script, but it
	seems that this caused a minor issue if they had transitioned to searching the
	apartment after the suspect was dead where they could continue playing the
	search animation even after going hostile. It has been changed to directly set
	them hostile to hopefully avoid any lag in them getting the commands.
	
	Issue #326: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/326
	
	DP 2019-11-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"
#include "k_inc_generic"

void CP_Hostile(string sTag, int nIndex) {
	
	object oSith = GetObjectByTag(sTag, 0);
	
	// Just to make doubly sure, set their OnHeartbeat search flag to false again
	SetLocalBoolean(oSith, nIndex, FALSE);
	
	AssignCommand(oSith, ClearAllActions());
	DelayCommand(0.1, AssignCommand(oSith, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
	DelayCommand(0.2, ChangeToStandardFaction(oSith, STANDARD_FACTION_HOSTILE_1));
	DelayCommand(0.5, AssignCommand(oSith, GN_DetermineCombatRound(OBJECT_INVALID)));
}

void main() {
	
	CP_Hostile("tar02_sithcommander", SW_PLOT_BOOLEAN_01);
	CP_Hostile("tar02_sithtrooper", SW_PLOT_BOOLEAN_02);
	CP_Hostile("tar02_sithtrooper2", SW_PLOT_BOOLEAN_03);
}
