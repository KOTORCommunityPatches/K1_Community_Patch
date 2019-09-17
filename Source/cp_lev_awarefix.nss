////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This is a workaround to prevent the conversation on the Ebon Hawk post-Leviathan
	escape from becoming stuck when one of the party is in stealth. We have not
	been able to discover/replicate the conditions for this to occur, but it
	appears that in a limited number of cases that the rescuer in the jail break
	sequence is not being de-stealthed when interacting with the computer to
	release the rest of the party, as should normally be the case. They remain
	in stealth in the post-escape sequence and the conversation can become stuck
	if Carth (or possibly the PC) doesn't have a high enough Awareness to detect
	the NPC in question when they have to speak a line. This script provides a
	temporary Awareness buff that should allow the NPC to be detected and the
	conversation to proceed, although the NPC will remain in stealth throughout
	the conversation. They appear to disappear from the ship post-conversation,
	but will be available again normally via the party selection upon the next
	disembarkation. 
	
	Issue #9: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/9
	
	JC 2019-01-25                                                             */
////////////////////////////////////////////////////////////////////////////////

void CP_AwarenessBoost(object oTarget, float fDuration) {

	int nSkill = GetSkillRank(SKILL_AWARENESS, oTarget);
	int nBoost = 30 - nSkill;
	
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_AWARENESS, nBoost), oTarget, fDuration);
}

void main() {

	object oCarth = GetObjectByTag("Carth", 0);
	object oPC = GetFirstPC();

	CP_AwarenessBoost(oCarth, 30.0);
	CP_AwarenessBoost(oPC, 30.0);
}
