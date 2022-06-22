# CHANGELOG
## v1.10.0 - TBA
### Additions

* Adjusted the eyelid and mouthbox UVs for the old black male head 2 to move them from the beard texture
* Prevented the inadvertent removal of the first journal entry of the "Dwindling Supplies" quest on the Ebon Hawk
* Destroyed the moisture vaporators after giving them to the Chieftain in the Tatooine Sand People Enclave to prevent them dropping as loot if the Sand People turn hostile
* Corrected the orientation of the walkmesh for the force cage placeable
* Prevented the cutscene of the party approaching the ruins in the Dantooine Jedi Enclave Courtyard from triggering without Bastila in the party

### Changes/Updates/Revisions


## v1.9.2 - March 27, 2022
### Additions
* Adjusted some SFX timings in the Taris Upper Sewers cutscene of the Rancor eating a grenade to sync more closely with the VFX
* Changed an incorrect animation reference in Shaardan's intro cutscene in Korriban Dreshdae
* Fixed a flag placeable in the Elder's Compound on the Unknown World that was floating above the ground
* Repositioned the selection icon for the Sith Embassy transport on Manaan
* Switched the appearance of the Duros prisoner in the Taris Sith Base to match his apartment appearance
* Added some missing lamp models to the Unknown World temple interior and tweaked the orientation of some pillar placeables
* Removed an extraneous yell from Calo Nord during his demise cutscene in Davik's hangar on Taris
* Fixed an incorrect credit deduction bug in the Sarna/Yun conversations in the Taris Upper City Cantina
* Stopped the party from backtracking through the outer hull walkway on the Leviathan to prevent being stuck in the space suit appearance
* Swapped the class skills for Consular and Sentinel
* Removed a repeated VO line from Komad in the Tatooine Eastern Dune Sea and adjusted the cropping on another
* Herded the party and prevented the speaking party member looking at the ground during the Zaalbar-less scene at the start of the Great Walkway on Kashyyyk
* Plugged some holes in the ceiling of the training room in the Manaan Sith Base
* Addressed a number of problems with Eli and Matton in the Kashyyyk Landing Pad, including a potential soft-lock, duplicate outfits, a missing DLG line, and lack of continuance between some scenes
* Fixed numerous issues with the springing Zaalbar from prison scene in the Taris Lower Sewers, correcting facing, herding the party, changing camera angles, and correcting one of Mission's lines that had contradictory information
* Tweaked the hood of the cutscene Revan model to prevent certain hair models clipping through
* Fixed some incorrect skin weights on Admiral Dodonna's body model
* Revised the scene where Mission opens the forcefield in the Taris Lower Sewers so that she interacts with the terminal
* Replaced a function in one of the Ebon Hawk's module scripts to store Juhani's state in line with the other party members
* Trimmed the silences from the beginning of Bastila's post-vision cutscene lines
* Moved a blaster on the Jedi corpse in the Krayt cave in the Tatooine Eastern Dune Sea to a different nearby corpse
* Changed the green lightsaber crystal drop on Korriban from the Torturer in the Academy to the Qel-Droma Robes corpse in the Shyrack Caves
* Tweaked the Calo vs Vulkars cutscene in the Taris Lower City Cantina to add missing SFX, make him dual wield, and fix some clipping issues
* Forced Ithorak in the Manaan Docking Bay to equip his weapon before initiating combat and corrected his soundset
* Changed the appearance of one of the thugs accompanying Hulas in the Tatooine Dune Sea to give him a different outfit
* Switched a number of plot-related doors across Taris to use keys in order to remove the unnecessary security UI
* Enlarged the trigger outside the Taris Sith Base entrance and altered the scripts to prevent the scene of T3 opening the door failing to fire correctly
* Addressed a number of facing issues during the finale of the Taris swoop race, made Brejik wait to equip his blaster, and prevented the swoop fans from being removed prematurely
* Edited player head PFHB03 to fix clipping, UV issues, and odd geometry
* Changed ambient colour value for referenced lamp model in the Unknown World Temple interior to account for no lightmapping and fixed some sloppy geometry
* Edited player head PFHB04 to fix sloppy eyeball UVs
* Added some backfaces to various pipes in the Taris Black Vulkar base to prevent culling issues
* Added speaker tag to Taris Upper Sewers cutscene so the Rancor's snorting would be properly attributed
* Changed corpse pile placeable in the Taris Upper Sewers so it is destroyed after the Rancor is dead, and added a filter to the Give Item UI to only show relevant items
* Temporarily disabled the AI of the droids in the Korriban Tomb of Ajunta Pall to prevent them activating prematurely, and stopped them reorienting on the player if clicked on
* Removed an unintended exploit in Gonto Yas's dialogue on Manaan that allowed players to bypass his Pazaak match loss limit
* Corrected one of the endgame Admiral Dodonna cutscenes to use proper speaker labels in the subtitles
* Prevented the party from staring at the floor during the initial cutscene of the showdown with Saul Karath on the Leviathan Bridge
* Adjusted the rotation of various placeables in the Korriban Sith Academy that were facing in awkward (or plain wrong) directions
* Changed the description of the pass card in the Taris Black Vulkar Base (Upper) to more correctly reflect its intended purpose
* Made the player the listener in the final conversation after defeating Dark Side Bastila on the Star Forge to prevent her talking to herself
* Trimmed a repetitive phrase from one of lines used by the Twi'lek messenger that appears after winning the swoop race on Taris
* Prevented one of Bastila's lines during the Leviathan interrogation scene skipping if the player was female
* Edited Dark Side transition textures for player head PFHB02 to fix incorrect duplicated irises
* Changed a camera angle during The One's initial conversation on the Unknown World to prevent a line being spoken off-screen
* Jumped the party when talking to Greeta about Griff in the Tatooine Czerka Office to prevent Mission skating across the floor
* Adjusted the global party banter trigger script to account for the delay in Carth's "out of the loop" conversation
* Amended global level scaling buff script to ensure that a creature's current hit point and new max hit points match
* Reduced the maximum walk speed for player characters to prevent power walking during cutscenes
* Closed a gap around the doorway in one of the side rooms in Davik's estate on Taris
* Fixed some gaps around a couple of wall pillars in the Unknown World temple main floor
* Replaced some of Bastila's duplicate lines that were sped up and/or pitch shifted with the original version
* Corrected how random loot is spawned in a few corpse placeables in the Kashyyyk Upper Shadowlands
* Adjusted the position of a tree mesh in the Kashyyyk Great Walkway to eliminate a gap
* Made changes to Zaalbar's return in the Chieftain's Hall on Kashyyyk to hide the swap between the stunt and party versions
* Added speaker/listener tags to the Freyyr and Chuundar conversations to resolve various facing issues in the Chieftain's Hall on Kashyyyk
* Addressed some facing and party wrangling issues in the Yuka Laka and HK-47 conversations in the Tatooine Droid Shop
* Camouflaged the swap between stunt and party versions of HK-47 when adding him to the party after buying him in the Tatooine Droid Shop
* Wrangled the party into proper positions based on the entry point, cleaned up some facing, and tweaked some camera angles during the cutscene in the foyer of the Sith Base on Manaan
* Gave a Sith captain in the Manaan Sith Base the correct soundset for his appearance
* Swapped the appearance of the training droids in the Manaan Sith Base to match their soundset and template name
* Cleaned up the party's positioning during the player's arrest outside the Sith base in Manaan Ahto East
* Changed the variant of the war droids used by Selkath security during the player's arrest outside the Sith base in Manaan Ahto East to differentiate them from the Sith droids
* Delayed the spawn-in of a replacement Sith war droid outside the Sith base in Manaan Ahto East until after the player's trial
* Adjusted the walkmesh for the Yavin station to prevent the player escaping the level and the camera clipping through the observation window
* Tweaked Jolee's global dialogue to prevent him talking about Rakatan influence on the Wookiees before having opened the Kashyyyk Star Map
* Edited female Republic officer head model to correct offset pivot for left eyelid mesh and remove spurious skin weights
* Added a check to Ebon Hawk exit script to force the player character as party leader
* Revised the OnUsed script for the galaxy map in the Ebon Hawk when crashed on the Unknown World to avoid displaying an empty bark bubble
* Herded the party during the meeting with Mission in the Taris Undercity and cleaned up her integration into the party post-scene
* Edited one of HK-47's lines in the Tomb of Tulak Hord on Korriban referring to the player as "he", regardless of their gender
* Moved Lashowe a little closer to her console in the Korriban Sith Academy so she didn't need to rely on the Force to activate the keypad
* Prevented an infinite XP exploit when repeatedly asking Yuthura about the Sith Code in the Korriban Sith Academy
* Adjusted the walkmesh for Manaan East Central to properly conform to the arches in the central corridor
* Reduced left/right brow bone influence on PFHC01 to avoid the eyelids clipping during certain facial animations
* Revised some minor Mandalorian variant appearance values, such as body bag type and footstep sounds
* Corrected a starting conditional script that prevented some minor dialogue nodes appearing in the Korriban Sith Academy
* Wrangled the party during the initial cutscene of the first time meeting The One on the Unknown World to keep the party members under control
* Some plot-related doors in the temple on the Unknown World were edited to remove the Security UI since they should not be sliceable
* Prevented an unnecessary duplicate pass card dropping in the upper level of the Taris Black Vulkar Base
* Added a missing dialogue node when reinitiating conversation with Bastila on the Star Forge
* Removed extraneous Jolee and Juhani journal entries after siding with Bastila on the Unknown World
* Prevented Vandar using the flirt animation when asking the player about the Sandrals and Matales being wiped out in the Dantooine Jedi Enclave
* Added a starting conditional to replies in Vandar's Dantooine Jedi Enclave DLG to prevent the player asking what to do about the Sandral/Matale feud after it was already resolved
* Resolving the Promised Land quest in the Taris Undercity could leave the Infected Outcasts quest in an orphaned state
* Adjusted Vandar's body model UVs to fix some inappropriate texture assignments and reduce stretching
* Corrected the missing teeth texture for Korriban Sith Academy student Mekel's head model
* Ensured that the line by the crazed merc in Manaan Hrakert Station about returning to the surface fired under the correct circumstances
* Made sure the player was facing the trooper at the door during the Sith interrogation scene in the Taris Upper City North Apartments
* Reduced some of the duplication amongst male NPC appearances in the Taris Upper City Cantina
* Prevented camera clipping and the party running into each other when chasing Vorn Daasraad's droid in the Tatooine Sand People Territory
* Corrected some facing issues during conversations with Igear in the Taris Undercity
* Tweaked the Bastila showdown on the Unknown World Temple Summit to correct facing, wrangle the party, and ensure proper lightsaber safety
* Edited the female child head and body models to reduce some clipping with the eyelids and skirt
* Corrected some spurious skin weight assignments for the female Republic soldier head model
* Changed one of the quest updates for the Leviathan prison break to the correct one
* Corrected starting conditional for having the Sith base passcard when talking to the interrogator in the Republic base in Manaan East Central
* Herded party, prevented NPCs running into each other, and forced entry direction during the post-ending cutscenes in the Kashyyyk Landing Pad
* Repositioned the party and the hostile Rakata during the first encounter on the Unknown World Central Beach
* Corrected scripts for injured Wookiee in the Kashyyyk Lower Shadowlands to grant the Upari amulet and properly account for the party's healing abilities
* Revised the Unknown World Central Beach post-temple scenes, cleaning up party positioning, facing, camera angles, etc.
* Added a neutral creature exclusion to the master AI script to prevent spurious responses to hostile creature AI shouts
* Removed security icons from non-unlockable doors in the Leviathan Hangar Bay
* Made sure that Bastila returned all her gear at the end of the Malak showdown scene in the Leviathan Hangar Bay 
* Tweaked the final cutscene in the Leviathan Hangar Bay to slow down the PC and fade-out sooner
* Adjusted the return to base function of the Hidden Bek door guard in Taris Lower City to ensure she adopted her original facing
* Made the Czerka miners next to the sandcrawler in the Tatooine Dune Sea return to their starting points after the Sand People attack is over
* Edited the white commoner female head model (e.g. Belaya) to make the ear lobes less prominent
* Made sure the correct version of Jagi spawns in the Tatooine Dune Sea for the showdown with Canderous
* Gave Malak his unique saber for all his cutscenes on the Star Forge where he had a generic hilt
* Tweaked initial cutscene for the injured Wookiee in the Kashyyyk Lower Shadowlands and destroyed the Mando datapads at quest conclusion
* Removed extra synthesised odours and the Bek datapad once the Rancor in the Taris Upper Sewers has been dealt with
* Jumped player and Trask and adjusted camera for level-up conversation on the bridge of the Endar Spire Command Module
* Made adjustments to final Xor encounter to (hopefully) prevent it being left in a broken state
* Herded party for the scene with Chorrawl in the Kashyyyk Great Walkway after having agreed to help Freyyr
* Repositioned two supply containers in the Kashyyyk Great Walkway to prevent them clipping into a wall
* Jumped the party when talking to the Storyteller and prevented him repeating one history in the Tatooine Sandpeople Enclave
* Jumped the party when Gurney accosts player about Rakghoul serum in Taris Upper City South and changed some camera angles
* Tweaked a wall texture in the Taris Hidden Bek Base to make it tile seamlessly
* Added a short delay to the end of the Calo Nord scene on the (stunt) Leviathan Bridge
* Sent Lurze to the nearest exit and stopped him skating along the floor in Korriban Dreshdae
* Destroyed Twisted Rancor Trio datapad along with other Taris items when entering the Dantooine Jedi Enclave
* Prevented asking Vrook and Vandar in the Dantooine Jedi Enclave about the Mando raiders after the situation was resolved
* Added provision for level capped players accessing the conversations for Jolee and Canderous, and removed Unknown World requirement from final Canderous branch
* Removed Security UI from airlock doors and the main door between the Command Deck and Bridge on the Leviathan
* Faced player towards Carth after waking up in the initial scene in the Taris Hideout
* Prevented player freezing after the workbench tutorial in the Taris Hideout
* Switched Rakata computer terminals in the Unknown World Temple Main Floor to use the ancient instead of modern interface
* Repositioned the waypoints for the party jump when exiting the airlock on the Leviathan Bridge so the party is facing the right way
* Repositioned the party and hid weapons/masks for the post-Leviathan scene on the Ebon Hawk
* Jumped party, fixed facing, and accounted for triggering from the opposite side for Sith thugs and murderer scenes in Korriban Dreshdae
* Tweaked party jumps when talking to the Rakatan hologram in the Kashyyyk Lower Shadowlands to prevent freezing
* Moved some of the vines near the Rakatan hologram platform in the Kashyyyk Lower Shadowlands to stop them blocking shots during the conversation
* Stopped module background ambient sound effects playing over the credits sequence for the Dark Side ending
* Corrected facing and made party members attack in the first encounter with the Black Rakata in Unknown World North Beach if already working for the Elders
* Adjusted some camera angles and party positioning for the Trandoshan encounters in Yavin Station
* Edited Trask's head model to fix shading errors around the eyes and tweak the eyelid positions
* Appended envmap TXI data to Bastila's clothing texture to prevent transparency
* Prevented subtitles from disappearing from a Rodian's line during the scene with Calo Nord in Taris Lower City Apartments (West)
* Added hide masks/weapons flags to the pre-Leviathan scene on the Ebon Hawk
* Adjusted the sparks emitter for the War Droid in the dead animation so that the sparks don't fire backwards
* Prevented Duros in Taris Upper City South Apartments from freezing after the post-Sith raid conversation
* Prevented DLG for Zuulan's speeder in Dantooine Matale Grounds from exiting when choosing to use a mine and not having one
* Changed invisible placeable name for Zuulan's speeder DLG in Dantooine Matale Grounds since it showed up in the Feedback panel
* Changed invisible placeable name for the Gamorrean ambush in the Tatooine Dune Sea since it showed up in the Feedback panel
* Gave Jordo a Czerka uniform and fixed some camera angles and speaker/listener tags for his messenger conversation with Carth
* Added some speaker/listener tags and changed some camera angles in Xor's messenger conversation with Juhani

