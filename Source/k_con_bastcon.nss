//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_carbast.dlg in tar_m02af (Taris Upper City Hideout).
	
	This script fires on the exit node of the conversation between Bastila, Carth,
	and the PC that happens on returning to the hideout post-swoop race. In the
	vanilla script, Bastila simply started a new conversation with PC about the
	vision that was shown during the transition between the swoop platform and the
	hideout to cover the loading screen. That vision has now been moved to take
	place between these two conversations, since that seems to make more sense and
	was probably the original developer intent.
	
	See also cp_tar02af_pchor, k_ptar_bastpart.
	
	Issue #603: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/603
	
	DP 2023-11-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("Bastila", 0);
	
	NoClicksFor(1.0);
 	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.15, 0.5);
	
	CP_FaceNPC(oPC, oBast);
	
	AssignCommand(oBast, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
	AssignCommand(oBast, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
	AssignCommand(oBast, ActionDoCommand(PlayMovie("02")));
	AssignCommand(oBast, ActionStartConversation(oPC, "tar02_bastvision", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
 }
