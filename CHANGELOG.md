# CHANGELOG
## v1.10.0 - TBA
### Additions
* Adjusted the eyelid and mouthbox UVs for the NPC head old_b_m2 to move them from the beard texture
* Prevented the inadvertent removal of the first journal entry of the "Dwindling Supplies" quest on the Ebon Hawk
* Destroyed the moisture vaporators after giving them to the Chieftain in the Tatooine Sand People Enclave to prevent them dropping as loot if the Sand People turn hostile
* Corrected the orientation of the walkmesh for the force cage placeable
* Prevented the cutscene of the party approaching the ruins in the Dantooine Jedi Enclave Courtyard from triggering without Bastila in the party
* Switched a number of plot-related doors in the Leviathan Prison Block to use keys in order to remove the unnecessary Security UI
* Switched the Rancor pen doors in The One's Settlement on the Unknown World to use keys in order to remove the unnecessary Security UI
* Made the Rakatan hologram in the Kashyyyk Lower Shadowlands immortal to prevent it being killed as collateral damage by the guard droids
* Replaced the incorrect Dark Side underwear texture for the male Scoundrel with the Xbox version
* Corrected the texture assignment for the first Rodian appearance
* Plugged some gaps in the walls of the Leviathan Hangar central hallway
* Switched the appearances of a Republic Soldier and Officer in the group arguing with the Sith in Manaan East Central to match their ranks
* Removed the plot flag from the rough-cut Upari amulet gained in the Kashyyyk Lower Shadowlands
* Removed the plot flags from Ajunta Pall's sword and the Naga Sadow ceremonial lightsaber when returning to the Korriban Sith Academy post-final trial
* Prevented the "Invisible Mandalorians" journal entry on the Unknown World being orphaned if the Rakata turned hostile before completing it
* Changed the ambient behaviour of one of Calo Nord's thugs when encountering him in the Korriban Valley of the Dark Lords
* Corrected the starting conditional for reporting back to Hulas in Manaan East Central about Zuulan post-Leviathan
* Adjusted room geometry in the Unknown World Temple Main Floor to prevent light bleed and camera clipping around the Lower Catacombs doorway, plugged gaps in the walls
* Adjusted room geometry in the Unknown World Temple Summit to prevent light bleed, added static doors to empty doorways
* Added some static doors to the end cutscene stunt versions of the Unknown World Temple Summit and exterior
* Repositioned the GWing placeable on the Unknown World Temple Summit to provide more room to access the containers behind it
* Swapped some incorrect soundset assignments for Rakghouls and droids in the Taris Lower and Upper Sewers
* Made the Sith officers in the DS end cutscene in the Unknown World Temple Summit face the right direction and play their correct animations
* Replaced low poly Sith fighter meshes in the Manaan Docking Bay and rebaked the lightmap for their support pillars
* Removed unnecessary Security UI from the Sith hangar door in the Manaan Docking Bay
* Corrected Dark Side transitions for female player head PFHA04
* Corrected Dark Side transitions for female player head PFHC01
* Corrected Dark Side transitions for female player head PFHC03
* Switched the patrolling Sith soldiers in Taris Upper City South to use bark bubbles like those in Upper City North
* Revised some lightmap UVs and rebaked all lightmaps for the Unknown World Temple Summit to address a number of artefacts and add missing shadows
* Added missing DS hits when choosing to kill Largo in the Taris Upper City North Apartments
* Corrected the stunt Revan models so that the cape properly animated during the revelation cutscene
* Added some thickness to the hallway walls in the Unknown World Temple torture cutscene
* Adjusted the scene of the Rakghoul that attacks Hendar in the Taris Undercity to make sure Hendar acts a little quicker
* Stripped the party of Force Speed to prevent them power walking during the cutscene outside The One's compound in Unknown World North Beach
* Ensured that the sound effect for the cell forcefield doors in the Leviathan Prison Block looped correctly and restarted after the doors were closed
* Moved the two lightsaber crystals inside the Krayt cave in the Tatooine Eastern Dune Sea from rubble to the Jedi corpse
* Prevented needing to loot the two crates outside the Czerka office in the Kashyyyk Czerka Landing Port twice in order for their loot to spawn
* Forced the Gizka on the Ebon Hawk to keep clear of the party member spawn points
* Hid any equipped masks and weapons for the initial conversation with Bastila and the post-vision conversation with Carth when first entering the Dantooine Jedi Enclave
* Plugged a gap between the torso and head of Zaalbar's model
* Replaced the empty Sith Apprentice soundset with the Sith Apprentice Male soundset
* Changed the item type of the Rakghoul Serum in the Taris Undercity from Adrenaline to Plot Useable Item as it was in the Xbox version of the game
* Prevented an exploit in the Tatooine Eastern Dune Sea that allowed the player to bypass the Calo Nord and/or Darth Bandon fights
* Prevented an exploit in the Manaan Docking Bay that allowed the player to bypass the exile for tainting the kolto supply
* Made the cutscene of Calo Nord's hunting Rodian bounties in the Taris Lower City Apartments (West) unskippable
* Forced Jolee and Juhani to participate in the fight against the two Dark Jedi outside the Sith Master's room in the Unknown World Temple Main Floor
* Adjusted the timing of the VFX in the cutscene of the Sith Master sparring a droid in the Unknown World Temple Main Floor to sync with the animations and made Jolee and Juhani join the fight
* Tweaked the orientation of the computer panel on the Kashyyyk Great Walkway to align with the walkway edge
* Adjusted the positions of the kolto tanks and computer terminal in the Manaan Hrakert Rift to prevent them floating above the terrain
* Fixed faulty setting of the global for the party being on the Ebon Hawk that was preventing asking Juhani about the current planet
* Corrected the module name check in the starting conditionals for Jolee and Juhani's lines when spoken to inside the Unknown World temple
* Prevented Bastila from using the wrong underwear texture when unequipping certain items
* Shunted the Star Map across to the centerline of the room in the Dantooine Ruins
* Adjusted Affliction and Plague power effects to match their descriptions
* Tweaked some camera angles in the final Carth romance dialogue on the Star Forge for DS female players
* Added a missing starting conditional for a persuade check during conversation with Lurze in Korriban Dreshdae
* Prevented the player being locked out of a Crattis DLG branch in the Dantooine Jedi Enclave by progressing the main plot too quickly
* Corrected the soundsets for various NPCs in the Taris Hidden Bek Base
* Made sure Canderous kept his gear if he was the jail breaker in the Leviathan Prison Block
* Tweaked the scene with the hologram outside the Elder's Compound in Unknown World South Beach to force the party to move as intended
* Jumped the party for the conversation with Jon in the Dantooine Jedi Enclave Courtyard and moved the patrolling Jedi back out of the way
* Removed unnecessary Security UI from the locked doors in the Taris Hidden Bek Base and corrected non-openable control room door
* Jumped the party for the scene of the Sith and Republic troops arguing outside the Hawk's hangar in the Manaan Docking Bay
* Wrangled the party for the scene in the Kashyyyk Czerka Landing Port when Zaalbar is not in the active party
* Jumped any party members out of the player's way for the lightsaber construction scene in the Dantooine Jedi Enclave
* Made sure the party members attacked if the Sith patrol in the Taris Undercity turned hostile
* Corrected off-screen Force persuade animation when dealing with the customs officer in the Tatooine Docking Bay
* Prevented the Mandalorians in the Kashyyyk Lower Shadowlands from dropping duplicate datapads
* Made sure messenger Malare didn't hang around after Bastila was done speaking to her
* Forcibly jumped the party after they dispatched the two Sith on the Bridge of the Endar Spire and closed the door in an added cutscene
* Added missing player level checks to Bastila's romance dialogue scripts to better pace its progression
* Jumped the party for the conversation with the injured Elder Rakata prisoner and fixed a missing sound effect in Unknown World The One's Settlement
* Prevented the security room droid in Manaan Hrakert Station from activating a second shield
* The player's name in message logs was incorrect following the swoop race
* Ensured that Force Persuading Suvam on Yavin Station to give you a Pazaak deck was gated by a starting conditional check
* Added a missing LS gain to Hendar's post-rescue dialogue in the Taris Undercity
* Corrected and expanded the post-Hrakert quest item cleanup when returning to Roland Wann in Manaan East Central
* Prevented a door in Manaan Hrakert Station from closing when Calo or Bandon weren't scheduled to turn up
* Added missing quest update when Force persuading Gluupor in Manaan East Central
* Adjusted the scene with the infected Republic soldier in the Taris Undercity to ensure his animations played correctly and all the Rakghouls attacked
* Wrangled the party for the scenes with Mission in Taris Javyar's Cantina
* Removed the weird camera zoom and herded the party during the cutscene of the first duel in the Taris Upper City Cantina
* Jumped the party for the scene with Janos when landing on Kashyyyk for the first time
* Jumped the party when initiating conversation with Iziz in Tatooine Anchorhead
* Made sure that Tanis in the Tatooine Dune Sea always responded appropriately when spoken to by someone wearing the Sandpeople disguise
* Added a missing persuade starting conditional when convincing Sunry to confess to having an affair with Elassa in Manaan Ahto West
* Destroyed leftover plot items (cell key, passcard, ICE Breaker) after completing the escape from the Leviathan
* Made some facing and camera angle adjustments during the break out scene in the Leviathan Prison Block
* Changed the Leviathan elevator floor selection label "Bridge" to "Command Deck" on both the Prison Block and Command Deck
* Destroyed the slaver contract datapad at the conclusion of the "A Wookiee Lost" quest in Kashyyyk Worrroznor's Home
* Revised the interrogation scenes with the Mandalorian prisoner in the Korriban Sith Academy to improve framing and party positioning
* Edited the alpha blending of one of the transparent Taris window textures to make sure other textures behind it rendered correctly
* Corrected some UV distortion in the floor mesh of the sub bay in Manaan Hrakert Station
* Adjusted render order and fixed pivots of the forcefield beacon poles in Taris Davik's Estate
* Corrected the UVs of the upper left arm of the small class 6 medium female armour model (PFBES) to fix some texture misalignment
* Fixed transparency rendering issues for the windows on the Endar Spire
* Made sure that combat music was turned off after leaving Hendar to his fate in the Taris Undercity
* Prevented The Way of the Sith quest being orphaned if choosing to betray both Uthar and Yuthura in the Korriban Tomb of Naga Sadow
* Ensured plot/quest items are returned to the player post-Leviathan prison break, even if they don't retrieve their former inventory
* Made the Dark Jedi in the Kashyyyk Great Walkway drop the datapad they were carrying and changed it and the Tatooine datapad's name to something more descriptive
* Changed the damage type the steam vents do in the Manaan Sith Base from universal to fire and gave them all the same name in the Feedback panel
* Corrected the PC's facing when opening the door in front of the steam vents in the Manaan Sith Base
* Added higher resolution font textures from Aspyr's TSL patch
* Changed the texture assignment for the glass windscreens of the wrecked speeder placeables
* Wrangled the party when entering the Kashyyyk Village of Rwookrrorro after meeting Chuundar to prevent pathing issues
* Ensured that the decomissioned droid in the Leviathan Command Deck properly rammed into the locked storage door and opened it when commanded to do so
* Corrected the spawn behaviour for Sharina to make sure she appeared in the Dantooine Jedi Enclave if the player gave her the full value of her wraid plate
* Made sure the sealed doors couldn't be sliced during the decompression in Manaan Hraakert Kolto Control
* Tweaked the scene with Canderous in the Taris Undercity to jump the party, adjust some facing and camera angles, and have him leave via an area exit
* Adjusted facing and camera angles in the conversation with Shasa and her friends in the Manaan Sith Base, and made all of them leave at the same time
* Added corrected shadowcasting meshes for the skirt of the female Revan/Star Forge robes model
* Adjusted NPC facing after companion interjections during the conversations with the slaves in Davik's Estate on Taris
* Set the correct listeners for companion interjections during conversation with Motta the Hutt in the Tatooine Swoop Registration
* Jumped the party and moved the waiter out of the way for the conversation with Gana Lavin in the Taris Upper City Cantina
* Added and tweaked unused static camera views when overloading the harvesting machine in Manaan Hrakert Rift
* Prevented the initial Calo/Davik escape scene triggering more than once and ensured combat started afterwards in Taris Davik's Estate
* Gave Calo Nord a stunt animation during his last stand in the hangar of Davik's Estate on Taris to ensure he kept holding his thermal detonator up
* Migrated the ini from TSLPatcher to HoloPatcher to address deficiencies in the former and take advantage of added features in the latter
* Replaced the line where Jolee refers to the player as their "old friend" only when speaking to Davin on Manaan
* Prevented prematurely unlocking access to Jolee's dialogue branches about Sunry
* Moved the movie of Bastila fighting Revan from the swoop platform module transition to between the two conversations when returning to the Taris Upper City Hideout with Bastila
* Added a missing door to the flow control room of the Manaan Sith Base and renamed one of the doors to the adjoining room
* Changed the soundsets of the various Republic soldiers in the Endar Spire Command Module to reduce the number of cloned death cries during cutscenes
* Made Carth face towards the player when they finally meet in the Endar Spire Starboard Section
* Jumped the party for Elora's conversations in Manaan Ahto West to alleviate issues with facing and camera angles
* Adjusted the VO of one of Sunry's lines and corrected the subtitles for another when speaking to him while in jail in Manaan Ahto West
* Jumped the party when speaking to Sunry in jail in Manaan Ahto West to alleviate issues with facing and camera angles
* Adjusted some camera angles and jumped the party for the Republic vs Sith trial in the Manaan Ahto West courtroom, and made the diplomats walk away at the end
* Jumped the party for the individual conversations with the judges in the Manaan Ahto West courtroom, and fixed companion interjections being off-screen
* Tweaked the position of one of the judge's desks in the Manaan Ahto West courtroom to prevent it clipping into the one next to it
* Adjusted the geometry of the Ebon Hawk transition trigger in the Manaan Docking Bay so the notification for it displays correctly when looking directly at it
* Corrected some camera angles, fixed the party and NPC jumps, and adjusted the fade-out/in timings for the post-Sith Base trial of the player in Manaan Ahto West
* Added custom party member starting conditionals for cutscenes that move party members more than 10m away from the player
* Adjusted camera angles, corrected facing, and fixed broken companion interjections during the Sunry murder trial in Manaan Ahto West
* The player being jumped during their arrest outside the Sith Base in Manaan Ahto East was visible in widescreen resolutions, and only a single droid escorted them away
* Changed the appearance for the corpse of Rukil's apprentice in the Taris Undercity to female
* Changed the appearance for the corpse placeables for Rukil's father and grandfather in the Taris Lower Sewers to desiccated remains
* Removed unnecessary Security UI from the forcefield in the Taris Lower Sewers
* Adjusted camera angles and listener tags for companion interjections during conversations in Kashyyyk Woorwill's Home 
* Removed unnecessary Security UI from the loading dock door in the Black Vulkar Base (Lower/Garage) on Taris
* Plugged some gaps in the walkmesh which allowed enemies to aggro through walls in the Black Vulkar Base (Lower/Garage) on Taris
* Prevented the mechanics in the Taris Black Vulkar Base (Lower/Garage) from attacking with their fists
* Jumped the party and adjusted camera angles for the scene with Patrol Captain Dehno and the dead Wookiee in the Kashyyyk Great Walkway
* Jumped the party for the scene with Zaalbar talking about his family in the Kashyyyk Great Walkway
* Corrected facing issues for party member interjections when talking to Jolee outside his hut in Kashyyyk Upper Shadowlands
* Changed camera angles, facing, and scripted actions in the finale cutscene of the Sandral-Matale feud in the Dantooine Sandral Grounds
* Removed unnecessary Security UI from the village main gate in the Taris Undercity
* Removed unnecessary Security UI from Zaalbar's jail door in the Taris Lower Sewers
* Jumped the party, had them follow when showing the journals to Gendar, and herded ambient NPCs out of the way for conversations with Rukil in the Taris Undercity
* Prevented the party accidentally (or on purpose) escaping into the Hawk when fighting Xor in one of the docking bay modules
* Adjusted the position and rotation of one of the footlocker placeables in the sub bay of Manaan Hrakert Station that was sticking out into the middle of a walkway
* Tried to ensure both of Malak's Jedi captives on the Star Forge Deck 3/Command Center played the appropriate animation, and prevented the player freezing at the end of the scene
* Adjusted facing, camera angles, animations, and prevented the party running into each other for the Light Side ending escape sequence on the Star Forge Deck 1
* Made the Sith Master face Malak at the start of the second cutscene about the invading Jedi in the Star Forge Deck 2
* Adjusted party herding, camera angles, and facing for companion interjections in the scene with the Sith Master and his Selkath apprentices in the Manaan Sith Base
* Prevented an invisible placeable's name showing up in the Feedback panel after the comm messages from Canderous in the Leviathan Prison Block and Hangar
* Made sure the shot length of Bastila and Carth being tortured because of a defiant PC in the Leviathan Prison Block matched the animations
* Adjusted facing, animation timings, and started the cell forcefield closed during Jolee's scene when he is the jail breaker in the Leviathan Prison Block
* Corrected facing, adjusted camera angles, and wrangled party for scene of Shaardan terrorising students in Korriban Dreshdae
* Jumped the party and herded ambient NPCs out of the way for conversations with Gendar in the Taris Undercity
* Made the Republic soldier killed by the exploding barrel on the Endar Spire Command Module die immediately
* Adjusted and locked the facing of the judges and the player, positioned the party appropriately, and adjusted camera angles during the post-Hrakert Rift trial in Manaan Ahto West
* Corrected the deactivate SFX for the Star Map placeable declared in the placeable sounds 2DA
* Ensured that the Star Map in Manaan Hrakert Rift ran the appropriate animation and then closed afterwards to match the other maps
* Jumped the party into a better position for the scene with the Duros conservationist in the Tatooine Czerka Office
* Fixed distorted UVs for the bridge lights in the Dantooine Grove and Sandral Grounds
* Tweaked the Star Map sequence in the Korriban Tomb of Naga Sadow to utilise the animation changes made for the scenes on other planets
* Removed the quest update pop-up between the Star Map sequence and the conversation with Jolee in the Kashyyyk Lower Shadowlands
* Prevented Zaalbar skating along the ground and adjusted camera angles for the conversation with the Wookiee village gate guard in Kashyyyk Great Walkway
* Jumped the party for the scene when entering the Kashyyyk Czerka Landing Port for the first time with Zaalbar present
* Wrangled the party and tweaked timings/animations for the post-Hrakert Rift arrest scene outside the Republic embassy in Manaan East Central