### Changes/Updates/Revisions
* Revised previously adjusted lightmap UVs for the floor of the training room in the Manaan Sith Base, adding a new, cleaner custom lightmap
* Revised the wrangling of party Trask's spawn-in on the Endar Spire, forcibly jumping the player to try and finally eliminate Trask randomly teleporting
* Merged some hijacked module OnEnter/Heartbeat scripts after finding a method to decompile the vanilla scripts
* Tweaked the exit script for the Dantooine Murder Mystery quest to better hide the NPCs being destroyed under the fade-out
* Fixed clashing row ID assignment for the Knight and Master speed blur removal configs
* Removed some in-DLG forced animations for Bastila and Carth when talking to Zelka Forn in the Taris medical clinic that were causing a pause, switched to scripted anims
* Removed the now deprecated facing script for Carth during the meeting with Mission in the Taris Undercity
* Revised OnEnter scripts that set up the Xor ambush to prevent an unintentional duplication when fast travelling to the Hawk afterwards
* Corrected the alternative version of the fight scene with The One on the Unknown World that was partially broken by a missing script
* Made sure the third trooper in the Sith interrogation team in the Taris Upper City Apartments attacked when ordered
* Revised post-Leviathan stealthed NPC fix, which still wasn't working, with a (hopefully) foolproof approach
* Patched some remaining holes still visible in the Ebon Hawk in the Leviathan Hangar Bay
* Added an equipment duplication function to the K1CP include
* Extended the existing powered saber blade overrides in the Malak showdown scene in the Leviathan Hangar Bay to include the player
* Removed previous Jagi quest fix on Tatooine, since it wasn't actually doing anything
* Revised Saul Karath model to use the vanilla talk animation to prevent odd deformation
* Replaced previous trigger script fix for Xor final encounter with an all-new implementation
* Corrected the Casus-related nodes in the replacement DLG for the droid in the Dantooine Sandral Grounds
* Added hide masks and weapons flags to the pre-swoop race scenes on Taris
* Tweaked the Dantooine Ruins scenes with the Overseer droid and Star Map to remove Force Speed, prevent player freezing, and stop Bastila looking at the ground
* Corrected Carth's facing, hid masks and weapons, and tried to prevent the three Troopers failing to turn up during/after Saul's second cutscene on the Leviathan Bridge
* Hid masks and weapons in the Jorak Uln scenes in the Korriban Tomb of Tulak Hord
* Tweaked Czerka Rep and Griff's conversations in the Tatooine Czerka Office
* Jumped the party for subsequent Nilko Bwaas conversation in Manaan Ahto West
* Jumped the party for Matrik convos in the Taris Lower City Apartments (East)
* Removed Force Speed from the party before the various Council conversations in the Dantooine Jedi Enclave
* Jumped the party for the Sith patrol scene in the Taris Undercity, preventing the Troopers from getting too close
* Extended opening shot length and ensured party members attacked in the Bandon showdown in Manaan Hrakert Station
* Removed player appearance.2da walk changes since they were deprecated and conflicting with creaturespeed.2da changes
* Stripped Force Speed from player during the walk with Uthar in the Korriban Sith Academy when leaving for the Tomb of Naga Sadow
* Prevented party from being in their underwear and T-posing if choosing to attack when entering the Tatooine Sand People Enclave the first time

