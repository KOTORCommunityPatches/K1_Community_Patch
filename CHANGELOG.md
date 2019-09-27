# CHANGELOG
## v1.8 - TBA 2019
### Additions
* Added a fix to the skin weights of the male player head PMHC01
* Added a fix for the commoner Asian male head comm_a_m to restore eye animation
* Added a fix for clipping collars on female Class 7 (PFBF) and Class 9 (PFBH) armours
* Added a number of model fixes for the Endar Spire to address various geometry issues
* Added a fix for a stray blaster appearing in the middle of a hallway in the Sith Base on Taris
* Added a fix for missing lightmaps in the entrance of the Taris Upper City cantina
* Added a fix for the positioning of the Council on Dantooine to prevent floating
* Added a fix for the hanging ivy on the walls of the Dantooine enclave landing pad
* Added a fix for an inaccessible container in The One's compound
* Added higher poly replacements for the placeable human "sitters" (cantina Pazaak players/drinkers)
* Added a fix for some female non-dancer Twi'leks wearing armour instead of plain clothes
* Added a fix for some female non-dancer Twi'leks in default stripper garb instead of plain clothes
* Added a fix for Helena wearing Jedi robes instead of regular clothes
* Added a fix for Carth prematurely complaining about being out of the loop
* Added a workaround/partial fix for the post-Leviathan escape stealth bug
* Added a fix for Dak respawning in the Korriban cantina
* Replaced broken injection-based Manaan DLGs in previous release with JC's pre-patched ones (TSLPatcher can't delete nodes)
* Added a fix for Jedi being visible in the back of a Malak cutscene on Deck 1 of the Star Forge
* Added a fix for a droid with the wrong soundset in the Taris Upper Sewers
* Added several fixes to the Dantooine training montage
* Added a fix for the player freezing during the pre-swoop race scene when racing for the Hidden Beks
* Added a fix for Carth not facing Kandon when interjecting during the pre-swoop race dialogue
* Added a fix for one of Canderous' goons in the Undercity having the wrong soundset
* Added a fix for Sand People disguises not working after the player used the rapid transit system or loaded from a save while disguised
* Added a fix for certain NPC soundsets with wrong or missing sounds
* Added new soundset for Trandoshans, ported from TSL
* Added a fix for the exit in the Sith Base on Taris having the wrong label
* Added a fix for Bastila not showing the fourth vision (K1R's fix)
* Added a fix for the Twi'lek Czerka Liaison Officers on Kashyyyk not resuming their patrols after dialogue
* Adjusted the post-Leviathan scene so the player is forced to talk to HK and therefore doesn't miss his content there
* Added missing landing gear and ramp to the Ebon Hawk in the Leviathan hangar
* Added more triggers for the second Xor encounter because he would refuse to show unless the player used the rapid transit system
* Incorporated some of JC's Minor Fixes
* Added a fix for two female Jedi background NPCs in the Dantooine enclave that would stop walking after being talked to
* Fixed some bugs in the Dead Settler quest
* Changed Casus Sandral's appearance from a generic corpse to something more suitable
* Added a fix for an NPC in the Leviathan bridge cutscenes that had some deformation issues
* Added improved commoner clothes textures (variants 01 and 07) ported from TSL
* Added a fix for Calo's Rodian prey in the Taris Undercity Apartments not properly drawing their weapons
* Added a fix for one of the Sith female NPCs on the Leviathan bridge having a drawn blaster during a cutscene
* Added an interjection for Carth in the pre-swoop race scene for the Beks to match his one in the Vulkar version
* Added a creature-based replacement for the corpse in the Dantooine Murder Mystery quest for improved visual quality
* Added/edited scripts in the Dantooine Murder Mystery quest to have Handon appear injured and for NPCs to exit when appropriate, plus removed some extraneous fades to black
* Added melee proficiency and/or weapons for some Duros on Dantooine that were lacking them
* Added a fix for the blade of Bacca's sword not being properly removed from the player's inventory when giving it to Freyyr in the Lower Shadowlands
* Switched the appearance for guards in the Sith Academy on Korriban to Sith Soldiers rather than Sith Officers
* Increased the walking speed of the diving suit on Manaan and the space suit on the Leviathan
* Added JC's Dense Aliens
* Added a fix for War Droid racetex variants having their blaster texture overridden by the body texture by swapping out integrated blaster mesh for external reference
* Added a fix for a non-functional trigger script for the Sharina conversation on Tatooine
* Changed Jagi to wear armour instead of clothes, swapped out his Rodian goons for Mando warriors, and address some dialogue facing issues
* Fixed the fade in at the start of the game so the player wouldn't be visible before they were meant to be
* Made Dia equip her melee weapon before attacking
* Made the slave girl in Davik's estate that's supposed to run away run away
* Fixed the raidii of the gas vents in Davik's estate
* Forcibly set the camera angle for a line of dialogue by the janitor in the Taris Upper City South Apartments to fix a line being spoken off-screen
* Forcibly set the camera angle for a line of dialogue by the Bastila in the Zelka Forn conversation (Taris Upper City South) to fix a line being spoken off-screen
* Fixed some companion facing issues during Canderous' recruitment conversation in the Taris Upper City Cantina
* Fixed and incorrect soundset for the Sandpeople Storyteller
* Changed the clothes variation the three drunks in Taris Upper City North wear and tweaked the DLG to reduce facing issues
* Changed the appearance of one of the Taris Upper City Cantina patrons that had an identical twin standing just a few meters away
* Made an attempt to get Carth to stop looking longingly at the PC for 30 seconds and face Mission while talking to her in the Undercity
* Tweaked some geometry in the Manaan cantina level model to patch some gaps
* Adjusted Canderous' dialogue in the Lower City cantina to prevent him from repeating lines if you talk to him again after keeping him waiting
* Repositioned two invisible placeables for security terminals in the Taris Sith Base to a more suitable height
* Fixed placeable heights on the Ebon Hawk to reduce floor clipping & floating
* Fixed the height of the workbench on Dantooine
* Raised the height of the invisible placeable for the Garage Head's desk in the Vulkar base
* Fixed the position of the strongbox in the Taris Lower City apartments
* Changed Bolook's skin color from orange to green on account of VO saying so
* After much wailing and gnashing of teeth, finally got Zhar to face the player post-montage, and stop throwing a tantrum afterwards (thanks to JC)
* Switched the order of the Taris to Dantooine sequence so the landing movie is played before the conversation, and the EH skybox is Dantooine instead of space
* Fixed the upper teeth mesh clipping through the cheeks on the male Twi'lek head
* Brought Ahlan Matale back down to earth during his rant in the Council chambers
* Adjusted Vandar's dialogue to prevent him from repeating himself if you talk to him again before investigating the ruins
* Added a trigger for the scene with Vandar after the player completes the trials to prevent positional wonkiness
* Fixed player facing during the Taris duel introductions
* Fixed a possible freeze during dialogue with Ajuur in the Taris Upper City cantina
* Fixed some animations being out of sync with VO during the introduction of opponents in the Taris duels
* Fixed some monitor placeables not being properly attached to walls in the Taris Upper City Cantina
* Rejigged party positioning during the Black Vulkar pre-swoop race conversation, making the scene a bit nicer
* Changed Elise's initial flirting animation to pleading to better suit the mood
* Changed the appearance of the guard droids in Davik's estate to Rodians, as they could be gassed, sounded like Rodians, and were generally not droids
* Made some skin weight adjustments to the fat rolls under the Hutt's chin to reduce clipping issues
* Forced Gadon Thek's conversation to directly follow on from Zaerdra's triggered "Hold it right there" outburst to eliminate poor positioning and facing issues
* Made a replacement for the unused fat commoner male model by editing the regular commoner male body to bypass UV issues
* Shunted one of the Gamorreans in the Taris sewers out of the corner he was skulking in
* Unequipped the surviving Hrakert scientists' weapons and made them only equip them in the event of combat
* Improved Bek reaction time following security alert in the base
* Made Redros equip his weapon for the swoop race brawl
* Added new dialogue trees for Vandar so the player could continue speaking to him about the usual topics after completing the trials
* Gave the repairable Vulkar bar droid a blaster rifle
* Made various changes to the initial Davik conversation to resolve the usual facing and positional crimes
* Fixed some bad lightmaping on the dais in Davik's throne room
* Fixed some bad lightmaping on the walls of the Vulkar base's lower level
* Forced some mooks in the Vulkar base to equip their stored weapons to prevent unarmed attacks
* Changed some Twi'lek male appearances in Javyar's cantina to diversify things a bit.
* Added a new orange Twi'lek male appearance using the unused Twi'lek male body orange handed texture variant
* Added a new blue Twi'lek male head, ported from TSL
* Raised the height of the selection icon for the torture cage release in Davik's estate
* Added/edited some scripts to prevent certain guests and guards in Davik's estate attacking with their fists
* Diversified the outfits of civilians in Davik's estate
* Cleaned up some texture blurring and distortion around the mouth of the Krayt Dragon cave on Tatooine
* Fixed a gap in the surrounds of the forcefield in the Upper Shadowlands and pushed the grass back from the ramp to prevent clipping
* Shuffled the boxes behind HK in the Anchorhead droid shop further apart to stop the swaying cable from clipping into them
* Clamped down on the Viper Kinrath in the Lower Shadowlands dropping unnecessary corpse items
* Removed some green patches in the lightmaps of the Manaan hotel's entrance hallway that didn't match the scene's lighting
* Tweaked the Griff conversation in the Sandpeople enclave to fix some facing issues
* Doubled the duration the Kashyyyk Star Map stayed open
* Gave the comm_a_f/comm_a_f2/N_TatComW_F heads a makeover to fix the worst of their shading/clipping/texture issues
* Added preemptive fix for a Mando bringing a knife to a gunfight
* Pushed the Leviathan's skybox further back and added new Sith fighter animations to stop them clipping through the skybox
* Fixed a gap in the floor and some bad UVs in the entrance of Manaan West Central
* Added missing K_EXIT / SW_EXIT waypoints to Tatooine docking bay to allow messengers to properly exit the area
* Plugged a couple of gaps in adjoining walkmeshes in the Leviathan Prison Block that were allowing targeting/shooting of enemies through walls
* Moved a swoop fan minor NPC on Manaan that was blocking a triggered conversation with a Sith on module entry
* Merged the cutscene of the shark attack victim into a single animation and added additional keyframes to move shark and victim off-screen at the end
* Added a generic OnSpawn to have an NPC equip a ranged weapon (or melee weapon if no ranged) from their inventory
* Made a few Sith technicians on the Leviathan equip their weapons on spawning to prevent the attacking with fists issue
* Made a raft of changes to the Sith prisoner interrogation in the Manaan Republic Embassy, fixing facing, skipping lines, camera angle issues, etc.
* Curtailed the patrol route of the Selkath security droid in the entrance of the Manaan Republic Embassy to stop it freaking out companions during conversation with Roland
* Turned off the force cage the Sith prisoner in the Manaan Republic Embassy was in once he is no longer present
* Moved a crate in the back of the Hidden Bek base that was clipping into a wall
* Moved the swoop records computer panel in Manaan Ahto East to stop it clipping into a wall
* Set the DLG for a bounty hunter in Javyar's cantina to human instead of computer
* Added a party jump and static camera to fix the issue with the Hrakert Station merc going out of frame when playing the Horror animation
* Replaced almost all the soundsets for Hrakert Station UTCs, mostly Selkath using droid soundsets
* Set Bandon's Dark Jedi offsiders to neutral to prevent them getting twitchy before their boss is ready to fight
* Switched previous hard overwrite of Hrakert Station GIT to patcher setup
* Added a conditional script for one player response during the Sandral-Matale Feud so it's only available if the player spoke to Ahlan Matale about a reward
* Made a transformer in the Sith base on Taris non-interactable
* Removed an infinite DS point exploit from the Sasha encounter
* Removed an infinite DS point exploit from Roland Wann post-Hrakert Rift
* Added a check to remove the Czerka miners in the Dune Sea once they have been talked to and the Sandpeople enclave is done
* Tweaked Elora's dialogue to remove some lines if the player already heard about Sunry's situation from Davin
* Fixed some bad lightmap UVs on the floor of the training room in the Manaan Sith Base
* Tweaked the script that adds Jolee to the party in the Upper Shadowlands to hide the switch between NPC and Party versions
* Made some alterations to make Trask stay in the same spot when he joins the party instead of jumping behind the player
* Replaced an incorrect supermodel reference in one of Vandar's cutscene stunt models that was causing some animation issues
* Moved the patrol waypoints of one of the Czerka guards in the Tatooine docking bay to prevent him walking through the middle of messenger conversations
* Nudged the camera position sideways in the jawless Malak cutscene to keep the reveal from being spoiled early in widescreen resolutions
* Changed the Rakatan Temple turret soundsets from Bith to none
* Fixed a typo that prevented various NPCs from commenting on the Kashyyyk situation
* Edited the stunt model for the admiral in the jawless Malak cutscene to reduce clipping issues with his left arm and eyeballs
* Corrected the final wager value of pazaak player Kudos (the guy in Fazza's hunting lodge on Tatooine) from 50 to 500 credits
* Fixed a positional offset in the stunt model for a seated officer on Dodonna's ship causing them to float in mid-air
* Added additional script from the v1.1 update of Markus Ramikin's Bastila Romance Scriptfix mod
* Wrangled party when entering the Elder's compound on Lehon
* Prevented some characters in the Elder's compound on Lehon from attacking with their fists
* Adjusted party positioning and facing when activating the Rakatan computer in the Elder's compound on Lehon
* Fixed the party bumping into each other like drunk teens during the cutscene after giving the sacred tome to The One on Lehon
* Added missing sound Event to Malak's taunt animation for his saber flourish
* Gated off asking HK about restoring memories post-Leviathan after the first time
* Disabled screen blurring effect for Force/Knight/Master Speed
* Added new soundset for DS Juhani in the Grove, removing her Republic/Jedi-related barks
* Switched some Sith Elite Troopers in Manaan hangar bay to the proper appearances
* Moved some troopers in the Manaan Sith Base so they would see the party entering the room properly
* Made a host of edits to the stunt animations for the LS ending cutscene to improve it for widescreen resolutions
* Tweaked the initial scene when boarding the Star Forge to account for widescreen framing
* Forced the party to turn around before the droids burst in on Deck 1 of the Star Forge
* Changed listener tags in Thalia May's DLG in the Korriban Shyrack Caves to prevent her turning her back on the party
* Fixed global generic droid templates to use the proper soundsets for their type instead of the Bantha soundset
* Fixed an off-screen line by the Mysterious Man on Manaan and prevented him being visible after the conversation finished
* Remapped distorted UVs for a section of cliff edge in Korriban's Valley of the Dark Lords
* Swapped incorrect script reference in Korriban Academy duel scene causing endless combat music
* Gave Saul Karath an on-screen death on the bridge of the Leviathan and stopped Carth talking over his death cry
* Made changes to the exploding pillar scene in the Tomb of Ajunta Pall on Korriban to prevent AI and UI issues
* Jumped the party for Yuthura's conversation in the Dreshdae cantina and forced companions to face her on their interjections
* Edited Dustil's conversation in the Korriban Academy to jump the party and fix some facing issues with Carth and the player
* Added a new OnDeath script for Dustil to account for killing him at different stages of Carth's personal quest
* Set the DLG for the ancient computer in the Korriban Tomb of Tulak Hord to skippable and fixed the door opening animation playing too fast
* Made numerous edits to the DLG and scripts for the Jorak Uln scenes in the Korriban Tomb of Tulak Hord to improve aesthetics and fix minor issues
* Reduced the Tach sound effect by -10dB to make it more bearable
* Purged the two pre-training conversations with the Jedi Council on Dantooine of facing issues
* Fixed some non-visible subtitles by Canderous and Jolee due to a Delay value of 0 on those nodes in the relevant DLGs
* Edited the conversation with the overseer droid in the Dantooine Ruins to improve facing and camera angles
* Merged the two separate Star Map cutscenes in the Dantooine Ruins into a single scene
* Edited the post-Ruins conversation with the Dantooine Jedi Council to fix various issues
* Switched an invalid animation number in Chuundar's DLG
* Locked the door to the Tomb of Naga Sadow in the Korriban Valley of the Dark Lords
* Edited the OnUserDefine of the Tuk'ata Mother in the Korriban Valley of the Dark Lords to remove an incorrect placeable reference
* Fixed Elise’s walking pace when she exits so she runs away when upset and walks away otherwise
* Wrangled Tuk'ata mother and friends in the Korriban Valley of the Dark Lords to stop them running into each other like drunken teenagers
* Fixed facing and camera issues in the dialogue with the surviving scientists Kono and Sami
* Gave the Sith student Tariga gender reassignment therapy
* Prevented Lashowe from accidentally burning her own face off with her saber in the post-Tuk'ata mother conversation in the Korriban Valley of the Dark Lords
* Reinstated some incorrectly applied starting conditionals for Tyvark's DLG on Manaan
* Wrangled the party for the first conversation with Yuthura inside the Korriban Academy
* Resolved some issues trying to give a datapad to Adrenas in the Korriban Academy
* Added some listener tags to Uthar's DLG in the Korriban Academy to prevent facing issues during the Shaardan handing in a fake sword cutscene
* Checked for (and removed) Shaardan's corpse in the pre-final trial conversation with Uthar in the Korriban Academy
* Edited Uthar's conversation in the Korriban Academy to remove the salute, swap the party leaving for a fade-out, and change the running for the back door to a walk
* Moved the party out of the way during Uthar's introductory cutscene in the Korriban Academy and stopped him bowing to the students
* Jumped wandering NPCs in the Korriban Academy to the edge of the room whenever a conversation with Uthar commences
* Swapped the clothing variation on one of the two pilots in the Korriban Dreshdae cantina
* Changed the Twi'lek females in Dreshdae on Korriban from stripper to clothed appearances
* Wrangled the party for the confrontation with Lashowe in Dreshdae on Korriban
* Swapped Lashowe's dark uniform in Dreshdae on Korriban to the light one to match her other appearances
* Gave Yuthura and Uthar dark uniforms in the Korriban Sith Academy to match their other appearances
* Tweaked Sith guards outside the academy to match the ones inside the academy
* Incorporated fixes from the latest update of JC's Korriban: Back in Back
* Massaged the intro cutscene for the Tomb of Naga Sadow on Korriban to remove a delay and resolve some facing issues
* Fixed some facing issues during the final scene in the Tomb of Naga Sadow on Korriban and helped Uthar figure out how to use a door
* Herded the party more efficiently when returning to the Sith Academy on Korriban post-Tomb of Naga Sadow
* Removed Dustil's datapad from Uthar's quarters once the Sith Academy on Korriban goes hostile
* Added a missing stage update for Dustil's quest when taking the datapad found in Uthar's room in the Sith Academy on Korriban and prevented multiple triggers of the related conversation
* Incorporated JC's Republic Soldier Fix
* Equipped Tariga and a couple other Sith students with lightsabers
* Prevented re-entering the Vulkar base on Taris post-swoop race (and the Bek base if Gadon is dead)
* Fixed the momentary fade-in before the intro cutscene in the Korriban Tomb of Naga Sadow starts
* Edited the conditionals that check how many Tach glands the player has when talking to the Czerka officer in the Kashyyyk Upper Shadowlands to count the stack size properly
* Corrected an invalid ResRef in Roland Wann's reward script in Manaan East Central
* Swapped some incorrect soundsets for the Geonharadan in their final encounter in the Tatooine Dune Sea
* Added a safety net for squishy players getting ambushed by the Gamorreans in the Tatooine Dune Sea, reducing the mine damage based on their current health
* Changed an incorrect starting conditional checking for Jolee in the Gorwooken DLG in The Great Walkway on Kashyyyk
* Gave the assault droids in Manaan Hrakert Station feats to use their equipped weapons
* Fixed an issue with the rogue Assassin Droid in the Korriban Tomb of Marka Ragnos when carrying extra stealth belts
* Removed an item duplication exploit when Zaalbar is removed from the party on Kashyyyk
* Added a script to properly remove any Gizka on the Ebon Hawk before the Star Forge
* Made Juhani less antisocial, facing the doorway of the broom closet she skulks in on the Ebon Hawk

### Changes
* Cleaned up changes.ini, removing extraneous editor data and orphaned entries (removed ~2,000 lines)
* Edited readme and info RTFs, altering formatting and adding updated mod contributions
* Merged separate install for a single UTC (filename clash) into the main install