### Changes/Updates/Revisions
* Revised the function order for the script that triggers the Star Map cutscene in the Dantooine Ruins to (hopefully) prevent a potential sequence break
* Revised the pre-Leviathan scene on the Ebon Hawk to properly hide Carth's equipped mask
* Adjusted the trigger script for the Saul showdown cutscene on the Leviathan Bridge to strip Force Speed from Bastila and the player
* Prevented Zaedra playing her ambient animations in the background while speaking to Gadon in the Taris Hidden Bek Base
* Corrected the config for the torture scene in the Leviathan Prison Block to properly assign static cameras on nodes where they were missing
* Revised the conversation for the rep in the Tatooine Czerka Office to finally prevent her line being spoken off-screen when Force Persuaded (for real this time)
* Herded the party for the conversation with the rep in the Tatooine Czerka Office to ensure correct static camera framing
* Tweaked party member facings and hid masks/weapons for the Griff and Greeta conversions in the Tatooine Czerka Office
* Added additional party jump for Matrik convos in the Taris Lower City Apartments (East) when wearing a Sith disguise to prevent an endless black screen
* Corrected some additional offscreen party member interjections in the convo with Matton in the Kashyyyk Czerka Landing Port
* Revised Jolee's joining script in Kashyyyk Upper Shadowlands to improve visual consistency and jumped party for his conversation
* Addressed player's facing after one of Bastila's interjections during the first meeting with the Council in the Dantooine Jedi Enclave
* Corrected post-Leviathan scene Carth romance checks
* Removed the ported TSL blue male Twi'lek appearance and reverted the sole use of it in the Taris Lower City Javyar's Cantina back to vanilla green
* Replaced the higher resolution N_CommF07/M07 textures with the correct versions (renamed N_CommFD01/MD01)
* Made some further tweaks to the intro of the cutscene of the Sith Master in the Unknown World Temple Main Floor
* Fixed an additional HK line when talking to the Storyteller in the Tatooine Sandpeople Enclave
* Renamed and converted two MP3s to proper KOTOR VO format (fake WAV header)
* Appended ExclusiveColumn flags to all added 2DA rows to prevent duplicates
* Moved some loose LIP files from the Override to Lips folder MOD injection
* Adjusted the appearance of Calo Nord's thugs in Manaan Hrakert Rift to reduce clone NPCs
* Switched both of Gana Lavin's appearances on Taris to the Asian Commoner that she used in Upper City South to prevent a clone issue with Sarna in the Upper City Cantina
* Added hiding of equipped masks and weapons during the conversation with Griff in the Tatooine Sand People Enclave
* Streamlined the disguise stripping function used in the Tatooine Sand People Enclave, since it could potentially lead to crashes
* Made sure the player couldn't skip through the "Attack them all" dialogue in the Tatooine Sand People Enclave, which would reveal the party's disguises being stripped
* Tweaked the scene in the Kashyyyk Great Walkway when Zaalbar is not in the active party
* Made sure that the Hidden Bek door guard in Taris Lower City also reoriented after conversation
* Switched Vandar's dialogue edits in the Dantooine Jedi Enclave to a straight DLG replace rather than patching to streamline the install process
* Corrected the head assignment for the added appearance fat commoner white male 03
* Moved relocated Jedi loot (originally from Hrakert Station) to the Sith Master's personal footlocker in the Manaan Sith Base
* Revised previous duplicate pass card fix in the Black Vulkar Base (Upper) to make it simpler and actually install it properly
* Further tweaked the scene when entering the Unknown World North Beach for the first time to keep the Rancors from wandering off
* Made some further facing tweaks to the scene with Gurney in the Taris Upper City South medical clinic
* Corrected a mistake in the Tatooine include function that failed to properly set the global for wearing the Sandpeople disguise, merged vanilla functions into scripts requiring them
* Fixed broken walkmeshes in edited Ebon Hawk room models that were causing rendering issues for some players
* Changed some older DLG edits from Override dumps to module injection
* Reverted the unintentional spawning of a duplicate stunt Canderous when he wasn't the chosen jail breaker on the Leviathan
* Made some further tweaks to the torture scene in the Leviathan Prison Block to address facing, camera angles, and the scene transition fade-out/in
* Plugged another hole in the Ebon Hawk mesh in the Leviathan Hangar Bay
* Added back a missing PlotIndex adjustment that somehow got lost from an earlier fix to Motta the Hutt's dialogue in the Tatooine Swoop Registration
* Corrected broken config block for the Gamorrean ambush recording speaker
* Updated scene with the receptionist in the Manaan Sith Base to make sure she faced in the right directions as intended and make party members attack when combat started
* Further tweaks of the central room of Yavin Station to fix some lightmapping issues around the walkway window frame
* Condensed a script hijack for the scientists in Manaan Hraakert Kolto Control down to a single vanilla replacement
* Further adjusted some facing, camera angles, and player positioning during the confrontation with the scientists in Manaan Hraakert Kolto Control
* Added some camera angle tweaks to the Sith standing in the doorway in the interrogation scene in the Taris Upper City North Apartments
* Tweaked post-battle scene with Bastila in the Taris Swoop Platform to make the player watch if Bastila loots it
* Removed a missing starting conditional script that was gating off most of Jolee's branch with Elora in Manaan Ahto West
* Made some further party herding and facing tweaks to the final post-battle scene with Xor
* Fixed some ropey shading around the eye sockets of the Asian male head, added fixed versions of the two texture variant models
* Applied eye socket shading adjustment to previously edited female commoner heads
* Added the missing templates that were preventing added triggers spawning in Korriban Dreshdae
* Changed the removal of the Dark Jedi corpse and its loot in Manaan Hrakert Station to a less intrusive implementation, refactoring the GIT's creature and placeable lists
* Revised the adjustments to the scene with Lashowe in Korriban Valley of the Dark Lords, including making her properly loot the holocron from the Mother's corpse as per developer intent
* Ensured that the initial triggered conversation with Nilko Bwaas in Manaan Ahto West was synced correctly with the fade-in
* Added an extra failsafe animation to try and prevent Bastila freezing after the conversation with her messenger Malare
* Disarmed stunt Canderous when he wasn't the chosen jail breaker in the Leviathan Prison Block
* Changed the camera angles for the brief scene when Bastila finds her father's holocron in the Krayt cave in the Tatooine Eastern Dune Sea
* Further adjusted the camera angles in Jolee's messenger conversation with Davin
* Tweaked Hendar's post-fight actions to cancel him out of combat if he survives the Rakghoul in the Taris Undercity
* Streamlined Tatooine OnEnters by pushing functions out to the include, made further revisions to the Sand People disguise fix to hopefully prevent it from failing to fire
* Prevented a player freeze and jumped the party to prevent companion pathing issues during the Murder Mystery quest in the Dantooine Grove
* Made further changes to the scene with the surrendering Vulkar in the Taris Black Vulkar Base (Upper) to prevent the camera clipping inside him when the player was too close
* Corrected alterations to the scene for the Star Map in the Tatooine Eastern Dune Sea that were causing the animation for the final map to glitch out
* Corrected alterations to the scene for the Star Map in the Kashyyyk Lower Shadowlands that were causing the animation for the final map to glitch out
* Tweaked the interrupted date night scene in Taris Davik's Estate to make sure the slave girl could be seen running out
* Prevented Zaedra freezing on the switch to Gadon and better masked the party setup during the first scene in the Taris Hidden Bek Base
* Changed camera angles when Griff switches between Mission and the player in the Tatooine Czerka Office
* Adjusted the party jump for the Dantooine Ruins Star Map cutscene to match the map's new position in the centerline of the room
* Extended the stealth belt check fix to the entrance trigger that has a war droid fire a random barkstring in the Korriban Tomb of Marka Ragnos
* Prevented duplicate Xor combat encounters spawning on multiple planets due to triggering him without Juhani present
* Corrected some additional camera angle, listener, and facing issues during the Murder Mystery quest in the Dantooine Grove
* Prevented Griff's spawn-in being visible to the player in the Tatooine Czerka Office
* Tweaked the jump when arriving in the Tatooine Docking Bay for the first time to make sure party members did as they were told
* Attempted to prevent Jolee and Juhani's AI from deactivating during the final fight if siding with Bastila on the Unknown World Temple Summit
* Enabled the branch with Canderous and Juhani having a back and forth in the scene when entering the Kashyyyk Czerka Landing Port for the first time without Zaalbar
* Adjusted the conversation when returning to Kandon in the Taris Black Vulkar Base to trigger as soon as the party enters
* Tweaked pre-swoop race scene when siding with the Vulkars to correct player orientation in the Taris Black Vulkar Base

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
* Addressed a number of problems with Eli and Matton in the Kashyyyk Czerka Landing Port, including a potential soft-lock, duplicate outfits, a missing DLG line, and lack of continuance between some scenes
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
* Added some backfaces to various pipes in the Taris Black Vulkar Base to prevent culling issues
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
* Cleaned up the party's positioning during the player's arrest outside the Sith Base in Manaan Ahto East
* Changed the variant of the war droids used by Selkath security during the player's arrest outside the Sith Base in Manaan Ahto East to differentiate them from the Sith droids
* Delayed the spawn-in of a replacement Sith war droid outside the Sith Base in Manaan Ahto East until after the player's trial
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
* Corrected starting conditional for having the Sith Base passcard when talking to the interrogator in the Republic base in Manaan East Central
* Herded party, prevented NPCs running into each other, and forced entry direction during the post-ending cutscenes in the Kashyyyk Czerka Landing Port
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
* Corrected the head assignment for the added appearance fat commoner white male 03

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
* Raised the height of the invisible placeable for the Garage Head's desk in the Vulkar Base
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
* Fixed some bad lightmaping on the walls of the Vulkar Base's lower level
* Forced some mooks in the Vulkar Base to equip their stored weapons to prevent unarmed attacks
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
* Made a transformer in the Sith Base on Taris non-interactable
* Removed an infinite DS point exploit from the Sasha encounter
* Removed an infinite DS point exploit from Roland Wann post-Hrakert Rift
* Added a check to remove the Czerka miners in the Dune Sea once they have been talked to and the Sandpeople enclave is done
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
* Switched some Sith Elite Troopers in Manaan Docking Bay to the proper appearances
* Moved some troopers in the Manaan Sith Base so they would see the party entering the room properly
* Made a host of edits to the stunt animations for the LS ending cutscene to improve it for widescreen resolutions
* Tweaked the initial scene when boarding the Star Forge to account for widescreen framing
* Forced the party to turn around before the droids burst in on Deck 1 of the Star Forge
* Changed listener tags in Thalia May's DLG in the Korriban Shyrack Caves to prevent her turning her back on the party
* Fixed global generic droid templates to use the proper soundsets for their type instead of the Bantha soundset
* Fixed an off-screen line by the Mysterious Man on Manaan and prevented him being visible after the conversation finished
* Remapped distorted UVs for a section of cliff edge in Korriban's Valley of the Dark Lords
* Swapped incorrect script reference in Korriban Sith Academy duel scene causing endless combat music
* Gave Saul Karath an on-screen death on the bridge of the Leviathan and stopped Carth talking over his death cry
* Made changes to the exploding pillar scene in the Tomb of Ajunta Pall on Korriban to prevent AI and UI issues
* Jumped the party for Yuthura's conversation in the Dreshdae cantina and forced companions to face her on their interjections
* Edited Dustil's conversation in the Korriban Sith Academy to jump the party and fix some facing issues with Carth and the player
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
* Wrangled the party for the first conversation with Yuthura inside the Korriban Sith Academy
* Resolved some issues trying to give a datapad to Adrenas in the Korriban Sith Academy
* Added some listener tags to Uthar's DLG in the Korriban Sith Academy to prevent facing issues during the Shaardan handing in a fake sword cutscene
* Checked for (and removed) Shaardan's corpse in the pre-final trial conversation with Uthar in the Korriban Sith Academy
* Edited Uthar's conversation in the Korriban Sith Academy to remove the salute, swap the party leaving for a fade-out, and change the running for the back door to a walk
* Moved the party out of the way during Uthar's introductory cutscene in the Korriban Sith Academy and stopped him bowing to the students
* Jumped wandering NPCs in the Korriban Sith Academy to the edge of the room whenever a conversation with Uthar commences
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
* Prevented re-entering the Vulkar Base on Taris post-swoop race (and the Bek base if Gadon is dead)
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