## v1.8 - December 02, 2019
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
* Gave the repairable Vulkar bar droid a blaster rifle and disabled its plot flag
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
* Wrangled party when entering the Elder's compound on the Unknown World
* Prevented some characters in the Elder's compound on the Unknown World from attacking with their fists
* Adjusted party positioning and facing when activating the Rakatan computer in the Elder's compound on the Unknown World
* Fixed the party bumping into each other like drunk teens during the cutscene after giving the sacred tome to The One on the Unknown World
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
* Prevented Mission from freezing in the background during Lena's conversation
* Removed a gap in the wall behind the beds in the Taris Upper City hideout
* Gave the player a reaction to their announcement in the Taris Upper City Cantina duels to match that of their opponents
* Added party jumping to the conversation with Canderous in the Taris Lower City cantina to bring it in line with changes made to the sister conversation in the Upper City cantina
* Fixed off-screen companion interjections in the Zaerdra conversation when returning to the Taris Hidden Bek base post-swoop race
* Fixed non-wandering wandering mooks when returning to the Taris Hidden Bek base post-swoop race
* Edited the VIS for the Taris Black Vulkar Base (Upper) to make the kitchen and elevator room visible to each other
* Cleaned up the Dantooine Sandral Estate foyer conversations once and for all (hopefully)
* Implemented a check (and hopefully a fix) for messengers trapped in the closet on Dantooine
* Herded the party and altered some camera angles for the Maana conversation in Tatooine Anchorhead
* Lightened the skin tone of Griff's hands to match his head
* Prevented a Gamorrean vanishing when running away in the Tatooine Dune Sea ambush cutscene
* Fixed some off-screen lines by the Protocol Officer in the Tatooine Czerka Office
* Fixed off-screen companion interjections in the Freyyr conversation in the Kashyyyk Lower Shadowlands
* Fixed Jolee speaking lines off-screen in Davin's conversation
* Jumped party for Nilko conversation in Manaan Ahto West and cut straight to the point, skipping the "come speak to me" intro
* Gave Gonto Yas in Manaan Ahto West a different outfit
* Jumped the party if Juhani was present when talking to Dak in the Korriban Valley of the Dark Lords to prevent facing issues
* Added listener tags to fix facing issues with the two Dark Jedi in the Unknown World Temple
* Tweaked the fight scene with The One on the Unknown World to hide some bad textures and tighten up the timings
* Adjusted the scene with the Duros on the Unknown World Central Beach to fix an out of frame character, camera wiggle, and missing fade-out
* Jumped the party for the Mandalorian ambush on the Unknown World to alleviate pathing issues
* Edited the Kashyyyk Great Walkway walkmesh outside the village gate to prevent the player clipping into the walls
* Jumped the party when entering the Taris Sith Base for the first time
* Overhauled the party jump script, fixed some freezing, and corrected an incorrect listener tag for the Helena conversation in the Tatooine Cantina
* Topped up the health of injured doors in the Taris Black Vulkar Base
* Changed the label on the transition to the Garage in the Taris Black Vulkar Base to the correct one
* Swapped the VO for a line by a Wookiee female in the Kashyyyk Village of Rwookrrorro to better fit the context
* Gave the Rodian bounty hunter in the Taris Lower City cantina the proficiency to use his equipped weapon
* Edited the Taris Sewer door model (TarisDoor5) to make the lower section retract further when open
* Removed any open prestige quests in the Korriban Sith Academy once Uthar takes you to the tomb
* Stopped the tech in the Manaan East Central Republic Embassy from air-typing (at least when facing away from his terminal anyway)
* Prevented Kandon's girlfriend from staring at him when entering the final room of the Taris Black Vulkar Base Garage
* Corrected some facing issues in the post-crash cutscene in the Ebon Hawk when arriving on the Unknown World
* Cured the first herd of Wraid in the Tatooine Dune Sea of their lethargy, making them patrol around
* Edited the UVs of generic Wookiees to fix incorrect mouthbox and tongue textures
* Tweaked the conversation for the gate guard in the Tatooine Sand People Territory to fix facing issues and hide the guard being destroyed
* Started the guard conversation straight away on entering the Tatooine Sand People Enclave for the first time, jumped the party, added clothes when removing disguises
* Changed the party positioning for the conversations with the Chieftain in the Tatooine Sand People Enclave to resolve some facing issues
* Forced set dynamic camera angles for the Sherruk conversation in the Dantooine Grove to prevent the camera ending up in the weeds
* Added some stray journal entries to the list of removals when arriving on the Unknown World
* Tweaked the messenger from Canderous scene in the Taris Upper City South Apartments, herding the party and adjusting the camera angle of the opening shot
* Edited the Trask sacrifice scene on the Endar Spire to hide some of the engine's crimes
* Removed an item duplication exploit after fighting Brejik on the Taris Swoop Platform
* Fixed an off-screen interjection by Carth when speaking to Largo in the Taris Upper City North Apartments
* Plugged some gaps and removed lightmap light bleed in a couple of corners of the entrance area of Manaan West Central
* Fixed a script incorrectly set as a starting conditional in a background NPC's DLG in Manaan East Central
* Tweaked party jump positions in the Tatooine Eastern Dune Sea Star Map scene to resolve facing issues
* Stopped Matrik using the Force to plant his bombs in the Taris Lower City Apartments
* Gave the Duros guards in Davik's Estate on Taris the correct soundset
* Moved a guard droid in the Manaan West Central foyer to stop it clipping into a wall
* Changed the appearances for Firith and Gluupor in the Sunry murder trial in Manaan Ahto West to match their ones in the hotel
* Jumped the party for the scene with the conservationist after leaving the Czerka office in Anchorhead
* Jumped the party when talking to Griff in the Tatooine Czerka office to prevent Mission skating across the floor
* Jumped the party when arriving on Tatooine for the first time and fixed some convo issues with the customs officer
* Adjusted the Bek vs Vulkar cutscene when first entering Taris Lower City to give a Bek some armour, jump the party, and prevent dialogue skipping
* Tweaked a script to prevent the Sith soldiers in the Taris Upper City North Apartments from playing their search animation after turning hostile
* Swapped the soundsets for the Duros survivors on the Unknown World Central Beach to the correct ones
* Prevented a Rodian sitter in Manaan Ahto West from clipping into a table
* Switched the animation used by the surrendering Vulkar in the Taris Black Vulkar Base to something more appropriate
* Forced Uthar in the Korriban Sith Academy to play a transitional animation when standing up
* Prevented the initial scene when entering the puzzle room in the Unknown World Temple Catacombs from playing more than once
* Corrected some starting conditional scripts preventing some ambient NPC barks on Manaan from playing
* Removed Lorgal's corpse in the Manaan East Central Republic Embassy on subsequent module loads
* Cured Kel Algwinn in the Korriban Sith Academy of his tendency to stand up instantly
* Switched the soundset for Matrik in the Taris Lower City Apartments to a Twi'lek male
* Prevented the door to the Sith Master's room in the Unknown World Temple Main Floor from being accessible prematurely
* Created racial variants for the smuggler appearance to match the skin tone of the hands to the head used
* Removed sharp objects from the player during the post-race scenes in the Taris Swoop Platform to prevent injury
* Made Jolee and Juhani wear their unique clothing when they first join the party

### Changes/Updates/Revisions
* Cleaned up changes.ini, removing extraneous editor data and orphaned entries (removed ~2,000 lines)
* Edited readme and info RTFs, altering formatting and adding updated mod contributions
* Merged separate install for a single UTC (filename clash) into the main install
