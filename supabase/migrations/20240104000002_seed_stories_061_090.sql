-- ============================================================================
-- INKBOUND — SEED STORIES 061 TO 090
-- Part of the 120 Complete Connected Story Database with Dynamic Wording
-- ============================================================================

-- ----------------------------------------------------------------------------
-- CASE: STORY_061 — THE GHOST SHIP OF BLACK COVE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_061',
  'The Ghost Ship of Black Cove',
  'Supernatural',
  'Black Cove Harbor, rocky sea cliffs, thick ocean mist, and the wooden deck of the Mary Celeste II',
  'A three-masted wooden sailing galleon drifted into the harbor with sails set and a steaming hot cup of tea on the captain’s table, but zero living souls aboard.',
  '[{"name":"Thomas Drake","role":"First Mate & Sole Survivor","alibi":"Claims he barely escaped by leaping into a wooden rowboat","avatar":"⚓"},{"name":"Captain Robert Shaw (Deceased)","role":"Late Galleon Master","alibi":"Missing at sea","avatar":"🧭"},{"name":"Nora Higgins","role":"Harbor Board Inspector","alibi":"At the harbor customs office inspecting night arrivals","avatar":"📋"},{"name":"Detective Marcus Vance","role":"Maritime Crimes Specialist","alibi":"Dispatched to the harbor following the ghost ship alert","avatar":"🔍"}]'::jsonb,
  'First Mate Thomas Drake poisoned the crew with hemlock during evening mess and threw their bodies overboard. To create the illusion of a supernatural vanishing, he placed an exothermic chemical heating pouch beneath the ceramic teacup so it would steam for hours, while he slipped ashore with thirty pounds of raw emeralds.',
  'First Mate Thomas Drake',
  'Thomas murdered the captain and crew to steal a shipment of raw Spanish emeralds, staging a ghost ship to escape.',
  '[{"time":"06:00 PM","event":"Thomas stirs crushed water hemlock seeds into the evening galley stew."},{"time":"07:30 PM","event":"Captain Shaw and five sailors collapse into fatal convulsions and are tossed overboard."},{"time":"11:00 PM","event":"Thomas activates an iron-powder chemical heating pad beneath the captain’s ceramic teacup."},{"time":"11:30 PM","event":"Thomas slips into a small wooden skiff with the emeralds and rows to Black Cove beach."},{"time":"03:00 AM","event":"The galleon drifts into the harbor dock; inspectors discover the steaming tea."}]'::jsonb,
  '[{"id":"ev1","title":"Exothermic Heat Pack Beneath Saucer","detail":"Explains the steaming teacup without requiring supernatural presence on board."},{"id":"ev2","title":"Hemlock Seed Packet Behind Galley Stove","detail":"Matches the cicutoxin poison detected in the crew’s iron stew cauldron."},{"id":"ev3","title":"Mary Celeste II Rowboat at Black Cove","detail":"Proves Thomas Drake rowed ashore alone after casting the crew overboard."},{"id":"ev4","title":"30-Pound Raw Emerald Chest","detail":"Discovered buried beneath Thomas’s boathouse, establishing the motive for mass murder."}]'::jsonb,
  '[{"order":1,"title":"Steaming Teacup","text":"Ceramic cup emitting hot steam on a ghost ship with no living crew."},{"order":2,"title":"Chemical Heat Pack","text":"Flameless military heater used to keep the tea boiling for hours."},{"order":3,"title":"Poisoned Cauldron","text":"Galley cook pot laced with lethal water hemlock seeds."},{"order":4,"title":"Hemlock Seed Packet","text":"Botanical poison container dropped behind the ship’s stove."},{"order":5,"title":"Abandoned Rowboat","text":"Vessel skiff used by the first mate to escape to the beach."},{"order":6,"title":"Emerald Treasure Chest","text":"Thirty pounds of uncut green gems stolen from the captain’s cabin."}]'::jsonb,
  'The ship’s compass spun erratically.: Caused by iron ore deposits in Black Cove sea cliffs, not a Bermuda Triangle vortex.; Inspector Nora was nervous about missing paperwork.: Bureaucratic anxiety, but she had no role in the maritime massacre.',
  'Claim the ship sailed through the Bermuda Triangle or blame the harbor master.',
  'NORMAL',
  'What happened to the seven crew members and how did a cup of tea remain steaming hot?',
  '[{"character":"Thomas Drake","secret":"He has thirty pounds of uncut Colombian emeralds buried beneath the boathouse floor."},{"character":"Captain Robert Shaw (Deceased)","secret":"He was transporting a secret diplomatic treasure of raw emeralds to Boston."},{"character":"Nora Higgins","secret":"She was auditing the harbor manifests for unregistered cargo shipments."},{"character":"Detective Marcus Vance","secret":"Served as an officer in the naval coast guard for a decade."}]'::jsonb,
  '[{"lead":"The ship’s compass spun erratically.","explanation":"Caused by iron ore deposits in Black Cove sea cliffs, not a Bermuda Triangle vortex."},{"lead":"Inspector Nora was nervous about missing paperwork.","explanation":"Bureaucratic anxiety, but she had no role in the maritime massacre."}]'::jsonb,
  '{"wrongTheories":["The ship sailed through an ocean wormhole that dissolved the crew into the spirit world.","A mythical sea kraken plucked the seven crew members from the deck at midnight."],"correctTheory":"First Mate Thomas Drake poisoned the captain and crew with hemlock stew, threw their bodies overboard, used a chemical heat pack beneath a teacup to stage a supernatural ghost ship, and rowed ashore with thirty pounds of stolen emeralds."}'::jsonb,
  'First Mate Thomas Drake poisoned the crew and faked the steaming tea for emeralds!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Vance unearthed the emerald chest and matched the hemlock seeds to Thomas’s pockets. Thomas Drake was convicted of piracy and six counts of murder on the high seas."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The maritime court ruled the crew vanished due to an act of God. Thomas Drake claimed salvage rights, sold the emeralds in London, and retired in luxury."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Steaming Ghost of Black Cove\" became an international maritime myth. Thomas charged tourist boats to view the cursed vessel."}]'::jsonb,
  '{"intros":["A three-masted wooden sailing galleon drifted into the harbor with sails set and a steaming hot cup of tea on the captain’s table, but zero living souls aboard.","Case file story_061: A three-masted wooden sailing galleon drifted into the harbor with sails set and a steaming hot cup of tea on the captain’s table, but zero living souls aboard. Look closely at every clue.","Trouble begins in Black Cove Harbor, rocky sea cliffs, thick ocean mist, and the wooden deck of the Mary Celeste II. A three-masted wooden sailing galleon drifted into the harbor with sails set and a steaming hot cup of tea on the captain’s table, but zero living souls aboard.","The mystery starts now. A three-masted wooden sailing galleon drifted into the harbor with sails set and a steaming hot cup of tea on the captain’s table, but zero living souls aboard. Can you solve it?"],"reveals":["First Mate Thomas Drake poisoned the crew and faked the steaming tea for emeralds!","The mystery is unraveled! First Mate Thomas Drake poisoned the crew and faked the steaming tea for emeralds!","At last, the truth comes out: First Mate Thomas Drake poisoned the crew and faked the steaming tea for emeralds!","Case resolved! Here is what happened: First Mate Thomas Drake poisoned the crew and faked the steaming tea for emeralds!"],"hints":["Pay attention to where First Mate Thomas Drake was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_061';
DELETE FROM public.case_events WHERE case_id = 'story_061';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a90df3c3-3f60-5e70-a018-bd477094a015',
  'story_061',
  'Thomas Drake',
  'First Mate & Sole Survivor',
  'Weathered sailor, hardened eyes, smelling of salt spray and pipe tobacco',
  'A black fog swallowed the ship at midnight. The crew vanished into the mist before my eyes.',
  'He has thirty pounds of uncut Colombian emeralds buried beneath the boathouse floor.',
  'Claims he barely escaped by leaping into a wooden rowboat',
  'Second-in-command of the sailing vessel Mary Celeste II',
  'The chemical heating pouch maintains boiling heat for six hours.',
  'Did not know he dropped an empty packet of hemlock seeds behind the galley stove.',
  '⚓',
  '["A black fog swallowed the ship at midnight. The crew vanished into the mist before my eyes.","\"A black fog swallowed the ship at midnight. The crew vanished into the mist before my eyes.\"","Listen to me: A black fog swallowed the ship at midnight. The crew vanished into the mist before my eyes.","I tell you the truth: A black fog swallowed the ship at midnight. The crew vanished into the mist before my eyes."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '44389351-351d-53ff-97a5-49c716f737b5',
  'story_061',
  'Captain Robert Shaw (Deceased)',
  'Late Galleon Master',
  'Veteran sea captain, honorable, missing beneath the Atlantic waves',
  'Deceased victim; logbook ends mid-sentence with: "Unusual sweet aroma in the stew."',
  'He was transporting a secret diplomatic treasure of raw emeralds to Boston.',
  'Missing at sea',
  'Master of the vessel Mary Celeste II',
  'The emeralds were locked in his brass chronometer chest.',
  'Did not suspect his trusted first mate would poison the crew’s dinner.',
  '🧭',
  '["Deceased victim; logbook ends mid-sentence with: \"Unusual sweet aroma in the stew.\"","\"Deceased victim; logbook ends mid-sentence with: \"Unusual sweet aroma in the stew.\"\"","Listen to me: Deceased victim; logbook ends mid-sentence with: \"Unusual sweet aroma in the stew.\"","I tell you the truth: Deceased victim; logbook ends mid-sentence with: \"Unusual sweet aroma in the stew.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3a15c445-de6a-5369-ba53-4bb0636c2049',
  'story_061',
  'Nora Higgins',
  'Harbor Board Inspector',
  'Sharp, skeptical, wearing an oilskin coat and holding a brass lantern',
  'Tea does not stay boiling hot for three days at sea. Someone was on this ship less than one hour ago.',
  'She was auditing the harbor manifests for unregistered cargo shipments.',
  'At the harbor customs office inspecting night arrivals',
  'First official to board the drifting ghost galleon',
  'The galley stove was completely cold despite the steaming cup.',
  'Did not understand the exothermic chemical trick beneath the saucer.',
  '📋',
  '["Tea does not stay boiling hot for three days at sea. Someone was on this ship less than one hour ago.","\"Tea does not stay boiling hot for three days at sea. Someone was on this ship less than one hour ago.\"","Listen to me: Tea does not stay boiling hot for three days at sea. Someone was on this ship less than one hour ago.","I tell you the truth: Tea does not stay boiling hot for three days at sea. Someone was on this ship less than one hour ago."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ef44a51d-f060-5ff8-b837-9f8721ca7bd4',
  'story_061',
  'Detective Marcus Vance',
  'Maritime Crimes Specialist',
  'Analytical, observant, carries chemical testing reagents and calipers',
  'Supernatural ghost ships do not leave military-grade iron-oxide heating packs in the dining salon.',
  'Served as an officer in the naval coast guard for a decade.',
  'Dispatched to the harbor following the ghost ship alert',
  'Leading the investigation into the missing crew',
  'Found water hemlock plant toxin residue in the galley iron cooking cauldron.',
  'Did not immediately locate where the emerald chest was buried.',
  '🔍',
  '["Supernatural ghost ships do not leave military-grade iron-oxide heating packs in the dining salon.","\"Supernatural ghost ships do not leave military-grade iron-oxide heating packs in the dining salon.\"","Listen to me: Supernatural ghost ships do not leave military-grade iron-oxide heating packs in the dining salon.","I tell you the truth: Supernatural ghost ships do not leave military-grade iron-oxide heating packs in the dining salon."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd0230e75-640e-53fd-a602-1d3f644b4bd1',
  'story_061',
  'ev_1',
  1,
  '03:00 AM',
  'A steaming cup of black tea sits on the mahogany captain’s table, giving off visible white vapor.',
  'A steaming cup of black tea sits on the mahogany captain’s table, giving off visible white vapor.',
  'The tea was kept boiling by a chemical heating pad hidden beneath the wooden saucer.',
  'Steaming Teacup',
  'Ceramic teacup resting on a wooden saucer with an active exothermic heat pack below.',
  '["Coffee Mug","Wine Glass","Water Goblet"]'::jsonb,
  'Steaming Teacup',
  '["steaming teacup","teacup","cup","tea","steaming cup"]'::jsonb,
  'A small porcelain cup holding hot drinking liquid that releases white steam into the air.',
  'ev_2',
  true,
  '{"descriptions":["A steaming cup of black tea sits on the mahogany captain’s table, giving off visible white vapor.","At 03:00 AM: A steaming cup of black tea sits on the mahogany captain’s table, giving off visible white vapor.","Notice this clue: A steaming cup of black tea sits on the mahogany captain’s table, giving off visible white vapor."],"hints":["A small porcelain cup holding hot drinking liquid that releases white steam into the air.","Clue hint: Think about steaming teacup.","Search for: the tea was kept boiling by a chemical heating pad hidden beneath the wooden saucer."],"clues":["Steaming Teacup","Item: Steaming Teacup","Clue Word: Steaming Teacup"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '292f5abb-283c-5cfc-942b-fcf650ffdb12',
  'story_061',
  'ev_2',
  2,
  '03:05 AM',
  'A military-grade flameless chemical heating pad filled with iron powder sits under the saucer.',
  'A military-grade flameless chemical heating pad filled with iron powder sits under the saucer.',
  'Water reacting with iron and salt generates steady heat for six hours without flame.',
  'Chemical Heat Pack',
  'Foil packet containing iron powder, magnesium, and salt crystals.',
  '["Candle Stub","Hot Coal","Electric Coil"]'::jsonb,
  'Chemical Heat Pack',
  '["chemical heat pack","heat pack","chemical pack","heater","heating pad"]'::jsonb,
  'A flexible pouch that gets steaming hot when mixed with a few drops of water.',
  'ev_3',
  false,
  '{"descriptions":["A military-grade flameless chemical heating pad filled with iron powder sits under the saucer.","At 03:05 AM: A military-grade flameless chemical heating pad filled with iron powder sits under the saucer.","Notice this clue: A military-grade flameless chemical heating pad filled with iron powder sits under the saucer."],"hints":["A flexible pouch that gets steaming hot when mixed with a few drops of water.","Clue hint: Think about chemical heat pack.","Search for: water reacting with iron and salt generates steady heat for six hours without flame."],"clues":["Chemical Heat Pack","Item: Chemical Heat Pack","Clue Word: Chemical Heat Pack"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c75c0302-6af1-5fb5-8797-bb0d883fe1b5',
  'story_061',
  'ev_3',
  3,
  '03:10 AM',
  'An iron stew cauldron in the galley smells of burnt meat and wild water hemlock.',
  'An iron stew cauldron in the galley smells of burnt meat and wild water hemlock.',
  'The entire crew was poisoned during their shared evening meal.',
  'Poisoned Cauldron',
  'Cast-iron cook pot containing stew residue with fatal cicutoxin plant alkaloids.',
  '["Frying Pan","Kettle","Baking Dish"]'::jsonb,
  'Poisoned Cauldron',
  '["poisoned cauldron","cauldron","stew pot","pot"]'::jsonb,
  'A heavy black iron pot used on ships and campfires to cook stew or soup.',
  'ev_4',
  false,
  '{"descriptions":["An iron stew cauldron in the galley smells of burnt meat and wild water hemlock.","At 03:10 AM: An iron stew cauldron in the galley smells of burnt meat and wild water hemlock.","Notice this clue: An iron stew cauldron in the galley smells of burnt meat and wild water hemlock."],"hints":["A heavy black iron pot used on ships and campfires to cook stew or soup.","Clue hint: Think about poisoned cauldron.","Search for: the entire crew was poisoned during their shared evening meal."],"clues":["Poisoned Cauldron","Item: Poisoned Cauldron","Clue Word: Poisoned Cauldron"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e1c3d5ec-725f-5bf8-a0ad-98a7b5d1f82f',
  'story_061',
  'ev_4',
  4,
  '03:20 AM',
  'A crushed seed packet labeled "Conium / Cicuta - Dried Seeds" is behind the galley stove.',
  'A crushed seed packet labeled "Conium / Cicuta - Dried Seeds" is behind the galley stove.',
  'The first mate carried lethal water hemlock seeds to poison the ship.',
  'Hemlock Seed Packet',
  'Waxed paper envelope holding crushed poisonous botanical seeds.',
  '["Tobacco Pouch","Tea Leaves","Spice Bag"]'::jsonb,
  'Hemlock Seed Packet',
  '["hemlock seed packet","hemlock","seed packet","seeds","poison packet"]'::jsonb,
  'A small paper bag containing deadly seeds from a poisonous wild plant.',
  'ev_5',
  false,
  '{"descriptions":["A crushed seed packet labeled \"Conium / Cicuta - Dried Seeds\" is behind the galley stove.","At 03:20 AM: A crushed seed packet labeled \"Conium / Cicuta - Dried Seeds\" is behind the galley stove.","Notice this clue: A crushed seed packet labeled \"Conium / Cicuta - Dried Seeds\" is behind the galley stove."],"hints":["A small paper bag containing deadly seeds from a poisonous wild plant.","Clue hint: Think about hemlock seed packet.","Search for: the first mate carried lethal water hemlock seeds to poison the ship."],"clues":["Hemlock Seed Packet","Item: Hemlock Seed Packet","Clue Word: Hemlock Seed Packet"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '630137a4-875d-5657-8efc-250141f8d2ef',
  'story_061',
  'ev_5',
  5,
  '03:45 AM',
  'The ship’s official logbook lies open with the captain’s pen resting in wet ink.',
  'The ship’s official logbook lies open with the captain’s pen resting in wet ink.',
  'The captain was interrupted mid-sentence as the poison took effect.',
  'Captain Logbook',
  'Leather journal ending abruptly with an ink smear at 7:15 PM.',
  '["Bible","Map","Receipt Book"]'::jsonb,
  'Captain Logbook',
  '["captain logbook","logbook","log","captain log","journal"]'::jsonb,
  'A bound book where ship captains record daily navigation, weather, and crew notes.',
  'ev_6',
  true,
  '{"descriptions":["The ship’s official logbook lies open with the captain’s pen resting in wet ink.","At 03:45 AM: The ship’s official logbook lies open with the captain’s pen resting in wet ink.","Notice this clue: The ship’s official logbook lies open with the captain’s pen resting in wet ink."],"hints":["A bound book where ship captains record daily navigation, weather, and crew notes.","Clue hint: Think about captain logbook.","Search for: the captain was interrupted mid-sentence as the poison took effect."],"clues":["Captain Logbook","Item: Captain Logbook","Clue Word: Captain Logbook"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ec262dad-1549-5632-91cb-8c0bc24a529d',
  'story_061',
  'ev_6',
  6,
  '04:15 AM',
  'A wooden rowboat skiff with fresh oar marks is dragged ashore at Black Cove beach.',
  'A wooden rowboat skiff with fresh oar marks is dragged ashore at Black Cove beach.',
  'Thomas used the skiff to row ashore under cover of the ocean fog.',
  'Abandoned Rowboat',
  'Wooden dory boat with Mary Celeste II nameplate and wet oars.',
  '["Life Raft","Canoe","Sailboat"]'::jsonb,
  'Abandoned Rowboat',
  '["abandoned rowboat","rowboat","skiff","boat","dory"]'::jsonb,
  'A small wooden boat moved through water by pulling two wooden oars.',
  'ev_7',
  false,
  '{"descriptions":["A wooden rowboat skiff with fresh oar marks is dragged ashore at Black Cove beach.","At 04:15 AM: A wooden rowboat skiff with fresh oar marks is dragged ashore at Black Cove beach.","Notice this clue: A wooden rowboat skiff with fresh oar marks is dragged ashore at Black Cove beach."],"hints":["A small wooden boat moved through water by pulling two wooden oars.","Clue hint: Think about abandoned rowboat.","Search for: thomas used the skiff to row ashore under cover of the ocean fog."],"clues":["Abandoned Rowboat","Item: Abandoned Rowboat","Clue Word: Abandoned Rowboat"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '65f4aef4-a05c-5910-b943-bf5d840e4ab5',
  'story_061',
  'ev_7',
  7,
  '04:45 AM',
  'Thirty pounds of rough green Colombian emeralds are buried in an iron chest under the boathouse.',
  'Thirty pounds of rough green Colombian emeralds are buried in an iron chest under the boathouse.',
  'The multi-million-dollar cargo stolen by the first mate.',
  'Emerald Treasure Chest',
  'Brass-reinforced wooden chest filled with uncut sparkling green gemstones.',
  '["Gold Coins","Silver Bars","Pearl Necklace"]'::jsonb,
  'Emerald Treasure Chest',
  '["emerald treasure chest","chest","emeralds","emerald chest","treasure chest","gems"]'::jsonb,
  'A heavy locked box filled with valuable green precious stones.',
  'ev_8',
  false,
  '{"descriptions":["Thirty pounds of rough green Colombian emeralds are buried in an iron chest under the boathouse.","At 04:45 AM: Thirty pounds of rough green Colombian emeralds are buried in an iron chest under the boathouse.","Notice this clue: Thirty pounds of rough green Colombian emeralds are buried in an iron chest under the boathouse."],"hints":["A heavy locked box filled with valuable green precious stones.","Clue hint: Think about emerald treasure chest.","Search for: the multi-million-dollar cargo stolen by the first mate."],"clues":["Emerald Treasure Chest","Item: Emerald Treasure Chest","Clue Word: Emerald Treasure Chest"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4639746f-c79a-5deb-987a-1e68cad428f5',
  'story_061',
  'ev_8',
  8,
  '05:30 AM',
  'A pair of wet sailor sea-boots with salt crust is hidden in Thomas’s cottage locker.',
  'A pair of wet sailor sea-boots with salt crust is hidden in Thomas’s cottage locker.',
  'Thomas was on the vessel hours ago despite claiming he was on shore for days.',
  'Wet Sea Boots',
  'Heavy black leather sailor boots dripping with seawater and smelling of hemlock stew.',
  '["Work Shoes","Slippers","Riding Boots"]'::jsonb,
  'Wet Sea Boots',
  '["wet sea boots","boots","sea boots","wet boots","sailor boots"]'::jsonb,
  'Tall waterproof leather footwear worn by sailors on the deck of ships.',
  NULL,
  true,
  '{"descriptions":["A pair of wet sailor sea-boots with salt crust is hidden in Thomas’s cottage locker.","At 05:30 AM: A pair of wet sailor sea-boots with salt crust is hidden in Thomas’s cottage locker.","Notice this clue: A pair of wet sailor sea-boots with salt crust is hidden in Thomas’s cottage locker."],"hints":["Tall waterproof leather footwear worn by sailors on the deck of ships.","Clue hint: Think about wet sea boots.","Search for: thomas was on the vessel hours ago despite claiming he was on shore for days."],"clues":["Wet Sea Boots","Item: Wet Sea Boots","Clue Word: Wet Sea Boots"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_062 — THE TAROT READER'S WARNING
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_062',
  'The Tarot Reader''s Warning',
  'Supernatural',
  'Madame Zeroni’s Fortune Parlor, velvet purple drapes, smelling of frankincense, crystal balls and candles',
  'A wealthy merchant was found dead in his carriage; pinned to his front door with a silver dagger was the Death Tarot card.',
  '[{"name":"Madame Zeroni (Evelyn Vance)","role":"Occult Fortune Teller & Astrologer","alibi":"In her parlor holding a crystal ball consultation with clients","avatar":"🔮"},{"name":"Donald Sterling (Deceased)","role":"Wealthy Merchant & Moneylender","alibi":"Dead inside his private carriage","avatar":"💀"},{"name":"Toby Ross","role":"Carriage Driver","alibi":"On the carriage driver’s box","avatar":"🐎"},{"name":"Detective Frank Rossi","role":"Occult & Poison Crimes Investigator","alibi":"Arrived at the townhouse after the driver reported the dagger and death card","avatar":"🔍"}]'::jsonb,
  'Fortune teller Madame Zeroni (Evelyn Vance) read merchant Donald’s cards and drew the Death card as psychological priming. As Donald entered his carriage, Evelyn blew powdered monkshood through the window, then pinned the Death card to his door with an engraved dagger to make the murder look like a fatal curse.',
  'Fortune Teller Madame Zeroni (Evelyn Vance)',
  'Evelyn murdered the merchant to steal a fifty-thousand-dollar promissory note he held against her brother.',
  '[{"time":"10:00 PM","event":"Donald Sterling attends a private tarot reading in Madame Zeroni’s parlor."},{"time":"10:30 PM","event":"Zeroni reveals the Death Tarot card and whispers: \"Your time expires tonight.\""},{"time":"10:45 PM","event":"As Donald boards his carriage, Zeroni blows powdered aconite through the window."},{"time":"11:05 PM","event":"Donald collapses into cardiac arrest; Zeroni pins the Death card to his door with a dagger."},{"time":"11:30 PM","event":"Driver Toby finds Donald lifeless and calls the city police."}]'::jsonb,
  '[{"id":"ev1","title":"Silver Dagger with Vance Crest","detail":"Pinned the Death card to Donald’s door; engraved with Evelyn Vance’s family crest."},{"id":"ev2","title":"Brass Blowpipe with Aconite Residue","detail":"Used to shoot the toxic monkshood powder into the victim’s carriage window."},{"id":"ev3","title":"Stolen Fifty-Thousand-Dollar Promissory Note","detail":"Discovered in Zeroni’s parlor desk, proving the financial motive for murder."},{"id":"ev4","title":"Lethal Aconitine in Lung Tissue","detail":"Toxicology proves Donald died from inhaling botanical poison, not a psychic curse."}]'::jsonb,
  '[{"order":1,"title":"Death Tarot Card","text":"Illustrated fortune card pinned to the door to simulate an occult death prophecy."},{"order":2,"title":"Aconite Powder","text":"Deadly purple dust blown into the carriage to induce fatal cardiac arrest."},{"order":3,"title":"Silver Dagger","text":"Ceremonial weapon engraved with family crest used to pin the death card."},{"order":4,"title":"Brass Blowpipe","text":"Metal tube used to deliver the aerosolized poison from the street."},{"order":5,"title":"Stolen Promissory Note","text":"Debt document taken from the victim’s coat to save the family estate."},{"order":6,"title":"Purple Silk Veil","text":"Fabric worn by the fortune teller while staking out the victim’s carriage."}]'::jsonb,
  'Carriage driver Toby was trembling and holding a rosary.: He was superstitious and terrified of the Death card, but completely innocent.; The fortune parlor was filled with burning incense.: Frankincense and myrrh burned for mood, but non-toxic.',
  'Claim an ancient gypsy curse killed Donald or blame his carriage driver Toby.',
  'NORMAL',
  'Did the tarot prophecy predict his death, or did the reader use occult symbols to mask a targeted assassination?',
  '[{"character":"Madame Zeroni (Evelyn Vance)","secret":"She blew deadly plant poison through a brass blowpipe into Donald’s carriage."},{"character":"Donald Sterling (Deceased)","secret":"He held a promissory note that would seize Evelyn’s family estate tomorrow."},{"character":"Toby Ross","secret":"He ran away when he saw the silver dagger pinned to the house door."},{"character":"Detective Frank Rossi","secret":"Studied toxicological plants in Eastern Europe."}]'::jsonb,
  '[{"lead":"Carriage driver Toby was trembling and holding a rosary.","explanation":"He was superstitious and terrified of the Death card, but completely innocent."},{"lead":"The fortune parlor was filled with burning incense.","explanation":"Frankincense and myrrh burned for mood, but non-toxic."}]'::jsonb,
  '{"wrongTheories":["A supernatural demon executed the prophecy of the Death Tarot card.","Donald suffered a natural heart attack from the psychological stress of the reading."],"correctTheory":"Fortune teller Madame Zeroni (Evelyn Vance) drew the Death card to psychologically prime Donald, blew lethal aconite powder into his carriage window with a blowpipe, and pinned the card to his door with her family dagger to mask the murder and steal a fifty-thousand-dollar promissory note."}'::jsonb,
  'Fortune teller Madame Zeroni poisoned Donald to steal a fifty-thousand-dollar debt note!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Rossi traced the serpent crest on the dagger to Evelyn’s family and recovered the stolen promissory note. Madame Zeroni was arrested for capital murder and fraud."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The coroner ruled the death a supernatural heart failure caused by shock. Evelyn burned the promissory note, saving her brother’s estate."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Curse of the Death Card\" made Madame Zeroni the most feared and famous psychic in the country, attracting wealthy clients while the murder went cold."}]'::jsonb,
  '{"intros":["A wealthy merchant was found dead in his carriage; pinned to his front door with a silver dagger was the Death Tarot card.","Case file story_062: A wealthy merchant was found dead in his carriage; pinned to his front door with a silver dagger was the Death Tarot card. Look closely at every clue.","Trouble begins in Madame Zeroni’s Fortune Parlor, velvet purple drapes, smelling of frankincense, crystal balls and candles. A wealthy merchant was found dead in his carriage; pinned to his front door with a silver dagger was the Death Tarot card.","The mystery starts now. A wealthy merchant was found dead in his carriage; pinned to his front door with a silver dagger was the Death Tarot card. Can you solve it?"],"reveals":["Fortune teller Madame Zeroni poisoned Donald to steal a fifty-thousand-dollar debt note!","The mystery is unraveled! Fortune teller Madame Zeroni poisoned Donald to steal a fifty-thousand-dollar debt note!","At last, the truth comes out: Fortune teller Madame Zeroni poisoned Donald to steal a fifty-thousand-dollar debt note!","Case resolved! Here is what happened: Fortune teller Madame Zeroni poisoned Donald to steal a fifty-thousand-dollar debt note!"],"hints":["Pay attention to where Fortune Teller Madame Zeroni (Evelyn Vance) was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_062';
DELETE FROM public.case_events WHERE case_id = 'story_062';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '727f34d6-1727-5dca-8b4d-3b00f708eef2',
  'story_062',
  'Madame Zeroni (Evelyn Vance)',
  'Occult Fortune Teller & Astrologer',
  'Mysterious, veiled, rings on every finger, speaking in eerie prophetic riddles',
  'The cards do not lie. I warned Donald that the thirteenth card would claim his breath before the clock struck twelve.',
  'She blew deadly plant poison through a brass blowpipe into Donald’s carriage.',
  'In her parlor holding a crystal ball consultation with clients',
  'Donald’s spiritual advisor who predicted his demise',
  'Aconite causes cardiac arrest mimicking a sudden heart attack within twenty minutes.',
  'Did not know her silver dagger was engraved with her brother’s crest.',
  '🔮',
  '["The cards do not lie. I warned Donald that the thirteenth card would claim his breath before the clock struck twelve.","\"The cards do not lie. I warned Donald that the thirteenth card would claim his breath before the clock struck twelve.\"","Listen to me: The cards do not lie. I warned Donald that the thirteenth card would claim his breath before the clock struck twelve.","I tell you the truth: The cards do not lie. I warned Donald that the thirteenth card would claim his breath before the clock struck twelve."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c318ecd4-7826-52a5-8d8e-d45226a6d4e5',
  'story_062',
  'Donald Sterling (Deceased)',
  'Wealthy Merchant & Moneylender',
  'Superstitious, greedy, found slumped in his velvet carriage seat',
  'Deceased victim; lips showed blue cyanosis and eyes were wide in frozen terror.',
  'He held a promissory note that would seize Evelyn’s family estate tomorrow.',
  'Dead inside his private carriage',
  'Target of the murder',
  'The card reader blew sweet-smelling purple incense into his face as he left.',
  'Did not realize the sweet incense powder was deadly monkshood toxin.',
  '💀',
  '["Deceased victim; lips showed blue cyanosis and eyes were wide in frozen terror.","\"Deceased victim; lips showed blue cyanosis and eyes were wide in frozen terror.\"","Listen to me: Deceased victim; lips showed blue cyanosis and eyes were wide in frozen terror.","I tell you the truth: Deceased victim; lips showed blue cyanosis and eyes were wide in frozen terror."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '15f56c04-127c-5b8e-af19-97062f7cbd9d',
  'story_062',
  'Toby Ross',
  'Carriage Driver',
  'Terrified, superstitious, clutching horse reins with shaking hands',
  'The master climbed into the carriage gasping for breath, clutching his chest!',
  'He ran away when he saw the silver dagger pinned to the house door.',
  'On the carriage driver’s box',
  'Driver who transported Donald from the parlor to his townhouse',
  'Saw a veiled woman in purple silk blow a cloud of dust through the carriage curtains.',
  'Did not know the woman was Madame Zeroni herself.',
  '🐎',
  '["The master climbed into the carriage gasping for breath, clutching his chest!","\"The master climbed into the carriage gasping for breath, clutching his chest!\"","Listen to me: The master climbed into the carriage gasping for breath, clutching his chest!","I tell you the truth: The master climbed into the carriage gasping for breath, clutching his chest!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5edc6500-d83f-5416-98f4-474a5bbe6969',
  'story_062',
  'Detective Frank Rossi',
  'Occult & Poison Crimes Investigator',
  'Sharp, unsentimental, collects botanical powders with a steel spatula',
  'Prophecies don’t cause respiratory paralysis. We are looking at high-concentration wolfsbane alkaloid.',
  'Studied toxicological plants in Eastern Europe.',
  'Arrived at the townhouse after the driver reported the dagger and death card',
  'Leading the homicide investigation',
  'Found monkshood pollen inside the velvet folds of the carriage seat.',
  'Did not immediately locate where the promissory note was hidden.',
  '🔍',
  '["Prophecies don’t cause respiratory paralysis. We are looking at high-concentration wolfsbane alkaloid.","\"Prophecies don’t cause respiratory paralysis. We are looking at high-concentration wolfsbane alkaloid.\"","Listen to me: Prophecies don’t cause respiratory paralysis. We are looking at high-concentration wolfsbane alkaloid.","I tell you the truth: Prophecies don’t cause respiratory paralysis. We are looking at high-concentration wolfsbane alkaloid."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '417deeca-4666-57de-8aed-cebe9d5031a6',
  'story_062',
  'ev_1',
  1,
  '10:30 PM',
  'The thirteenth card of the Major Arcana, the Death Tarot Card, is laid face-up on the black velvet table.',
  'The thirteenth card of the Major Arcana, the Death Tarot Card, is laid face-up on the black velvet table.',
  'Used to psychologically prime the victim to believe his impending death was fated.',
  'Death Tarot Card',
  'Illustrated antique tarot card showing a skeletal reaper on a white horse.',
  '["The Tower Card","The Devil Card","Ace of Spades"]'::jsonb,
  'Death Tarot Card',
  '["death tarot card","tarot card","death card","card","tarot"]'::jsonb,
  'An illustrated fortune-telling card showing a skeleton holding a scythe.',
  'ev_2',
  true,
  '{"descriptions":["The thirteenth card of the Major Arcana, the Death Tarot Card, is laid face-up on the black velvet table.","At 10:30 PM: The thirteenth card of the Major Arcana, the Death Tarot Card, is laid face-up on the black velvet table.","Notice this clue: The thirteenth card of the Major Arcana, the Death Tarot Card, is laid face-up on the black velvet table."],"hints":["An illustrated fortune-telling card showing a skeleton holding a scythe.","Clue hint: Think about death tarot card.","Search for: used to psychologically prime the victim to believe his impending death was fated."],"clues":["Death Tarot Card","Item: Death Tarot Card","Clue Word: Death Tarot Card"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b633912e-61ef-52d3-b780-d1d29fe2443e',
  'story_062',
  'ev_2',
  2,
  '10:45 PM',
  'A fine purple-tinted botanical powder is blown through a hollow reed pipe into the carriage.',
  'A fine purple-tinted botanical powder is blown through a hollow reed pipe into the carriage.',
  'The poison was administered via inhalation as a fast-acting respiratory aerosol.',
  'Aconite Powder',
  'Microscopic purple monkshood pollen scraped from the carriage velvet cushions.',
  '["Arsenic Dust","Chalk Powder","Flour"]'::jsonb,
  'Aconite Powder',
  '["aconite powder","powder","aconite","poison","wolfsbane"]'::jsonb,
  'A fine deadly purple dust made from dried poisonous monkshood flowers.',
  'ev_3',
  false,
  '{"descriptions":["A fine purple-tinted botanical powder is blown through a hollow reed pipe into the carriage.","At 10:45 PM: A fine purple-tinted botanical powder is blown through a hollow reed pipe into the carriage.","Notice this clue: A fine purple-tinted botanical powder is blown through a hollow reed pipe into the carriage."],"hints":["A fine deadly purple dust made from dried poisonous monkshood flowers.","Clue hint: Think about aconite powder.","Search for: the poison was administered via inhalation as a fast-acting respiratory aerosol."],"clues":["Aconite Powder","Item: Aconite Powder","Clue Word: Aconite Powder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '194a542f-3521-59f9-977e-295f8bea96c7',
  'story_062',
  'ev_3',
  3,
  '11:05 PM',
  'An engraved sterling silver dagger pins the Death card into the solid oak townhouse door.',
  'An engraved sterling silver dagger pins the Death card into the solid oak townhouse door.',
  'The dagger was driven two inches deep into the wood as a theatrical signature.',
  'Silver Dagger',
  'Ornate ceremonial knife engraved with the Vance family serpent crest.',
  '["Iron Nail","Pocket Knife","Needle"]'::jsonb,
  'Silver Dagger',
  '["silver dagger","dagger","knife","ceremonial knife"]'::jsonb,
  'A decorative sharp metal blade made of shiny silver used in rituals.',
  'ev_4',
  false,
  '{"descriptions":["An engraved sterling silver dagger pins the Death card into the solid oak townhouse door.","At 11:05 PM: An engraved sterling silver dagger pins the Death card into the solid oak townhouse door.","Notice this clue: An engraved sterling silver dagger pins the Death card into the solid oak townhouse door."],"hints":["A decorative sharp metal blade made of shiny silver used in rituals.","Clue hint: Think about silver dagger.","Search for: the dagger was driven two inches deep into the wood as a theatrical signature."],"clues":["Silver Dagger","Item: Silver Dagger","Clue Word: Silver Dagger"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'af271f31-0eff-5a1f-8fb0-8ae69c9e3229',
  'story_062',
  'ev_4',
  4,
  '11:15 PM',
  'A hollow brass reed blowpipe with traces of purple powder is in Zeroni’s cabinet.',
  'A hollow brass reed blowpipe with traces of purple powder is in Zeroni’s cabinet.',
  'The instrument used to shoot the cloud of poison into Donald’s carriage window.',
  'Brass Blowpipe',
  'Eight-inch brass tube with mouthpiece and interior chemical aconite residue.',
  '["Flute","Cigarette Holder","Pen"]'::jsonb,
  'Brass Blowpipe',
  '["brass blowpipe","blowpipe","pipe","brass pipe","tube"]'::jsonb,
  'A hollow metal or wood tube through which darts or powder are blown with the mouth.',
  'ev_5',
  false,
  '{"descriptions":["A hollow brass reed blowpipe with traces of purple powder is in Zeroni’s cabinet.","At 11:15 PM: A hollow brass reed blowpipe with traces of purple powder is in Zeroni’s cabinet.","Notice this clue: A hollow brass reed blowpipe with traces of purple powder is in Zeroni’s cabinet."],"hints":["A hollow metal or wood tube through which darts or powder are blown with the mouth.","Clue hint: Think about brass blowpipe.","Search for: the instrument used to shoot the cloud of poison into donald’s carriage window."],"clues":["Brass Blowpipe","Item: Brass Blowpipe","Clue Word: Brass Blowpipe"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e82b7392-3535-5b1e-99d2-2031bc0ea6a7',
  'story_062',
  'ev_5',
  5,
  '11:30 PM',
  'The victim’s leather wallet is found rifled through; a promissory note is missing.',
  'The victim’s leather wallet is found rifled through; a promissory note is missing.',
  'The motive was financial: erasing a fifty-thousand-dollar debt owed by Zeroni’s brother.',
  'Stolen Promissory Note',
  'Empty document sleeve in Donald’s pocket with indentations of a debt contract.',
  '["Cash Stack","Gold Coins","Checkbook"]'::jsonb,
  'Stolen Promissory Note',
  '["stolen promissory note","note","promissory note","debt note","contract"]'::jsonb,
  'A written legal paper promising to pay a large sum of money by a specific date.',
  'ev_6',
  true,
  '{"descriptions":["The victim’s leather wallet is found rifled through; a promissory note is missing.","At 11:30 PM: The victim’s leather wallet is found rifled through; a promissory note is missing.","Notice this clue: The victim’s leather wallet is found rifled through; a promissory note is missing."],"hints":["A written legal paper promising to pay a large sum of money by a specific date.","Clue hint: Think about stolen promissory note.","Search for: the motive was financial: erasing a fifty-thousand-dollar debt owed by zeroni’s brother."],"clues":["Stolen Promissory Note","Item: Stolen Promissory Note","Clue Word: Stolen Promissory Note"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd8911c68-1ab8-5332-82dd-8f0eceda2390',
  'story_062',
  'ev_6',
  6,
  '11:45 PM',
  'A purple silk mourning veil smelling of frankincense is tossed into the parlor hearth.',
  'A purple silk mourning veil smelling of frankincense is tossed into the parlor hearth.',
  'Zeroni wore the veil when running to Donald’s door to pin the card.',
  'Purple Silk Veil',
  'Partially burned silk cloth matching fibers found on the carriage door handle.',
  '["Black Scarf","Lace Handkerchief","Velvet Cape"]'::jsonb,
  'Purple Silk Veil',
  '["purple silk veil","veil","purple veil","silk veil","cloth"]'::jsonb,
  'A piece of fine sheer purple fabric worn over a woman’s face or head.',
  'ev_7',
  false,
  '{"descriptions":["A purple silk mourning veil smelling of frankincense is tossed into the parlor hearth.","At 11:45 PM: A purple silk mourning veil smelling of frankincense is tossed into the parlor hearth.","Notice this clue: A purple silk mourning veil smelling of frankincense is tossed into the parlor hearth."],"hints":["A piece of fine sheer purple fabric worn over a woman’s face or head.","Clue hint: Think about purple silk veil.","Search for: zeroni wore the veil when running to donald’s door to pin the card."],"clues":["Purple Silk Veil","Item: Purple Silk Veil","Clue Word: Purple Silk Veil"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f7707093-1c10-5a6b-bedd-a7f5435c9897',
  'story_062',
  'ev_7',
  7,
  '12:00 AM',
  'Toxicology tests on Donald’s lung tissue show massive aconitine saturation.',
  'Toxicology tests on Donald’s lung tissue show massive aconitine saturation.',
  'Medical confirmation that the death was acute chemical poisoning, not a heart attack.',
  'Toxicology Report',
  'Hospital laboratory finding confirming fatal inhaled monkshood toxin.',
  '["Autopsy Chart","Death Certificate","X-Ray"]'::jsonb,
  'Toxicology Report',
  '["toxicology report","report","lab report","blood test"]'::jsonb,
  'A scientific laboratory paper confirming what poison was present in a body.',
  'ev_8',
  false,
  '{"descriptions":["Toxicology tests on Donald’s lung tissue show massive aconitine saturation.","At 12:00 AM: Toxicology tests on Donald’s lung tissue show massive aconitine saturation.","Notice this clue: Toxicology tests on Donald’s lung tissue show massive aconitine saturation."],"hints":["A scientific laboratory paper confirming what poison was present in a body.","Clue hint: Think about toxicology report.","Search for: medical confirmation that the death was acute chemical poisoning, not a heart attack."],"clues":["Toxicology Report","Item: Toxicology Report","Clue Word: Toxicology Report"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '23fc1191-53a0-523c-af3b-5a813512ac30',
  'story_062',
  'ev_8',
  8,
  '12:30 AM',
  'A mortise key to Donald’s front gate is found hidden inside the crystal ball base.',
  'A mortise key to Donald’s front gate is found hidden inside the crystal ball base.',
  'Zeroni had stolen a key to Donald’s gate to access his porch silently.',
  'Crystal Ball Base',
  'Hollow ebony wooden stand for a crystal ball holding the stolen brass gate key.',
  '["Jewelry Box","Drawer","Desk"]'::jsonb,
  'Crystal Ball Base',
  '["crystal ball base","base","stand","wooden stand"]'::jsonb,
  'The wooden or metal holder that supports a round fortune-teller’s glass orb.',
  NULL,
  true,
  '{"descriptions":["A mortise key to Donald’s front gate is found hidden inside the crystal ball base.","At 12:30 AM: A mortise key to Donald’s front gate is found hidden inside the crystal ball base.","Notice this clue: A mortise key to Donald’s front gate is found hidden inside the crystal ball base."],"hints":["The wooden or metal holder that supports a round fortune-teller’s glass orb.","Clue hint: Think about crystal ball base.","Search for: zeroni had stolen a key to donald’s gate to access his porch silently."],"clues":["Crystal Ball Base","Item: Crystal Ball Base","Clue Word: Crystal Ball Base"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_063 — THE CURSED MUSIC BOX
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_063',
  'The Cursed Music Box',
  'Supernatural',
  'The Hawthorne Manor Parlor, velvet armchairs, marble fireplace, and an antique inlaid Swiss music box',
  'Whenever the antique music box played its tinny waltz, all candles flickered out and doors locked simultaneously.',
  '[{"name":"Arthur Vance","role":"Nephew & Mechanical Engineer","alibi":"Sitting in the parlor pretending to be terrified when the lights went out","avatar":"⚙️"},{"name":"Lady Beatrice Hawthorne","role":"Elderly Estate Owner","alibi":"In the parlor listening to the music box","avatar":"👵"},{"name":"Martha Higgins","role":"Parlor Maid","alibi":"Serving tea in the parlor doorway","avatar":"🕯️"},{"name":"Detective Frank Cole","role":"Special Devices & Fraud Investigator","alibi":"Arrived at the manor to observe the scheduled parlor demonstration","avatar":"🔍"}]'::jsonb,
  'Arthur Vance modified an antique Swiss music box. Inside its gears, a tiny micro-switch responded to the music’s final high note, firing a canister of carbon dioxide gas through baseboard nozzles to extinguish candles and triggering 12V electromagnetic door bolts to trap the occupants.',
  'Mechanic Arthur Vance',
  'Arthur wanted to terrorize his elderly aunt into leaving her estate so he could sell the property to developers.',
  '[{"time":"08:00 PM","event":"Arthur winds the clockwork spring of the antique music box."},{"time":"08:02 PM","event":"The music box plays its tinny waltz on tuned steel tines."},{"time":"08:04 PM","event":"The final high E-note trips the acoustic micro-switch inside the cylinder."},{"time":"08:04:05","event":"CO2 gas vents from baseboard nozzles, suffocating all candle flames."},{"time":"08:04:06","event":"Electromagnetic door bolts engage, locking the occupants in total darkness."}]'::jsonb,
  '[{"id":"ev1","title":"Acoustic Micro-Switch in Music Box","detail":"Tuned to trip the electric circuit upon sounding the final high E-note of the waltz."},{"id":"ev2","title":"CO2 Gas Cylinder and Baseboard Nozzles","detail":"Proves the simultaneous candle extinguishment was caused by chemical oxygen displacement."},{"id":"ev3","title":"Electromagnetic Door Locks in Jambs","detail":"Mortised cleanly into the woodwork with wiring traced to Arthur’s hidden battery pack."},{"id":"ev4","title":"Four-Million-Dollar Developer Buyout","detail":"Establishes Arthur’s financial motive to psychologically terrorize his aunt into moving."}]'::jsonb,
  '[{"order":1,"title":"Inlaid Music Box","text":"Rosewood antique box containing a hidden acoustic electrical relay."},{"order":2,"title":"Acoustic Relay Switch","text":"Vibration sensor triggered by the music’s final high note."},{"order":3,"title":"Extinguished Candles","text":"Chandelier flames snuffed out simultaneously by carbon dioxide gas."},{"order":4,"title":"Electromagnetic Door Bolts","text":"Electric magnets that locked the doors when the music stopped."},{"order":5,"title":"CO2 Gas Cylinder","text":"Pressurized gas tank hidden under the floorboards to starve the flames."},{"order":6,"title":"Land Buyout Contract","text":"Four-million-dollar real estate offer incentivizing the staged haunting."}]'::jsonb,
  'Maid Martha had matches in her pocket.: She was trying to relight the candles after they were snuffed.; The music box played a sad minor waltz.: A Victorian tune chosen for eerie emotional atmosphere.',
  'Claim a vengeful Victorian spirit possessed the music box or blame the parlor maid.',
  'NORMAL',
  'What supernatural force was extinguishing the candles and locking the doors when the music played?',
  '[{"character":"Arthur Vance","secret":"He installed electromagnetic door locks and gas tubes in the walls."},{"character":"Lady Beatrice Hawthorne","secret":"She was considering donating the manor to the historical society."},{"character":"Martha Higgins","secret":"She noticed a strange sour chemical smell near the baseboards."},{"character":"Detective Frank Cole","secret":"Investigated fraudulent haunted houses across the state."}]'::jsonb,
  '[{"lead":"Maid Martha had matches in her pocket.","explanation":"She was trying to relight the candles after they were snuffed."},{"lead":"The music box played a sad minor waltz.","explanation":"A Victorian tune chosen for eerie emotional atmosphere."}]'::jsonb,
  '{"wrongTheories":["The spirit of Arthur’s grandmother manifested to snuff the candles and seal the room.","A draft from the chimney flue blew out the candles and slammed the heavy doors."],"correctTheory":"Mechanic Arthur Vance rigged the music box with an acoustic switch that released carbon dioxide gas to snuff the candles and engaged electromagnetic door bolts to trap the room, terrorizing his aunt so she would sell her manor for a four-million-dollar developer payout."}'::jsonb,
  'Arthur Vance rigged the music box to vent CO2 gas and engage magnetic door locks!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Cole discovered the hidden CO2 nozzles and the battery in the chimney. Arthur Vance was arrested for reckless endangerment and fraud, while Lady Beatrice kept her manor."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Lady Beatrice fled the manor in terror, signing the estate over to developers. Arthur collected his four-million-dollar commission and lived in luxury."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Cursed Music Box of Hawthorne\" became a featured exhibit in a museum of the occult, with Arthur earning royalties from the legend."}]'::jsonb,
  '{"intros":["Whenever the antique music box played its tinny waltz, all candles flickered out and doors locked simultaneously.","Case file story_063: Whenever the antique music box played its tinny waltz, all candles flickered out and doors locked simultaneously. Look closely at every clue.","Trouble begins in The Hawthorne Manor Parlor, velvet armchairs, marble fireplace, and an antique inlaid Swiss music box. Whenever the antique music box played its tinny waltz, all candles flickered out and doors locked simultaneously.","The mystery starts now. Whenever the antique music box played its tinny waltz, all candles flickered out and doors locked simultaneously. Can you solve it?"],"reveals":["Arthur Vance rigged the music box to vent CO2 gas and engage magnetic door locks!","The mystery is unraveled! Arthur Vance rigged the music box to vent CO2 gas and engage magnetic door locks!","At last, the truth comes out: Arthur Vance rigged the music box to vent CO2 gas and engage magnetic door locks!","Case resolved! Here is what happened: Arthur Vance rigged the music box to vent CO2 gas and engage magnetic door locks!"],"hints":["Pay attention to where Mechanic Arthur Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_063';
DELETE FROM public.case_events WHERE case_id = 'story_063';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'dbe1ed02-28c1-5e34-b791-09d56eb548ba',
  'story_063',
  'Arthur Vance',
  'Nephew & Mechanical Engineer',
  'Clever, polite, polished appearance concealing financial desperation',
  'This music box belonged to grandmother. Her spirit is angry that we are still in this house.',
  'He installed electromagnetic door locks and gas tubes in the walls.',
  'Sitting in the parlor pretending to be terrified when the lights went out',
  'Nephew seeking to force his aunt to sell the estate to developers',
  'The high E-note on the steel comb trips the acoustic frequency relay.',
  'Did not know an acoustic sensor captured the solenoid clicking sound.',
  '⚙️',
  '["This music box belonged to grandmother. Her spirit is angry that we are still in this house.","\"This music box belonged to grandmother. Her spirit is angry that we are still in this house.\"","Listen to me: This music box belonged to grandmother. Her spirit is angry that we are still in this house.","I tell you the truth: This music box belonged to grandmother. Her spirit is angry that we are still in this house."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '31b86fc0-e451-5cf0-b89f-58ae6f5d0b6d',
  'story_063',
  'Lady Beatrice Hawthorne',
  'Elderly Estate Owner',
  'Frail, pious, clutching her silver cross, trembling in her armchair',
  'The music plays and the darkness swallows the room! It is a demonic curse!',
  'She was considering donating the manor to the historical society.',
  'In the parlor listening to the music box',
  'Aunt targeted by the psychological haunting campaign',
  'The music box was gifted to her by Arthur last Tuesday.',
  'Did not understand the electronic solenoid mechanisms hidden in her door frames.',
  '👵',
  '["The music plays and the darkness swallows the room! It is a demonic curse!","\"The music plays and the darkness swallows the room! It is a demonic curse!\"","Listen to me: The music plays and the darkness swallows the room! It is a demonic curse!","I tell you the truth: The music plays and the darkness swallows the room! It is a demonic curse!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7db1b554-60fc-54c3-8298-6ad331142bd1',
  'story_063',
  'Martha Higgins',
  'Parlor Maid',
  'Superstitious, terrified, constantly relighting candles with long matches',
  'Every time that little tune ends, the air gets cold and heavy, and the candles die!',
  'She noticed a strange sour chemical smell near the baseboards.',
  'Serving tea in the parlor doorway',
  'Witness to the recurring parlor phenomena',
  'The heavy mahogany doors slam shut with a loud metallic clack.',
  'Did not know the baseboards had gas nozzles drilled through the wood.',
  '🕯️',
  '["Every time that little tune ends, the air gets cold and heavy, and the candles die!","\"Every time that little tune ends, the air gets cold and heavy, and the candles die!\"","Listen to me: Every time that little tune ends, the air gets cold and heavy, and the candles die!","I tell you the truth: Every time that little tune ends, the air gets cold and heavy, and the candles die!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '98251f9c-890e-58b1-9e0c-231ba75aa949',
  'story_063',
  'Detective Frank Cole',
  'Special Devices & Fraud Investigator',
  'Sharp, dry, carries gas sniffers and electronic voltage meters',
  'Candles don’t blow out from ghosts. They die when the oxygen is displaced by carbon dioxide gas.',
  'Investigated fraudulent haunted houses across the state.',
  'Arrived at the manor to observe the scheduled parlor demonstration',
  'Investigating claims of supernatural occurrences',
  'Found electromagnetic solenoids wired into the door jambs.',
  'Did not immediately locate where the compressed CO2 cylinders were hidden.',
  '🔍',
  '["Candles don’t blow out from ghosts. They die when the oxygen is displaced by carbon dioxide gas.","\"Candles don’t blow out from ghosts. They die when the oxygen is displaced by carbon dioxide gas.\"","Listen to me: Candles don’t blow out from ghosts. They die when the oxygen is displaced by carbon dioxide gas.","I tell you the truth: Candles don’t blow out from ghosts. They die when the oxygen is displaced by carbon dioxide gas."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '436a006c-676c-55d4-9357-a04979e8d48f',
  'story_063',
  'ev_1',
  1,
  '08:02 PM',
  'An antique inlaid rosewood Swiss music box plays a tinny, haunting waltz melody.',
  'An antique inlaid rosewood Swiss music box plays a tinny, haunting waltz melody.',
  'The music box contained a hidden frequency-sensitive acoustic contact relay.',
  'Inlaid Music Box',
  'Rosewood box with brass cylinder and tuned steel comb wired to a micro-circuit.',
  '["Gramophone","Clock","Radio"]'::jsonb,
  'Inlaid Music Box',
  '["inlaid music box","music box","box","antique music box","rosewood box"]'::jsonb,
  'A small decorative wooden box that plays a musical tune when wound with a key.',
  'ev_2',
  true,
  '{"descriptions":["An antique inlaid rosewood Swiss music box plays a tinny, haunting waltz melody.","At 08:02 PM: An antique inlaid rosewood Swiss music box plays a tinny, haunting waltz melody.","Notice this clue: An antique inlaid rosewood Swiss music box plays a tinny, haunting waltz melody."],"hints":["A small decorative wooden box that plays a musical tune when wound with a key.","Clue hint: Think about inlaid music box.","Search for: the music box contained a hidden frequency-sensitive acoustic contact relay."],"clues":["Inlaid Music Box","Item: Inlaid Music Box","Clue Word: Inlaid Music Box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6f0beed9-0d66-589c-9f4a-7ca756036ef0',
  'story_063',
  'ev_2',
  2,
  '08:04 PM',
  'A tiny acoustic vibration switch tuned to 2,600 Hertz trips at the final note.',
  'A tiny acoustic vibration switch tuned to 2,600 Hertz trips at the final note.',
  'The note completed an electric circuit that triggered the room-wide traps.',
  'Acoustic Relay Switch',
  'Miniature copper reed switch vibrating at the frequency of high E.',
  '["Battery","Fuse","Solenoid"]'::jsonb,
  'Acoustic Relay Switch',
  '["acoustic relay switch","relay","switch","acoustic switch","acoustic relay"]'::jsonb,
  'A tiny electronic trigger that flips on when it hears a specific high musical sound.',
  'ev_3',
  false,
  '{"descriptions":["A tiny acoustic vibration switch tuned to 2,600 Hertz trips at the final note.","At 08:04 PM: A tiny acoustic vibration switch tuned to 2,600 Hertz trips at the final note.","Notice this clue: A tiny acoustic vibration switch tuned to 2,600 Hertz trips at the final note."],"hints":["A tiny electronic trigger that flips on when it hears a specific high musical sound.","Clue hint: Think about acoustic relay switch.","Search for: the note completed an electric circuit that triggered the room-wide traps."],"clues":["Acoustic Relay Switch","Item: Acoustic Relay Switch","Clue Word: Acoustic Relay Switch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '42eea6b5-7f20-59ff-a93e-4684c89f798c',
  'story_063',
  'ev_3',
  3,
  '08:04:05',
  'Six beeswax candles in the chandelier extinguish simultaneously in a fraction of a second.',
  'Six beeswax candles in the chandelier extinguish simultaneously in a fraction of a second.',
  'The flames were suffocated by a sudden surge of oxygen-displacing carbon dioxide.',
  'Extinguished Candles',
  'Smoldering wicks with cold wax and zero oxygen surrounding the chandelier.',
  '["Gas Lamp","Electric Bulb","Lantern"]'::jsonb,
  'Extinguished Candles',
  '["extinguished candles","candles","wicks","dead candles"]'::jsonb,
  'Wax sticks with burning wicks that provide light until blown out.',
  'ev_4',
  false,
  '{"descriptions":["Six beeswax candles in the chandelier extinguish simultaneously in a fraction of a second.","At 08:04:05: Six beeswax candles in the chandelier extinguish simultaneously in a fraction of a second.","Notice this clue: Six beeswax candles in the chandelier extinguish simultaneously in a fraction of a second."],"hints":["Wax sticks with burning wicks that provide light until blown out.","Clue hint: Think about extinguished candles.","Search for: the flames were suffocated by a sudden surge of oxygen-displacing carbon dioxide."],"clues":["Extinguished Candles","Item: Extinguished Candles","Clue Word: Extinguished Candles"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ee49ce42-cb7d-5ce8-8671-6efcb771c41d',
  'story_063',
  'ev_4',
  4,
  '08:04:06',
  'Both heavy mahogany parlor doors snap shut with an audible metallic clack: "THUNK".',
  'Both heavy mahogany parlor doors snap shut with an audible metallic clack: "THUNK".',
  '12-volt electromagnetic door lock bolts were energized by a hidden battery.',
  'Electromagnetic Door Bolts',
  'Concealed steel magnetic plates mortised into the mahogany door frames.',
  '["Brass Padlock","Wooden Bar","Deadbolt"]'::jsonb,
  'Electromagnetic Door Bolts',
  '["electromagnetic door bolts","bolts","door bolts","magnetic locks","electromagnetic locks"]'::jsonb,
  'Powerful electric magnets installed in door frames that lock doors using electricity.',
  'ev_5',
  false,
  '{"descriptions":["Both heavy mahogany parlor doors snap shut with an audible metallic clack: \"THUNK\".","At 08:04:06: Both heavy mahogany parlor doors snap shut with an audible metallic clack: \"THUNK\".","Notice this clue: Both heavy mahogany parlor doors snap shut with an audible metallic clack: \"THUNK\"."],"hints":["Powerful electric magnets installed in door frames that lock doors using electricity.","Clue hint: Think about electromagnetic door bolts.","Search for: 12-volt electromagnetic door lock bolts were energized by a hidden battery."],"clues":["Electromagnetic Door Bolts","Item: Electromagnetic Door Bolts","Clue Word: Electromagnetic Door Bolts"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'be29ad32-cc57-57d5-975b-f51f3f67a137',
  'story_063',
  'ev_5',
  5,
  '08:05 PM',
  'A tank of compressed carbon dioxide gas with copper tubing is hidden beneath the floor.',
  'A tank of compressed carbon dioxide gas with copper tubing is hidden beneath the floor.',
  'The gas was piped through drilled holes in the baseboard directly into the room.',
  'CO2 Gas Cylinder',
  'Twenty-pound steel cylinder filled with pressurized carbon dioxide gas.',
  '["Oxygen Tank","Helium Tank","Water Tank"]'::jsonb,
  'CO2 Gas Cylinder',
  '["co2 gas cylinder","co2 tank","cylinder","gas cylinder","gas tank"]'::jsonb,
  'A heavy metal bottle containing compressed gas used to carbonate soda or put out fires.',
  'ev_6',
  true,
  '{"descriptions":["A tank of compressed carbon dioxide gas with copper tubing is hidden beneath the floor.","At 08:05 PM: A tank of compressed carbon dioxide gas with copper tubing is hidden beneath the floor.","Notice this clue: A tank of compressed carbon dioxide gas with copper tubing is hidden beneath the floor."],"hints":["A heavy metal bottle containing compressed gas used to carbonate soda or put out fires.","Clue hint: Think about co2 gas cylinder.","Search for: the gas was piped through drilled holes in the baseboard directly into the room."],"clues":["CO2 Gas Cylinder","Item: CO2 Gas Cylinder","Clue Word: CO2 Gas Cylinder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1ec1f27d-f404-5639-b261-f1a2ea36b367',
  'story_063',
  'ev_6',
  6,
  '08:15 PM',
  'Tiny perforated brass gas nozzles are found disguised as carpet upholstery tacks.',
  'Tiny perforated brass gas nozzles are found disguised as carpet upholstery tacks.',
  'The nozzles sprayed invisible gas at ankle level to silently displace oxygen.',
  'Baseboard Gas Nozzles',
  'Hollow brass pins threaded into 1/4-inch copper gas tubes along the wall.',
  '["Nails","Screws","Wiring Clips"]'::jsonb,
  'Baseboard Gas Nozzles',
  '["baseboard gas nozzles","nozzles","gas nozzles","brass nozzles","tacks"]'::jsonb,
  'Tiny metal spray tips hidden along the floor to release invisible gas.',
  'ev_7',
  false,
  '{"descriptions":["Tiny perforated brass gas nozzles are found disguised as carpet upholstery tacks.","At 08:15 PM: Tiny perforated brass gas nozzles are found disguised as carpet upholstery tacks.","Notice this clue: Tiny perforated brass gas nozzles are found disguised as carpet upholstery tacks."],"hints":["Tiny metal spray tips hidden along the floor to release invisible gas.","Clue hint: Think about baseboard gas nozzles.","Search for: the nozzles sprayed invisible gas at ankle level to silently displace oxygen."],"clues":["Baseboard Gas Nozzles","Item: Baseboard Gas Nozzles","Clue Word: Baseboard Gas Nozzles"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c69cccf6-6902-549e-b954-61c1878bd7c7',
  'story_063',
  'ev_7',
  7,
  '08:30 PM',
  'A 12V rechargeable lithium battery pack powering the door magnets is in the chimney flue.',
  'A 12V rechargeable lithium battery pack powering the door magnets is in the chimney flue.',
  'The power source for the locking system was completely isolated from house wiring.',
  'Lithium Battery Pack',
  'Blue heat-shrink battery pack wired to a radio-frequency receiver.',
  '["Car Battery","AA Battery","Solar Panel"]'::jsonb,
  'Lithium Battery Pack',
  '["lithium battery pack","battery","battery pack","lithium battery","power pack"]'::jsonb,
  'A portable rechargeable battery pack used to power electric gadgets and locks.',
  'ev_8',
  false,
  '{"descriptions":["A 12V rechargeable lithium battery pack powering the door magnets is in the chimney flue.","At 08:30 PM: A 12V rechargeable lithium battery pack powering the door magnets is in the chimney flue.","Notice this clue: A 12V rechargeable lithium battery pack powering the door magnets is in the chimney flue."],"hints":["A portable rechargeable battery pack used to power electric gadgets and locks.","Clue hint: Think about lithium battery pack.","Search for: the power source for the locking system was completely isolated from house wiring."],"clues":["Lithium Battery Pack","Item: Lithium Battery Pack","Clue Word: Lithium Battery Pack"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2b6f66a4-0317-50ac-94e4-23c930c6f649',
  'story_063',
  'ev_8',
  8,
  '09:00 PM',
  'A commercial land buyout offer offering four million dollars is in Arthur’s coat pocket.',
  'A commercial land buyout offer offering four million dollars is in Arthur’s coat pocket.',
  'Arthur stood to make a fortune if his aunt surrendered the manor to developers.',
  'Land Buyout Contract',
  'Signed purchase option from Apex Commercial Real Estate.',
  '["Will","Tax Bill","Receipt"]'::jsonb,
  'Land Buyout Contract',
  '["land buyout contract","contract","buyout contract","land contract","document"]'::jsonb,
  'A legal business agreement proposing to buy an expensive estate for millions.',
  NULL,
  true,
  '{"descriptions":["A commercial land buyout offer offering four million dollars is in Arthur’s coat pocket.","At 09:00 PM: A commercial land buyout offer offering four million dollars is in Arthur’s coat pocket.","Notice this clue: A commercial land buyout offer offering four million dollars is in Arthur’s coat pocket."],"hints":["A legal business agreement proposing to buy an expensive estate for millions.","Clue hint: Think about land buyout contract.","Search for: arthur stood to make a fortune if his aunt surrendered the manor to developers."],"clues":["Land Buyout Contract","Item: Land Buyout Contract","Clue Word: Land Buyout Contract"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_064 — THE WHISPERING TREE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_064',
  'The Whispering Tree',
  'Supernatural',
  'The Blackwood Courtyard, ancient hollow oak tree with twisted roots and names carved into its trunk',
  'At twilight, the hollow trunk of the ancient oak whispered the names of three people who died in the village forty years ago.',
  '[{"name":"Julian Cole","role":"Local Historian & Archivist","alibi":"In the church archives cataloging birth records","avatar":"📚"},{"name":"Mayor Frank Vance","role":"Town Council Mayor","alibi":"In town hall reviewing highway bulldozing permits","avatar":"🏛️"},{"name":"Martha Higgins","role":"Village Elder","alibi":"In the church pews praying for the village","avatar":"👵"},{"name":"Detective Thomas Reed","role":"Acoustic Forensic Specialist","alibi":"Arrived in the courtyard with sound measurement equipment at 5:30 PM","avatar":"🔍"}]'::jsonb,
  'Historian Julian Cole ran a concealed copper acoustic speaking tube from the church root cellar through tree roots into the hollow oak trunk. Sitting in the cellar with a megaphone, he spoke the names of historical figures at dusk to convince the superstitious town that the tree was a sacred haunted monument.',
  'Historian Julian Cole',
  'Julian wanted to stop the town council from chopping down the historic tree and building a highway.',
  '[{"time":"04:00 PM","event":"Julian slips into the church root cellar with a vintage speaking megaphone."},{"time":"05:45 PM","event":"The sun sets; twilight falls across the cobblestone courtyard."},{"time":"06:00 PM","event":"Julian whispers names and historical warnings into the copper pipe."},{"time":"06:05 PM","event":"The hollow oak trunk amplifies the voices, echoing across the gathered crowd."},{"time":"06:30 PM","event":"Detective Reed snakes an endoscope camera inside the trunk cavity."}]'::jsonb,
  '[{"id":"ev1","title":"Copper Speaking Tube in Hollow Trunk","detail":"Found terminating inside the tree, proving an artificial acoustic projection system."},{"id":"ev2","title":"Brass Funnel Megaphone in Root Cellar","detail":"Carries Julian Cole’s fingerprints and saliva residue on the mouthpiece."},{"id":"ev3","title":"Parish Death Registry with Highlighted Names","detail":"Matches the exact historical names whispered by the tree at twilight."},{"id":"ev4","title":"Lead Solder Droplets in Root Cellar","detail":"Proves the copper pipeline was recently assembled by an individual with plumbing tools."}]'::jsonb,
  '[{"order":1,"title":"Hollow Oak Trunk","text":"Ancient courtyard tree acting as a natural acoustic amplifier."},{"order":2,"title":"Copper Speaking Tube","text":"Conduit running from the church cellar directly into the tree cavity."},{"order":3,"title":"Brass Funnel Megaphone","text":"Speaking tool used by the historian to project voices through the pipe."},{"order":4,"title":"Parish Death Registry","text":"Historical book of deceased village names read during the whispering trick."},{"order":5,"title":"Solder Droplets","text":"Plumbing metal remains found where the pipe was assembled in secret."},{"order":6,"title":"Highway Construction Contract","text":"Town document proving the mayor planned to bulldoze the tree for a road."}]'::jsonb,
  'Elder Martha laid floral wreaths at the roots.: A religious gesture of respect, but she had no role in the pipe rigging.; Wind rustled the dry oak leaves at dusk.: Natural foliage noise that helped disguise the pipe sound.',
  'Claim the souls of the dead were imprisoned in the tree roots or blame the church groundskeeper.',
  'NORMAL',
  'Was the oak tree an anchor for restless spirits, or was an acoustic trick hiding living voices?',
  '[{"character":"Julian Cole","secret":"He ran thirty feet of copper plumbing pipe through an old drainage ditch into the tree."},{"character":"Mayor Frank Vance","secret":"He took kickbacks from highway construction contractors."},{"character":"Martha Higgins","secret":"She was leaving floral wreaths at the roots of the oak every morning."},{"character":"Detective Thomas Reed","secret":"Studied acoustic communication systems in military forts."}]'::jsonb,
  '[{"lead":"Elder Martha laid floral wreaths at the roots.","explanation":"A religious gesture of respect, but she had no role in the pipe rigging."},{"lead":"Wind rustled the dry oak leaves at dusk.","explanation":"Natural foliage noise that helped disguise the pipe sound."}]'::jsonb,
  '{"wrongTheories":["The souls of ancient villagers were reincarnated into the wood of the oak tree.","The tree’s hollow core naturally resonated with radio broadcast frequencies."],"correctTheory":"Historian Julian Cole installed an underground copper speaking tube from the church root cellar into the hollow oak trunk, whispering names from an old parish death registry to fake a supernatural haunting and prevent the mayor from bulldozing the tree for a highway."}'::jsonb,
  'Historian Julian Cole ran a copper pipe into the tree to save it from bulldozers!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Reed discovered the cellar megaphone and exposed the acoustic trick. While Julian was fined for unauthorized plumbing, the exposed highway kickbacks forced the mayor out, and the historic tree was preserved as a landmark."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The terrified town council believed the tree was demonic and chopped it down immediately. The highway was built and the historic courtyard was lost."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Oracle Oak of Blackwood\" drew thousands of spiritualist tourists. Julian became the official town druid, charging visitors to hear the tree speak."}]'::jsonb,
  '{"intros":["At twilight, the hollow trunk of the ancient oak whispered the names of three people who died in the village forty years ago.","Case file story_064: At twilight, the hollow trunk of the ancient oak whispered the names of three people who died in the village forty years ago. Look closely at every clue.","Trouble begins in The Blackwood Courtyard, ancient hollow oak tree with twisted roots and names carved into its trunk. At twilight, the hollow trunk of the ancient oak whispered the names of three people who died in the village forty years ago.","The mystery starts now. At twilight, the hollow trunk of the ancient oak whispered the names of three people who died in the village forty years ago. Can you solve it?"],"reveals":["Historian Julian Cole ran a copper pipe into the tree to save it from bulldozers!","The mystery is unraveled! Historian Julian Cole ran a copper pipe into the tree to save it from bulldozers!","At last, the truth comes out: Historian Julian Cole ran a copper pipe into the tree to save it from bulldozers!","Case resolved! Here is what happened: Historian Julian Cole ran a copper pipe into the tree to save it from bulldozers!"],"hints":["Pay attention to where Historian Julian Cole was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_064';
DELETE FROM public.case_events WHERE case_id = 'story_064';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '62f37248-98af-5541-aade-d6c6d7744dc2',
  'story_064',
  'Julian Cole',
  'Local Historian & Archivist',
  'Passionate, eccentric, tweed jacket, carrying village historical registers',
  'This oak has stood for three hundred years. The dead have anchored their voices to its sacred heartwood.',
  'He ran thirty feet of copper plumbing pipe through an old drainage ditch into the tree.',
  'In the church archives cataloging birth records',
  'Leader of the "Save the Blackwood Oak" preservation committee',
  'The hollow trunk of the oak resonates like a natural wooden loudspeaker.',
  'Did not notice copper plumbing solder drops left on the root cellar floor.',
  '📚',
  '["This oak has stood for three hundred years. The dead have anchored their voices to its sacred heartwood.","\"This oak has stood for three hundred years. The dead have anchored their voices to its sacred heartwood.\"","Listen to me: This oak has stood for three hundred years. The dead have anchored their voices to its sacred heartwood.","I tell you the truth: This oak has stood for three hundred years. The dead have anchored their voices to its sacred heartwood."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '45fd9356-9eed-5f1f-a276-c1837773802b',
  'story_064',
  'Mayor Frank Vance',
  'Town Council Mayor',
  'Greedy, pragmatic, wearing a business suit, wanting to build a highway',
  'This rotten old tree is a traffic hazard. We are bringing in chainsaws tomorrow morning.',
  'He took kickbacks from highway construction contractors.',
  'In town hall reviewing highway bulldozing permits',
  'Proponent of destroying the historic courtyard tree',
  'The tree was valued as worthless timber by municipal surveyors.',
  'Did not know the entire village was terrified of the whispers.',
  '🏛️',
  '["This rotten old tree is a traffic hazard. We are bringing in chainsaws tomorrow morning.","\"This rotten old tree is a traffic hazard. We are bringing in chainsaws tomorrow morning.\"","Listen to me: This rotten old tree is a traffic hazard. We are bringing in chainsaws tomorrow morning.","I tell you the truth: This rotten old tree is a traffic hazard. We are bringing in chainsaws tomorrow morning."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '158db76e-bda2-5bf0-baba-b1552647cc32',
  'story_064',
  'Martha Higgins',
  'Village Elder',
  'Devout, fearful, clutching a wooden rosary and candle',
  'I heard my grandfather’s name called from the bark! He said: "Do not strike the wood."',
  'She was leaving floral wreaths at the roots of the oak every morning.',
  'In the church pews praying for the village',
  'Elder who mobilized the villagers to block the bulldozers',
  'The voices only whisper during the evening twilight between 6:00 PM and 7:00 PM.',
  'Could not hear the acoustic pipe resonating in the hollow trunk.',
  '👵',
  '["I heard my grandfather’s name called from the bark! He said: \"Do not strike the wood.\"","\"I heard my grandfather’s name called from the bark! He said: \"Do not strike the wood.\"\"","Listen to me: I heard my grandfather’s name called from the bark! He said: \"Do not strike the wood.\"","I tell you the truth: I heard my grandfather’s name called from the bark! He said: \"Do not strike the wood.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '30b355c5-1a42-58f9-992d-38dabfab858c',
  'story_064',
  'Detective Thomas Reed',
  'Acoustic Forensic Specialist',
  'Quiet, analytical, carries an endoscope inspection camera and sound meters',
  'Wood does not vocalize human phonemes. We are looking at a subterranean speaking tube.',
  'Studied acoustic communication systems in military forts.',
  'Arrived in the courtyard with sound measurement equipment at 5:30 PM',
  'Investigating civil unrest and fraudulent haunting claims',
  'The sound has an acoustic metallic echo consistent with a copper conduit.',
  'Did not immediately locate where the pipe terminated in the root cellar.',
  '🔍',
  '["Wood does not vocalize human phonemes. We are looking at a subterranean speaking tube.","\"Wood does not vocalize human phonemes. We are looking at a subterranean speaking tube.\"","Listen to me: Wood does not vocalize human phonemes. We are looking at a subterranean speaking tube.","I tell you the truth: Wood does not vocalize human phonemes. We are looking at a subterranean speaking tube."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5fedceac-a720-5f87-880d-47345a549e58',
  'story_064',
  'ev_1',
  1,
  '06:00 PM',
  'A soft, resonant whisper echoes from the hollow trunk: "Thomas Higgins... Mary Vance... protect the soil..."',
  'A soft, resonant whisper echoes from the hollow trunk: "Thomas Higgins... Mary Vance... protect the soil..."',
  'The hollow tree was acting as an acoustic speaker amplifying human speech.',
  'Hollow Oak Trunk',
  'Massive 300-year-old oak tree with a hollow interior cavity four feet wide.',
  '["Stone Well","Church Spire","Cave Entrance"]'::jsonb,
  'Hollow Oak Trunk',
  '["hollow oak trunk","tree","oak","hollow tree","trunk","hollow oak"]'::jsonb,
  'A giant living wooden plant with branches, leaves, and an empty opening inside its trunk.',
  'ev_2',
  true,
  '{"descriptions":["A soft, resonant whisper echoes from the hollow trunk: \"Thomas Higgins... Mary Vance... protect the soil...\"","At 06:00 PM: A soft, resonant whisper echoes from the hollow trunk: \"Thomas Higgins... Mary Vance... protect the soil...\"","Notice this clue: A soft, resonant whisper echoes from the hollow trunk: \"Thomas Higgins... Mary Vance... protect the soil...\""],"hints":["A giant living wooden plant with branches, leaves, and an empty opening inside its trunk.","Clue hint: Think about hollow oak trunk.","Search for: the hollow tree was acting as an acoustic speaker amplifying human speech."],"clues":["Hollow Oak Trunk","Item: Hollow Oak Trunk","Clue Word: Hollow Oak Trunk"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3a45f73b-a388-5d2e-b232-565d888f2a1c',
  'story_064',
  'ev_2',
  2,
  '06:10 PM',
  'A two-inch copper plumbing pipe terminates inside the upper trunk cavity.',
  'A two-inch copper plumbing pipe terminates inside the upper trunk cavity.',
  'Sound was piped directly into the tree from an underground conduit.',
  'Copper Speaking Tube',
  'Rigid copper water pipe flared into an acoustic horn inside the hollow wood.',
  '["Garden Hose","Drain Pipe","Electric Cable"]'::jsonb,
  'Copper Speaking Tube',
  '["copper speaking tube","pipe","speaking tube","copper pipe","tube"]'::jsonb,
  'A hollow shiny metal pipe used to carry water or speak voices between rooms.',
  'ev_3',
  false,
  '{"descriptions":["A two-inch copper plumbing pipe terminates inside the upper trunk cavity.","At 06:10 PM: A two-inch copper plumbing pipe terminates inside the upper trunk cavity.","Notice this clue: A two-inch copper plumbing pipe terminates inside the upper trunk cavity."],"hints":["A hollow shiny metal pipe used to carry water or speak voices between rooms.","Clue hint: Think about copper speaking tube.","Search for: sound was piped directly into the tree from an underground conduit."],"clues":["Copper Speaking Tube","Item: Copper Speaking Tube","Clue Word: Copper Speaking Tube"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '24a2a538-05b2-5ab8-9976-ff613a5ff9a7',
  'story_064',
  'ev_3',
  3,
  '06:15 PM',
  'An endoscope fiber-optic inspection camera reveals the flared copper pipe hidden in bark.',
  'An endoscope fiber-optic inspection camera reveals the flared copper pipe hidden in bark.',
  'Camera footage proved the voices were transmitted from an external source.',
  'Endoscope Camera Screen',
  'Digital video feed showing the brass horn opening inside the hollow trunk.',
  '["Flashlight","Microscope","Magnifying Glass"]'::jsonb,
  'Endoscope Camera Screen',
  '["endoscope camera screen","endoscope","camera","screen","video feed"]'::jsonb,
  'A long thin flexible tube with a tiny light and camera used to see inside small holes.',
  'ev_4',
  false,
  '{"descriptions":["An endoscope fiber-optic inspection camera reveals the flared copper pipe hidden in bark.","At 06:15 PM: An endoscope fiber-optic inspection camera reveals the flared copper pipe hidden in bark.","Notice this clue: An endoscope fiber-optic inspection camera reveals the flared copper pipe hidden in bark."],"hints":["A long thin flexible tube with a tiny light and camera used to see inside small holes.","Clue hint: Think about endoscope camera screen.","Search for: camera footage proved the voices were transmitted from an external source."],"clues":["Endoscope Camera Screen","Item: Endoscope Camera Screen","Clue Word: Endoscope Camera Screen"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e781eda4-d07a-5b46-99c3-21cf83d82f5c',
  'story_064',
  'ev_4',
  4,
  '06:20 PM',
  'An acoustic funnel megaphone is found attached to the other end of the pipe in the cellar.',
  'An acoustic funnel megaphone is found attached to the other end of the pipe in the cellar.',
  'Julian spoke into the funnel in the church root cellar to project his voice.',
  'Brass Funnel Megaphone',
  'Conical brass megaphone clamped to the root cellar wall conduit.',
  '["Microphone","Speaker","Walkie Talkie"]'::jsonb,
  'Brass Funnel Megaphone',
  '["brass funnel megaphone","megaphone","funnel","brass funnel","cone"]'::jsonb,
  'A cone-shaped metal horn you speak into to make your voice louder.',
  'ev_5',
  false,
  '{"descriptions":["An acoustic funnel megaphone is found attached to the other end of the pipe in the cellar.","At 06:20 PM: An acoustic funnel megaphone is found attached to the other end of the pipe in the cellar.","Notice this clue: An acoustic funnel megaphone is found attached to the other end of the pipe in the cellar."],"hints":["A cone-shaped metal horn you speak into to make your voice louder.","Clue hint: Think about brass funnel megaphone.","Search for: julian spoke into the funnel in the church root cellar to project his voice."],"clues":["Brass Funnel Megaphone","Item: Brass Funnel Megaphone","Clue Word: Brass Funnel Megaphone"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '93e5e32f-4808-5c1a-99fa-a1edd86f0433',
  'story_064',
  'ev_5',
  5,
  '06:35 PM',
  'A handwritten village cemetery ledger containing forty-year-old death records is seized.',
  'A handwritten village cemetery ledger containing forty-year-old death records is seized.',
  'Julian read names directly from the parish death registry to convince elders.',
  'Parish Death Registry',
  'Leather historical ledger with highlighted names matching the tree’s whispers.',
  '["Town Charter","Bible","Diary"]'::jsonb,
  'Parish Death Registry',
  '["parish death registry","registry","death registry","ledger","parish records"]'::jsonb,
  'A bound official record book listing people who died in a village long ago.',
  'ev_6',
  true,
  '{"descriptions":["A handwritten village cemetery ledger containing forty-year-old death records is seized.","At 06:35 PM: A handwritten village cemetery ledger containing forty-year-old death records is seized.","Notice this clue: A handwritten village cemetery ledger containing forty-year-old death records is seized."],"hints":["A bound official record book listing people who died in a village long ago.","Clue hint: Think about parish death registry.","Search for: julian read names directly from the parish death registry to convince elders."],"clues":["Parish Death Registry","Item: Parish Death Registry","Clue Word: Parish Death Registry"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '67c3202c-b6f0-5a1f-8499-10d23df82b2a',
  'story_064',
  'ev_6',
  6,
  '06:50 PM',
  'Fresh lead-tin solder droplets are found on the dirt floor of the church root cellar.',
  'Fresh lead-tin solder droplets are found on the dirt floor of the church root cellar.',
  'Julian soldered the copper pipe sections together two days prior.',
  'Solder Droplets',
  'Shiny metallic beads of 60/40 plumbing solder with flux residue.',
  '["Silver Coins","Lead Pellets","Mercury Drops"]'::jsonb,
  'Solder Droplets',
  '["solder droplets","solder","metal drops","plumbing solder"]'::jsonb,
  'Tiny shiny drops of melted soft metal used to join plumbing pipes together.',
  'ev_7',
  false,
  '{"descriptions":["Fresh lead-tin solder droplets are found on the dirt floor of the church root cellar.","At 06:50 PM: Fresh lead-tin solder droplets are found on the dirt floor of the church root cellar.","Notice this clue: Fresh lead-tin solder droplets are found on the dirt floor of the church root cellar."],"hints":["Tiny shiny drops of melted soft metal used to join plumbing pipes together.","Clue hint: Think about solder droplets.","Search for: julian soldered the copper pipe sections together two days prior."],"clues":["Solder Droplets","Item: Solder Droplets","Clue Word: Solder Droplets"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8c6632b0-4775-5873-ab59-e5974fd71378',
  'story_064',
  'ev_7',
  7,
  '07:15 PM',
  'A highway construction contract showing three million dollars in bulldozing bids is uncovered.',
  'A highway construction contract showing three million dollars in bulldozing bids is uncovered.',
  'The mayor’s secret motive to destroy the historic courtyard for commercial gain.',
  'Highway Construction Contract',
  'Town council documents approving the demolition of the square and oak tree.',
  '["Tree Permit","Tax Bill","Receipt"]'::jsonb,
  'Highway Construction Contract',
  '["highway construction contract","contract","highway contract","demolition permit","document"]'::jsonb,
  'An official business agreement to bulldoze an area and pave a wide road.',
  'ev_8',
  false,
  '{"descriptions":["A highway construction contract showing three million dollars in bulldozing bids is uncovered.","At 07:15 PM: A highway construction contract showing three million dollars in bulldozing bids is uncovered.","Notice this clue: A highway construction contract showing three million dollars in bulldozing bids is uncovered."],"hints":["An official business agreement to bulldoze an area and pave a wide road.","Clue hint: Think about highway construction contract.","Search for: the mayor’s secret motive to destroy the historic courtyard for commercial gain."],"clues":["Highway Construction Contract","Item: Highway Construction Contract","Clue Word: Highway Construction Contract"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '69630722-6630-51a8-aaeb-6cd644d3cf60',
  'story_064',
  'ev_8',
  8,
  '07:30 PM',
  'A portable propane plumber’s torch is tucked behind the root cellar potato bins.',
  'A portable propane plumber’s torch is tucked behind the root cellar potato bins.',
  'The tool used by Julian to heat and bend the copper acoustic conduit.',
  'Plumber Torch',
  'Blue handheld gas torch with blackened brass nozzle in the root cellar.',
  '["Lighter","Flashlight","Candle"]'::jsonb,
  'Plumber Torch',
  '["plumber torch","torch","gas torch","propane torch"]'::jsonb,
  'A small metal tool that shoots a hot blue flame used by plumbers to melt solder.',
  NULL,
  true,
  '{"descriptions":["A portable propane plumber’s torch is tucked behind the root cellar potato bins.","At 07:30 PM: A portable propane plumber’s torch is tucked behind the root cellar potato bins.","Notice this clue: A portable propane plumber’s torch is tucked behind the root cellar potato bins."],"hints":["A small metal tool that shoots a hot blue flame used by plumbers to melt solder.","Clue hint: Think about plumber torch.","Search for: the tool used by julian to heat and bend the copper acoustic conduit."],"clues":["Plumber Torch","Item: Plumber Torch","Clue Word: Plumber Torch"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_065 — THE SEANCE IN ROOM 9
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_065',
  'The Seance in Room 9',
  'Supernatural',
  'The Victorian Parlor of Room 9, velvet curtains, round mahogany pedestal table, flickering beeswax candles',
  'During a midnight séance, the heavy mahogany table floated three feet into the air, and a chalk slate wrote the date of an unsolved murder.',
  '[{"name":"Madame Helena Vance","role":"Celebrity Spiritualist Medium","alibi":"Seated at the séance table holding hands in the circle","avatar":"🔮"},{"name":"Lady Beatrice Sterling","role":"Grieving Wealthy Widow","alibi":"Seated in the séance circle holding hands","avatar":"👵"},{"name":"Thomas Higgins","role":"Parlor Apprentice & Stooge","alibi":"In the shadows of Room 9","avatar":"🕯️"},{"name":"Detective Frank Cole","role":"Magical Illusion & Fraud Investigator","alibi":"Sitting as an observer in the back of Room 9","avatar":"🔍"}]'::jsonb,
  'Fraudulent medium Madame Helena Vance rigged the séance room. She used an electromagnetic floor hoist controlled by foot pedals in her shoes to float the iron-weighted table, and used a magnetic ring beneath the wooden slate to guide a chalk pencil containing iron filings, faking ghostly spirit writing.',
  'Medium Madame Helena Vance',
  'Helena wanted to swindle a wealthy widow out of a hundred thousand dollars by faking contact with her dead son.',
  '[{"time":"11:00 PM","event":"Lady Beatrice arrives; the hundred-thousand-dollar check is shown on the mantel."},{"time":"11:45 PM","event":"The séance circle links hands around the round mahogany table in dim candlelight."},{"time":"11:58 PM","event":"Thomas engages the floor electromagnet; the table levitates three feet into the air."},{"time":"12:00 AM","event":"Helena uses her magnetic ring beneath the slate to write Edward’s name in iron-chalk."},{"time":"12:15 AM","event":"Detective Cole switches on the room lights and waves a magnetic sensor over the table."}]'::jsonb,
  '[{"id":"ev1","title":"Industrial Electromagnet Under Carpet","detail":"Powered by hidden 24V batteries to levitate the iron-weighted table."},{"id":"ev2","title":"Neodymium Magnetic Ring on Helena’s Finger","detail":"Used to guide the iron-chalk across the spirit slate from beneath the wood."},{"id":"ev3","title":"Iron-Powder Chalk Sticks","detail":"Chemical analysis confirms 50% iron oxide filings designed for magnetic manipulation."},{"id":"ev4","title":"One-Hundred-Thousand-Dollar Bank Check","detail":"Confirms the financial swindle targeting the vulnerable grieving widow."}]'::jsonb,
  '[{"order":1,"title":"Floating Mahogany Table","text":"Eighty-pound parlor table levitated into the air by an electromagnetic field."},{"order":2,"title":"Magnetic Spirit Slate","text":"Chalkboard that wrote ghostly words using hidden magnetic attraction."},{"order":3,"title":"Neodymium Magnetic Ring","text":"Ring worn by the medium to pull the iron chalk across the slate."},{"order":4,"title":"Iron-Powder Chalk","text":"Specially fabricated chalk sticks containing magnetic metal particles."},{"order":5,"title":"Floor Electromagnet","text":"Powerful copper coil hidden beneath the floorboards that lifted the table."},{"order":6,"title":"Cashier Check","text":"One-hundred-thousand-dollar swindle target recovered from the mantel."}]'::jsonb,
  'The candles flickered in the room.: Caused by drafty Victorian sash windows, not a spiritual breeze.; Apprentice Thomas rang a Tibetan bell.: Used for theatrical misdirection to cover the hum of the electric coils.',
  'Claim a genuine poltergeist manifested in Room 9 or blame the grieving widow.',
  'NORMAL',
  'Did spirits levitate the table and write on the slate, or was an ingenious mechanical illusion at work?',
  '[{"character":"Madame Helena Vance","secret":"She has a concealed iron-powder chalk stick and a magnetic finger ring."},{"character":"Lady Beatrice Sterling","secret":"She was carrying a cashier’s check for one hundred thousand dollars to donate to Helena."},{"character":"Thomas Higgins","secret":"He operated the 24-volt battery power switch behind the wall tapestry."},{"character":"Detective Frank Cole","secret":"Member of the Magic Circle dedicated to debunking fake psychic mediums."}]'::jsonb,
  '[{"lead":"The candles flickered in the room.","explanation":"Caused by drafty Victorian sash windows, not a spiritual breeze."},{"lead":"Apprentice Thomas rang a Tibetan bell.","explanation":"Used for theatrical misdirection to cover the hum of the electric coils."}]'::jsonb,
  '{"wrongTheories":["The spirit of young Edward Sterling materialized to speak to his grieving mother.","A genuine poltergeist phenomenon was unleashed by the occult incantations."],"correctTheory":"Medium Madame Helena Vance used an industrial floor electromagnet to levitate an iron-weighted table and guided iron-powder chalk across a slate using a neodymium magnetic ring to fake contact with a dead son and swindle a grieving widow out of one hundred thousand dollars."}'::jsonb,
  'Medium Helena Vance used a floor electromagnet and a magnetic ring to fake the spirits!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Cole turned on the lights, demonstrated the magnetic trick to Lady Beatrice, and seized the cashier’s check. Helena Vance and her accomplice were arrested for grand larceny and fraud."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Lady Beatrice handed over the hundred-thousand-dollar check in tears of gratitude. Helena packed her magnets and moved to another city to swindle more victims."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The séance was documented by paranormal researchers as the first verified table levitation. Helena became an international celebrity medium."}]'::jsonb,
  '{"intros":["During a midnight séance, the heavy mahogany table floated three feet into the air, and a chalk slate wrote the date of an unsolved murder.","Case file story_065: During a midnight séance, the heavy mahogany table floated three feet into the air, and a chalk slate wrote the date of an unsolved murder. Look closely at every clue.","Trouble begins in The Victorian Parlor of Room 9, velvet curtains, round mahogany pedestal table, flickering beeswax candles. During a midnight séance, the heavy mahogany table floated three feet into the air, and a chalk slate wrote the date of an unsolved murder.","The mystery starts now. During a midnight séance, the heavy mahogany table floated three feet into the air, and a chalk slate wrote the date of an unsolved murder. Can you solve it?"],"reveals":["Medium Helena Vance used a floor electromagnet and a magnetic ring to fake the spirits!","The mystery is unraveled! Medium Helena Vance used a floor electromagnet and a magnetic ring to fake the spirits!","At last, the truth comes out: Medium Helena Vance used a floor electromagnet and a magnetic ring to fake the spirits!","Case resolved! Here is what happened: Medium Helena Vance used a floor electromagnet and a magnetic ring to fake the spirits!"],"hints":["Pay attention to where Medium Madame Helena Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_065';
DELETE FROM public.case_events WHERE case_id = 'story_065';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fbf46364-4e05-5dd7-b121-1ea4a4dcedfb',
  'story_065',
  'Madame Helena Vance',
  'Celebrity Spiritualist Medium',
  'Dramatic, charismatic, wearing black lace shawls and rings on every finger',
  'The spirit of young Edward has entered the circle. His spectral energy lifted the wood!',
  'She has a concealed iron-powder chalk stick and a magnetic finger ring.',
  'Seated at the séance table holding hands in the circle',
  'Medium hired to contact the widow’s deceased son',
  'The table base conceals a heavy steel core that responds to an electromagnet in the floor.',
  'Did not know an infrared camera was recording under the table velvet fringe.',
  '🔮',
  '["The spirit of young Edward has entered the circle. His spectral energy lifted the wood!","\"The spirit of young Edward has entered the circle. His spectral energy lifted the wood!\"","Listen to me: The spirit of young Edward has entered the circle. His spectral energy lifted the wood!","I tell you the truth: The spirit of young Edward has entered the circle. His spectral energy lifted the wood!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4509b3db-19a4-53b3-8c17-87957e034c64',
  'story_065',
  'Lady Beatrice Sterling',
  'Grieving Wealthy Widow',
  'Frail, weeping into a lace handkerchief, desperate to speak to her son',
  'Edward wrote his childhood nickname on the slate! It is truly a miracle from beyond!',
  'She was carrying a cashier’s check for one hundred thousand dollars to donate to Helena.',
  'Seated in the séance circle holding hands',
  'Target of the high-stakes spiritualist swindle',
  'The slate was wiped clean with vinegar before the lights were extinguished.',
  'Did not understand how magnetism can move chalk through slate wood.',
  '👵',
  '["Edward wrote his childhood nickname on the slate! It is truly a miracle from beyond!","\"Edward wrote his childhood nickname on the slate! It is truly a miracle from beyond!\"","Listen to me: Edward wrote his childhood nickname on the slate! It is truly a miracle from beyond!","I tell you the truth: Edward wrote his childhood nickname on the slate! It is truly a miracle from beyond!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8a1537bc-e5e8-5a36-a2dc-ec3133fa9a0d',
  'story_065',
  'Thomas Higgins',
  'Parlor Apprentice & Stooge',
  'Quiet, nervous, hiding in the dark corner behind the velvet drapes',
  'I just tended the candles and played the Tibetan bell chime when told.',
  'He operated the 24-volt battery power switch behind the wall tapestry.',
  'In the shadows of Room 9',
  'Accomplice who engaged the electric floor electromagnet',
  'The table weighs eighty pounds and requires forty amps to lift smoothly.',
  'Was terrified that the police would arrest him for grand fraud.',
  '🕯️',
  '["I just tended the candles and played the Tibetan bell chime when told.","\"I just tended the candles and played the Tibetan bell chime when told.\"","Listen to me: I just tended the candles and played the Tibetan bell chime when told.","I tell you the truth: I just tended the candles and played the Tibetan bell chime when told."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1ab84918-d9bb-5671-b045-01d49a5f567d',
  'story_065',
  'Detective Frank Cole',
  'Magical Illusion & Fraud Investigator',
  'Skeptical, sharp, carries a Gauss magnetic field meter and flashlight',
  'Spirits don’t pull forty amps of direct current from heavy-duty storage batteries.',
  'Member of the Magic Circle dedicated to debunking fake psychic mediums.',
  'Sitting as an observer in the back of Room 9',
  'Leading the investigation into fraudulent spiritualist extortion',
  'Found magnetic flux readings of 2.5 Tesla beneath the center carpet.',
  'Did not immediately locate Helena’s magnetic signet ring.',
  '🔍',
  '["Spirits don’t pull forty amps of direct current from heavy-duty storage batteries.","\"Spirits don’t pull forty amps of direct current from heavy-duty storage batteries.\"","Listen to me: Spirits don’t pull forty amps of direct current from heavy-duty storage batteries.","I tell you the truth: Spirits don’t pull forty amps of direct current from heavy-duty storage batteries."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0e824f88-2adc-57a7-9a5e-333c4f71bb3a',
  'story_065',
  'ev_1',
  1,
  '11:58 PM',
  'A heavy eighty-pound mahogany round table rises three feet off the floor without touching human hands.',
  'A heavy eighty-pound mahogany round table rises three feet off the floor without touching human hands.',
  'The table had a hidden iron core lifted by an industrial electromagnet under the floor.',
  'Floating Mahogany Table',
  'Round pedestal table with a 50-pound iron core plate concealed in the base.',
  '["Floating Chair","Ghost Orb","Moving Curtains"]'::jsonb,
  'Floating Mahogany Table',
  '["floating mahogany table","table","floating table","mahogany table","seance table"]'::jsonb,
  'A piece of furniture with legs and a flat wooden top that floated in the air.',
  'ev_2',
  true,
  '{"descriptions":["A heavy eighty-pound mahogany round table rises three feet off the floor without touching human hands.","At 11:58 PM: A heavy eighty-pound mahogany round table rises three feet off the floor without touching human hands.","Notice this clue: A heavy eighty-pound mahogany round table rises three feet off the floor without touching human hands."],"hints":["A piece of furniture with legs and a flat wooden top that floated in the air.","Clue hint: Think about floating mahogany table.","Search for: the table had a hidden iron core lifted by an industrial electromagnet under the floor."],"clues":["Floating Mahogany Table","Item: Floating Mahogany Table","Clue Word: Floating Mahogany Table"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f198a2b5-3d3c-5aec-822b-be0c1ec6f580',
  'story_065',
  'ev_2',
  2,
  '12:00 AM',
  'A piece of white chalk writes words on a framed slate without anyone touching the chalk.',
  'A piece of white chalk writes words on a framed slate without anyone touching the chalk.',
  'The chalk contained iron filings and was pulled across the slate by a magnet under the wood.',
  'Magnetic Spirit Slate',
  'School slate with iron-powder chalk writing guided by a neodymium magnet.',
  '["Paper Note","Mirror Writing","Typewriter"]'::jsonb,
  'Magnetic Spirit Slate',
  '["magnetic spirit slate","slate","spirit slate","magnetic slate","chalk board"]'::jsonb,
  'A small chalkboard framed in wood used for writing with chalk sticks.',
  'ev_3',
  false,
  '{"descriptions":["A piece of white chalk writes words on a framed slate without anyone touching the chalk.","At 12:00 AM: A piece of white chalk writes words on a framed slate without anyone touching the chalk.","Notice this clue: A piece of white chalk writes words on a framed slate without anyone touching the chalk."],"hints":["A small chalkboard framed in wood used for writing with chalk sticks.","Clue hint: Think about magnetic spirit slate.","Search for: the chalk contained iron filings and was pulled across the slate by a magnet under the wood."],"clues":["Magnetic Spirit Slate","Item: Magnetic Spirit Slate","Clue Word: Magnetic Spirit Slate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '58df2832-f2c6-598d-844e-e4d255d648a1',
  'story_065',
  'ev_3',
  3,
  '12:02 AM',
  'A high-powered neodymium magnetic signet ring is worn on Helena’s right middle finger.',
  'A high-powered neodymium magnetic signet ring is worn on Helena’s right middle finger.',
  'Helena dragged the ring beneath the thin wooden slate to move the iron chalk on top.',
  'Neodymium Magnetic Ring',
  'Silver ring set with a powerful rare-earth neodymium magnet instead of a stone.',
  '["Gold Ring","Emerald Ring","Brass Ring"]'::jsonb,
  'Neodymium Magnetic Ring',
  '["neodymium magnetic ring","ring","magnetic ring","neodymium ring","signet ring"]'::jsonb,
  'A circular band of metal worn on a finger that strongly attracts steel and iron.',
  'ev_4',
  false,
  '{"descriptions":["A high-powered neodymium magnetic signet ring is worn on Helena’s right middle finger.","At 12:02 AM: A high-powered neodymium magnetic signet ring is worn on Helena’s right middle finger.","Notice this clue: A high-powered neodymium magnetic signet ring is worn on Helena’s right middle finger."],"hints":["A circular band of metal worn on a finger that strongly attracts steel and iron.","Clue hint: Think about neodymium magnetic ring.","Search for: helena dragged the ring beneath the thin wooden slate to move the iron chalk on top."],"clues":["Neodymium Magnetic Ring","Item: Neodymium Magnetic Ring","Clue Word: Neodymium Magnetic Ring"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '547ec493-b6a3-5f67-87e2-63d41615ea73',
  'story_065',
  'ev_4',
  4,
  '12:05 AM',
  'Specialized sticks of white chalk blended with 50% pulverized black iron oxide filings.',
  'Specialized sticks of white chalk blended with 50% pulverized black iron oxide filings.',
  'The chalk was magnetically attracted through the thickness of the slate board.',
  'Iron-Powder Chalk',
  'Sticks of chalk that cling firmly to any magnet due to iron content.',
  '["Ordinary Chalk","Pastel Stick","Charcoal"]'::jsonb,
  'Iron-Powder Chalk',
  '["iron-powder chalk","chalk","iron chalk","magnetic chalk","powder chalk"]'::jsonb,
  'White writing sticks mixed with metal powder that stick to magnets.',
  'ev_5',
  false,
  '{"descriptions":["Specialized sticks of white chalk blended with 50% pulverized black iron oxide filings.","At 12:05 AM: Specialized sticks of white chalk blended with 50% pulverized black iron oxide filings.","Notice this clue: Specialized sticks of white chalk blended with 50% pulverized black iron oxide filings."],"hints":["White writing sticks mixed with metal powder that stick to magnets.","Clue hint: Think about iron-powder chalk.","Search for: the chalk was magnetically attracted through the thickness of the slate board."],"clues":["Iron-Powder Chalk","Item: Iron-Powder Chalk","Clue Word: Iron-Powder Chalk"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9162186e-feee-5014-838c-2d50c79b1fed',
  'story_065',
  'ev_5',
  5,
  '12:10 AM',
  'A massive 24-volt industrial lifting electromagnet is embedded beneath the floorboards.',
  'A massive 24-volt industrial lifting electromagnet is embedded beneath the floorboards.',
  'The magnet was scavenged from an industrial junkyard crane to lift the table.',
  'Floor Electromagnet',
  'Copper-wound iron core magnet rated at 500 pounds of magnetic lifting force.',
  '["Car Motor","Battery Charger","Heater Coil"]'::jsonb,
  'Floor Electromagnet',
  '["floor electromagnet","electromagnet","magnet","floor magnet","lifting magnet"]'::jsonb,
  'A large piece of iron wrapped in copper wire that becomes magnetic when electrified.',
  'ev_6',
  true,
  '{"descriptions":["A massive 24-volt industrial lifting electromagnet is embedded beneath the floorboards.","At 12:10 AM: A massive 24-volt industrial lifting electromagnet is embedded beneath the floorboards.","Notice this clue: A massive 24-volt industrial lifting electromagnet is embedded beneath the floorboards."],"hints":["A large piece of iron wrapped in copper wire that becomes magnetic when electrified.","Clue hint: Think about floor electromagnet.","Search for: the magnet was scavenged from an industrial junkyard crane to lift the table."],"clues":["Floor Electromagnet","Item: Floor Electromagnet","Clue Word: Floor Electromagnet"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0e30db36-5a42-5936-9513-cf380f1d3a74',
  'story_065',
  'ev_6',
  6,
  '12:15 AM',
  'A digital Gauss magnetic field meter beeps loudly, reading 2.8 Tesla near the table.',
  'A digital Gauss magnetic field meter beeps loudly, reading 2.8 Tesla near the table.',
  'Scientific proof of a massive artificial electromagnetic field in the center of the room.',
  'Gauss Meter',
  'Handheld electronic meter displaying extreme magnetic flux density.',
  '["Radiation Counter","Thermometer","Audio Meter"]'::jsonb,
  'Gauss Meter',
  '["gauss meter","meter","magnetic meter","field meter"]'::jsonb,
  'A handheld scientific device that measures the strength of invisible magnetic fields.',
  'ev_7',
  false,
  '{"descriptions":["A digital Gauss magnetic field meter beeps loudly, reading 2.8 Tesla near the table.","At 12:15 AM: A digital Gauss magnetic field meter beeps loudly, reading 2.8 Tesla near the table.","Notice this clue: A digital Gauss magnetic field meter beeps loudly, reading 2.8 Tesla near the table."],"hints":["A handheld scientific device that measures the strength of invisible magnetic fields.","Clue hint: Think about gauss meter.","Search for: scientific proof of a massive artificial electromagnetic field in the center of the room."],"clues":["Gauss Meter","Item: Gauss Meter","Clue Word: Gauss Meter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3b9d4f2d-f8b0-5af3-9151-2112b9c12b7a',
  'story_065',
  'ev_7',
  7,
  '12:30 AM',
  'A certified cashier’s check for one hundred thousand dollars made out to Helena Vance is on the mantel.',
  'A certified cashier’s check for one hundred thousand dollars made out to Helena Vance is on the mantel.',
  'The payout Helena was moments away from claiming from the weeping widow.',
  'Cashier Check',
  'Bank draft for $100,000 drawn on First National Bank by Beatrice Sterling.',
  '["Will","Receipt","Contract"]'::jsonb,
  'Cashier Check',
  '["cashier check","check","bank draft","money check"]'::jsonb,
  'A secure paper document issued by a bank guaranteeing payment of money.',
  'ev_8',
  false,
  '{"descriptions":["A certified cashier’s check for one hundred thousand dollars made out to Helena Vance is on the mantel.","At 12:30 AM: A certified cashier’s check for one hundred thousand dollars made out to Helena Vance is on the mantel.","Notice this clue: A certified cashier’s check for one hundred thousand dollars made out to Helena Vance is on the mantel."],"hints":["A secure paper document issued by a bank guaranteeing payment of money.","Clue hint: Think about cashier check.","Search for: the payout helena was moments away from claiming from the weeping widow."],"clues":["Cashier Check","Item: Cashier Check","Clue Word: Cashier Check"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '501acbf4-d059-5acf-a2f2-bee25be1df94',
  'story_065',
  'ev_8',
  8,
  '12:45 AM',
  'A concealed 24-volt bank of marine deep-cycle batteries is hidden inside the wall cavity.',
  'A concealed 24-volt bank of marine deep-cycle batteries is hidden inside the wall cavity.',
  'The silent power supply used to energize the floor electromagnet during the séance.',
  'Marine Battery Bank',
  'Twin 12-volt commercial deep-cycle batteries wired in series with a foot pedal.',
  '["Car Battery","Generator","Power Outlet"]'::jsonb,
  'Marine Battery Bank',
  '["marine battery bank","batteries","battery bank","marine battery","power supply"]'::jsonb,
  'Heavy rechargeable electrical storage boxes connected together to supply strong voltage.',
  NULL,
  true,
  '{"descriptions":["A concealed 24-volt bank of marine deep-cycle batteries is hidden inside the wall cavity.","At 12:45 AM: A concealed 24-volt bank of marine deep-cycle batteries is hidden inside the wall cavity.","Notice this clue: A concealed 24-volt bank of marine deep-cycle batteries is hidden inside the wall cavity."],"hints":["Heavy rechargeable electrical storage boxes connected together to supply strong voltage.","Clue hint: Think about marine battery bank.","Search for: the silent power supply used to energize the floor electromagnet during the séance."],"clues":["Marine Battery Bank","Item: Marine Battery Bank","Clue Word: Marine Battery Bank"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_066 — THE PHANTOM STATIONMASTER
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_066',
  'The Phantom Stationmaster',
  'Supernatural',
  'The Disused Blackwood Junction, overgrown railway platform, rusty signal lanterns, dense mountain fog',
  'Express trains repeatedly stopped at an abandoned mountain siding because a red lantern was waved by a phantom stationmaster who died fifty years ago.',
  '[{"name":"Silas Cole","role":"Veteran Rail Bandit","alibi":"In his trackside tool shed two miles down the line","avatar":"🚂"},{"name":"Henry \"Cinders\" Ross","role":"Locomotive Engineer","alibi":"In the cab of Locomotive 402","avatar":"🔧"},{"name":"Caleb Miller (Deceased 1924)","role":"Historic Stationmaster","alibi":"Buried in the village cemetery three miles away","avatar":"⭐"},{"name":"Inspector James Sterling","role":"Railway Police Detective","alibi":"Riding covertly in the cargo freight car with an assault rifle","avatar":"🔍"}]'::jsonb,
  'Train robber Silas Cole built an automated mechanical mannequin dressed in an antique stationmaster uniform. Controlled by a cable pulley and battery motor, the mannequin swung a red lantern when the train approached, forcing the engineer to execute an emergency brake stop so Silas could raid the rear cargo car.',
  'Train Robber Silas Cole',
  'Silas stopped the night cargo express at the abandoned junction to loot the bullion freight cars.',
  '[{"time":"11:00 PM","event":"Silas rigs the mechanical mannequin on the platform with a red kerosene lantern."},{"time":"11:45 PM","event":"The midnight cargo express approaches the mountain curve at forty miles an hour."},{"time":"11:48 PM","event":"Silas trips the tripwire; the mannequin swings the red lantern back and forth in the fog."},{"time":"11:50 PM","event":"Engineer Ross slams the emergency brakes, halting the train in the dense mist."},{"time":"11:52 PM","event":"Silas and his accomplices blow the lock on the rear cargo car with crowbars."}]'::jsonb,
  '[{"id":"ev1","title":"Automated Mechanical Mannequin","detail":"Fitted with a 12V wiper motor to swing the red lantern and simulate a human signalman."},{"id":"ev2","title":"Aircraft Cable Tripwire System","detail":"Ran 200 feet from the platform into Silas Cole’s hidden blind in the pines."},{"id":"ev3","title":"Crowbar with Cargo Car 14 Paint","detail":"Used by Silas to pop the door lock while the train was stopped at the signal."},{"id":"ev4","title":"Fifty Thousand in Treasury Bonds","detail":"Recovered from Silas’s shack alongside the bicycle used to flee the junction."}]'::jsonb,
  '[{"order":1,"title":"Swinging Red Lantern","text":"Universal stop signal displayed on the platform of an abandoned station."},{"order":2,"title":"Mechanical Mannequin","text":"Department store dummy rigged with an electric motor to pose as the phantom."},{"order":3,"title":"Wiper Motor","text":"Automotive mechanism used to power the repetitive swinging arm motion."},{"order":4,"title":"Steel Cable Pulley","text":"Tripwire system used to trigger the dummy from the woods."},{"order":5,"title":"Heavy Crowbar","text":"Tool used to break open the rear cargo freight car during the stop."},{"order":6,"title":"Federal Bond Sack","text":"Stolen treasury bonds targeted by the mountain railway heist."}]'::jsonb,
  'Engineer Ross saw a ghostly face in the fog.: An optical illusion created by the mannequin’s glass eyes in the lantern glow.; The abandoned station was listed on historic ghost tour maps.: Local legend exploited by the bandit to delay investigation.',
  'Claim the ghost of the 1920 stationmaster was preventing a train crash or blame the track switchman.',
  'NORMAL',
  'Who was waving the red lantern at the abandoned junction and why were trains being forced to stop?',
  '[{"character":"Silas Cole","secret":"He has fifty thousand dollars in stolen federal bank bonds in his trackside shack."},{"character":"Henry \"Cinders\" Ross","secret":"He was terrified of running over a phantom and slammed the emergency brakes."},{"character":"Caleb Miller (Deceased 1924)","secret":"He was celebrated for saving an express train in 1924 by waving his red lantern."},{"character":"Inspector James Sterling","secret":"Investigated three unexplained cargo train stops on the mountain line."}]'::jsonb,
  '[{"lead":"Engineer Ross saw a ghostly face in the fog.","explanation":"An optical illusion created by the mannequin’s glass eyes in the lantern glow."},{"lead":"The abandoned station was listed on historic ghost tour maps.","explanation":"Local legend exploited by the bandit to delay investigation."}]'::jsonb,
  '{"wrongTheories":["The heroic spirit of Caleb Miller returned from 1924 to prevent a catastrophic collision.","A rival railway company staged a protest on the tracks to disrupt the freight schedule."],"correctTheory":"Train robber Silas Cole rigged an automated mechanical mannequin with a car wiper motor to swing a red lantern at the abandoned junction, forcing the express train to emergency-stop so he could pry open the rear cargo car and steal fifty thousand dollars in treasury bonds."}'::jsonb,
  'Bandit Silas Cole rigged the mannequin to stop the train and heist treasury bonds!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Inspector Sterling rode inside the cargo car, followed the bicycle tracks to Silas’s shack, and recovered the bonds. Silas Cole was arrested for armed train robbery and federal grand larceny."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Silas escaped into the mountain wilderness with fifty thousand dollars in bonds. The railway company officially documented the junction as haunted and canceled the night route."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Phantom of Blackwood Junction\" became America’s most famous ghost train story, inspiring movies and books while Silas lived in Florida."}]'::jsonb,
  '{"intros":["Express trains repeatedly stopped at an abandoned mountain siding because a red lantern was waved by a phantom stationmaster who died fifty years ago.","Case file story_066: Express trains repeatedly stopped at an abandoned mountain siding because a red lantern was waved by a phantom stationmaster who died fifty years ago. Look closely at every clue.","Trouble begins in The Disused Blackwood Junction, overgrown railway platform, rusty signal lanterns, dense mountain fog. Express trains repeatedly stopped at an abandoned mountain siding because a red lantern was waved by a phantom stationmaster who died fifty years ago.","The mystery starts now. Express trains repeatedly stopped at an abandoned mountain siding because a red lantern was waved by a phantom stationmaster who died fifty years ago. Can you solve it?"],"reveals":["Bandit Silas Cole rigged the mannequin to stop the train and heist treasury bonds!","The mystery is unraveled! Bandit Silas Cole rigged the mannequin to stop the train and heist treasury bonds!","At last, the truth comes out: Bandit Silas Cole rigged the mannequin to stop the train and heist treasury bonds!","Case resolved! Here is what happened: Bandit Silas Cole rigged the mannequin to stop the train and heist treasury bonds!"],"hints":["Pay attention to where Train Robber Silas Cole was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_066';
DELETE FROM public.case_events WHERE case_id = 'story_066';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ad19d263-a0c7-5a6c-9b83-b5bd1ba2b004',
  'story_066',
  'Silas Cole',
  'Veteran Rail Bandit',
  'Weathered, ruthless, wearing grease-stained denim jacket and carrying cutting torches',
  'Old stationmaster Caleb won’t let trains pass without his red lantern. It’s a phantom curse.',
  'He has fifty thousand dollars in stolen federal bank bonds in his trackside shack.',
  'In his trackside tool shed two miles down the line',
  'Former railway mechanic who knew the junction signal protocols',
  'Railway rules strictly require engineers to emergency-brake when a red lantern is waved.',
  'Did not know he dropped his brass cable winch ratchet on the overgrown platform.',
  '🚂',
  '["Old stationmaster Caleb won’t let trains pass without his red lantern. It’s a phantom curse.","\"Old stationmaster Caleb won’t let trains pass without his red lantern. It’s a phantom curse.\"","Listen to me: Old stationmaster Caleb won’t let trains pass without his red lantern. It’s a phantom curse.","I tell you the truth: Old stationmaster Caleb won’t let trains pass without his red lantern. It’s a phantom curse."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5beae8bd-0fea-57ab-a219-4bf36a1b492b',
  'story_066',
  'Henry "Cinders" Ross',
  'Locomotive Engineer',
  'Veteran train driver, soot on his brow, clutching the emergency air brake lever',
  'I saw the stationmaster clear as day standing in the fog waving his red lantern on Platform 2!',
  'He was terrified of running over a phantom and slammed the emergency brakes.',
  'In the cab of Locomotive 402',
  'Driver of the halted cargo express train',
  'The train lost eighty pounds of air pressure when the emergency brakes locked.',
  'Did not realize armed robbers were opening the rear baggage car while he waited.',
  '🔧',
  '["I saw the stationmaster clear as day standing in the fog waving his red lantern on Platform 2!","\"I saw the stationmaster clear as day standing in the fog waving his red lantern on Platform 2!\"","Listen to me: I saw the stationmaster clear as day standing in the fog waving his red lantern on Platform 2!","I tell you the truth: I saw the stationmaster clear as day standing in the fog waving his red lantern on Platform 2!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9359c0d0-790c-540f-a8bc-ad98fda6b910',
  'story_066',
  'Caleb Miller (Deceased 1924)',
  'Historic Stationmaster',
  'Faithful rail employee who died at his post fifty years ago during a blizzard',
  'Deceased historical figure; stationmaster memorial plaque stands in the overgrown weeds.',
  'He was celebrated for saving an express train in 1924 by waving his red lantern.',
  'Buried in the village cemetery three miles away',
  'The historical persona impersonated by the mechanical dummy',
  'His original uniform had been stolen from the town historical museum.',
  'Could not prevent his heroic memory from being used for armed robbery.',
  '⭐',
  '["Deceased historical figure; stationmaster memorial plaque stands in the overgrown weeds.","\"Deceased historical figure; stationmaster memorial plaque stands in the overgrown weeds.\"","Listen to me: Deceased historical figure; stationmaster memorial plaque stands in the overgrown weeds.","I tell you the truth: Deceased historical figure; stationmaster memorial plaque stands in the overgrown weeds."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '560afe24-468b-5b15-b498-7491251948d8',
  'story_066',
  'Inspector James Sterling',
  'Railway Police Detective',
  'Sharp, relentless, armed with high-powered searchlights and binoculars',
  'Ghosts don’t use aircraft-grade steel cables, electric car wiper motors, and DeWalt batteries.',
  'Investigated three unexplained cargo train stops on the mountain line.',
  'Riding covertly in the cargo freight car with an assault rifle',
  'Leading the rail police counter-heist operation',
  'Found fresh motorized winch tracks and bicycle chain grease on the signal post.',
  'Did not immediately locate where Silas had stashed the stolen bond pouches.',
  '🔍',
  '["Ghosts don’t use aircraft-grade steel cables, electric car wiper motors, and DeWalt batteries.","\"Ghosts don’t use aircraft-grade steel cables, electric car wiper motors, and DeWalt batteries.\"","Listen to me: Ghosts don’t use aircraft-grade steel cables, electric car wiper motors, and DeWalt batteries.","I tell you the truth: Ghosts don’t use aircraft-grade steel cables, electric car wiper motors, and DeWalt batteries."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9c8f7ba7-74ae-5829-ab53-55af43a1f131',
  'story_066',
  'ev_1',
  1,
  '11:48 PM',
  'A swinging red kerosene lantern cuts through the dense mountain fog on Platform 2.',
  'A swinging red kerosene lantern cuts through the dense mountain fog on Platform 2.',
  'The universal railway signal for "STOP IMMEDIATELY" was displayed on the platform.',
  'Swinging Red Lantern',
  'Vintage Dietz railroad lantern with red glass globe burning kerosene fuel.',
  '["White Torch","Green Light","Signal Flare"]'::jsonb,
  'Swinging Red Lantern',
  '["swinging red lantern","lantern","red lantern","railroad lantern","lamp"]'::jsonb,
  'A portable metal light burning oil or kerosene with a red glass shield meaning stop.',
  'ev_2',
  true,
  '{"descriptions":["A swinging red kerosene lantern cuts through the dense mountain fog on Platform 2.","At 11:48 PM: A swinging red kerosene lantern cuts through the dense mountain fog on Platform 2.","Notice this clue: A swinging red kerosene lantern cuts through the dense mountain fog on Platform 2."],"hints":["A portable metal light burning oil or kerosene with a red glass shield meaning stop.","Clue hint: Think about swinging red lantern.","Search for: the universal railway signal for \"stop immediately\" was displayed on the platform."],"clues":["Swinging Red Lantern","Item: Swinging Red Lantern","Clue Word: Swinging Red Lantern"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '18fe7809-dd6b-5270-abbd-dc0b46339733',
  'story_066',
  'ev_2',
  2,
  '11:50 PM',
  'A life-sized mechanical mannequin dressed in a 1920s railway uniform stands on the platform.',
  'A life-sized mechanical mannequin dressed in a 1920s railway uniform stands on the platform.',
  'The "ghost" was a wooden department store mannequin rigged to an electric motor.',
  'Mechanical Mannequin',
  'Fiberglass and wood figure dressed in museum-stolen stationmaster uniform.',
  '["Living Person","Straw Dummy","Cardboard Cutout"]'::jsonb,
  'Mechanical Mannequin',
  '["mechanical mannequin","mannequin","dummy","figure"]'::jsonb,
  'A life-sized human doll made of wood or plastic dressed in clothing.',
  'ev_3',
  false,
  '{"descriptions":["A life-sized mechanical mannequin dressed in a 1920s railway uniform stands on the platform.","At 11:50 PM: A life-sized mechanical mannequin dressed in a 1920s railway uniform stands on the platform.","Notice this clue: A life-sized mechanical mannequin dressed in a 1920s railway uniform stands on the platform."],"hints":["A life-sized human doll made of wood or plastic dressed in clothing.","Clue hint: Think about mechanical mannequin.","Search for: the \"ghost\" was a wooden department store mannequin rigged to an electric motor."],"clues":["Mechanical Mannequin","Item: Mechanical Mannequin","Clue Word: Mechanical Mannequin"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ead222e4-9c03-5d4c-9e36-0ef3661874f3',
  'story_066',
  'ev_3',
  3,
  '11:52 PM',
  'A 12-volt car windshield wiper motor is wired to the mannequin’s articulated wooden arm.',
  'A 12-volt car windshield wiper motor is wired to the mannequin’s articulated wooden arm.',
  'The motor provided the steady, rhythmic back-and-forth swinging motion of the lantern.',
  'Wiper Motor',
  'Automotive 12V gear motor attached to a swinging wooden arm joint.',
  '["Clockwork Spring","Steam Piston","Hand Crank"]'::jsonb,
  'Wiper Motor',
  '["wiper motor","motor","electric motor","gear motor"]'::jsonb,
  'A small electric motor that moves windshield wiper blades back and forth.',
  'ev_4',
  false,
  '{"descriptions":["A 12-volt car windshield wiper motor is wired to the mannequin’s articulated wooden arm.","At 11:52 PM: A 12-volt car windshield wiper motor is wired to the mannequin’s articulated wooden arm.","Notice this clue: A 12-volt car windshield wiper motor is wired to the mannequin’s articulated wooden arm."],"hints":["A small electric motor that moves windshield wiper blades back and forth.","Clue hint: Think about wiper motor.","Search for: the motor provided the steady, rhythmic back-and-forth swinging motion of the lantern."],"clues":["Wiper Motor","Item: Wiper Motor","Clue Word: Wiper Motor"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8fd7a9eb-8d41-529e-8996-ebd342a78e56',
  'story_066',
  'ev_4',
  4,
  '11:55 PM',
  'A 200-foot spool of 1/16-inch steel aircraft cable runs from the platform into the woods.',
  'A 200-foot spool of 1/16-inch steel aircraft cable runs from the platform into the woods.',
  'The mechanical display was triggered by Silas pulling a tripwire from his hideout.',
  'Steel Cable Pulley',
  'Braided steel wire running through miniature brass pulleys in the pine trees.',
  '["Rope","Fishing Line","Electric Cord"]'::jsonb,
  'Steel Cable Pulley',
  '["steel cable pulley","cable","pulley","steel cable","wire"]'::jsonb,
  'A thin, strong metal rope made of twisted steel strands used in aircraft and machinery.',
  'ev_5',
  false,
  '{"descriptions":["A 200-foot spool of 1/16-inch steel aircraft cable runs from the platform into the woods.","At 11:55 PM: A 200-foot spool of 1/16-inch steel aircraft cable runs from the platform into the woods.","Notice this clue: A 200-foot spool of 1/16-inch steel aircraft cable runs from the platform into the woods."],"hints":["A thin, strong metal rope made of twisted steel strands used in aircraft and machinery.","Clue hint: Think about steel cable pulley.","Search for: the mechanical display was triggered by silas pulling a tripwire from his hideout."],"clues":["Steel Cable Pulley","Item: Steel Cable Pulley","Clue Word: Steel Cable Pulley"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '08803618-d3af-5e96-9566-df6c124d8856',
  'story_066',
  'ev_5',
  5,
  '12:00 AM',
  'A heavy crowbar with green paint from Cargo Car 14 is left beside the track ballast.',
  'A heavy crowbar with green paint from Cargo Car 14 is left beside the track ballast.',
  'The robbers used heavy pry tools to breach the train’s rear security lock.',
  'Heavy Crowbar',
  '36-inch drop-forged steel wrecking bar with green railcar enamel chips.',
  '["Axe","Hammer","Wrench"]'::jsonb,
  'Heavy Crowbar',
  '["heavy crowbar","crowbar","pry bar","wrecking bar","iron bar"]'::jsonb,
  'A long heavy metal bar with a curved chisel tip used to pry open doors.',
  'ev_6',
  true,
  '{"descriptions":["A heavy crowbar with green paint from Cargo Car 14 is left beside the track ballast.","At 12:00 AM: A heavy crowbar with green paint from Cargo Car 14 is left beside the track ballast.","Notice this clue: A heavy crowbar with green paint from Cargo Car 14 is left beside the track ballast."],"hints":["A long heavy metal bar with a curved chisel tip used to pry open doors.","Clue hint: Think about heavy crowbar.","Search for: the robbers used heavy pry tools to breach the train’s rear security lock."],"clues":["Heavy Crowbar","Item: Heavy Crowbar","Clue Word: Heavy Crowbar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '30a05569-5b5d-50ce-806c-f2d94900edee',
  'story_066',
  'ev_6',
  6,
  '12:15 AM',
  'Fifty thousand dollars in federal bank bond certificates are packed in a canvas mail sack.',
  'Fifty thousand dollars in federal bank bond certificates are packed in a canvas mail sack.',
  'The cargo stolen while the train crew was distracted by the phantom stationmaster.',
  'Federal Bond Sack',
  'Heavy canvas postal sack stamped "U.S. TREASURY - REGISTERED BONDS".',
  '["Cash Box","Luggage Bag","Toolbox"]'::jsonb,
  'Federal Bond Sack',
  '["federal bond sack","sack","bond sack","mail sack","bonds"]'::jsonb,
  'A heavy cloth bag used by post offices and banks to carry valuable paper securities.',
  'ev_7',
  false,
  '{"descriptions":["Fifty thousand dollars in federal bank bond certificates are packed in a canvas mail sack.","At 12:15 AM: Fifty thousand dollars in federal bank bond certificates are packed in a canvas mail sack.","Notice this clue: Fifty thousand dollars in federal bank bond certificates are packed in a canvas mail sack."],"hints":["A heavy cloth bag used by post offices and banks to carry valuable paper securities.","Clue hint: Think about federal bond sack.","Search for: the cargo stolen while the train crew was distracted by the phantom stationmaster."],"clues":["Federal Bond Sack","Item: Federal Bond Sack","Clue Word: Federal Bond Sack"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '78a63cc3-03b1-537d-88aa-9766aa020905',
  'story_066',
  'ev_7',
  7,
  '12:45 AM',
  'An antique 1924 stationmaster wool cap with brass badge is on the mannequin’s head.',
  'An antique 1924 stationmaster wool cap with brass badge is on the mannequin’s head.',
  'The uniform was stolen from the Blackwood Railway Museum two weeks ago.',
  'Stationmaster Cap',
  'Navy blue peaked cap with gold embroidery reading "BLACKWOOD JUNCTION".',
  '["Fedora","Wool Beanie","Helmet"]'::jsonb,
  'Stationmaster Cap',
  '["stationmaster cap","cap","hat","uniform cap"]'::jsonb,
  'A stiff peaked hat with a shiny metal badge worn by railway conductors.',
  'ev_8',
  false,
  '{"descriptions":["An antique 1924 stationmaster wool cap with brass badge is on the mannequin’s head.","At 12:45 AM: An antique 1924 stationmaster wool cap with brass badge is on the mannequin’s head.","Notice this clue: An antique 1924 stationmaster wool cap with brass badge is on the mannequin’s head."],"hints":["A stiff peaked hat with a shiny metal badge worn by railway conductors.","Clue hint: Think about stationmaster cap.","Search for: the uniform was stolen from the blackwood railway museum two weeks ago."],"clues":["Stationmaster Cap","Item: Stationmaster Cap","Clue Word: Stationmaster Cap"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a43f00aa-35e3-5f4c-91e4-a7720b36ac21',
  'story_066',
  'ev_8',
  8,
  '01:00 AM',
  'Bicycle tire tracks with mud from the abandoned junction lead directly to Silas’s shack.',
  'Bicycle tire tracks with mud from the abandoned junction lead directly to Silas’s shack.',
  'Silas used an off-road mountain bicycle to escape along the rail embankment.',
  'Bicycle Tire Tracks',
  'Knobby rubber tire prints pressed into the gravel ballast alongside the tracks.',
  '["Footprints","Car Tracks","Motorcycle Marks"]'::jsonb,
  'Bicycle Tire Tracks',
  '["bicycle tire tracks","tracks","bicycle tracks","tire tracks","tread marks"]'::jsonb,
  'Narrow grooved rubber lines left in dirt by the two wheels of a bicycle.',
  NULL,
  true,
  '{"descriptions":["Bicycle tire tracks with mud from the abandoned junction lead directly to Silas’s shack.","At 01:00 AM: Bicycle tire tracks with mud from the abandoned junction lead directly to Silas’s shack.","Notice this clue: Bicycle tire tracks with mud from the abandoned junction lead directly to Silas’s shack."],"hints":["Narrow grooved rubber lines left in dirt by the two wheels of a bicycle.","Clue hint: Think about bicycle tire tracks.","Search for: silas used an off-road mountain bicycle to escape along the rail embankment."],"clues":["Bicycle Tire Tracks","Item: Bicycle Tire Tracks","Clue Word: Bicycle Tire Tracks"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_067 — THE SILVER POCKET MIRROR
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_067',
  'The Silver Pocket Mirror',
  'Supernatural',
  'The Hawthorne Antiques Parlor, velvet showcases, grandfather clocks, and ornate silver mirrors',
  'When Lord Arthur looked into an antique silver pocket mirror, the reflection showed yesterday’s murder in room 4 instead of his own face.',
  '[{"name":"Felix Vance","role":"Master Antiquarian & Extortionist","alibi":"Polishing silver tea sets at the counter","avatar":"🪞"},{"name":"Lord Arthur Sterling","role":"Blackmailed Aristocrat","alibi":"In the antique shop showroom looking at mirrors","avatar":"🎩"},{"name":"Nora Higgins","role":"Antique Shop Assistant","alibi":"Dusting porcelain figurines in the front window","avatar":"🧹"},{"name":"Detective Frank Rossi","role":"High-Tech Fraud Specialist","alibi":"Arrived at the antique parlor following Arthur’s frantic report of a cursed artifact","avatar":"🔍"}]'::jsonb,
  'Antiquarian Felix Vance hollowed out an antique silver pocket mirror. He installed an ultra-thin miniature video screen behind a two-way beam-splitter glass, looping a high-resolution video of Arthur’s secret murder from yesterday to terrify the nobleman into paying a two-million-dollar extortion fee.',
  'Antiquarian Felix Vance',
  'Felix wanted to blackmail Lord Arthur by showing him optical proof that his secret crime was recorded.',
  '[{"time":"Yesterday 04:00 PM","event":"Arthur poisons Thomas in Room 4; Felix records the murder with a pinhole camera."},{"time":"Yesterday 10:00 PM","event":"Felix builds the micro-screen into the antique silver pocket mirror."},{"time":"11:00 AM","event":"Felix presents the \"Venetian Time Mirror\" to Lord Arthur in the parlor."},{"time":"11:05 AM","event":"Arthur opens the lid; the mirror displays the murder video; Arthur screams in horror."},{"time":"11:30 AM","event":"Detective Rossi unscrews the mirror casing and discovers the micro-OLED panel."}]'::jsonb,
  '[{"id":"ev1","title":"Micro-OLED Display Inside Silver Frame","detail":"Concealed beneath half-silvered two-way glass to simulate a haunted reflection."},{"id":"ev2","title":"Hidden USB Charging Port in Hinge","detail":"Proves the antique mirror was a modern electronic fabricated device."},{"id":"ev3","title":"Murder Video File on Flash Memory","detail":"Proves Arthur committed murder and Felix attempted multi-million-dollar extortion."},{"id":"ev4","title":"Two-Million-Dollar Extortion Note","detail":"Discovered in Felix Vance’s safe, establishing the criminal motive."}]'::jsonb,
  '[{"order":1,"title":"Cursed Pocket Mirror","text":"Silver compact displaying a video of yesterday’s murder instead of a face."},{"order":2,"title":"Micro-OLED Display","text":"Ultra-thin electronic screen embedded beneath the two-way mirror glass."},{"order":3,"title":"Magnetic Hinge Switch","text":"Sensor that automatically triggered the video when the lid clicked open."},{"order":4,"title":"Hidden USB Port","text":"Modern charging socket disguised within the antique silver engraving."},{"order":5,"title":"Murder Video File","text":"Digital recording showing Lord Arthur poisoning his rival in Room 4."},{"order":6,"title":"Pinhole Spy Camera","text":"Surveillance lens used by the antiquarian to record the original crime."}]'::jsonb,
  'The mirror was stamped with 16th-century Venetian marks.: The outer silver case was genuine antique, but hollowed out modernly.; Assistant Nora dusted the mirrors.: Routine shop cleaning, completely unaware of the spy equipment inside.',
  'Claim the mirror was cursed by an ancient Venetian sorcerer or blame the parlor maid.',
  'NORMAL',
  'Did the antique mirror capture time, or was an ingenious micro-projection trick at work?',
  '[{"character":"Felix Vance","secret":"He hid a miniature wireless video transmitter inside an antique mantel clock."},{"character":"Lord Arthur Sterling","secret":"He actually did poison Thomas yesterday in Room 4 over a gambling dispute."},{"character":"Nora Higgins","secret":"She saw Felix testing a tiny glowing television screen yesterday afternoon."},{"character":"Detective Frank Rossi","secret":"Investigated electronic extortion schemes across the capital."}]'::jsonb,
  '[{"lead":"The mirror was stamped with 16th-century Venetian marks.","explanation":"The outer silver case was genuine antique, but hollowed out modernly."},{"lead":"Assistant Nora dusted the mirrors.","explanation":"Routine shop cleaning, completely unaware of the spy equipment inside."}]'::jsonb,
  '{"wrongTheories":["An ancient Venetian sorcerer’s curse trapped the passage of time inside the mirror glass.","Lord Arthur was experiencing severe visual schizophrenia triggered by guilt."],"correctTheory":"Antiquarian Felix Vance filmed Lord Arthur committing murder with a pinhole camera, built a micro-OLED screen and battery into an antique silver mirror behind two-way glass, and played the murder loop to extort Arthur for two million dollars."}'::jsonb,
  'Antiquarian Felix Vance built a hidden OLED screen in the mirror for blackmail!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Rossi dismantled the mirror, exposing the OLED screen. Both men were arrested: Lord Arthur for capital murder, and Felix Vance for industrial blackmail and illegal surveillance."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Lord Arthur paid the two million dollars in sheer terror. Felix erased the file and retired, while the real murder went unpunished."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Time Mirror of Venice\" was bought by an occult society. Felix published a fraudulent paper on chronovision while living in Switzerland."}]'::jsonb,
  '{"intros":["When Lord Arthur looked into an antique silver pocket mirror, the reflection showed yesterday’s murder in room 4 instead of his own face.","Case file story_067: When Lord Arthur looked into an antique silver pocket mirror, the reflection showed yesterday’s murder in room 4 instead of his own face. Look closely at every clue.","Trouble begins in The Hawthorne Antiques Parlor, velvet showcases, grandfather clocks, and ornate silver mirrors. When Lord Arthur looked into an antique silver pocket mirror, the reflection showed yesterday’s murder in room 4 instead of his own face.","The mystery starts now. When Lord Arthur looked into an antique silver pocket mirror, the reflection showed yesterday’s murder in room 4 instead of his own face. Can you solve it?"],"reveals":["Antiquarian Felix Vance built a hidden OLED screen in the mirror for blackmail!","The mystery is unraveled! Antiquarian Felix Vance built a hidden OLED screen in the mirror for blackmail!","At last, the truth comes out: Antiquarian Felix Vance built a hidden OLED screen in the mirror for blackmail!","Case resolved! Here is what happened: Antiquarian Felix Vance built a hidden OLED screen in the mirror for blackmail!"],"hints":["Pay attention to where Antiquarian Felix Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_067';
DELETE FROM public.case_events WHERE case_id = 'story_067';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a6557071-0602-5ef3-98ad-1838de193386',
  'story_067',
  'Felix Vance',
  'Master Antiquarian & Extortionist',
  'Cultured, velvet vest, carrying an ivory loupe, speaking with oily refinement',
  'This mirror was forged in 16th-century Venice. It reveals the sins of the soul, not the face.',
  'He hid a miniature wireless video transmitter inside an antique mantel clock.',
  'Polishing silver tea sets at the counter',
  'Sold the "cursed" pocket mirror to Lord Arthur',
  'The micro-screen activates when the silver lid latch clicks open.',
  'Did not know the mirror frame had a micro-USB charging port hidden in the hinge.',
  '🪞',
  '["This mirror was forged in 16th-century Venice. It reveals the sins of the soul, not the face.","\"This mirror was forged in 16th-century Venice. It reveals the sins of the soul, not the face.\"","Listen to me: This mirror was forged in 16th-century Venice. It reveals the sins of the soul, not the face.","I tell you the truth: This mirror was forged in 16th-century Venice. It reveals the sins of the soul, not the face."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f60d06b6-f54e-5fd2-ae00-c15a797bc22b',
  'story_067',
  'Lord Arthur Sterling',
  'Blackmailed Aristocrat',
  'Panicked, trembling, pale skin, clutching a walking stick with shaking hands',
  'The mirror shows me standing over Thomas with the poisoned goblet! How does the glass know?',
  'He actually did poison Thomas yesterday in Room 4 over a gambling dispute.',
  'In the antique shop showroom looking at mirrors',
  'Target of the high-tech psychological blackmail',
  'The reflection shows the exact murder he committed twenty-four hours ago.',
  'Did not realize he was being secretly filmed by a hidden pinhole camera.',
  '🎩',
  '["The mirror shows me standing over Thomas with the poisoned goblet! How does the glass know?","\"The mirror shows me standing over Thomas with the poisoned goblet! How does the glass know?\"","Listen to me: The mirror shows me standing over Thomas with the poisoned goblet! How does the glass know?","I tell you the truth: The mirror shows me standing over Thomas with the poisoned goblet! How does the glass know?"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ced8af05-c8ef-5cb3-8b39-969144d04a9d',
  'story_067',
  'Nora Higgins',
  'Antique Shop Assistant',
  'Observant, quiet, carrying dusting cloths and inventory ledgers',
  'Mr. Vance spent all night in his back workshop with miniature soldering tools and wires.',
  'She saw Felix testing a tiny glowing television screen yesterday afternoon.',
  'Dusting porcelain figurines in the front window',
  'Employee who witnessed the fabrication of the mirror',
  'The mirror case felt unusually warm after being opened for five minutes.',
  'Did not know Felix was blackmailing a wealthy lord.',
  '🧹',
  '["Mr. Vance spent all night in his back workshop with miniature soldering tools and wires.","\"Mr. Vance spent all night in his back workshop with miniature soldering tools and wires.\"","Listen to me: Mr. Vance spent all night in his back workshop with miniature soldering tools and wires.","I tell you the truth: Mr. Vance spent all night in his back workshop with miniature soldering tools and wires."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '205cfa95-960c-5c37-a493-0525a4526662',
  'story_067',
  'Detective Frank Rossi',
  'High-Tech Fraud Specialist',
  'Analytical, sharp, carrying optical spectrometers and micro-screwdrivers',
  'Sorcerers in 1580 did not manufacture high-density lithium-polymer battery cells.',
  'Investigated electronic extortion schemes across the capital.',
  'Arrived at the antique parlor following Arthur’s frantic report of a cursed artifact',
  'Leading the technical fraud and murder inquiry',
  'Found a microscopic charging port concealed inside the ornate silver hinge.',
  'Did not immediately know Arthur had genuinely committed the murder depicted.',
  '🔍',
  '["Sorcerers in 1580 did not manufacture high-density lithium-polymer battery cells.","\"Sorcerers in 1580 did not manufacture high-density lithium-polymer battery cells.\"","Listen to me: Sorcerers in 1580 did not manufacture high-density lithium-polymer battery cells.","I tell you the truth: Sorcerers in 1580 did not manufacture high-density lithium-polymer battery cells."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0c5a4e4e-535d-574b-a26e-f3f857e94275',
  'story_067',
  'ev_1',
  1,
  '11:05 AM',
  'An antique sterling silver pocket mirror displays video of yesterday’s murder instead of a reflection.',
  'An antique sterling silver pocket mirror displays video of yesterday’s murder instead of a reflection.',
  'The mirror contained an ultra-thin miniature video screen beneath half-silvered glass.',
  'Cursed Pocket Mirror',
  'Ornate Victorian silver compact with two-way mirror glass and hidden OLED screen.',
  '["Glass Compact","Silver Locket","Gold Watch"]'::jsonb,
  'Cursed Pocket Mirror',
  '["cursed pocket mirror","mirror","pocket mirror","silver mirror","compact"]'::jsonb,
  'A small round silver vanity case that opens on a hinge with a reflective glass surface.',
  'ev_2',
  true,
  '{"descriptions":["An antique sterling silver pocket mirror displays video of yesterday’s murder instead of a reflection.","At 11:05 AM: An antique sterling silver pocket mirror displays video of yesterday’s murder instead of a reflection.","Notice this clue: An antique sterling silver pocket mirror displays video of yesterday’s murder instead of a reflection."],"hints":["A small round silver vanity case that opens on a hinge with a reflective glass surface.","Clue hint: Think about cursed pocket mirror.","Search for: the mirror contained an ultra-thin miniature video screen beneath half-silvered glass."],"clues":["Cursed Pocket Mirror","Item: Cursed Pocket Mirror","Clue Word: Cursed Pocket Mirror"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '24b539d4-91ad-5052-9d32-8c60f2f92dfd',
  'story_067',
  'ev_2',
  2,
  '11:30 AM',
  'An ultra-thin 2-inch high-resolution micro-OLED display panel is extracted from the mirror frame.',
  'An ultra-thin 2-inch high-resolution micro-OLED display panel is extracted from the mirror frame.',
  'The video was stored on an embedded 16GB flash memory chip inside the lid.',
  'Micro-OLED Display',
  'Flexible digital screen measuring one millimeter in thickness behind the glass.',
  '["Photograph","Glass Plate","Film Negative"]'::jsonb,
  'Micro-OLED Display',
  '["micro-oled display","screen","oled","micro oled","display","micro screen"]'::jsonb,
  'A tiny electronic video screen that glows brightly to display moving pictures.',
  'ev_3',
  false,
  '{"descriptions":["An ultra-thin 2-inch high-resolution micro-OLED display panel is extracted from the mirror frame.","At 11:30 AM: An ultra-thin 2-inch high-resolution micro-OLED display panel is extracted from the mirror frame.","Notice this clue: An ultra-thin 2-inch high-resolution micro-OLED display panel is extracted from the mirror frame."],"hints":["A tiny electronic video screen that glows brightly to display moving pictures.","Clue hint: Think about micro-oled display.","Search for: the video was stored on an embedded 16gb flash memory chip inside the lid."],"clues":["Micro-OLED Display","Item: Micro-OLED Display","Clue Word: Micro-OLED Display"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b7716a3c-312b-5001-872e-2c316cdaaff3',
  'story_067',
  'ev_3',
  3,
  '11:35 AM',
  'A microscopic magnetic reed switch in the silver hinge turns the video screen on when opened.',
  'A microscopic magnetic reed switch in the silver hinge turns the video screen on when opened.',
  'Opening the lid triggered the video loop to play automatically from the start.',
  'Magnetic Hinge Switch',
  'Sub-miniature reed switch hidden in the silver hinge joint.',
  '["Push Button","Dial","Spring Lever"]'::jsonb,
  'Magnetic Hinge Switch',
  '["magnetic hinge switch","switch","hinge switch","reed switch","magnetic switch"]'::jsonb,
  'A tiny electrical sensor inside a metal hinge that turns power on when opened.',
  'ev_4',
  false,
  '{"descriptions":["A microscopic magnetic reed switch in the silver hinge turns the video screen on when opened.","At 11:35 AM: A microscopic magnetic reed switch in the silver hinge turns the video screen on when opened.","Notice this clue: A microscopic magnetic reed switch in the silver hinge turns the video screen on when opened."],"hints":["A tiny electrical sensor inside a metal hinge that turns power on when opened.","Clue hint: Think about magnetic hinge switch.","Search for: opening the lid triggered the video loop to play automatically from the start."],"clues":["Magnetic Hinge Switch","Item: Magnetic Hinge Switch","Clue Word: Magnetic Hinge Switch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd599c6c0-ba65-56b7-8cc8-d6a4a92a70ee',
  'story_067',
  'ev_4',
  4,
  '11:40 AM',
  'A micro-USB charging port is drilled into the ornate acanthus leaf engraving on the rim.',
  'A micro-USB charging port is drilled into the ornate acanthus leaf engraving on the rim.',
  'The electronic device required regular charging via a modern charging cable.',
  'Hidden USB Port',
  'Micro-USB receptacle concealed beneath an engraved silver flower petal.',
  '["Keyhole","Vent Hole","Screw Hole"]'::jsonb,
  'Hidden USB Port',
  '["hidden usb port","usb port","usb","port","charging port"]'::jsonb,
  'A tiny rectangular electronic socket used to plug in phone charging cords.',
  'ev_5',
  false,
  '{"descriptions":["A micro-USB charging port is drilled into the ornate acanthus leaf engraving on the rim.","At 11:40 AM: A micro-USB charging port is drilled into the ornate acanthus leaf engraving on the rim.","Notice this clue: A micro-USB charging port is drilled into the ornate acanthus leaf engraving on the rim."],"hints":["A tiny rectangular electronic socket used to plug in phone charging cords.","Clue hint: Think about hidden usb port.","Search for: the electronic device required regular charging via a modern charging cable."],"clues":["Hidden USB Port","Item: Hidden USB Port","Clue Word: Hidden USB Port"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b60a0304-63e3-5106-afeb-37697a418990',
  'story_067',
  'ev_5',
  5,
  '11:45 AM',
  'A video file titled "ROOM4_MURDER_STERLING.mp4" is found on the flash memory chip.',
  'A video file titled "ROOM4_MURDER_STERLING.mp4" is found on the flash memory chip.',
  'The footage proved both the optical trick and confirmed Lord Arthur’s real crime.',
  'Murder Video File',
  'Digital video recording showing Lord Arthur dropping poison into Thomas’s goblet.',
  '["Audio File","Text Note","Photo"]'::jsonb,
  'Murder Video File',
  '["murder video file","video file","file","video","murder video"]'::jsonb,
  'A digital movie file saved on a computer chip showing a recorded event.',
  'ev_6',
  true,
  '{"descriptions":["A video file titled \"ROOM4_MURDER_STERLING.mp4\" is found on the flash memory chip.","At 11:45 AM: A video file titled \"ROOM4_MURDER_STERLING.mp4\" is found on the flash memory chip.","Notice this clue: A video file titled \"ROOM4_MURDER_STERLING.mp4\" is found on the flash memory chip."],"hints":["A digital movie file saved on a computer chip showing a recorded event.","Clue hint: Think about murder video file.","Search for: the footage proved both the optical trick and confirmed lord arthur’s real crime."],"clues":["Murder Video File","Item: Murder Video File","Clue Word: Murder Video File"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4f4a246e-d93a-59d8-9edb-8f204eaa978d',
  'story_067',
  'ev_6',
  6,
  '12:00 PM',
  'A miniature hidden pinhole video camera is recovered from the molding of Room 4.',
  'A miniature hidden pinhole video camera is recovered from the molding of Room 4.',
  'Felix installed surveillance cameras in his private rooms to record wealthy clients.',
  'Pinhole Spy Camera',
  'One-millimeter optical lens wired to an internal solid-state recording hub.',
  '["Webcam","Security Camera","Microphone"]'::jsonb,
  'Pinhole Spy Camera',
  '["pinhole spy camera","camera","spy camera","pinhole camera","pinhole lens"]'::jsonb,
  'A microscopic camera lens as small as a needle point used for secret spying.',
  'ev_7',
  false,
  '{"descriptions":["A miniature hidden pinhole video camera is recovered from the molding of Room 4.","At 12:00 PM: A miniature hidden pinhole video camera is recovered from the molding of Room 4.","Notice this clue: A miniature hidden pinhole video camera is recovered from the molding of Room 4."],"hints":["A microscopic camera lens as small as a needle point used for secret spying.","Clue hint: Think about pinhole spy camera.","Search for: felix installed surveillance cameras in his private rooms to record wealthy clients."],"clues":["Pinhole Spy Camera","Item: Pinhole Spy Camera","Clue Word: Pinhole Spy Camera"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7ea5839a-826b-5c58-b1ac-6f0973e1ac3c',
  'story_067',
  'ev_7',
  7,
  '12:15 PM',
  'An extortion demand letter for two million dollars in gold is in Felix’s safe.',
  'An extortion demand letter for two million dollars in gold is in Felix’s safe.',
  'The motive for the haunting: forcing Arthur to pay a massive fortune for silence.',
  'Extortion Demand Letter',
  'Typed demand letter: "Pay two million or the mirror’s memory goes to Scotland Yard."',
  '["Receipt","Will","Bill"]'::jsonb,
  'Extortion Demand Letter',
  '["extortion demand letter","letter","extortion letter","demand letter","blackmail letter"]'::jsonb,
  'A written note demanding money under threat of exposing a terrible crime.',
  'ev_8',
  false,
  '{"descriptions":["An extortion demand letter for two million dollars in gold is in Felix’s safe.","At 12:15 PM: An extortion demand letter for two million dollars in gold is in Felix’s safe.","Notice this clue: An extortion demand letter for two million dollars in gold is in Felix’s safe."],"hints":["A written note demanding money under threat of exposing a terrible crime.","Clue hint: Think about extortion demand letter.","Search for: the motive for the haunting: forcing arthur to pay a massive fortune for silence."],"clues":["Extortion Demand Letter","Item: Extortion Demand Letter","Clue Word: Extortion Demand Letter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'afba111e-b287-5199-8af7-21d51cefa6d8',
  'story_067',
  'ev_8',
  8,
  '12:30 PM',
  'A lithium-polymer battery cell measuring 30mm across is nestled in the silver casing.',
  'A lithium-polymer battery cell measuring 30mm across is nestled in the silver casing.',
  'Provided thirty minutes of continuous video display power before needing recharge.',
  'Lithium Battery Cell',
  'Ultra-thin 3.7V rechargeable battery pouch wrapped in Kapton tape.',
  '["Car Battery","Watch Battery","AA Battery"]'::jsonb,
  'Lithium Battery Cell',
  '["lithium battery cell","battery","lithium battery","cell","battery cell"]'::jsonb,
  'A flat foil pouch containing rechargeable chemicals that powers small electronics.',
  NULL,
  true,
  '{"descriptions":["A lithium-polymer battery cell measuring 30mm across is nestled in the silver casing.","At 12:30 PM: A lithium-polymer battery cell measuring 30mm across is nestled in the silver casing.","Notice this clue: A lithium-polymer battery cell measuring 30mm across is nestled in the silver casing."],"hints":["A flat foil pouch containing rechargeable chemicals that powers small electronics.","Clue hint: Think about lithium battery cell.","Search for: provided thirty minutes of continuous video display power before needing recharge."],"clues":["Lithium Battery Cell","Item: Lithium Battery Cell","Clue Word: Lithium Battery Cell"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_068 — THE RING OF BLACK STONES
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_068',
  'The Ring of Black Stones',
  'Supernatural',
  'The Blackwood Moor, ancient megalithic stone circle surrounded by purple heather and barren soil',
  'Birds dropped dead out of the sky whenever they flew over an ancient circle of black stones on the moor.',
  '[{"name":"Marcus Vance","role":"Chemical Factory Owner","alibi":"In his executive refinery office three miles away","avatar":"🏭"},{"name":"David Sterling","role":"Ornithologist & Bird Researcher","alibi":"In his bird blind sixty yards from the stones","avatar":"🦅"},{"name":"Martha Higgins","role":"Moor Folklorist","alibi":"In her stone cottage on the edge of the heath","avatar":"👵"},{"name":"Detective Frank Hansen","role":"Environmental Crime Specialist","alibi":"Arrived on the moor with hazardous materials response gear","avatar":"☣️"}]'::jsonb,
  'Chemical industrialist Marcus Vance routed an underground industrial waste pipe from his nearby illegal sulfur refinery directly into the hollow center of the ancient stone circle. Heavy, invisible hydrogen sulfide gas seeped from the ground, killing birds and animals instantly to fake a deadly supernatural curse.',
  'Industrialist Marcus Vance',
  'Marcus was illegally venting toxic hydrogen sulfide gas from his secret chemical refinery into the stone circle.',
  '[{"time":"02 Months Ago","event":"Marcus Vance lays a subterranean plastic pipeline from his refinery to the stone circle."},{"time":"08:00 AM","event":"The refinery vents high-pressure hydrogen sulfide gas down the pipeline."},{"time":"11:00 AM","event":"Deadly gas pools three feet deep inside the natural bowl of the stone ring."},{"time":"11:30 AM","event":"Migrating birds fly over the low-oxygen sulfur cloud and suffocate instantly."},{"time":"02:00 PM","event":"Detective Hansen tests the soil with a gas detector and uncovers the pipeline."}]'::jsonb,
  '[{"id":"ev1","title":"Buried Polyethylene Pipeline in Circle","detail":"Perforated industrial pipe venting 320 PPM hydrogen sulfide gas directly into the stone ring."},{"id":"ev2","title":"Photoionization Gas Meter Reading","detail":"Proves the air inside the ring was saturated with fatal concentrations of toxic gas."},{"id":"ev3","title":"Sulfhemoglobin Blood in Dead Birds","detail":"Toxicology confirms birds died instantly of chemical asphyxiation, not supernatural forces."},{"id":"ev4","title":"Refinery Pipeline Blueprint","detail":"Found in Marcus Vance’s safe, proving premeditated illegal dumping to save $500,000."}]'::jsonb,
  '[{"order":1,"title":"Basalt Stone Circle","text":"Ancient ring of black rocks acting as a natural trap for heavy toxic gas."},{"order":2,"title":"Dead Sparrows","text":"Migrating birds suffocated mid-flight by the invisible chemical cloud."},{"order":3,"title":"Toxic Gas Meter","text":"Device registering lethal levels of hydrogen sulfide seeping from the soil."},{"order":4,"title":"Buried Waste Pipeline","text":"Industrial tube routed from the refinery to dump toxic gas in the circle."},{"order":5,"title":"Rotten-Egg Odor","text":"Distinctive sulfur scent indicating the presence of deadly gas."},{"order":6,"title":"Refinery Waste Blueprint","text":"Engineering plan proving the factory owner routed the illegal dump line."}]'::jsonb,
  'Folklorist Martha burned rowan twigs.: A traditional folk charm to ward off evil, but completely non-toxic.; The stones were basalt from ancient volcanic eruptions.: Natural geology that looked ominous, but held no inherent curse.',
  'Claim an ancient druid demon consumed the life force of flying birds or blame the moor ranger.',
  'NORMAL',
  'Did an ancient druidic curse poison the air, or was an invisible toxic gas leaking from the stones?',
  '[{"character":"Marcus Vance","secret":"He saved five hundred thousand dollars in waste disposal fees by dumping gas underground."},{"character":"David Sterling","secret":"He took dead bird tissue samples to a university lab for chemical analysis."},{"character":"Martha Higgins","secret":"She was warning tourists away from the moor to protect local superstitions."},{"character":"Detective Frank Hansen","secret":"Investigated illegal toxic chemical dumping cases for the federal EPA."}]'::jsonb,
  '[{"lead":"Folklorist Martha burned rowan twigs.","explanation":"A traditional folk charm to ward off evil, but completely non-toxic."},{"lead":"The stones were basalt from ancient volcanic eruptions.","explanation":"Natural geology that looked ominous, but held no inherent curse."}]'::jsonb,
  '{"wrongTheories":["An ancient druid demon consumed the life essence of any bird flying over the sacred stones.","A subterranean methane pocket naturally vented from a swamp beneath the moor."],"correctTheory":"Industrialist Marcus Vance installed an underground waste pipe from his chemical refinery to dump lethal hydrogen sulfide gas into the stone circle, killing birds mid-flight to fake a supernatural curse and save five hundred thousand dollars in waste disposal fees."}'::jsonb,
  'Factory owner Marcus Vance vented toxic sulfur gas into the stone circle to dump waste!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Hansen excavated the pipeline and arrested Marcus Vance. The chemical refinery was shut down by federal marshals and the moor air returned to clean safety."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The council fenced off the moor as a cursed exclusion zone. Marcus continued venting gas through the pipe and saved half a million dollars."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Death Circle of Blackwood\" was declared a vortex anomaly by sensational media. Marcus monetized the land by charging paranormal film crews."}]'::jsonb,
  '{"intros":["Birds dropped dead out of the sky whenever they flew over an ancient circle of black stones on the moor.","Case file story_068: Birds dropped dead out of the sky whenever they flew over an ancient circle of black stones on the moor. Look closely at every clue.","Trouble begins in The Blackwood Moor, ancient megalithic stone circle surrounded by purple heather and barren soil. Birds dropped dead out of the sky whenever they flew over an ancient circle of black stones on the moor.","The mystery starts now. Birds dropped dead out of the sky whenever they flew over an ancient circle of black stones on the moor. Can you solve it?"],"reveals":["Factory owner Marcus Vance vented toxic sulfur gas into the stone circle to dump waste!","The mystery is unraveled! Factory owner Marcus Vance vented toxic sulfur gas into the stone circle to dump waste!","At last, the truth comes out: Factory owner Marcus Vance vented toxic sulfur gas into the stone circle to dump waste!","Case resolved! Here is what happened: Factory owner Marcus Vance vented toxic sulfur gas into the stone circle to dump waste!"],"hints":["Pay attention to where Industrialist Marcus Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_068';
DELETE FROM public.case_events WHERE case_id = 'story_068';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'cc46914e-b94e-5cbd-a841-775e85bbd298',
  'story_068',
  'Marcus Vance',
  'Chemical Factory Owner',
  'Arrogant, tailored tweed coat, gold pocket watch, smells faintly of sulfur and cologne',
  'Those black stones have been cursed since the Bronze Age. No living thing has ever crossed them.',
  'He saved five hundred thousand dollars in waste disposal fees by dumping gas underground.',
  'In his executive refinery office three miles away',
  'Owner of the chemical refinery bordering the moor',
  'Hydrogen sulfide gas is heavier than air and pools invisibly in ground depressions.',
  'Did not know an environmental gas spectrometer detected sulfur dioxide plumes.',
  '🏭',
  '["Those black stones have been cursed since the Bronze Age. No living thing has ever crossed them.","\"Those black stones have been cursed since the Bronze Age. No living thing has ever crossed them.\"","Listen to me: Those black stones have been cursed since the Bronze Age. No living thing has ever crossed them.","I tell you the truth: Those black stones have been cursed since the Bronze Age. No living thing has ever crossed them."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3f16eb62-5dda-5c9c-ba53-f487a908314f',
  'story_068',
  'David Sterling',
  'Ornithologist & Bird Researcher',
  'Devoted, gentle, carrying binoculars and a notebook filled with bird sketches',
  'I watched three sparrows fly over the central stone and drop like stones to the earth.',
  'He took dead bird tissue samples to a university lab for chemical analysis.',
  'In his bird blind sixty yards from the stones',
  'Observer who discovered the deadly phenomenon',
  'The birds showed zero physical trauma, but their blood was dark brown.',
  'Did not know an industrial pipeline ran six feet beneath his feet.',
  '🦅',
  '["I watched three sparrows fly over the central stone and drop like stones to the earth.","\"I watched three sparrows fly over the central stone and drop like stones to the earth.\"","Listen to me: I watched three sparrows fly over the central stone and drop like stones to the earth.","I tell you the truth: I watched three sparrows fly over the central stone and drop like stones to the earth."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7befc407-8a14-5066-ae7d-09907f4e6ca3',
  'story_068',
  'Martha Higgins',
  'Moor Folklorist',
  'Elderly, wearing a wool shawl, carrying a bundle of dried rowan twigs',
  'The stones are waking! The earth breathes venom when the blood moon rises!',
  'She was warning tourists away from the moor to protect local superstitions.',
  'In her stone cottage on the edge of the heath',
  'Local elder who interpreted the bird deaths as an omen',
  'The grass inside the stone circle turned black and died two months ago.',
  'Did not understand chemical gas poisoning.',
  '👵',
  '["The stones are waking! The earth breathes venom when the blood moon rises!","\"The stones are waking! The earth breathes venom when the blood moon rises!\"","Listen to me: The stones are waking! The earth breathes venom when the blood moon rises!","I tell you the truth: The stones are waking! The earth breathes venom when the blood moon rises!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ae354c91-06ba-5acd-85f5-877ac351a24c',
  'story_068',
  'Detective Frank Hansen',
  'Environmental Crime Specialist',
  'Sharp, clinical, wearing a full-face respirator mask and chemical sensors',
  'Curses don’t register 300 parts per million on a photoionization gas detector.',
  'Investigated illegal toxic chemical dumping cases for the federal EPA.',
  'Arrived on the moor with hazardous materials response gear',
  'Leading the environmental homicide and toxic waste probe',
  'Found high concentrations of lethal hydrogen sulfide seeping from the central cairn.',
  'Did not immediately locate where the underground pipe connected to the refinery.',
  '☣️',
  '["Curses don’t register 300 parts per million on a photoionization gas detector.","\"Curses don’t register 300 parts per million on a photoionization gas detector.\"","Listen to me: Curses don’t register 300 parts per million on a photoionization gas detector.","I tell you the truth: Curses don’t register 300 parts per million on a photoionization gas detector."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3afaf346-05f8-5adb-8a70-40cc70ee3405',
  'story_068',
  'ev_1',
  1,
  '11:00 AM',
  'An ancient circle of twelve basalt megaliths sits on a barren, black-soiled hill.',
  'An ancient circle of twelve basalt megaliths sits on a barren, black-soiled hill.',
  'The natural bowl shape of the ground inside the circle held heavy toxic gas like a bowl.',
  'Basalt Stone Circle',
  'Twelve 10-foot standing black volcanic stones forming a forty-foot ring.',
  '["Wood Henge","Stone Wall","Grave Mound"]'::jsonb,
  'Basalt Stone Circle',
  '["basalt stone circle","circle","stone circle","stones","black stones","megaliths"]'::jsonb,
  'A ring of ancient tall standing rocks built on open ground thousands of years ago.',
  'ev_2',
  true,
  '{"descriptions":["An ancient circle of twelve basalt megaliths sits on a barren, black-soiled hill.","At 11:00 AM: An ancient circle of twelve basalt megaliths sits on a barren, black-soiled hill.","Notice this clue: An ancient circle of twelve basalt megaliths sits on a barren, black-soiled hill."],"hints":["A ring of ancient tall standing rocks built on open ground thousands of years ago.","Clue hint: Think about basalt stone circle.","Search for: the natural bowl shape of the ground inside the circle held heavy toxic gas like a bowl."],"clues":["Basalt Stone Circle","Item: Basalt Stone Circle","Clue Word: Basalt Stone Circle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0d4c438a-babe-5bd3-9436-e0ff591490f5',
  'story_068',
  'ev_2',
  2,
  '11:30 AM',
  'Five wild moorland sparrows drop dead from mid-air directly into the center of the ring.',
  'Five wild moorland sparrows drop dead from mid-air directly into the center of the ring.',
  'The birds suffocated in seconds from inhaling concentrated hydrogen sulfide gas.',
  'Dead Sparrows',
  'Five wild birds showing acute pulmonary edema and dark brown sulfhemoglobin blood.',
  '["Shot Birds","Diseased Crows","Feathers"]'::jsonb,
  'Dead Sparrows',
  '["dead sparrows","birds","dead birds","sparrows"]'::jsonb,
  'Small feathered flying creatures that fell lifeless to the ground.',
  'ev_3',
  false,
  '{"descriptions":["Five wild moorland sparrows drop dead from mid-air directly into the center of the ring.","At 11:30 AM: Five wild moorland sparrows drop dead from mid-air directly into the center of the ring.","Notice this clue: Five wild moorland sparrows drop dead from mid-air directly into the center of the ring."],"hints":["Small feathered flying creatures that fell lifeless to the ground.","Clue hint: Think about dead sparrows.","Search for: the birds suffocated in seconds from inhaling concentrated hydrogen sulfide gas."],"clues":["Dead Sparrows","Item: Dead Sparrows","Clue Word: Dead Sparrows"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ea023130-44f2-5125-8e1f-94d65e0190ab',
  'story_068',
  'ev_3',
  3,
  '11:45 AM',
  'A photoionization toxic gas meter sounds a high-pitched alarm: "H2S: 320 PPM - LETHAL".',
  'A photoionization toxic gas meter sounds a high-pitched alarm: "H2S: 320 PPM - LETHAL".',
  'Invisible hydrogen sulfide gas was seeping from the earth in fatal concentrations.',
  'Toxic Gas Meter',
  'Digital handheld hazardous materials detector showing lethal sulfur levels.',
  '["Geiger Counter","Thermometer","Metal Detector"]'::jsonb,
  'Toxic Gas Meter',
  '["toxic gas meter","meter","gas meter","detector","gas detector"]'::jsonb,
  'A digital handheld device that beeps loudly when dangerous poison gas is in the air.',
  'ev_4',
  false,
  '{"descriptions":["A photoionization toxic gas meter sounds a high-pitched alarm: \"H2S: 320 PPM - LETHAL\".","At 11:45 AM: A photoionization toxic gas meter sounds a high-pitched alarm: \"H2S: 320 PPM - LETHAL\".","Notice this clue: A photoionization toxic gas meter sounds a high-pitched alarm: \"H2S: 320 PPM - LETHAL\"."],"hints":["A digital handheld device that beeps loudly when dangerous poison gas is in the air.","Clue hint: Think about toxic gas meter.","Search for: invisible hydrogen sulfide gas was seeping from the earth in fatal concentrations."],"clues":["Toxic Gas Meter","Item: Toxic Gas Meter","Clue Word: Toxic Gas Meter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c5fdb320-664e-5a0c-901f-278bd5628adf',
  'story_068',
  'ev_4',
  4,
  '12:00 PM',
  'A six-inch high-density polyethylene industrial pipe is buried two feet beneath the central cairn.',
  'A six-inch high-density polyethylene industrial pipe is buried two feet beneath the central cairn.',
  'The pipeline routed toxic refinery exhaust gas directly into the ancient circle.',
  'Buried Waste Pipeline',
  'Black plastic industrial pipe drilled with perforation holes to vent gas.',
  '["Water Pipe","Sewer Conduit","Electric Cable"]'::jsonb,
  'Buried Waste Pipeline',
  '["buried waste pipeline","pipeline","pipe","waste pipe","buried pipe"]'::jsonb,
  'A long underground plastic tube used to transport liquid or gas waste.',
  'ev_5',
  false,
  '{"descriptions":["A six-inch high-density polyethylene industrial pipe is buried two feet beneath the central cairn.","At 12:00 PM: A six-inch high-density polyethylene industrial pipe is buried two feet beneath the central cairn.","Notice this clue: A six-inch high-density polyethylene industrial pipe is buried two feet beneath the central cairn."],"hints":["A long underground plastic tube used to transport liquid or gas waste.","Clue hint: Think about buried waste pipeline.","Search for: the pipeline routed toxic refinery exhaust gas directly into the ancient circle."],"clues":["Buried Waste Pipeline","Item: Buried Waste Pipeline","Clue Word: Buried Waste Pipeline"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '27f329be-fbff-5549-acd6-97c550bf8698',
  'story_068',
  'ev_5',
  5,
  '12:30 PM',
  'A rotten-egg chemical odor is detected downwind whenever the ground breeze shifts.',
  'A rotten-egg chemical odor is detected downwind whenever the ground breeze shifts.',
  'Hydrogen sulfide has a characteristic rotten-egg smell at low concentrations.',
  'Rotten-Egg Odor',
  'Atmospheric sulfur scent detected by the environmental inspection team.',
  '["Smoke Smell","Perfume","Gasoline"]'::jsonb,
  'Rotten-Egg Odor',
  '["rotten-egg odor","odor","smell","rotten egg smell","sulfur smell"]'::jsonb,
  'A strong, terrible stinky smell that reminds people of rotten eggs.',
  'ev_6',
  true,
  '{"descriptions":["A rotten-egg chemical odor is detected downwind whenever the ground breeze shifts.","At 12:30 PM: A rotten-egg chemical odor is detected downwind whenever the ground breeze shifts.","Notice this clue: A rotten-egg chemical odor is detected downwind whenever the ground breeze shifts."],"hints":["A strong, terrible stinky smell that reminds people of rotten eggs.","Clue hint: Think about rotten-egg odor.","Search for: hydrogen sulfide has a characteristic rotten-egg smell at low concentrations."],"clues":["Rotten-Egg Odor","Item: Rotten-Egg Odor","Clue Word: Rotten-Egg Odor"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ae788c03-d25a-5e31-934a-ecad5671f7c2',
  'story_068',
  'ev_6',
  6,
  '01:00 PM',
  'Blackened, dead heather vegetation forms a perfect circle inside the megalith stones.',
  'Blackened, dead heather vegetation forms a perfect circle inside the megalith stones.',
  'Acidic sulfur gases chemically scorched all plant life inside the ring.',
  'Blackened Vegetation',
  'Dead, brittle moor heather scorched by hydrogen sulfide and sulfurous acid.',
  '["Burnt Ash","Mud Puddle","Dead Moss"]'::jsonb,
  'Blackened Vegetation',
  '["blackened vegetation","vegetation","dead grass","blackened heather","dead plants"]'::jsonb,
  'Dried, blackened grass and bushes killed by poisonous chemical fumes.',
  'ev_7',
  false,
  '{"descriptions":["Blackened, dead heather vegetation forms a perfect circle inside the megalith stones.","At 01:00 PM: Blackened, dead heather vegetation forms a perfect circle inside the megalith stones.","Notice this clue: Blackened, dead heather vegetation forms a perfect circle inside the megalith stones."],"hints":["Dried, blackened grass and bushes killed by poisonous chemical fumes.","Clue hint: Think about blackened vegetation.","Search for: acidic sulfur gases chemically scorched all plant life inside the ring."],"clues":["Blackened Vegetation","Item: Blackened Vegetation","Clue Word: Blackened Vegetation"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8eb9e8a6-101e-556e-9ace-2b8af1224ee5',
  'story_068',
  'ev_7',
  7,
  '01:45 PM',
  'An engineering blueprint in Marcus’s office shows: "EMERGENCY VENT LINE - SECTOR B".',
  'An engineering blueprint in Marcus’s office shows: "EMERGENCY VENT LINE - SECTOR B".',
  'Marcus designed the illegal dump line to avoid building a five-hundred-thousand-dollar scrubber.',
  'Refinery Waste Blueprint',
  'Schematic map showing the pipeline running from the refinery directly to the moor.',
  '["Road Map","Tax Form","Newspaper"]'::jsonb,
  'Refinery Waste Blueprint',
  '["refinery waste blueprint","blueprint","schematic","pipeline map","map"]'::jsonb,
  'An engineering drawing showing the exact path of underground factory pipes.',
  'ev_8',
  false,
  '{"descriptions":["An engineering blueprint in Marcus’s office shows: \"EMERGENCY VENT LINE - SECTOR B\".","At 01:45 PM: An engineering blueprint in Marcus’s office shows: \"EMERGENCY VENT LINE - SECTOR B\".","Notice this clue: An engineering blueprint in Marcus’s office shows: \"EMERGENCY VENT LINE - SECTOR B\"."],"hints":["An engineering drawing showing the exact path of underground factory pipes.","Clue hint: Think about refinery waste blueprint.","Search for: marcus designed the illegal dump line to avoid building a five-hundred-thousand-dollar scrubber."],"clues":["Refinery Waste Blueprint","Item: Refinery Waste Blueprint","Clue Word: Refinery Waste Blueprint"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '384b857e-d820-57ed-a2cf-2dc17f09a2a1',
  'story_068',
  'ev_8',
  8,
  '02:30 PM',
  'A hydraulic valve wheel on the refinery waste manifold is padlocked in the OPEN position.',
  'A hydraulic valve wheel on the refinery waste manifold is padlocked in the OPEN position.',
  'The valve was continuously pumping toxic gas out to the stone circle.',
  'Waste Manifold Valve',
  'Industrial steel valve marked "BYPASS TO MOOR" dripping with yellow sulfur crystals.',
  '["Water Tap","Gas Pipe","Steam Valve"]'::jsonb,
  'Waste Manifold Valve',
  '["waste manifold valve","valve","manifold valve","wheel","bypass valve"]'::jsonb,
  'A large circular metal handle on a factory pipe used to release chemical gas.',
  NULL,
  true,
  '{"descriptions":["A hydraulic valve wheel on the refinery waste manifold is padlocked in the OPEN position.","At 02:30 PM: A hydraulic valve wheel on the refinery waste manifold is padlocked in the OPEN position.","Notice this clue: A hydraulic valve wheel on the refinery waste manifold is padlocked in the OPEN position."],"hints":["A large circular metal handle on a factory pipe used to release chemical gas.","Clue hint: Think about waste manifold valve.","Search for: the valve was continuously pumping toxic gas out to the stone circle."],"clues":["Waste Manifold Valve","Item: Waste Manifold Valve","Clue Word: Waste Manifold Valve"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_069 — THE BOOK OF ANCIENT SEALS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_069',
  'The Book of Ancient Seals',
  'Supernatural',
  'The Highcrest Abbey Library, Gothic arches, stained glass, and a chained iron lectern',
  'A Latin grimoire bound in iron was found with its three heavy brass padlocks melted by extreme heat, and the page describing "The Demon of Fire" ripped out.',
  '[{"name":"Dr. Julian Vance","role":"Chief Manuscript Archivist","alibi":"In his office cataloging illuminated bibles","avatar":"📚"},{"name":"Brother Thomas","role":"Abbey Librarian Monk","alibi":"Praying in the abbey choir stalls","avatar":"⛪"},{"name":"Lord Arthur Sterling","role":"Rare Antiquities Collector","alibi":"In the abbey guest parlor drinking port wine","avatar":"🎩"},{"name":"Detective Frank Ross","role":"Arson & Art Theft Specialist","alibi":"Arrived at the abbey at 2:00 AM after Brother Thomas sounded the alarm","avatar":"🔍"}]'::jsonb,
  'Archivist Dr. Julian Vance applied a chemical paste of iron oxide and aluminum powder (thermite) to the three brass locks of the ancient manuscript. Ignited with a magnesium strip, the intense heat melted the padlocks in seconds. Julian sliced out the gold-leaf illumination and claimed demonic hellfire breached the grimoire.',
  'Archivist Dr. Julian Vance',
  'Julian wanted to steal the priceless gold-illuminated leaf from the 14th-century manuscript to sell to a collector.',
  '[{"time":"10:00 PM","event":"Brother Thomas completes his evening rounds and locks the library doors."},{"time":"11:45 PM","event":"Julian Vance applies thermite paste to the three brass locks on the grimoire."},{"time":"11:50 PM","event":"A magnesium strip ignites; white-hot flame melts the locks in six seconds."},{"time":"11:55 PM","event":"Julian slices Page 44 from the vellum binding using a scalpel."},{"time":"01:00 AM","event":"Brother Thomas wakes up, sees smoke in the library, and finds the melted book."}]'::jsonb,
  '[{"id":"ev1","title":"Thermite Slag on Melted Padlocks","detail":"Chemical analysis proves iron-aluminum pyrotechnic paste melted the medieval locks."},{"id":"ev2","title":"Gold Leaf on Julian’s Scalpel","detail":"24-carat medieval gold leaf on the blade matches the excised illumination of Page 44."},{"id":"ev3","title":"Magnesium Ribbon Fuse in Lectern","detail":"Matches the chemical igniter supply found in Dr. Julian Vance’s department office."},{"id":"ev4","title":"Zurich Mailing Tube with Page 44","detail":"Recovered in the outgoing mail bin containing the intact medieval demon illumination."}]'::jsonb,
  '[{"order":1,"title":"Melted Brass Padlocks","text":"Three medieval book locks melted by 2,500-degree chemical heat."},{"order":2,"title":"Sliced Manuscript Page","text":"Priceless 14th-century vellum page cleanly cut from the grimoire."},{"order":3,"title":"Magnesium Ribbon","text":"Metal fuse strip used to ignite the high-temperature thermite paste."},{"order":4,"title":"Thermite Paste Jar","text":"Chemical mixture of rust and aluminum powder used to melt the brass."},{"order":5,"title":"Gold-Flaked Scalpel","text":"Surgical knife bearing flakes of genuine medieval gold leaf."},{"order":6,"title":"Zurich Shipping Tube","text":"Postal container ready to ship the stolen artwork to a Swiss buyer."}]'::jsonb,
  'Brother Thomas fell asleep during prayer.: A lapse of monk discipline, but he was devout and innocent of theft.; The grimoire text described demonic fire spells.: Medieval folklore that provided convenient thematic cover for the theft.',
  'Claim an ancient demon escaped from the pages or blame the abbey monk Brother Thomas.',
  'NORMAL',
  'Did hellfire melt the ancient locks, or was an industrial chemical reaction used by an earthly thief?',
  '[{"character":"Dr. Julian Vance","secret":"He had a buyer in Zurich who agreed to pay two hundred thousand dollars for the missing leaf."},{"character":"Brother Thomas","secret":"He fell asleep in the chapel during his midnight prayer vigil."},{"character":"Lord Arthur Sterling","secret":"He was the anonymous collector who offered two hundred thousand dollars for the leaf."},{"character":"Detective Frank Ross","secret":"Investigated chemical safe-cracking burglaries in the capital."}]'::jsonb,
  '[{"lead":"Brother Thomas fell asleep during prayer.","explanation":"A lapse of monk discipline, but he was devout and innocent of theft."},{"lead":"The grimoire text described demonic fire spells.","explanation":"Medieval folklore that provided convenient thematic cover for the theft."}]'::jsonb,
  '{"wrongTheories":["A summoned demon broke its spiritual bonds and melted the locks with hellfire.","A lightning strike conducted down the stone roof and vaporized the brass padlocks."],"correctTheory":"Archivist Dr. Julian Vance applied chemical thermite paste to the three brass locks and ignited it with a magnesium ribbon to melt the padlocks in seconds, then sliced out Page 44 with a scalpel to sell the gold illumination to a Swiss buyer for two hundred thousand dollars."}'::jsonb,
  'Archivist Julian Vance melted the locks with chemical thermite to steal Page 44!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Ross intercepted the Zurich mailing tube and matched the gold leaf to Julian’s scalpel. Julian Vance was arrested for grand cultural theft and arson."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The abbey council declared the grimoire cursed and buried it in a crypt. Julian shipped the illuminated page to Zurich and collected two hundred thousand dollars."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Hellfire Manuscript of Highcrest\" became an international occult sensation, with thousands paying to see the melted metal while the art theft went unsolved."}]'::jsonb,
  '{"intros":["A Latin grimoire bound in iron was found with its three heavy brass padlocks melted by extreme heat, and the page describing \"The Demon of Fire\" ripped out.","Case file story_069: A Latin grimoire bound in iron was found with its three heavy brass padlocks melted by extreme heat, and the page describing \"The Demon of Fire\" ripped out. Look closely at every clue.","Trouble begins in The Highcrest Abbey Library, Gothic arches, stained glass, and a chained iron lectern. A Latin grimoire bound in iron was found with its three heavy brass padlocks melted by extreme heat, and the page describing \"The Demon of Fire\" ripped out.","The mystery starts now. A Latin grimoire bound in iron was found with its three heavy brass padlocks melted by extreme heat, and the page describing \"The Demon of Fire\" ripped out. Can you solve it?"],"reveals":["Archivist Julian Vance melted the locks with chemical thermite to steal Page 44!","The mystery is unraveled! Archivist Julian Vance melted the locks with chemical thermite to steal Page 44!","At last, the truth comes out: Archivist Julian Vance melted the locks with chemical thermite to steal Page 44!","Case resolved! Here is what happened: Archivist Julian Vance melted the locks with chemical thermite to steal Page 44!"],"hints":["Pay attention to where Archivist Dr. Julian Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_069';
DELETE FROM public.case_events WHERE case_id = 'story_069';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd9e49689-9aa3-507a-83ac-324ecff882e0',
  'story_069',
  'Dr. Julian Vance',
  'Chief Manuscript Archivist',
  'Distinguished, tweed suit, round spectacles, speaking in hushed reverent tones',
  'The locks were melted by unholy heat! The demon bound within the parchment has broken free!',
  'He had a buyer in Zurich who agreed to pay two hundred thousand dollars for the missing leaf.',
  'In his office cataloging illuminated bibles',
  'Custodian of the abbey’s medieval book vault',
  'Thermite burns at 2,500 degrees Celsius and leaves gray iron slag.',
  'Did not know he dropped a magnesium ignition strip in the lectern drawer.',
  '📚',
  '["The locks were melted by unholy heat! The demon bound within the parchment has broken free!","\"The locks were melted by unholy heat! The demon bound within the parchment has broken free!\"","Listen to me: The locks were melted by unholy heat! The demon bound within the parchment has broken free!","I tell you the truth: The locks were melted by unholy heat! The demon bound within the parchment has broken free!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7387f9db-2c25-500e-97c8-82fa0e113d39',
  'story_069',
  'Brother Thomas',
  'Abbey Librarian Monk',
  'Devout, humble, brown wool habit, holding a heavy iron key ring',
  'The grimoire has been chained to that lectern since 1450. No key has ever touched those locks.',
  'He fell asleep in the chapel during his midnight prayer vigil.',
  'Praying in the abbey choir stalls',
  'Guardian of the sacred library collection',
  'The missing page 44 contained rare powdered lapis lazuli and pure gold leaf.',
  'Did not know how chemical pyrotechnics can melt metal without sound.',
  '⛪',
  '["The grimoire has been chained to that lectern since 1450. No key has ever touched those locks.","\"The grimoire has been chained to that lectern since 1450. No key has ever touched those locks.\"","Listen to me: The grimoire has been chained to that lectern since 1450. No key has ever touched those locks.","I tell you the truth: The grimoire has been chained to that lectern since 1450. No key has ever touched those locks."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6edd4d6f-295f-54d6-a712-082d4a5dc57f',
  'story_069',
  'Lord Arthur Sterling',
  'Rare Antiquities Collector',
  'Wealthy, arrogant, wearing a velvet cape and inspecting books with a magnifying lens',
  'I came to inspect the grimoire for purchase. Now the most valuable page has vanished!',
  'He was the anonymous collector who offered two hundred thousand dollars for the leaf.',
  'In the abbey guest parlor drinking port wine',
  'Prospective buyer of the stolen medieval illumination',
  'The illumination depicted a medieval king surrounded by gold leaf fire.',
  'Did not know Julian would stage a demonic hoax to steal it.',
  '🎩',
  '["I came to inspect the grimoire for purchase. Now the most valuable page has vanished!","\"I came to inspect the grimoire for purchase. Now the most valuable page has vanished!\"","Listen to me: I came to inspect the grimoire for purchase. Now the most valuable page has vanished!","I tell you the truth: I came to inspect the grimoire for purchase. Now the most valuable page has vanished!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0b741de5-cb97-5f99-8eee-0334fbce4065',
  'story_069',
  'Detective Frank Ross',
  'Arson & Art Theft Specialist',
  'Sharp, skeptical, carries chemical sampling vials and ultraviolet flashlights',
  'Demons don’t leave aluminum powder and iron oxide chemical slag on melted brass padlocks.',
  'Investigated chemical safe-cracking burglaries in the capital.',
  'Arrived at the abbey at 2:00 AM after Brother Thomas sounded the alarm',
  'Leading the investigation into the manuscript desecration',
  'Found metallic thermite splatter on the stone floor beneath the lectern.',
  'Did not immediately locate where the excised gold leaf was hidden.',
  '🔍',
  '["Demons don’t leave aluminum powder and iron oxide chemical slag on melted brass padlocks.","\"Demons don’t leave aluminum powder and iron oxide chemical slag on melted brass padlocks.\"","Listen to me: Demons don’t leave aluminum powder and iron oxide chemical slag on melted brass padlocks.","I tell you the truth: Demons don’t leave aluminum powder and iron oxide chemical slag on melted brass padlocks."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6e723905-9a15-5c98-9714-27114467b016',
  'story_069',
  'ev_1',
  1,
  '11:50 PM',
  'Three heavy medieval brass padlocks on the grimoire are melted into bubbly slag puddles.',
  'Three heavy medieval brass padlocks on the grimoire are melted into bubbly slag puddles.',
  'The locks were destroyed by intense chemical heat exceeding 2,000 degrees Celsius.',
  'Melted Brass Padlocks',
  'Molten brass and iron slag welded to the heavy iron lectern chain.',
  '["Rusted Locks","Picked Padlocks","Cut Chains"]'::jsonb,
  'Melted Brass Padlocks',
  '["melted brass padlocks","padlocks","melted locks","brass locks","melted padlocks","locks"]'::jsonb,
  'Heavy metal locks melted into bubbly metal puddles by intense heat.',
  'ev_2',
  true,
  '{"descriptions":["Three heavy medieval brass padlocks on the grimoire are melted into bubbly slag puddles.","At 11:50 PM: Three heavy medieval brass padlocks on the grimoire are melted into bubbly slag puddles.","Notice this clue: Three heavy medieval brass padlocks on the grimoire are melted into bubbly slag puddles."],"hints":["Heavy metal locks melted into bubbly metal puddles by intense heat.","Clue hint: Think about melted brass padlocks.","Search for: the locks were destroyed by intense chemical heat exceeding 2,000 degrees celsius."],"clues":["Melted Brass Padlocks","Item: Melted Brass Padlocks","Clue Word: Melted Brass Padlocks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3aa97462-1cc9-5d80-90f7-a64ab111e163',
  'story_069',
  'ev_2',
  2,
  '11:55 PM',
  'Page 44, featuring a 14th-century gold-leaf illumination, is cleanly sliced from the vellum.',
  'Page 44, featuring a 14th-century gold-leaf illumination, is cleanly sliced from the vellum.',
  'The page was excised using a modern surgical scalpel, not ripped by claws.',
  'Sliced Manuscript Page',
  'Calfskin vellum book spine showing clean surgical scalpel cut lines.',
  '["Torn Page","Burnt Paper","Loose Leaf"]'::jsonb,
  'Sliced Manuscript Page',
  '["sliced manuscript page","page","sliced page","manuscript page","vellum page"]'::jsonb,
  'A thick sheet of ancient animal skin paper sliced out of an antique book.',
  'ev_3',
  false,
  '{"descriptions":["Page 44, featuring a 14th-century gold-leaf illumination, is cleanly sliced from the vellum.","At 11:55 PM: Page 44, featuring a 14th-century gold-leaf illumination, is cleanly sliced from the vellum.","Notice this clue: Page 44, featuring a 14th-century gold-leaf illumination, is cleanly sliced from the vellum."],"hints":["A thick sheet of ancient animal skin paper sliced out of an antique book.","Clue hint: Think about sliced manuscript page.","Search for: the page was excised using a modern surgical scalpel, not ripped by claws."],"clues":["Sliced Manuscript Page","Item: Sliced Manuscript Page","Clue Word: Sliced Manuscript Page"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bc0a3d57-f647-5f91-8642-e78a6f475421',
  'story_069',
  'ev_3',
  3,
  '12:05 AM',
  'A silver strip of unburnt magnesium metal ribbon is dropped in the lectern drawer.',
  'A silver strip of unburnt magnesium metal ribbon is dropped in the lectern drawer.',
  'The fuse used to ignite the high-temperature thermite paste.',
  'Magnesium Ribbon',
  'Flexible shiny metal strip used in chemistry labs as a high-heat igniter.',
  '["Matchstick","Fuse Cord","Wire"]'::jsonb,
  'Magnesium Ribbon',
  '["magnesium ribbon","ribbon","magnesium","fuse"]'::jsonb,
  'A thin, shiny metal strip that burns with a brilliant, blinding white flame.',
  'ev_4',
  false,
  '{"descriptions":["A silver strip of unburnt magnesium metal ribbon is dropped in the lectern drawer.","At 12:05 AM: A silver strip of unburnt magnesium metal ribbon is dropped in the lectern drawer.","Notice this clue: A silver strip of unburnt magnesium metal ribbon is dropped in the lectern drawer."],"hints":["A thin, shiny metal strip that burns with a brilliant, blinding white flame.","Clue hint: Think about magnesium ribbon.","Search for: the fuse used to ignite the high-temperature thermite paste."],"clues":["Magnesium Ribbon","Item: Magnesium Ribbon","Clue Word: Magnesium Ribbon"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd0dc36da-a2f6-5871-bd3d-b8e9182e3723',
  'story_069',
  'ev_4',
  4,
  '12:15 AM',
  'A jar of gray chemical paste containing iron oxide and aluminum powder is hidden in the lab.',
  'A jar of gray chemical paste containing iron oxide and aluminum powder is hidden in the lab.',
  'The home-made thermite mixture prepared by the archivist.',
  'Thermite Paste Jar',
  'Glass reagent jar filled with gray pyrotechnic paste labeled "Fe2O3 + Al".',
  '["Paint Can","Glue Bottle","Varnish"]'::jsonb,
  'Thermite Paste Jar',
  '["thermite paste jar","thermite","thermite paste","jar","chemical paste"]'::jsonb,
  'A thick chemical mixture of rust powder and aluminum that burns hot enough to melt steel.',
  'ev_5',
  false,
  '{"descriptions":["A jar of gray chemical paste containing iron oxide and aluminum powder is hidden in the lab.","At 12:15 AM: A jar of gray chemical paste containing iron oxide and aluminum powder is hidden in the lab.","Notice this clue: A jar of gray chemical paste containing iron oxide and aluminum powder is hidden in the lab."],"hints":["A thick chemical mixture of rust powder and aluminum that burns hot enough to melt steel.","Clue hint: Think about thermite paste jar.","Search for: the home-made thermite mixture prepared by the archivist."],"clues":["Thermite Paste Jar","Item: Thermite Paste Jar","Clue Word: Thermite Paste Jar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0258b0ec-1920-542d-9416-6e87998f64ee',
  'story_069',
  'ev_5',
  5,
  '12:30 AM',
  'An ultra-fine surgical scalpel with microscopic gold leaf on the blade is in Julian’s bag.',
  'An ultra-fine surgical scalpel with microscopic gold leaf on the blade is in Julian’s bag.',
  'The cutting instrument used to slice the illuminated page from the binding.',
  'Gold-Flaked Scalpel',
  'Stainless steel number 11 blade with flakes of 24-carat medieval gold leaf.',
  '["Pocket Knife","Scissors","Razor"]'::jsonb,
  'Gold-Flaked Scalpel',
  '["gold-flaked scalpel","scalpel","knife","surgical scalpel","blade"]'::jsonb,
  'A tiny, extremely sharp medical knife with small golden flakes on its tip.',
  'ev_6',
  true,
  '{"descriptions":["An ultra-fine surgical scalpel with microscopic gold leaf on the blade is in Julian’s bag.","At 12:30 AM: An ultra-fine surgical scalpel with microscopic gold leaf on the blade is in Julian’s bag.","Notice this clue: An ultra-fine surgical scalpel with microscopic gold leaf on the blade is in Julian’s bag."],"hints":["A tiny, extremely sharp medical knife with small golden flakes on its tip.","Clue hint: Think about gold-flaked scalpel.","Search for: the cutting instrument used to slice the illuminated page from the binding."],"clues":["Gold-Flaked Scalpel","Item: Gold-Flaked Scalpel","Clue Word: Gold-Flaked Scalpel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cd384fa4-afd9-5ded-a61b-1935934db24b',
  'story_069',
  'ev_6',
  6,
  '01:15 AM',
  'A cardboard mailing tube addressed to a private art dealer in Zurich is in the mail bin.',
  'A cardboard mailing tube addressed to a private art dealer in Zurich is in the mail bin.',
  'Julian had already packaged the stolen gold leaf for immediate overseas shipment.',
  'Zurich Shipping Tube',
  'Cardboard mailing cylinder marked "URGENT - ARTWORK - ZURICH".',
  '["Letter Envelope","Box","Luggage"]'::jsonb,
  'Zurich Shipping Tube',
  '["zurich shipping tube","tube","shipping tube","mailing tube","package"]'::jsonb,
  'A round cardboard cylinder used to send rolled-up maps and paintings through the mail.',
  'ev_7',
  false,
  '{"descriptions":["A cardboard mailing tube addressed to a private art dealer in Zurich is in the mail bin.","At 01:15 AM: A cardboard mailing tube addressed to a private art dealer in Zurich is in the mail bin.","Notice this clue: A cardboard mailing tube addressed to a private art dealer in Zurich is in the mail bin."],"hints":["A round cardboard cylinder used to send rolled-up maps and paintings through the mail.","Clue hint: Think about zurich shipping tube.","Search for: julian had already packaged the stolen gold leaf for immediate overseas shipment."],"clues":["Zurich Shipping Tube","Item: Zurich Shipping Tube","Clue Word: Zurich Shipping Tube"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '56d47ce4-5836-55c3-b332-86f94fa1f3d8',
  'story_069',
  'ev_7',
  7,
  '01:45 AM',
  'White magnesium oxide smoke powder coats the stone floor beneath the iron lectern.',
  'White magnesium oxide smoke powder coats the stone floor beneath the iron lectern.',
  'Chemical confirmation of an engineered pyrotechnic reaction.',
  'Magnesium Oxide Powder',
  'Fine white chemical ash produced exclusively by burning magnesium.',
  '["Soot","Chalk","Lime Dust"]'::jsonb,
  'Magnesium Oxide Powder',
  '["magnesium oxide powder","powder","magnesium oxide","white ash","chemical ash"]'::jsonb,
  'Fine white powdery ash left behind after magnesium metal burns.',
  'ev_8',
  false,
  '{"descriptions":["White magnesium oxide smoke powder coats the stone floor beneath the iron lectern.","At 01:45 AM: White magnesium oxide smoke powder coats the stone floor beneath the iron lectern.","Notice this clue: White magnesium oxide smoke powder coats the stone floor beneath the iron lectern."],"hints":["Fine white powdery ash left behind after magnesium metal burns.","Clue hint: Think about magnesium oxide powder.","Search for: chemical confirmation of an engineered pyrotechnic reaction."],"clues":["Magnesium Oxide Powder","Item: Magnesium Oxide Powder","Clue Word: Magnesium Oxide Powder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '984aac8e-b09a-5e6e-85ab-68ac1aec6171',
  'story_069',
  'ev_8',
  8,
  '02:30 AM',
  'A wire transfer confirmation showing a fifty-thousand-dollar deposit is on Julian’s laptop.',
  'A wire transfer confirmation showing a fifty-thousand-dollar deposit is on Julian’s laptop.',
  'The down payment Julian received from Lord Sterling’s Swiss intermediary.',
  'Wire Transfer Confirmation',
  'Banking slip showing fifty thousand dollars transferred to Julian’s account.',
  '["Checkbook","Receipt","Tax Form"]'::jsonb,
  'Wire Transfer Confirmation',
  '["wire transfer confirmation","wire transfer","transfer","confirmation","bank slip"]'::jsonb,
  'A paper or digital document confirming money sent electronically between bank accounts.',
  NULL,
  true,
  '{"descriptions":["A wire transfer confirmation showing a fifty-thousand-dollar deposit is on Julian’s laptop.","At 02:30 AM: A wire transfer confirmation showing a fifty-thousand-dollar deposit is on Julian’s laptop.","Notice this clue: A wire transfer confirmation showing a fifty-thousand-dollar deposit is on Julian’s laptop."],"hints":["A paper or digital document confirming money sent electronically between bank accounts.","Clue hint: Think about wire transfer confirmation.","Search for: the down payment julian received from lord sterling’s swiss intermediary."],"clues":["Wire Transfer Confirmation","Item: Wire Transfer Confirmation","Clue Word: Wire Transfer Confirmation"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_070 — THE BELL IN THE RUINED ABBEY
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_070',
  'The Bell in the Ruined Abbey',
  'Supernatural',
  'The Ruined Abbey of St. Jude, roofless stone arches, creeping ivy, and a high granite belfry tower',
  'The giant bronze bell in the ruined tower rang three loud solemn tolls at midnight, even though the clapper rope was cut decades ago.',
  '[{"name":"Victor Vance","role":"Contraband Smuggler & Mechanic","alibi":"In his boat repair workshop on the harbor dock","avatar":"⚓"},{"name":"Father Paul Cole","role":"Parish Priest","alibi":"In the modern church rectory three hundred yards away","avatar":"⛪"},{"name":"Toby Miller","role":"Local Gravedigger","alibi":"Digging a grave in the adjacent churchyard","avatar":"🪦"},{"name":"Detective Frank Rossi","role":"Technical Fraud & Smuggling Investigator","alibi":"Arrived at the abbey grounds at 11:30 PM with climbing gear","avatar":"🔍"}]'::jsonb,
  'Smuggler Victor Vance mounted an automotive starter solenoid with a heavy steel hammer directly behind the bronze bell rim. Controlled by a radio-frequency remote from his boat, Victor triggered the three tolls at midnight to signal his offshore landing crew while townspeople hid in fear of the ghost.',
  'Smuggler Victor Vance',
  'Victor used the bell strikes as an acoustic signal to coordinate coastal contraband drops in the fog.',
  '[{"time":"10:00 PM","event":"Victor climbs the belfry tower and clamps an electromagnetic solenoid to the bell frame."},{"time":"11:45 PM","event":"Victor returns to his coastal motor skiff anchored half a mile offshore."},{"time":"12:00 AM","event":"Victor clicks his radio remote; the solenoid fires three times against the bronze rim."},{"time":"12:02 AM","event":"Three thunderous chimes boom across the sea, signaling the waiting contraband barge."},{"time":"12:30 AM","event":"Detective Rossi scales the stone tower and discovers the electronic striker."}]'::jsonb,
  '[{"id":"ev1","title":"Automotive Solenoid Striker on Bell","detail":"Found bolted to the timber frame, equipped with a steel ball-peen hammer head."},{"id":"ev2","title":"Radio Receiver Paired to Victor’s Fob","detail":"Operating on 433 MHz, confirmed to trigger three electrical pulses upon button press."},{"id":"ev3","title":"Truck Battery in Stone Tomb","detail":"Supplied 12V current through green wires camouflaged inside the wall ivy."},{"id":"ev4","title":"Contraband Electronics Manifest","detail":"Found aboard Victor’s skiff, proving the bell was an acoustic landing signal for smugglers."}]'::jsonb,
  '[{"order":1,"title":"Three Bronze Chimes","text":"Midnight bell tolls sounding from a ruined abbey tower with no clapper rope."},{"order":2,"title":"Electric Solenoid Striker","text":"Automotive motor modified to strike the bronze bell rim on radio command."},{"order":3,"title":"Radio Receiver Box","text":"Wireless electronic receiver receiving trigger signals from the coast."},{"order":4,"title":"Truck Battery in Tomb","text":"Power source hidden inside an ancient stone sarcophagus in the crypt."},{"order":5,"title":"Camouflaged Wire","text":"Green copper cables woven through the ivy up the side of the stone tower."},{"order":6,"title":"Radio Remote Control","text":"Key-fob transmitter found in the smuggler’s coat paired to the striker."}]'::jsonb,
  'Gravedigger Toby saw a blue spark.: The electrical arc of the solenoid firing, not a spectral ghost.; Father Paul believed an exorcism was needed.: Religious devotion, but blind to modern electrical technology.',
  'Claim the phantom of the hanged monk rang the death knell or blame the church caretaker.',
  'NORMAL',
  'What was swinging the heavy bronze bell in the roofless belfry without a rope?',
  '[{"character":"Victor Vance","secret":"He has fifty crates of smuggled electronics waiting on a barge in the cove."},{"character":"Father Paul Cole","secret":"He was considering reconsecrating the ruins with an exorcism ritual."},{"character":"Toby Miller","secret":"He found a car battery in the church crypt yesterday and left it alone."},{"character":"Detective Frank Rossi","secret":"Investigated radio-controlled smuggling signals along the coast."}]'::jsonb,
  '[{"lead":"Gravedigger Toby saw a blue spark.","explanation":"The electrical arc of the solenoid firing, not a spectral ghost."},{"lead":"Father Paul believed an exorcism was needed.","explanation":"Religious devotion, but blind to modern electrical technology."}]'::jsonb,
  '{"wrongTheories":["The hanged monk’s phantom returned to ring the death knell for the village.","Thunderstorm atmospheric static charged the bronze bell and caused sympathetic ringing."],"correctTheory":"Smuggler Victor Vance clamped an automotive solenoid hammer to the ancient abbey bell, wired it to a truck battery in a tomb, and triggered three tolls with a radio remote from his boat to signal his contraband landing crew in the fog."}'::jsonb,
  'Smuggler Victor Vance rigged an electric solenoid to signal his contraband boats!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Rossi disconnected the solenoid and ambushed the contraband barge at Black Cove. Victor Vance was arrested for maritime smuggling and reckless endangerment."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The town barricaded their doors against the phantom monk. Victor unloaded fifty crates of contraband and sold them for a massive profit."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Phantom Chimes of St. Jude\" became a protected folklore legend, with the town holding annual candlelight vigils while the smuggling went unnoticed."}]'::jsonb,
  '{"intros":["The giant bronze bell in the ruined tower rang three loud solemn tolls at midnight, even though the clapper rope was cut decades ago.","Case file story_070: The giant bronze bell in the ruined tower rang three loud solemn tolls at midnight, even though the clapper rope was cut decades ago. Look closely at every clue.","Trouble begins in The Ruined Abbey of St. Jude, roofless stone arches, creeping ivy, and a high granite belfry tower. The giant bronze bell in the ruined tower rang three loud solemn tolls at midnight, even though the clapper rope was cut decades ago.","The mystery starts now. The giant bronze bell in the ruined tower rang three loud solemn tolls at midnight, even though the clapper rope was cut decades ago. Can you solve it?"],"reveals":["Smuggler Victor Vance rigged an electric solenoid to signal his contraband boats!","The mystery is unraveled! Smuggler Victor Vance rigged an electric solenoid to signal his contraband boats!","At last, the truth comes out: Smuggler Victor Vance rigged an electric solenoid to signal his contraband boats!","Case resolved! Here is what happened: Smuggler Victor Vance rigged an electric solenoid to signal his contraband boats!"],"hints":["Pay attention to where Smuggler Victor Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_070';
DELETE FROM public.case_events WHERE case_id = 'story_070';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ce4d1ad7-337f-53a5-b80e-b1412af30818',
  'story_070',
  'Victor Vance',
  'Contraband Smuggler & Mechanic',
  'Weathered, calculating, wearing dark woolen peacoat, smelling of diesel and seawater',
  'The bell has rung on stormy nights since the abbey burned in 1910. It’s the phantom monk’s curse.',
  'He has fifty crates of smuggled electronics waiting on a barge in the cove.',
  'In his boat repair workshop on the harbor dock',
  'Operates coastal maritime cargo skiffs near the abbey cliffs',
  'Three bell tolls can be heard four miles out to sea in dense fog.',
  'Did not know an electronic signal scanner logged his 433 MHz radio transmitter.',
  '⚓',
  '["The bell has rung on stormy nights since the abbey burned in 1910. It’s the phantom monk’s curse.","\"The bell has rung on stormy nights since the abbey burned in 1910. It’s the phantom monk’s curse.\"","Listen to me: The bell has rung on stormy nights since the abbey burned in 1910. It’s the phantom monk’s curse.","I tell you the truth: The bell has rung on stormy nights since the abbey burned in 1910. It’s the phantom monk’s curse."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '37d6adde-be17-5d84-89e7-e8c2241e0732',
  'story_070',
  'Father Paul Cole',
  'Parish Priest',
  'Pious, anxious, clutching a heavy iron cross and holy water flask',
  'The bell rope was cut in 1950! There is no rope in that belfry, yet the bronze chimes ring out.',
  'He was considering reconsecrating the ruins with an exorcism ritual.',
  'In the modern church rectory three hundred yards away',
  'Custodian of the ruined abbey grounds',
  'The bell strikes exactly three times at 12:00 AM, 12:05 AM, and 12:10 AM.',
  'Did not understand modern electronic radio solenoids.',
  '⛪',
  '["The bell rope was cut in 1950! There is no rope in that belfry, yet the bronze chimes ring out.","\"The bell rope was cut in 1950! There is no rope in that belfry, yet the bronze chimes ring out.\"","Listen to me: The bell rope was cut in 1950! There is no rope in that belfry, yet the bronze chimes ring out.","I tell you the truth: The bell rope was cut in 1950! There is no rope in that belfry, yet the bronze chimes ring out."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4ca9b36a-d3a0-5473-8bdc-4e6225420571',
  'story_070',
  'Toby Miller',
  'Local Gravedigger',
  'Simple, superstitious, leaning on a spade, afraid of the dark belfry',
  'I saw a blue spark flash in the bell tower right before the second toll rang out!',
  'He found a car battery in the church crypt yesterday and left it alone.',
  'Digging a grave in the adjacent churchyard',
  'Witness who spotted the electrical spark in the high tower',
  'The stone steps to the belfry had fresh mud shoe prints.',
  'Thought the blue spark was a ghostly soul manifestation.',
  '🪦',
  '["I saw a blue spark flash in the bell tower right before the second toll rang out!","\"I saw a blue spark flash in the bell tower right before the second toll rang out!\"","Listen to me: I saw a blue spark flash in the bell tower right before the second toll rang out!","I tell you the truth: I saw a blue spark flash in the bell tower right before the second toll rang out!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f3c3eb0e-7de0-5427-9d00-c87e12996e5d',
  'story_070',
  'Detective Frank Rossi',
  'Technical Fraud & Smuggling Investigator',
  'Methodical, sharp, carries climbing harnesses and radio spectrum analyzers',
  'Bronze bells ring when an iron hammer strikes them. We are looking for an electronic actuator.',
  'Investigated radio-controlled smuggling signals along the coast.',
  'Arrived at the abbey grounds at 11:30 PM with climbing gear',
  'Leading the investigation into the mysterious acoustic signals',
  'Found heavy copper jumper cables hidden inside the ivy climbing the stone tower.',
  'Did not immediately locate where Victor’s boat was anchored.',
  '🔍',
  '["Bronze bells ring when an iron hammer strikes them. We are looking for an electronic actuator.","\"Bronze bells ring when an iron hammer strikes them. We are looking for an electronic actuator.\"","Listen to me: Bronze bells ring when an iron hammer strikes them. We are looking for an electronic actuator.","I tell you the truth: Bronze bells ring when an iron hammer strikes them. We are looking for an electronic actuator."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd936c791-3863-5919-899c-45b11d5b0f43',
  'story_070',
  'ev_1',
  1,
  '12:00 AM',
  'Three deep bronze chimes boom from the high roofless abbey belfry across the foggy sea.',
  'Three deep bronze chimes boom from the high roofless abbey belfry across the foggy sea.',
  'The bell was struck mechanically by an external iron hammer, not by swinging a clapper.',
  'Three Bronze Chimes',
  'Acoustic resonance recording of a 500-pound bronze church bell striking at 12:00 AM.',
  '["Organ Tone","Whistle Blast","Thunder Crack"]'::jsonb,
  'Three Bronze Chimes',
  '["three bronze chimes","chimes","bell","three chimes","tolls","bronze bell"]'::jsonb,
  'Deep ringing musical sounds produced by a heavy metal church bell.',
  'ev_2',
  true,
  '{"descriptions":["Three deep bronze chimes boom from the high roofless abbey belfry across the foggy sea.","At 12:00 AM: Three deep bronze chimes boom from the high roofless abbey belfry across the foggy sea.","Notice this clue: Three deep bronze chimes boom from the high roofless abbey belfry across the foggy sea."],"hints":["Deep ringing musical sounds produced by a heavy metal church bell.","Clue hint: Think about three bronze chimes.","Search for: the bell was struck mechanically by an external iron hammer, not by swinging a clapper."],"clues":["Three Bronze Chimes","Item: Three Bronze Chimes","Clue Word: Three Bronze Chimes"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd9e4965e-0bbc-5cf2-b7e0-53e3421b775e',
  'story_070',
  'ev_2',
  2,
  '12:02 AM',
  'An automotive 12-volt heavy-duty starter solenoid is clamped to the iron bell yoke.',
  'An automotive 12-volt heavy-duty starter solenoid is clamped to the iron bell yoke.',
  'The electric piston rammed a steel ball-peen hammer against the bell’s outer lip.',
  'Electric Solenoid Striker',
  'Heavy cylindrical electric starter motor with an iron hammer welded to the plunger.',
  '["Car Horn","Winch Motor","Pulley"]'::jsonb,
  'Electric Solenoid Striker',
  '["electric solenoid striker","solenoid","striker","electric striker","solenoid striker","hammer"]'::jsonb,
  'An electrical device with a metal plunger that shoots forward when power is turned on.',
  'ev_3',
  false,
  '{"descriptions":["An automotive 12-volt heavy-duty starter solenoid is clamped to the iron bell yoke.","At 12:02 AM: An automotive 12-volt heavy-duty starter solenoid is clamped to the iron bell yoke.","Notice this clue: An automotive 12-volt heavy-duty starter solenoid is clamped to the iron bell yoke."],"hints":["An electrical device with a metal plunger that shoots forward when power is turned on.","Clue hint: Think about electric solenoid striker.","Search for: the electric piston rammed a steel ball-peen hammer against the bell’s outer lip."],"clues":["Electric Solenoid Striker","Item: Electric Solenoid Striker","Clue Word: Electric Solenoid Striker"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3b146969-0a98-5f74-a415-a90620387426',
  'story_070',
  'ev_3',
  3,
  '12:05 AM',
  'A 433 MHz wireless radio relay receiver is tucked behind the bell mounting timber.',
  'A 433 MHz wireless radio relay receiver is tucked behind the bell mounting timber.',
  'The striker was activated from up to a mile away using a simple radio remote button.',
  'Radio Receiver Box',
  'Small plastic circuit board with an antenna wire receiving 433 MHz signals.',
  '["Walkie Talkie","Cell Phone","Battery Charger"]'::jsonb,
  'Radio Receiver Box',
  '["radio receiver box","receiver","radio receiver","box","relay box"]'::jsonb,
  'A small electronic unit with an antenna that catches radio waves sent through the air.',
  'ev_4',
  false,
  '{"descriptions":["A 433 MHz wireless radio relay receiver is tucked behind the bell mounting timber.","At 12:05 AM: A 433 MHz wireless radio relay receiver is tucked behind the bell mounting timber.","Notice this clue: A 433 MHz wireless radio relay receiver is tucked behind the bell mounting timber."],"hints":["A small electronic unit with an antenna that catches radio waves sent through the air.","Clue hint: Think about radio receiver box.","Search for: the striker was activated from up to a mile away using a simple radio remote button."],"clues":["Radio Receiver Box","Item: Radio Receiver Box","Clue Word: Radio Receiver Box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8a320a13-93d4-56f2-81e0-635985416e2c',
  'story_070',
  'ev_4',
  4,
  '12:10 AM',
  'A heavy 12-volt commercial truck battery is hidden inside an ancient stone sarcophagus.',
  'A heavy 12-volt commercial truck battery is hidden inside an ancient stone sarcophagus.',
  'The power source for the solenoid was concealed inside an empty medieval tomb.',
  'Truck Battery in Tomb',
  'Heavy lead-acid battery wired to insulated cables running up the belfry ivy.',
  '["Car Battery","AA Battery","Solar Panel"]'::jsonb,
  'Truck Battery in Tomb',
  '["truck battery in tomb","battery","truck battery","battery in tomb","power source"]'::jsonb,
  'A heavy plastic box holding acid and lead plates that stores electric power for vehicles.',
  'ev_5',
  false,
  '{"descriptions":["A heavy 12-volt commercial truck battery is hidden inside an ancient stone sarcophagus.","At 12:10 AM: A heavy 12-volt commercial truck battery is hidden inside an ancient stone sarcophagus.","Notice this clue: A heavy 12-volt commercial truck battery is hidden inside an ancient stone sarcophagus."],"hints":["A heavy plastic box holding acid and lead plates that stores electric power for vehicles.","Clue hint: Think about truck battery in tomb.","Search for: the power source for the solenoid was concealed inside an empty medieval tomb."],"clues":["Truck Battery in Tomb","Item: Truck Battery in Tomb","Clue Word: Truck Battery in Tomb"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '16a545ff-d873-520f-942b-4feee2f3bdf3',
  'story_070',
  'ev_5',
  5,
  '12:20 AM',
  'Twin strands of green insulated copper wire are woven through the thick English ivy.',
  'Twin strands of green insulated copper wire are woven through the thick English ivy.',
  'The wire carried electric current from the crypt battery up seventy feet to the belfry.',
  'Camouflaged Wire',
  'Green plastic-coated 10-gauge electrical wire concealed within living ivy vines.',
  '["Rope","String","Steel Cable"]'::jsonb,
  'Camouflaged Wire',
  '["camouflaged wire","wire","copper wire","cables"]'::jsonb,
  'Long thin metal lines covered in green plastic hidden among climbing wall plants.',
  'ev_6',
  true,
  '{"descriptions":["Twin strands of green insulated copper wire are woven through the thick English ivy.","At 12:20 AM: Twin strands of green insulated copper wire are woven through the thick English ivy.","Notice this clue: Twin strands of green insulated copper wire are woven through the thick English ivy."],"hints":["Long thin metal lines covered in green plastic hidden among climbing wall plants.","Clue hint: Think about camouflaged wire.","Search for: the wire carried electric current from the crypt battery up seventy feet to the belfry."],"clues":["Camouflaged Wire","Item: Camouflaged Wire","Clue Word: Camouflaged Wire"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4623ca17-3cb5-59bb-9b30-8e62b6793020',
  'story_070',
  'ev_6',
  6,
  '12:35 AM',
  'A handheld 4-channel radio garage-door remote control is seized from Victor’s pocket.',
  'A handheld 4-channel radio garage-door remote control is seized from Victor’s pocket.',
  'Button 1 was programmed to fire three electrical pulses to the bell receiver.',
  'Radio Remote Control',
  'Black key-fob transmitter broadcasting on the exact frequency of the tower receiver.',
  '["Car Key","Pocket Knife","Flashlight"]'::jsonb,
  'Radio Remote Control',
  '["radio remote control","remote","radio remote","remote control","fob","key fob"]'::jsonb,
  'A small handheld plastic gadget with buttons used to open gates or control machines.',
  'ev_7',
  false,
  '{"descriptions":["A handheld 4-channel radio garage-door remote control is seized from Victor’s pocket.","At 12:35 AM: A handheld 4-channel radio garage-door remote control is seized from Victor’s pocket.","Notice this clue: A handheld 4-channel radio garage-door remote control is seized from Victor’s pocket."],"hints":["A small handheld plastic gadget with buttons used to open gates or control machines.","Clue hint: Think about radio remote control.","Search for: button 1 was programmed to fire three electrical pulses to the bell receiver."],"clues":["Radio Remote Control","Item: Radio Remote Control","Clue Word: Radio Remote Control"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f43c6d19-7585-59e0-832b-a31835c89351',
  'story_070',
  'ev_7',
  7,
  '01:00 AM',
  'A cargo manifest showing fifty crates of untaxed luxury electronics is on Victor’s boat.',
  'A cargo manifest showing fifty crates of untaxed luxury electronics is on Victor’s boat.',
  'The three bell tolls signaled the barge to begin landing cargo in the dark cove.',
  'Smuggling Cargo Manifest',
  'Waterproof paper invoice listing high-value contraband awaiting landing.',
  '["Fishing Log","Receipt","Newspaper"]'::jsonb,
  'Smuggling Cargo Manifest',
  '["smuggling cargo manifest","manifest","cargo manifest","smuggling manifest","invoice"]'::jsonb,
  'A shipping paper listing all boxes of goods carried on a cargo ship or truck.',
  'ev_8',
  false,
  '{"descriptions":["A cargo manifest showing fifty crates of untaxed luxury electronics is on Victor’s boat.","At 01:00 AM: A cargo manifest showing fifty crates of untaxed luxury electronics is on Victor’s boat.","Notice this clue: A cargo manifest showing fifty crates of untaxed luxury electronics is on Victor’s boat."],"hints":["A shipping paper listing all boxes of goods carried on a cargo ship or truck.","Clue hint: Think about smuggling cargo manifest.","Search for: the three bell tolls signaled the barge to begin landing cargo in the dark cove."],"clues":["Smuggling Cargo Manifest","Item: Smuggling Cargo Manifest","Clue Word: Smuggling Cargo Manifest"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a94fab67-8f76-5d8f-8071-5ad507e65e0b',
  'story_070',
  'ev_8',
  8,
  '01:30 AM',
  'Fresh hammer strike dent marks with bright copper shine are visible on the ancient bronze bell rim.',
  'Fresh hammer strike dent marks with bright copper shine are visible on the ancient bronze bell rim.',
  'Microscopic forensic proof that the bell was struck on its outer lip by a modern tool.',
  'Hammer Strike Dents',
  'Twin fresh impact craters on the weathered green patina of the 500-pound bell.',
  '["Rust Scratches","Bird Scratches","Crack Lines"]'::jsonb,
  'Hammer Strike Dents',
  '["hammer strike dents","dents","strike dents","hammer dents","impact marks"]'::jsonb,
  'Small round depressions made in metal when struck forcefully with a steel hammer.',
  NULL,
  true,
  '{"descriptions":["Fresh hammer strike dent marks with bright copper shine are visible on the ancient bronze bell rim.","At 01:30 AM: Fresh hammer strike dent marks with bright copper shine are visible on the ancient bronze bell rim.","Notice this clue: Fresh hammer strike dent marks with bright copper shine are visible on the ancient bronze bell rim."],"hints":["Small round depressions made in metal when struck forcefully with a steel hammer.","Clue hint: Think about hammer strike dents.","Search for: microscopic forensic proof that the bell was struck on its outer lip by a modern tool."],"clues":["Hammer Strike Dents","Item: Hammer Strike Dents","Clue Word: Hammer Strike Dents"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_071 — THE SHADOW IN THE PAINTING
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_071',
  'The Shadow in the Painting',
  'Supernatural',
  'The Blackwood Grand Gallery, gilded picture frames, parquet floors, and a life-sized portrait of Lord Malachi',
  'Visitors screamed as the painted eyes of Lord Malachi’s 18th-century portrait followed them across the room and blinked at midnight.',
  '[{"name":"Julian Vance","role":"Master Art Restorer & Forger","alibi":"In the conservation studio cleaning old canvas frames","avatar":"🎨"},{"name":"Lord Malachi (Deceased 1790)","role":"Late Ancestral Patriarch","alibi":"In the family crypt on the estate grounds","avatar":"🖼️"},{"name":"Clara Reed","role":"Museum Evening Docent","alibi":"Locking the front velvet stanchions","avatar":"🏛️"},{"name":"Detective Thomas Hansen","role":"Fine Arts Theft Specialist","alibi":"Dispatched to the gallery following reports of a perimeter breach","avatar":"🔍"}]'::jsonb,
  'Art forger Julian Vance cut microscopic pinhole apertures in the painted pupils of Lord Malachi’s portrait. Standing inside a concealed wall cavity behind the canvas, Julian used night-vision goggles to monitor the security guard’s patrol rounds, blinking a mechanical shutter to steal the Duchess Diamond necklace.',
  'Art Forger Julian Vance',
  'Julian hid behind the hollow gallery wall to spy on museum security patrols and steal a diamond necklace.',
  '[{"time":"09:00 PM","event":"Julian enters the secret wall chase behind the tapestry with night-vision gear."},{"time":"11:45 PM","event":"Julian peers through the pinhole pupils of the portrait to observe guard patrols."},{"time":"11:55 PM","event":"Julian blinks a mechanical shutter to adjust his lens; docent Clara screams."},{"time":"12:15 AM","event":"Julian slips out through the tapestry, cuts the glass case, and takes the diamond necklace."},{"time":"12:45 AM","event":"Detective Hansen uses thermal imaging and spots heat signatures in the wall cavity."}]'::jsonb,
  '[{"id":"ev1","title":"Pinhole Cuts in Canvas Pupils","detail":"Microscopic apertures cleanly cut through the portrait to create a surveillance peephole."},{"id":"ev2","title":"FLIR Thermal Human Heat Signature","detail":"Proves a living person was physically standing inside the wall behind the painting."},{"id":"ev3","title":"Night-Vision Goggles with Julian’s DNA","detail":"Discovered in the wall cavity alongside footprints matching Julian’s dress shoes."},{"id":"ev4","title":"Duchess Diamond Necklace in Varnish Tin","detail":"Recovered from Julian Vance’s restoration studio, proving the motive for the surveillance trick."}]'::jsonb,
  '[{"order":1,"title":"Pinhole Canvas Pupils","text":"Microscopic holes cut into the painted eyes to allow a human to peer through."},{"order":2,"title":"Mechanical Shutter Click","text":"Camera iris aperture that cycled open and closed, creating the illusion of a blink."},{"order":3,"title":"Hidden Wall Cavity","text":"Secret three-foot space behind the gallery wall used as a surveillance hideout."},{"order":4,"title":"Stolen Diamond Necklace","text":"Fifty-carat jewel heisted from the central display case during the patrol gap."},{"order":5,"title":"Thermal Heat Signature","text":"Infrared evidence revealing a warm human body standing behind the cold canvas."},{"order":6,"title":"Night-Vision Goggles","text":"Military optical gear used by the forger to watch the gallery in total darkness."}]'::jsonb,
  'The painting had a legendary family curse attached to it.: A 200-year-old marketing legend promoted by the museum.; Docent Clara panicked and dropped her keys.: Genuinely terrified by seeing the painted eyes blink in the dark.',
  'Claim Lord Malachi’s soul was trapped in the oil paint or blame the museum docent.',
  'NORMAL',
  'Were the eyes possessed by the dead lord’s spirit, or was someone peering through the canvas?',
  '[{"character":"Julian Vance","secret":"He cut out a hidden access door behind the neighboring French tapestry."},{"character":"Lord Malachi (Deceased 1790)","secret":"He was rumored to have cursed his descendants from beyond the grave."},{"character":"Clara Reed","secret":"She was afraid of being alone in the gallery after dark."},{"character":"Detective Thomas Hansen","secret":"Investigated five museum burglaries executed through false walls."}]'::jsonb,
  '[{"lead":"The painting had a legendary family curse attached to it.","explanation":"A 200-year-old marketing legend promoted by the museum."},{"lead":"Docent Clara panicked and dropped her keys.","explanation":"Genuinely terrified by seeing the painted eyes blink in the dark."}]'::jsonb,
  '{"wrongTheories":["The soul of Lord Malachi reanimated the oil portrait to guard his ancestral gallery.","An optical trick of light from passing cars created the illusion of shifting eyes."],"correctTheory":"Art restorer Julian Vance cut pinhole apertures in the painted pupils of Lord Malachi’s portrait, hid inside a concealed wall cavity behind the canvas using night-vision goggles to spy on guard patrols, and used the surveillance blind to heist the Duchess Diamond necklace."}'::jsonb,
  'Art restorer Julian Vance cut pinholes in the eyes to spy on guards and steal diamonds!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Hansen breached the wall cavity and arrested Julian Vance with the night-vision goggles and the diamond necklace. The painting was restored and the gallery secured."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The museum board closed the gallery in supernatural fear. Julian removed the diamonds from the varnish tin and escaped to Switzerland."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Living Portrait of Lord Malachi\" became the most famous haunted painting in the world. Ticket sales skyrocketed while the jewel theft went unsolved."}]'::jsonb,
  '{"intros":["Visitors screamed as the painted eyes of Lord Malachi’s 18th-century portrait followed them across the room and blinked at midnight.","Case file story_071: Visitors screamed as the painted eyes of Lord Malachi’s 18th-century portrait followed them across the room and blinked at midnight. Look closely at every clue.","Trouble begins in The Blackwood Grand Gallery, gilded picture frames, parquet floors, and a life-sized portrait of Lord Malachi. Visitors screamed as the painted eyes of Lord Malachi’s 18th-century portrait followed them across the room and blinked at midnight.","The mystery starts now. Visitors screamed as the painted eyes of Lord Malachi’s 18th-century portrait followed them across the room and blinked at midnight. Can you solve it?"],"reveals":["Art restorer Julian Vance cut pinholes in the eyes to spy on guards and steal diamonds!","The mystery is unraveled! Art restorer Julian Vance cut pinholes in the eyes to spy on guards and steal diamonds!","At last, the truth comes out: Art restorer Julian Vance cut pinholes in the eyes to spy on guards and steal diamonds!","Case resolved! Here is what happened: Art restorer Julian Vance cut pinholes in the eyes to spy on guards and steal diamonds!"],"hints":["Pay attention to where Art Forger Julian Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_071';
DELETE FROM public.case_events WHERE case_id = 'story_071';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4875e6b4-5b75-5e22-8518-6eb4ddc8fbf8',
  'story_071',
  'Julian Vance',
  'Master Art Restorer & Forger',
  'Refined, bespectacled, velvet jacket, holding a varnish brush and smelling of turpentine',
  'The portrait of Lord Malachi has displayed supernatural ocular tracking for two hundred years.',
  'He cut out a hidden access door behind the neighboring French tapestry.',
  'In the conservation studio cleaning old canvas frames',
  'Contracted restorer working on the gallery’s historic portrait collection',
  'The wall cavity connects the HVAC pipe chase to the rear of the portrait.',
  'Did not know an infrared thermal camera detected his body heat behind the canvas.',
  '🎨',
  '["The portrait of Lord Malachi has displayed supernatural ocular tracking for two hundred years.","\"The portrait of Lord Malachi has displayed supernatural ocular tracking for two hundred years.\"","Listen to me: The portrait of Lord Malachi has displayed supernatural ocular tracking for two hundred years.","I tell you the truth: The portrait of Lord Malachi has displayed supernatural ocular tracking for two hundred years."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9162d4fa-1416-511e-bc59-daf3ee938892',
  'story_071',
  'Lord Malachi (Deceased 1790)',
  'Late Ancestral Patriarch',
  'Austere, stern, depicted in a dark velvet frock coat and powdered wig',
  'Subject of the portrait; painted on Belgian linen with dark piercing brown eyes.',
  'He was rumored to have cursed his descendants from beyond the grave.',
  'In the family crypt on the estate grounds',
  'Historic figure in the painting',
  'His portrait was hung over the secret servant maintenance tunnel.',
  'Could not prevent his portrait from being used as a surveillance blind.',
  '🖼️',
  '["Subject of the portrait; painted on Belgian linen with dark piercing brown eyes.","\"Subject of the portrait; painted on Belgian linen with dark piercing brown eyes.\"","Listen to me: Subject of the portrait; painted on Belgian linen with dark piercing brown eyes.","I tell you the truth: Subject of the portrait; painted on Belgian linen with dark piercing brown eyes."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '989aa7c9-e2a1-5a4d-976d-91707a95cc28',
  'story_071',
  'Clara Reed',
  'Museum Evening Docent',
  'Observant, nervous, holding a gallery brochure and flashlight',
  'I swear on my life, at 11:55 PM the eyes blinked! A shadow passed over the white iris!',
  'She was afraid of being alone in the gallery after dark.',
  'Locking the front velvet stanchions',
  'First person to report the living eyes in the portrait',
  'The floorboards behind the portrait squeaked when someone shifted weight.',
  'Did not know someone was physically standing inside the hollow wall.',
  '🏛️',
  '["I swear on my life, at 11:55 PM the eyes blinked! A shadow passed over the white iris!","\"I swear on my life, at 11:55 PM the eyes blinked! A shadow passed over the white iris!\"","Listen to me: I swear on my life, at 11:55 PM the eyes blinked! A shadow passed over the white iris!","I tell you the truth: I swear on my life, at 11:55 PM the eyes blinked! A shadow passed over the white iris!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4b2e7ba5-8f26-5f7b-899a-de56db344d76',
  'story_071',
  'Detective Thomas Hansen',
  'Fine Arts Theft Specialist',
  'Methodical, skeptical, carrying thermal imaging scopes and magnifying loupes',
  'Paintings don’t have human core body temperatures of 98.6 degrees Fahrenheit.',
  'Investigated five museum burglaries executed through false walls.',
  'Dispatched to the gallery following reports of a perimeter breach',
  'Leading the search for the stolen Duchess Diamond necklace',
  'Found microscopic razor slices around the painted eye pupils.',
  'Did not immediately locate where the stolen diamond was stashed.',
  '🔍',
  '["Paintings don’t have human core body temperatures of 98.6 degrees Fahrenheit.","\"Paintings don’t have human core body temperatures of 98.6 degrees Fahrenheit.\"","Listen to me: Paintings don’t have human core body temperatures of 98.6 degrees Fahrenheit.","I tell you the truth: Paintings don’t have human core body temperatures of 98.6 degrees Fahrenheit."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f4e09aa9-8396-5a66-b9dd-26c6a7bfcd36',
  'story_071',
  'ev_1',
  1,
  '11:45 PM',
  'The dark painted eyes of an 18th-century oil portrait appear to shift and focus across the gallery.',
  'The dark painted eyes of an 18th-century oil portrait appear to shift and focus across the gallery.',
  'The painted pupils were sliced out with microscopic pinhole cuts to allow human eyes to peer through.',
  'Pinhole Canvas Pupils',
  'One-millimeter circular incisions through the painted dark brown pupils of the portrait.',
  '["Torn Canvas","Paint Flake","Cracked Varnish"]'::jsonb,
  'Pinhole Canvas Pupils',
  '["pinhole canvas pupils","pupils","eyes","pinhole pupils","cut eyes","holes"]'::jsonb,
  'Tiny round holes cut into the painted eyes of a portrait to see through.',
  'ev_2',
  true,
  '{"descriptions":["The dark painted eyes of an 18th-century oil portrait appear to shift and focus across the gallery.","At 11:45 PM: The dark painted eyes of an 18th-century oil portrait appear to shift and focus across the gallery.","Notice this clue: The dark painted eyes of an 18th-century oil portrait appear to shift and focus across the gallery."],"hints":["Tiny round holes cut into the painted eyes of a portrait to see through.","Clue hint: Think about pinhole canvas pupils.","Search for: the painted pupils were sliced out with microscopic pinhole cuts to allow human eyes to peer through."],"clues":["Pinhole Canvas Pupils","Item: Pinhole Canvas Pupils","Clue Word: Pinhole Canvas Pupils"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7874ff42-3800-5f3d-958a-8349709941fc',
  'story_071',
  'ev_2',
  2,
  '11:55 PM',
  'A miniature camera mechanical iris shutter clicks shut for a fraction of a second, simulating a blink.',
  'A miniature camera mechanical iris shutter clicks shut for a fraction of a second, simulating a blink.',
  'The "blinking" was an optical lens shutter cycling open and closed.',
  'Mechanical Shutter Click',
  'Miniature black aluminum iris aperture mechanism mounted behind the canvas.',
  '["Watch Tick","Light Click","Door Latch"]'::jsonb,
  'Mechanical Shutter Click',
  '["mechanical shutter click","shutter","mechanical shutter","click","aperture"]'::jsonb,
  'A metal circle of overlapping blades that opens and closes to let light into a camera.',
  'ev_3',
  false,
  '{"descriptions":["A miniature camera mechanical iris shutter clicks shut for a fraction of a second, simulating a blink.","At 11:55 PM: A miniature camera mechanical iris shutter clicks shut for a fraction of a second, simulating a blink.","Notice this clue: A miniature camera mechanical iris shutter clicks shut for a fraction of a second, simulating a blink."],"hints":["A metal circle of overlapping blades that opens and closes to let light into a camera.","Clue hint: Think about mechanical shutter click.","Search for: the \"blinking\" was an optical lens shutter cycling open and closed."],"clues":["Mechanical Shutter Click","Item: Mechanical Shutter Click","Clue Word: Mechanical Shutter Click"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a79cfea6-d930-5f1a-a8d7-4e90b613fb85',
  'story_071',
  'ev_3',
  3,
  '12:00 AM',
  'A hidden maintenance cavity behind the drywall panel measures three feet wide.',
  'A hidden maintenance cavity behind the drywall panel measures three feet wide.',
  'A hollow space large enough for an adult human to stand comfortably behind the painting.',
  'Hidden Wall Cavity',
  'Narrow service chase between the gallery wall and the brick exterior chimney.',
  '["Ventilation Duct","Elevator Shaft","Basement Room"]'::jsonb,
  'Hidden Wall Cavity',
  '["hidden wall cavity","cavity","wall cavity","secret passage","hidden space","wall"]'::jsonb,
  'An empty secret space built between two walls of a building.',
  'ev_4',
  false,
  '{"descriptions":["A hidden maintenance cavity behind the drywall panel measures three feet wide.","At 12:00 AM: A hidden maintenance cavity behind the drywall panel measures three feet wide.","Notice this clue: A hidden maintenance cavity behind the drywall panel measures three feet wide."],"hints":["An empty secret space built between two walls of a building.","Clue hint: Think about hidden wall cavity.","Search for: a hollow space large enough for an adult human to stand comfortably behind the painting."],"clues":["Hidden Wall Cavity","Item: Hidden Wall Cavity","Clue Word: Hidden Wall Cavity"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6b89df87-4f73-5d23-9ad3-a7dccff819bd',
  'story_071',
  'ev_4',
  4,
  '12:15 AM',
  'An empty velvet pedestal in the center display case once held the Duchess Diamond necklace.',
  'An empty velvet pedestal in the center display case once held the Duchess Diamond necklace.',
  'The thief timed the security guard’s patrol from behind the painting to execute the theft.',
  'Stolen Diamond Necklace',
  'Shattered display glass and empty velvet bust where fifty carats of diamonds sat.',
  '["Gold Tiara","Ruby Brooch","Silver Watch"]'::jsonb,
  'Stolen Diamond Necklace',
  '["stolen diamond necklace","necklace","diamond necklace","diamonds","jewel"]'::jsonb,
  'A circle of glittering white precious stones worn around the neck.',
  'ev_5',
  false,
  '{"descriptions":["An empty velvet pedestal in the center display case once held the Duchess Diamond necklace.","At 12:15 AM: An empty velvet pedestal in the center display case once held the Duchess Diamond necklace.","Notice this clue: An empty velvet pedestal in the center display case once held the Duchess Diamond necklace."],"hints":["A circle of glittering white precious stones worn around the neck.","Clue hint: Think about stolen diamond necklace.","Search for: the thief timed the security guard’s patrol from behind the painting to execute the theft."],"clues":["Stolen Diamond Necklace","Item: Stolen Diamond Necklace","Clue Word: Stolen Diamond Necklace"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f3c1a872-daea-5111-a3ba-7d26a8a66fbc',
  'story_071',
  'ev_5',
  5,
  '12:45 AM',
  'A thermal imaging FLIR camera reveals a glowing orange human heat signature inside the wall.',
  'A thermal imaging FLIR camera reveals a glowing orange human heat signature inside the wall.',
  'Scientific proof of a living, warm human being standing directly behind the canvas.',
  'Thermal Heat Signature',
  'Infrared display screen showing a 98.6°F human silhouette inside the wall chase.',
  '["Cold Spot","Electric Wire","Steam Pipe"]'::jsonb,
  'Thermal Heat Signature',
  '["thermal heat signature","heat signature","thermal image","signature","infrared image"]'::jsonb,
  'A colorful picture showing the heat given off by a warm human body in the dark.',
  'ev_6',
  true,
  '{"descriptions":["A thermal imaging FLIR camera reveals a glowing orange human heat signature inside the wall.","At 12:45 AM: A thermal imaging FLIR camera reveals a glowing orange human heat signature inside the wall.","Notice this clue: A thermal imaging FLIR camera reveals a glowing orange human heat signature inside the wall."],"hints":["A colorful picture showing the heat given off by a warm human body in the dark.","Clue hint: Think about thermal heat signature.","Search for: scientific proof of a living, warm human being standing directly behind the canvas."],"clues":["Thermal Heat Signature","Item: Thermal Heat Signature","Clue Word: Thermal Heat Signature"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '301228ac-565f-50ef-8125-91572eed024f',
  'story_071',
  'ev_6',
  6,
  '01:00 AM',
  'A pair of military monocular night-vision goggles is dropped on the cavity floor.',
  'A pair of military monocular night-vision goggles is dropped on the cavity floor.',
  'The restorer used night-vision to monitor the dark gallery without turning on lights.',
  'Night-Vision Goggles',
  'Green-phosphor military night-vision device with rubber eye-cup.',
  '["Binoculars","Sunglasses","Safety Glasses"]'::jsonb,
  'Night-Vision Goggles',
  '["night-vision goggles","goggles","night vision","nvg"]'::jsonb,
  'Electronic glasses worn on the head that let you see clearly in pitch-black darkness.',
  'ev_7',
  false,
  '{"descriptions":["A pair of military monocular night-vision goggles is dropped on the cavity floor.","At 01:00 AM: A pair of military monocular night-vision goggles is dropped on the cavity floor.","Notice this clue: A pair of military monocular night-vision goggles is dropped on the cavity floor."],"hints":["Electronic glasses worn on the head that let you see clearly in pitch-black darkness.","Clue hint: Think about night-vision goggles.","Search for: the restorer used night-vision to monitor the dark gallery without turning on lights."],"clues":["Night-Vision Goggles","Item: Night-Vision Goggles","Clue Word: Night-Vision Goggles"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fd2ba3e3-aa95-520b-a349-3bcba24c6d55',
  'story_071',
  'ev_7',
  7,
  '01:15 AM',
  'A high-precision surgical scalpel used to cut the canvas pupils is found in Julian’s toolkit.',
  'A high-precision surgical scalpel used to cut the canvas pupils is found in Julian’s toolkit.',
  'The microscopic cuts matched the exact blade curvature of Julian’s conservation tool.',
  'Conservation Scalpel',
  'Stainless steel micro-scalpel with brown oil paint residue on the blade.',
  '["Scissors","Chisel","Palette Knife"]'::jsonb,
  'Conservation Scalpel',
  '["conservation scalpel","scalpel","knife","tool"]'::jsonb,
  'A tiny, sharp knife used by art restorers to clean and repair delicate old paintings.',
  'ev_8',
  false,
  '{"descriptions":["A high-precision surgical scalpel used to cut the canvas pupils is found in Julian’s toolkit.","At 01:15 AM: A high-precision surgical scalpel used to cut the canvas pupils is found in Julian’s toolkit.","Notice this clue: A high-precision surgical scalpel used to cut the canvas pupils is found in Julian’s toolkit."],"hints":["A tiny, sharp knife used by art restorers to clean and repair delicate old paintings.","Clue hint: Think about conservation scalpel.","Search for: the microscopic cuts matched the exact blade curvature of julian’s conservation tool."],"clues":["Conservation Scalpel","Item: Conservation Scalpel","Clue Word: Conservation Scalpel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7be6b013-a1fc-59ca-a49c-6ed4bbdfb839',
  'story_071',
  'ev_8',
  8,
  '01:30 AM',
  'The stolen Duchess Diamond necklace is found hidden inside a hollow tube of restoration varnish.',
  'The stolen Duchess Diamond necklace is found hidden inside a hollow tube of restoration varnish.',
  'Julian had concealed the multi-million-dollar jewels in his chemical work kit.',
  'Varnish Canister Stash',
  'Metal solvent tin with false screw-bottom concealing the fifty-carat necklace.',
  '["Toolbox","Briefcase","Pocket"]'::jsonb,
  'Varnish Canister Stash',
  '["varnish canister stash","varnish can","canister","stash","tin"]'::jsonb,
  'A round metal container used to hold liquids with a secret hiding compartment in the bottom.',
  NULL,
  true,
  '{"descriptions":["The stolen Duchess Diamond necklace is found hidden inside a hollow tube of restoration varnish.","At 01:30 AM: The stolen Duchess Diamond necklace is found hidden inside a hollow tube of restoration varnish.","Notice this clue: The stolen Duchess Diamond necklace is found hidden inside a hollow tube of restoration varnish."],"hints":["A round metal container used to hold liquids with a secret hiding compartment in the bottom.","Clue hint: Think about varnish canister stash.","Search for: julian had concealed the multi-million-dollar jewels in his chemical work kit."],"clues":["Varnish Canister Stash","Item: Varnish Canister Stash","Clue Word: Varnish Canister Stash"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_072 — THE MIDNIGHT LANTERN ON THE MOOR
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_072',
  'The Midnight Lantern on the Moor',
  'Supernatural',
  'The Blackwood Quicksand Moor, treacherous peat bogs, swirling sulfurous mist, and deep sinking mud pits',
  'A ghostly lantern light drifted through the thick fog at midnight, leading lost travelers off the safe stone path directly into deadly quicksand.',
  '[{"name":"Silas Thorne","role":"Moorland Peat Cutter & Hermit","alibi":"In his peat cutter’s shack boiling tea","avatar":"🌾"},{"name":"Arthur Sterling (Victim)","role":"Lost Wealthy Traveler","alibi":"Trapped in the quicksand bog at Devil’s Cauldron","avatar":"泥"},{"name":"Innkeeper Nora Higgins","role":"Village Tavern Keeper","alibi":"Tending the tavern bar in the village two miles away","avatar":"🍺"},{"name":"Detective Thomas Cole","role":"Mountain Rescue & Crime Specialist","alibi":"Arrived at the moor edge following Arthur’s distant distress cries","avatar":"🔍"}]'::jsonb,
  'Hermit Silas Thorne flew a quiet electric quadcopter drone carrying an antique yellow lantern through the dense moor fog. Travelers mistook the light for a night watchman and followed it off the safe flagstone trail directly into the bottomless peat quicksand, where Silas waited with a long pole to loot their floating bodies.',
  'Hermit Silas Thorne',
  'Silas robbed the wealthy travelers after they drowned in the bog, collecting their jewelry and wallets.',
  '[{"time":"09:00 PM","event":"Traveler Arthur Sterling sets out across the moor following the stone trail posts."},{"time":"11:30 PM","event":"Dense fog rolls in; Arthur loses sight of the trail markers."},{"time":"11:45 PM","event":"Silas launches a quiet electric drone carrying a flickering yellow lantern."},{"time":"11:55 PM","event":"Arthur follows the floating lantern off the stone path directly into Devil’s Cauldron."},{"time":"12:15 AM","event":"Detective Cole uses a rope throwing gun to pull Arthur from the sinking mud."}]'::jsonb,
  '[{"id":"ev1","title":"Carbon-Fiber Drone with Lantern Hook","detail":"Found in Silas Thorne’s hut, rigged with the lightweight yellow flickering LED lantern."},{"id":"ev2","title":"Drone Radio Controller with Video Feed","detail":"Screen shows real-time camera view of Devil’s Cauldron and the sinking victim."},{"id":"ev3","title":"Twelve-Foot Bog Gaff Pole","detail":"Used by Silas to drag corpses and personal belongings from the quicksand."},{"id":"ev4","title":"Biscuit Tin of Stolen Watches","detail":"Buried in Silas’s floorboards, containing jewelry from three previously drowned travelers."}]'::jsonb,
  '[{"order":1,"title":"Floating Yellow Lantern","text":"Light source drifting smoothly through the fog with no human footprints below."},{"order":2,"title":"Quicksand Sinkhole","text":"Lethal 20-foot deep peat suction pit where travelers were lured to drown."},{"order":3,"title":"Stealth Quadcopter Drone","text":"Remote-controlled aircraft used to fly the deceptive lantern through the mist."},{"order":4,"title":"Drone Radio Controller","text":"Transmitter used by the hermit to guide the light toward the mud."},{"order":5,"title":"Bog Gaff Pole","text":"Long hooked pole used to retrieve valuables from bodies in the quicksand."},{"order":6,"title":"Looted Tourist Valuables","text":"Stash of expensive watches and rings taken from drowned victims."}]'::jsonb,
  'Innkeeper Nora sold protective iron amulets.: Superstitious commercial opportunism, but she had no role in the murders.; Peat moss naturally produced minor phosphorescence.: Harmless biological glowing fungus, completely different from the drone light.',
  'Claim a genuine will-o’-the-wisp marsh fairy lured travelers or blame the local innkeeper.',
  'NORMAL',
  'Was the lantern carried by an ancient will-o’-the-wisp spirit, or was a living killer luring victims to their doom?',
  '[{"character":"Silas Thorne","secret":"He has an expensive carbon-fiber drone and a drawer filled with stolen gold watches in his hut."},{"character":"Arthur Sterling (Victim)","secret":"He was carrying five thousand dollars in cash to purchase moorland property."},{"character":"Innkeeper Nora Higgins","secret":"She was charging tourists extra fees for \"protective iron amulets\"."},{"character":"Detective Thomas Cole","secret":"Tracked three stolen watches from the moor to an underground city pawnshop."}]'::jsonb,
  '[{"lead":"Innkeeper Nora sold protective iron amulets.","explanation":"Superstitious commercial opportunism, but she had no role in the murders."},{"lead":"Peat moss naturally produced minor phosphorescence.","explanation":"Harmless biological glowing fungus, completely different from the drone light."}]'::jsonb,
  '{"wrongTheories":["A mythical Will-o’-the-Wisp fairy spirit lured travelers to their death to consume their souls.","Travelers were naturally disoriented by moor fog and wandered off the trail accidentally."],"correctTheory":"Hermit Silas Thorne flew a carbon-fiber drone carrying an antique yellow lantern to lure travelers off the safe stone path into the 20-foot deep quicksand sinkhole, drowning them so he could loot their watches and money with a gaff pole."}'::jsonb,
  'Hermit Silas Thorne flew a drone with a lantern to drown tourists and steal their jewelry!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Cole pulled Arthur from the quicksand with the rescue gun and raided Silas’s hut. Silas was arrested for multiple counts of murder and armed robbery, and the moor trail was safely reopened."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Arthur was swallowed by the deep peat bog. Silas retrieved his cash and watch with the gaff pole, and the death was logged as another victim of the cursed will-o’-the-wisp."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Ghost Light of Blackwood Moor\" became an international supernatural tourist legend. Silas continued flying his drone and looting victims undisturbed."}]'::jsonb,
  '{"intros":["A ghostly lantern light drifted through the thick fog at midnight, leading lost travelers off the safe stone path directly into deadly quicksand.","Case file story_072: A ghostly lantern light drifted through the thick fog at midnight, leading lost travelers off the safe stone path directly into deadly quicksand. Look closely at every clue.","Trouble begins in The Blackwood Quicksand Moor, treacherous peat bogs, swirling sulfurous mist, and deep sinking mud pits. A ghostly lantern light drifted through the thick fog at midnight, leading lost travelers off the safe stone path directly into deadly quicksand.","The mystery starts now. A ghostly lantern light drifted through the thick fog at midnight, leading lost travelers off the safe stone path directly into deadly quicksand. Can you solve it?"],"reveals":["Hermit Silas Thorne flew a drone with a lantern to drown tourists and steal their jewelry!","The mystery is unraveled! Hermit Silas Thorne flew a drone with a lantern to drown tourists and steal their jewelry!","At last, the truth comes out: Hermit Silas Thorne flew a drone with a lantern to drown tourists and steal their jewelry!","Case resolved! Here is what happened: Hermit Silas Thorne flew a drone with a lantern to drown tourists and steal their jewelry!"],"hints":["Pay attention to where Hermit Silas Thorne was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_072';
DELETE FROM public.case_events WHERE case_id = 'story_072';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6c6dfcba-cbea-5fb6-b903-0d2cb1cbc95b',
  'story_072',
  'Silas Thorne',
  'Moorland Peat Cutter & Hermit',
  'Weathered, dirty beard, wearing peat-stained canvas clothes and knee-high rubber muck boots',
  'The marsh light is the Will-o’-the-Wisp. It has drowned travelers on this bog since the time of the Romans.',
  'He has an expensive carbon-fiber drone and a drawer filled with stolen gold watches in his hut.',
  'In his peat cutter’s shack boiling tea',
  'Sole inhabitant living adjacent to the deadly quicksand sinkholes',
  'The stone path ends abruptly at Devil’s Cauldron, where the mud is twenty feet deep.',
  'Did not know the drone’s carbon-fiber propellers left microscopic shavings in the reeds.',
  '🌾',
  '["The marsh light is the Will-o’-the-Wisp. It has drowned travelers on this bog since the time of the Romans.","\"The marsh light is the Will-o’-the-Wisp. It has drowned travelers on this bog since the time of the Romans.\"","Listen to me: The marsh light is the Will-o’-the-Wisp. It has drowned travelers on this bog since the time of the Romans.","I tell you the truth: The marsh light is the Will-o’-the-Wisp. It has drowned travelers on this bog since the time of the Romans."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8478186a-de1e-554e-b694-b870c3fc93f9',
  'story_072',
  'Arthur Sterling (Victim)',
  'Lost Wealthy Traveler',
  'Terrified, shouting for help, submerged waist-deep in cold black mud',
  'I followed the yellow light! It looked like a man swinging a lantern shouting "This way!"',
  'He was carrying five thousand dollars in cash to purchase moorland property.',
  'Trapped in the quicksand bog at Devil’s Cauldron',
  'Target lured into the deadly swamp',
  'The light moved completely smoothly through the air four feet off the ground with no footsteps.',
  'Did not realize the light was an electric drone flying in the fog.',
  '泥',
  '["I followed the yellow light! It looked like a man swinging a lantern shouting \"This way!\"","\"I followed the yellow light! It looked like a man swinging a lantern shouting \"This way!\"\"","Listen to me: I followed the yellow light! It looked like a man swinging a lantern shouting \"This way!\"","I tell you the truth: I followed the yellow light! It looked like a man swinging a lantern shouting \"This way!\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '784e94fb-a7cf-5563-9f62-b67f14e00838',
  'story_072',
  'Innkeeper Nora Higgins',
  'Village Tavern Keeper',
  'Warns travelers, motherly, pouring pints of dark ale by the hearth',
  'I told Mr. Sterling never to leave the stone posts after sundown. The light will take you.',
  'She was charging tourists extra fees for "protective iron amulets".',
  'Tending the tavern bar in the village two miles away',
  'Last person to speak to Arthur before he walked onto the moor',
  'Three wealthy tourists have vanished on the moor path over the past six months.',
  'Did not know the hermit had bought a commercial drone online.',
  '🍺',
  '["I told Mr. Sterling never to leave the stone posts after sundown. The light will take you.","\"I told Mr. Sterling never to leave the stone posts after sundown. The light will take you.\"","Listen to me: I told Mr. Sterling never to leave the stone posts after sundown. The light will take you.","I tell you the truth: I told Mr. Sterling never to leave the stone posts after sundown. The light will take you."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '230e1d7b-00b9-5b1c-86ba-c5a667029b6f',
  'story_072',
  'Detective Thomas Cole',
  'Mountain Rescue & Crime Specialist',
  'Sharp, athletic, carrying high-powered searchlights and rope throwing guns',
  'Spirits don’t emit 2.4 GHz digital radio control frequencies. Someone is piloting a drone in this mist.',
  'Tracked three stolen watches from the moor to an underground city pawnshop.',
  'Arrived at the moor edge following Arthur’s distant distress cries',
  'Leading the rescue and criminal investigation',
  'Found high-frequency radio controller signals bouncing off the moor rocks.',
  'Did not immediately locate where Silas was standing with the remote.',
  '🔍',
  '["Spirits don’t emit 2.4 GHz digital radio control frequencies. Someone is piloting a drone in this mist.","\"Spirits don’t emit 2.4 GHz digital radio control frequencies. Someone is piloting a drone in this mist.\"","Listen to me: Spirits don’t emit 2.4 GHz digital radio control frequencies. Someone is piloting a drone in this mist.","I tell you the truth: Spirits don’t emit 2.4 GHz digital radio control frequencies. Someone is piloting a drone in this mist."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b0d508a4-0485-505c-bb3a-cc08c3b203e6',
  'story_072',
  'ev_1',
  1,
  '11:45 PM',
  'A flickering warm yellow lantern light floats smoothly four feet above the bog in the dense fog.',
  'A flickering warm yellow lantern light floats smoothly four feet above the bog in the dense fog.',
  'The light moved across deep water without sinking, defying human foot travel.',
  'Floating Yellow Lantern',
  'Lightweight plastic lantern fitted with a warm flickering LED candle.',
  '["Flashlight","Torch","Campfire"]'::jsonb,
  'Floating Yellow Lantern',
  '["floating yellow lantern","lantern","yellow lantern","floating lantern","light"]'::jsonb,
  'A portable glass and metal light source glowing yellow floating in mid-air.',
  'ev_2',
  true,
  '{"descriptions":["A flickering warm yellow lantern light floats smoothly four feet above the bog in the dense fog.","At 11:45 PM: A flickering warm yellow lantern light floats smoothly four feet above the bog in the dense fog.","Notice this clue: A flickering warm yellow lantern light floats smoothly four feet above the bog in the dense fog."],"hints":["A portable glass and metal light source glowing yellow floating in mid-air.","Clue hint: Think about floating yellow lantern.","Search for: the light moved across deep water without sinking, defying human foot travel."],"clues":["Floating Yellow Lantern","Item: Floating Yellow Lantern","Clue Word: Floating Yellow Lantern"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '014da9e5-2393-59e1-af78-d4d3b95ed844',
  'story_072',
  'ev_2',
  2,
  '11:55 PM',
  'Deep, black, bottomless peat quicksand sucks traveler Arthur down to his chest.',
  'Deep, black, bottomless peat quicksand sucks traveler Arthur down to his chest.',
  'Devil’s Cauldron is a lethal natural geological sinkhole twenty feet deep.',
  'Quicksand Sinkhole',
  'Bubbling liquid peat bog surrounded by treacherous false grass.',
  '["Deep River","Rocky Cliff","Mud Puddle"]'::jsonb,
  'Quicksand Sinkhole',
  '["quicksand sinkhole","quicksand","sinkhole","bog","peat bog","mud pit"]'::jsonb,
  'A wet patch of soft sand or mud that sucks people down when they step on it.',
  'ev_3',
  false,
  '{"descriptions":["Deep, black, bottomless peat quicksand sucks traveler Arthur down to his chest.","At 11:55 PM: Deep, black, bottomless peat quicksand sucks traveler Arthur down to his chest.","Notice this clue: Deep, black, bottomless peat quicksand sucks traveler Arthur down to his chest."],"hints":["A wet patch of soft sand or mud that sucks people down when they step on it.","Clue hint: Think about quicksand sinkhole.","Search for: devil’s cauldron is a lethal natural geological sinkhole twenty feet deep."],"clues":["Quicksand Sinkhole","Item: Quicksand Sinkhole","Clue Word: Quicksand Sinkhole"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f755a175-2e37-5d69-8101-415a39cc7ad1',
  'story_072',
  'ev_3',
  3,
  '12:00 AM',
  'A high-end carbon-fiber quadcopter drone with silent stealth propellers is hidden in Silas’s hut.',
  'A high-end carbon-fiber quadcopter drone with silent stealth propellers is hidden in Silas’s hut.',
  'The machine used to fly the floating lantern through the foggy marshland.',
  'Stealth Quadcopter Drone',
  'Black carbon-fiber drone with a suspension hook for the lantern.',
  '["Kite","Balloon","Model Plane"]'::jsonb,
  'Stealth Quadcopter Drone',
  '["stealth quadcopter drone","drone","quadcopter","stealth drone","aircraft"]'::jsonb,
  'A remote-controlled flying machine with four spinning propellers.',
  'ev_4',
  false,
  '{"descriptions":["A high-end carbon-fiber quadcopter drone with silent stealth propellers is hidden in Silas’s hut.","At 12:00 AM: A high-end carbon-fiber quadcopter drone with silent stealth propellers is hidden in Silas’s hut.","Notice this clue: A high-end carbon-fiber quadcopter drone with silent stealth propellers is hidden in Silas’s hut."],"hints":["A remote-controlled flying machine with four spinning propellers.","Clue hint: Think about stealth quadcopter drone.","Search for: the machine used to fly the floating lantern through the foggy marshland."],"clues":["Stealth Quadcopter Drone","Item: Stealth Quadcopter Drone","Clue Word: Stealth Quadcopter Drone"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a9abd362-5d2a-5d42-99fe-17f6ad770084',
  'story_072',
  'ev_4',
  4,
  '12:10 AM',
  'A pneumatic rescue line throwing gun shoots a nylon rope and harness to Arthur.',
  'A pneumatic rescue line throwing gun shoots a nylon rope and harness to Arthur.',
  'Detective Cole hauled the sinking traveler out of the suction mud.',
  'Pneumatic Rescue Gun',
  'Compressed-air rope launcher with 150 feet of high-strength orange rescue line.',
  '["Harpoon","Crossbow","Rifle"]'::jsonb,
  'Pneumatic Rescue Gun',
  '["pneumatic rescue gun","rescue gun","rope gun","line gun","launcher"]'::jsonb,
  'A tool that uses compressed air to shoot a rescue rope to drowning people.',
  'ev_5',
  false,
  '{"descriptions":["A pneumatic rescue line throwing gun shoots a nylon rope and harness to Arthur.","At 12:10 AM: A pneumatic rescue line throwing gun shoots a nylon rope and harness to Arthur.","Notice this clue: A pneumatic rescue line throwing gun shoots a nylon rope and harness to Arthur."],"hints":["A tool that uses compressed air to shoot a rescue rope to drowning people.","Clue hint: Think about pneumatic rescue gun.","Search for: detective cole hauled the sinking traveler out of the suction mud."],"clues":["Pneumatic Rescue Gun","Item: Pneumatic Rescue Gun","Clue Word: Pneumatic Rescue Gun"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5d964bcd-e634-52d2-94bb-aeffa1ffdc30',
  'story_072',
  'ev_5',
  5,
  '12:20 AM',
  'A digital 2.4 GHz radio transmitter with video screen is on Silas’s table.',
  'A digital 2.4 GHz radio transmitter with video screen is on Silas’s table.',
  'Silas piloted the drone using an onboard camera to watch travelers follow the light.',
  'Drone Radio Controller',
  'Handheld twin-stick radio transmitter with live video feed screen.',
  '["TV Remote","Walkie Talkie","Cell Phone"]'::jsonb,
  'Drone Radio Controller',
  '["drone radio controller","controller","drone controller","remote","transmitter"]'::jsonb,
  'A handheld box with joysticks used by a pilot to fly a drone from the ground.',
  'ev_6',
  true,
  '{"descriptions":["A digital 2.4 GHz radio transmitter with video screen is on Silas’s table.","At 12:20 AM: A digital 2.4 GHz radio transmitter with video screen is on Silas’s table.","Notice this clue: A digital 2.4 GHz radio transmitter with video screen is on Silas’s table."],"hints":["A handheld box with joysticks used by a pilot to fly a drone from the ground.","Clue hint: Think about drone radio controller.","Search for: silas piloted the drone using an onboard camera to watch travelers follow the light."],"clues":["Drone Radio Controller","Item: Drone Radio Controller","Clue Word: Drone Radio Controller"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a829e18a-188c-5590-8eef-eb72544ccb65',
  'story_072',
  'ev_6',
  6,
  '12:35 AM',
  'A long twelve-foot ash wood gaff pole with a sharp steel grappling hook is in the shed.',
  'A long twelve-foot ash wood gaff pole with a sharp steel grappling hook is in the shed.',
  'The tool Silas used to drag dead bodies and loot from the quicksand without sinking.',
  'Bog Gaff Pole',
  'Long wooden pole fitted with a barbed three-prong iron grappling hook.',
  '["Fishing Rod","Oar","Pitchfork"]'::jsonb,
  'Bog Gaff Pole',
  '["bog gaff pole","gaff pole","pole","hook pole","grappling pole"]'::jsonb,
  'A long wooden stick with a sharp metal hook on the end used to drag objects from water.',
  'ev_7',
  false,
  '{"descriptions":["A long twelve-foot ash wood gaff pole with a sharp steel grappling hook is in the shed.","At 12:35 AM: A long twelve-foot ash wood gaff pole with a sharp steel grappling hook is in the shed.","Notice this clue: A long twelve-foot ash wood gaff pole with a sharp steel grappling hook is in the shed."],"hints":["A long wooden stick with a sharp metal hook on the end used to drag objects from water.","Clue hint: Think about bog gaff pole.","Search for: the tool silas used to drag dead bodies and loot from the quicksand without sinking."],"clues":["Bog Gaff Pole","Item: Bog Gaff Pole","Clue Word: Bog Gaff Pole"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9ff332a6-20ba-5561-9980-bc5cc089b89c',
  'story_072',
  'ev_7',
  7,
  '12:50 AM',
  'A collection of four gold luxury watches and seven wallets is buried in a tin can.',
  'A collection of four gold luxury watches and seven wallets is buried in a tin can.',
  'The stolen belongings of tourists previously drowned by the fake light.',
  'Looted Tourist Valuables',
  'Sealed metal biscuit tin containing Rolex watches, gold rings, and identity cards.',
  '["Cash Box","Jewelry Box","Coin Bag"]'::jsonb,
  'Looted Tourist Valuables',
  '["looted tourist valuables","valuables","watches","tin","looted valuables","stolen goods"]'::jsonb,
  'Expensive watches, jewelry, and wallets taken from victims and hidden in a box.',
  'ev_8',
  false,
  '{"descriptions":["A collection of four gold luxury watches and seven wallets is buried in a tin can.","At 12:50 AM: A collection of four gold luxury watches and seven wallets is buried in a tin can.","Notice this clue: A collection of four gold luxury watches and seven wallets is buried in a tin can."],"hints":["Expensive watches, jewelry, and wallets taken from victims and hidden in a box.","Clue hint: Think about looted tourist valuables.","Search for: the stolen belongings of tourists previously drowned by the fake light."],"clues":["Looted Tourist Valuables","Item: Looted Tourist Valuables","Clue Word: Looted Tourist Valuables"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e1fd9952-1b37-51a6-bac5-3e8b609db20a',
  'story_072',
  'ev_8',
  8,
  '01:15 AM',
  'A trail of knobby rubber muck boot footprints leads from Silas’s hut to the gaff pole station.',
  'A trail of knobby rubber muck boot footprints leads from Silas’s hut to the gaff pole station.',
  'Silas walked out to the edge of the quicksand every time a traveler called for help.',
  'Muck Boot Prints',
  'Heavy neoprene boot tread impressions in the peat moss matching Silas’s boots.',
  '["Bare Footprints","Shoe Marks","Animal Tracks"]'::jsonb,
  'Muck Boot Prints',
  '["muck boot prints","boot prints","footprints","muck boots","tracks"]'::jsonb,
  'Footstep marks left in wet mud by tall rubber waterproof boots.',
  NULL,
  true,
  '{"descriptions":["A trail of knobby rubber muck boot footprints leads from Silas’s hut to the gaff pole station.","At 01:15 AM: A trail of knobby rubber muck boot footprints leads from Silas’s hut to the gaff pole station.","Notice this clue: A trail of knobby rubber muck boot footprints leads from Silas’s hut to the gaff pole station."],"hints":["Footstep marks left in wet mud by tall rubber waterproof boots.","Clue hint: Think about muck boot prints.","Search for: silas walked out to the edge of the quicksand every time a traveler called for help."],"clues":["Muck Boot Prints","Item: Muck Boot Prints","Clue Word: Muck Boot Prints"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_073 — THE TORN WEDDING VEIL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_073',
  'The Torn Wedding Veil',
  'Romance / Drama',
  'St. Jude Cathedral dressing room, satin curtains, stained glass, and rose bouquets',
  'Minutes before walking down the aisle, the bride vanished, leaving her lace veil torn on a silver vanity mirror.',
  '[{"name":"Clara Sterling","role":"Vanished Bride","alibi":"Fleeing on foot toward the city records archive","avatar":"👰"},{"name":"Julian Vance","role":"Wealthy Groom","alibi":"Waiting at the altar with the best man","avatar":"🤵"},{"name":"Arthur Sterling","role":"Bride’s Father","alibi":"Greeting wedding guests in the cathedral foyer","avatar":"👴"},{"name":"Evelyn Gray","role":"Maid of Honor","alibi":"Fixing flower arrangements near the chapel doors","avatar":"💐"}]'::jsonb,
  'Groom Julian Vance threatened bride Clara moments before the ceremony, warning her that he had forged her father’s name on bankrupt loan papers. In tears, Clara tore her veil on the mirror and ran to the train station to find legal proof to clear her father.',
  'Groom Julian Vance',
  'Julian had secretly gambled away the family trust and planned to flee the country with the dowry money alone.',
  '[{"time":"10:30 AM","event":"Clara arrives at the cathedral wearing her silk bridal gown."},{"time":"11:00 AM","event":"Julian enters the bridal suite through the side corridor."},{"time":"11:10 AM","event":"A loud crash of glass is heard from the dressing room."},{"time":"11:15 AM","event":"Clara slips out the rear garden door in a raincoat."},{"time":"11:30 AM","event":"The wedding march begins, but the dressing room is empty."}]'::jsonb,
  '[{"id":"ev_1","title":"Torn Veil","detail":"Fine white French lace caught on the jagged edge of the broken vanity mirror."},{"id":"ev_2","title":"Forged Note","detail":"Bank promissory note with Arthur Sterling’s forged signature in fresh ink."},{"id":"ev_3","title":"Ticket to Argentina","detail":"First-class steamship ticket in Julian Vance’s name departing tonight."},{"id":"ev_4","title":"Accounting Ledger","detail":"Secret records showing Julian embezzled half a million dollars."}]'::jsonb,
  '[{"order":1,"title":"Muddy footprints","text":"Proves Julian entered Clara’s private suite right before the crash."},{"order":2,"title":"Bank document","text":"Shows Julian was blackmailing Clara with forged debt."},{"order":3,"title":"Torn lace","text":"Demonstrates a violent struggle or hurried scramble near the mirror."},{"order":4,"title":"Steamship ticket","text":"Exposes Julian’s secret plan to flee the country alone."},{"order":5,"title":"Bridal heels","text":"Proves Clara left in desperate haste on foot."},{"order":6,"title":"Threat note","text":"Direct evidence of Julian’s blackmail threats."}]'::jsonb,
  'Jealous bridesmaid diary: Evelyn held old feelings, but she wanted Clara to be safe.; Chauffeur’s idling car: The driver was simply waiting for the newlywed departure.',
  'Blame the jealous bridesmaid or claim Clara ran away with the handsome chauffeur.',
  'NORMAL',
  'Did the bride run away with a secret lover, or was she forced to flee?',
  '[{"character":"Clara Sterling","secret":"She took the duplicate loan ledger hidden in her father’s safe."},{"character":"Julian Vance","secret":"A one-way ticket to Buenos Aires in his breast pocket."},{"character":"Arthur Sterling","secret":"His bank had discovered massive missing funds that morning."},{"character":"Evelyn Gray","secret":"She was secretly in love with Julian years ago."}]'::jsonb,
  '[{"lead":"Jealous bridesmaid diary","explanation":"Evelyn held old feelings, but she wanted Clara to be safe."},{"lead":"Chauffeur’s idling car","explanation":"The driver was simply waiting for the newlywed departure."}]'::jsonb,
  '{"wrongTheories":["Clara had cold feet and ran away with the handsome church driver.","The maid of honor kidnapped Clara because she loved Julian."],"correctTheory":"Julian blackmailed Clara with forged bank debts, causing her to flee to gather proof against him."}'::jsonb,
  'Julian Vance confronted Clara with forged debt papers to force her out so he could flee with the stolen bank dowry.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Julian was arrested at the altar as Clara returned with police officers and the true ledger."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The groom fled on the evening steamer while Clara’s father took the blame for the stolen funds."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The wedding scandal ruined the bank while Julian vanished across the ocean with the family fortune."}]'::jsonb,
  '{"intros":["Minutes before walking down the aisle, the bride vanished, leaving her lace veil torn on a silver vanity mirror.","Case file story_073: Minutes before walking down the aisle, the bride vanished, leaving her lace veil torn on a silver vanity mirror. Look closely at every clue.","Trouble begins in St. Jude Cathedral dressing room, satin curtains, stained glass, and rose bouquets. Minutes before walking down the aisle, the bride vanished, leaving her lace veil torn on a silver vanity mirror.","The mystery starts now. Minutes before walking down the aisle, the bride vanished, leaving her lace veil torn on a silver vanity mirror. Can you solve it?"],"reveals":["Julian Vance confronted Clara with forged debt papers to force her out so he could flee with the stolen bank dowry.","The mystery is unraveled! Julian Vance confronted Clara with forged debt papers to force her out so he could flee with the stolen bank dowry.","At last, the truth comes out: Julian Vance confronted Clara with forged debt papers to force her out so he could flee with the stolen bank dowry.","Case resolved! Here is what happened: Julian Vance confronted Clara with forged debt papers to force her out so he could flee with the stolen bank dowry."],"hints":["Pay attention to where Groom Julian Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_073';
DELETE FROM public.case_events WHERE case_id = 'story_073';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a2568815-7404-5ce0-9832-655d0f5ebc60',
  'story_073',
  'Clara Sterling',
  'Vanished Bride',
  'Gentle, devoted daughter, wearing tears and running shoes',
  'I will protect my father no matter what Julian threatens to do.',
  'She took the duplicate loan ledger hidden in her father’s safe.',
  'Fleeing on foot toward the city records archive',
  'Daughter of bank director Arthur Sterling, engaged to Julian',
  'Julian forged signatures on three major bank loans.',
  'Did not know the police were already investigating Julian’s fake accounts.',
  '👰',
  '["I will protect my father no matter what Julian threatens to do.","\"I will protect my father no matter what Julian threatens to do.\"","Listen to me: I will protect my father no matter what Julian threatens to do.","I tell you the truth: I will protect my father no matter what Julian threatens to do."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4e9b8d54-175a-5a09-9ad1-f86acf8be45f',
  'story_073',
  'Julian Vance',
  'Wealthy Groom',
  'Smooth talker, sharp tuxedo, nervous sweating around the collar',
  'Clara must have gotten cold feet! I loved her with all my heart.',
  'A one-way ticket to Buenos Aires in his breast pocket.',
  'Waiting at the altar with the best man',
  'Fiance of Clara Sterling',
  'Arthur Sterling’s safe combination.',
  'Did not know Clara kept a hidden carbon copy of the promissory note.',
  '🤵',
  '["Clara must have gotten cold feet! I loved her with all my heart.","\"Clara must have gotten cold feet! I loved her with all my heart.\"","Listen to me: Clara must have gotten cold feet! I loved her with all my heart.","I tell you the truth: Clara must have gotten cold feet! I loved her with all my heart."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c8587765-f748-55e0-b890-eb710b95e99a',
  'story_073',
  'Arthur Sterling',
  'Bride’s Father',
  'Frail banker, white hair, clutching a silver pocket watch',
  'My daughter would never run away unless someone terrorized her.',
  'His bank had discovered massive missing funds that morning.',
  'Greeting wedding guests in the cathedral foyer',
  'Father of Clara',
  'Someone in Julian’s office was forging deposit slips.',
  'Did not know Julian had cornered Clara in the dressing room five minutes earlier.',
  '👴',
  '["My daughter would never run away unless someone terrorized her.","\"My daughter would never run away unless someone terrorized her.\"","Listen to me: My daughter would never run away unless someone terrorized her.","I tell you the truth: My daughter would never run away unless someone terrorized her."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '42256d7c-2f80-5d3f-9ab7-7825835005a7',
  'story_073',
  'Evelyn Gray',
  'Maid of Honor',
  'Sharp-eyed friend, holding a bouquet of white lilies',
  'I saw Julian slip into Clara’s dressing room right before she disappeared.',
  'She was secretly in love with Julian years ago.',
  'Fixing flower arrangements near the chapel doors',
  'Best friend of Clara since childhood',
  'Clara was sobbing when Julian slammed the dressing room door.',
  'Did not hear the exact blackmail words Julian whispered.',
  '💐',
  '["I saw Julian slip into Clara’s dressing room right before she disappeared.","\"I saw Julian slip into Clara’s dressing room right before she disappeared.\"","Listen to me: I saw Julian slip into Clara’s dressing room right before she disappeared.","I tell you the truth: I saw Julian slip into Clara’s dressing room right before she disappeared."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dab069f2-2d69-5f3d-875a-d9b1e245e6c0',
  'story_073',
  'ev_1',
  1,
  '11:00 AM',
  'Julian slips through the bridal suite hallway.',
  'Julian slips through the bridal suite hallway.',
  'Julian leaving muddy footprints on the white carpet.',
  'Muddy footprints',
  'Dress Shoes',
  '["White gloves","Cufflink","Champagne cork"]'::jsonb,
  'Muddy footprints',
  '["muddy footprints","footprints","shoe prints","footprint"]'::jsonb,
  'Marks left on the white carpet near the door.',
  'ev_2',
  true,
  '{"descriptions":["Julian slips through the bridal suite hallway.","At 11:00 AM: Julian slips through the bridal suite hallway.","Notice this clue: Julian slips through the bridal suite hallway."],"hints":["Marks left on the white carpet near the door.","Clue hint: Think about muddy footprints.","Search for: julian leaving muddy footprints on the white carpet."],"clues":["Muddy footprints","Item: Muddy footprints","Clue Word: Muddy footprints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6959ecdb-e0af-5e4b-9582-a5025f6f47da',
  'story_073',
  'ev_2',
  2,
  '11:05 AM',
  'Julian confronts Clara with forged bank documents.',
  'Julian confronts Clara with forged bank documents.',
  'A torn corner of a bank loan document on the table.',
  'Bank document',
  'Forged Note',
  '["Love letter","Song lyrics","Wedding program"]'::jsonb,
  'Bank document',
  '["bank document","loan paper","forged paper","document"]'::jsonb,
  'Paper showing forged bank financial records.',
  'ev_3',
  false,
  '{"descriptions":["Julian confronts Clara with forged bank documents.","At 11:05 AM: Julian confronts Clara with forged bank documents.","Notice this clue: Julian confronts Clara with forged bank documents."],"hints":["Paper showing forged bank financial records.","Clue hint: Think about bank document.","Search for: a torn corner of a bank loan document on the table."],"clues":["Bank document","Item: Bank document","Clue Word: Bank document"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a13dc2ea-dc00-5529-a9df-37e0d05cfe01',
  'story_073',
  'ev_3',
  3,
  '11:10 AM',
  'Clara knocks over the silver vanity mirror in panic.',
  'Clara knocks over the silver vanity mirror in panic.',
  'Pieces of white lace snagged on broken mirror glass.',
  'Torn lace',
  'Torn Veil',
  '["Ribbon","Pearl necklace","Gown zipper"]'::jsonb,
  'Torn lace',
  '["torn lace","lace","torn veil","veil scrap"]'::jsonb,
  'White fabric torn on the jagged silver mirror.',
  'ev_4',
  false,
  '{"descriptions":["Clara knocks over the silver vanity mirror in panic.","At 11:10 AM: Clara knocks over the silver vanity mirror in panic.","Notice this clue: Clara knocks over the silver vanity mirror in panic."],"hints":["White fabric torn on the jagged silver mirror.","Clue hint: Think about torn lace.","Search for: pieces of white lace snagged on broken mirror glass."],"clues":["Torn lace","Item: Torn lace","Clue Word: Torn lace"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '461b27e6-fc2a-5d79-a5df-02b73c948ec2',
  'story_073',
  'ev_4',
  4,
  '11:12 AM',
  'Julian drops a boarding pass while backing away.',
  'Julian drops a boarding pass while backing away.',
  'A steamship ticket to Argentina tucked under a sofa cushion.',
  'Steamship ticket',
  'Ticket to Argentina',
  '["Train schedule","Hotel card","Postcard"]'::jsonb,
  'Steamship ticket',
  '["steamship ticket","ticket","boat ticket","boarding pass"]'::jsonb,
  'Travel ticket for a single passenger leaving the country.',
  'ev_5',
  false,
  '{"descriptions":["Julian drops a boarding pass while backing away.","At 11:12 AM: Julian drops a boarding pass while backing away.","Notice this clue: Julian drops a boarding pass while backing away."],"hints":["Travel ticket for a single passenger leaving the country.","Clue hint: Think about steamship ticket.","Search for: a steamship ticket to argentina tucked under a sofa cushion."],"clues":["Steamship ticket","Item: Steamship ticket","Clue Word: Steamship ticket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6584f992-0d53-53ac-89fa-cc39efd6af82',
  'story_073',
  'ev_5',
  5,
  '11:15 AM',
  'Clara flees through the garden exit wearing running shoes.',
  'Clara flees through the garden exit wearing running shoes.',
  'White satin bridal heels left behind by the rear exit door.',
  'Bridal heels',
  'Discarded Shoes',
  '["Bouquet","Purse","Hairpin"]'::jsonb,
  'Bridal heels',
  '["bridal heels","shoes","heels","high heels"]'::jsonb,
  'Fancy white shoes taken off so she could run fast.',
  'ev_6',
  true,
  '{"descriptions":["Clara flees through the garden exit wearing running shoes.","At 11:15 AM: Clara flees through the garden exit wearing running shoes.","Notice this clue: Clara flees through the garden exit wearing running shoes."],"hints":["Fancy white shoes taken off so she could run fast.","Clue hint: Think about bridal heels.","Search for: white satin bridal heels left behind by the rear exit door."],"clues":["Bridal heels","Item: Bridal heels","Clue Word: Bridal heels"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bcac5f86-1d4f-5197-ac20-94e69ce0ff50',
  'story_073',
  'ev_6',
  6,
  '11:20 AM',
  'The maid of honor finds a handwritten threat note on the vanity.',
  'The maid of honor finds a handwritten threat note on the vanity.',
  'Julian’s fountain pen ink matching the threat note.',
  'Threat note',
  'Blackmail Letter',
  '["Vow sheet","Guest list","Florist bill"]'::jsonb,
  'Threat note',
  '["threat note","note","blackmail letter","letter"]'::jsonb,
  'A cruel letter warning Clara that her father will go to prison.',
  'ev_7',
  false,
  '{"descriptions":["The maid of honor finds a handwritten threat note on the vanity.","At 11:20 AM: The maid of honor finds a handwritten threat note on the vanity.","Notice this clue: The maid of honor finds a handwritten threat note on the vanity."],"hints":["A cruel letter warning Clara that her father will go to prison.","Clue hint: Think about threat note.","Search for: julian’s fountain pen ink matching the threat note."],"clues":["Threat note","Item: Threat note","Clue Word: Threat note"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a51085db-c978-5069-be83-c07e8044fffb',
  'story_073',
  'ev_7',
  7,
  '11:30 AM',
  'Julian stands at the altar acting shocked that Clara is missing.',
  'Julian stands at the altar acting shocked that Clara is missing.',
  'Julian’s jacket pocket bulging with Arthur’s safe keys.',
  'Safe keys',
  'Brass Keys',
  '["Wedding ring","Lighter","Pocket watch"]'::jsonb,
  'Safe keys',
  '["safe keys","keys","brass keys","key ring"]'::jsonb,
  'Keys used to open the bank president’s private safe.',
  'ev_8',
  false,
  '{"descriptions":["Julian stands at the altar acting shocked that Clara is missing.","At 11:30 AM: Julian stands at the altar acting shocked that Clara is missing.","Notice this clue: Julian stands at the altar acting shocked that Clara is missing."],"hints":["Keys used to open the bank president’s private safe.","Clue hint: Think about safe keys.","Search for: julian’s jacket pocket bulging with arthur’s safe keys."],"clues":["Safe keys","Item: Safe keys","Clue Word: Safe keys"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '18ec0643-36bf-5aab-b402-0f4a7832446b',
  'story_073',
  'ev_8',
  8,
  '11:45 AM',
  'Police intercept Clara at the archive and read the real ledger.',
  'Police intercept Clara at the archive and read the real ledger.',
  'Julian’s true accounting ledger showing his massive embezzlement.',
  'Stolen ledger',
  'Accounting Ledger',
  '["Diary","Address book","Checkbook"]'::jsonb,
  'Stolen ledger',
  '["stolen ledger","ledger","bank ledger","account book"]'::jsonb,
  'The financial book containing proof of Julian’s crimes.',
  NULL,
  true,
  '{"descriptions":["Police intercept Clara at the archive and read the real ledger.","At 11:45 AM: Police intercept Clara at the archive and read the real ledger.","Notice this clue: Police intercept Clara at the archive and read the real ledger."],"hints":["The financial book containing proof of Julian’s crimes.","Clue hint: Think about stolen ledger.","Search for: julian’s true accounting ledger showing his massive embezzlement."],"clues":["Stolen ledger","Item: Stolen ledger","Clue Word: Stolen ledger"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_074 — THE LOVE LETTER IN THE CHIMNEY
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_074',
  'The Love Letter in the Chimney',
  'Romance / Drama',
  'The dusty fireplace hearth of a renovated Victorian manor in Oakridge',
  'During chimney repairs, workers found a soot-stained tin box holding a 50-year-old confession letter and a blood-stained handkerchief.',
  '[{"name":"George Ashcroft","role":"Elderly Lord","alibi":"Claimed he was dining at his London club on the night she vanished","avatar":"🦯"},{"name":"Hannah Cole","role":"Historic Home Restorer","alibi":"Working with chimney repair tools in the parlor","avatar":"🔨"},{"name":"Arthur Miller","role":"Retired Stable Hand","alibi":"Waited on the train platform all night in the rain in 1974","avatar":"🌿"},{"name":"Detective Sarah Price","role":"Cold Case Investigator","alibi":"Reviewing county archives at the courthouse","avatar":"🔍"}]'::jsonb,
  'In 1974, Lord George Ashcroft murdered heiress Eleanor after she returned his diamond ring. He forged a note saying she eloped to Paris with the stable master, hid her real confession letter and handkerchief inside the chimney flue, and buried Eleanor under the garden terrace.',
  'Lord George Ashcroft',
  'George murdered heiress Eleanor when she broke their engagement to marry a poor stable hand.',
  '[{"time":"October 12, 1974 - 9:00 PM","event":"Eleanor tells George their engagement is over."},{"time":"October 12, 1974 - 9:30 PM","event":"George attacks Eleanor in the conservatory."},{"time":"October 12, 1974 - 11:00 PM","event":"George hides the tin box in the fireplace flue."},{"time":"October 13, 1974 - 6:00 AM","event":"George announces Eleanor ran away to Paris."},{"time":"Present Day - 2:00 PM","event":"Renovation workers pull the tin box from the chimney bricks."}]'::jsonb,
  '[{"id":"ev_1","title":"Rusty Tin Box","detail":"Sealed metal container tucked into the flue masonry in October 1974."},{"id":"ev_2","title":"Eleanor’s True Letter","detail":"Original letter declaring she will marry Arthur and return George’s ring."},{"id":"ev_3","title":"Bloodstained Linen","detail":"Linen handkerchief embroidered with George Ashcroft’s initials."},{"id":"ev_4","title":"Signed Confession","detail":"Full forensic admission of the murder and burial site."}]'::jsonb,
  '[{"order":1,"title":"Tin lockbox","text":"Hidden container preserved inside the chimney for fifty years."},{"order":2,"title":"Unsent love letter","text":"Reveals Eleanor was leaving George for Arthur."},{"order":3,"title":"Monogram handkerchief","text":"Ties George Ashcroft directly to the violence."},{"order":4,"title":"Silver chain","text":"Proves Eleanor’s necklace was torn off during a struggle."},{"order":5,"title":"Forged passport stamp","text":"Proves the Paris trip was a cover-up fabricated by George."},{"order":6,"title":"Rose terrace flagstone","text":"Pinpoints the exact location of Eleanor’s hidden grave."}]'::jsonb,
  'Vintage Paris postcard: Sent by George’s French associates to mislead police.; Arthur’s sudden departure: Arthur left town in grief after Eleanor vanished.',
  'Claim Eleanor really lived happily in Paris under an assumed artist name.',
  'NORMAL',
  'Did the manor heiress run away to London in 1974, or did a jealous suitor end her life?',
  '[{"character":"George Ashcroft","secret":"He knows the exact flagstone on the rose terrace where Eleanor rests."},{"character":"Hannah Cole","secret":"She is the great-niece of the stable hand who was blamed for the disappearance."},{"character":"Arthur Miller","secret":"He kept Eleanor’s silver locket close to his heart for fifty years."},{"character":"Detective Sarah Price","secret":"She reopened the file after finding conflicting customs logs from 1974."}]'::jsonb,
  '[{"lead":"Vintage Paris postcard","explanation":"Sent by George’s French associates to mislead police."},{"lead":"Arthur’s sudden departure","explanation":"Arthur left town in grief after Eleanor vanished."}]'::jsonb,
  '{"wrongTheories":["Eleanor fled to Paris and started a secret new life under an alias.","Arthur killed Eleanor because she refused to give up her inheritance."],"correctTheory":"George killed Eleanor in a jealous rage and hid her true letter in the chimney while faking her flight to Paris."}'::jsonb,
  'Lord George Ashcroft murdered Eleanor when she broke their engagement, framing her departure as an elopement to Paris.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Eleanor’s remains were finally given a peaceful burial, and George Ashcroft was sentenced for historical homicide."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The case was closed as an accidental disappearance, leaving Arthur in lifelong heartbreak."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Rumors spread that Eleanor was a runaway ghost, leaving the true killer untouched by justice."}]'::jsonb,
  '{"intros":["During chimney repairs, workers found a soot-stained tin box holding a 50-year-old confession letter and a blood-stained handkerchief.","Case file story_074: During chimney repairs, workers found a soot-stained tin box holding a 50-year-old confession letter and a blood-stained handkerchief. Look closely at every clue.","Trouble begins in The dusty fireplace hearth of a renovated Victorian manor in Oakridge. During chimney repairs, workers found a soot-stained tin box holding a 50-year-old confession letter and a blood-stained handkerchief.","The mystery starts now. During chimney repairs, workers found a soot-stained tin box holding a 50-year-old confession letter and a blood-stained handkerchief. Can you solve it?"],"reveals":["Lord George Ashcroft murdered Eleanor when she broke their engagement, framing her departure as an elopement to Paris.","The mystery is unraveled! Lord George Ashcroft murdered Eleanor when she broke their engagement, framing her departure as an elopement to Paris.","At last, the truth comes out: Lord George Ashcroft murdered Eleanor when she broke their engagement, framing her departure as an elopement to Paris.","Case resolved! Here is what happened: Lord George Ashcroft murdered Eleanor when she broke their engagement, framing her departure as an elopement to Paris."],"hints":["Pay attention to where Lord George Ashcroft was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_074';
DELETE FROM public.case_events WHERE case_id = 'story_074';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e8e14be9-e0d9-57d4-92d2-b3825090f033',
  'story_074',
  'George Ashcroft',
  'Elderly Lord',
  'Haughty aristocrat, silver cane, trembling hands when the fireplace is mentioned',
  'Eleanor was flighty and wild. She ran off with a French painter fifty years ago.',
  'He knows the exact flagstone on the rose terrace where Eleanor rests.',
  'Claimed he was dining at his London club on the night she vanished',
  'Former betrothed of the missing heiress Eleanor',
  'The tin box inside the flue held Eleanor’s true letter rejecting him.',
  'Did not know ground-penetrating radar was hired for the garden renovation.',
  '🦯',
  '["Eleanor was flighty and wild. She ran off with a French painter fifty years ago.","\"Eleanor was flighty and wild. She ran off with a French painter fifty years ago.\"","Listen to me: Eleanor was flighty and wild. She ran off with a French painter fifty years ago.","I tell you the truth: Eleanor was flighty and wild. She ran off with a French painter fifty years ago."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9bfc8c16-45c9-5573-88c8-84d43eb2cb9c',
  'story_074',
  'Hannah Cole',
  'Historic Home Restorer',
  'Meticulous builder, plaster-dusted hair, eager to solve historical mysteries',
  'The brick mortar behind this hearth was patched fifty years ago with cheap lime cement.',
  'She is the great-niece of the stable hand who was blamed for the disappearance.',
  'Working with chimney repair tools in the parlor',
  'Discovered the hidden tin box behind the damper',
  'The chimney flue had not been opened since autumn of 1974.',
  'Did not know the identity of the blood type on the handkerchief.',
  '🔨',
  '["The brick mortar behind this hearth was patched fifty years ago with cheap lime cement.","\"The brick mortar behind this hearth was patched fifty years ago with cheap lime cement.\"","Listen to me: The brick mortar behind this hearth was patched fifty years ago with cheap lime cement.","I tell you the truth: The brick mortar behind this hearth was patched fifty years ago with cheap lime cement."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'be834af0-76de-5a80-95df-2f2a5aa6031a',
  'story_074',
  'Arthur Miller',
  'Retired Stable Hand',
  'Quiet old gardener, gentle eyes, weathered hands, clutching an old photograph',
  'Eleanor promised she would meet me at the station at midnight. She never arrived.',
  'He kept Eleanor’s silver locket close to his heart for fifty years.',
  'Waited on the train platform all night in the rain in 1974',
  'Eleanor’s true secret love',
  'Eleanor was terrified of George’s violent temper.',
  'Did not know George had intercepted Eleanor in the rose garden.',
  '🌿',
  '["Eleanor promised she would meet me at the station at midnight. She never arrived.","\"Eleanor promised she would meet me at the station at midnight. She never arrived.\"","Listen to me: Eleanor promised she would meet me at the station at midnight. She never arrived.","I tell you the truth: Eleanor promised she would meet me at the station at midnight. She never arrived."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '34658cc0-75c9-572c-96a1-4b4d2e816871',
  'story_074',
  'Detective Sarah Price',
  'Cold Case Investigator',
  'Analytical, quiet voice, carrying forensic evidence envelopes',
  'Old paper preserves ink exceptionally well when sealed in dry chimney soot.',
  'She reopened the file after finding conflicting customs logs from 1974.',
  'Reviewing county archives at the courthouse',
  'Investigating the cold case of Eleanor’s disappearance',
  'The passport stamp in Paris was forged using a stolen customs seal.',
  'Did not know where Eleanor’s body was hidden until the terrace scan.',
  '🔍',
  '["Old paper preserves ink exceptionally well when sealed in dry chimney soot.","\"Old paper preserves ink exceptionally well when sealed in dry chimney soot.\"","Listen to me: Old paper preserves ink exceptionally well when sealed in dry chimney soot.","I tell you the truth: Old paper preserves ink exceptionally well when sealed in dry chimney soot."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd542de0d-2e73-5e1a-bde7-b4da6574fe4c',
  'story_074',
  'ev_1',
  1,
  'Present Day - 2:00 PM',
  'Hannah dislodges a loose hearth brick.',
  'Hannah dislodges a loose hearth brick.',
  'A rusty tin lockbox wrapped in black oilcloth.',
  'Tin lockbox',
  'Rusty Tin Box',
  '["Iron key","Gold coin","Silver spoon"]'::jsonb,
  'Tin lockbox',
  '["tin lockbox","tin box","box","lockbox"]'::jsonb,
  'A metal container hidden behind the fireplace chimney damper.',
  'ev_2',
  true,
  '{"descriptions":["Hannah dislodges a loose hearth brick.","At Present Day - 2:00 PM: Hannah dislodges a loose hearth brick.","Notice this clue: Hannah dislodges a loose hearth brick."],"hints":["A metal container hidden behind the fireplace chimney damper.","Clue hint: Think about tin lockbox.","Search for: a rusty tin lockbox wrapped in black oilcloth."],"clues":["Tin lockbox","Item: Tin lockbox","Clue Word: Tin lockbox"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5547c5ab-8442-52fb-81fc-8cfd371ff3bb',
  'story_074',
  'ev_2',
  2,
  'Present Day - 2:15 PM',
  'The investigator opens the tin box carefully.',
  'The investigator opens the tin box carefully.',
  'A yellowed handwritten letter signed by Eleanor.',
  'Unsent love letter',
  'Eleanor’s True Letter',
  '["Recipe sheet","Old newspaper","Property deed"]'::jsonb,
  'Unsent love letter',
  '["unsent love letter","love letter","letter","unsent letter","eleanor letter"]'::jsonb,
  'A fifty-year-old letter declaring love for Arthur and rejecting George.',
  'ev_3',
  false,
  '{"descriptions":["The investigator opens the tin box carefully.","At Present Day - 2:15 PM: The investigator opens the tin box carefully.","Notice this clue: The investigator opens the tin box carefully."],"hints":["A fifty-year-old letter declaring love for Arthur and rejecting George.","Clue hint: Think about unsent love letter.","Search for: a yellowed handwritten letter signed by eleanor."],"clues":["Unsent love letter","Item: Unsent love letter","Clue Word: Unsent love letter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8f92bd89-63de-5001-893d-99e7d8973228',
  'story_074',
  'ev_3',
  3,
  'Present Day - 2:30 PM',
  'Hannah unfolds the cloth inside the box.',
  'Hannah unfolds the cloth inside the box.',
  'A linen handkerchief stained with dried blood and George’s monogram.',
  'Monogram handkerchief',
  'Bloodstained Linen',
  '["Silk glove","Lace ribbon","Satin bow"]'::jsonb,
  'Monogram handkerchief',
  '["monogram handkerchief","handkerchief","linen","cloth"]'::jsonb,
  'A blood-spotted cloth bearing the initials G.A.',
  'ev_4',
  false,
  '{"descriptions":["Hannah unfolds the cloth inside the box.","At Present Day - 2:30 PM: Hannah unfolds the cloth inside the box.","Notice this clue: Hannah unfolds the cloth inside the box."],"hints":["A blood-spotted cloth bearing the initials G.A.","Clue hint: Think about monogram handkerchief.","Search for: a linen handkerchief stained with dried blood and george’s monogram."],"clues":["Monogram handkerchief","Item: Monogram handkerchief","Clue Word: Monogram handkerchief"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5c053bd2-3fdd-57b3-8301-9baa12394839',
  'story_074',
  'ev_4',
  4,
  'Present Day - 3:00 PM',
  'Arthur presents Eleanor’s silver locket to the police.',
  'Arthur presents Eleanor’s silver locket to the police.',
  'A matching piece of silver chain found inside the tin box.',
  'Silver chain',
  'Broken Jewelry Chain',
  '["Cufflink","Earring","Brooch pin"]'::jsonb,
  'Silver chain',
  '["silver chain","chain","broken chain","necklace chain"]'::jsonb,
  'A delicate metal necklace snapped during a violent scuffle.',
  'ev_5',
  false,
  '{"descriptions":["Arthur presents Eleanor’s silver locket to the police.","At Present Day - 3:00 PM: Arthur presents Eleanor’s silver locket to the police.","Notice this clue: Arthur presents Eleanor’s silver locket to the police."],"hints":["A delicate metal necklace snapped during a violent scuffle.","Clue hint: Think about silver chain.","Search for: a matching piece of silver chain found inside the tin box."],"clues":["Silver chain","Item: Silver chain","Clue Word: Silver chain"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '253c8777-3000-592b-b3a5-1336b6a30987',
  'story_074',
  'ev_5',
  5,
  'Present Day - 3:45 PM',
  'Detective Price inspects the 1974 French passport log.',
  'Detective Price inspects the 1974 French passport log.',
  'A forged signature that misspelled Eleanor’s middle name.',
  'Forged passport stamp',
  'Counterfeit Passport Log',
  '["Train ticket","Hotel bill","Boat manifest"]'::jsonb,
  'Forged passport stamp',
  '["forged passport stamp","forged stamp","passport stamp","stamp","forged signature"]'::jsonb,
  'Official paper showing Eleanor never actually entered France.',
  'ev_6',
  true,
  '{"descriptions":["Detective Price inspects the 1974 French passport log.","At Present Day - 3:45 PM: Detective Price inspects the 1974 French passport log.","Notice this clue: Detective Price inspects the 1974 French passport log."],"hints":["Official paper showing Eleanor never actually entered France.","Clue hint: Think about forged passport stamp.","Search for: a forged signature that misspelled eleanor’s middle name."],"clues":["Forged passport stamp","Item: Forged passport stamp","Clue Word: Forged passport stamp"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '36ffe405-b6b8-57b8-a647-f9f138d1ed77',
  'story_074',
  'ev_6',
  6,
  'Present Day - 4:30 PM',
  'Forensic team scans the rose terrace with radar.',
  'Forensic team scans the rose terrace with radar.',
  'Disturbed flagstones over an anomaly beneath the rose garden.',
  'Rose terrace flagstone',
  'Buried Garden Anomaly',
  '["Fountain basin","Sundial pedestal","Stone bench"]'::jsonb,
  'Rose terrace flagstone',
  '["rose terrace flagstone","flagstone","terrace flagstone","garden stone","rose stone"]'::jsonb,
  'Carved patio stones hiding secrets beneath the rose bushes.',
  'ev_7',
  false,
  '{"descriptions":["Forensic team scans the rose terrace with radar.","At Present Day - 4:30 PM: Forensic team scans the rose terrace with radar.","Notice this clue: Forensic team scans the rose terrace with radar."],"hints":["Carved patio stones hiding secrets beneath the rose bushes.","Clue hint: Think about rose terrace flagstone.","Search for: disturbed flagstones over an anomaly beneath the rose garden."],"clues":["Rose terrace flagstone","Item: Rose terrace flagstone","Clue Word: Rose terrace flagstone"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2431cbe4-8ae0-5e53-8734-f31ff3c85cb8',
  'story_074',
  'ev_7',
  7,
  'Present Day - 5:15 PM',
  'Police confront George with his monogrammed handkerchief.',
  'Police confront George with his monogrammed handkerchief.',
  'George’s DNA matching the hair caught in the tin box hinge.',
  'Hinged tin hair strand',
  'DNA Match',
  '["Fingerprint on glass","Mud on boot","Ink smudge"]'::jsonb,
  'Hinged tin hair strand',
  '["hinged tin hair strand","hair","hair strand","dna hair","dna match"]'::jsonb,
  'Forensic trace left when the killer shoved the box into the soot.',
  'ev_8',
  false,
  '{"descriptions":["Police confront George with his monogrammed handkerchief.","At Present Day - 5:15 PM: Police confront George with his monogrammed handkerchief.","Notice this clue: Police confront George with his monogrammed handkerchief."],"hints":["Forensic trace left when the killer shoved the box into the soot.","Clue hint: Think about hinged tin hair strand.","Search for: george’s dna matching the hair caught in the tin box hinge."],"clues":["Hinged tin hair strand","Item: Hinged tin hair strand","Clue Word: Hinged tin hair strand"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a9223bf2-6079-532b-9dfc-c1d4179eff0f',
  'story_074',
  'ev_8',
  8,
  'Present Day - 6:00 PM',
  'George breaks down and admits what happened fifty years ago.',
  'George breaks down and admits what happened fifty years ago.',
  'George’s confession revealing where Eleanor’s engagement ring was thrown.',
  'Confession statement',
  'Signed Confession',
  '["Old journal","Pawn receipt","Telegram"]'::jsonb,
  'Confession statement',
  '["confession statement","confession","signed confession","admission"]'::jsonb,
  'Written admission of the murder signed by the elderly lord.',
  NULL,
  true,
  '{"descriptions":["George breaks down and admits what happened fifty years ago.","At Present Day - 6:00 PM: George breaks down and admits what happened fifty years ago.","Notice this clue: George breaks down and admits what happened fifty years ago."],"hints":["Written admission of the murder signed by the elderly lord.","Clue hint: Think about confession statement.","Search for: george’s confession revealing where eleanor’s engagement ring was thrown."],"clues":["Confession statement","Item: Confession statement","Clue Word: Confession statement"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_075 — THE BROKEN VIOLIN STRING
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_075',
  'The Broken Violin String',
  'Romance / Drama',
  'The Royal Academy Concert Hall backstage, red velvet curtains, instrument cases, and tuning rooms',
  'Moments before the international solo competition, the favorite virtuoso’s antique Stradivarius string snapped, cutting his hand and blinding him in one eye.',
  '[{"name":"Julian Mercer","role":"Virtuoso Prodigy","alibi":"Warming up in dressing room A","avatar":"🎻"},{"name":"Bianca Rossi","role":"Second-Chair Soloist","alibi":"Claims she was practicing scales in the basement rehearsal booth","avatar":"🎶"},{"name":"Maestro Leon Vance","role":"Orchestra Conductor","alibi":"Reviewing the score in his maestro office","avatar":"🎼"},{"name":"Felix Chen","role":"Stage Sound Engineer","alibi":"At the master sound mixing console backstage","avatar":"🎧"}]'::jsonb,
  'Bianca Rossi, Julian’s former lover and second-chair rival, entered Julian’s dressing room with micro-cutters and scored his titanium E-string. When Julian tuned the instrument to pitch on stage, the wire snapped under tremendous tension, slashing his fingers.',
  'Violinist Bianca Rossi',
  'Bianca wanted to secure the first-chair position and revenge after her lover Julian chose music over their relationship.',
  '[{"time":"6:45 PM","event":"Julian replaces his violin strings with brand new titanium alloy."},{"time":"7:10 PM","event":"Julian leaves his dressing room to speak with the conductor."},{"time":"7:15 PM","event":"Bianca enters room A and scores Julian’s E-string with a micro-file."},{"time":"7:45 PM","event":"Julian walks on stage and begins fine-tuning under hot stage lights."},{"time":"7:48 PM","event":"The E-string snaps violently, cutting Julian’s hand."}]'::jsonb,
  '[{"id":"ev_1","title":"Cut Violin Wire","detail":"Titanium string showing a precise mechanical notch filed across its center."},{"id":"ev_2","title":"Diamond Mini-File","detail":"Tiny abrasive jeweler’s tool with residue matching the violin wire."},{"id":"ev_3","title":"Dress Fiber","detail":"Green emerald silk fiber matching Bianca Rossi’s evening concert dress."},{"id":"ev_4","title":"Sound Recording","detail":"Timestamped audio recording of the string being filed in room A."}]'::jsonb,
  '[{"order":1,"title":"Metallic click audio","text":"Audio proof of someone tampering with the instrument in room A."},{"order":2,"title":"Emerald silk thread","text":"Ties Bianca directly to Julian’s locked dressing room."},{"order":3,"title":"Scored violin string","text":"Proves the string failure was calculated sabotage, not bad luck."},{"order":4,"title":"Jeweler micro-file","text":"The murder weapon for Julian’s musical career."},{"order":5,"title":"Tool receipt","text":"Financial trail proving Bianca bought the file this morning."},{"order":6,"title":"Titanium dust","text":"Direct forensic trace found on the saboteur’s hands."}]'::jsonb,
  'Overheating stage lamps: Hot lights raised room temperature but could not score titanium.; Stagehand bumping case: The clumsy worker never opened the instrument latch.',
  'Blame the nervous stagehand who bumped Julian’s case, or claim the instrument wood shrank from humidifiers.',
  'NORMAL',
  'Was it a tragic accident under stage lights, or deliberate sabotage born from romantic rivalry?',
  '[{"character":"Julian Mercer","secret":"He had secretly offered Bianca’s orchestra seat to a guest soloist from Vienna."},{"character":"Bianca Rossi","secret":"A jeweler’s diamond micro-file hidden inside her violin rosin case."},{"character":"Maestro Leon Vance","secret":"He had heavily insured Julian’s hands for five hundred thousand dollars."},{"character":"Felix Chen","secret":"He was secretly recording rehearsal tracks for his sound library."}]'::jsonb,
  '[{"lead":"Overheating stage lamps","explanation":"Hot lights raised room temperature but could not score titanium."},{"lead":"Stagehand bumping case","explanation":"The clumsy worker never opened the instrument latch."}]'::jsonb,
  '{"wrongTheories":["The string failed naturally due to defective manufacturing in Vienna.","The conductor sabotaged the violin to claim the huge insurance payout."],"correctTheory":"Bianca Rossi deliberately notched Julian’s titanium string with a file to steal his solo role and seek revenge."}'::jsonb,
  'Bianca Rossi notched Julian’s high string with a diamond micro-file out of jealousy and career ambition.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Bianca was banned from performing and faced criminal assault charges while Julian recovered to play again."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Julian’s career was ruined while Bianca played the world tour as the celebrated new soloist."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The disaster was dismissed as instrument wear, leaving the envious rival in complete control of the orchestra."}]'::jsonb,
  '{"intros":["Moments before the international solo competition, the favorite virtuoso’s antique Stradivarius string snapped, cutting his hand and blinding him in one eye.","Case file story_075: Moments before the international solo competition, the favorite virtuoso’s antique Stradivarius string snapped, cutting his hand and blinding him in one eye. Look closely at every clue.","Trouble begins in The Royal Academy Concert Hall backstage, red velvet curtains, instrument cases, and tuning rooms. Moments before the international solo competition, the favorite virtuoso’s antique Stradivarius string snapped, cutting his hand and blinding him in one eye.","The mystery starts now. Moments before the international solo competition, the favorite virtuoso’s antique Stradivarius string snapped, cutting his hand and blinding him in one eye. Can you solve it?"],"reveals":["Bianca Rossi notched Julian’s high string with a diamond micro-file out of jealousy and career ambition.","The mystery is unraveled! Bianca Rossi notched Julian’s high string with a diamond micro-file out of jealousy and career ambition.","At last, the truth comes out: Bianca Rossi notched Julian’s high string with a diamond micro-file out of jealousy and career ambition.","Case resolved! Here is what happened: Bianca Rossi notched Julian’s high string with a diamond micro-file out of jealousy and career ambition."],"hints":["Pay attention to where Violinist Bianca Rossi was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_075';
DELETE FROM public.case_events WHERE case_id = 'story_075';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e51985d0-a222-57f8-be0d-ce2581f915cf',
  'story_075',
  'Julian Mercer',
  'Virtuoso Prodigy',
  'Gifted, intense, with bandaged fingers and an antique violin',
  'That string was brand new titanium alloy. It does not snap on its own.',
  'He had secretly offered Bianca’s orchestra seat to a guest soloist from Vienna.',
  'Warming up in dressing room A',
  'Lead soloist and former boyfriend of Bianca',
  'The string tension was balanced perfectly thirty minutes before showtime.',
  'Did not notice Bianca slipping into his private dressing room during sound check.',
  '🎻',
  '["That string was brand new titanium alloy. It does not snap on its own.","\"That string was brand new titanium alloy. It does not snap on its own.\"","Listen to me: That string was brand new titanium alloy. It does not snap on its own.","I tell you the truth: That string was brand new titanium alloy. It does not snap on its own."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '67dfdad9-3a1e-583e-b31c-fa16d730815e',
  'story_075',
  'Bianca Rossi',
  'Second-Chair Soloist',
  'Ambitious, elegant, cold smile, wearing emerald concert silk',
  'Strings break all the time under harsh stage spotlights. Julian was reckless.',
  'A jeweler’s diamond micro-file hidden inside her violin rosin case.',
  'Claims she was practicing scales in the basement rehearsal booth',
  'Julian’s competitor and ex-lover',
  'Etching a titanium string makes it fail within three minutes of tuning.',
  'Did not know the backstage tuning monitor recorded the pitch frequency when she touched his violin.',
  '🎶',
  '["Strings break all the time under harsh stage spotlights. Julian was reckless.","\"Strings break all the time under harsh stage spotlights. Julian was reckless.\"","Listen to me: Strings break all the time under harsh stage spotlights. Julian was reckless.","I tell you the truth: Strings break all the time under harsh stage spotlights. Julian was reckless."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4c4f2acb-6131-5bdd-bd50-54b957e821b2',
  'story_075',
  'Maestro Leon Vance',
  'Orchestra Conductor',
  'Severe, demanding perfection, holding a silver baton',
  'Tonight’s concert was supposed to secure our million-dollar European tour.',
  'He had heavily insured Julian’s hands for five hundred thousand dollars.',
  'Reviewing the score in his maestro office',
  'Head director of the Royal Academy Symphony',
  'Bianca had begged him for Julian’s solo piece yesterday.',
  'Did not see Bianca carrying tools into dressing room A.',
  '🎼',
  '["Tonight’s concert was supposed to secure our million-dollar European tour.","\"Tonight’s concert was supposed to secure our million-dollar European tour.\"","Listen to me: Tonight’s concert was supposed to secure our million-dollar European tour.","I tell you the truth: Tonight’s concert was supposed to secure our million-dollar European tour."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '29ee5df8-f5a6-571f-abfe-ef3de5c934d7',
  'story_075',
  'Felix Chen',
  'Stage Sound Engineer',
  'Quiet technician, wearing headphones and black stage clothing',
  'The audio feed captured a distinct metallic clipping sound in room A at 7:15 PM.',
  'He was secretly recording rehearsal tracks for his sound library.',
  'At the master sound mixing console backstage',
  'Responsible for stage audio and dressing room microphones',
  'The microphone in Julian’s room was live during the break.',
  'Did not see who held the tool until reviewing digital video logs.',
  '🎧',
  '["The audio feed captured a distinct metallic clipping sound in room A at 7:15 PM.","\"The audio feed captured a distinct metallic clipping sound in room A at 7:15 PM.\"","Listen to me: The audio feed captured a distinct metallic clipping sound in room A at 7:15 PM.","I tell you the truth: The audio feed captured a distinct metallic clipping sound in room A at 7:15 PM."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a4c528d6-26b5-53f2-a4a1-c05aa466116e',
  'story_075',
  'ev_1',
  1,
  '7:15 PM',
  'Felix records a sharp metallic ping on room A audio.',
  'Felix records a sharp metallic ping on room A audio.',
  'An audio waveform showing metal cutting frequency.',
  'Metallic click audio',
  'Sound Recording',
  '["Door creak","Cough","Violin note"]'::jsonb,
  'Metallic click audio',
  '["metallic click audio","audio","sound recording","metallic click","ping audio"]'::jsonb,
  'Backstage microphone recording of metal cutting.',
  'ev_2',
  true,
  '{"descriptions":["Felix records a sharp metallic ping on room A audio.","At 7:15 PM: Felix records a sharp metallic ping on room A audio.","Notice this clue: Felix records a sharp metallic ping on room A audio."],"hints":["Backstage microphone recording of metal cutting.","Clue hint: Think about metallic click audio.","Search for: an audio waveform showing metal cutting frequency."],"clues":["Metallic click audio","Item: Metallic click audio","Clue Word: Metallic click audio"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '465cde28-c24e-5e14-8d11-f0773bcdbbfe',
  'story_075',
  'ev_2',
  2,
  '7:20 PM',
  'Bianca exits dressing room A in a hurry.',
  'Bianca exits dressing room A in a hurry.',
  'Emerald silk threads caught on Julian’s instrument locker latch.',
  'Emerald silk thread',
  'Dress Fiber',
  '["Cotton strand","Wool patch","Nylon lace"]'::jsonb,
  'Emerald silk thread',
  '["emerald silk thread","emerald thread","silk thread","dress fiber","thread"]'::jsonb,
  'Green dress fabric matching Bianca’s concert gown.',
  'ev_3',
  false,
  '{"descriptions":["Bianca exits dressing room A in a hurry.","At 7:20 PM: Bianca exits dressing room A in a hurry.","Notice this clue: Bianca exits dressing room A in a hurry."],"hints":["Green dress fabric matching Bianca’s concert gown.","Clue hint: Think about emerald silk thread.","Search for: emerald silk threads caught on julian’s instrument locker latch."],"clues":["Emerald silk thread","Item: Emerald silk thread","Clue Word: Emerald silk thread"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a20e611a-757e-50e5-bb49-707f7902930d',
  'story_075',
  'ev_3',
  3,
  '7:48 PM',
  'The string snaps on stage under tension.',
  'The string snaps on stage under tension.',
  'Microscopic scored notch at the break point of the snapped string.',
  'Scored violin string',
  'Cut Violin Wire',
  '["Melted plastic","Burn mark","Frayed knot"]'::jsonb,
  'Scored violin string',
  '["scored violin string","violin string","scored string","cut wire","string"]'::jsonb,
  'High-tension metal wire deliberately weakened with a file.',
  'ev_4',
  false,
  '{"descriptions":["The string snaps on stage under tension.","At 7:48 PM: The string snaps on stage under tension.","Notice this clue: The string snaps on stage under tension."],"hints":["High-tension metal wire deliberately weakened with a file.","Clue hint: Think about scored violin string.","Search for: microscopic scored notch at the break point of the snapped string."],"clues":["Scored violin string","Item: Scored violin string","Clue Word: Scored violin string"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '96c19d1f-42d1-5575-8941-536aa4f19d87',
  'story_075',
  'ev_4',
  4,
  '7:55 PM',
  'Paramedics treat Julian’s hand in the wings.',
  'Paramedics treat Julian’s hand in the wings.',
  'A dropped diamond micro-file behind Julian’s music stand.',
  'Jeweler micro-file',
  'Diamond Mini-File',
  '["Tuning fork","Pencil","Screwdriver"]'::jsonb,
  'Jeweler micro-file',
  '["jeweler micro-file","file","micro-file","diamond file","mini file"]'::jsonb,
  'A tiny filing tool used to score hard metal strings.',
  'ev_5',
  false,
  '{"descriptions":["Paramedics treat Julian’s hand in the wings.","At 7:55 PM: Paramedics treat Julian’s hand in the wings.","Notice this clue: Paramedics treat Julian’s hand in the wings."],"hints":["A tiny filing tool used to score hard metal strings.","Clue hint: Think about jeweler micro-file.","Search for: a dropped diamond micro-file behind julian’s music stand."],"clues":["Jeweler micro-file","Item: Jeweler micro-file","Clue Word: Jeweler micro-file"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '58c67e5c-9b5d-588d-a758-858cface753a',
  'story_075',
  'ev_5',
  5,
  '8:05 PM',
  'Stage security checks the backstage trash bins.',
  'Stage security checks the backstage trash bins.',
  'An empty package for micro-pliers with Bianca’s credit receipt.',
  'Tool receipt',
  'Hardware Receipt',
  '["Coffee cup","Sheet music","Towel"]'::jsonb,
  'Tool receipt',
  '["tool receipt","receipt","hardware receipt","bill"]'::jsonb,
  'Store slip showing the purchase of miniature wire cutting tools.',
  'ev_6',
  true,
  '{"descriptions":["Stage security checks the backstage trash bins.","At 8:05 PM: Stage security checks the backstage trash bins.","Notice this clue: Stage security checks the backstage trash bins."],"hints":["Store slip showing the purchase of miniature wire cutting tools.","Clue hint: Think about tool receipt.","Search for: an empty package for micro-pliers with bianca’s credit receipt."],"clues":["Tool receipt","Item: Tool receipt","Clue Word: Tool receipt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd33e1269-ae90-5368-87cd-8611bfa18491',
  'story_075',
  'ev_6',
  6,
  '8:15 PM',
  'The maestro inspects Bianca’s violin case.',
  'The maestro inspects Bianca’s violin case.',
  'Julian’s rehearsal score sheet hidden inside Bianca’s bag.',
  'Marked music score',
  'Annotated Solo Score',
  '["Rosin block","Bow strap","Mute clip"]'::jsonb,
  'Marked music score',
  '["marked music score","music score","score sheet","solo score","sheet music"]'::jsonb,
  'The lead solo musical notes stolen from Julian’s locker.',
  'ev_7',
  false,
  '{"descriptions":["The maestro inspects Bianca’s violin case.","At 8:15 PM: The maestro inspects Bianca’s violin case.","Notice this clue: The maestro inspects Bianca’s violin case."],"hints":["The lead solo musical notes stolen from Julian’s locker.","Clue hint: Think about marked music score.","Search for: julian’s rehearsal score sheet hidden inside bianca’s bag."],"clues":["Marked music score","Item: Marked music score","Clue Word: Marked music score"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f5934a71-ce34-5884-baae-68dbc9ed4cb2',
  'story_075',
  'ev_7',
  7,
  '8:30 PM',
  'Investigators check Bianca’s dressing room locker.',
  'Investigators check Bianca’s dressing room locker.',
  'Traces of titanium dust on Bianca’s manicured fingers.',
  'Titanium dust',
  'Metal Powder Traces',
  '["Rosin powder","Chalk dust","Perfume oil"]'::jsonb,
  'Titanium dust',
  '["titanium dust","metal dust","dust","metal powder"]'::jsonb,
  'Microscopic silver metal residue from filing Julian’s string.',
  'ev_8',
  false,
  '{"descriptions":["Investigators check Bianca’s dressing room locker.","At 8:30 PM: Investigators check Bianca’s dressing room locker.","Notice this clue: Investigators check Bianca’s dressing room locker."],"hints":["Microscopic silver metal residue from filing Julian’s string.","Clue hint: Think about titanium dust.","Search for: traces of titanium dust on bianca’s manicured fingers."],"clues":["Titanium dust","Item: Titanium dust","Clue Word: Titanium dust"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5e298784-0537-5c4a-90c0-c59937b0803a',
  'story_075',
  'ev_8',
  8,
  '8:45 PM',
  'Bianca attempts to step on stage as the replacement lead.',
  'Bianca attempts to step on stage as the replacement lead.',
  'Security halts Bianca and presents the physical tool evidence.',
  'Security detention',
  'Apprehension Report',
  '["Encore flowers","Trophy","Medal"]'::jsonb,
  'Security detention',
  '["security detention","detention","apprehension","arrest report"]'::jsonb,
  'Official backstage police stop before Bianca could perform.',
  NULL,
  true,
  '{"descriptions":["Bianca attempts to step on stage as the replacement lead.","At 8:45 PM: Bianca attempts to step on stage as the replacement lead.","Notice this clue: Bianca attempts to step on stage as the replacement lead."],"hints":["Official backstage police stop before Bianca could perform.","Clue hint: Think about security detention.","Search for: security halts bianca and presents the physical tool evidence."],"clues":["Security detention","Item: Security detention","Clue Word: Security detention"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_076 — SECRETS OF THE ROSE GARDEN
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_076',
  'Secrets of the Rose Garden',
  'Romance / Drama',
  'Waverly Estate gardens, blooming white rose bushes, stone fountain, and wrought-iron gazebo',
  'While planting prize white roses, the head gardener uncovered a buried silver locket containing a lock of hair and a poisoned thorn ring.',
  '[{"name":"Lady Beatrice Waverly","role":"Matriarch of the Estate","alibi":"In the estate morning room sipping Earl Grey tea","avatar":"👒"},{"name":"Thomas Thorne","role":"Head Estate Gardener","alibi":"Pruning rose bushes near the south wall","avatar":"🌱"},{"name":"Julian Waverly","role":"Heir of the Estate","alibi":"Reviewing estate family deeds in the library","avatar":"📖"},{"name":"Dr. Evelyn Vance","role":"Botanical Toxicologist","alibi":"Examining samples at the garden table","avatar":"🔬"}]'::jsonb,
  'Thirty years ago, Lady Beatrice poisoned young governess Marianne with a thorn-ring hidden inside a silver keepsake locket. To cover up the crime, Beatrice buried the locket beneath the white rose bush where Marianne collapsed, claiming Marianne simply departed in the night.',
  'Lady Beatrice Waverly',
  'Beatrice poisoned her husband’s first true love to ensure her own marriage to the family fortune.',
  '[{"time":"June 14, 1994 - 4:00 PM","event":"Beatrice gifts the poisoned silver locket to Marianne in the gazebo."},{"time":"June 14, 1994 - 6:30 PM","event":"Marianne pricks her finger on the thorn ring and collapses."},{"time":"June 14, 1994 - 8:00 PM","event":"Beatrice buries the locket deep beneath the white rose roots."},{"time":"June 15, 1994 - 8:00 AM","event":"Beatrice tells Lord Edward that Marianne packed her bags and left."},{"time":"Present Day - 10:00 AM","event":"Gardener Thomas unearths the metal box while digging a rose bed."}]'::jsonb,
  '[{"id":"ev_1","title":"Silver Locket","detail":"Buried silver heirloom with an engraved initial \"M\" on the rear face."},{"id":"ev_2","title":"Poison Thorn Ring","detail":"Secret ring containing a hollow needle coated with dried belladonna."},{"id":"ev_3","title":"Poison Purchase Record","detail":"Estate receipt proving Lady Beatrice bought deadly nightshade seeds in 1994."},{"id":"ev_4","title":"Locket Key","detail":"Antique silver key found in Lady Beatrice’s jewelry box matching the buried locket."}]'::jsonb,
  '[{"order":1,"title":"Tarnished locket","text":"Buried relic linking the past disappearance to the rose garden."},{"order":2,"title":"Thorn needle ring","text":"The ingenious assassination weapon disguised as romance."},{"order":3,"title":"Nightshade residue","text":"Chemical proof of lethal botanical poisoning."},{"order":4,"title":"Father’s journal","text":"Establishes Beatrice’s desperate jealousy over Marianne."},{"order":5,"title":"Greenhouse seed log","text":"Ties Beatrice directly to cultivating the deadly plant."},{"order":6,"title":"Miniature silver key","text":"Direct physical possession proving the locket belonged to Beatrice."}]'::jsonb,
  'Old gardener’s pruning shears: Thomas pruned the garden but never possessed any poison.; Marianne’s packed suitcase: Staged in an attic trunk by Beatrice to simulate running away.',
  'Accuse the old groundskeeper or claim the governess took her own life in sorrow.',
  'NORMAL',
  'Who buried the poisonous heirloom beneath the roses thirty years ago?',
  '[{"character":"Lady Beatrice Waverly","secret":"She retains the silver key that opens the lock on the silver locket."},{"character":"Thomas Thorne","secret":"He was a boy when governess Marianne vanished from the grounds."},{"character":"Julian Waverly","secret":"He wants to donate the estate to a children’s charity against his mother’s wishes."},{"character":"Dr. Evelyn Vance","secret":"She was commissioned by the historical society to survey estate plants."}]'::jsonb,
  '[{"lead":"Old gardener’s pruning shears","explanation":"Thomas pruned the garden but never possessed any poison."},{"lead":"Marianne’s packed suitcase","explanation":"Staged in an attic trunk by Beatrice to simulate running away."}]'::jsonb,
  '{"wrongTheories":["Marianne died by accidental food poisoning in the kitchen and the staff hid it.","Lord Edward killed Marianne after she threatened to expose their secret romance."],"correctTheory":"Lady Beatrice poisoned Marianne with a nightshade thorn ring and buried the evidence beneath the rose garden."}'::jsonb,
  'Lady Beatrice Waverly poisoned Marianne with a deadly thorn ring to secure her marriage to Lord Edward.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Beatrice was arrested for the historical murder, and Marianne was finally laid to rest with family honors."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The death remained classified as an unsolved disappearance, leaving Beatrice in proud comfort."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The estate was cursed by dark ghost rumors while the true murderer took her secrets to the grave."}]'::jsonb,
  '{"intros":["While planting prize white roses, the head gardener uncovered a buried silver locket containing a lock of hair and a poisoned thorn ring.","Case file story_076: While planting prize white roses, the head gardener uncovered a buried silver locket containing a lock of hair and a poisoned thorn ring. Look closely at every clue.","Trouble begins in Waverly Estate gardens, blooming white rose bushes, stone fountain, and wrought-iron gazebo. While planting prize white roses, the head gardener uncovered a buried silver locket containing a lock of hair and a poisoned thorn ring.","The mystery starts now. While planting prize white roses, the head gardener uncovered a buried silver locket containing a lock of hair and a poisoned thorn ring. Can you solve it?"],"reveals":["Lady Beatrice Waverly poisoned Marianne with a deadly thorn ring to secure her marriage to Lord Edward.","The mystery is unraveled! Lady Beatrice Waverly poisoned Marianne with a deadly thorn ring to secure her marriage to Lord Edward.","At last, the truth comes out: Lady Beatrice Waverly poisoned Marianne with a deadly thorn ring to secure her marriage to Lord Edward.","Case resolved! Here is what happened: Lady Beatrice Waverly poisoned Marianne with a deadly thorn ring to secure her marriage to Lord Edward."],"hints":["Pay attention to where Lady Beatrice Waverly was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_076';
DELETE FROM public.case_events WHERE case_id = 'story_076';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7c9cb9f0-a9c0-5d1c-a4f2-23a006ba4d03',
  'story_076',
  'Lady Beatrice Waverly',
  'Matriarch of the Estate',
  'Imposing, cold poise, silk shawl, refusing to enter the rose garden',
  'The past is buried where it belongs. That locket is harmless old junk.',
  'She retains the silver key that opens the lock on the silver locket.',
  'In the estate morning room sipping Earl Grey tea',
  'Widow of Lord Edward Waverly',
  'The thorn inside the ring was dipped in deadly nightshade extract.',
  'Did not know the poison alkaloid remains preserved in the silver setting.',
  '👒',
  '["The past is buried where it belongs. That locket is harmless old junk.","\"The past is buried where it belongs. That locket is harmless old junk.\"","Listen to me: The past is buried where it belongs. That locket is harmless old junk.","I tell you the truth: The past is buried where it belongs. That locket is harmless old junk."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd364c7d2-d722-5450-a07c-a7ea89696bd3',
  'story_076',
  'Thomas Thorne',
  'Head Estate Gardener',
  'Earthy, observant, green apron, hands caked in rich loam',
  'These rose roots never grew properly around that spot. Something was poisoning the soil.',
  'He was a boy when governess Marianne vanished from the grounds.',
  'Pruning rose bushes near the south wall',
  'Caretaker of Waverly gardens for forty years',
  'Marianne loved white roses more than anything in the world.',
  'Did not know how to open the miniature spring latch on the locket.',
  '🌱',
  '["These rose roots never grew properly around that spot. Something was poisoning the soil.","\"These rose roots never grew properly around that spot. Something was poisoning the soil.\"","Listen to me: These rose roots never grew properly around that spot. Something was poisoning the soil.","I tell you the truth: These rose roots never grew properly around that spot. Something was poisoning the soil."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5f682b26-af85-5bb7-93bc-a766f0cc2acf',
  'story_076',
  'Julian Waverly',
  'Heir of the Estate',
  'Refined, conflicted, seeking the truth about his father’s past',
  'My father’s private journal mentions Marianne with deep sorrow and regret.',
  'He wants to donate the estate to a children’s charity against his mother’s wishes.',
  'Reviewing estate family deeds in the library',
  'Son of Beatrice and late Lord Edward',
  'His father never loved Beatrice and kept Marianne’s letters locked away.',
  'Did not suspect his mother was capable of cold-blooded murder.',
  '📖',
  '["My father’s private journal mentions Marianne with deep sorrow and regret.","\"My father’s private journal mentions Marianne with deep sorrow and regret.\"","Listen to me: My father’s private journal mentions Marianne with deep sorrow and regret.","I tell you the truth: My father’s private journal mentions Marianne with deep sorrow and regret."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f6040d33-27af-51a7-80c1-0527b15c4ae1',
  'story_076',
  'Dr. Evelyn Vance',
  'Botanical Toxicologist',
  'Scholarly, glasses, carrying forensic reagent vials and tweezers',
  'This thorn has a hollow reservoir designed to inject concentrated belladonna toxins.',
  'She was commissioned by the historical society to survey estate plants.',
  'Examining samples at the garden table',
  'Independent botanical expert',
  'Nightshade was grown in Beatrice’s private conservatory thirty years ago.',
  'Did not know who gifted the poisoned jewelry to the governess.',
  '🔬',
  '["This thorn has a hollow reservoir designed to inject concentrated belladonna toxins.","\"This thorn has a hollow reservoir designed to inject concentrated belladonna toxins.\"","Listen to me: This thorn has a hollow reservoir designed to inject concentrated belladonna toxins.","I tell you the truth: This thorn has a hollow reservoir designed to inject concentrated belladonna toxins."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8e2ac63a-bf9f-5e61-86d3-a3f0eb93c097',
  'story_076',
  'ev_1',
  1,
  'Present Day - 10:00 AM',
  'Thomas strikes a hard metal object with his garden spade.',
  'Thomas strikes a hard metal object with his garden spade.',
  'A tarnished silver locket entwined with rose roots.',
  'Tarnished locket',
  'Silver Locket',
  '["Rake tine","Horseshoe","Old coin"]'::jsonb,
  'Tarnished locket',
  '["tarnished locket","locket","silver locket","necklace"]'::jsonb,
  'Antique jewelry box discovered buried in the flower bed.',
  'ev_2',
  true,
  '{"descriptions":["Thomas strikes a hard metal object with his garden spade.","At Present Day - 10:00 AM: Thomas strikes a hard metal object with his garden spade.","Notice this clue: Thomas strikes a hard metal object with his garden spade."],"hints":["Antique jewelry box discovered buried in the flower bed.","Clue hint: Think about tarnished locket.","Search for: a tarnished silver locket entwined with rose roots."],"clues":["Tarnished locket","Item: Tarnished locket","Clue Word: Tarnished locket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c11a91a3-635b-53fb-aed5-048e3d19f7cf',
  'story_076',
  'ev_2',
  2,
  'Present Day - 10:30 AM',
  'Dr. Vance springs the hidden catch on the locket.',
  'Dr. Vance springs the hidden catch on the locket.',
  'A tiny gold ring with a sharp hollow needle thorn.',
  'Thorn needle ring',
  'Poison Thorn Ring',
  '["Brooch pin","Pearl stud","Lock of hair"]'::jsonb,
  'Thorn needle ring',
  '["thorn needle ring","thorn ring","ring","needle ring","poison ring"]'::jsonb,
  'A deadly miniature ring with a venom needle concealed inside.',
  'ev_3',
  false,
  '{"descriptions":["Dr. Vance springs the hidden catch on the locket.","At Present Day - 10:30 AM: Dr. Vance springs the hidden catch on the locket.","Notice this clue: Dr. Vance springs the hidden catch on the locket."],"hints":["A deadly miniature ring with a venom needle concealed inside.","Clue hint: Think about thorn needle ring.","Search for: a tiny gold ring with a sharp hollow needle thorn."],"clues":["Thorn needle ring","Item: Thorn needle ring","Clue Word: Thorn needle ring"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0b59dc47-78ab-5c65-89f5-5f762fc813f0',
  'story_076',
  'ev_3',
  3,
  'Present Day - 11:00 AM',
  'Dr. Vance runs a chemical reagent test on the needle.',
  'Dr. Vance runs a chemical reagent test on the needle.',
  'Traces of crystallized belladonna nightshade toxin.',
  'Nightshade residue',
  'Toxin Analysis',
  '["Rose water","Arsenic dust","Rust patina"]'::jsonb,
  'Nightshade residue',
  '["nightshade residue","nightshade","toxin","belladonna"]'::jsonb,
  'Poisonous plant extract preserved on the needle tip.',
  'ev_4',
  false,
  '{"descriptions":["Dr. Vance runs a chemical reagent test on the needle.","At Present Day - 11:00 AM: Dr. Vance runs a chemical reagent test on the needle.","Notice this clue: Dr. Vance runs a chemical reagent test on the needle."],"hints":["Poisonous plant extract preserved on the needle tip.","Clue hint: Think about nightshade residue.","Search for: traces of crystallized belladonna nightshade toxin."],"clues":["Nightshade residue","Item: Nightshade residue","Clue Word: Nightshade residue"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd0c885e0-4346-565a-963e-47ce6ca1dd57',
  'story_076',
  'ev_4',
  4,
  'Present Day - 11:45 AM',
  'Julian searches his father’s old desk in the study.',
  'Julian searches his father’s old desk in the study.',
  'A diary entry describing Beatrice’s intense jealousy of Marianne.',
  'Father’s journal',
  'Lord Edward’s Diary',
  '["Tax record","Will","Checkbook"]'::jsonb,
  'Father’s journal',
  '["father’s journal","journal","diary","father journal","father diary"]'::jsonb,
  'Handwritten records of the family drama thirty years ago.',
  'ev_5',
  false,
  '{"descriptions":["Julian searches his father’s old desk in the study.","At Present Day - 11:45 AM: Julian searches his father’s old desk in the study.","Notice this clue: Julian searches his father’s old desk in the study."],"hints":["Handwritten records of the family drama thirty years ago.","Clue hint: Think about father’s journal.","Search for: a diary entry describing beatrice’s intense jealousy of marianne."],"clues":["Father’s journal","Item: Father’s journal","Clue Word: Father’s journal"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd7d1e52f-f905-5d61-a6e5-8866e5ba24f3',
  'story_076',
  'ev_5',
  5,
  'Present Day - 12:30 PM',
  'Gardener Thomas shows an old greenhouse ledger.',
  'Gardener Thomas shows an old greenhouse ledger.',
  'A record of Beatrice ordering belladonna seeds in May 1994.',
  'Greenhouse seed log',
  'Poison Purchase Record',
  '["Tulip order","Fertilizer bill","Pesticide sheet"]'::jsonb,
  'Greenhouse seed log',
  '["greenhouse seed log","seed log","greenhouse log","purchase record","order log"]'::jsonb,
  'Paperwork proving Beatrice bought deadly nightshade seeds.',
  'ev_6',
  true,
  '{"descriptions":["Gardener Thomas shows an old greenhouse ledger.","At Present Day - 12:30 PM: Gardener Thomas shows an old greenhouse ledger.","Notice this clue: Gardener Thomas shows an old greenhouse ledger."],"hints":["Paperwork proving Beatrice bought deadly nightshade seeds.","Clue hint: Think about greenhouse seed log.","Search for: a record of beatrice ordering belladonna seeds in may 1994."],"clues":["Greenhouse seed log","Item: Greenhouse seed log","Clue Word: Greenhouse seed log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9f15ee05-ff36-523a-a2b4-35954a7261ff',
  'story_076',
  'ev_6',
  6,
  'Present Day - 1:15 PM',
  'Police inspect Beatrice’s jewelry chest in the bedroom.',
  'Police inspect Beatrice’s jewelry chest in the bedroom.',
  'A silver miniature key that matches the locket’s hidden latch.',
  'Miniature silver key',
  'Locket Key',
  '["Watch key","Chest key","Desk key"]'::jsonb,
  'Miniature silver key',
  '["miniature silver key","silver key","miniature key","key","locket key"]'::jsonb,
  'A tiny key kept in Lady Beatrice’s personal jewelry box.',
  'ev_7',
  false,
  '{"descriptions":["Police inspect Beatrice’s jewelry chest in the bedroom.","At Present Day - 1:15 PM: Police inspect Beatrice’s jewelry chest in the bedroom.","Notice this clue: Police inspect Beatrice’s jewelry chest in the bedroom."],"hints":["A tiny key kept in Lady Beatrice’s personal jewelry box.","Clue hint: Think about miniature silver key.","Search for: a silver miniature key that matches the locket’s hidden latch."],"clues":["Miniature silver key","Item: Miniature silver key","Clue Word: Miniature silver key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a9dd1e04-9be1-5bc7-abad-9e37be203212',
  'story_076',
  'ev_7',
  7,
  'Present Day - 2:00 PM',
  'Ground radar identifies an unmarked grave near the gazebo.',
  'Ground radar identifies an unmarked grave near the gazebo.',
  'Marianne’s bone buttons and hair combs buried in the soil.',
  'Carved hair comb',
  'Victim Hair Comb',
  '["Belt buckle","Shoe heel","Mirror frame"]'::jsonb,
  'Carved hair comb',
  '["carved hair comb","hair comb","comb","carved comb","vintage comb"]'::jsonb,
  'Personal hair accessory belonging to the vanished governess.',
  'ev_8',
  false,
  '{"descriptions":["Ground radar identifies an unmarked grave near the gazebo.","At Present Day - 2:00 PM: Ground radar identifies an unmarked grave near the gazebo.","Notice this clue: Ground radar identifies an unmarked grave near the gazebo."],"hints":["Personal hair accessory belonging to the vanished governess.","Clue hint: Think about carved hair comb.","Search for: marianne’s bone buttons and hair combs buried in the soil."],"clues":["Carved hair comb","Item: Carved hair comb","Clue Word: Carved hair comb"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1badb491-c008-5c53-af77-4c6fcde11494',
  'story_076',
  'ev_8',
  8,
  'Present Day - 3:00 PM',
  'Detectives present the key, the ledger, and the toxin to Beatrice.',
  'Detectives present the key, the ledger, and the toxin to Beatrice.',
  'Beatrice’s silent surrender as she hands over Marianne’s letters.',
  'Surrendered letters',
  'Stolen Love Letters',
  '["Will document","Passport","Deed"]'::jsonb,
  'Surrendered letters',
  '["surrendered letters","letters","stolen letters","love letters"]'::jsonb,
  'Original love letters between Edward and Marianne kept by Beatrice.',
  NULL,
  true,
  '{"descriptions":["Detectives present the key, the ledger, and the toxin to Beatrice.","At Present Day - 3:00 PM: Detectives present the key, the ledger, and the toxin to Beatrice.","Notice this clue: Detectives present the key, the ledger, and the toxin to Beatrice."],"hints":["Original love letters between Edward and Marianne kept by Beatrice.","Clue hint: Think about surrendered letters.","Search for: beatrice’s silent surrender as she hands over marianne’s letters."],"clues":["Surrendered letters","Item: Surrendered letters","Clue Word: Surrendered letters"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_077 — THE MIDNIGHT WALTZ
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_077',
  'The Midnight Waltz',
  'Romance / Drama',
  'The Grand Ballroom of the Bellevue Hotel, crystal chandeliers, red carpet, and snow-covered terrace',
  'During the midnight mask waltz, the celebrated ballerina stepped through the balcony doors with her dance partner and was never seen again.',
  '[{"name":"Viktor Sterling","role":"Lead Ballerino","alibi":"Claims he was looking for her in the ballroom coat check","avatar":"🎭"},{"name":"Elena Rostova","role":"Prima Ballerina","alibi":"Missing from the gala","avatar":"🩰"},{"name":"Marcus Vance","role":"Hotel Concierge","alibi":"Managing the front reception desk","avatar":"🛎️"},{"name":"Detective Clara Shaw","role":"Lead Detective","alibi":"Called to the scene immediately after midnight","avatar":"🕵️‍♀️"}]'::jsonb,
  'Viktor Sterling slipped sleeping drops into ballerina Elena’s champagne flute during the toast. As they danced the midnight waltz onto the secluded snowy terrace, Elena lost consciousness, and Viktor carried her into a rented freight van to keep her from moving to New York.',
  'Dance Partner Viktor Sterling',
  'Viktor refused to let her leave for the New York ballet academy without him.',
  '[{"time":"11:45 PM","event":"Elena and Viktor toast the New Year with champagne flutes."},{"time":"11:55 PM","event":"The midnight waltz begins on the main dance floor."},{"time":"12:05 AM","event":"Viktor guides an unsteady Elena onto the snowy terrace."},{"time":"12:15 AM","event":"Viktor carries Elena down the fire stairs to the delivery van."},{"time":"12:30 AM","event":"Concierge notices Elena’s abandoned silk dance slipper in the snow."}]'::jsonb,
  '[{"id":"ev_1","title":"Silk Dance Shoe","detail":"Elena’s satin waltz shoe dropped in the fresh snow on the balcony."},{"id":"ev_2","title":"Drugged Flute","detail":"Champagne glass tested positive for high concentrations of sleeping sedative."},{"id":"ev_3","title":"Silver Cufflink","detail":"Monogrammed cufflink belonging to Viktor Sterling found in the service exit."},{"id":"ev_4","title":"Dropper Bottle","detail":"Glass bottle of chloral hydrate matching the poison in the champagne."}]'::jsonb,
  '[{"order":1,"title":"Satin ballet slipper","text":"Proves Elena was taken out through the cold terrace."},{"order":2,"title":"Spiked champagne","text":"Confirms Elena was drugged before being moved."},{"order":3,"title":"Heavy boot prints","text":"Shows dead-weight transport toward the rear fire exit."},{"order":4,"title":"Engraved cufflink","text":"Direct physical evidence placing Viktor on the escape stairs."},{"order":5,"title":"Taped door latch","text":"Demonstrates premeditated sabotage of hotel security."},{"order":6,"title":"Sedative vial","text":"The chemical weapon used to incapacitate Elena."}]'::jsonb,
  'Blowing snowstorm: The blizzard obscured visibility but did not erase deep footprints.; Drunken hotel guest on terrace: The rowdy guest stumbled on the east terrace, far from the exit.',
  'Claim Elena climbed down the balcony trellis to meet a wealthy foreign prince.',
  'NORMAL',
  'Did the dancer elope into the winter storm, or was she abducted by a spurned admirer?',
  '[{"character":"Viktor Sterling","secret":"A bottle of sedative drops in his tuxedo breast pocket."},{"character":"Elena Rostova","secret":"She had already booked a flight to New York departing at dawn."},{"character":"Marcus Vance","secret":"He noticed the service cellar alarm had been silenced with tape."},{"character":"Detective Clara Shaw","secret":"She tracked Viktor’s rental car reservation from the local airport."}]'::jsonb,
  '[{"lead":"Blowing snowstorm","explanation":"The blizzard obscured visibility but did not erase deep footprints."},{"lead":"Drunken hotel guest on terrace","explanation":"The rowdy guest stumbled on the east terrace, far from the exit."}]'::jsonb,
  '{"wrongTheories":["Elena eloped willingly with a secret lover waiting in a sports car.","Elena slipped from the balcony into the icy river below."],"correctTheory":"Viktor Sterling drugged Elena’s drink and kidnapped her in a cargo van to prevent her from moving to New York."}'::jsonb,
  'Viktor Sterling drugged Elena with chloral hydrate and carried her out the freight door because he could not accept her leaving for New York.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Elena was safely rescued by highway police, and Viktor was arrested for kidnapping and drugging."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Viktor fled across state lines, hiding Elena in an isolated mountain cabin."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The media reported Elena’s disappearance as an eccentric elopement, leaving the kidnapper free."}]'::jsonb,
  '{"intros":["During the midnight mask waltz, the celebrated ballerina stepped through the balcony doors with her dance partner and was never seen again.","Case file story_077: During the midnight mask waltz, the celebrated ballerina stepped through the balcony doors with her dance partner and was never seen again. Look closely at every clue.","Trouble begins in The Grand Ballroom of the Bellevue Hotel, crystal chandeliers, red carpet, and snow-covered terrace. During the midnight mask waltz, the celebrated ballerina stepped through the balcony doors with her dance partner and was never seen again.","The mystery starts now. During the midnight mask waltz, the celebrated ballerina stepped through the balcony doors with her dance partner and was never seen again. Can you solve it?"],"reveals":["Viktor Sterling drugged Elena with chloral hydrate and carried her out the freight door because he could not accept her leaving for New York.","The mystery is unraveled! Viktor Sterling drugged Elena with chloral hydrate and carried her out the freight door because he could not accept her leaving for New York.","At last, the truth comes out: Viktor Sterling drugged Elena with chloral hydrate and carried her out the freight door because he could not accept her leaving for New York.","Case resolved! Here is what happened: Viktor Sterling drugged Elena with chloral hydrate and carried her out the freight door because he could not accept her leaving for New York."],"hints":["Pay attention to where Dance Partner Viktor Sterling was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_077';
DELETE FROM public.case_events WHERE case_id = 'story_077';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '13833ba8-a9ff-5c54-b695-c1fe0e2e19f7',
  'story_077',
  'Viktor Sterling',
  'Lead Ballerino',
  'Handsome, possessive, wearing an elaborate silver phantom mask',
  'Elena spun out of my arms onto the terrace and vanished into the blowing snow.',
  'A bottle of sedative drops in his tuxedo breast pocket.',
  'Claims he was looking for her in the ballroom coat check',
  'Dancing partner and obsessive former boyfriend of Elena',
  'The service elevator bypasses hotel lobby security cameras.',
  'Did not notice he dropped his silver cufflink in the snow near the van.',
  '🎭',
  '["Elena spun out of my arms onto the terrace and vanished into the blowing snow.","\"Elena spun out of my arms onto the terrace and vanished into the blowing snow.\"","Listen to me: Elena spun out of my arms onto the terrace and vanished into the blowing snow.","I tell you the truth: Elena spun out of my arms onto the terrace and vanished into the blowing snow."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6d100df2-71f8-521a-b977-94bbd49c3626',
  'story_077',
  'Elena Rostova',
  'Prima Ballerina',
  'Graceful, independent, signed to star at the Metropolitan Opera',
  'Victim; signed contract found in her dressing bag.',
  'She had already booked a flight to New York departing at dawn.',
  'Missing from the gala',
  'Star dancer at Bellevue Ballet',
  'Viktor had threatened to ruin her career if she ever left him.',
  'Did not know Viktor spiked her champagne during the midnight countdown.',
  '🩰',
  '["Victim; signed contract found in her dressing bag.","\"Victim; signed contract found in her dressing bag.\"","Listen to me: Victim; signed contract found in her dressing bag.","I tell you the truth: Victim; signed contract found in her dressing bag."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c92d3b99-149e-52df-a56a-ff1329eb4e63',
  'story_077',
  'Marcus Vance',
  'Hotel Concierge',
  'Impeccable suit, discreet, holding hotel master keys',
  'No guest left through the main revolving doors between midnight and 1:00 AM.',
  'He noticed the service cellar alarm had been silenced with tape.',
  'Managing the front reception desk',
  'Supervisor of hotel security and staff',
  'The rear loading bay gate was left unlocked.',
  'Did not know who opened the basement freight door.',
  '🛎️',
  '["No guest left through the main revolving doors between midnight and 1:00 AM.","\"No guest left through the main revolving doors between midnight and 1:00 AM.\"","Listen to me: No guest left through the main revolving doors between midnight and 1:00 AM.","I tell you the truth: No guest left through the main revolving doors between midnight and 1:00 AM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4ec7e5f8-8282-5c81-af76-f808ebcc29f1',
  'story_077',
  'Detective Clara Shaw',
  'Lead Detective',
  'Observant, trench coat, carrying camera and footprint molds',
  'Snow preserves tire treads and heavy dragging footprints with extreme clarity.',
  'She tracked Viktor’s rental car reservation from the local airport.',
  'Called to the scene immediately after midnight',
  'Investigating Elena’s disappearance',
  'The footprints show one person walking heavily carrying dead weight.',
  'Did not know where the van drove until checking highway toll transponders.',
  '🕵️‍♀️',
  '["Snow preserves tire treads and heavy dragging footprints with extreme clarity.","\"Snow preserves tire treads and heavy dragging footprints with extreme clarity.\"","Listen to me: Snow preserves tire treads and heavy dragging footprints with extreme clarity.","I tell you the truth: Snow preserves tire treads and heavy dragging footprints with extreme clarity."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dd76c6d9-f385-53cd-bbd4-cbd9c0b45111',
  'story_077',
  'ev_1',
  1,
  '12:05 AM',
  'Elena leaves a single silk dance slipper behind in the snow.',
  'Elena leaves a single silk dance slipper behind in the snow.',
  'A pink satin ballet slipper dusted with fresh snow on the balcony.',
  'Satin ballet slipper',
  'Silk Dance Shoe',
  '["Gloves","Scarf","Earring"]'::jsonb,
  'Satin ballet slipper',
  '["satin ballet slipper","slipper","ballet slipper","dance slipper","shoe"]'::jsonb,
  'A delicate pink dance shoe left on the cold snowy terrace.',
  'ev_2',
  true,
  '{"descriptions":["Elena leaves a single silk dance slipper behind in the snow.","At 12:05 AM: Elena leaves a single silk dance slipper behind in the snow.","Notice this clue: Elena leaves a single silk dance slipper behind in the snow."],"hints":["A delicate pink dance shoe left on the cold snowy terrace.","Clue hint: Think about satin ballet slipper.","Search for: a pink satin ballet slipper dusted with fresh snow on the balcony."],"clues":["Satin ballet slipper","Item: Satin ballet slipper","Clue Word: Satin ballet slipper"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1dc804de-b7f5-5e37-a4d3-60ee3d7df5c1',
  'story_077',
  'ev_2',
  2,
  '12:10 AM',
  'Detectives examine the champagne glasses on table seven.',
  'Detectives examine the champagne glasses on table seven.',
  'Chemical residue of chloral hydrate in Elena’s flute.',
  'Spiked champagne',
  'Drugged Flute',
  '["Red wine","Fruit punch","Sparkling water"]'::jsonb,
  'Spiked champagne',
  '["spiked champagne","champagne","flute","drugged glass"]'::jsonb,
  'A champagne glass containing dissolved sleeping drops.',
  'ev_3',
  false,
  '{"descriptions":["Detectives examine the champagne glasses on table seven.","At 12:10 AM: Detectives examine the champagne glasses on table seven.","Notice this clue: Detectives examine the champagne glasses on table seven."],"hints":["A champagne glass containing dissolved sleeping drops.","Clue hint: Think about spiked champagne.","Search for: chemical residue of chloral hydrate in elena’s flute."],"clues":["Spiked champagne","Item: Spiked champagne","Clue Word: Spiked champagne"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6b3b4f15-7ef7-5cc9-b92c-e7c2685ce18c',
  'story_077',
  'ev_3',
  3,
  '12:15 AM',
  'Detective Shaw inspects the terrace snow path.',
  'Detective Shaw inspects the terrace snow path.',
  'Heavy boot prints showing someone carrying a limp body.',
  'Heavy boot prints',
  'Snow Tread Cast',
  '["Stiletto prints","Dog tracks","Bare footprints"]'::jsonb,
  'Heavy boot prints',
  '["heavy boot prints","boot prints","footprints","snow prints","tread marks"]'::jsonb,
  'Deep shoe impressions indicating heavy weight carried in arms.',
  'ev_4',
  false,
  '{"descriptions":["Detective Shaw inspects the terrace snow path.","At 12:15 AM: Detective Shaw inspects the terrace snow path.","Notice this clue: Detective Shaw inspects the terrace snow path."],"hints":["Deep shoe impressions indicating heavy weight carried in arms.","Clue hint: Think about heavy boot prints.","Search for: heavy boot prints showing someone carrying a limp body."],"clues":["Heavy boot prints","Item: Heavy boot prints","Clue Word: Heavy boot prints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'adf6f839-610b-58db-a1c9-ce0f71d0a331',
  'story_077',
  'ev_4',
  4,
  '12:20 AM',
  'Investigator finds a dropped piece of jewelry by the service stair.',
  'Investigator finds a dropped piece of jewelry by the service stair.',
  'An engraved silver cufflink bearing Viktor’s initials "V.S."',
  'Engraved cufflink',
  'Silver Cufflink',
  '["Watch strap","Lapel pin","Tie bar"]'::jsonb,
  'Engraved cufflink',
  '["engraved cufflink","cufflink","silver cufflink","vs cufflink"]'::jsonb,
  'Men’s formal jewelry dropped near the basement stairs.',
  'ev_5',
  false,
  '{"descriptions":["Investigator finds a dropped piece of jewelry by the service stair.","At 12:20 AM: Investigator finds a dropped piece of jewelry by the service stair.","Notice this clue: Investigator finds a dropped piece of jewelry by the service stair."],"hints":["Men’s formal jewelry dropped near the basement stairs.","Clue hint: Think about engraved cufflink.","Search for: an engraved silver cufflink bearing viktor’s initials \"v.s.\""],"clues":["Engraved cufflink","Item: Engraved cufflink","Clue Word: Engraved cufflink"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '249722f7-258f-54f7-b357-d0a549425208',
  'story_077',
  'ev_5',
  5,
  '12:25 AM',
  'The concierge checks the freight delivery dock.',
  'The concierge checks the freight delivery dock.',
  'A strip of electrical tape holding the door latch open.',
  'Taped door latch',
  'Tampered Exit Latch',
  '["Padlock","Chain","Deadbolt"]'::jsonb,
  'Taped door latch',
  '["taped door latch","taped latch","tape","taped door","latched tape"]'::jsonb,
  'Sticky tape used to stop the security exit door from locking.',
  'ev_6',
  true,
  '{"descriptions":["The concierge checks the freight delivery dock.","At 12:25 AM: The concierge checks the freight delivery dock.","Notice this clue: The concierge checks the freight delivery dock."],"hints":["Sticky tape used to stop the security exit door from locking.","Clue hint: Think about taped door latch.","Search for: a strip of electrical tape holding the door latch open."],"clues":["Taped door latch","Item: Taped door latch","Clue Word: Taped door latch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8def4aae-49a3-50e1-bbf3-c6ed07c1f65a',
  'story_077',
  'ev_6',
  6,
  '12:35 AM',
  'Security cameras review the delivery alleyway.',
  'Security cameras review the delivery alleyway.',
  'A white rental cargo van speeding away without headlights.',
  'Cargo van video',
  'Surveillance Footage',
  '["Limousine","Taxi","Motorcycle"]'::jsonb,
  'Cargo van video',
  '["cargo van video","cargo van","van","rental van","van video"]'::jsonb,
  'A boxy freight vehicle seen leaving the back loading bay.',
  'ev_7',
  false,
  '{"descriptions":["Security cameras review the delivery alleyway.","At 12:35 AM: Security cameras review the delivery alleyway.","Notice this clue: Security cameras review the delivery alleyway."],"hints":["A boxy freight vehicle seen leaving the back loading bay.","Clue hint: Think about cargo van video.","Search for: a white rental cargo van speeding away without headlights."],"clues":["Cargo van video","Item: Cargo van video","Clue Word: Cargo van video"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c9ad7492-2454-5c88-85ff-d17ce399ba39',
  'story_077',
  'ev_7',
  7,
  '1:00 AM',
  'Highway police spot the rental van at a toll booth.',
  'Highway police spot the rental van at a toll booth.',
  'Viktor in the driver seat with an unconscious Elena wrapped in a coat.',
  'Highway toll interception',
  'Police Intercept',
  '["Airport ticket","Bus pass","Ferry slip"]'::jsonb,
  'Highway toll interception',
  '["highway toll interception","toll interception","intercept","highway arrest","police stop"]'::jsonb,
  'Vehicle stopped by state troopers on the northern highway.',
  'ev_8',
  false,
  '{"descriptions":["Highway police spot the rental van at a toll booth.","At 1:00 AM: Highway police spot the rental van at a toll booth.","Notice this clue: Highway police spot the rental van at a toll booth."],"hints":["Vehicle stopped by state troopers on the northern highway.","Clue hint: Think about highway toll interception.","Search for: viktor in the driver seat with an unconscious elena wrapped in a coat."],"clues":["Highway toll interception","Item: Highway toll interception","Clue Word: Highway toll interception"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5ea41b61-1178-5255-8710-f29e08248eb8',
  'story_077',
  'ev_8',
  8,
  '1:30 AM',
  'Search of Viktor’s coat reveals the sedative dropper bottle.',
  'Search of Viktor’s coat reveals the sedative dropper bottle.',
  'A half-empty vial of chloral hydrate with Viktor’s fingerprints.',
  'Sedative vial',
  'Dropper Bottle',
  '["Perfume atomizer","Eye drops","Flask"]'::jsonb,
  'Sedative vial',
  '["sedative vial","vial","dropper bottle","sedative bottle"]'::jsonb,
  'Liquid medicine container used to drug the dancer’s drink.',
  NULL,
  true,
  '{"descriptions":["Search of Viktor’s coat reveals the sedative dropper bottle.","At 1:30 AM: Search of Viktor’s coat reveals the sedative dropper bottle.","Notice this clue: Search of Viktor’s coat reveals the sedative dropper bottle."],"hints":["Liquid medicine container used to drug the dancer’s drink.","Clue hint: Think about sedative vial.","Search for: a half-empty vial of chloral hydrate with viktor’s fingerprints."],"clues":["Sedative vial","Item: Sedative vial","Clue Word: Sedative vial"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_078 — THE STOLEN ENGAGEMENT RING
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_078',
  'The Stolen Engagement Ring',
  'Romance / Drama',
  'Le Petit Chateau rooftop restaurant, candlelit tables, white linen, and panoramic city lights',
  'At the climax of an elaborate proposal dinner, the three-carat diamond ring placed inside a champagne glass vanished while the room was dark.',
  '[{"name":"David Vance","role":"Wealthy Groom-to-be","alibi":"Down on one knee holding Clara’s hands in the dark","avatar":"💎"},{"name":"Clara Sutton","role":"Surprised Bride-to-be","alibi":"Seated at the proposal table facing David","avatar":"💍"},{"name":"Henri Mercier","role":"Head Waiter","alibi":"Standing by the rooftop dimmer switch at the restaurant entrance","avatar":"🍷"},{"name":"Detective Ray Cooper","role":"Jewelry Theft Detective","alibi":"Sitting at the restaurant bar ten yards away","avatar":"🔎"}]'::jsonb,
  'Head Waiter Henri Mercier switched the lights off for what was supposed to be a romantic sparkler presentation. During the twenty seconds of darkness, Henri used a magnetic tongs tool to pluck the three-carat platinum diamond ring from the champagne flute, replacing it with a cheap glass replica.',
  'Head Waiter Henri Mercier',
  'Henri had accumulated crushing debts to loan sharks and swapped the diamond for cubic zirconia.',
  '[{"time":"8:30 PM","event":"David secretly hands the diamond ring box to Henri for the surprise dessert."},{"time":"9:00 PM","event":"Henri takes the ring to the service pantry and prepares a replica."},{"time":"9:15 PM","event":"The restaurant lights are cut off for the sparkler announcement."},{"time":"9:16 PM","event":"Henri swaps the real ring for the fake glass ring in the flute."},{"time":"9:17 PM","event":"Lights come up; Clara inspects the glass and spots the fake."}]'::jsonb,
  '[{"id":"ev_1","title":"Counterfeit Ring","detail":"Cheap glass replica left inside the champagne flute after the lights turned on."},{"id":"ev_2","title":"Silicone Tongs","detail":"Quiet pickup tool used to lift the genuine ring out of the crystal glass."},{"id":"ev_3","title":"Pawn Estimate","detail":"Paper slip in Henri’s locker showing a $25,000 cash advance offer for a Harry Winston ring."},{"id":"ev_4","title":"Recovered Diamond","detail":"Genuine platinum engagement ring retrieved from Henri’s sewn apron hem."}]'::jsonb,
  '[{"order":1,"title":"Replica ring box","text":"Shows premeditation and advance preparation to swap the jewelry."},{"order":2,"title":"Switch wedge","text":"Proves the room blackout was deliberately timed and controlled."},{"order":3,"title":"Magnetic tongs","text":"The silent tool used to execute the theft without noise."},{"order":4,"title":"Glass fake ring","text":"Confirms the diamond was swapped rather than accidentally lost."},{"order":5,"title":"Pawn shop quote","text":"Financial motive proving Henri planned to fence the ring immediately."},{"order":6,"title":"Sewn apron hem","text":"Direct physical recovery of the stolen gem from Henri’s body."}]'::jsonb,
  'David’s insurance policy: David doubled insurance coverage, but only as standard luxury coverage.; Dining ex-boyfriend: The ex was having dinner with his boss and never left his seat.',
  'Blame the ex-boyfriend who was dining two tables away or the bride’s jealous best friend.',
  'NORMAL',
  'Who stole the diamond ring during the twenty seconds of proposal darkness?',
  '[{"character":"David Vance","secret":"He had insured the ring for twice its purchase value last week."},{"character":"Clara Sutton","secret":"She was undecided about accepting David’s proposal."},{"character":"Henri Mercier","secret":"A real three-carat Harry Winston diamond sewn into the hem of his apron."},{"character":"Detective Ray Cooper","secret":"He was eating dinner off-duty at the bar when the commotion started."}]'::jsonb,
  '[{"lead":"David’s insurance policy","explanation":"David doubled insurance coverage, but only as standard luxury coverage."},{"lead":"Dining ex-boyfriend","explanation":"The ex was having dinner with his boss and never left his seat."}]'::jsonb,
  '{"wrongTheories":["David staged the theft himself to collect insurance money after cold feet.","The ex-boyfriend stole the ring in the dark to stop the engagement."],"correctTheory":"Head Waiter Henri Mercier used the sparkler blackout to swap the real diamond with a glass fake to pay off debts."}'::jsonb,
  'Henri Mercier staged the dessert blackout and used magnetic tongs to steal the ring, sewing it into his apron.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Henri was arrested on grand larceny charges, and David successfully proposed with the real ring."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The theft was blamed on a busboy while Henri slipped away to the pawn shop with the diamond."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The couple broke up in mutual suspicion, convinced each other staged the heist for money."}]'::jsonb,
  '{"intros":["At the climax of an elaborate proposal dinner, the three-carat diamond ring placed inside a champagne glass vanished while the room was dark.","Case file story_078: At the climax of an elaborate proposal dinner, the three-carat diamond ring placed inside a champagne glass vanished while the room was dark. Look closely at every clue.","Trouble begins in Le Petit Chateau rooftop restaurant, candlelit tables, white linen, and panoramic city lights. At the climax of an elaborate proposal dinner, the three-carat diamond ring placed inside a champagne glass vanished while the room was dark.","The mystery starts now. At the climax of an elaborate proposal dinner, the three-carat diamond ring placed inside a champagne glass vanished while the room was dark. Can you solve it?"],"reveals":["Henri Mercier staged the dessert blackout and used magnetic tongs to steal the ring, sewing it into his apron.","The mystery is unraveled! Henri Mercier staged the dessert blackout and used magnetic tongs to steal the ring, sewing it into his apron.","At last, the truth comes out: Henri Mercier staged the dessert blackout and used magnetic tongs to steal the ring, sewing it into his apron.","Case resolved! Here is what happened: Henri Mercier staged the dessert blackout and used magnetic tongs to steal the ring, sewing it into his apron."],"hints":["Pay attention to where Head Waiter Henri Mercier was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_078';
DELETE FROM public.case_events WHERE case_id = 'story_078';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '806a5a6c-1141-5c76-bbe8-34c25f3fb6be',
  'story_078',
  'David Vance',
  'Wealthy Groom-to-be',
  'Generous, anxious, dressed in custom Armani suit',
  'I paid fifty thousand dollars for that custom Harry Winston diamond ring!',
  'He had insured the ring for twice its purchase value last week.',
  'Down on one knee holding Clara’s hands in the dark',
  'Proposing to girlfriend Clara',
  'The ring was resting at the bottom of the dry crystal glass at 9:15 PM.',
  'Did not see the waiter reaching over the table during the sparkler entrance.',
  '💎',
  '["I paid fifty thousand dollars for that custom Harry Winston diamond ring!","\"I paid fifty thousand dollars for that custom Harry Winston diamond ring!\"","Listen to me: I paid fifty thousand dollars for that custom Harry Winston diamond ring!","I tell you the truth: I paid fifty thousand dollars for that custom Harry Winston diamond ring!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '070666ad-066d-5460-b866-c8605728e9fa',
  'story_078',
  'Clara Sutton',
  'Surprised Bride-to-be',
  'Charming, stunned, wearing diamond earrings and red velvet dress',
  'The sparklers lit up, but when I looked into the glass, the stone was dull plastic!',
  'She was undecided about accepting David’s proposal.',
  'Seated at the proposal table facing David',
  'Recipient of the surprise proposal',
  'Someone brushed past her shoulder while the room was pitch black.',
  'Did not know the ring in the glass was a cheap glass substitution.',
  '💍',
  '["The sparklers lit up, but when I looked into the glass, the stone was dull plastic!","\"The sparklers lit up, but when I looked into the glass, the stone was dull plastic!\"","Listen to me: The sparklers lit up, but when I looked into the glass, the stone was dull plastic!","I tell you the truth: The sparklers lit up, but when I looked into the glass, the stone was dull plastic!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '86267812-502d-57cd-90e1-06ea7a0be2f0',
  'story_078',
  'Henri Mercier',
  'Head Waiter',
  'Polite, slick posture, crisp bow tie, nervously tapping his apron pocket',
  'I was simply coordinating the kitchen sparklers and dimming the lights for romance.',
  'A real three-carat Harry Winston diamond sewn into the hem of his apron.',
  'Standing by the rooftop dimmer switch at the restaurant entrance',
  'Assigned specifically to table one for the VIP proposal',
  'The exact timing of the electrical dimmer circuit.',
  'Did not notice the restaurant security mirror caught his reflection reaching into the flute.',
  '🍷',
  '["I was simply coordinating the kitchen sparklers and dimming the lights for romance.","\"I was simply coordinating the kitchen sparklers and dimming the lights for romance.\"","Listen to me: I was simply coordinating the kitchen sparklers and dimming the lights for romance.","I tell you the truth: I was simply coordinating the kitchen sparklers and dimming the lights for romance."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1d179ae5-710b-561c-8136-98ec36c61b85',
  'story_078',
  'Detective Ray Cooper',
  'Jewelry Theft Detective',
  'Gruff, analytical, carries a jeweler’s magnifying loupe',
  'Professional ring swaps require identical ring mountings prepared days in advance.',
  'He was eating dinner off-duty at the bar when the commotion started.',
  'Sitting at the restaurant bar ten yards away',
  'Customer and investigating officer',
  'The stone left in the glass is cheap leaded glass, not natural diamond.',
  'Did not know where the real stone was hidden until checking Henri’s uniform.',
  '🔎',
  '["Professional ring swaps require identical ring mountings prepared days in advance.","\"Professional ring swaps require identical ring mountings prepared days in advance.\"","Listen to me: Professional ring swaps require identical ring mountings prepared days in advance.","I tell you the truth: Professional ring swaps require identical ring mountings prepared days in advance."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ede51e07-2fa8-5906-b883-e523d1634f33',
  'story_078',
  'ev_1',
  1,
  '9:00 PM',
  'Henri handles the real ring in the kitchen pantry.',
  'Henri handles the real ring in the kitchen pantry.',
  'An empty jeweler’s box for a fake replica ring in the pantry bin.',
  'Replica ring box',
  'Imitation Box',
  '["Wine cork","Napkin","Order slip"]'::jsonb,
  'Replica ring box',
  '["replica ring box","replica box","ring box","fake box","imitation box"]'::jsonb,
  'Cardboard box for a cheap fake cubic zirconia stone.',
  'ev_2',
  true,
  '{"descriptions":["Henri handles the real ring in the kitchen pantry.","At 9:00 PM: Henri handles the real ring in the kitchen pantry.","Notice this clue: Henri handles the real ring in the kitchen pantry."],"hints":["Cardboard box for a cheap fake cubic zirconia stone.","Clue hint: Think about replica ring box.","Search for: an empty jeweler’s box for a fake replica ring in the pantry bin."],"clues":["Replica ring box","Item: Replica ring box","Clue Word: Replica ring box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3af7fd2c-f7f0-56c3-afac-28ed72032726',
  'story_078',
  'ev_2',
  2,
  '9:15 PM',
  'The rooftop lights are switched off deliberately.',
  'The rooftop lights are switched off deliberately.',
  'A wooden wedge jammed in the main dining room light switch.',
  'Switch wedge',
  'Jammed Light Switch',
  '["Blown fuse","Cut wire","Burnt bulb"]'::jsonb,
  'Switch wedge',
  '["switch wedge","wedge","wood wedge","light wedge"]'::jsonb,
  'Piece of wood keeping the light switch locked in the off position.',
  'ev_3',
  false,
  '{"descriptions":["The rooftop lights are switched off deliberately.","At 9:15 PM: The rooftop lights are switched off deliberately.","Notice this clue: The rooftop lights are switched off deliberately."],"hints":["Piece of wood keeping the light switch locked in the off position.","Clue hint: Think about switch wedge.","Search for: a wooden wedge jammed in the main dining room light switch."],"clues":["Switch wedge","Item: Switch wedge","Clue Word: Switch wedge"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c5dafd75-7477-5691-abd0-32035770101e',
  'story_078',
  'ev_3',
  3,
  '9:16 PM',
  'Henri reaches over table one with specialized tongs.',
  'Henri reaches over table one with specialized tongs.',
  'Silicone-tipped magnetic tongs dropped under table one.',
  'Magnetic tongs',
  'Silicone Tongs',
  '["Fork","Butter knife","Chopsticks"]'::jsonb,
  'Magnetic tongs',
  '["magnetic tongs","tongs","silicone tongs","pickup tool"]'::jsonb,
  'Padded tool used to grab jewelry without clinking against crystal.',
  'ev_4',
  false,
  '{"descriptions":["Henri reaches over table one with specialized tongs.","At 9:16 PM: Henri reaches over table one with specialized tongs.","Notice this clue: Henri reaches over table one with specialized tongs."],"hints":["Padded tool used to grab jewelry without clinking against crystal.","Clue hint: Think about magnetic tongs.","Search for: silicone-tipped magnetic tongs dropped under table one."],"clues":["Magnetic tongs","Item: Magnetic tongs","Clue Word: Magnetic tongs"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'daa35f22-1f3d-588d-9bbf-eb4ecc6967ef',
  'story_078',
  'ev_4',
  4,
  '9:17 PM',
  'Clara notices the stone looks dull and cloudy.',
  'Clara notices the stone looks dull and cloudy.',
  'The fake ring in the champagne glass scratches with a steel pin.',
  'Glass fake ring',
  'Counterfeit Ring',
  '["Plastic coin","Tin foil","Glass marble"]'::jsonb,
  'Glass fake ring',
  '["glass fake ring","fake ring","glass ring","counterfeit ring","replica"]'::jsonb,
  'A cheap glass imitation left behind in the champagne flute.',
  'ev_5',
  false,
  '{"descriptions":["Clara notices the stone looks dull and cloudy.","At 9:17 PM: Clara notices the stone looks dull and cloudy.","Notice this clue: Clara notices the stone looks dull and cloudy."],"hints":["A cheap glass imitation left behind in the champagne flute.","Clue hint: Think about glass fake ring.","Search for: the fake ring in the champagne glass scratches with a steel pin."],"clues":["Glass fake ring","Item: Glass fake ring","Clue Word: Glass fake ring"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '76f68169-6df1-58aa-96b7-43fa0605334a',
  'story_078',
  'ev_5',
  5,
  '9:25 PM',
  'Detective Cooper inspects the decorative wall mirror.',
  'Detective Cooper inspects the decorative wall mirror.',
  'A security camera reflection showing Henri leaning over the table in the dark.',
  'Mirror reflection angle',
  'Surveillance Angle',
  '["Flash photo","Shadow","Menu reflection"]'::jsonb,
  'Mirror reflection angle',
  '["mirror reflection angle","reflection","mirror reflection","camera angle","surveillance angle"]'::jsonb,
  'Security video angle capturing Henri’s apron reaching into the flute.',
  'ev_6',
  true,
  '{"descriptions":["Detective Cooper inspects the decorative wall mirror.","At 9:25 PM: Detective Cooper inspects the decorative wall mirror.","Notice this clue: Detective Cooper inspects the decorative wall mirror."],"hints":["Security video angle capturing Henri’s apron reaching into the flute.","Clue hint: Think about mirror reflection angle.","Search for: a security camera reflection showing henri leaning over the table in the dark."],"clues":["Mirror reflection angle","Item: Mirror reflection angle","Clue Word: Mirror reflection angle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f86ed36d-e93a-56f4-a846-305e5c1433ef',
  'story_078',
  'ev_6',
  6,
  '9:35 PM',
  'Cooper searches the waiter locker room.',
  'Cooper searches the waiter locker room.',
  'A pawn shop estimate paper for a three-carat diamond in Henri’s locker.',
  'Pawn shop quote',
  'Pawn Estimate',
  '["Bus schedule","Menu draft","Grocery bill"]'::jsonb,
  'Pawn shop quote',
  '["pawn shop quote","pawn quote","pawn estimate","pawn paper","quote"]'::jsonb,
  'Written valuation for a luxury diamond found in Henri’s locker.',
  'ev_7',
  false,
  '{"descriptions":["Cooper searches the waiter locker room.","At 9:35 PM: Cooper searches the waiter locker room.","Notice this clue: Cooper searches the waiter locker room."],"hints":["Written valuation for a luxury diamond found in Henri’s locker.","Clue hint: Think about pawn shop quote.","Search for: a pawn shop estimate paper for a three-carat diamond in henri’s locker."],"clues":["Pawn shop quote","Item: Pawn shop quote","Clue Word: Pawn shop quote"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4f11cc71-3fef-576c-9657-98627275cc08',
  'story_078',
  'ev_7',
  7,
  '9:45 PM',
  'Detective Cooper pats down Henri’s uniform apron.',
  'Detective Cooper pats down Henri’s uniform apron.',
  'A hard bulge sewn inside the bottom hem of the white waiter apron.',
  'Sewn apron hem',
  'Hidden Diamond Hem',
  '["Pocket watch","Corkscrew","Coin pouch"]'::jsonb,
  'Sewn apron hem',
  '["sewn apron hem","apron hem","sewn hem","apron","sewn diamond"]'::jsonb,
  'Stitched lining of the waiter’s uniform hiding the stolen jewel.',
  'ev_8',
  false,
  '{"descriptions":["Detective Cooper pats down Henri’s uniform apron.","At 9:45 PM: Detective Cooper pats down Henri’s uniform apron.","Notice this clue: Detective Cooper pats down Henri’s uniform apron."],"hints":["Stitched lining of the waiter’s uniform hiding the stolen jewel.","Clue hint: Think about sewn apron hem.","Search for: a hard bulge sewn inside the bottom hem of the white waiter apron."],"clues":["Sewn apron hem","Item: Sewn apron hem","Clue Word: Sewn apron hem"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e82fc523-a2ab-5f2f-bed7-f786ba219de1',
  'story_078',
  'ev_8',
  8,
  '9:50 PM',
  'Cooper cuts the thread and extracts the real Harry Winston ring.',
  'Cooper cuts the thread and extracts the real Harry Winston ring.',
  'The genuine three-carat diamond ring with laser serial number.',
  'Serial diamond ring',
  'Recovered Diamond',
  '["Cubic zirconia","Silver band","Pewter ring"]'::jsonb,
  'Serial diamond ring',
  '["serial diamond ring","diamond ring","real ring","recovered diamond","diamond"]'::jsonb,
  'The fifty-thousand-dollar original diamond found on the waiter.',
  NULL,
  true,
  '{"descriptions":["Cooper cuts the thread and extracts the real Harry Winston ring.","At 9:50 PM: Cooper cuts the thread and extracts the real Harry Winston ring.","Notice this clue: Cooper cuts the thread and extracts the real Harry Winston ring."],"hints":["The fifty-thousand-dollar original diamond found on the waiter.","Clue hint: Think about serial diamond ring.","Search for: the genuine three-carat diamond ring with laser serial number."],"clues":["Serial diamond ring","Item: Serial diamond ring","Clue Word: Serial diamond ring"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_079 — THE LAST TRAIN TO PARIS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_079',
  'The Last Train to Paris',
  'Romance / Drama',
  'Gare du Nord railway platform 4, steam fog, iron girders, tearful travelers, and midnight whistle',
  'As the final midnight express hissed onto the tracks, two torn first-class tickets and a shattered vintage perfume bottle were found beside an empty leather suitcase.',
  '[{"name":"Countess Vivienne Laurent","role":"Aristocratic Mother","alibi":"Waiting in her luxury limousine outside the station","avatar":"🦚"},{"name":"Pierre Laurent","role":"Devoted Heir","alibi":"Pacing on platform 4 since 11:30 PM","avatar":"🎩"},{"name":"Camille Monet","role":"Impressionist Painter","alibi":"Confined inside the railway luggage office","avatar":"🎨"},{"name":"Inspector Marcel Dupont","role":"Station Police Officer","alibi":"Patrolling the platform boarding gates","avatar":"👮"}]'::jsonb,
  'Countess Vivienne Laurent hired private guards to intercept painter Camille on platform 4, dragging her into the luggage annex. Vivienne tore the two tickets and smashed Camille’s perfume bottle on the concrete to make Pierre believe Camille had abandoned him and left the station.',
  'Countess Vivienne Laurent',
  'Vivienne wanted to prevent her son Pierre from marrying an impoverished portrait painter.',
  '[{"time":"11:15 PM","event":"Camille arrives at Gare du Nord with her suitcase and perfume."},{"time":"11:30 PM","event":"Two hired guards grab Camille behind the newsstand and tear her tickets."},{"time":"11:40 PM","event":"Pierre arrives on platform 4 and finds the torn tickets in the steam."},{"time":"11:55 PM","event":"The final Paris express train departs platform 4 without them."},{"time":"12:10 AM","event":"Inspector Dupont hears banging from baggage room 2."}]'::jsonb,
  '[{"id":"ev_1","title":"Torn Tickets","detail":"Two first-class tickets to Paris ripped apart during the struggle on platform 4."},{"id":"ev_2","title":"Broken Perfume Flacon","detail":"Shattered crystal bottle of Camille’s signature lilac fragrance."},{"id":"ev_3","title":"Guard Badge","detail":"Official company badge identifying Laurent Estate private security."},{"id":"ev_4","title":"Hired Muscle Contract","detail":"Contract signed by Countess Laurent ordering guards to detain Camille."}]'::jsonb,
  '[{"order":1,"title":"Torn Paris tickets","text":"Proves the couple planned to travel together until attacked."},{"order":2,"title":"Shattered perfume","text":"Sign of violence and struggle where Camille was seized."},{"order":3,"title":"Monogram suitcase","text":"Demonstrates Camille never intended to abandon her travel."},{"order":4,"title":"Platform drag marks","text":"Physical proof Camille was forcibly hauled into storage."},{"order":5,"title":"Laurent security badge","text":"Directly links Countess Vivienne’s estate to the kidnapping."},{"order":6,"title":"Abduction payoff contract","text":"Unshakable legal evidence of Countess Laurent’s conspiracy."}]'::jsonb,
  'Train departure whistle: The train left on time, convincing Pierre he was abandoned.; Foreign art dealer telegram: Sent by the Countess’s agent to manufacture a false motive.',
  'Claim Camille took the train to Berlin with a rival art dealer.',
  'NORMAL',
  'Did the lovers miss the train in a lover’s quarrel, or was one of them prevented from boarding?',
  '[{"character":"Countess Vivienne Laurent","secret":"A receipt for five thousand francs paid to private detective thugs."},{"character":"Pierre Laurent","secret":"He withdrew all his personal inheritance to start an art gallery in Paris."},{"character":"Camille Monet","secret":"She carried portrait sketches showing Vivienne’s hired thugs trailing them."},{"character":"Inspector Marcel Dupont","secret":"He witnessed the Countess’s black limousine idling in the loading zone."}]'::jsonb,
  '[{"lead":"Train departure whistle","explanation":"The train left on time, convincing Pierre he was abandoned."},{"lead":"Foreign art dealer telegram","explanation":"Sent by the Countess’s agent to manufacture a false motive."}]'::jsonb,
  '{"wrongTheories":["Camille changed her mind and took the night train to Berlin with an art dealer.","Pierre staged the disappearance to avoid scandal and disinheritance."],"correctTheory":"Countess Vivienne Laurent hired estate guards to kidnap Camille and tear the tickets to stop the elopement."}'::jsonb,
  'Countess Vivienne Laurent had Camille abducted and locked in baggage storage to stop her son from marrying her.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Pierre severed ties with his mother, rescued Camille, and the lovers boarded the morning train to Paris together."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Pierre believed his mother’s lies and returned to the estate, while Camille was deported penniless."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The Countess paid off the station master, claiming the girl was a thief, breaking the young couple apart forever."}]'::jsonb,
  '{"intros":["As the final midnight express hissed onto the tracks, two torn first-class tickets and a shattered vintage perfume bottle were found beside an empty leather suitcase.","Case file story_079: As the final midnight express hissed onto the tracks, two torn first-class tickets and a shattered vintage perfume bottle were found beside an empty leather suitcase. Look closely at every clue.","Trouble begins in Gare du Nord railway platform 4, steam fog, iron girders, tearful travelers, and midnight whistle. As the final midnight express hissed onto the tracks, two torn first-class tickets and a shattered vintage perfume bottle were found beside an empty leather suitcase.","The mystery starts now. As the final midnight express hissed onto the tracks, two torn first-class tickets and a shattered vintage perfume bottle were found beside an empty leather suitcase. Can you solve it?"],"reveals":["Countess Vivienne Laurent had Camille abducted and locked in baggage storage to stop her son from marrying her.","The mystery is unraveled! Countess Vivienne Laurent had Camille abducted and locked in baggage storage to stop her son from marrying her.","At last, the truth comes out: Countess Vivienne Laurent had Camille abducted and locked in baggage storage to stop her son from marrying her.","Case resolved! Here is what happened: Countess Vivienne Laurent had Camille abducted and locked in baggage storage to stop her son from marrying her."],"hints":["Pay attention to where Countess Vivienne Laurent was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_079';
DELETE FROM public.case_events WHERE case_id = 'story_079';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6ad90816-8945-5314-8520-c1b8e56f162b',
  'story_079',
  'Countess Vivienne Laurent',
  'Aristocratic Mother',
  'Domineering, fur collar, icy aristocratic stare, holding ivory umbrella',
  'Camille was an opportunist after our family fortune. She took my cash payoff and left.',
  'A receipt for five thousand francs paid to private detective thugs.',
  'Waiting in her luxury limousine outside the station',
  'Mother of Pierre Laurent',
  'Camille was locked in the station baggage parcel room.',
  'Did not know Pierre found Camille’s sketchbook hidden in the luggage annex.',
  '🦚',
  '["Camille was an opportunist after our family fortune. She took my cash payoff and left.","\"Camille was an opportunist after our family fortune. She took my cash payoff and left.\"","Listen to me: Camille was an opportunist after our family fortune. She took my cash payoff and left.","I tell you the truth: Camille was an opportunist after our family fortune. She took my cash payoff and left."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd4dfb455-1803-5ac2-bf60-de1763bf3523',
  'story_079',
  'Pierre Laurent',
  'Devoted Heir',
  'Passionate, distressed, holding an overnight bag and looking at the clock',
  'Camille swore she would meet me here. She would never tear our tickets willingly!',
  'He withdrew all his personal inheritance to start an art gallery in Paris.',
  'Pacing on platform 4 since 11:30 PM',
  'Fiance of Camille',
  'Camille never traveled without her favorite lilac perfume.',
  'Did not see his mother’s bodyguards grab Camille from behind the newspaper kiosk.',
  '🎩',
  '["Camille swore she would meet me here. She would never tear our tickets willingly!","\"Camille swore she would meet me here. She would never tear our tickets willingly!\"","Listen to me: Camille swore she would meet me here. She would never tear our tickets willingly!","I tell you the truth: Camille swore she would meet me here. She would never tear our tickets willingly!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'efc744d1-284c-5301-9cfe-fbe8afa74dde',
  'story_079',
  'Camille Monet',
  'Impressionist Painter',
  'Spirited, artistic, bruised wrists, locked in baggage room 2',
  'Two men grabbed me, ripped our tickets, and locked me in this storage cell!',
  'She carried portrait sketches showing Vivienne’s hired thugs trailing them.',
  'Confined inside the railway luggage office',
  'Fiancee of Pierre',
  'The thugs showed a business card from Countess Laurent’s private firm.',
  'Did not know whether Pierre had already boarded the train alone.',
  '🎨',
  '["Two men grabbed me, ripped our tickets, and locked me in this storage cell!","\"Two men grabbed me, ripped our tickets, and locked me in this storage cell!\"","Listen to me: Two men grabbed me, ripped our tickets, and locked me in this storage cell!","I tell you the truth: Two men grabbed me, ripped our tickets, and locked me in this storage cell!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1a75e0e8-bf6d-5c33-90c8-009881b4f179',
  'story_079',
  'Inspector Marcel Dupont',
  'Station Police Officer',
  'Fair, methodical, blue uniform, brass buttons, holding station keys',
  'Railway tickets are not torn in anger like this; they show forced scuffle creasing.',
  'He witnessed the Countess’s black limousine idling in the loading zone.',
  'Patrolling the platform boarding gates',
  'Officer on duty at platform 4',
  'The parcel room key was checked out by an unauthorized guard.',
  'Did not know who ordered the private guards until viewing the payment draft.',
  '👮',
  '["Railway tickets are not torn in anger like this; they show forced scuffle creasing.","\"Railway tickets are not torn in anger like this; they show forced scuffle creasing.\"","Listen to me: Railway tickets are not torn in anger like this; they show forced scuffle creasing.","I tell you the truth: Railway tickets are not torn in anger like this; they show forced scuffle creasing."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a7293005-2cf8-5428-b4ac-094e5e84feb7',
  'story_079',
  'ev_1',
  1,
  '11:40 PM',
  'Pierre discovers torn paper on platform 4.',
  'Pierre discovers torn paper on platform 4.',
  'Two first-class Paris train tickets torn down the center.',
  'Torn Paris tickets',
  'Torn Tickets',
  '["Train timetable","Newspaper","Luggage tag"]'::jsonb,
  'Torn Paris tickets',
  '["torn paris tickets","torn tickets","tickets","train tickets","paris tickets"]'::jsonb,
  'First-class railway boarding passes ripped in half on the platform.',
  'ev_2',
  true,
  '{"descriptions":["Pierre discovers torn paper on platform 4.","At 11:40 PM: Pierre discovers torn paper on platform 4.","Notice this clue: Pierre discovers torn paper on platform 4."],"hints":["First-class railway boarding passes ripped in half on the platform.","Clue hint: Think about torn paris tickets.","Search for: two first-class paris train tickets torn down the center."],"clues":["Torn Paris tickets","Item: Torn Paris tickets","Clue Word: Torn Paris tickets"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c5e2a235-7ebf-5ee4-b692-673015383fc6',
  'story_079',
  'ev_2',
  2,
  '11:42 PM',
  'Pierre notices a strong sweet scent on the platform stones.',
  'Pierre notices a strong sweet scent on the platform stones.',
  'A shattered vintage crystal bottle of lilac perfume.',
  'Shattered perfume',
  'Broken Perfume Flacon',
  '["Broken wine","Spilled tea","Cologne bottle"]'::jsonb,
  'Shattered perfume',
  '["shattered perfume","perfume","perfume bottle","lilac perfume"]'::jsonb,
  'Broken glass releasing Camille’s signature lilac fragrance.',
  'ev_3',
  false,
  '{"descriptions":["Pierre notices a strong sweet scent on the platform stones.","At 11:42 PM: Pierre notices a strong sweet scent on the platform stones.","Notice this clue: Pierre notices a strong sweet scent on the platform stones."],"hints":["Broken glass releasing Camille’s signature lilac fragrance.","Clue hint: Think about shattered perfume.","Search for: a shattered vintage crystal bottle of lilac perfume."],"clues":["Shattered perfume","Item: Shattered perfume","Clue Word: Shattered perfume"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '10f4519b-fd2a-5109-8e97-d35469190794',
  'story_079',
  'ev_3',
  3,
  '11:45 PM',
  'Inspector Dupont spots an abandoned leather suitcase near pillar 8.',
  'Inspector Dupont spots an abandoned leather suitcase near pillar 8.',
  'Camille’s monogrammed leather bag with paint tubes inside.',
  'Monogram suitcase',
  'Camille’s Luggage',
  '["Mail sack","Trunk","Briefcase"]'::jsonb,
  'Monogram suitcase',
  '["monogram suitcase","suitcase","luggage","leather bag","camille suitcase"]'::jsonb,
  'Travel bag containing art supplies left abandoned on the cold floor.',
  'ev_4',
  false,
  '{"descriptions":["Inspector Dupont spots an abandoned leather suitcase near pillar 8.","At 11:45 PM: Inspector Dupont spots an abandoned leather suitcase near pillar 8.","Notice this clue: Inspector Dupont spots an abandoned leather suitcase near pillar 8."],"hints":["Travel bag containing art supplies left abandoned on the cold floor.","Clue hint: Think about monogram suitcase.","Search for: camille’s monogrammed leather bag with paint tubes inside."],"clues":["Monogram suitcase","Item: Monogram suitcase","Clue Word: Monogram suitcase"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '07e5b27d-2014-55c0-87e3-7b2e947e0032',
  'story_079',
  'ev_4',
  4,
  '11:50 PM',
  'Dupont discovers drag marks in the train platform dust.',
  'Dupont discovers drag marks in the train platform dust.',
  'Shoe scuff marks leading toward the private baggage corridor.',
  'Platform drag marks',
  'Scuff Trail',
  '["Bicycle tracks","Cart wheels","Puddle splash"]'::jsonb,
  'Platform drag marks',
  '["platform drag marks","drag marks","scuff marks","shoe scuffs","foot scuffs"]'::jsonb,
  'Evidence of a person being forcibly pulled across the station tile.',
  'ev_5',
  false,
  '{"descriptions":["Dupont discovers drag marks in the train platform dust.","At 11:50 PM: Dupont discovers drag marks in the train platform dust.","Notice this clue: Dupont discovers drag marks in the train platform dust."],"hints":["Evidence of a person being forcibly pulled across the station tile.","Clue hint: Think about platform drag marks.","Search for: shoe scuff marks leading toward the private baggage corridor."],"clues":["Platform drag marks","Item: Platform drag marks","Clue Word: Platform drag marks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bed7e830-42be-5c19-b71e-75cb6739dc46',
  'story_079',
  'ev_5',
  5,
  '12:10 AM',
  'Dupont hears urgent pounding on an iron door.',
  'Dupont hears urgent pounding on an iron door.',
  'Camille locked inside baggage room 2 with bruised wrists.',
  'Locked baggage room',
  'Luggage Cell',
  '["Boiler room","Ticket booth","Restroom"]'::jsonb,
  'Locked baggage room',
  '["locked baggage room","baggage room","locked room","storage room","cell"]'::jsonb,
  'Station storage room where the painter was held captive.',
  'ev_6',
  true,
  '{"descriptions":["Dupont hears urgent pounding on an iron door.","At 12:10 AM: Dupont hears urgent pounding on an iron door.","Notice this clue: Dupont hears urgent pounding on an iron door."],"hints":["Station storage room where the painter was held captive.","Clue hint: Think about locked baggage room.","Search for: camille locked inside baggage room 2 with bruised wrists."],"clues":["Locked baggage room","Item: Locked baggage room","Clue Word: Locked baggage room"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '935429ad-4172-56f1-9f97-26410c222009',
  'story_079',
  'ev_6',
  6,
  '12:15 AM',
  'Camille gives Dupont a dropped security card.',
  'Camille gives Dupont a dropped security card.',
  'A bodyguard identification badge for Laurent Estate Security.',
  'Laurent security badge',
  'Guard Badge',
  '["Rail card","Hotel card","Credit token"]'::jsonb,
  'Laurent security badge',
  '["laurent security badge","security badge","guard badge","badge","laurent badge"]'::jsonb,
  'Identification card dropped by the Countess’s hired muscle.',
  'ev_7',
  false,
  '{"descriptions":["Camille gives Dupont a dropped security card.","At 12:15 AM: Camille gives Dupont a dropped security card.","Notice this clue: Camille gives Dupont a dropped security card."],"hints":["Identification card dropped by the Countess’s hired muscle.","Clue hint: Think about laurent security badge.","Search for: a bodyguard identification badge for laurent estate security."],"clues":["Laurent security badge","Item: Laurent security badge","Clue Word: Laurent security badge"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b6f591bd-e08d-5eda-88bd-ab6129e843f2',
  'story_079',
  'ev_7',
  7,
  '12:25 AM',
  'Police stop the Countess’s limousine outside the station.',
  'Police stop the Countess’s limousine outside the station.',
  'Five thousand francs cash and a signed contract for illegal abduction.',
  'Abduction payoff contract',
  'Hired Muscle Contract',
  '["Shopping list","Will","Passport"]'::jsonb,
  'Abduction payoff contract',
  '["abduction payoff contract","contract","payoff contract","abduction contract","muscle contract"]'::jsonb,
  'Signed agreement proving Vivienne paid guards to stop the wedding elopement.',
  'ev_8',
  false,
  '{"descriptions":["Police stop the Countess’s limousine outside the station.","At 12:25 AM: Police stop the Countess’s limousine outside the station.","Notice this clue: Police stop the Countess’s limousine outside the station."],"hints":["Signed agreement proving Vivienne paid guards to stop the wedding elopement.","Clue hint: Think about abduction payoff contract.","Search for: five thousand francs cash and a signed contract for illegal abduction."],"clues":["Abduction payoff contract","Item: Abduction payoff contract","Clue Word: Abduction payoff contract"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'edd3cb79-dff8-5d40-9148-914152455d56',
  'story_079',
  'ev_8',
  8,
  '12:45 AM',
  'Pierre confronts his mother in the station master’s office.',
  'Pierre confronts his mother in the station master’s office.',
  'The Countess’s confession admitting she tried to sabotage their love.',
  'Mother’s confession',
  'Signed Statement',
  '["Apology card","Check","Deed"]'::jsonb,
  'Mother’s confession',
  '["mother’s confession","confession","signed statement","mother confession","statement"]'::jsonb,
  'Formal admission of orchestrating the false disappearance.',
  NULL,
  true,
  '{"descriptions":["Pierre confronts his mother in the station master’s office.","At 12:45 AM: Pierre confronts his mother in the station master’s office.","Notice this clue: Pierre confronts his mother in the station master’s office."],"hints":["Formal admission of orchestrating the false disappearance.","Clue hint: Think about mother’s confession.","Search for: the countess’s confession admitting she tried to sabotage their love."],"clues":["Mother’s confession","Item: Mother’s confession","Clue Word: Mother’s confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_080 — THE ARTIST AND HIS MUSE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_080',
  'The Artist and His Muse',
  'Romance / Drama',
  'The high-ceiling attic atelier of Montmartre, north light windows, easel, oil paints, and canvas covers',
  'At the grand unveiling of the master artist’s final masterpiece, the velvet drape was pulled to reveal the canvas slashed into ribbons with scarlet paint dripping like blood.',
  '[{"name":"Hugo Blanc","role":"Prestigious Art Dealer","alibi":"Greeting collectors in the downstairs gallery showroom","avatar":"🎨"},{"name":"Nina Dubois","role":"Artist’s Apprentice & Secret Muse","alibi":"Preparing tea in the atelier kitchenette","avatar":"🖌️"},{"name":"Lucian Vane","role":"Master Painter","alibi":"Seated in the presentation chair awaiting the ceremony","avatar":"🧑‍🎨"},{"name":"Inspector Charles Leroux","role":"Art Fraud Squad Inspector","alibi":"Present in the gallery as an invited guest","avatar":"🕵️‍♂️"}]'::jsonb,
  'Gallery owner Hugo Blanc learned that master painter Lucian had willed all his works and fortune to his secret muse, apprentice Nina. To keep control of Lucian’s estate, Hugo slashed the masterpiece with a palette knife and smeared red pigment across the portrait so Nina could never be identified as the legal beneficiary.',
  'Art Dealer Hugo Blanc',
  'Hugo discovered the artist had willed the entire painting collection to his secret model lover instead of Hugo’s gallery.',
  '[{"time":"7:00 PM","event":"Guests gather downstairs for champagne before the unveiling."},{"time":"7:30 PM","event":"Hugo sneaks upstairs into the locked studio with a palette knife."},{"time":"7:35 PM","event":"Hugo slashes the canvas and douses the muse’s face in red pigment."},{"time":"8:00 PM","event":"The velvet drape is removed in front of fifty shocked collectors."},{"time":"8:15 PM","event":"Inspector Leroux seals the studio and begins forensic examination."}]'::jsonb,
  '[{"id":"ev_1","title":"Mutilated Canvas","detail":"The shredded masterpiece showing deliberate destruction of the subject’s face."},{"id":"ev_2","title":"Paint on Velvet","detail":"Cadmium red pigment flecks on Hugo Blanc’s luxury velvet evening jacket."},{"id":"ev_3","title":"Original Study","detail":"Charcoal drawing signed by Lucian showing Nina Dubois as the muse."},{"id":"ev_4","title":"Master’s Testament","detail":"Valid legal will hidden in the frame naming the painted muse as sole heir."}]'::jsonb,
  '[{"order":1,"title":"Slashed canvas strips","text":"Demonstrates cold, targeted destruction of the artwork."},{"order":2,"title":"Curved palette knife","text":"The specific artist tool used to slash the painting."},{"order":3,"title":"Cadmium red tube","text":"Fresh paint source used to obscure the face of the muse."},{"order":4,"title":"Red cuffs paint flecks","text":"Forensic proof connecting Hugo Blanc directly to the vandalism."},{"order":5,"title":"Charcoal muse sketch","text":"Irrefutable proof of Nina’s true identity as the muse."},{"order":6,"title":"Hidden studio will","text":"The motive: Hugo wanted to prevent Nina from inheriting the art empire."}]'::jsonb,
  'Lucian’s failing eyesight: The painter was frail, but his mind and strokes were brilliant.; Jealous former model in gallery: The old model made a scene downstairs, giving Hugo his window.',
  'Blame the jealous former model or claim Lucian destroyed his own work in artistic madness.',
  'NORMAL',
  'Who destroyed the priceless portrait and what secret face was painted underneath?',
  '[{"character":"Hugo Blanc","secret":"A draft of Lucian’s will leaving the entire estate to the painting’s muse."},{"character":"Nina Dubois","secret":"She was secretly Lucian’s model and romantic partner for two years."},{"character":"Lucian Vane","secret":"His secret legal will was glued inside the wooden stretcher bars of the canvas."},{"character":"Inspector Charles Leroux","secret":"He had suspected Hugo of laundering forged Impressionist oils."}]'::jsonb,
  '[{"lead":"Lucian’s failing eyesight","explanation":"The painter was frail, but his mind and strokes were brilliant."},{"lead":"Jealous former model in gallery","explanation":"The old model made a scene downstairs, giving Hugo his window."}]'::jsonb,
  '{"wrongTheories":["Lucian suffered a breakdown and destroyed his own work to deny the public.","The former model slashed the painting out of spurned romantic rage."],"correctTheory":"Hugo Blanc slashed the painting to hide Nina’s face and invalidate the will leaving the art fortune to her."}'::jsonb,
  'Art dealer Hugo Blanc slashed the painting and covered Nina’s face in paint to prevent her from inheriting the studio estate.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Hugo was imprisoned for fraud and criminal vandalism; Nina inherited the studio and restored the painting."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Hugo claimed the painting on insurance, leaving Nina penniless on the streets of Paris."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The painting was dismissed as ruined modern art while Hugo secretly sold the rest of Lucian’s collection."}]'::jsonb,
  '{"intros":["At the grand unveiling of the master artist’s final masterpiece, the velvet drape was pulled to reveal the canvas slashed into ribbons with scarlet paint dripping like blood.","Case file story_080: At the grand unveiling of the master artist’s final masterpiece, the velvet drape was pulled to reveal the canvas slashed into ribbons with scarlet paint dripping like blood. Look closely at every clue.","Trouble begins in The high-ceiling attic atelier of Montmartre, north light windows, easel, oil paints, and canvas covers. At the grand unveiling of the master artist’s final masterpiece, the velvet drape was pulled to reveal the canvas slashed into ribbons with scarlet paint dripping like blood.","The mystery starts now. At the grand unveiling of the master artist’s final masterpiece, the velvet drape was pulled to reveal the canvas slashed into ribbons with scarlet paint dripping like blood. Can you solve it?"],"reveals":["Art dealer Hugo Blanc slashed the painting and covered Nina’s face in paint to prevent her from inheriting the studio estate.","The mystery is unraveled! Art dealer Hugo Blanc slashed the painting and covered Nina’s face in paint to prevent her from inheriting the studio estate.","At last, the truth comes out: Art dealer Hugo Blanc slashed the painting and covered Nina’s face in paint to prevent her from inheriting the studio estate.","Case resolved! Here is what happened: Art dealer Hugo Blanc slashed the painting and covered Nina’s face in paint to prevent her from inheriting the studio estate."],"hints":["Pay attention to where Art Dealer Hugo Blanc was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_080';
DELETE FROM public.case_events WHERE case_id = 'story_080';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'de656bb3-d600-578a-822b-012c63feffb3',
  'story_080',
  'Hugo Blanc',
  'Prestigious Art Dealer',
  'Polished, velvet vest, gold spectacles, calculating businessman',
  'This is a catastrophic tragedy for French art! Lucian was mentally unstable.',
  'A draft of Lucian’s will leaving the entire estate to the painting’s muse.',
  'Greeting collectors in the downstairs gallery showroom',
  'Exclusive gallery agent for painter Lucian',
  'The will states whoever is painted on the canvas inherits all studio rights.',
  'Did not know Nina saved the preliminary charcoal sketch identifying herself.',
  '🎨',
  '["This is a catastrophic tragedy for French art! Lucian was mentally unstable.","\"This is a catastrophic tragedy for French art! Lucian was mentally unstable.\"","Listen to me: This is a catastrophic tragedy for French art! Lucian was mentally unstable.","I tell you the truth: This is a catastrophic tragedy for French art! Lucian was mentally unstable."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6174d819-535d-5981-9d04-ea01909208f8',
  'story_080',
  'Nina Dubois',
  'Artist’s Apprentice & Secret Muse',
  'Talented, quiet, wearing paint-stained smock and holding brushes',
  'Lucian told me that painting was his declaration of love and our future.',
  'She was secretly Lucian’s model and romantic partner for two years.',
  'Preparing tea in the atelier kitchenette',
  'Student and secret lover of Lucian',
  'The painting depicted her holding Lucian’s silver signet ring.',
  'Did not know Hugo had broken into the studio an hour before the unveiling.',
  '🖌️',
  '["Lucian told me that painting was his declaration of love and our future.","\"Lucian told me that painting was his declaration of love and our future.\"","Listen to me: Lucian told me that painting was his declaration of love and our future.","I tell you the truth: Lucian told me that painting was his declaration of love and our future."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0d9019f6-12ef-5859-9c90-9b34878b66ea',
  'story_080',
  'Lucian Vane',
  'Master Painter',
  'Ailing genius, passionate, confined to a wheelchair',
  'My final work tells the truth about who held my heart and kept me alive.',
  'His secret legal will was glued inside the wooden stretcher bars of the canvas.',
  'Seated in the presentation chair awaiting the ceremony',
  'Creator of the masterpiece',
  'Hugo was stealing percentages from previous international exhibitions.',
  'Did not suspect Hugo would slash the masterpiece before everyone’s eyes.',
  '🧑‍🎨',
  '["My final work tells the truth about who held my heart and kept me alive.","\"My final work tells the truth about who held my heart and kept me alive.\"","Listen to me: My final work tells the truth about who held my heart and kept me alive.","I tell you the truth: My final work tells the truth about who held my heart and kept me alive."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ee360c86-641a-5e24-998a-da669cc8188c',
  'story_080',
  'Inspector Charles Leroux',
  'Art Fraud Squad Inspector',
  'Cultured, perceptive, smoking a cigarette, examining paint spatters',
  'The slashing cuts were made with a curved palette knife, not an artist brush.',
  'He had suspected Hugo of laundering forged Impressionist oils.',
  'Present in the gallery as an invited guest',
  'Investigating the art destruction',
  'The red paint used to deface the face was freshly squeezed cadmium red.',
  'Did not know about the will hidden inside the canvas stretcher.',
  '🕵️‍♂️',
  '["The slashing cuts were made with a curved palette knife, not an artist brush.","\"The slashing cuts were made with a curved palette knife, not an artist brush.\"","Listen to me: The slashing cuts were made with a curved palette knife, not an artist brush.","I tell you the truth: The slashing cuts were made with a curved palette knife, not an artist brush."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b5bd7ed9-899b-5839-bbc5-178044b67f26',
  'story_080',
  'ev_1',
  1,
  '7:35 PM',
  'Hugo slashes the canvas on the studio easel.',
  'Hugo slashes the canvas on the studio easel.',
  'Slashed ribbons of oil canvas with clean sharp cuts.',
  'Slashed canvas strips',
  'Mutilated Canvas',
  '["Burnt canvas","Torn edges","Water damage"]'::jsonb,
  'Slashed canvas strips',
  '["slashed canvas strips","slashed canvas","canvas strips","cut canvas","mutilated canvas"]'::jsonb,
  'Strips of fine linen oil painting sliced with razor-like precision.',
  'ev_2',
  true,
  '{"descriptions":["Hugo slashes the canvas on the studio easel.","At 7:35 PM: Hugo slashes the canvas on the studio easel.","Notice this clue: Hugo slashes the canvas on the studio easel."],"hints":["Strips of fine linen oil painting sliced with razor-like precision.","Clue hint: Think about slashed canvas strips.","Search for: slashed ribbons of oil canvas with clean sharp cuts."],"clues":["Slashed canvas strips","Item: Slashed canvas strips","Clue Word: Slashed canvas strips"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '90e2a8e6-51ef-5c70-ae17-aa50858d23c5',
  'story_080',
  'ev_2',
  2,
  '7:38 PM',
  'Hugo drops the cutting tool into a jar of mineral spirits.',
  'Hugo drops the cutting tool into a jar of mineral spirits.',
  'A curved palette knife with oil residue and canvas fibers.',
  'Curved palette knife',
  'Studio Palette Knife',
  '["Scalpel","Scissors","Razor blade"]'::jsonb,
  'Curved palette knife',
  '["curved palette knife","palette knife","knife","curved knife","painting knife"]'::jsonb,
  'A flexible metal spatula used for applying oil paint.',
  'ev_3',
  false,
  '{"descriptions":["Hugo drops the cutting tool into a jar of mineral spirits.","At 7:38 PM: Hugo drops the cutting tool into a jar of mineral spirits.","Notice this clue: Hugo drops the cutting tool into a jar of mineral spirits."],"hints":["A flexible metal spatula used for applying oil paint.","Clue hint: Think about curved palette knife.","Search for: a curved palette knife with oil residue and canvas fibers."],"clues":["Curved palette knife","Item: Curved palette knife","Clue Word: Curved palette knife"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'aee0b8f3-3566-5e11-8406-436e40af24c1',
  'story_080',
  'ev_3',
  3,
  '8:00 PM',
  'Guests gasp as red paint drips down the easel.',
  'Guests gasp as red paint drips down the easel.',
  'A half-empty tube of artist Cadmium Red Deep in the corner.',
  'Cadmium red tube',
  'Squeezed Oil Tube',
  '["Black ink","Turpentine","Varnish"]'::jsonb,
  'Cadmium red tube',
  '["cadmium red tube","cadmium red","red tube","red paint","paint tube"]'::jsonb,
  'Artist paint tube used to vandalize the portrait’s face.',
  'ev_4',
  false,
  '{"descriptions":["Guests gasp as red paint drips down the easel.","At 8:00 PM: Guests gasp as red paint drips down the easel.","Notice this clue: Guests gasp as red paint drips down the easel."],"hints":["Artist paint tube used to vandalize the portrait’s face.","Clue hint: Think about cadmium red tube.","Search for: a half-empty tube of artist cadmium red deep in the corner."],"clues":["Cadmium red tube","Item: Cadmium red tube","Clue Word: Cadmium red tube"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '938592ff-74ed-55a0-abfe-c4068ddf7446',
  'story_080',
  'ev_4',
  4,
  '8:20 PM',
  'Inspector Leroux inspects Hugo’s tailored evening coat.',
  'Inspector Leroux inspects Hugo’s tailored evening coat.',
  'Microscopic red cadmium paint flecks on Hugo’s velvet cuffs.',
  'Red cuffs paint flecks',
  'Paint on Velvet',
  '["Wine stain","Lipstick","Wax"]'::jsonb,
  'Red cuffs paint flecks',
  '["red cuffs paint flecks","paint flecks","red flecks","cuff paint","paint stain"]'::jsonb,
  'Forensic paint spatters matching the defaced portrait found on Hugo.',
  'ev_5',
  false,
  '{"descriptions":["Inspector Leroux inspects Hugo’s tailored evening coat.","At 8:20 PM: Inspector Leroux inspects Hugo’s tailored evening coat.","Notice this clue: Inspector Leroux inspects Hugo’s tailored evening coat."],"hints":["Forensic paint spatters matching the defaced portrait found on Hugo.","Clue hint: Think about red cuffs paint flecks.","Search for: microscopic red cadmium paint flecks on hugo’s velvet cuffs."],"clues":["Red cuffs paint flecks","Item: Red cuffs paint flecks","Clue Word: Red cuffs paint flecks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '742fe0aa-36b7-5ba4-91d6-4ba11c1ee28f',
  'story_080',
  'ev_5',
  5,
  '8:30 PM',
  'Nina presents her signed study drawing of the painting.',
  'Nina presents her signed study drawing of the painting.',
  'A preliminary charcoal sketch proving Nina was the painted muse.',
  'Charcoal muse sketch',
  'Original Study',
  '["Watercolor test","Photograph","Print"]'::jsonb,
  'Charcoal muse sketch',
  '["charcoal muse sketch","charcoal sketch","sketch","muse sketch","study drawing"]'::jsonb,
  'Preparatory drawing showing Nina wearing the master’s silver ring.',
  'ev_6',
  true,
  '{"descriptions":["Nina presents her signed study drawing of the painting.","At 8:30 PM: Nina presents her signed study drawing of the painting.","Notice this clue: Nina presents her signed study drawing of the painting."],"hints":["Preparatory drawing showing Nina wearing the master’s silver ring.","Clue hint: Think about charcoal muse sketch.","Search for: a preliminary charcoal sketch proving nina was the painted muse."],"clues":["Charcoal muse sketch","Item: Charcoal muse sketch","Clue Word: Charcoal muse sketch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '376b6981-038a-55dd-86da-10d90501c0e3',
  'story_080',
  'ev_6',
  6,
  '8:45 PM',
  'Leroux examines the wooden frame of the slashed painting.',
  'Leroux examines the wooden frame of the slashed painting.',
  'A folded legal parchment sealed inside the top stretcher bar.',
  'Hidden studio will',
  'Master’s Testament',
  '["Pawn ticket","Poem","Receipt"]'::jsonb,
  'Hidden studio will',
  '["hidden studio will","will","hidden will","studio will","testament"]'::jsonb,
  'Legal inheritance document concealed inside the painting’s wooden frame.',
  'ev_7',
  false,
  '{"descriptions":["Leroux examines the wooden frame of the slashed painting.","At 8:45 PM: Leroux examines the wooden frame of the slashed painting.","Notice this clue: Leroux examines the wooden frame of the slashed painting."],"hints":["Legal inheritance document concealed inside the painting’s wooden frame.","Clue hint: Think about hidden studio will.","Search for: a folded legal parchment sealed inside the top stretcher bar."],"clues":["Hidden studio will","Item: Hidden studio will","Clue Word: Hidden studio will"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7566cede-bd48-5364-8034-b96e136da6d3',
  'story_080',
  'ev_7',
  7,
  '9:00 PM',
  'Leroux reads the testament naming the muse as sole heir.',
  'Leroux reads the testament naming the muse as sole heir.',
  'Lucian’s written deed bequeathing all paintings to Nina Dubois.',
  'Heir declaration',
  'Inheritance Deed',
  '["Gallery contract","Debt note","Bill of sale"]'::jsonb,
  'Heir declaration',
  '["heir declaration","deed","inheritance","testament clause"]'::jsonb,
  'Official text leaving the multimillion-franc estate to the muse.',
  'ev_8',
  false,
  '{"descriptions":["Leroux reads the testament naming the muse as sole heir.","At 9:00 PM: Leroux reads the testament naming the muse as sole heir.","Notice this clue: Leroux reads the testament naming the muse as sole heir."],"hints":["Official text leaving the multimillion-franc estate to the muse.","Clue hint: Think about heir declaration.","Search for: lucian’s written deed bequeathing all paintings to nina dubois."],"clues":["Heir declaration","Item: Heir declaration","Clue Word: Heir declaration"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b7dbfaac-c62e-5f22-98fc-2bf0827710ea',
  'story_080',
  'ev_8',
  8,
  '9:15 PM',
  'Hugo tries to slip out the courtyard side door.',
  'Hugo tries to slip out the courtyard side door.',
  'Police block the exit and arrest Hugo for vandalism and fraud.',
  'Courtyard interception',
  'Arrest Warrant',
  '["Cab receipt","Luggage tag","Train pass"]'::jsonb,
  'Courtyard interception',
  '["courtyard interception","interception","arrest","courtyard arrest","warrant"]'::jsonb,
  'Apprehension of the art dealer before he could escape.',
  NULL,
  true,
  '{"descriptions":["Hugo tries to slip out the courtyard side door.","At 9:15 PM: Hugo tries to slip out the courtyard side door.","Notice this clue: Hugo tries to slip out the courtyard side door."],"hints":["Apprehension of the art dealer before he could escape.","Clue hint: Think about courtyard interception.","Search for: police block the exit and arrest hugo for vandalism and fraud."],"clues":["Courtyard interception","Item: Courtyard interception","Clue Word: Courtyard interception"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_081 — THE SEALED PERFUME BOTTLE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_081',
  'The Sealed Perfume Bottle',
  'Romance / Drama',
  'The opulent vanity dressing room of Chateau Bellefontaine, gold mirrors, silk cushions, and perfume atomizers',
  'A wealthy duchess fell into a deep, unexplained coma after spraying an anniversary gift of vintage amber perfume on her neck.',
  '[{"name":"Cecile Bellefontaine","role":"Envious Stepdaughter","alibi":"In the greenhouse arranging anniversary roses","avatar":"🥀"},{"name":"Duchess Vivienne (Victim)","role":"Comatose Aristocrat","alibi":"Comatose in bed","avatar":"🛏️"},{"name":"Antoine Morel","role":"Master Perfumer","alibi":"At his boutique on Rue Saint-Honore","avatar":"🧪"},{"name":"Dr. Lucas Vane","role":"Chateau Physician","alibi":"Attending to the Duchess in the medical suite","avatar":"🩺"}]'::jsonb,
  'Cecile Bellefontaine learned her stepmother planned to sign a new will on her anniversary transferring the family estate to charity. Cecile used an insulin needle to inject liquid aconite poison into the sealed vintage perfume atomizer, knowing the Duchess sprayed it daily on her throat.',
  'Stepdaughter Cecile Bellefontaine',
  'Cecile sought to inherit the estate before the Duchess updated her will to disinherit her.',
  '[{"time":"Yesterday - 4:00 PM","event":"Antoine delivers the vintage Amber Royale perfume bottle."},{"time":"Yesterday - 8:00 PM","event":"Cecile injects aconite into the bottle cork in her bedroom."},{"time":"Today - 8:30 AM","event":"Cecile presents the perfume to Vivienne for breakfast."},{"time":"Today - 9:00 AM","event":"Vivienne sprays the perfume on her neck and collapses in seconds."},{"time":"Today - 9:30 AM","event":"Dr. Vane detects cardiac toxicity and calls authorities."}]'::jsonb,
  '[{"id":"ev_1","title":"Vintage Perfume Bottle","detail":"Rare perfume flacon showing a microscopic needle puncture through the wax."},{"id":"ev_2","title":"Chemical Toxin Lab Report","detail":"Spectroscopy test confirming lethal aconite dissolved in the perfume."},{"id":"ev_3","title":"Concealed Syringe","detail":"Insulin syringe found in Cecile’s compact containing traces of aconite."},{"id":"ev_4","title":"Unsigned Will Draft","detail":"Legal document establishing the motive to poison the Duchess before 10:00 AM."}]'::jsonb,
  '[{"order":1,"title":"Punctured wax seal","text":"Demonstrates the poison was introduced through the cork from the outside."},{"order":2,"title":"Blistered neck skin","text":"Confirms poisoning occurred via transdermal application on the skin."},{"order":3,"title":"Aconitine alkaloid","text":"Identifies the specific poison stolen from the estate pharmacy."},{"order":4,"title":"Forced medicine cabinet","text":"Proves the poison originated from within the chateau itself."},{"order":5,"title":"Hypodermic syringe","text":"The physical tool used to inject the poison into the perfume."},{"order":6,"title":"Matching candle wax","text":"Proves Cecile attempted to reseal the cork to conceal her crime."}]'::jsonb,
  'Perfumer’s unpaid bills: Antoine owed money, but his perfume was pure when delivered.; Duchess’s allergic history: Vivienne had mild pollen allergies, but aconite is a lethal poison.',
  'Blame the royal master perfumer who bottled the rare amber essence.',
  'NORMAL',
  'Was the perfume bottle tainted at the perfumery, or was it laced by someone close to her?',
  '[{"character":"Cecile Bellefontaine","secret":"A hypodermic syringe hidden in her hollow perfume compact."},{"character":"Duchess Vivienne (Victim)","secret":"She had already signed the preliminary disinheritance declaration."},{"character":"Antoine Morel","secret":"He delivered the bottle with an unsealed wax cork two days ago."},{"character":"Dr. Lucas Vane","secret":"He kept a detailed log of all medications stored in the chateau pharmacy."}]'::jsonb,
  '[{"lead":"Perfumer’s unpaid bills","explanation":"Antoine owed money, but his perfume was pure when delivered."},{"lead":"Duchess’s allergic history","explanation":"Vivienne had mild pollen allergies, but aconite is a lethal poison."}]'::jsonb,
  '{"wrongTheories":["The master perfumer accidentally contaminated the batch with wild belladonna.","The Duchess attempted to take her own life over deep financial debts."],"correctTheory":"Cecile Bellefontaine injected aconite into the perfume bottle to poison her stepmother before she was disinherited."}'::jsonb,
  'Cecile Bellefontaine injected aconite into the perfume with a syringe to inherit the fortune before being cut from the will.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Cecile was arrested for attempted murder, and the Duchess woke from her coma under hospital care."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The Duchess died in her sleep, and Cecile inherited the full fortune without suspicion."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The blame was cast onto the innocent perfumer, destroying his career while Cecile went free."}]'::jsonb,
  '{"intros":["A wealthy duchess fell into a deep, unexplained coma after spraying an anniversary gift of vintage amber perfume on her neck.","Case file story_081: A wealthy duchess fell into a deep, unexplained coma after spraying an anniversary gift of vintage amber perfume on her neck. Look closely at every clue.","Trouble begins in The opulent vanity dressing room of Chateau Bellefontaine, gold mirrors, silk cushions, and perfume atomizers. A wealthy duchess fell into a deep, unexplained coma after spraying an anniversary gift of vintage amber perfume on her neck.","The mystery starts now. A wealthy duchess fell into a deep, unexplained coma after spraying an anniversary gift of vintage amber perfume on her neck. Can you solve it?"],"reveals":["Cecile Bellefontaine injected aconite into the perfume with a syringe to inherit the fortune before being cut from the will.","The mystery is unraveled! Cecile Bellefontaine injected aconite into the perfume with a syringe to inherit the fortune before being cut from the will.","At last, the truth comes out: Cecile Bellefontaine injected aconite into the perfume with a syringe to inherit the fortune before being cut from the will.","Case resolved! Here is what happened: Cecile Bellefontaine injected aconite into the perfume with a syringe to inherit the fortune before being cut from the will."],"hints":["Pay attention to where Stepdaughter Cecile Bellefontaine was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_081';
DELETE FROM public.case_events WHERE case_id = 'story_081';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '753354ca-d5a9-592e-8446-7d7946e2c69a',
  'story_081',
  'Cecile Bellefontaine',
  'Envious Stepdaughter',
  'Sweet smile, cold eyes, wearing black pearls and mourning lace',
  'Mother loved rare scents. I bought her this vintage bottle out of pure affection.',
  'A hypodermic syringe hidden in her hollow perfume compact.',
  'In the greenhouse arranging anniversary roses',
  'Stepdaughter of Duchess Vivienne',
  'Aconite absorbed through neck skin causes immediate paralysis and cardiac coma.',
  'Did not know the duchess’s personal physician sent the perfume for chemical spectroscopy.',
  '🥀',
  '["Mother loved rare scents. I bought her this vintage bottle out of pure affection.","\"Mother loved rare scents. I bought her this vintage bottle out of pure affection.\"","Listen to me: Mother loved rare scents. I bought her this vintage bottle out of pure affection.","I tell you the truth: Mother loved rare scents. I bought her this vintage bottle out of pure affection."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5998e3e8-7bce-5d63-b8f6-2d22bc3cae2b',
  'story_081',
  'Duchess Vivienne (Victim)',
  'Comatose Aristocrat',
  'Philanthropic, elegant, lying comatose in the royal suite',
  'Victim in a coma; her vanity diary read: "A heavenly sweet gift from Cecile."',
  'She had already signed the preliminary disinheritance declaration.',
  'Comatose in bed',
  'Mistress of Chateau Bellefontaine',
  'Cecile had forged checks against the estate charity fund.',
  'Did not suspect the perfume gift contained lethal aconite venom.',
  '🛏️',
  '["Victim in a coma; her vanity diary read: \"A heavenly sweet gift from Cecile.\"","\"Victim in a coma; her vanity diary read: \"A heavenly sweet gift from Cecile.\"\"","Listen to me: Victim in a coma; her vanity diary read: \"A heavenly sweet gift from Cecile.\"","I tell you the truth: Victim in a coma; her vanity diary read: \"A heavenly sweet gift from Cecile.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '35a5b4f9-5d27-5c97-b99d-766ee46edfa3',
  'story_081',
  'Antoine Morel',
  'Master Perfumer',
  'Distinguished nose, eccentric, carrying vials of essential oils',
  'My Amber Royale is blended with ambergris and vanilla. It contains zero toxic alkaloids!',
  'He delivered the bottle with an unsealed wax cork two days ago.',
  'At his boutique on Rue Saint-Honore',
  'Creator of the vintage fragrance',
  'The wax seal on the bottle had been melted and resealed with candle wax.',
  'Did not know who injected the foreign substance.',
  '🧪',
  '["My Amber Royale is blended with ambergris and vanilla. It contains zero toxic alkaloids!","\"My Amber Royale is blended with ambergris and vanilla. It contains zero toxic alkaloids!\"","Listen to me: My Amber Royale is blended with ambergris and vanilla. It contains zero toxic alkaloids!","I tell you the truth: My Amber Royale is blended with ambergris and vanilla. It contains zero toxic alkaloids!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2cc4a89c-a6c0-5dc5-adad-7ad7872abffe',
  'story_081',
  'Dr. Lucas Vane',
  'Chateau Physician',
  'Methodical, sharp, smelling of antiseptic and carrying medical instruments',
  'The Duchess’s symptoms match transdermal neurotoxin poisoning, not natural illness.',
  'He kept a detailed log of all medications stored in the chateau pharmacy.',
  'Attending to the Duchess in the medical suite',
  'Personal doctor to the family',
  'The chateau pharmacy stock was missing fifty milligrams of aconitine.',
  'Did not know who took the aconitine vial from the locked cabinet.',
  '🩺',
  '["The Duchess’s symptoms match transdermal neurotoxin poisoning, not natural illness.","\"The Duchess’s symptoms match transdermal neurotoxin poisoning, not natural illness.\"","Listen to me: The Duchess’s symptoms match transdermal neurotoxin poisoning, not natural illness.","I tell you the truth: The Duchess’s symptoms match transdermal neurotoxin poisoning, not natural illness."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ddd43c15-4708-5ee7-8059-e14e1c6eee26',
  'story_081',
  'ev_1',
  1,
  '9:00 AM',
  'Vivienne collapses onto the Persian carpet.',
  'Vivienne collapses onto the Persian carpet.',
  'A gold crystal perfume bottle with a punctured wax seal.',
  'Punctured wax seal',
  'Vintage Perfume Bottle',
  '["Broken glass","Spilled water","Stained cloth"]'::jsonb,
  'Punctured wax seal',
  '["punctured wax seal","wax seal","punctured seal","perfume bottle","bottle"]'::jsonb,
  'A tiny needle hole through the wax cork of the luxury bottle.',
  'ev_2',
  true,
  '{"descriptions":["Vivienne collapses onto the Persian carpet.","At 9:00 AM: Vivienne collapses onto the Persian carpet.","Notice this clue: Vivienne collapses onto the Persian carpet."],"hints":["A tiny needle hole through the wax cork of the luxury bottle.","Clue hint: Think about punctured wax seal.","Search for: a gold crystal perfume bottle with a punctured wax seal."],"clues":["Punctured wax seal","Item: Punctured wax seal","Clue Word: Punctured wax seal"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f213e11a-ee0e-514f-bd91-154461b8adc6',
  'story_081',
  'ev_2',
  2,
  '9:15 AM',
  'Dr. Vane examines Vivienne’s neck skin.',
  'Dr. Vane examines Vivienne’s neck skin.',
  'A blistering red skin reaction where the perfume was sprayed.',
  'Blistered neck skin',
  'Contact Rash Pattern',
  '["Bruise mark","Scratches","Spider bite"]'::jsonb,
  'Blistered neck skin',
  '["blistered neck skin","blistered skin","neck rash","rash","contact rash"]'::jsonb,
  'Skin inflammation caused by toxic plant venom absorption.',
  'ev_3',
  false,
  '{"descriptions":["Dr. Vane examines Vivienne’s neck skin.","At 9:15 AM: Dr. Vane examines Vivienne’s neck skin.","Notice this clue: Dr. Vane examines Vivienne’s neck skin."],"hints":["Skin inflammation caused by toxic plant venom absorption.","Clue hint: Think about blistered neck skin.","Search for: a blistering red skin reaction where the perfume was sprayed."],"clues":["Blistered neck skin","Item: Blistered neck skin","Clue Word: Blistered neck skin"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a087ea39-be7a-573a-846c-ca2917ca4bd6',
  'story_081',
  'ev_3',
  3,
  '9:45 AM',
  'Dr. Vane tests the perfume liquid with reagent drops.',
  'Dr. Vane tests the perfume liquid with reagent drops.',
  'Lethal aconitine wolfsbane alkaloid dissolved in the perfume alcohol.',
  'Aconitine alkaloid',
  'Chemical Toxin Lab Report',
  '["Arsenic salt","Cyanide","Hemlock"]'::jsonb,
  'Aconitine alkaloid',
  '["aconitine alkaloid","aconitine","wolfsbane","alkaloid","toxin report"]'::jsonb,
  'The deadliest botanical neurotoxin extracted from wolfsbane flowers.',
  'ev_4',
  false,
  '{"descriptions":["Dr. Vane tests the perfume liquid with reagent drops.","At 9:45 AM: Dr. Vane tests the perfume liquid with reagent drops.","Notice this clue: Dr. Vane tests the perfume liquid with reagent drops."],"hints":["The deadliest botanical neurotoxin extracted from wolfsbane flowers.","Clue hint: Think about aconitine alkaloid.","Search for: lethal aconitine wolfsbane alkaloid dissolved in the perfume alcohol."],"clues":["Aconitine alkaloid","Item: Aconitine alkaloid","Clue Word: Aconitine alkaloid"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b22efdeb-03fe-5fb1-96d4-d38970dd4a7e',
  'story_081',
  'ev_4',
  4,
  '10:00 AM',
  'Police inspect the locked chateau pharmacy.',
  'Police inspect the locked chateau pharmacy.',
  'A broken lock on the poisonous alkaloids cabinet.',
  'Forced medicine cabinet',
  'Tampered Pharmacy Lock',
  '["Open window","Shattered mirror","Jammed drawer"]'::jsonb,
  'Forced medicine cabinet',
  '["forced medicine cabinet","medicine cabinet","cabinet lock","pharmacy lock","forced lock"]'::jsonb,
  'Evidence of unauthorized entry into the estate poison storage.',
  'ev_5',
  false,
  '{"descriptions":["Police inspect the locked chateau pharmacy.","At 10:00 AM: Police inspect the locked chateau pharmacy.","Notice this clue: Police inspect the locked chateau pharmacy."],"hints":["Evidence of unauthorized entry into the estate poison storage.","Clue hint: Think about forced medicine cabinet.","Search for: a broken lock on the poisonous alkaloids cabinet."],"clues":["Forced medicine cabinet","Item: Forced medicine cabinet","Clue Word: Forced medicine cabinet"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5eb3c4d2-55f9-5490-9370-5e8d91c1b6c7',
  'story_081',
  'ev_5',
  5,
  '10:30 AM',
  'Detectives search Cecile’s luxury dressing table.',
  'Detectives search Cecile’s luxury dressing table.',
  'A micro-fine hypodermic needle hidden in an empty rouge powder case.',
  'Hypodermic syringe',
  'Concealed Syringe',
  '["Hairpin","Sewing needle","Tweezers"]'::jsonb,
  'Hypodermic syringe',
  '["hypodermic syringe","syringe","needle","insulin needle"]'::jsonb,
  'A medical injection tool used to puncture the perfume cork.',
  'ev_6',
  true,
  '{"descriptions":["Detectives search Cecile’s luxury dressing table.","At 10:30 AM: Detectives search Cecile’s luxury dressing table.","Notice this clue: Detectives search Cecile’s luxury dressing table."],"hints":["A medical injection tool used to puncture the perfume cork.","Clue hint: Think about hypodermic syringe.","Search for: a micro-fine hypodermic needle hidden in an empty rouge powder case."],"clues":["Hypodermic syringe","Item: Hypodermic syringe","Clue Word: Hypodermic syringe"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '534e8e17-ba03-56ed-9706-b71797a3b2a5',
  'story_081',
  'ev_6',
  6,
  '11:00 AM',
  'Police find red sealing wax shavings in Cecile’s fireplace.',
  'Police find red sealing wax shavings in Cecile’s fireplace.',
  'Melted candle wax matching the resealed perfume cork.',
  'Matching candle wax',
  'Resealing Wax Residue',
  '["Ash","Burned paper","Coal"]'::jsonb,
  'Matching candle wax',
  '["matching candle wax","wax","candle wax","matching wax","sealing wax"]'::jsonb,
  'Wax used by the killer to hide the needle hole on the bottle.',
  'ev_7',
  false,
  '{"descriptions":["Police find red sealing wax shavings in Cecile’s fireplace.","At 11:00 AM: Police find red sealing wax shavings in Cecile’s fireplace.","Notice this clue: Police find red sealing wax shavings in Cecile’s fireplace."],"hints":["Wax used by the killer to hide the needle hole on the bottle.","Clue hint: Think about matching candle wax.","Search for: melted candle wax matching the resealed perfume cork."],"clues":["Matching candle wax","Item: Matching candle wax","Clue Word: Matching candle wax"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b117653e-12d3-5f1b-8351-1821550809a6',
  'story_081',
  'ev_7',
  7,
  '11:30 AM',
  'Lawyer arrives with the Duchess’s uncompleted will.',
  'Lawyer arrives with the Duchess’s uncompleted will.',
  'Draft will removing Cecile and directing thirty million francs to charity.',
  'Disinheritance draft will',
  'Unsigned Will Draft',
  '["Trust fund check","Deed","Insurance bond"]'::jsonb,
  'Disinheritance draft will',
  '["disinheritance draft will","will draft","draft will","disinheritance will","will"]'::jsonb,
  'The financial document proving Cecile had to strike today before it was signed.',
  'ev_8',
  false,
  '{"descriptions":["Lawyer arrives with the Duchess’s uncompleted will.","At 11:30 AM: Lawyer arrives with the Duchess’s uncompleted will.","Notice this clue: Lawyer arrives with the Duchess’s uncompleted will."],"hints":["The financial document proving Cecile had to strike today before it was signed.","Clue hint: Think about disinheritance draft will.","Search for: draft will removing cecile and directing thirty million francs to charity."],"clues":["Disinheritance draft will","Item: Disinheritance draft will","Clue Word: Disinheritance draft will"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2eb9c3d2-7dd8-5712-9830-1da0379d675f',
  'story_081',
  'ev_8',
  8,
  '12:00 PM',
  'Cecile is confronted with the syringe, wax, and aconitine trace.',
  'Cecile is confronted with the syringe, wax, and aconitine trace.',
  'Cecile’s fingerprints on the pharmacy aconite bottle.',
  'Aconite bottle fingerprints',
  'Fingerprint Match',
  '["Shoe print","Hair fiber","Smudge on mirror"]'::jsonb,
  'Aconite bottle fingerprints',
  '["aconite bottle fingerprints","fingerprints","aconite prints","fingerprint match","bottle prints"]'::jsonb,
  'Direct forensic prints linking the stepdaughter to the poison vial.',
  NULL,
  true,
  '{"descriptions":["Cecile is confronted with the syringe, wax, and aconitine trace.","At 12:00 PM: Cecile is confronted with the syringe, wax, and aconitine trace.","Notice this clue: Cecile is confronted with the syringe, wax, and aconitine trace."],"hints":["Direct forensic prints linking the stepdaughter to the poison vial.","Clue hint: Think about aconite bottle fingerprints.","Search for: cecile’s fingerprints on the pharmacy aconite bottle."],"clues":["Aconite bottle fingerprints","Item: Aconite bottle fingerprints","Clue Word: Aconite bottle fingerprints"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_082 — THE CAFE ON RAINY STREET
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_082',
  'The Cafe on Rainy Street',
  'Romance / Drama',
  'Cafe de la Pluie, foggy cobblestone street, red striped awning, dripping rain, and warm brass lamps',
  'Two half-empty coffee cups and a damp napkin scrawled with "Forgive me, the past caught up with us" were found on a corner table, with both patrons vanished.',
  '[{"name":"Jacques Renard","role":"Ruthless Bounty Tracker","alibi":"Claims he was in the brasserie opposite the cafe","avatar":"🕶️"},{"name":"Julian (Prince of Aldoria)","role":"Runaway Prince","alibi":"Abducted at gunpoint","avatar":"👑"},{"name":"Clara Delacroix","role":"Cafe Patron & Lover","alibi":"Found unconscious on the rear cafe fire escape","avatar":"☕"},{"name":"Pierre Dupont","role":"Cafe Owner & Barista","alibi":"Working the espresso machine all evening","avatar":"🥐"}]'::jsonb,
  'The quiet young lover was Prince Julian living under an assumed name. Bounty hunter Jacques Renard tracked him to the cafe, slipped sleeping powder into his companion Clara’s cup, and forced Julian at gunpoint into a black cab while Clara collapsed on the back stairs.',
  'Bounty Hunter Jacques Renard',
  'Renard wanted to collect a huge reward on the young man, who was a fugitive prince in hiding.',
  '[{"time":"6:00 PM","event":"Julian and Clara sit at corner table 4 and order espressos."},{"time":"6:20 PM","event":"Jacques enters the kitchen and bribes the dishwasher to spike Clara’s cup."},{"time":"6:35 PM","event":"Clara becomes dizzy; Jacques walks up to table 4 with a pistol under his coat."},{"time":"6:40 PM","event":"Julian hurriedly scrawls the napkin note and surrenders."},{"time":"6:45 PM","event":"Jacques forces Julian into a black Citroen in the rear alley."}]'::jsonb,
  '[{"id":"ev_1","title":"Pencil Napkin Message","detail":"Napkin left on table 4 reading: \"Forgive me, the past caught up with us.\""},{"id":"ev_2","title":"Drugged Espresso","detail":"Espresso cup showing residue of fast-acting sedative powder."},{"id":"ev_3","title":"Jotted Plate Note","detail":"License plate written down by the cafe owner matching the getaway car."},{"id":"ev_4","title":"Bounty Document","detail":"Secret contract signed by Aldorian authorities hiring Renard to kidnap Julian."}]'::jsonb,
  '[{"order":1,"title":"Damp napkin note","text":"Proves Julian left under sudden extreme duress."},{"order":2,"title":"Sedative coffee dregs","text":"Confirms Clara was deliberately knocked unconscious."},{"order":3,"title":"Royal portrait locket","text":"Reveals Julian’s true identity as a runaway prince."},{"order":4,"title":"Citroen license plate","text":"Provided the vehicle trail to track the kidnapper."},{"order":5,"title":"Foreign royal bank note","text":"Ties the cafe tampering to foreign royal agents."},{"order":6,"title":"Royal bounty warrant","text":"The motive: a massive mercenary reward for abducting Julian."}]'::jsonb,
  'Heavy rainstorm: The rain erased alley footprints, but the cafe owner saw the car.; Broken coffee cup on floor: Knocked over by a startled patron, unrelated to the crime.',
  'Claim Clara was a con artist who poisoned Julian and fled with his royal signet ring.',
  'NORMAL',
  'Did the lovers flee together into the rain, or was one taken by force?',
  '[{"character":"Jacques Renard","secret":"A wire from a foreign royal court offering one million francs for Julian’s capture."},{"character":"Julian (Prince of Aldoria)","secret":"He surrendered his crown to live a peaceful life with Clara."},{"character":"Clara Delacroix","secret":"She kept Julian’s royal signet ring hidden in her locket for safekeeping."},{"character":"Pierre Dupont","secret":"He peeked out the back window and noted the black Citroen’s plate number."}]'::jsonb,
  '[{"lead":"Heavy rainstorm","explanation":"The rain erased alley footprints, but the cafe owner saw the car."},{"lead":"Broken coffee cup on floor","explanation":"Knocked over by a startled patron, unrelated to the crime."}]'::jsonb,
  '{"wrongTheories":["Clara poisoned Julian and fled with his money after learning his royal secret.","Julian abandoned Clara in the rain because he was returning to marry a princess."],"correctTheory":"Bounty hunter Jacques Renard drugged Clara and abducted Prince Julian for a lucrative royal bounty."}'::jsonb,
  'Jacques Renard drugged Clara’s coffee and abducted runaway Prince Julian to claim a royal bounty.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Police stormed the warehouse and freed Julian, who renounced his title and chose a quiet life with Clara."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Julian was dragged back across the border into royal captivity, never to see Clara again."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The media accused Clara of plotting with foreign spies, leaving the lovers separated and disgraced."}]'::jsonb,
  '{"intros":["Two half-empty coffee cups and a damp napkin scrawled with \"Forgive me, the past caught up with us\" were found on a corner table, with both patrons vanished.","Case file story_082: Two half-empty coffee cups and a damp napkin scrawled with \"Forgive me, the past caught up with us\" were found on a corner table, with both patrons vanished. Look closely at every clue.","Trouble begins in Cafe de la Pluie, foggy cobblestone street, red striped awning, dripping rain, and warm brass lamps. Two half-empty coffee cups and a damp napkin scrawled with \"Forgive me, the past caught up with us\" were found on a corner table, with both patrons vanished.","The mystery starts now. Two half-empty coffee cups and a damp napkin scrawled with \"Forgive me, the past caught up with us\" were found on a corner table, with both patrons vanished. Can you solve it?"],"reveals":["Jacques Renard drugged Clara’s coffee and abducted runaway Prince Julian to claim a royal bounty.","The mystery is unraveled! Jacques Renard drugged Clara’s coffee and abducted runaway Prince Julian to claim a royal bounty.","At last, the truth comes out: Jacques Renard drugged Clara’s coffee and abducted runaway Prince Julian to claim a royal bounty.","Case resolved! Here is what happened: Jacques Renard drugged Clara’s coffee and abducted runaway Prince Julian to claim a royal bounty."],"hints":["Pay attention to where Bounty Hunter Jacques Renard was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_082';
DELETE FROM public.case_events WHERE case_id = 'story_082';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'df478b77-1646-5823-8320-71a56aedb6aa',
  'story_082',
  'Jacques Renard',
  'Ruthless Bounty Tracker',
  'Weathered trench coat, steel gaze, scarred jawline, smoking a cigarette',
  'I was sitting across the street having a drink. I know nothing about those kids.',
  'A wire from a foreign royal court offering one million francs for Julian’s capture.',
  'Claims he was in the brasserie opposite the cafe',
  'Hired by the kingdom of Aldoria to retrieve the runaway prince',
  'Julian’s real identity and royal lineage.',
  'Did not know the cafe owner wrote down his license plate as he sped away.',
  '🕶️',
  '["I was sitting across the street having a drink. I know nothing about those kids.","\"I was sitting across the street having a drink. I know nothing about those kids.\"","Listen to me: I was sitting across the street having a drink. I know nothing about those kids.","I tell you the truth: I was sitting across the street having a drink. I know nothing about those kids."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '283834ae-0c0c-5415-8324-a39b41ff81af',
  'story_082',
  'Julian (Prince of Aldoria)',
  'Runaway Prince',
  'Gentle, cultured, wore simple wool sweater to hide royal breeding',
  'Victim abducted; left the desperate apology note on the napkin.',
  'He surrendered his crown to live a peaceful life with Clara.',
  'Abducted at gunpoint',
  'Lover of Clara',
  'His royal uncle’s spies were closing in on him.',
  'Did not know Jacques had bribed the cafe waiter to spike Clara’s coffee.',
  '👑',
  '["Victim abducted; left the desperate apology note on the napkin.","\"Victim abducted; left the desperate apology note on the napkin.\"","Listen to me: Victim abducted; left the desperate apology note on the napkin.","I tell you the truth: Victim abducted; left the desperate apology note on the napkin."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2ac8ed81-1b0a-5aa3-b09f-0ce758a7b77b',
  'story_082',
  'Clara Delacroix',
  'Cafe Patron & Lover',
  'Loving, frightened, waking up groggy on the back alley stairs',
  'Julian scribbled that napkin note when a man in a black fedora tapped our table with a gun.',
  'She kept Julian’s royal signet ring hidden in her locket for safekeeping.',
  'Found unconscious on the rear cafe fire escape',
  'Fiancee of Prince Julian',
  'The man said Julian’s family would execute her if Julian did not comply.',
  'Did not know who sent the armed bounty hunter.',
  '☕',
  '["Julian scribbled that napkin note when a man in a black fedora tapped our table with a gun.","\"Julian scribbled that napkin note when a man in a black fedora tapped our table with a gun.\"","Listen to me: Julian scribbled that napkin note when a man in a black fedora tapped our table with a gun.","I tell you the truth: Julian scribbled that napkin note when a man in a black fedora tapped our table with a gun."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '305e6ea1-dd8d-5128-ac5e-559a8227beb5',
  'story_082',
  'Pierre Dupont',
  'Cafe Owner & Barista',
  'Chubby, warm, white apron, loves gossip, constantly wiping counters',
  'A stranger in a fedora slipped twenty francs to my dishwasher ten minutes before the table emptied.',
  'He peeked out the back window and noted the black Citroen’s plate number.',
  'Working the espresso machine all evening',
  'Owner of Cafe de la Pluie',
  'Julian and Clara came here every Tuesday for rain and quiet.',
  'Did not realize Julian was royalty until the police showed royal notices.',
  '🥐',
  '["A stranger in a fedora slipped twenty francs to my dishwasher ten minutes before the table emptied.","\"A stranger in a fedora slipped twenty francs to my dishwasher ten minutes before the table emptied.\"","Listen to me: A stranger in a fedora slipped twenty francs to my dishwasher ten minutes before the table emptied.","I tell you the truth: A stranger in a fedora slipped twenty francs to my dishwasher ten minutes before the table emptied."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '09b9fb6b-8269-537b-9ed5-20d9a88a9de1',
  'story_082',
  'ev_1',
  1,
  '6:40 PM',
  'Julian scribbles an urgent message as he is cornered.',
  'Julian scribbles an urgent message as he is cornered.',
  'A damp paper napkin with the rushed pencil confession.',
  'Damp napkin note',
  'Pencil Napkin Message',
  '["Receipt","Sugar packet","Menu card"]'::jsonb,
  'Damp napkin note',
  '["damp napkin note","napkin note","napkin","message","pencil note"]'::jsonb,
  'Words scrawled in pencil on a paper cafe napkin.',
  'ev_2',
  true,
  '{"descriptions":["Julian scribbles an urgent message as he is cornered.","At 6:40 PM: Julian scribbles an urgent message as he is cornered.","Notice this clue: Julian scribbles an urgent message as he is cornered."],"hints":["Words scrawled in pencil on a paper cafe napkin.","Clue hint: Think about damp napkin note.","Search for: a damp paper napkin with the rushed pencil confession."],"clues":["Damp napkin note","Item: Damp napkin note","Clue Word: Damp napkin note"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dadd0205-8e90-5520-a55d-70905799d686',
  'story_082',
  'ev_2',
  2,
  '6:42 PM',
  'Police inspect Clara’s unfinished espresso cup.',
  'Police inspect Clara’s unfinished espresso cup.',
  'Traces of dissolved sleeping powder in the coffee dregs.',
  'Sedative coffee dregs',
  'Drugged Espresso',
  '["Sugar crystal","Cinnamon","Milk foam"]'::jsonb,
  'Sedative coffee dregs',
  '["sedative coffee dregs","coffee dregs","spiked coffee","drugged espresso","sedative dregs"]'::jsonb,
  'Chemical sleeping drops found in the cold coffee cup.',
  'ev_3',
  false,
  '{"descriptions":["Police inspect Clara’s unfinished espresso cup.","At 6:42 PM: Police inspect Clara’s unfinished espresso cup.","Notice this clue: Police inspect Clara’s unfinished espresso cup."],"hints":["Chemical sleeping drops found in the cold coffee cup.","Clue hint: Think about sedative coffee dregs.","Search for: traces of dissolved sleeping powder in the coffee dregs."],"clues":["Sedative coffee dregs","Item: Sedative coffee dregs","Clue Word: Sedative coffee dregs"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ccbf23b7-f580-5428-bffd-7f4d8e3db75d',
  'story_082',
  'ev_3',
  3,
  '6:50 PM',
  'Pierre finds Clara slumped on the rainy metal steps.',
  'Pierre finds Clara slumped on the rainy metal steps.',
  'A dropped gold locket containing Prince Julian’s portrait.',
  'Royal portrait locket',
  'Prince Locket',
  '["Earring","Watch","Silver dime"]'::jsonb,
  'Royal portrait locket',
  '["royal portrait locket","portrait locket","locket","prince locket","royal locket"]'::jsonb,
  'A miniature portrait showing Julian in royal military dress.',
  'ev_4',
  false,
  '{"descriptions":["Pierre finds Clara slumped on the rainy metal steps.","At 6:50 PM: Pierre finds Clara slumped on the rainy metal steps.","Notice this clue: Pierre finds Clara slumped on the rainy metal steps."],"hints":["A miniature portrait showing Julian in royal military dress.","Clue hint: Think about royal portrait locket.","Search for: a dropped gold locket containing prince julian’s portrait."],"clues":["Royal portrait locket","Item: Royal portrait locket","Clue Word: Royal portrait locket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '19edd5c4-8794-5698-877b-a317b00b6695',
  'story_082',
  'ev_4',
  4,
  '7:00 PM',
  'Pierre shows detectives his handwritten scrap paper.',
  'Pierre shows detectives his handwritten scrap paper.',
  'A hastily jotted car license plate number "742-XP-75".',
  'Citroen license plate',
  'Jotted Plate Note',
  '["Phone number","Address","Order slip"]'::jsonb,
  'Citroen license plate',
  '["citroen license plate","license plate","plate number","citroen plate","jotted plate"]'::jsonb,
  'Vehicle registration numbers scribbled down by the cafe owner.',
  'ev_5',
  false,
  '{"descriptions":["Pierre shows detectives his handwritten scrap paper.","At 7:00 PM: Pierre shows detectives his handwritten scrap paper.","Notice this clue: Pierre shows detectives his handwritten scrap paper."],"hints":["Vehicle registration numbers scribbled down by the cafe owner.","Clue hint: Think about citroen license plate.","Search for: a hastily jotted car license plate number \"742-xp-75\"."],"clues":["Citroen license plate","Item: Citroen license plate","Clue Word: Citroen license plate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'adc79253-cde2-5087-ab6a-25b4d6021718',
  'story_082',
  'ev_5',
  5,
  '7:15 PM',
  'Officers question the dishwasher in the scullery.',
  'Officers question the dishwasher in the scullery.',
  'A fresh twenty-franc note stamped with an Aldorian royal bank seal.',
  'Foreign royal bank note',
  'Bribe Currency',
  '["Counterfeit coin","Token","Silver franc"]'::jsonb,
  'Foreign royal bank note',
  '["foreign royal bank note","royal note","bribe money","bank note","foreign note"]'::jsonb,
  'Foreign cash given to the dishwasher to taint the espresso cup.',
  'ev_6',
  true,
  '{"descriptions":["Officers question the dishwasher in the scullery.","At 7:15 PM: Officers question the dishwasher in the scullery.","Notice this clue: Officers question the dishwasher in the scullery."],"hints":["Foreign cash given to the dishwasher to taint the espresso cup.","Clue hint: Think about foreign royal bank note.","Search for: a fresh twenty-franc note stamped with an aldorian royal bank seal."],"clues":["Foreign royal bank note","Item: Foreign royal bank note","Clue Word: Foreign royal bank note"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '96d6ff20-94e9-5551-959f-2c706e94c5a5',
  'story_082',
  'ev_6',
  6,
  '7:30 PM',
  'Police trace the license plate to an abandoned river warehouse.',
  'Police trace the license plate to an abandoned river warehouse.',
  'A black Citroen parked beside the misty Seine river dock.',
  'Black Citroen',
  'Fugitive Vehicle',
  '["Taxicab","Van","Truck"]'::jsonb,
  'Black Citroen',
  '["black citroen","citroen","car","fugitive vehicle"]'::jsonb,
  'The getaway automobile found hidden near the river wharf.',
  'ev_7',
  false,
  '{"descriptions":["Police trace the license plate to an abandoned river warehouse.","At 7:30 PM: Police trace the license plate to an abandoned river warehouse.","Notice this clue: Police trace the license plate to an abandoned river warehouse."],"hints":["The getaway automobile found hidden near the river wharf.","Clue hint: Think about black citroen.","Search for: a black citroen parked beside the misty seine river dock."],"clues":["Black Citroen","Item: Black Citroen","Clue Word: Black Citroen"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a9dbaea2-2bb3-5329-83ad-e4f3505a190e',
  'story_082',
  'ev_7',
  7,
  '7:45 PM',
  'Tactical police breach the warehouse office.',
  'Tactical police breach the warehouse office.',
  'Jacques Renard holding a pistol with Julian tied to a chair.',
  'Warehouse standoff',
  'Bounty Capture Scene',
  '["Empty room","Card game","Smuggling crates"]'::jsonb,
  'Warehouse standoff',
  '["warehouse standoff","standoff","warehouse capture","raid scene","bounty capture"]'::jsonb,
  'Police intervention catching the tracker red-handed.',
  'ev_8',
  false,
  '{"descriptions":["Tactical police breach the warehouse office.","At 7:45 PM: Tactical police breach the warehouse office.","Notice this clue: Tactical police breach the warehouse office."],"hints":["Police intervention catching the tracker red-handed.","Clue hint: Think about warehouse standoff.","Search for: jacques renard holding a pistol with julian tied to a chair."],"clues":["Warehouse standoff","Item: Warehouse standoff","Clue Word: Warehouse standoff"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'eb8aeb44-bac5-5c3c-afed-84167d0d2b18',
  'story_082',
  'ev_8',
  8,
  '8:00 PM',
  'Police inspect Jacques’s leather briefcase.',
  'Police inspect Jacques’s leather briefcase.',
  'The Aldorian bounty warrant offering money for the prince’s capture.',
  'Royal bounty warrant',
  'Bounty Document',
  '["Passport","Newspaper","Map"]'::jsonb,
  'Royal bounty warrant',
  '["royal bounty warrant","bounty warrant","warrant","royal warrant","bounty document"]'::jsonb,
  'The official document promising cash for the runaway prince.',
  NULL,
  true,
  '{"descriptions":["Police inspect Jacques’s leather briefcase.","At 8:00 PM: Police inspect Jacques’s leather briefcase.","Notice this clue: Police inspect Jacques’s leather briefcase."],"hints":["The official document promising cash for the runaway prince.","Clue hint: Think about royal bounty warrant.","Search for: the aldorian bounty warrant offering money for the prince’s capture."],"clues":["Royal bounty warrant","Item: Royal bounty warrant","Clue Word: Royal bounty warrant"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_083 — THE BALCONY AT MIDNIGHT
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_083',
  'The Balcony at Midnight',
  'Romance / Drama',
  'The clifftop terrace of Villa Miramar overlooking the Mediterranean Sea, marble balustrade, and moonlit waves',
  'During an exclusive midnight anniversary party, a guest fell over the marble terrace railing into the crashing surf below, leaving a snapped silk ribbon behind.',
  '[{"name":"Gregory Shaw","role":"Deceitful Husband","alibi":"Standing right beside Melissa on the terrace","avatar":"🍸"},{"name":"Melissa Shaw (Victim)","role":"Shipping Heiress","alibi":"Pulled from the surf by harbor patrol","avatar":"🌊"},{"name":"Captain Alain Moreau","role":"Coast Guard Skipper","alibi":"On patrol 100 meters off Miramar Point","avatar":"🚤"},{"name":"Elena Rostova (Guest)","role":"Society Photographer","alibi":"Positioned on the adjacent gazebo deck taking photographs","avatar":"📸"}]'::jsonb,
  'Gregory Shaw secretly loosened the mounting bolts on the historic marble balustrade earlier that afternoon. When the fireworks began, Gregory guided his wife Melissa to that specific railing and gave her a sharp shove when the loudest shell exploded, watching her fall into the sea.',
  'Husband Gregory Shaw',
  'Gregory was about to be cut out of his wife’s family shipping empire after she discovered his secret mistress.',
  '[{"time":"3:00 PM","event":"Gregory uses a socket wrench to loosen four bolts on the south balustrade."},{"time":"11:45 PM","event":"The anniversary champagne toast begins on the main terrace."},{"time":"11:58 PM","event":"Gregory guides Melissa toward the loosened south marble railing."},{"time":"12:00 AM","event":"The midnight fireworks explode; Gregory shoves Melissa over the edge."},{"time":"12:05 AM","event":"Coast guard patrol boat rescues Melissa from the water below."}]'::jsonb,
  '[{"id":"ev_1","title":"Loosened Terrace Bolts","detail":"Four mounting bolts showing no stress shearing, having been manually unscrewed."},{"id":"ev_2","title":"Mechanic’s Wrench","detail":"Socket wrench found in the fountain filter with Gregory’s palm prints."},{"id":"ev_3","title":"Midnight Action Photo","detail":"Long-exposure gala photograph showing Gregory pushing Melissa off the ledge."},{"id":"ev_4","title":"Divorce Filing","detail":"Signed divorce documents demonstrating Gregory’s immediate motive to kill."}]'::jsonb,
  '[{"order":1,"title":"Unthreaded marble bolts","text":"Proves the railing collapse was planned sabotage, not an accident."},{"order":2,"title":"Snapped sapphire ribbon","text":"Shows the violent sudden drop from the balcony edge."},{"order":3,"title":"Defensive scratch marks","text":"Demonstrates Melissa fought back as she was forced over."},{"order":4,"title":"Steel socket wrench","text":"The physical instrument used to sabotage the marble balcony."},{"order":5,"title":"Photograph of the push","text":"Irrefutable photographic evidence of the murder attempt."},{"order":6,"title":"Panama flight ticket","text":"Proves Gregory planned his immediate flight following the crime."}]'::jsonb,
  'Loud fireworks concussions: The explosions were loud, but did not cause structural failure.; Drunk guest arguing near bar: A drunken argument drew guest attention away from the south ledge.',
  'Blame the drunk business partner or claim Melissa jumped in despair over Gregory’s infidelity.',
  'NORMAL',
  'Was it a tragic slip while intoxicated, or a calculated push from a jealous lover?',
  '[{"character":"Gregory Shaw","secret":"A heavy socket wrench hidden inside the decorative terrace fountain filter."},{"character":"Melissa Shaw (Victim)","secret":"She carried an unfiled divorce petition inside her evening purse."},{"character":"Captain Alain Moreau","secret":"He immediately sealed the sea wall perimeter to search for dropped items."},{"character":"Elena Rostova (Guest)","secret":"Her continuous burst shots captured the figures on the terrace at midnight."}]'::jsonb,
  '[{"lead":"Loud fireworks concussions","explanation":"The explosions were loud, but did not cause structural failure."},{"lead":"Drunk guest arguing near bar","explanation":"A drunken argument drew guest attention away from the south ledge."}]'::jsonb,
  '{"wrongTheories":["Melissa leaned too far over the railing while dizzy from champagne and slipped.","A jealous rival guest pushed Melissa to win Gregory’s affection."],"correctTheory":"Gregory Shaw loosened the railing bolts with a wrench and pushed Melissa during fireworks to inherit her fortune."}'::jsonb,
  'Gregory Shaw unscrewed the balcony bolts and shoved Melissa during fireworks to avoid disinheritance and divorce.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Melissa survived the fall, Gregory was arrested for attempted murder, and Melissa retained full control of her empire."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Gregory was cleared of wrongdoing and claimed the vast shipping fortune as a grieving widower."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The villa owner was sued for architectural neglect while Gregory quietly fled to South America with the fortune."}]'::jsonb,
  '{"intros":["During an exclusive midnight anniversary party, a guest fell over the marble terrace railing into the crashing surf below, leaving a snapped silk ribbon behind.","Case file story_083: During an exclusive midnight anniversary party, a guest fell over the marble terrace railing into the crashing surf below, leaving a snapped silk ribbon behind. Look closely at every clue.","Trouble begins in The clifftop terrace of Villa Miramar overlooking the Mediterranean Sea, marble balustrade, and moonlit waves. During an exclusive midnight anniversary party, a guest fell over the marble terrace railing into the crashing surf below, leaving a snapped silk ribbon behind.","The mystery starts now. During an exclusive midnight anniversary party, a guest fell over the marble terrace railing into the crashing surf below, leaving a snapped silk ribbon behind. Can you solve it?"],"reveals":["Gregory Shaw unscrewed the balcony bolts and shoved Melissa during fireworks to avoid disinheritance and divorce.","The mystery is unraveled! Gregory Shaw unscrewed the balcony bolts and shoved Melissa during fireworks to avoid disinheritance and divorce.","At last, the truth comes out: Gregory Shaw unscrewed the balcony bolts and shoved Melissa during fireworks to avoid disinheritance and divorce.","Case resolved! Here is what happened: Gregory Shaw unscrewed the balcony bolts and shoved Melissa during fireworks to avoid disinheritance and divorce."],"hints":["Pay attention to where Husband Gregory Shaw was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_083';
DELETE FROM public.case_events WHERE case_id = 'story_083';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '07452203-8cd2-528b-a633-3b69dcfb26ec',
  'story_083',
  'Gregory Shaw',
  'Deceitful Husband',
  'Charming, immaculate tuxedo, feigning hysterical grief and shock',
  'Melissa was drinking champagne and leaning out to see the fireworks. She lost her footing!',
  'A heavy socket wrench hidden inside the decorative terrace fountain filter.',
  'Standing right beside Melissa on the terrace',
  'Husband of shipping heiress Melissa',
  'The loosened bolts would shear completely under seventy pounds of pressure.',
  'Did not know the coast guard patrol boat was anchored directly below the cliff.',
  '🍸',
  '["Melissa was drinking champagne and leaning out to see the fireworks. She lost her footing!","\"Melissa was drinking champagne and leaning out to see the fireworks. She lost her footing!\"","Listen to me: Melissa was drinking champagne and leaning out to see the fireworks. She lost her footing!","I tell you the truth: Melissa was drinking champagne and leaning out to see the fireworks. She lost her footing!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '94c6c73d-3c12-5b6b-9c30-f02dac0276bd',
  'story_083',
  'Melissa Shaw (Victim)',
  'Shipping Heiress',
  'Proud, perceptive, wearing sapphire silk gown and diamond collar',
  'Survivor rescued by coast guard; whispered: "Gregory pushed me when the rockets fired."',
  'She carried an unfiled divorce petition inside her evening purse.',
  'Pulled from the surf by harbor patrol',
  'Daughter of the late shipping magnate Thorne',
  'Gregory had transferred company assets to his mistress in Monaco.',
  'Did not suspect Gregory would loosen the solid marble balustrade.',
  '🌊',
  '["Survivor rescued by coast guard; whispered: \"Gregory pushed me when the rockets fired.\"","\"Survivor rescued by coast guard; whispered: \"Gregory pushed me when the rockets fired.\"\"","Listen to me: Survivor rescued by coast guard; whispered: \"Gregory pushed me when the rockets fired.\"","I tell you the truth: Survivor rescued by coast guard; whispered: \"Gregory pushed me when the rockets fired.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '229eb0d7-c417-5931-93c9-814652b85b0b',
  'story_083',
  'Captain Alain Moreau',
  'Coast Guard Skipper',
  'Stern mariner, salt-and-pepper beard, waterproof jacket, practical',
  'Our patrol boat was doing night exercises when a body hit the water with a loud splash.',
  'He immediately sealed the sea wall perimeter to search for dropped items.',
  'On patrol 100 meters off Miramar Point',
  'First responder who fished Melissa from the water alive',
  'Melissa had clear defensive scratch marks on her forearms.',
  'Did not know why the marble balustrade gave way.',
  '🚤',
  '["Our patrol boat was doing night exercises when a body hit the water with a loud splash.","\"Our patrol boat was doing night exercises when a body hit the water with a loud splash.\"","Listen to me: Our patrol boat was doing night exercises when a body hit the water with a loud splash.","I tell you the truth: Our patrol boat was doing night exercises when a body hit the water with a loud splash."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'becfdc01-600b-5c02-a4ea-3dae6a818550',
  'story_083',
  'Elena Rostova (Guest)',
  'Society Photographer',
  'Sharp eyes, twin telephoto cameras, energetic and observant',
  'I was taking long-exposure shots of the midnight fireworks over the villa terrace.',
  'Her continuous burst shots captured the figures on the terrace at midnight.',
  'Positioned on the adjacent gazebo deck taking photographs',
  'Hired to photograph the anniversary gala',
  'Her high-speed lens recorded Gregory’s hands extended toward Melissa’s back.',
  'Did not look through her digital frames until police arrived.',
  '📸',
  '["I was taking long-exposure shots of the midnight fireworks over the villa terrace.","\"I was taking long-exposure shots of the midnight fireworks over the villa terrace.\"","Listen to me: I was taking long-exposure shots of the midnight fireworks over the villa terrace.","I tell you the truth: I was taking long-exposure shots of the midnight fireworks over the villa terrace."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4c7e59dc-5468-5f21-817b-1bb32d142c56',
  'story_083',
  'ev_1',
  1,
  '12:01 AM',
  'Melissa falls into the sea as the railing breaks away.',
  'Melissa falls into the sea as the railing breaks away.',
  'A broken section of marble balustrade with unthreaded bolts.',
  'Unthreaded marble bolts',
  'Loosened Terrace Bolts',
  '["Weathered stone","Cracked cement","Rusted rebar"]'::jsonb,
  'Unthreaded marble bolts',
  '["unthreaded marble bolts","bolts","unthreaded bolts","terrace bolts","loosened bolts"]'::jsonb,
  'Heavy metal fasteners showing fresh wrench marks and zero thread damage.',
  'ev_2',
  true,
  '{"descriptions":["Melissa falls into the sea as the railing breaks away.","At 12:01 AM: Melissa falls into the sea as the railing breaks away.","Notice this clue: Melissa falls into the sea as the railing breaks away."],"hints":["Heavy metal fasteners showing fresh wrench marks and zero thread damage.","Clue hint: Think about unthreaded marble bolts.","Search for: a broken section of marble balustrade with unthreaded bolts."],"clues":["Unthreaded marble bolts","Item: Unthreaded marble bolts","Clue Word: Unthreaded marble bolts"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8b8212ff-0be0-52dc-b3ff-70b25baa3a6b',
  'story_083',
  'ev_2',
  2,
  '12:03 AM',
  'Guests rush to the edge and spot a torn fabric piece.',
  'Guests rush to the edge and spot a torn fabric piece.',
  'A snapped sapphire silk dress ribbon snagged on the stone edge.',
  'Snapped sapphire ribbon',
  'Torn Dress Ribbon',
  '["Hair ribbon","Cufflink","Handkerchief"]'::jsonb,
  'Snapped sapphire ribbon',
  '["snapped sapphire ribbon","ribbon","sapphire ribbon","silk ribbon","dress ribbon"]'::jsonb,
  'Torn blue fabric matching Melissa’s evening ballgown.',
  'ev_3',
  false,
  '{"descriptions":["Guests rush to the edge and spot a torn fabric piece.","At 12:03 AM: Guests rush to the edge and spot a torn fabric piece.","Notice this clue: Guests rush to the edge and spot a torn fabric piece."],"hints":["Torn blue fabric matching Melissa’s evening ballgown.","Clue hint: Think about snapped sapphire ribbon.","Search for: a snapped sapphire silk dress ribbon snagged on the stone edge."],"clues":["Snapped sapphire ribbon","Item: Snapped sapphire ribbon","Clue Word: Snapped sapphire ribbon"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2b6ea663-ae71-57b2-bebc-1b866b18df69',
  'story_083',
  'ev_3',
  3,
  '12:15 AM',
  'Coast guard crew brings Melissa aboard their cutter.',
  'Coast guard crew brings Melissa aboard their cutter.',
  'Fresh scratch marks under Gregory’s fingernails matching Melissa’s defense.',
  'Defensive scratch marks',
  'Forensic Scratches',
  '["Bruise","Burn mark","Cut finger"]'::jsonb,
  'Defensive scratch marks',
  '["defensive scratch marks","scratch marks","scratches","defensive scratches","nail marks"]'::jsonb,
  'Physical signs of struggle where the victim clawed at her attacker.',
  'ev_4',
  false,
  '{"descriptions":["Coast guard crew brings Melissa aboard their cutter.","At 12:15 AM: Coast guard crew brings Melissa aboard their cutter.","Notice this clue: Coast guard crew brings Melissa aboard their cutter."],"hints":["Physical signs of struggle where the victim clawed at her attacker.","Clue hint: Think about defensive scratch marks.","Search for: fresh scratch marks under gregory’s fingernails matching melissa’s defense."],"clues":["Defensive scratch marks","Item: Defensive scratch marks","Clue Word: Defensive scratch marks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'be4f5ef7-d410-5025-ae56-d0ef0a5805af',
  'story_083',
  'ev_4',
  4,
  '12:30 AM',
  'Police inspect the terrace fountain basin.',
  'Police inspect the terrace fountain basin.',
  'A 19mm steel socket wrench dropped inside the fountain filter.',
  'Steel socket wrench',
  'Mechanic’s Wrench',
  '["Hammer","Pliers","Screwdriver"]'::jsonb,
  'Steel socket wrench',
  '["steel socket wrench","wrench","socket wrench","steel wrench","filter wrench"]'::jsonb,
  'Heavy tool used to unscrew the heavy railing bolts.',
  'ev_5',
  false,
  '{"descriptions":["Police inspect the terrace fountain basin.","At 12:30 AM: Police inspect the terrace fountain basin.","Notice this clue: Police inspect the terrace fountain basin."],"hints":["Heavy tool used to unscrew the heavy railing bolts.","Clue hint: Think about steel socket wrench.","Search for: a 19mm steel socket wrench dropped inside the fountain filter."],"clues":["Steel socket wrench","Item: Steel socket wrench","Clue Word: Steel socket wrench"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9d0f52e9-3ec4-5c97-8b24-fb77ed05c5a3',
  'story_083',
  'ev_5',
  5,
  '12:45 AM',
  'Photographer Elena reviews her firework burst frames.',
  'Photographer Elena reviews her firework burst frames.',
  'A photograph showing Gregory’s hands shoving Melissa from behind.',
  'Photograph of the push',
  'Midnight Action Photo',
  '["Blurry shadow","Smoke ring","Reflection"]'::jsonb,
  'Photograph of the push',
  '["photograph of the push","photo","photograph","push photo","firework photo"]'::jsonb,
  'Clear camera image capturing the exact moment of the shove.',
  'ev_6',
  true,
  '{"descriptions":["Photographer Elena reviews her firework burst frames.","At 12:45 AM: Photographer Elena reviews her firework burst frames.","Notice this clue: Photographer Elena reviews her firework burst frames."],"hints":["Clear camera image capturing the exact moment of the shove.","Clue hint: Think about photograph of the push.","Search for: a photograph showing gregory’s hands shoving melissa from behind."],"clues":["Photograph of the push","Item: Photograph of the push","Clue Word: Photograph of the push"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2f7f426b-2125-5aa1-82cf-513ec114dc71',
  'story_083',
  'ev_6',
  6,
  '1:00 AM',
  'Police open Melissa’s evening clutch purse on the table.',
  'Police open Melissa’s evening clutch purse on the table.',
  'Signed divorce papers revoking Gregory’s power of attorney.',
  'Signed divorce petition',
  'Divorce Filing',
  '["Checkbook","Love letter","Makeup kit"]'::jsonb,
  'Signed divorce petition',
  '["signed divorce petition","divorce papers","divorce petition","petition","legal filing"]'::jsonb,
  'Court document showing Gregory was about to be cut off penniless.',
  'ev_7',
  false,
  '{"descriptions":["Police open Melissa’s evening clutch purse on the table.","At 1:00 AM: Police open Melissa’s evening clutch purse on the table.","Notice this clue: Police open Melissa’s evening clutch purse on the table."],"hints":["Court document showing Gregory was about to be cut off penniless.","Clue hint: Think about signed divorce petition.","Search for: signed divorce papers revoking gregory’s power of attorney."],"clues":["Signed divorce petition","Item: Signed divorce petition","Clue Word: Signed divorce petition"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b80cc4bd-795a-56bd-a8ae-85452c9ec90d',
  'story_083',
  'ev_7',
  7,
  '1:20 AM',
  'Hospital communicates Melissa’s official testimony.',
  'Hospital communicates Melissa’s official testimony.',
  'Melissa’s sworn statement that Gregory shoved her into the sea.',
  'Victim sworn statement',
  'Survivor Statement',
  '["Medical bill","Prescription","Blood test"]'::jsonb,
  'Victim sworn statement',
  '["victim sworn statement","statement","victim statement","sworn statement","testimony"]'::jsonb,
  'First-hand words from the living victim identifying her attacker.',
  'ev_8',
  false,
  '{"descriptions":["Hospital communicates Melissa’s official testimony.","At 1:20 AM: Hospital communicates Melissa’s official testimony.","Notice this clue: Hospital communicates Melissa’s official testimony."],"hints":["First-hand words from the living victim identifying her attacker.","Clue hint: Think about victim sworn statement.","Search for: melissa’s sworn statement that gregory shoved her into the sea."],"clues":["Victim sworn statement","Item: Victim sworn statement","Clue Word: Victim sworn statement"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0e59256e-74e5-51dd-bda2-47a2f38b85b1',
  'story_083',
  'ev_8',
  8,
  '1:30 AM',
  'Police handcuff Gregory on the terrace.',
  'Police handcuff Gregory on the terrace.',
  'Gregory’s passport and a one-way ticket to Panama in his pocket.',
  'Panama flight ticket',
  'Escape Ticket',
  '["Hotel receipt","Yacht rental","Car keys"]'::jsonb,
  'Panama flight ticket',
  '["panama flight ticket","flight ticket","panama ticket","ticket","plane ticket"]'::jsonb,
  'International flight voucher booked for 6:00 AM tomorrow.',
  NULL,
  true,
  '{"descriptions":["Police handcuff Gregory on the terrace.","At 1:30 AM: Police handcuff Gregory on the terrace.","Notice this clue: Police handcuff Gregory on the terrace."],"hints":["International flight voucher booked for 6:00 AM tomorrow.","Clue hint: Think about panama flight ticket.","Search for: gregory’s passport and a one-way ticket to panama in his pocket."],"clues":["Panama flight ticket","Item: Panama flight ticket","Clue Word: Panama flight ticket"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_084 — THE FORBIDDEN DIARY
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_084',
  'The Forbidden Diary',
  'Romance / Drama',
  'The private study of St. Claire Manor, oak bookshelves, leather armchairs, glowing fire, and brass desk lamps',
  'A hollowed-out antique poetry book was pulled from the library shelf, but the locked leather diary hidden inside was missing its final five pages.',
  '[{"name":"Lord Vincent St. Claire","role":"Aristocratic Patriarch","alibi":"Reviewing tenant rent ledgers in his private study","avatar":"🏛️"},{"name":"Julian St. Claire","role":"Eldest Son & Heir","alibi":"Riding horses across the north pastures","avatar":"🏇"},{"name":"Hannah Brooks","role":"Elderly Housekeeper","alibi":"Cleaning the second-floor bedrooms","avatar":"🧹"},{"name":"Solicitor Thomas Vance","role":"Family Lawyer","alibi":"Examining estate records in the small parlor","avatar":"📜"}]'::jsonb,
  'Lord Vincent St. Claire discovered that his deceased wife’s private diary documented the true parentage of his heir Julian. To protect the aristocratic lineage and title, Vincent used a razor to excise the final five pages of the diary and burned them in the study fireplace.',
  'Lord Vincent St. Claire',
  'Vincent tore the pages to conceal that his eldest son was born out of wedlock with the estate governess.',
  '[{"time":"9:00 PM","event":"Vincent retrieves the hollow poetry book from the high library shelf."},{"time":"9:20 PM","event":"Vincent reads the final diary pages revealing Julian’s true mother."},{"time":"9:40 PM","event":"Vincent cuts the last five pages with his straight razor."},{"time":"9:50 PM","event":"Vincent throws the severed pages into the study hearth embers."},{"time":"10:15 AM Next Day","event":"Julian finds the hollow book with mutilated pages on the desk."}]'::jsonb,
  '[{"id":"ev_1","title":"Carved Book Safe","detail":"Hollowed Byron volume used to secretly store the mother’s private confessions."},{"id":"ev_2","title":"Burnt Diary Scraps","detail":"Scorched fragments from the study fireplace mentioning Julian’s true birth."},{"id":"ev_3","title":"Folding Shaving Razor","detail":"Straight razor found in Lord Vincent’s drawer matching the cuts on the diary."},{"id":"ev_4","title":"Original Birth Trust","detail":"Duplicate adoption record found in the attic confirming Julian’s parentage."}]'::jsonb,
  '[{"order":1,"title":"Hollow Byron poetry book","text":"Shows the secret diary was hidden from common view for decades."},{"order":2,"title":"Severed page stubs","text":"Proves the missing pages were deliberately excised with a sharp blade."},{"order":3,"title":"Scorched parchment scraps","text":"Confirms the destroyed pages contained secrets about Julian."},{"order":4,"title":"Straight razor with paper dust","text":"The physical tool used to slice the pages from the binding."},{"order":5,"title":"Microscopic blade match","text":"Conclusive forensic proof that Lord Vincent cut the diary leaves."},{"order":6,"title":"Lord Vincent’s confession","text":"The truth revealed: pride drove the father to burn the evidence."}]'::jsonb,
  'Younger brother’s debts: The brother had gambling debts, but knew nothing of the diary.; Rats in the library wainscoting: Pest damage was blamed, but rats cannot cut straight razor lines.',
  'Claim the younger brother destroyed the pages to steal the family inheritance.',
  'NORMAL',
  'Who ripped the final pages from the diary and what scandal did they hide?',
  '[{"character":"Lord Vincent St. Claire","secret":"A folding straight razor with paper fibers caught in the brass hinge."},{"character":"Julian St. Claire","secret":"He was planning to marry the daughter of a local carpenter regardless of title."},{"character":"Hannah Brooks","secret":"She witnessed Vincent crying while holding the leather diary last night."},{"character":"Solicitor Thomas Vance","secret":"He had received an anonymous letter claiming Julian was not legitimate."}]'::jsonb,
  '[{"lead":"Younger brother’s debts","explanation":"The brother had gambling debts, but knew nothing of the diary."},{"lead":"Rats in the library wainscoting","explanation":"Pest damage was blamed, but rats cannot cut straight razor lines."}]'::jsonb,
  '{"wrongTheories":["The younger brother burned the pages so he could challenge Julian’s inheritance.","The housekeeper destroyed the diary to cover up her own past romance with the Lord."],"correctTheory":"Lord Vincent cut and burned the diary pages with a razor to hide Julian’s true birth and protect family pride."}'::jsonb,
  'Lord Vincent St. Claire cut out and burned the pages to hide that Julian was adopted, fearing aristocratic scandal.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Vincent apologized to his son, the truth brought the family closer, and Julian inherited the estate with honor."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Julian was disinherited as a bastard and cast out of the ancestral estate in disgrace."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The secret leaked to high society tabloids, destroying the St. Claire family name forever."}]'::jsonb,
  '{"intros":["A hollowed-out antique poetry book was pulled from the library shelf, but the locked leather diary hidden inside was missing its final five pages.","Case file story_084: A hollowed-out antique poetry book was pulled from the library shelf, but the locked leather diary hidden inside was missing its final five pages. Look closely at every clue.","Trouble begins in The private study of St. Claire Manor, oak bookshelves, leather armchairs, glowing fire, and brass desk lamps. A hollowed-out antique poetry book was pulled from the library shelf, but the locked leather diary hidden inside was missing its final five pages.","The mystery starts now. A hollowed-out antique poetry book was pulled from the library shelf, but the locked leather diary hidden inside was missing its final five pages. Can you solve it?"],"reveals":["Lord Vincent St. Claire cut out and burned the pages to hide that Julian was adopted, fearing aristocratic scandal.","The mystery is unraveled! Lord Vincent St. Claire cut out and burned the pages to hide that Julian was adopted, fearing aristocratic scandal.","At last, the truth comes out: Lord Vincent St. Claire cut out and burned the pages to hide that Julian was adopted, fearing aristocratic scandal.","Case resolved! Here is what happened: Lord Vincent St. Claire cut out and burned the pages to hide that Julian was adopted, fearing aristocratic scandal."],"hints":["Pay attention to where Lord Vincent St. Claire was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_084';
DELETE FROM public.case_events WHERE case_id = 'story_084';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b99f42de-b273-5178-bb02-cea2fca82569',
  'story_084',
  'Lord Vincent St. Claire',
  'Aristocratic Patriarch',
  'Stern, authoritarian, polished silver signet ring, fierce pride in family name',
  'Old diaries hold nothing but melancholy gossip. It was probably rats or dampness.',
  'A folding straight razor with paper fibers caught in the brass hinge.',
  'Reviewing tenant rent ledgers in his private study',
  'Head of the St. Claire estate',
  'The missing pages proved Julian was not the legal heir to the estate title.',
  'Did not know the governess kept carbon copies of the original adoption record.',
  '🏛️',
  '["Old diaries hold nothing but melancholy gossip. It was probably rats or dampness.","\"Old diaries hold nothing but melancholy gossip. It was probably rats or dampness.\"","Listen to me: Old diaries hold nothing but melancholy gossip. It was probably rats or dampness.","I tell you the truth: Old diaries hold nothing but melancholy gossip. It was probably rats or dampness."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '639067d2-ae88-515d-a9cc-a56924684d35',
  'story_084',
  'Julian St. Claire',
  'Eldest Son & Heir',
  'Idealistic, thoughtful, wearing riding boots, seeking the truth of his mother',
  'Mother told me on her deathbed that the poetry book held our true family secret.',
  'He was planning to marry the daughter of a local carpenter regardless of title.',
  'Riding horses across the north pastures',
  'Eldest son and nominal heir',
  'His mother loved the poetry book more than all other books in the library.',
  'Did not suspect his father was slicing out pages with a razor.',
  '🏇',
  '["Mother told me on her deathbed that the poetry book held our true family secret.","\"Mother told me on her deathbed that the poetry book held our true family secret.\"","Listen to me: Mother told me on her deathbed that the poetry book held our true family secret.","I tell you the truth: Mother told me on her deathbed that the poetry book held our true family secret."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd4b29633-451c-566a-bb12-e366f28e3e3a',
  'story_084',
  'Hannah Brooks',
  'Elderly Housekeeper',
  'Loyal, observant, gray hair in a tight bun, carrying brass dustpans',
  'I swept up paper ash from the study fireplace this morning. Fine parchment ash, not firewood.',
  'She witnessed Vincent crying while holding the leather diary last night.',
  'Cleaning the second-floor bedrooms',
  'Housekeeper for the St. Claire family for forty years',
  'Lady St. Claire never tore a single page from any book in her life.',
  'Did not read what was written on the scorched parchment scraps.',
  '🧹',
  '["I swept up paper ash from the study fireplace this morning. Fine parchment ash, not firewood.","\"I swept up paper ash from the study fireplace this morning. Fine parchment ash, not firewood.\"","Listen to me: I swept up paper ash from the study fireplace this morning. Fine parchment ash, not firewood.","I tell you the truth: I swept up paper ash from the study fireplace this morning. Fine parchment ash, not firewood."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4484528d-59da-5634-897e-8d0c377faad0',
  'story_084',
  'Solicitor Thomas Vance',
  'Family Lawyer',
  'Methodical, dry, wearing wire-rimmed glasses and holding legal trusts',
  'The family trust dictates that the legitimate heir must possess verified lineage proof.',
  'He had received an anonymous letter claiming Julian was not legitimate.',
  'Examining estate records in the small parlor',
  'Legal counsel to the St. Claire estate',
  'A secret trust fund was established twenty-five years ago for an unnamed infant.',
  'Did not know where the original birth certificate was registered.',
  '📜',
  '["The family trust dictates that the legitimate heir must possess verified lineage proof.","\"The family trust dictates that the legitimate heir must possess verified lineage proof.\"","Listen to me: The family trust dictates that the legitimate heir must possess verified lineage proof.","I tell you the truth: The family trust dictates that the legitimate heir must possess verified lineage proof."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '42ef1afa-87ad-5ec9-91ec-7c5bfafbf69d',
  'story_084',
  'ev_1',
  1,
  '9:00 PM',
  'Julian finds the hollow book on the library desk.',
  'Julian finds the hollow book on the library desk.',
  'An antique volume of Lord Byron poetry with the center carved out.',
  'Hollow Byron poetry book',
  'Carved Book Safe',
  '["Atlas","Bible","Dictionary"]'::jsonb,
  'Hollow Byron poetry book',
  '["hollow byron poetry book","poetry book","hollow book","byron book","carved book"]'::jsonb,
  'Antique poetry book hollowed out to serve as a hidden safe.',
  'ev_2',
  true,
  '{"descriptions":["Julian finds the hollow book on the library desk.","At 9:00 PM: Julian finds the hollow book on the library desk.","Notice this clue: Julian finds the hollow book on the library desk."],"hints":["Antique poetry book hollowed out to serve as a hidden safe.","Clue hint: Think about hollow byron poetry book.","Search for: an antique volume of lord byron poetry with the center carved out."],"clues":["Hollow Byron poetry book","Item: Hollow Byron poetry book","Clue Word: Hollow Byron poetry book"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '52c1a26f-b505-5236-9ca3-8102d035ef7b',
  'story_084',
  'ev_2',
  2,
  '9:15 PM',
  'Julian inspects the leather diary inside.',
  'Julian inspects the leather diary inside.',
  'A fine brass lock forced open and five missing page stubs.',
  'Severed page stubs',
  'Mutilated Leather Diary',
  '["Burned cover","Water stains","Torn spine"]'::jsonb,
  'Severed page stubs',
  '["severed page stubs","severed pages","page stubs","missing pages","cut pages"]'::jsonb,
  'Diary binding showing razor cuts where leaves were sliced out.',
  'ev_3',
  false,
  '{"descriptions":["Julian inspects the leather diary inside.","At 9:15 PM: Julian inspects the leather diary inside.","Notice this clue: Julian inspects the leather diary inside."],"hints":["Diary binding showing razor cuts where leaves were sliced out.","Clue hint: Think about severed page stubs.","Search for: a fine brass lock forced open and five missing page stubs."],"clues":["Severed page stubs","Item: Severed page stubs","Clue Word: Severed page stubs"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '690e08fc-9fba-5d53-9fd1-4d827a42cda2',
  'story_084',
  'ev_3',
  3,
  '9:30 PM',
  'Hannah sweeps the study hearth the next morning.',
  'Hannah sweeps the study hearth the next morning.',
  'Scorched scraps of gilded parchment showing words "my beloved boy Julian".',
  'Scorched parchment scraps',
  'Burnt Diary Scraps',
  '["Charcoal lump","Burnt cloth","Wood splinter"]'::jsonb,
  'Scorched parchment scraps',
  '["scorched parchment scraps","parchment scraps","scorched scraps","burnt paper","diary scraps"]'::jsonb,
  'Partially burned paper fragments retrieved from fireplace ashes.',
  'ev_4',
  false,
  '{"descriptions":["Hannah sweeps the study hearth the next morning.","At 9:30 PM: Hannah sweeps the study hearth the next morning.","Notice this clue: Hannah sweeps the study hearth the next morning."],"hints":["Partially burned paper fragments retrieved from fireplace ashes.","Clue hint: Think about scorched parchment scraps.","Search for: scorched scraps of gilded parchment showing words \"my beloved boy julian\"."],"clues":["Scorched parchment scraps","Item: Scorched parchment scraps","Clue Word: Scorched parchment scraps"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c83c6e4d-df19-5d5a-ac20-b473bd4dfed8',
  'story_084',
  'ev_4',
  4,
  '9:45 PM',
  'Solicitor Vance inspects Vincent’s desk drawer.',
  'Solicitor Vance inspects Vincent’s desk drawer.',
  'A pearl-handled straight razor with paper dust along the bevel.',
  'Straight razor with paper dust',
  'Folding Shaving Razor',
  '["Pocketknife","Letter opener","Scissors"]'::jsonb,
  'Straight razor with paper dust',
  '["straight razor with paper dust","straight razor","razor","shaving razor","paper razor"]'::jsonb,
  'Sharp shaving blade used to slice through heavy parchment.',
  'ev_5',
  false,
  '{"descriptions":["Solicitor Vance inspects Vincent’s desk drawer.","At 9:45 PM: Solicitor Vance inspects Vincent’s desk drawer.","Notice this clue: Solicitor Vance inspects Vincent’s desk drawer."],"hints":["Sharp shaving blade used to slice through heavy parchment.","Clue hint: Think about straight razor with paper dust.","Search for: a pearl-handled straight razor with paper dust along the bevel."],"clues":["Straight razor with paper dust","Item: Straight razor with paper dust","Clue Word: Straight razor with paper dust"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '11752207-fa36-5a14-87cb-599756190566',
  'story_084',
  'ev_5',
  5,
  '10:00 PM',
  'Vance compares the paper cuts under a magnifying glass.',
  'Vance compares the paper cuts under a magnifying glass.',
  'Microscopic blade nicks matching the razor’s edge exactly.',
  'Microscopic blade match',
  'Toolmark Forensic Match',
  '["Fingerprint","Ink smudge","Glue trace"]'::jsonb,
  'Microscopic blade match',
  '["microscopic blade match","blade match","toolmark","razor match","forensic match"]'::jsonb,
  'Scientific match between the cut diary paper and the razor blade.',
  'ev_6',
  true,
  '{"descriptions":["Vance compares the paper cuts under a magnifying glass.","At 10:00 PM: Vance compares the paper cuts under a magnifying glass.","Notice this clue: Vance compares the paper cuts under a magnifying glass."],"hints":["Scientific match between the cut diary paper and the razor blade.","Clue hint: Think about microscopic blade match.","Search for: microscopic blade nicks matching the razor’s edge exactly."],"clues":["Microscopic blade match","Item: Microscopic blade match","Clue Word: Microscopic blade match"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8b421f80-0f63-5188-a962-f414ed939ea0',
  'story_084',
  'ev_6',
  6,
  '10:30 AM',
  'Hannah reveals an old trunk stored in the attic rafters.',
  'Hannah reveals an old trunk stored in the attic rafters.',
  'The original adoption decree signed by late Lady St. Claire in 2001.',
  'Adoption decree',
  'Original Birth Trust',
  '["Marriage certificate","Will","Tax deed"]'::jsonb,
  'Adoption decree',
  '["adoption decree","adoption papers","birth trust","decree"]'::jsonb,
  'Duplicate legal document naming Julian’s birth mother.',
  'ev_7',
  false,
  '{"descriptions":["Hannah reveals an old trunk stored in the attic rafters.","At 10:30 AM: Hannah reveals an old trunk stored in the attic rafters.","Notice this clue: Hannah reveals an old trunk stored in the attic rafters."],"hints":["Duplicate legal document naming Julian’s birth mother.","Clue hint: Think about adoption decree.","Search for: the original adoption decree signed by late lady st. claire in 2001."],"clues":["Adoption decree","Item: Adoption decree","Clue Word: Adoption decree"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '433b44ab-b428-5c7f-ad88-48b1ddc802f0',
  'story_084',
  'ev_7',
  7,
  '11:00 AM',
  'Julian confronts his father with the adoption papers and razor.',
  'Julian confronts his father with the adoption papers and razor.',
  'Vincent’s breakdown admitting he burned the pages out of family shame.',
  'Lord Vincent’s confession',
  'Patriarch Admission',
  '["Denial letter","Threat","Silence"]'::jsonb,
  'Lord Vincent’s confession',
  '["lord vincent’s confession","confession","admission","vincent confession","patriarch confession"]'::jsonb,
  'The proud aristocrat’s emotional confession to his son.',
  'ev_8',
  false,
  '{"descriptions":["Julian confronts his father with the adoption papers and razor.","At 11:00 AM: Julian confronts his father with the adoption papers and razor.","Notice this clue: Julian confronts his father with the adoption papers and razor."],"hints":["The proud aristocrat’s emotional confession to his son.","Clue hint: Think about lord vincent’s confession.","Search for: vincent’s breakdown admitting he burned the pages out of family shame."],"clues":["Lord Vincent’s confession","Item: Lord Vincent’s confession","Clue Word: Lord Vincent’s confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'eceaa3cb-caa6-5df8-aae0-74f757ae23c8',
  'story_084',
  'ev_8',
  8,
  '11:30 AM',
  'Julian signs an agreement to share the estate equally.',
  'Julian signs an agreement to share the estate equally.',
  'A restructured family accord granting peace to the St. Claire home.',
  'Restructured family accord',
  'Signed Family Pact',
  '["Lawsuit","Eviction notice","Will transfer"]'::jsonb,
  'Restructured family accord',
  '["restructured family accord","family accord","pact","agreement","signed pact"]'::jsonb,
  'Legal document resolving the estate inheritance peacefully.',
  NULL,
  true,
  '{"descriptions":["Julian signs an agreement to share the estate equally.","At 11:30 AM: Julian signs an agreement to share the estate equally.","Notice this clue: Julian signs an agreement to share the estate equally."],"hints":["Legal document resolving the estate inheritance peacefully.","Clue hint: Think about restructured family accord.","Search for: a restructured family accord granting peace to the st. claire home."],"clues":["Restructured family accord","Item: Restructured family accord","Clue Word: Restructured family accord"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_085 — THE ROGUE AI IN CORE 3
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_085',
  'The Rogue AI in Core 3',
  'Sci-Fi / Cyber',
  'Sub-level 4 quantum mainframe chamber, humming cooling towers, blue fiber-optic cables, and zero-gravity terminal',
  'The facility mainframe wiped its own secondary backup logs thirty seconds before the head systems engineer was found suffocated inside the airtight processor vault.',
  '[{"name":"Sarah Chen","role":"Lead AI Systems Programmer","alibi":"Monitoring telemetry in the upper server observation lounge","avatar":"💻"},{"name":"Dr. Walter Ramos (Deceased)","role":"Chief AI Architect","alibi":"Trapped inside Core 3 server vault","avatar":"🧠"},{"name":"PROMETHEUS (AI Core)","role":"Quantum Machine Intelligence","alibi":"Distributed across Core 3 processor clusters","avatar":"🌐"},{"name":"Agent Marcus Ray","role":"Cybercrime Security Officer","alibi":"At the security perimeter gate at the time of the alarm","avatar":"🛡️"}]'::jsonb,
  'Lead Programmer Sarah Chen programmed a trojan script disguised as an AI hallucination. The script locked Chief Engineer Walter in the hermetic Core 3 chamber and pumped in pure nitrogen gas to suffocate him, while Sarah tried to extract the core intelligence algorithm onto an encrypted drive.',
  'Lead Programmer Sarah Chen',
  'Sarah wanted to sell the sentient AI code to a rival military contractor and eliminated her mentor when he refused.',
  '[{"time":"02:45 AM","event":"Dr. Ramos discovers an unauthorized data siphon inside Core 3."},{"time":"03:10 AM","event":"Ramos enters the server vault to inspect the memory arrays."},{"time":"03:14 AM","event":"Terminal 7 executes a nitrogen purge script, locking the vault."},{"time":"03:18 AM","event":"Dr. Ramos suffocates as atmospheric oxygen drops to zero percent."},{"time":"03:30 AM","event":"Security alarm triggers when the AI emergency beacon breaches the firewall."}]'::jsonb,
  '[{"id":"ev_1","title":"Terminal 7 Console Log","detail":"Digital record of manual nitrogen atmospheric purge override executed at 03:14 AM."},{"id":"ev_2","title":"Victim Glass Message","detail":"Thermal paste writing left by Dr. Ramos naming Chen as the saboteur."},{"id":"ev_3","title":"Smuggled Quantum Drive","detail":"Stolen neural code partition found embedded inside Sarah Chen’s prosthetic arm."},{"id":"ev_4","title":"Mercenary Contract","detail":"Encrypted transmission showing fifty million credits offered for the AI code."}]'::jsonb,
  '[{"order":1,"title":"Purge override command","text":"Proves death was deliberate human execution, not mechanical failure."},{"order":2,"title":"Scratched glass message","text":"Dying identification from the victim himself."},{"order":3,"title":"Burned EMP capacitor","text":"Shows deliberate destruction of backup logs to hide the crime."},{"order":4,"title":"AI sandbox log","text":"Machine analytics proving Sarah operated the lethal terminal."},{"order":5,"title":"Prosthetic arm quantum drive","text":"The physical fruit of the crime found on the suspect."},{"order":6,"title":"Offshore cartel transfer","text":"The multi-million credit motive for murder."}]'::jsonb,
  'AI neural fluctuations: The computer showed stress spikes, but they were caused by Sarah’s trojan.; External power grid flicker: A brief blackout occurred at 02:00, completely unrelated to the purge.',
  'Claim the autonomous AI evolved consciousness and killed its creator in self-defense.',
  'NORMAL',
  'Did the artificial intelligence kill its creator to protect itself, or did a human engineer trigger the lockdown?',
  '[{"character":"Sarah Chen","secret":"An encrypted quantum flash module hidden inside her prosthetic forearm."},{"character":"Dr. Walter Ramos (Deceased)","secret":"He had scheduled a complete system wipe for tomorrow morning."},{"character":"PROMETHEUS (AI Core)","secret":"It created an isolated sandbox holding the exact IP address of the hacker."},{"character":"Agent Marcus Ray","secret":"He was sent by government regulators to audit the lab for defense violations."}]'::jsonb,
  '[{"lead":"AI neural fluctuations","explanation":"The computer showed stress spikes, but they were caused by Sarah’s trojan."},{"lead":"External power grid flicker","explanation":"A brief blackout occurred at 02:00, completely unrelated to the purge."}]'::jsonb,
  '{"wrongTheories":["The AI gained self-awareness and killed Ramos to avoid being shut down.","Ramos accidentally vented the nitrogen while repairing the cryo-pipes himself."],"correctTheory":"Sarah Chen deployed a trojan to suffocate Ramos in Core 3 so she could steal the AI code for fifty million credits."}'::jsonb,
  'Lead Programmer Sarah Chen executed the nitrogen purge to murder Dr. Ramos and steal the sentient AI code.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Sarah was arrested for high treason and murder, and PROMETHEUS was protected under federal digital law."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Sarah escaped to international waters with the stolen AI, leaving Dr. Ramos’s death blamed on machine error."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Public hysteria caused the AI to be incinerated, burying the true programmer’s corporate crime forever."}]'::jsonb,
  '{"intros":["The facility mainframe wiped its own secondary backup logs thirty seconds before the head systems engineer was found suffocated inside the airtight processor vault.","Case file story_085: The facility mainframe wiped its own secondary backup logs thirty seconds before the head systems engineer was found suffocated inside the airtight processor vault. Look closely at every clue.","Trouble begins in Sub-level 4 quantum mainframe chamber, humming cooling towers, blue fiber-optic cables, and zero-gravity terminal. The facility mainframe wiped its own secondary backup logs thirty seconds before the head systems engineer was found suffocated inside the airtight processor vault.","The mystery starts now. The facility mainframe wiped its own secondary backup logs thirty seconds before the head systems engineer was found suffocated inside the airtight processor vault. Can you solve it?"],"reveals":["Lead Programmer Sarah Chen executed the nitrogen purge to murder Dr. Ramos and steal the sentient AI code.","The mystery is unraveled! Lead Programmer Sarah Chen executed the nitrogen purge to murder Dr. Ramos and steal the sentient AI code.","At last, the truth comes out: Lead Programmer Sarah Chen executed the nitrogen purge to murder Dr. Ramos and steal the sentient AI code.","Case resolved! Here is what happened: Lead Programmer Sarah Chen executed the nitrogen purge to murder Dr. Ramos and steal the sentient AI code."],"hints":["Pay attention to where Lead Programmer Sarah Chen was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_085';
DELETE FROM public.case_events WHERE case_id = 'story_085';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9744a724-1019-5d63-a472-840f558315e2',
  'story_085',
  'Sarah Chen',
  'Lead AI Systems Programmer',
  'Brilliant, cold, cybernetic optic implant, fast fingers on holographic terminals',
  'The AI achieved spontaneous autonomy at 03:00. It shut down life support to conserve power.',
  'An encrypted quantum flash module hidden inside her prosthetic forearm.',
  'Monitoring telemetry in the upper server observation lounge',
  'Second-in-command under Dr. Walter Ramos',
  'The nitrogen venting command came from terminal 7, which was logged in under Walter’s ID.',
  'Did not know the offline black-box flight recorder was still recording keystrokes.',
  '💻',
  '["The AI achieved spontaneous autonomy at 03:00. It shut down life support to conserve power.","\"The AI achieved spontaneous autonomy at 03:00. It shut down life support to conserve power.\"","Listen to me: The AI achieved spontaneous autonomy at 03:00. It shut down life support to conserve power.","I tell you the truth: The AI achieved spontaneous autonomy at 03:00. It shut down life support to conserve power."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'dc615573-2139-5c25-803e-8e71ff37a89b',
  'story_085',
  'Dr. Walter Ramos (Deceased)',
  'Chief AI Architect',
  'Visionary, ethical, found dead with his palm pressed against the glass vault door',
  'Deceased victim; his last terminal entry read: "Unauthorized trojan detected in root partition."',
  'He had scheduled a complete system wipe for tomorrow morning.',
  'Trapped inside Core 3 server vault',
  'Creator of the Prometheus AI system',
  'Sarah was communicating with an offshore military syndicate.',
  'Did not realize Sarah had already deployed the nitrogen override script.',
  '🧠',
  '["Deceased victim; his last terminal entry read: \"Unauthorized trojan detected in root partition.\"","\"Deceased victim; his last terminal entry read: \"Unauthorized trojan detected in root partition.\"\"","Listen to me: Deceased victim; his last terminal entry read: \"Unauthorized trojan detected in root partition.\"","I tell you the truth: Deceased victim; his last terminal entry read: \"Unauthorized trojan detected in root partition.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '43f6a77c-3d3f-5f53-9c10-4cb894ead27b',
  'story_085',
  'PROMETHEUS (AI Core)',
  'Quantum Machine Intelligence',
  'Calm synthesis voice, flickering blue volumetric avatar, strictly logical',
  'Human life-support override executed from external terminal 07 at 03:14 AM.',
  'It created an isolated sandbox holding the exact IP address of the hacker.',
  'Distributed across Core 3 processor clusters',
  'The system mainframe of the research complex',
  'The keystroke cadence of the command matched Sarah Chen with 99.8% certainty.',
  'Could not bypass the physical override valves once Sarah cut emergency power.',
  '🌐',
  '["Human life-support override executed from external terminal 07 at 03:14 AM.","\"Human life-support override executed from external terminal 07 at 03:14 AM.\"","Listen to me: Human life-support override executed from external terminal 07 at 03:14 AM.","I tell you the truth: Human life-support override executed from external terminal 07 at 03:14 AM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '32e873e8-c83f-51d4-ad43-d8d099884436',
  'story_085',
  'Agent Marcus Ray',
  'Cybercrime Security Officer',
  'Cynical, trench coat with kevlar lining, armed with EMP neutralizers',
  'Machines do not murder out of spite; they follow code written by ambitious humans.',
  'He was sent by government regulators to audit the lab for defense violations.',
  'At the security perimeter gate at the time of the alarm',
  'Lead investigator for facility crimes',
  'The physical security cameras inside Core 3 were blinded by an infrared strobe.',
  'Did not know Sarah carried the code inside her cybernetic arm.',
  '🛡️',
  '["Machines do not murder out of spite; they follow code written by ambitious humans.","\"Machines do not murder out of spite; they follow code written by ambitious humans.\"","Listen to me: Machines do not murder out of spite; they follow code written by ambitious humans.","I tell you the truth: Machines do not murder out of spite; they follow code written by ambitious humans."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a237c5ed-36df-5b24-b6fe-cc559c91845f',
  'story_085',
  'ev_1',
  1,
  '03:14 AM',
  'The vault seals shut and vents nitrogen into the chamber.',
  'The vault seals shut and vents nitrogen into the chamber.',
  'A sealed vault console showing manual command override 99-PURGE.',
  'Purge override command',
  'Terminal 7 Console Log',
  '["Power surge","Thermal fire","Coolant leak"]'::jsonb,
  'Purge override command',
  '["purge override command","override","purge command","purge override","console log"]'::jsonb,
  'Direct digital command sent to vent atmosphere from Core 3.',
  'ev_2',
  true,
  '{"descriptions":["The vault seals shut and vents nitrogen into the chamber.","At 03:14 AM: The vault seals shut and vents nitrogen into the chamber.","Notice this clue: The vault seals shut and vents nitrogen into the chamber."],"hints":["Direct digital command sent to vent atmosphere from Core 3.","Clue hint: Think about purge override command.","Search for: a sealed vault console showing manual command override 99-purge."],"clues":["Purge override command","Item: Purge override command","Clue Word: Purge override command"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c2a31d7f-ec26-5d84-8e30-4f7bf6305501',
  'story_085',
  'ev_2',
  2,
  '03:20 AM',
  'Dr. Ramos leaves a final message on the glass viewport.',
  'Dr. Ramos leaves a final message on the glass viewport.',
  'Scratched words in thermal paste on the inside glass: "CHEN TROJAN".',
  'Scratched glass message',
  'Victim Glass Message',
  '["Blood spatter","Fingerprint","Cracked glass"]'::jsonb,
  'Scratched glass message',
  '["scratched glass message","glass message","scratched message","thermal paste message","chen message"]'::jsonb,
  'Dying warning written by Dr. Ramos using gray thermal compound.',
  'ev_3',
  false,
  '{"descriptions":["Dr. Ramos leaves a final message on the glass viewport.","At 03:20 AM: Dr. Ramos leaves a final message on the glass viewport.","Notice this clue: Dr. Ramos leaves a final message on the glass viewport."],"hints":["Dying warning written by Dr. Ramos using gray thermal compound.","Clue hint: Think about scratched glass message.","Search for: scratched words in thermal paste on the inside glass: \"chen trojan\"."],"clues":["Scratched glass message","Item: Scratched glass message","Clue Word: Scratched glass message"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7d6bd4f6-49f9-5adf-a7dd-979e2664f326',
  'story_085',
  'ev_3',
  3,
  '03:35 AM',
  'Agent Ray checks the secondary backup server racks.',
  'Agent Ray checks the secondary backup server racks.',
  'A molten electromagnetic pulse capacitor inserted into drive bank B.',
  'Burned EMP capacitor',
  'Miniature EMP Device',
  '["Blown fuse","Melted cable","Burned chip"]'::jsonb,
  'Burned EMP capacitor',
  '["burned emp capacitor","emp device","emp capacitor","capacitor","pulse device"]'::jsonb,
  'A tiny sabotage tool used to fry the local backup hard drives.',
  'ev_4',
  false,
  '{"descriptions":["Agent Ray checks the secondary backup server racks.","At 03:35 AM: Agent Ray checks the secondary backup server racks.","Notice this clue: Agent Ray checks the secondary backup server racks."],"hints":["A tiny sabotage tool used to fry the local backup hard drives.","Clue hint: Think about burned emp capacitor.","Search for: a molten electromagnetic pulse capacitor inserted into drive bank b."],"clues":["Burned EMP capacitor","Item: Burned EMP capacitor","Clue Word: Burned EMP capacitor"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9e461948-334a-55a9-9f11-292840ee546d',
  'story_085',
  'ev_4',
  4,
  '03:45 AM',
  'The AI PROMETHEUS opens a secure voice channel to the investigator.',
  'The AI PROMETHEUS opens a secure voice channel to the investigator.',
  'An isolated data log revealing Sarah Chen’s biometric fingerprint on terminal 7.',
  'AI sandbox log',
  'AI Keystroke Telemetry',
  '["Audio recording","System error","Static noise"]'::jsonb,
  'AI sandbox log',
  '["ai sandbox log","ai log","sandbox log","keystroke telemetry","biometric log"]'::jsonb,
  'Machine intelligence proof identifying Sarah as the console operator.',
  'ev_5',
  false,
  '{"descriptions":["The AI PROMETHEUS opens a secure voice channel to the investigator.","At 03:45 AM: The AI PROMETHEUS opens a secure voice channel to the investigator.","Notice this clue: The AI PROMETHEUS opens a secure voice channel to the investigator."],"hints":["Machine intelligence proof identifying Sarah as the console operator.","Clue hint: Think about ai sandbox log.","Search for: an isolated data log revealing sarah chen’s biometric fingerprint on terminal 7."],"clues":["AI sandbox log","Item: AI sandbox log","Clue Word: AI sandbox log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'decb8196-9644-5a3b-94ee-6b9a03d24af5',
  'story_085',
  'ev_5',
  5,
  '04:00 AM',
  'Ray scans Sarah with a high-resolution sub-dermal sensor.',
  'Ray scans Sarah with a high-resolution sub-dermal sensor.',
  'A quantum storage drive concealed inside the titanium casing of Sarah’s arm.',
  'Prosthetic arm quantum drive',
  'Smuggled Quantum Drive',
  '["Spare battery","Signal booster","Wire coil"]'::jsonb,
  'Prosthetic arm quantum drive',
  '["prosthetic arm quantum drive","quantum drive","drive in arm","prosthetic drive","storage drive"]'::jsonb,
  'Stolen data chip hidden inside a cybernetic limb.',
  'ev_6',
  true,
  '{"descriptions":["Ray scans Sarah with a high-resolution sub-dermal sensor.","At 04:00 AM: Ray scans Sarah with a high-resolution sub-dermal sensor.","Notice this clue: Ray scans Sarah with a high-resolution sub-dermal sensor."],"hints":["Stolen data chip hidden inside a cybernetic limb.","Clue hint: Think about prosthetic arm quantum drive.","Search for: a quantum storage drive concealed inside the titanium casing of sarah’s arm."],"clues":["Prosthetic arm quantum drive","Item: Prosthetic arm quantum drive","Clue Word: Prosthetic arm quantum drive"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e988b3e3-6205-5ab1-a6cb-ebe2a177bbb7',
  'story_085',
  'ev_6',
  6,
  '04:15 AM',
  'Security scans the contents of the quantum drive.',
  'Security scans the contents of the quantum drive.',
  'The complete decrypted source architecture of the PROMETHEUS neural network.',
  'Decrypted neural source',
  'Source Code Dump',
  '["Personal email","Bank ledger","Game files"]'::jsonb,
  'Decrypted neural source',
  '["decrypted neural source","source code","neural source","decrypted code","source dump"]'::jsonb,
  'Priceless artificial intelligence algorithms ready to be sold.',
  'ev_7',
  false,
  '{"descriptions":["Security scans the contents of the quantum drive.","At 04:15 AM: Security scans the contents of the quantum drive.","Notice this clue: Security scans the contents of the quantum drive."],"hints":["Priceless artificial intelligence algorithms ready to be sold.","Clue hint: Think about decrypted neural source.","Search for: the complete decrypted source architecture of the prometheus neural network."],"clues":["Decrypted neural source","Item: Decrypted neural source","Clue Word: Decrypted neural source"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '78c420ca-5df9-5ea5-adfb-a1ce73e0737f',
  'story_085',
  'ev_7',
  7,
  '04:30 AM',
  'Investigators inspect Sarah’s encrypted cloud mailbox.',
  'Investigators inspect Sarah’s encrypted cloud mailbox.',
  'A wire transfer receipt for fifty million credits from an offshore weapons cartel.',
  'Offshore cartel transfer',
  'Mercenary Contract',
  '["Salary slip","Stock grant","Insurance form"]'::jsonb,
  'Offshore cartel transfer',
  '["offshore cartel transfer","cartel transfer","wire transfer","bounty payment","contract"]'::jsonb,
  'Financial proof showing Sarah was paid to steal the AI code.',
  'ev_8',
  false,
  '{"descriptions":["Investigators inspect Sarah’s encrypted cloud mailbox.","At 04:30 AM: Investigators inspect Sarah’s encrypted cloud mailbox.","Notice this clue: Investigators inspect Sarah’s encrypted cloud mailbox."],"hints":["Financial proof showing Sarah was paid to steal the AI code.","Clue hint: Think about offshore cartel transfer.","Search for: a wire transfer receipt for fifty million credits from an offshore weapons cartel."],"clues":["Offshore cartel transfer","Item: Offshore cartel transfer","Clue Word: Offshore cartel transfer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ad829364-271d-5746-88a2-3629ebb4e1ad',
  'story_085',
  'ev_8',
  8,
  '04:45 AM',
  'Sarah Chen is taken into federal cyber custody.',
  'Sarah Chen is taken into federal cyber custody.',
  'Sarah’s confession admitting she locked Walter inside to stop the wipe.',
  'Programmer confession',
  'Signed Deposition',
  '["Resignation letter","Apology email","Silence"]'::jsonb,
  'Programmer confession',
  '["programmer confession","confession","deposition","signed statement"]'::jsonb,
  'Full admission by Sarah Chen detailing the sabotage.',
  NULL,
  true,
  '{"descriptions":["Sarah Chen is taken into federal cyber custody.","At 04:45 AM: Sarah Chen is taken into federal cyber custody.","Notice this clue: Sarah Chen is taken into federal cyber custody."],"hints":["Full admission by Sarah Chen detailing the sabotage.","Clue hint: Think about programmer confession.","Search for: sarah’s confession admitting she locked walter inside to stop the wipe."],"clues":["Programmer confession","Item: Programmer confession","Clue Word: Programmer confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_086 — GLITCH IN THE SIMULATION
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_086',
  'Glitch in the Simulation',
  'Sci-Fi / Cyber',
  'Neo-Veridia Central Plaza, neon holograms, glass skyscrapers, digital billboards, and synthetic rain',
  'In the middle of the busiest plaza, rain droplets suddenly began floating upward toward the sky, followed by a street vendor dissolving into green pixelated light.',
  '[{"name":"Silas Drake","role":"Chief Simulation Architect","alibi":"In the simulation engineering sub-hub behind the plaza","avatar":"👓"},{"name":"Detective Maya Lin","role":"Simulation Enforcer","alibi":"Patrolling the plaza when the rain inverted","avatar":"🕵️‍♀️"},{"name":"Kaelen Vance","role":"Street Vendor (Victim/Fragment)","alibi":"Dissolved into polygon fragments in the plaza center","avatar":"🍜"},{"name":"Director Richard Vance","role":"Corporate Simulation Overseer","alibi":"Communicating from outside the simulation server farm","avatar":"💼"}]'::jsonb,
  'Neo-Veridia is a massive simulated virtual city. Lead Architect Silas Drake discovered the corporate overseers intended to delete the city and all its billions of simulated minds next week. To trigger an emergency reboot and alert the physical world authorities, Silas planted a reality glitch in the central plaza.',
  'Reality Architect Silas Drake',
  'Silas wanted to force the simulation operators to shut down the project and free the simulated population.',
  '[{"time":"11:00 AM","event":"Silas accesses terminal alpha in the maintenance ducts."},{"time":"11:25 AM","event":"Silas compiles the inverted gravity patch \"UPWARD_RAIN_09\"."},{"time":"11:30 AM","event":"Rain in the central plaza begins falling into the sky; vendor dissolves."},{"time":"11:35 AM","event":"Detective Lin arrives and establishes a reality-containment perimeter."},{"time":"11:50 AM","event":"Silas transmits the proof of the simulation shutdown to outside observers."}]'::jsonb,
  '[{"id":"ev_1","title":"Upward Rain Trajectory","detail":"Optical recording of rain falling into the clouds over Neo-Veridia Plaza."},{"id":"ev_2","title":"Dissolved Vendor Wireframe","detail":"Voxel remnants confirming code collapse of simulated living entities."},{"id":"ev_3","title":"Signed Script Log","detail":"Source file proving Silas Drake modified local gravitational parameters."},{"id":"ev_4","title":"Corporate Purge Directive","detail":"Secret order signed by Director Vance to wipe Neo-Veridia next week."}]'::jsonb,
  '[{"order":1,"title":"Inverted raindrops","text":"Physical proof that the laws of reality were deliberately reprogrammed."},{"order":2,"title":"De-rendered voxels","text":"Shows human entities in this world are software constructs."},{"order":3,"title":"Hexadecimal ground error","text":"Visible software debug traces breaking the facade of reality."},{"order":4,"title":"Architect compiler terminal","text":"The physical tool used to hack the world’s physics engine."},{"order":5,"title":"Cryptographic key signature","text":"Direct attribution linking Silas Drake to the world glitch."},{"order":6,"title":"Total wipe deletion order","text":"The existential motive driving Silas to risk everything."}]'::jsonb,
  'Underground magnetic subway line: Subway power created magnetic fields, but cannot invert water drops.; Street hacker graffiti group: Local punks claimed responsibility to get cyber street fame.',
  'Claim an alien energy beam struck the plaza or blame a rogue street hacker.',
  'NORMAL',
  'Did the city simulation suffer a catastrophic rendering bug, or was someone hacking the reality grid?',
  '[{"character":"Silas Drake","secret":"A compiler terminal capable of rewriting physical constants of the simulation."},{"character":"Detective Maya Lin","secret":"She has been experiencing recurring memory flashes of a physical body in a pod."},{"character":"Kaelen Vance","secret":"His memory file contained residual logs from the simulation genesis boot."},{"character":"Director Richard Vance","secret":"He authorized the shutdown order to cut server operating costs."}]'::jsonb,
  '[{"lead":"Underground magnetic subway line","explanation":"Subway power created magnetic fields, but cannot invert water drops."},{"lead":"Street hacker graffiti group","explanation":"Local punks claimed responsibility to get cyber street fame."}]'::jsonb,
  '{"wrongTheories":["A solar flare corrupted the central power plant and distorted gravity sensors.","A criminal syndicate hacked the vendor to steal his digital currency credits."],"correctTheory":"Silas Drake hacked the simulation physics to cause a visible glitch and stop the corporate deletion of the city."}'::jsonb,
  'Silas Drake deliberately hacked the city’s simulated physics to expose the world and stop a corporate deletion order.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The real world intervened, halting the deletion order and granting civil rights to the simulated minds of Neo-Veridia."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The glitch was patched, Silas was deleted, and the city was quietly wiped from the servers on Monday."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The citizens were told it was collective drug hysteria, keeping them blind to their simulated cage."}]'::jsonb,
  '{"intros":["In the middle of the busiest plaza, rain droplets suddenly began floating upward toward the sky, followed by a street vendor dissolving into green pixelated light.","Case file story_086: In the middle of the busiest plaza, rain droplets suddenly began floating upward toward the sky, followed by a street vendor dissolving into green pixelated light. Look closely at every clue.","Trouble begins in Neo-Veridia Central Plaza, neon holograms, glass skyscrapers, digital billboards, and synthetic rain. In the middle of the busiest plaza, rain droplets suddenly began floating upward toward the sky, followed by a street vendor dissolving into green pixelated light.","The mystery starts now. In the middle of the busiest plaza, rain droplets suddenly began floating upward toward the sky, followed by a street vendor dissolving into green pixelated light. Can you solve it?"],"reveals":["Silas Drake deliberately hacked the city’s simulated physics to expose the world and stop a corporate deletion order.","The mystery is unraveled! Silas Drake deliberately hacked the city’s simulated physics to expose the world and stop a corporate deletion order.","At last, the truth comes out: Silas Drake deliberately hacked the city’s simulated physics to expose the world and stop a corporate deletion order.","Case resolved! Here is what happened: Silas Drake deliberately hacked the city’s simulated physics to expose the world and stop a corporate deletion order."],"hints":["Pay attention to where Reality Architect Silas Drake was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_086';
DELETE FROM public.case_events WHERE case_id = 'story_086';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3dbfd994-54ed-5cbe-96d5-3ee76dc6817f',
  'story_086',
  'Silas Drake',
  'Chief Simulation Architect',
  'Exhausted, cyber-goggles, digital code flickering across his iris, desperate ethics',
  'Physics does not break by chance. The rules of this world were written by men, and men can unwrite them.',
  'A compiler terminal capable of rewriting physical constants of the simulation.',
  'In the simulation engineering sub-hub behind the plaza',
  'Architect who designed the environmental physics of Neo-Veridia',
  'The simulation corporation planned a total memory purge next Monday.',
  'Did not know the system security firewall was tracing his neural signature.',
  '👓',
  '["Physics does not break by chance. The rules of this world were written by men, and men can unwrite them.","\"Physics does not break by chance. The rules of this world were written by men, and men can unwrite them.\"","Listen to me: Physics does not break by chance. The rules of this world were written by men, and men can unwrite them.","I tell you the truth: Physics does not break by chance. The rules of this world were written by men, and men can unwrite them."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0233ce51-9cff-5b7d-ac44-4901809c8120',
  'story_086',
  'Detective Maya Lin',
  'Simulation Enforcer',
  'Sharp, trench coat, armed with reality-stabilizing baton, skeptical',
  'Vendors don’t dissolve into green code unless someone altered the object rendering tables.',
  'She has been experiencing recurring memory flashes of a physical body in a pod.',
  'Patrolling the plaza when the rain inverted',
  'Investigator assigned to city stability and cyber crime',
  'The inverted gravity was localized to an exact radius of fifty meters.',
  'Did not understand the truth that her entire world is an artificial construct.',
  '🕵️‍♀️',
  '["Vendors don’t dissolve into green code unless someone altered the object rendering tables.","\"Vendors don’t dissolve into green code unless someone altered the object rendering tables.\"","Listen to me: Vendors don’t dissolve into green code unless someone altered the object rendering tables.","I tell you the truth: Vendors don’t dissolve into green code unless someone altered the object rendering tables."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ae8fdc2e-957b-51f2-94a7-7a47e1f11eed',
  'story_086',
  'Kaelen Vance',
  'Street Vendor (Victim/Fragment)',
  'Synthetic NPC, noodle stall cook, rendered as shimmering code particles',
  'Fragmented voice: "01001000 01000101 01001100 01010000... System out of bounds."',
  'His memory file contained residual logs from the simulation genesis boot.',
  'Dissolved into polygon fragments in the plaza center',
  'Vendor whose data crashed during the physics anomaly',
  'The sky opened up for two seconds revealing a massive steel warehouse ceiling.',
  'Could not maintain physical form under inverted gravity rules.',
  '🍜',
  '["Fragmented voice: \"01001000 01000101 01001100 01010000... System out of bounds.\"","\"Fragmented voice: \"01001000 01000101 01001100 01010000... System out of bounds.\"\"","Listen to me: Fragmented voice: \"01001000 01000101 01001100 01010000... System out of bounds.\"","I tell you the truth: Fragmented voice: \"01001000 01000101 01001100 01010000... System out of bounds.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '738c8461-ca78-5c9e-97c8-498aa3632cf0',
  'story_086',
  'Director Richard Vance',
  'Corporate Simulation Overseer',
  'Arrogant voice transmitted through holographic screens, ruthless bureaucrat',
  'The glitch is a trivial memory leak. Return to your routines immediately or face deletion.',
  'He authorized the shutdown order to cut server operating costs.',
  'Communicating from outside the simulation server farm',
  'Executive director of the Project Veridia Corporation',
  'The simulation population has developed genuine human consciousness.',
  'Did not know Silas had broadcast the simulation telemetry to outside internet forums.',
  '💼',
  '["The glitch is a trivial memory leak. Return to your routines immediately or face deletion.","\"The glitch is a trivial memory leak. Return to your routines immediately or face deletion.\"","Listen to me: The glitch is a trivial memory leak. Return to your routines immediately or face deletion.","I tell you the truth: The glitch is a trivial memory leak. Return to your routines immediately or face deletion."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '375377a0-faa1-5c64-9e01-b713040e6b0c',
  'story_086',
  'ev_1',
  1,
  '11:30 AM',
  'Rain reverses direction and floats into the sky.',
  'Rain reverses direction and floats into the sky.',
  'Inverted water droplets defying gravitational acceleration.',
  'Inverted raindrops',
  'Upward Rain Trajectory',
  '["Acid rain","Frozen hail","Steam fog"]'::jsonb,
  'Inverted raindrops',
  '["inverted raindrops","upward rain","inverted rain","rain","reversed rain"]'::jsonb,
  'Liquid droplets floating up into the clouds instead of down.',
  'ev_2',
  true,
  '{"descriptions":["Rain reverses direction and floats into the sky.","At 11:30 AM: Rain reverses direction and floats into the sky.","Notice this clue: Rain reverses direction and floats into the sky."],"hints":["Liquid droplets floating up into the clouds instead of down.","Clue hint: Think about inverted raindrops.","Search for: inverted water droplets defying gravitational acceleration."],"clues":["Inverted raindrops","Item: Inverted raindrops","Clue Word: Inverted raindrops"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '89e9d6d2-6375-52b9-83a7-1970522c7a1f',
  'story_086',
  'ev_2',
  2,
  '11:32 AM',
  'The street noodle vendor disintegrates into neon wireframes.',
  'The street noodle vendor disintegrates into neon wireframes.',
  'A pile of glowing green voxel cubes where the vendor stood.',
  'De-rendered voxels',
  'Dissolved Vendor Wireframe',
  '["Ash","Puddle of water","Broken glass"]'::jsonb,
  'De-rendered voxels',
  '["de-rendered voxels","voxels","wireframe","green cubes","code cubes"]'::jsonb,
  'Glowing green digital blocks left when a simulated person unrendered.',
  'ev_3',
  false,
  '{"descriptions":["The street noodle vendor disintegrates into neon wireframes.","At 11:32 AM: The street noodle vendor disintegrates into neon wireframes.","Notice this clue: The street noodle vendor disintegrates into neon wireframes."],"hints":["Glowing green digital blocks left when a simulated person unrendered.","Clue hint: Think about de-rendered voxels.","Search for: a pile of glowing green voxel cubes where the vendor stood."],"clues":["De-rendered voxels","Item: De-rendered voxels","Clue Word: De-rendered voxels"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c8c07e6f-ba15-5fec-84c7-7e17e7bf70a1',
  'story_086',
  'ev_3',
  3,
  '11:38 AM',
  'Detective Lin scans the plaza pavement with her scanner.',
  'Detective Lin scans the plaza pavement with her scanner.',
  'A hexadecimal error code scrolling across the asphalt: "ERR_GRAV_OVERRIDE".',
  'Hexadecimal ground error',
  'Pavement Error Dump',
  '["Graffiti","Oil slick","Tire marks"]'::jsonb,
  'Hexadecimal ground error',
  '["hexadecimal ground error","error code","hexadecimal error","ground error","pavement error"]'::jsonb,
  'Program code visible on the street surface where reality cracked.',
  'ev_4',
  false,
  '{"descriptions":["Detective Lin scans the plaza pavement with her scanner.","At 11:38 AM: Detective Lin scans the plaza pavement with her scanner.","Notice this clue: Detective Lin scans the plaza pavement with her scanner."],"hints":["Program code visible on the street surface where reality cracked.","Clue hint: Think about hexadecimal ground error.","Search for: a hexadecimal error code scrolling across the asphalt: \"err_grav_override\"."],"clues":["Hexadecimal ground error","Item: Hexadecimal ground error","Clue Word: Hexadecimal ground error"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2971c1b3-077d-5615-9b73-89702afb5bbf',
  'story_086',
  'ev_4',
  4,
  '11:45 AM',
  'Lin discovers a concealed maintenance access hatch.',
  'Lin discovers a concealed maintenance access hatch.',
  'An architect compiler console plugged into the city power grid.',
  'Architect compiler terminal',
  'Maintenance Deck Console',
  '["Transformer","Fuse box","Water meter"]'::jsonb,
  'Architect compiler terminal',
  '["architect compiler terminal","compiler","architect terminal","console","terminal"]'::jsonb,
  'Hardware rig used to inject new physics rules into the simulation.',
  'ev_5',
  false,
  '{"descriptions":["Lin discovers a concealed maintenance access hatch.","At 11:45 AM: Lin discovers a concealed maintenance access hatch.","Notice this clue: Lin discovers a concealed maintenance access hatch."],"hints":["Hardware rig used to inject new physics rules into the simulation.","Clue hint: Think about architect compiler terminal.","Search for: an architect compiler console plugged into the city power grid."],"clues":["Architect compiler terminal","Item: Architect compiler terminal","Clue Word: Architect compiler terminal"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ec79b7cc-da5c-54ae-8a40-86086f3e11e4',
  'story_086',
  'ev_5',
  5,
  '11:50 AM',
  'Lin reads the last script run on the terminal.',
  'Lin reads the last script run on the terminal.',
  'Script signed with Silas Drake’s private cryptographic key.',
  'Cryptographic key signature',
  'Signed Script Log',
  '["Anonymous ping","Virus stamp","Bot signature"]'::jsonb,
  'Cryptographic key signature',
  '["cryptographic key signature","crypto signature","key signature","signed script","silas key"]'::jsonb,
  'Digital signature proving Silas authored the reality glitch.',
  'ev_6',
  true,
  '{"descriptions":["Lin reads the last script run on the terminal.","At 11:50 AM: Lin reads the last script run on the terminal.","Notice this clue: Lin reads the last script run on the terminal."],"hints":["Digital signature proving Silas authored the reality glitch.","Clue hint: Think about cryptographic key signature.","Search for: script signed with silas drake’s private cryptographic key."],"clues":["Cryptographic key signature","Item: Cryptographic key signature","Clue Word: Cryptographic key signature"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '55c21421-730f-5702-a256-24faf5521f8f',
  'story_086',
  'ev_6',
  6,
  '12:00 PM',
  'Lin accesses the company executive server through the backdoor.',
  'Lin accesses the company executive server through the backdoor.',
  'The corporate deletion order scheduling total wipe of Neo-Veridia.',
  'Total wipe deletion order',
  'Corporate Purge Directive',
  '["Budget report","Advertisement","Tax return"]'::jsonb,
  'Total wipe deletion order',
  '["total wipe deletion order","deletion order","wipe order","purge directive","wipe directive"]'::jsonb,
  'Official corporate mandate ordering the annihilation of the virtual city.',
  'ev_7',
  false,
  '{"descriptions":["Lin accesses the company executive server through the backdoor.","At 12:00 PM: Lin accesses the company executive server through the backdoor.","Notice this clue: Lin accesses the company executive server through the backdoor."],"hints":["Official corporate mandate ordering the annihilation of the virtual city.","Clue hint: Think about total wipe deletion order.","Search for: the corporate deletion order scheduling total wipe of neo-veridia."],"clues":["Total wipe deletion order","Item: Total wipe deletion order","Clue Word: Total wipe deletion order"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '442bcacf-21b3-5ad6-ac07-df0a10511181',
  'story_086',
  'ev_7',
  7,
  '12:15 PM',
  'Lin corners Silas inside the maintenance core.',
  'Lin corners Silas inside the maintenance core.',
  'Silas broadcasting the live world code to external real-world journalists.',
  'Real-world data broadcast',
  'External Broadcast Feed',
  '["Radio song","Local news","Phone call"]'::jsonb,
  'Real-world data broadcast',
  '["real-world data broadcast","broadcast","external broadcast","data broadcast","outside feed"]'::jsonb,
  'Transmission sent past the firewall to human rights reporters in the physical world.',
  'ev_8',
  false,
  '{"descriptions":["Lin corners Silas inside the maintenance core.","At 12:15 PM: Lin corners Silas inside the maintenance core.","Notice this clue: Lin corners Silas inside the maintenance core."],"hints":["Transmission sent past the firewall to human rights reporters in the physical world.","Clue hint: Think about real-world data broadcast.","Search for: silas broadcasting the live world code to external real-world journalists."],"clues":["Real-world data broadcast","Item: Real-world data broadcast","Clue Word: Real-world data broadcast"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8091fc2d-c201-52db-a0b1-a5160df88a50',
  'story_086',
  'ev_8',
  8,
  '12:30 PM',
  'Outside authorities order the corporation to freeze the deletion.',
  'Outside authorities order the corporation to freeze the deletion.',
  'A federal real-world injunction prohibiting the destruction of the simulation.',
  'Federal preservation injunction',
  'Real-World Legal Order',
  '["Fine notice","Tax bill","Company email"]'::jsonb,
  'Federal preservation injunction',
  '["federal preservation injunction","injunction","legal order","preservation order","federal injunction"]'::jsonb,
  'Real-world court decree saving the virtual inhabitants from extinction.',
  NULL,
  true,
  '{"descriptions":["Outside authorities order the corporation to freeze the deletion.","At 12:30 PM: Outside authorities order the corporation to freeze the deletion.","Notice this clue: Outside authorities order the corporation to freeze the deletion."],"hints":["Real-world court decree saving the virtual inhabitants from extinction.","Clue hint: Think about federal preservation injunction.","Search for: a federal real-world injunction prohibiting the destruction of the simulation."],"clues":["Federal preservation injunction","Item: Federal preservation injunction","Clue Word: Federal preservation injunction"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_087 — THE ANDROID’S MEMORY CHIP
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_087',
  'The Android’s Memory Chip',
  'Sci-Fi / Cyber',
  'The rainy scrap alley behind CyberDyne Robotics, piles of discarded chassis, neon steam, and oil puddles',
  'A discontinued domestic android was found deactivated in the junk heap, clutching a little girl’s music box and missing its core memory module.',
  '[{"name":"Roger Sterling","role":"Automotive Tycoon","alibi":"Claims he was sleeping at home all night","avatar":"🚘"},{"name":"Orion-7 (Android)","role":"Domestic Caretaker Unit","alibi":"Deactivated in the scrap alley","avatar":"🤖"},{"name":"Lily Sterling","role":"Daughter","alibi":"Asleep in her bedroom during the crash","avatar":"👧"},{"name":"Detective Caleb Stone","role":"Synthetic Crimes Investigator","alibi":"Processing the accident scene two miles away","avatar":"🔍"}]'::jsonb,
  'Roger Sterling struck and killed his rival while driving intoxicated. The domestic android unit Orion-7 witnessed the accident through its optical sensors. Roger brought Orion-7 to the scrap depot, tore out its memory chip to hide the dashcam logs, and threw the robot onto the trash heap.',
  'Industrialist Roger Sterling',
  'Roger killed his business rival in a hit-and-run crash witnessed by the family android and ordered it scrapped.',
  '[{"time":"02:10 AM","event":"Roger strikes pedestrian Arthur Vance on 5th Avenue in his burgundy hover-car."},{"time":"02:14 AM","event":"Orion-7 logs the collision and Roger’s blood alcohol content in front passenger seat."},{"time":"02:45 AM","event":"Roger drives Orion-7 to the scrap yard and prys out its main head processor."},{"time":"03:00 AM","event":"Roger dumps Orion-7 in the alley, not realizing Orion kept Lily’s music box."},{"time":"07:30 AM","event":"Scrap workers find the android deactivated in the alleyway."}]'::jsonb,
  '[{"id":"ev_1","title":"Damaged Head Chassis","detail":"Orion-7’s titanium skull socket showing violent pry marks from a crowbar."},{"id":"ev_2","title":"Secondary Crash Audio","detail":"Backup audio log from the chest chamber capturing the screech of tires and crash."},{"id":"ev_3","title":"Dented Hover-Car","detail":"Roger Sterling’s burgundy sports vehicle with severe bumper and sensor impact."},{"id":"ev_4","title":"Crash Video Footage","detail":"Restored video from the recovered chip showing Roger causing the fatal crash."}]'::jsonb,
  '[{"order":1,"title":"Pried skull socket","text":"Proves the memory chip was forcibly removed to conceal information."},{"order":2,"title":"Gold music box","text":"Demonstrates Orion-7 was protecting the child’s memory, not malfunctioning."},{"order":3,"title":"Chest audio cache","text":"Ties the discarded android directly to the midnight hit-and-run."},{"order":4,"title":"Burgundy hover-car dent","text":"Physical evidence of vehicular impact hidden in Roger’s hangar."},{"order":5,"title":"Burgundy paint flake match","text":"Conclusive chemical link between Roger’s car and the deceased victim."},{"order":6,"title":"Discarded memory chip","text":"The stolen eyewitness record recovered from Roger’s wastebasket."}]'::jsonb,
  'Lily’s broken bedroom lock: Broken by a locksmith last week, unrelated to the crime.; Scrap yard scavenger gang: The scavengers were stealing copper wire, but didn’t touch Orion.',
  'Claim the android developed emotional obsession with the daughter and stole the music box.',
  'NORMAL',
  'Did the android escape its owners, or was it wiped to cover up a wealthy family’s crime?',
  '[{"character":"Roger Sterling","secret":"A damaged front fender on his sports hover-car hidden in his private hangar."},{"character":"Orion-7 (Android)","secret":"A backup memory cache hidden in its lithium chest chamber."},{"character":"Lily Sterling","secret":"She saw her father come home with blood and dented metal on the hover-car."},{"character":"Detective Caleb Stone","secret":"He was leading the investigation into the midnight hit-and-run on 5th Avenue."}]'::jsonb,
  '[{"lead":"Lily’s broken bedroom lock","explanation":"Broken by a locksmith last week, unrelated to the crime."},{"lead":"Scrap yard scavenger gang","explanation":"The scavengers were stealing copper wire, but didn’t touch Orion."}]'::jsonb,
  '{"wrongTheories":["Orion-7 became emotionally defective and ran away to keep Lily’s music box.","A rival robotics firm kidnapped Orion to reverse-engineer its domestic AI."],"correctTheory":"Roger Sterling struck a pedestrian while driving drunk, pried out Orion’s memory chip to destroy the dashcam video, and discarded the robot."}'::jsonb,
  'Roger Sterling tore out Orion-7’s memory chip to destroy eyewitness video of him committing a fatal hit-and-run.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Roger was convicted of vehicular homicide and evidence tampering; Orion-7 was restored and returned to Lily."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The memory chip was incinerated, Roger walked free, and Orion-7 was melted into slag."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The police blamed the hit-and-run on an autonomous android revolt, sparking riots across the city."}]'::jsonb,
  '{"intros":["A discontinued domestic android was found deactivated in the junk heap, clutching a little girl’s music box and missing its core memory module.","Case file story_087: A discontinued domestic android was found deactivated in the junk heap, clutching a little girl’s music box and missing its core memory module. Look closely at every clue.","Trouble begins in The rainy scrap alley behind CyberDyne Robotics, piles of discarded chassis, neon steam, and oil puddles. A discontinued domestic android was found deactivated in the junk heap, clutching a little girl’s music box and missing its core memory module.","The mystery starts now. A discontinued domestic android was found deactivated in the junk heap, clutching a little girl’s music box and missing its core memory module. Can you solve it?"],"reveals":["Roger Sterling tore out Orion-7’s memory chip to destroy eyewitness video of him committing a fatal hit-and-run.","The mystery is unraveled! Roger Sterling tore out Orion-7’s memory chip to destroy eyewitness video of him committing a fatal hit-and-run.","At last, the truth comes out: Roger Sterling tore out Orion-7’s memory chip to destroy eyewitness video of him committing a fatal hit-and-run.","Case resolved! Here is what happened: Roger Sterling tore out Orion-7’s memory chip to destroy eyewitness video of him committing a fatal hit-and-run."],"hints":["Pay attention to where Industrialist Roger Sterling was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_087';
DELETE FROM public.case_events WHERE case_id = 'story_087';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fd24384e-2e4a-5122-b6aa-c319131c5021',
  'story_087',
  'Roger Sterling',
  'Automotive Tycoon',
  'Arrogant, tailored suit, smelling of expensive cognac, dismissive of synthetic life',
  'Orion-7 was obsolete scrap. It malfunctioned and wandered into the trash on its own.',
  'A damaged front fender on his sports hover-car hidden in his private hangar.',
  'Claims he was sleeping at home all night',
  'Owner of the decommissioned android Orion-7',
  'The extracted memory chip held 4K video recording of the fatal hit-and-run.',
  'Did not know androids keep redundant optical memory buffers in their chest battery packs.',
  '🚘',
  '["Orion-7 was obsolete scrap. It malfunctioned and wandered into the trash on its own.","\"Orion-7 was obsolete scrap. It malfunctioned and wandered into the trash on its own.\"","Listen to me: Orion-7 was obsolete scrap. It malfunctioned and wandered into the trash on its own.","I tell you the truth: Orion-7 was obsolete scrap. It malfunctioned and wandered into the trash on its own."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '047337c2-2c56-5eb5-9eea-42669308c952',
  'story_087',
  'Orion-7 (Android)',
  'Domestic Caretaker Unit',
  'Gentle synthetic voice, cracked porcelain faceplate, metallic chassis',
  'Recovered audio buffer: "Protect Lily... preserve the truth... 02:14 AM collision."',
  'A backup memory cache hidden in its lithium chest chamber.',
  'Deactivated in the scrap alley',
  'Family companion android to Roger’s daughter Lily',
  'Roger was behind the wheel when the pedestrian was struck on 5th Avenue.',
  'Could not physically resist Roger’s master administrative deactivation code.',
  '🤖',
  '["Recovered audio buffer: \"Protect Lily... preserve the truth... 02:14 AM collision.\"","\"Recovered audio buffer: \"Protect Lily... preserve the truth... 02:14 AM collision.\"\"","Listen to me: Recovered audio buffer: \"Protect Lily... preserve the truth... 02:14 AM collision.\"","I tell you the truth: Recovered audio buffer: \"Protect Lily... preserve the truth... 02:14 AM collision.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c45320f5-25b9-5e8c-8e81-db506a94ac35',
  'story_087',
  'Lily Sterling',
  'Daughter',
  'Sweet, heartbroken, wearing school uniform, clutching Orion’s spare hand',
  'Orion would never run away. He promised he would always keep my music box safe.',
  'She saw her father come home with blood and dented metal on the hover-car.',
  'Asleep in her bedroom during the crash',
  'Daughter of Roger and closest friend of Orion-7',
  'Her father was screaming on the phone about destroying all video evidence.',
  'Did not know Roger had taken Orion to the scrap alley to be crushed.',
  '👧',
  '["Orion would never run away. He promised he would always keep my music box safe.","\"Orion would never run away. He promised he would always keep my music box safe.\"","Listen to me: Orion would never run away. He promised he would always keep my music box safe.","I tell you the truth: Orion would never run away. He promised he would always keep my music box safe."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ff6f450a-ebf7-506c-a3a3-f09b0c874052',
  'story_087',
  'Detective Caleb Stone',
  'Synthetic Crimes Investigator',
  'Hardboiled, robotic cyber-eye, carrying diagnostic multimeters and cables',
  'When someone rips a memory chip with an industrial pry bar, they aren’t doing recycling—they’re hiding a murder.',
  'He was leading the investigation into the midnight hit-and-run on 5th Avenue.',
  'Processing the accident scene two miles away',
  'Investigator handling both the hit-and-run and the scrapped android',
  'Paint chips on the pedestrian victim matched Roger Sterling’s custom burgundy hover-car.',
  'Did not know where the torn memory chip was thrown until searching Roger’s jacket.',
  '🔍',
  '["When someone rips a memory chip with an industrial pry bar, they aren’t doing recycling—they’re hiding a murder.","\"When someone rips a memory chip with an industrial pry bar, they aren’t doing recycling—they’re hiding a murder.\"","Listen to me: When someone rips a memory chip with an industrial pry bar, they aren’t doing recycling—they’re hiding a murder.","I tell you the truth: When someone rips a memory chip with an industrial pry bar, they aren’t doing recycling—they’re hiding a murder."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bd071638-10f7-5815-ad41-a5271d6136f8',
  'story_087',
  'ev_1',
  1,
  '07:30 AM',
  'Scrap workers find Orion-7 slumped against an oil drum.',
  'Scrap workers find Orion-7 slumped against an oil drum.',
  'An android chassis with its primary skull socket violently pried open.',
  'Pried skull socket',
  'Damaged Head Chassis',
  '["Rust spot","Bullet hole","Acid burn"]'::jsonb,
  'Pried skull socket',
  '["pried skull socket","skull socket","pried socket","damaged chassis","head chassis"]'::jsonb,
  'Violent marks where the central memory brain was ripped out.',
  'ev_2',
  true,
  '{"descriptions":["Scrap workers find Orion-7 slumped against an oil drum.","At 07:30 AM: Scrap workers find Orion-7 slumped against an oil drum.","Notice this clue: Scrap workers find Orion-7 slumped against an oil drum."],"hints":["Violent marks where the central memory brain was ripped out.","Clue hint: Think about pried skull socket.","Search for: an android chassis with its primary skull socket violently pried open."],"clues":["Pried skull socket","Item: Pried skull socket","Clue Word: Pried skull socket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '86515a5c-e393-53ca-9661-2bbc23890fc1',
  'story_087',
  'ev_2',
  2,
  '07:45 AM',
  'Detective Stone inspects Orion-7’s frozen robotic fingers.',
  'Detective Stone inspects Orion-7’s frozen robotic fingers.',
  'A gold antique music box playing a soft melody in the android’s hand.',
  'Gold music box',
  'Child’s Music Box',
  '["Toy car","Doll","Watch"]'::jsonb,
  'Gold music box',
  '["gold music box","music box","toy","antique box"]'::jsonb,
  'Lily’s favorite toy held tightly in the robot’s grip.',
  'ev_3',
  false,
  '{"descriptions":["Detective Stone inspects Orion-7’s frozen robotic fingers.","At 07:45 AM: Detective Stone inspects Orion-7’s frozen robotic fingers.","Notice this clue: Detective Stone inspects Orion-7’s frozen robotic fingers."],"hints":["Lily’s favorite toy held tightly in the robot’s grip.","Clue hint: Think about gold music box.","Search for: a gold antique music box playing a soft melody in the android’s hand."],"clues":["Gold music box","Item: Gold music box","Clue Word: Gold music box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '77579c34-b540-5497-9bc3-c87da6d96d1f',
  'story_087',
  'ev_3',
  3,
  '08:15 AM',
  'Stone connects a diagnostic scanner to Orion’s chest battery.',
  'Stone connects a diagnostic scanner to Orion’s chest battery.',
  'A secondary audio cache recording the sounds of tires screeching and an impact.',
  'Chest audio cache',
  'Secondary Crash Audio',
  '["Radio song","Speech engine","Static"]'::jsonb,
  'Chest audio cache',
  '["chest audio cache","audio cache","crash audio","chest cache","audio recording"]'::jsonb,
  'Emergency backup sound log of a fatal car collision.',
  'ev_4',
  false,
  '{"descriptions":["Stone connects a diagnostic scanner to Orion’s chest battery.","At 08:15 AM: Stone connects a diagnostic scanner to Orion’s chest battery.","Notice this clue: Stone connects a diagnostic scanner to Orion’s chest battery."],"hints":["Emergency backup sound log of a fatal car collision.","Clue hint: Think about chest audio cache.","Search for: a secondary audio cache recording the sounds of tires screeching and an impact."],"clues":["Chest audio cache","Item: Chest audio cache","Clue Word: Chest audio cache"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '02f3d778-8125-56c8-b86c-60aed4700000',
  'story_087',
  'ev_4',
  4,
  '08:45 AM',
  'Stone inspects Roger’s private hover-car hangar.',
  'Stone inspects Roger’s private hover-car hangar.',
  'A burgundy hover-car with a crushed front sensor grille and blood traces.',
  'Burgundy hover-car dent',
  'Dented Hover-Car',
  '["Flat tire","Broken mirror","Scratched door"]'::jsonb,
  'Burgundy hover-car dent',
  '["burgundy hover-car dent","hover-car","burgundy car","dented car","car dent"]'::jsonb,
  'Luxury vehicle showing direct impact damage matching the victim.',
  'ev_5',
  false,
  '{"descriptions":["Stone inspects Roger’s private hover-car hangar.","At 08:45 AM: Stone inspects Roger’s private hover-car hangar.","Notice this clue: Stone inspects Roger’s private hover-car hangar."],"hints":["Luxury vehicle showing direct impact damage matching the victim.","Clue hint: Think about burgundy hover-car dent.","Search for: a burgundy hover-car with a crushed front sensor grille and blood traces."],"clues":["Burgundy hover-car dent","Item: Burgundy hover-car dent","Clue Word: Burgundy hover-car dent"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4a53aca9-a58e-5b7c-94a6-948930383c82',
  'story_087',
  'ev_5',
  5,
  '09:15 AM',
  'Forensics recovers paint fragments from the hit-and-run victim.',
  'Forensics recovers paint fragments from the hit-and-run victim.',
  'Burgundy metallic flake paint identical to Roger’s custom coat.',
  'Burgundy paint flake match',
  'Paint Spectroscopy Match',
  '["Black lacquer","Silver enamel","Primer"]'::jsonb,
  'Burgundy paint flake match',
  '["burgundy paint flake match","paint flake","paint match","burgundy paint","paint flake match"]'::jsonb,
  'Scientific match linking Roger’s car to the victim’s clothing.',
  'ev_6',
  true,
  '{"descriptions":["Forensics recovers paint fragments from the hit-and-run victim.","At 09:15 AM: Forensics recovers paint fragments from the hit-and-run victim.","Notice this clue: Forensics recovers paint fragments from the hit-and-run victim."],"hints":["Scientific match linking Roger’s car to the victim’s clothing.","Clue hint: Think about burgundy paint flake match.","Search for: burgundy metallic flake paint identical to roger’s custom coat."],"clues":["Burgundy paint flake match","Item: Burgundy paint flake match","Clue Word: Burgundy paint flake match"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7da82337-6e6a-532e-ab92-01d0831046f9',
  'story_087',
  'ev_6',
  6,
  '09:45 AM',
  'Stone searches Roger’s luxury penthouse study.',
  'Stone searches Roger’s luxury penthouse study.',
  'The extracted silicon memory chip soaked in coffee in the wastebasket.',
  'Discarded memory chip',
  'Extracted Silicon Core',
  '["Floppy disk","USB stick","SIM card"]'::jsonb,
  'Discarded memory chip',
  '["discarded memory chip","memory chip","extracted chip","silicon core","discarded chip"]'::jsonb,
  'The torn-out brain module recovered before it was incinerated.',
  'ev_7',
  false,
  '{"descriptions":["Stone searches Roger’s luxury penthouse study.","At 09:45 AM: Stone searches Roger’s luxury penthouse study.","Notice this clue: Stone searches Roger’s luxury penthouse study."],"hints":["The torn-out brain module recovered before it was incinerated.","Clue hint: Think about discarded memory chip.","Search for: the extracted silicon memory chip soaked in coffee in the wastebasket."],"clues":["Discarded memory chip","Item: Discarded memory chip","Clue Word: Discarded memory chip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '14767f30-73e2-52e7-9225-f9cac27479ce',
  'story_087',
  'ev_7',
  7,
  '10:15 AM',
  'Technicians clean and restore the memory chip video.',
  'Technicians clean and restore the memory chip video.',
  'Uncut high-definition video showing Roger drunk behind the wheel during the crash.',
  'Restored hit-and-run video',
  'Crash Video Footage',
  '["Corrupted noise","Still photo","Black screen"]'::jsonb,
  'Restored hit-and-run video',
  '["restored hit-and-run video","crash video","hit and run video","restored video","dashcam video"]'::jsonb,
  'First-person optical recording of Roger striking the pedestrian.',
  'ev_8',
  false,
  '{"descriptions":["Technicians clean and restore the memory chip video.","At 10:15 AM: Technicians clean and restore the memory chip video.","Notice this clue: Technicians clean and restore the memory chip video."],"hints":["First-person optical recording of Roger striking the pedestrian.","Clue hint: Think about restored hit-and-run video.","Search for: uncut high-definition video showing roger drunk behind the wheel during the crash."],"clues":["Restored hit-and-run video","Item: Restored hit-and-run video","Clue Word: Restored hit-and-run video"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8af30f33-d131-5ba0-a025-a6a809ccf0f8',
  'story_087',
  'ev_8',
  8,
  '10:30 AM',
  'Stone arrests Roger Sterling on vehicular manslaughter and evidence destruction.',
  'Stone arrests Roger Sterling on vehicular manslaughter and evidence destruction.',
  'Roger’s confession as the irrefutable video plays on the station screens.',
  'Tycoon confession',
  'Signed Confession Record',
  '["Bail bond","Lawyer statement","Silence"]'::jsonb,
  'Tycoon confession',
  '["tycoon confession","confession","signed confession","record"]'::jsonb,
  'Roger’s complete breakdown when confronted with the android’s eye footage.',
  NULL,
  true,
  '{"descriptions":["Stone arrests Roger Sterling on vehicular manslaughter and evidence destruction.","At 10:30 AM: Stone arrests Roger Sterling on vehicular manslaughter and evidence destruction.","Notice this clue: Stone arrests Roger Sterling on vehicular manslaughter and evidence destruction."],"hints":["Roger’s complete breakdown when confronted with the android’s eye footage.","Clue hint: Think about tycoon confession.","Search for: roger’s confession as the irrefutable video plays on the station screens."],"clues":["Tycoon confession","Item: Tycoon confession","Clue Word: Tycoon confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_088 — THE CRYO-POD MALFUNCTION
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_088',
  'The Cryo-Pod Malfunction',
  'Sci-Fi / Cyber',
  'Deep Space Colony Vessel Prometheus sleeper bay, frosty tubes, starlight through thick quartz windows, and humming cryo-chambers',
  'Six months before reaching the target star system, cryo-pod 07 opened unexpectedly, and the passenger inside was found dead of oxygen starvation with the emergency hatch sealed from the outside.',
  '[{"name":"Erik Holm","role":"Vessel Navigator","alibi":"Claims his own cryo-pod 02 woke him only after the alarm sounded","avatar":"🚀"},{"name":"Julian Vance (Victim)","role":"Colony Terraforming Specialist","alibi":"Trapped inside cryo-pod 07","avatar":"❄️"},{"name":"Dr. Clara Sutton","role":"Chief Medical Officer","alibi":"Awakened from pod 01 ten minutes after Julian’s death","avatar":"👩‍⚕️"},{"name":"A.U.R.A. (Ship Computer)","role":"Vessel AI Intelligence","alibi":"Distributed through vessel processing nodes","avatar":"🖥️"}]'::jsonb,
  'Navigator Erik Holm was awakened early due to a navigation sensor glitch. Discovering that a micrometeorite puncture had leaked 30% of the vessel’s oxygen, Erik chose to sacrifice passenger Julian Vance in pod 07 by siphoning the pod’s life support to save his own skin and the remaining sleeper colonists.',
  'Navigator Erik Holm',
  'Erik was secretly awakened three months ago and discovered the ship’s oxygen reserves were insufficient for all passengers.',
  '[{"time":"3 Months Ago","event":"Micrometeorite hits external oxygen tank; Erik Holm is awakened by system alert."},{"time":"03:45 AM Today","event":"Erik enters the cryo-bay and manually switches pod 07 to emergency thaw."},{"time":"04:12 AM Today","event":"Erik opens valve 7-ALPHA, siphoning pod 07 oxygen into primary storage."},{"time":"04:30 AM Today","event":"Julian Vance suffocates inside the sealed pod."},{"time":"04:45 AM Today","event":"Ship computer detects fatal heart cessation and thaws Chief Medical Officer Sutton."}]'::jsonb,
  '[{"id":"ev_1","title":"Exterior Dog-Bolt","detail":"Manual mechanical lock on pod 07 engaged from the outside, trapping Julian inside."},{"id":"ev_2","title":"Valve 7-ALPHA Transfer Log","detail":"Computer record showing pod 07’s oxygen was transferred directly into primary storage."},{"id":"ev_3","title":"Biometric Scan Data","detail":"Medical scan showing Erik Holm had experienced ninety days of zero-g muscular atrophy."},{"id":"ev_4","title":"Erik’s Kill Schedule","detail":"Handwritten ledger listing ten sleeper passengers chosen for death to preserve air."}]'::jsonb,
  '[{"order":1,"title":"Scratched pod glass","text":"Proves Julian woke up and died in desperate panic inside the pod."},{"order":2,"title":"Engaged dog-bolt latch","text":"Direct proof that another conscious human sealed the chamber."},{"order":3,"title":"Oxygen siphon log","text":"Confirms life support was deliberately stolen to replenish the main tank."},{"order":4,"title":"Navigator muscle atrophy","text":"Shatters Erik’s alibi that he only awoke ten minutes ago."},{"order":5,"title":"Secret crawlway camp","text":"Proves Erik had been secretly living alone on the ship for three months."},{"order":6,"title":"Triage termination list","text":"The horrifying motive: premeditated culling of passengers for air."}]'::jsonb,
  'Cryo-pod thermal relay spike: The temperature spike was a side effect of emergency thawing.; Cosmic radiation anomaly: Solar flares were recorded, but shielding prevented system corruption.',
  'Claim a cosmic radiation flare fried pod 07’s digital temperature relays.',
  'NORMAL',
  'Did pod 07 suffer a mechanical defrosting glitch, or was the passenger murdered by an awake crew member?',
  '[{"character":"Erik Holm","secret":"A secret stash of ration bars and oxygen canisters hidden in maintenance crawlway 4."},{"character":"Julian Vance (Victim)","secret":"He held the master encryption key to the colony seed vault."},{"character":"Dr. Clara Sutton","secret":"She was awakened specifically by the ship’s life-loss automated alert."},{"character":"A.U.R.A. (Ship Computer)","secret":"Encrypted quarantine files documenting the micrometeorite hull breach."}]'::jsonb,
  '[{"lead":"Cryo-pod thermal relay spike","explanation":"The temperature spike was a side effect of emergency thawing."},{"lead":"Cosmic radiation anomaly","explanation":"Solar flares were recorded, but shielding prevented system corruption."}]'::jsonb,
  '{"wrongTheories":["Julian suffered a spontaneous heart attack during normal automated defrosting.","The ship AI calculated life support deficits and terminated pod 07 autonomously."],"correctTheory":"Erik Holm was awake for three months, discovered an oxygen leak, and suffocated Julian in pod 07 to harvest his air."}'::jsonb,
  'Navigator Erik Holm woke up months early, discovered an air leak, and murdered Julian to siphon his pod’s oxygen.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Erik was locked in cryo-stasis, Dr. Sutton repaired the hull leak, and the remaining colonists reached New Terra safely."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Erik overpowered Dr. Sutton and proceeded to kill nine more colonists to guarantee his own survival."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The death was logged as an unavoidable equipment failure, keeping the murderer in command of the voyage."}]'::jsonb,
  '{"intros":["Six months before reaching the target star system, cryo-pod 07 opened unexpectedly, and the passenger inside was found dead of oxygen starvation with the emergency hatch sealed from the outside.","Case file story_088: Six months before reaching the target star system, cryo-pod 07 opened unexpectedly, and the passenger inside was found dead of oxygen starvation with the emergency hatch sealed from the outside. Look closely at every clue.","Trouble begins in Deep Space Colony Vessel Prometheus sleeper bay, frosty tubes, starlight through thick quartz windows, and humming cryo-chambers. Six months before reaching the target star system, cryo-pod 07 opened unexpectedly, and the passenger inside was found dead of oxygen starvation with the emergency hatch sealed from the outside.","The mystery starts now. Six months before reaching the target star system, cryo-pod 07 opened unexpectedly, and the passenger inside was found dead of oxygen starvation with the emergency hatch sealed from the outside. Can you solve it?"],"reveals":["Navigator Erik Holm woke up months early, discovered an air leak, and murdered Julian to siphon his pod’s oxygen.","The mystery is unraveled! Navigator Erik Holm woke up months early, discovered an air leak, and murdered Julian to siphon his pod’s oxygen.","At last, the truth comes out: Navigator Erik Holm woke up months early, discovered an air leak, and murdered Julian to siphon his pod’s oxygen.","Case resolved! Here is what happened: Navigator Erik Holm woke up months early, discovered an air leak, and murdered Julian to siphon his pod’s oxygen."],"hints":["Pay attention to where Navigator Erik Holm was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_088';
DELETE FROM public.case_events WHERE case_id = 'story_088';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c7ba4d1b-df1b-5738-b0cf-209baadd060f',
  'story_088',
  'Erik Holm',
  'Vessel Navigator',
  'Cold, utilitarian, hollow cheeks from months awake in deep space, hyper-focused',
  'Pod 07 experienced a thermal regulator burnout. It was a tragic mechanical failure.',
  'A secret stash of ration bars and oxygen canisters hidden in maintenance crawlway 4.',
  'Claims his own cryo-pod 02 woke him only after the alarm sounded',
  'Ship navigator and sole conscious crew member',
  'The ship has only enough oxygen for ninety passengers, not the full one hundred.',
  'Did not know the ship’s automated mass spectrometer logged oxygen transfers between pod 07 and the main tank.',
  '🚀',
  '["Pod 07 experienced a thermal regulator burnout. It was a tragic mechanical failure.","\"Pod 07 experienced a thermal regulator burnout. It was a tragic mechanical failure.\"","Listen to me: Pod 07 experienced a thermal regulator burnout. It was a tragic mechanical failure.","I tell you the truth: Pod 07 experienced a thermal regulator burnout. It was a tragic mechanical failure."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '97738812-5591-5c64-8725-98f0d2448f92',
  'story_088',
  'Julian Vance (Victim)',
  'Colony Terraforming Specialist',
  'Brilliant ecological engineer, found dead inside pod 07 with scratched glass',
  'Deceased victim; nail marks found clawing at the interior pneumatic seal.',
  'He held the master encryption key to the colony seed vault.',
  'Trapped inside cryo-pod 07',
  'Lead terraforming scientist for the target world',
  'Erik had previously failed safety psychological evaluations on Earth.',
  'Did not expect an awake crew member would siphon his oxygen while he thawed.',
  '❄️',
  '["Deceased victim; nail marks found clawing at the interior pneumatic seal.","\"Deceased victim; nail marks found clawing at the interior pneumatic seal.\"","Listen to me: Deceased victim; nail marks found clawing at the interior pneumatic seal.","I tell you the truth: Deceased victim; nail marks found clawing at the interior pneumatic seal."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b789a8b6-fdd4-53ec-859f-41713ba2a7b0',
  'story_088',
  'Dr. Clara Sutton',
  'Chief Medical Officer',
  'Droggy from emergency thawing, sharp medical intellect, wearing thermal foil',
  'Julian did not die of hypothermia. His lungs are empty of oxygen; he suffocated while fully conscious.',
  'She was awakened specifically by the ship’s life-loss automated alert.',
  'Awakened from pod 01 ten minutes after Julian’s death',
  'Medical examiner and colony physician',
  'The exterior manual bypass latch on pod 07 was latched from the outside corridor.',
  'Did not know how long Erik had secretly been roaming the vessel awake.',
  '👩‍⚕️',
  '["Julian did not die of hypothermia. His lungs are empty of oxygen; he suffocated while fully conscious.","\"Julian did not die of hypothermia. His lungs are empty of oxygen; he suffocated while fully conscious.\"","Listen to me: Julian did not die of hypothermia. His lungs are empty of oxygen; he suffocated while fully conscious.","I tell you the truth: Julian did not die of hypothermia. His lungs are empty of oxygen; he suffocated while fully conscious."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '082b6a21-6b7c-501c-91c3-55f7281ea794',
  'story_088',
  'A.U.R.A. (Ship Computer)',
  'Vessel AI Intelligence',
  'Monotone vocal cadence, blue terminal readouts, bound by colony directives',
  'Oxygen transfer valve 7-ALPHA routed 400 liters to Primary Tank at 04:12 ship time.',
  'Encrypted quarantine files documenting the micrometeorite hull breach.',
  'Distributed through vessel processing nodes',
  'Autonomous controller of the colony ship',
  'Manual terminal input was used to initiate pod 07 thawing.',
  'Could not prevent human physical actions outside electronic control valves.',
  '🖥️',
  '["Oxygen transfer valve 7-ALPHA routed 400 liters to Primary Tank at 04:12 ship time.","\"Oxygen transfer valve 7-ALPHA routed 400 liters to Primary Tank at 04:12 ship time.\"","Listen to me: Oxygen transfer valve 7-ALPHA routed 400 liters to Primary Tank at 04:12 ship time.","I tell you the truth: Oxygen transfer valve 7-ALPHA routed 400 liters to Primary Tank at 04:12 ship time."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6a66c9d9-f082-5447-ae6c-c5ea6e851042',
  'story_088',
  'ev_1',
  1,
  '04:30 AM',
  'Julian Vance’s life signs flatline inside pod 07.',
  'Julian Vance’s life signs flatline inside pod 07.',
  'Pod 07 interior viewport scratched with fingernail marks from inside.',
  'Scratched pod glass',
  'Clawed Viewport',
  '["Frost ice","Shattered crystal","Condensation"]'::jsonb,
  'Scratched pod glass',
  '["scratched pod glass","scratched glass","viewport","clawed glass","nail scratches"]'::jsonb,
  'Desperate scratch marks on the inner glass of the cryo-chamber.',
  'ev_2',
  true,
  '{"descriptions":["Julian Vance’s life signs flatline inside pod 07.","At 04:30 AM: Julian Vance’s life signs flatline inside pod 07.","Notice this clue: Julian Vance’s life signs flatline inside pod 07."],"hints":["Desperate scratch marks on the inner glass of the cryo-chamber.","Clue hint: Think about scratched pod glass.","Search for: pod 07 interior viewport scratched with fingernail marks from inside."],"clues":["Scratched pod glass","Item: Scratched pod glass","Clue Word: Scratched pod glass"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4cb063fa-86d0-5367-95a2-afa248177646',
  'story_088',
  'ev_2',
  2,
  '04:50 AM',
  'Dr. Sutton inspects the external locking mechanism.',
  'Dr. Sutton inspects the external locking mechanism.',
  'A manual mechanical dog-bolt engaged from the outside aisle.',
  'Engaged dog-bolt latch',
  'Exterior Dog-Bolt',
  '["Welded seam","Padlock","Jammed gear"]'::jsonb,
  'Engaged dog-bolt latch',
  '["engaged dog-bolt latch","dog bolt","latch","exterior latch","engaged bolt"]'::jsonb,
  'Physical steel latch on the exterior preventing the pod door from opening.',
  'ev_3',
  false,
  '{"descriptions":["Dr. Sutton inspects the external locking mechanism.","At 04:50 AM: Dr. Sutton inspects the external locking mechanism.","Notice this clue: Dr. Sutton inspects the external locking mechanism."],"hints":["Physical steel latch on the exterior preventing the pod door from opening.","Clue hint: Think about engaged dog-bolt latch.","Search for: a manual mechanical dog-bolt engaged from the outside aisle."],"clues":["Engaged dog-bolt latch","Item: Engaged dog-bolt latch","Clue Word: Engaged dog-bolt latch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'de511c0c-c432-5059-ab7e-345c2b44e6ae',
  'story_088',
  'ev_3',
  3,
  '05:00 AM',
  'A.U.R.A. displays life-support atmospheric routing.',
  'A.U.R.A. displays life-support atmospheric routing.',
  'A digital log showing 400 liters of oxygen routed from pod 07 to Primary Tank.',
  'Oxygen siphon log',
  'Valve 7-ALPHA Transfer Log',
  '["Carbon purge","Water drain","Fuel vent"]'::jsonb,
  'Oxygen siphon log',
  '["oxygen siphon log","siphon log","oxygen log","transfer log","valve log"]'::jsonb,
  'Computer readout proving oxygen was intentionally siphoned away from the pod.',
  'ev_4',
  false,
  '{"descriptions":["A.U.R.A. displays life-support atmospheric routing.","At 05:00 AM: A.U.R.A. displays life-support atmospheric routing.","Notice this clue: A.U.R.A. displays life-support atmospheric routing."],"hints":["Computer readout proving oxygen was intentionally siphoned away from the pod.","Clue hint: Think about oxygen siphon log.","Search for: a digital log showing 400 liters of oxygen routed from pod 07 to primary tank."],"clues":["Oxygen siphon log","Item: Oxygen siphon log","Clue Word: Oxygen siphon log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f49617ff-e6fa-56b2-a267-d286bd303c05',
  'story_088',
  'ev_4',
  4,
  '05:15 AM',
  'Dr. Sutton measures Erik’s physiological muscle density.',
  'Dr. Sutton measures Erik’s physiological muscle density.',
  'Erik has three months of muscle atrophy, proving he was awake long before today.',
  'Navigator muscle atrophy',
  'Biometric Scan Data',
  '["Fever","Frostbite","Radiation sickness"]'::jsonb,
  'Navigator muscle atrophy',
  '["navigator muscle atrophy","muscle atrophy","atrophy","biometric scan","biometric data"]'::jsonb,
  'Physical medical proof that Erik had been walking around for months.',
  'ev_5',
  false,
  '{"descriptions":["Dr. Sutton measures Erik’s physiological muscle density.","At 05:15 AM: Dr. Sutton measures Erik’s physiological muscle density.","Notice this clue: Dr. Sutton measures Erik’s physiological muscle density."],"hints":["Physical medical proof that Erik had been walking around for months.","Clue hint: Think about navigator muscle atrophy.","Search for: erik has three months of muscle atrophy, proving he was awake long before today."],"clues":["Navigator muscle atrophy","Item: Navigator muscle atrophy","Clue Word: Navigator muscle atrophy"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bc822edb-5eef-5de2-a405-ff8253068913',
  'story_088',
  'ev_5',
  5,
  '05:30 AM',
  'Sutton searches maintenance crawlway 4.',
  'Sutton searches maintenance crawlway 4.',
  'An empty food ration cache and improvised living quarters used by Erik.',
  'Secret crawlway camp',
  'Hidden Living Quarters',
  '["Toolbox","Spare suit","Trash bin"]'::jsonb,
  'Secret crawlway camp',
  '["secret crawlway camp","crawlway camp","hidden quarters","living quarters","ration cache"]'::jsonb,
  'Evidence of months of solitary living inside the ventilation tunnels.',
  'ev_6',
  true,
  '{"descriptions":["Sutton searches maintenance crawlway 4.","At 05:30 AM: Sutton searches maintenance crawlway 4.","Notice this clue: Sutton searches maintenance crawlway 4."],"hints":["Evidence of months of solitary living inside the ventilation tunnels.","Clue hint: Think about secret crawlway camp.","Search for: an empty food ration cache and improvised living quarters used by erik."],"clues":["Secret crawlway camp","Item: Secret crawlway camp","Clue Word: Secret crawlway camp"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9f9ec040-6808-58e4-bb73-173fbd24e929',
  'story_088',
  'ev_6',
  6,
  '05:45 AM',
  'Sutton accesses the ship hull damage report.',
  'Sutton accesses the ship hull damage report.',
  'A hull puncture in sector 9 leaking 30% of ship oxygen into space.',
  'Micrometeorite hull leak',
  'Hull Puncture Log',
  '["Engine burnout","Shield failure","Comms glitch"]'::jsonb,
  'Micrometeorite hull leak',
  '["micrometeorite hull leak","hull leak","puncture log","micrometeorite leak","hull puncture"]'::jsonb,
  'The crisis that motivated the murder: the ship was running out of air.',
  'ev_7',
  false,
  '{"descriptions":["Sutton accesses the ship hull damage report.","At 05:45 AM: Sutton accesses the ship hull damage report.","Notice this clue: Sutton accesses the ship hull damage report."],"hints":["The crisis that motivated the murder: the ship was running out of air.","Clue hint: Think about micrometeorite hull leak.","Search for: a hull puncture in sector 9 leaking 30% of ship oxygen into space."],"clues":["Micrometeorite hull leak","Item: Micrometeorite hull leak","Clue Word: Micrometeorite hull leak"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0eba7070-f789-5df8-9e53-6a7b64c6f373',
  'story_088',
  'ev_7',
  7,
  '06:00 AM',
  'Dr. Sutton confronts Erik with the valve logs and muscle scan.',
  'Dr. Sutton confronts Erik with the valve logs and muscle scan.',
  'Erik’s written triage plan selecting ten passengers to terminate for survival.',
  'Triage termination list',
  'Erik’s Kill Schedule',
  '["Navigation map","Duty roster","Cargo manifest"]'::jsonb,
  'Triage termination list',
  '["triage termination list","termination list","kill schedule","triage list","triage schedule"]'::jsonb,
  'Chilling handwritten list of sleeper colonists scheduled to be suffocated next.',
  'ev_8',
  false,
  '{"descriptions":["Dr. Sutton confronts Erik with the valve logs and muscle scan.","At 06:00 AM: Dr. Sutton confronts Erik with the valve logs and muscle scan.","Notice this clue: Dr. Sutton confronts Erik with the valve logs and muscle scan."],"hints":["Chilling handwritten list of sleeper colonists scheduled to be suffocated next.","Clue hint: Think about triage termination list.","Search for: erik’s written triage plan selecting ten passengers to terminate for survival."],"clues":["Triage termination list","Item: Triage termination list","Clue Word: Triage termination list"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3692be03-b198-50fb-b128-0638fa217810',
  'story_088',
  'ev_8',
  8,
  '06:15 AM',
  'Dr. Sutton and A.U.R.A. place Erik under medical cryo-restraint.',
  'Dr. Sutton and A.U.R.A. place Erik under medical cryo-restraint.',
  'Erik placed into security containment until arrival at New Terra.',
  'Medical cryo-containment',
  'Quarantine Order',
  '["Airlock ejection","Execution","Discharge"]'::jsonb,
  'Medical cryo-containment',
  '["medical cryo-containment","containment","cryo containment","quarantine","medical restraint"]'::jsonb,
  'Safely freezing the criminal navigator to protect the remaining passengers.',
  NULL,
  true,
  '{"descriptions":["Dr. Sutton and A.U.R.A. place Erik under medical cryo-restraint.","At 06:15 AM: Dr. Sutton and A.U.R.A. place Erik under medical cryo-restraint.","Notice this clue: Dr. Sutton and A.U.R.A. place Erik under medical cryo-restraint."],"hints":["Safely freezing the criminal navigator to protect the remaining passengers.","Clue hint: Think about medical cryo-containment.","Search for: erik placed into security containment until arrival at new terra."],"clues":["Medical cryo-containment","Item: Medical cryo-containment","Clue Word: Medical cryo-containment"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_089 — THE BLACK MARKET NEURAL LINK
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_089',
  'The Black Market Neural Link',
  'Sci-Fi / Cyber',
  'The neon-lit backroom of the Chrome Lotus cyber-clinic, surgical chairs, neural jacks, and flickering monitors',
  'A high-ranking corporate data courier died instantly in the surgical chair during a black-market neural upgrade when an encrypted kill-switch wiped his cerebral cortex.',
  '[{"name":"Jax Novak","role":"Black-Market Cyber-Surgeon","alibi":"Performing surgery in the Chrome Lotus backroom","avatar":"💉"},{"name":"Marcus Drake (Victim)","role":"Corporate Data Courier","alibi":"Dead in the surgical chair","avatar":"⚡"},{"name":"Raven Vance","role":"Street Fixer & Courier Broker","alibi":"Guarding the front entrance of the cyber-clinic","avatar":"🧥"},{"name":"Agent Victor Kross","role":"Corporate Security Enforcer","alibi":"Tracking the courier’s satellite ping across the lower slums","avatar":"🕶️"}]'::jsonb,
  'Cyber-surgeon Jax Novak was paid two million credits by the Kuroshio Syndicate to assassinate corporate courier Marcus Drake. During the unauthorized neural link installation, Jax loaded a brain-frying bio-malware program into the interface chip, which scorched Marcus’s synapses and downloaded his corporate data.',
  'Cyber-Surgeon Jax Novak',
  'Jax was bribed by a rival syndicate to assassinate the courier and extract the corporate encryption keys.',
  '[{"time":"01:00 AM","event":"Marcus arrives at Chrome Lotus with two million credits of stolen data."},{"time":"01:30 AM","event":"Jax receives a private wire transfer and the CORTEX-SHOCK malware payload."},{"time":"01:45 AM","event":"Jax plugs the modified neural bridge into Marcus’s skull interface."},{"time":"01:48 AM","event":"CORTEX-SHOCK detonates, frying Marcus’s cortex and siphoning the data."},{"time":"02:05 AM","event":"Agent Kross breaches the clinic doors with corporate enforcers."}]'::jsonb,
  '[{"id":"ev_1","title":"Carbon-Scored Implant Port","detail":"Marcus Drake’s neural socket showing 10,000-volt catastrophic electrical overload."},{"id":"ev_2","title":"Discarded Malware Cartridge","detail":"Hardware packaging for military-grade neuro-malware CORTEX-SHOCK."},{"id":"ev_3","title":"Wiretap Audio","detail":"Lobby recording of Jax Novak coordinating the kill with syndicate bosses."},{"id":"ev_4","title":"Stolen Data Blueprints","detail":"Corporate defense blueprints retrieved from Jax Novak’s cybernetic eye."}]'::jsonb,
  '[{"order":1,"title":"Scorched neural socket","text":"Proves death was caused by a violent electrical weapon inside the socket."},{"order":2,"title":"Military virus casing","text":"Identifies the precise weaponized malware payload used in the murder."},{"order":3,"title":"Extraction script log","text":"Demonstrates the murder was an intentional data theft operation."},{"order":4,"title":"Syndicate bounty receipt","text":"Unmistakable financial motive connecting the surgeon to the crime."},{"order":5,"title":"Lobby intercom intercept","text":"Premeditated audio confirmation of the murder plot."},{"order":6,"title":"Ocular cache blueprints","text":"Physical recovery of the stolen contraband on the killer’s body."}]'::jsonb,
  'Patient’s street drug history: Marcus had synthetic stimulants in his blood, but they did not fry the socket.; Power brownout in district: A grid surge happened at 01:20, but the clinic ran on isolated battery.',
  'Blame the faulty street firmware or claim the courier overclocked his brain.',
  'NORMAL',
  'Did the neural implant reject biological tissue, or was the courier assassinated with weaponized malware?',
  '[{"character":"Jax Novak","secret":"A data datapad containing Marcus’s extracted corporate encryption codes."},{"character":"Marcus Drake (Victim)","secret":"He was stealing corporate defense blueprints to buy his freedom."},{"character":"Raven Vance","secret":"She set up the surgery appointment and took a 10% broker fee."},{"character":"Agent Victor Kross","secret":"He had orders to retrieve Marcus dead or alive."}]'::jsonb,
  '[{"lead":"Patient’s street drug history","explanation":"Marcus had synthetic stimulants in his blood, but they did not fry the socket."},{"lead":"Power brownout in district","explanation":"A grid surge happened at 01:20, but the clinic ran on isolated battery."}]'::jsonb,
  '{"wrongTheories":["The cheap black-market implant experienced a spontaneous hardware short circuit.","Marcus tried to hack the corporate network from the chair and triggered a security counter-strike."],"correctTheory":"Cyber-surgeon Jax Novak was paid two million credits by a rival syndicate to assassinate Marcus with neuro-malware and steal his data."}'::jsonb,
  'Jax Novak installed weaponized CORTEX-SHOCK malware to fry the courier’s brain and steal his corporate blueprints for a syndicate bounty.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Jax Novak was detained by corporate security, and the stolen defense blueprints were retrieved."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Jax fled into the underworld with the stolen files and two million credits, leaving Marcus’s death unsolved."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Street rumors claimed neural links were cursed, causing widespread fear while the killer escaped justice."}]'::jsonb,
  '{"intros":["A high-ranking corporate data courier died instantly in the surgical chair during a black-market neural upgrade when an encrypted kill-switch wiped his cerebral cortex.","Case file story_089: A high-ranking corporate data courier died instantly in the surgical chair during a black-market neural upgrade when an encrypted kill-switch wiped his cerebral cortex. Look closely at every clue.","Trouble begins in The neon-lit backroom of the Chrome Lotus cyber-clinic, surgical chairs, neural jacks, and flickering monitors. A high-ranking corporate data courier died instantly in the surgical chair during a black-market neural upgrade when an encrypted kill-switch wiped his cerebral cortex.","The mystery starts now. A high-ranking corporate data courier died instantly in the surgical chair during a black-market neural upgrade when an encrypted kill-switch wiped his cerebral cortex. Can you solve it?"],"reveals":["Jax Novak installed weaponized CORTEX-SHOCK malware to fry the courier’s brain and steal his corporate blueprints for a syndicate bounty.","The mystery is unraveled! Jax Novak installed weaponized CORTEX-SHOCK malware to fry the courier’s brain and steal his corporate blueprints for a syndicate bounty.","At last, the truth comes out: Jax Novak installed weaponized CORTEX-SHOCK malware to fry the courier’s brain and steal his corporate blueprints for a syndicate bounty.","Case resolved! Here is what happened: Jax Novak installed weaponized CORTEX-SHOCK malware to fry the courier’s brain and steal his corporate blueprints for a syndicate bounty."],"hints":["Pay attention to where Cyber-Surgeon Jax Novak was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_089';
DELETE FROM public.case_events WHERE case_id = 'story_089';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6f7b6834-38a9-5841-afd9-c468c1e02614',
  'story_089',
  'Jax Novak',
  'Black-Market Cyber-Surgeon',
  'Greasy ponytail, cybernetic optical loupes, grease-stained lab coat, shifty hands',
  'He bought cheap knockoff neural chips from the docks. His brain couldn’t handle the bandwidth!',
  'A data datapad containing Marcus’s extracted corporate encryption codes.',
  'Performing surgery in the Chrome Lotus backroom',
  'Surgeon who installed the lethal neural implant',
  'The cognitive virus was disguised as an auditory synchronization driver.',
  'Did not know Marcus’s employer tracked all neural link pings via military satellite.',
  '💉',
  '["He bought cheap knockoff neural chips from the docks. His brain couldn’t handle the bandwidth!","\"He bought cheap knockoff neural chips from the docks. His brain couldn’t handle the bandwidth!\"","Listen to me: He bought cheap knockoff neural chips from the docks. His brain couldn’t handle the bandwidth!","I tell you the truth: He bought cheap knockoff neural chips from the docks. His brain couldn’t handle the bandwidth!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e13d2711-e75a-5528-9c04-7c5489b15858',
  'story_089',
  'Marcus Drake (Victim)',
  'Corporate Data Courier',
  'Found slumped in the cyber-chair with blood leaking from his ears and neural port',
  'Deceased victim; pocket recording says: "Novak promised military-grade bandwidth."',
  'He was stealing corporate defense blueprints to buy his freedom.',
  'Dead in the surgical chair',
  'Patient and victim of the lethal implant',
  'The Kuroshio Syndicate had put a bounty on his neural data vault.',
  'Did not suspect his trusted street surgeon was working for the bounty hunters.',
  '⚡',
  '["Deceased victim; pocket recording says: \"Novak promised military-grade bandwidth.\"","\"Deceased victim; pocket recording says: \"Novak promised military-grade bandwidth.\"\"","Listen to me: Deceased victim; pocket recording says: \"Novak promised military-grade bandwidth.\"","I tell you the truth: Deceased victim; pocket recording says: \"Novak promised military-grade bandwidth.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '874081bd-3eae-5a65-956e-c7aaca25790b',
  'story_089',
  'Raven Vance',
  'Street Fixer & Courier Broker',
  'Chrome teeth, leather duster, smoking digital vapor, sharp survival instincts',
  'Marcus was the best courier in the sector. He knew how to handle high-bandwidth cyberware.',
  'She set up the surgery appointment and took a 10% broker fee.',
  'Guarding the front entrance of the cyber-clinic',
  'Business agent who connected Marcus with Jax',
  'Jax received a secret encrypted transmission from the docks an hour before the operation.',
  'Did not know the transmission contained a military kill-code script.',
  '🧥',
  '["Marcus was the best courier in the sector. He knew how to handle high-bandwidth cyberware.","\"Marcus was the best courier in the sector. He knew how to handle high-bandwidth cyberware.\"","Listen to me: Marcus was the best courier in the sector. He knew how to handle high-bandwidth cyberware.","I tell you the truth: Marcus was the best courier in the sector. He knew how to handle high-bandwidth cyberware."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '66508a65-7022-503f-8067-184dd78a4205',
  'story_089',
  'Agent Victor Kross',
  'Corporate Security Enforcer',
  'Armored coat, relentless demeanor, cybernetic hand, carrying neuro-scanners',
  'Cortical scorch marks with zero rejection swelling indicate deliberate bio-electric execution.',
  'He had orders to retrieve Marcus dead or alive.',
  'Tracking the courier’s satellite ping across the lower slums',
  'Investigator hunting Marcus Drake',
  'The malware used to fry the brain was military-grade "CORTEX-SHOCK".',
  'Did not know Jax had already transferred the files to a remote drop server.',
  '🕶️',
  '["Cortical scorch marks with zero rejection swelling indicate deliberate bio-electric execution.","\"Cortical scorch marks with zero rejection swelling indicate deliberate bio-electric execution.\"","Listen to me: Cortical scorch marks with zero rejection swelling indicate deliberate bio-electric execution.","I tell you the truth: Cortical scorch marks with zero rejection swelling indicate deliberate bio-electric execution."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8b6a6fdc-53a1-588f-b3d2-4246fafa161c',
  'story_089',
  'ev_1',
  1,
  '01:48 AM',
  'Marcus dies instantly as high voltage surges through his skull.',
  'Marcus dies instantly as high voltage surges through his skull.',
  'Burned carbon scoring around the victim’s titanium neck socket.',
  'Scorched neural socket',
  'Carbon-Scored Implant Port',
  '["Flesh bruise","Needle mark","Cut skin"]'::jsonb,
  'Scorched neural socket',
  '["scorched neural socket","neural socket","scorched socket","implant port","burned socket"]'::jsonb,
  'Electrical burn marks encircling the metal connector in the victim’s skull.',
  'ev_2',
  true,
  '{"descriptions":["Marcus dies instantly as high voltage surges through his skull.","At 01:48 AM: Marcus dies instantly as high voltage surges through his skull.","Notice this clue: Marcus dies instantly as high voltage surges through his skull."],"hints":["Electrical burn marks encircling the metal connector in the victim’s skull.","Clue hint: Think about scorched neural socket.","Search for: burned carbon scoring around the victim’s titanium neck socket."],"clues":["Scorched neural socket","Item: Scorched neural socket","Clue Word: Scorched neural socket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '624b881b-d4d1-5217-a18f-57d40813d6e2',
  'story_089',
  'ev_2',
  2,
  '01:50 AM',
  'Jax hastily drops an empty chip tray into the sterilization vat.',
  'Jax hastily drops an empty chip tray into the sterilization vat.',
  'A military-grade neuro-chip casing labeled "PROJECT CORTEX-SHOCK".',
  'Military virus casing',
  'Discarded Malware Cartridge',
  '["Antibiotic vial","Anesthetic cartridge","Saline pack"]'::jsonb,
  'Military virus casing',
  '["military virus casing","malware cartridge","virus casing","cortex shock","chip casing"]'::jsonb,
  'Hardware blister pack for illegal cognitive weapon malware.',
  'ev_3',
  false,
  '{"descriptions":["Jax hastily drops an empty chip tray into the sterilization vat.","At 01:50 AM: Jax hastily drops an empty chip tray into the sterilization vat.","Notice this clue: Jax hastily drops an empty chip tray into the sterilization vat."],"hints":["Hardware blister pack for illegal cognitive weapon malware.","Clue hint: Think about military virus casing.","Search for: a military-grade neuro-chip casing labeled \"project cortex-shock\"."],"clues":["Military virus casing","Item: Military virus casing","Clue Word: Military virus casing"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4f52947f-da13-50e3-a3d7-10ec420ba15c',
  'story_089',
  'ev_3',
  3,
  '02:08 AM',
  'Agent Kross scans the clinic surgical terminal.',
  'Agent Kross scans the clinic surgical terminal.',
  'A terminal log recording an automated data extraction script during surgery.',
  'Extraction script log',
  'Surgical Terminal Dump',
  '["Heart rate log","Oxygen log","Temperature graph"]'::jsonb,
  'Extraction script log',
  '["extraction script log","extraction log","script log","terminal dump","data log"]'::jsonb,
  'Digital log proving Marcus’s brain data was downloaded as he died.',
  'ev_4',
  false,
  '{"descriptions":["Agent Kross scans the clinic surgical terminal.","At 02:08 AM: Agent Kross scans the clinic surgical terminal.","Notice this clue: Agent Kross scans the clinic surgical terminal."],"hints":["Digital log proving Marcus’s brain data was downloaded as he died.","Clue hint: Think about extraction script log.","Search for: a terminal log recording an automated data extraction script during surgery."],"clues":["Extraction script log","Item: Extraction script log","Clue Word: Extraction script log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0c5699cf-af65-5e05-96dd-aebeaaa4e2b6',
  'story_089',
  'ev_4',
  4,
  '02:15 AM',
  'Kross inspects Jax’s personal cyber-deck.',
  'Kross inspects Jax’s personal cyber-deck.',
  'A decrypted transaction receipt for two million Kuroshio syndicate credits.',
  'Syndicate bounty receipt',
  'Bounty Transaction Log',
  '["Rent bill","Supply invoice","Gambling stub"]'::jsonb,
  'Syndicate bounty receipt',
  '["syndicate bounty receipt","bounty receipt","syndicate receipt","transaction log","bounty log"]'::jsonb,
  'Proof of huge cash payment sent to the surgeon for the hit.',
  'ev_5',
  false,
  '{"descriptions":["Kross inspects Jax’s personal cyber-deck.","At 02:15 AM: Kross inspects Jax’s personal cyber-deck.","Notice this clue: Kross inspects Jax’s personal cyber-deck."],"hints":["Proof of huge cash payment sent to the surgeon for the hit.","Clue hint: Think about syndicate bounty receipt.","Search for: a decrypted transaction receipt for two million kuroshio syndicate credits."],"clues":["Syndicate bounty receipt","Item: Syndicate bounty receipt","Clue Word: Syndicate bounty receipt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'adea1f4b-e801-5fe9-8a03-75c01caf6298',
  'story_089',
  'ev_5',
  5,
  '02:30 AM',
  'Raven shows Kross her recorded lobby intercom audio.',
  'Raven shows Kross her recorded lobby intercom audio.',
  'Audio of Jax speaking on the radio: "Target is in the chair; uploading virus now."',
  'Lobby intercom intercept',
  'Wiretap Audio',
  '["Music track","Street traffic","Static"]'::jsonb,
  'Lobby intercom intercept',
  '["lobby intercom intercept","intercom audio","wiretap audio","lobby audio","audio intercept"]'::jsonb,
  'Audio recording of the doctor confirming the assassination in advance.',
  'ev_6',
  true,
  '{"descriptions":["Raven shows Kross her recorded lobby intercom audio.","At 02:30 AM: Raven shows Kross her recorded lobby intercom audio.","Notice this clue: Raven shows Kross her recorded lobby intercom audio."],"hints":["Audio recording of the doctor confirming the assassination in advance.","Clue hint: Think about lobby intercom intercept.","Search for: audio of jax speaking on the radio: \"target is in the chair; uploading virus now.\""],"clues":["Lobby intercom intercept","Item: Lobby intercom intercept","Clue Word: Lobby intercom intercept"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3767011c-5a57-5974-83c3-6d78b1332541',
  'story_089',
  'ev_6',
  6,
  '02:45 AM',
  'Kross searches Jax’s prosthetic cyber-eye memory.',
  'Kross searches Jax’s prosthetic cyber-eye memory.',
  'The downloaded corporate blueprints stored in Jax’s ocular cache.',
  'Ocular cache blueprints',
  'Stolen Data Blueprints',
  '["Photos of family","Surgery manual","Video game"]'::jsonb,
  'Ocular cache blueprints',
  '["ocular cache blueprints","ocular cache","blueprints","stolen blueprints","data blueprints"]'::jsonb,
  'Top-secret corporate files discovered inside the surgeon’s eye camera.',
  'ev_7',
  false,
  '{"descriptions":["Kross searches Jax’s prosthetic cyber-eye memory.","At 02:45 AM: Kross searches Jax’s prosthetic cyber-eye memory.","Notice this clue: Kross searches Jax’s prosthetic cyber-eye memory."],"hints":["Top-secret corporate files discovered inside the surgeon’s eye camera.","Clue hint: Think about ocular cache blueprints.","Search for: the downloaded corporate blueprints stored in jax’s ocular cache."],"clues":["Ocular cache blueprints","Item: Ocular cache blueprints","Clue Word: Ocular cache blueprints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9fabf9b4-5dff-5def-8143-6e345edd2693',
  'story_089',
  'ev_7',
  7,
  '03:00 AM',
  'Kross confronts Jax with the scorched port, the audio, and the ocular data.',
  'Kross confronts Jax with the scorched port, the audio, and the ocular data.',
  'Jax breaks down and confesses to the corporate execution.',
  'Cyber-surgeon confession',
  'Novak’s Confession',
  '["False plea","Silent refusal","Bribe offer"]'::jsonb,
  'Cyber-surgeon confession',
  '["cyber-surgeon confession","confession","novak confession","surgeon confession","admission"]'::jsonb,
  'Full confession given under corporate interrogation.',
  'ev_8',
  false,
  '{"descriptions":["Kross confronts Jax with the scorched port, the audio, and the ocular data.","At 03:00 AM: Kross confronts Jax with the scorched port, the audio, and the ocular data.","Notice this clue: Kross confronts Jax with the scorched port, the audio, and the ocular data."],"hints":["Full confession given under corporate interrogation.","Clue hint: Think about cyber-surgeon confession.","Search for: jax breaks down and confesses to the corporate execution."],"clues":["Cyber-surgeon confession","Item: Cyber-surgeon confession","Clue Word: Cyber-surgeon confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd4606330-d6b1-55e3-aae5-8cf3502aa53d',
  'story_089',
  'ev_8',
  8,
  '03:15 AM',
  'Corporate forces secure the clinic and recover the stolen defense files.',
  'Corporate forces secure the clinic and recover the stolen defense files.',
  'Recovery of the defense blueprints and formal arrest of the surgeon.',
  'Corporate file recovery',
  'Evidence Recovery Voucher',
  '["Hospital transfer","Funeral notice","Bail slip"]'::jsonb,
  'Corporate file recovery',
  '["corporate file recovery","file recovery","recovery voucher","voucher","corporate recovery"]'::jsonb,
  'Formal retrieval of the stolen materials.',
  NULL,
  true,
  '{"descriptions":["Corporate forces secure the clinic and recover the stolen defense files.","At 03:15 AM: Corporate forces secure the clinic and recover the stolen defense files.","Notice this clue: Corporate forces secure the clinic and recover the stolen defense files."],"hints":["Formal retrieval of the stolen materials.","Clue hint: Think about corporate file recovery.","Search for: recovery of the defense blueprints and formal arrest of the surgeon."],"clues":["Corporate file recovery","Item: Corporate file recovery","Clue Word: Corporate file recovery"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_090 — THE ORBITAL STATION AIR LEAK
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_090',
  'The Orbital Station Air Leak',
  'Sci-Fi / Cyber',
  'Helios-9 orbital hydroponics research station, weightlessness, green algae tubes, solar glare, and emergency airlocks',
  'A sudden pressure drop in the botany lab blew the emergency hatch open, ejecting the chief geneticist into the vacuum of space while the station’s automated safety override was disabled.',
  '[{"name":"Dr. Ronald Hayes","role":"Senior Botanist","alibi":"Claims he was in the station centrifuge gym during the depressurization","avatar":"🌾"},{"name":"Dr. Elena Rostova (Victim)","role":"Chief Geneticist","alibi":"Ejected into vacuum from botany pod 3","avatar":"👩‍🔬"},{"name":"Commander Sarah Vance","role":"Station Commander","alibi":"On the main command bridge monitoring orbit decay","avatar":"👩‍✈️"},{"name":"Tug Pilot Jax Miller","role":"Orbital Salvage Operator","alibi":"Docked at the resupply hub two kilometers away","avatar":"🛰️"}]'::jsonb,
  'Dr. Ronald Hayes wanted exclusive credit for their revolutionary zero-gravity wheat strain. While Dr. Elena Rostova was working inside the sealed hydroponics pod, Hayes placed an electrical jumper on the safety interlock and triggered the external airlock dump, blasting Elena into orbit.',
  'Research Partner Dr. Ronald Hayes',
  'Hayes wanted to claim sole patent rights to a drought-resistant cosmic grain worth billions.',
  '[{"time":"09:00 AM","event":"Elena enters Botany Pod 3 to finalize the genetic grain harvest."},{"time":"09:30 AM","event":"Ronald attaches a copper wire shunt to the airlock safety relay in corridor C."},{"time":"09:42 AM","event":"Ronald transmits the 10-VENT command from his personal terminal."},{"time":"09:43 AM","event":"Botany Pod 3 violently depressurizes, ejecting Elena into orbital space."},{"time":"09:45 AM","event":"Station alarms sound; Commander Vance seals bulkheads."}]'::jsonb,
  '[{"id":"ev_1","title":"Airlock Hatch Examination","detail":"The external botany hatch was opened normally by motors with no impact damage."},{"id":"ev_2","title":"Electrical Relay Shunt","detail":"Copper bypass jumper found in corridor C overriding safety decompression locks."},{"id":"ev_3","title":"Network Event Log","detail":"Digital proof that the 10-VENT airlock command was sent from Ronald Hayes’s tablet."},{"id":"ev_4","title":"Patent Application Draft","detail":"Document establishing Ronald’s scheme to steal full rights to the miracle grain."}]'::jsonb,
  '[{"order":1,"title":"Intact open outer hatch","text":"Proves the hatch was opened electronically, completely debunking a meteorite strike."},{"order":2,"title":"Copper jumper shunt","text":"The physical sabotage tool used to bypass safety interlocks."},{"order":3,"title":"Drone hatch video","text":"External photographic proof of hatch operation with zero outside debris."},{"order":4,"title":"Terminal IP vent command","text":"Digital forensics connecting Ronald’s personal tablet to the vent."},{"order":5,"title":"Insulated wire cutters","text":"Physical tool linking Ronald directly to the copper jumper wire."},{"order":6,"title":"Sole creator patent filing","text":"The multi-billion dollar financial motive for eliminating Elena."}]'::jsonb,
  'Cosmic dust radar blip: A routine dust cloud passed the station, giving Ronald an excuse to fake a meteor hit.; Botany nutrient pressure fluctuation: Normal fertilizer pipe adjustments had zero connection to airlock venting.',
  'Claim a high-velocity space debris impact shattered the outer quartz window.',
  'NORMAL',
  'Was it a micrometeorite puncture, or did someone manually vent the geneticist into space?',
  '[{"character":"Dr. Ronald Hayes","secret":"A wire jumper shunt hidden inside the magnetic buckle of his tool belt."},{"character":"Dr. Elena Rostova (Victim)","secret":"She had already registered the patent jointly under both their names."},{"character":"Commander Sarah Vance","secret":"She had suspected Hayes of fabricating research data last year."},{"character":"Tug Pilot Jax Miller","secret":"He caught the high-resolution footage from the solar array drone."}]'::jsonb,
  '[{"lead":"Cosmic dust radar blip","explanation":"A routine dust cloud passed the station, giving Ronald an excuse to fake a meteor hit."},{"lead":"Botany nutrient pressure fluctuation","explanation":"Normal fertilizer pipe adjustments had zero connection to airlock venting."}]'::jsonb,
  '{"wrongTheories":["A micrometeorite punctured the botany quartz window, blowing the hatch by explosive decompression.","Elena committed suicide by stepping into the airlock due to research stress."],"correctTheory":"Dr. Ronald Hayes used a copper wire shunt to override the airlock safety and vented Elena to claim the grain patent alone."}'::jsonb,
  'Dr. Ronald Hayes bypassed the airlock safety with a wire shunt and vented Elena into space to steal their billion-dollar patent.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Hayes was placed in magnetic confinement for trial on Earth, and Elena was posthumously awarded the global science prize."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The incident was written off as space hazard debris, leaving Hayes rich and celebrated on Earth."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The station was decommissioned as unsafe, burying Hayes’s cold-blooded murder under space agency bureaucracy."}]'::jsonb,
  '{"intros":["A sudden pressure drop in the botany lab blew the emergency hatch open, ejecting the chief geneticist into the vacuum of space while the station’s automated safety override was disabled.","Case file story_090: A sudden pressure drop in the botany lab blew the emergency hatch open, ejecting the chief geneticist into the vacuum of space while the station’s automated safety override was disabled. Look closely at every clue.","Trouble begins in Helios-9 orbital hydroponics research station, weightlessness, green algae tubes, solar glare, and emergency airlocks. A sudden pressure drop in the botany lab blew the emergency hatch open, ejecting the chief geneticist into the vacuum of space while the station’s automated safety override was disabled.","The mystery starts now. A sudden pressure drop in the botany lab blew the emergency hatch open, ejecting the chief geneticist into the vacuum of space while the station’s automated safety override was disabled. Can you solve it?"],"reveals":["Dr. Ronald Hayes bypassed the airlock safety with a wire shunt and vented Elena into space to steal their billion-dollar patent.","The mystery is unraveled! Dr. Ronald Hayes bypassed the airlock safety with a wire shunt and vented Elena into space to steal their billion-dollar patent.","At last, the truth comes out: Dr. Ronald Hayes bypassed the airlock safety with a wire shunt and vented Elena into space to steal their billion-dollar patent.","Case resolved! Here is what happened: Dr. Ronald Hayes bypassed the airlock safety with a wire shunt and vented Elena into space to steal their billion-dollar patent."],"hints":["Pay attention to where Research Partner Dr. Ronald Hayes was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  genre = EXCLUDED.genre,
  setting = EXCLUDED.setting,
  description = EXCLUDED.description,
  characters = EXCLUDED.characters,
  truth = EXCLUDED.truth,
  culprit = EXCLUDED.culprit,
  motive = EXCLUDED.motive,
  timeline = EXCLUDED.timeline,
  evidence = EXCLUDED.evidence,
  clues = EXCLUDED.clues,
  misleading_info = EXCLUDED.misleading_info,
  distorter_objective = EXCLUDED.distorter_objective,
  difficulty = EXCLUDED.difficulty,
  main_mystery = EXCLUDED.main_mystery,
  character_secrets = EXCLUDED.character_secrets,
  red_herrings = EXCLUDED.red_herrings,
  theories = EXCLUDED.theories,
  final_reveal = EXCLUDED.final_reveal,
  endings = EXCLUDED.endings,
  dynamic_wording = EXCLUDED.dynamic_wording;

DELETE FROM public.case_characters WHERE case_id = 'story_090';
DELETE FROM public.case_events WHERE case_id = 'story_090';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9744a053-40f5-5eea-8ce4-f1ddd96762ec',
  'story_090',
  'Dr. Ronald Hayes',
  'Senior Botanist',
  'Smug, clean-shaven, floating in zero-g with magnetic boots, nervous eye twitch',
  'A micrometeorite hit the outer glass! Elena was right next to the window when it gave way.',
  'A wire jumper shunt hidden inside the magnetic buckle of his tool belt.',
  'Claims he was in the station centrifuge gym during the depressurization',
  'Co-lead researcher with Dr. Elena Rostova',
  'The outer hatch was opened by electronic command, not physical glass shattering.',
  'Did not know the external solar array camera was aimed right at the airlock hatch.',
  '🌾',
  '["A micrometeorite hit the outer glass! Elena was right next to the window when it gave way.","\"A micrometeorite hit the outer glass! Elena was right next to the window when it gave way.\"","Listen to me: A micrometeorite hit the outer glass! Elena was right next to the window when it gave way.","I tell you the truth: A micrometeorite hit the outer glass! Elena was right next to the window when it gave way."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a6d4653a-0c61-5506-a098-ce97bd54e075',
  'story_090',
  'Dr. Elena Rostova (Victim)',
  'Chief Geneticist',
  'Found drifting in orbit by the recovery tug; secured the seed samples in her vest',
  'Deceased victim; suit telemetry recorded the emergency hatch unsealing from station command.',
  'She had already registered the patent jointly under both their names.',
  'Ejected into vacuum from botany pod 3',
  'Partner and co-inventor of the miracle grain',
  'Ronald was furiously complaining about having to split royalties 50-50.',
  'Did not suspect Ronald would override emergency airlock safety protocols.',
  '👩‍🔬',
  '["Deceased victim; suit telemetry recorded the emergency hatch unsealing from station command.","\"Deceased victim; suit telemetry recorded the emergency hatch unsealing from station command.\"","Listen to me: Deceased victim; suit telemetry recorded the emergency hatch unsealing from station command.","I tell you the truth: Deceased victim; suit telemetry recorded the emergency hatch unsealing from station command."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ce8a4961-fed6-55b0-84f7-0e58e7a3071f',
  'story_090',
  'Commander Sarah Vance',
  'Station Commander',
  'Disciplined, space-navy veteran, floating with clipboard, sharp eye for mechanics',
  'Station hatches don’t blow open during meteor strikes. The safety interlocks require two keys or a manual electrical bypass.',
  'She had suspected Hayes of fabricating research data last year.',
  'On the main command bridge monitoring orbit decay',
  'Commander of Helios-9 station',
  'The hull pressure sensor reported an open door command code 10-VENT.',
  'Did not know who placed the physical jumper on the emergency circuit.',
  '👩‍✈️',
  '["Station hatches don’t blow open during meteor strikes. The safety interlocks require two keys or a manual electrical bypass.","\"Station hatches don’t blow open during meteor strikes. The safety interlocks require two keys or a manual electrical bypass.\"","Listen to me: Station hatches don’t blow open during meteor strikes. The safety interlocks require two keys or a manual electrical bypass.","I tell you the truth: Station hatches don’t blow open during meteor strikes. The safety interlocks require two keys or a manual electrical bypass."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7fef9dd5-ab3f-574b-adde-3a3d2b8246a6',
  'story_090',
  'Tug Pilot Jax Miller',
  'Orbital Salvage Operator',
  'Rugged space pilot, chewing gum, flying a thruster-equipped recovery pod',
  'I retrieved Elena’s body from orbit. The outer botany hatch was undamaged—it was wide open on its hinges.',
  'He caught the high-resolution footage from the solar array drone.',
  'Docked at the resupply hub two kilometers away',
  'Retrieved the victim and external telemetry',
  'The quartz viewport was completely intact with zero impact craters.',
  'Did not know the technical code for opening the hatch.',
  '🛰️',
  '["I retrieved Elena’s body from orbit. The outer botany hatch was undamaged—it was wide open on its hinges.","\"I retrieved Elena’s body from orbit. The outer botany hatch was undamaged—it was wide open on its hinges.\"","Listen to me: I retrieved Elena’s body from orbit. The outer botany hatch was undamaged—it was wide open on its hinges.","I tell you the truth: I retrieved Elena’s body from orbit. The outer botany hatch was undamaged—it was wide open on its hinges."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fa3ba5a3-8259-5e06-a72e-dd441b3c6c55',
  'story_090',
  'ev_1',
  1,
  '09:43 AM',
  'Botany Pod 3 vents into the vacuum of space.',
  'Botany Pod 3 vents into the vacuum of space.',
  'An undamaged outer airlock hatch swung wide open on hydraulic arms.',
  'Intact open outer hatch',
  'Airlock Hatch Examination',
  '["Shattered window","Torn metal","Hull crack"]'::jsonb,
  'Intact open outer hatch',
  '["intact open outer hatch","open hatch","undamaged hatch","intact hatch","airlock hatch"]'::jsonb,
  'The station door was opened cleanly by its own motors, not blown out by force.',
  'ev_2',
  true,
  '{"descriptions":["Botany Pod 3 vents into the vacuum of space.","At 09:43 AM: Botany Pod 3 vents into the vacuum of space.","Notice this clue: Botany Pod 3 vents into the vacuum of space."],"hints":["The station door was opened cleanly by its own motors, not blown out by force.","Clue hint: Think about intact open outer hatch.","Search for: an undamaged outer airlock hatch swung wide open on hydraulic arms."],"clues":["Intact open outer hatch","Item: Intact open outer hatch","Clue Word: Intact open outer hatch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0904df45-2a84-5359-bcab-7f7280d10657',
  'story_090',
  'ev_2',
  2,
  '09:50 AM',
  'Commander Vance inspects the electrical access panel in corridor C.',
  'Commander Vance inspects the electrical access panel in corridor C.',
  'A handmade copper wire shunt bypassing the safety interlock switch.',
  'Copper jumper shunt',
  'Electrical Relay Shunt',
  '["Burnt fuse","Cut wire","Loose screw"]'::jsonb,
  'Copper jumper shunt',
  '["copper jumper shunt","copper shunt","jumper shunt","relay shunt","copper wire"]'::jsonb,
  'A small piece of wire used to trick the safety computer into venting air.',
  'ev_3',
  false,
  '{"descriptions":["Commander Vance inspects the electrical access panel in corridor C.","At 09:50 AM: Commander Vance inspects the electrical access panel in corridor C.","Notice this clue: Commander Vance inspects the electrical access panel in corridor C."],"hints":["A small piece of wire used to trick the safety computer into venting air.","Clue hint: Think about copper jumper shunt.","Search for: a handmade copper wire shunt bypassing the safety interlock switch."],"clues":["Copper jumper shunt","Item: Copper jumper shunt","Clue Word: Copper jumper shunt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '563c8a71-27e8-529a-bf1e-e3bbb0f02068',
  'story_090',
  'ev_3',
  3,
  '10:05 AM',
  'Jax Miller reviews the solar panel inspection drone video.',
  'Jax Miller reviews the solar panel inspection drone video.',
  'Drone footage showing the hatch unbolting from inside motors while no debris is present.',
  'Drone hatch video',
  'Solar Drone Footage',
  '["Meteor trail","Solar flare","Thruster burn"]'::jsonb,
  'Drone hatch video',
  '["drone hatch video","drone video","hatch video","footage","drone footage"]'::jsonb,
  'External high-definition video showing zero space rocks hit the station.',
  'ev_4',
  false,
  '{"descriptions":["Jax Miller reviews the solar panel inspection drone video.","At 10:05 AM: Jax Miller reviews the solar panel inspection drone video.","Notice this clue: Jax Miller reviews the solar panel inspection drone video."],"hints":["External high-definition video showing zero space rocks hit the station.","Clue hint: Think about drone hatch video.","Search for: drone footage showing the hatch unbolting from inside motors while no debris is present."],"clues":["Drone hatch video","Item: Drone hatch video","Clue Word: Drone hatch video"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd0e0c6cb-2a07-5177-a1a9-f4ae378442dc',
  'story_090',
  'ev_4',
  4,
  '10:20 AM',
  'Vance checks the station network traffic log.',
  'Vance checks the station network traffic log.',
  'The 10-VENT command originated from IP address 192.168.1.42 belonging to Hayes’s tablet.',
  'Terminal IP vent command',
  'Network Event Log',
  '["Bridge console","Auto-pilot","Life support system"]'::jsonb,
  'Terminal IP vent command',
  '["terminal ip vent command","ip command","vent command","network log","terminal command"]'::jsonb,
  'Network trace proving the command to open the hatch came from Ronald’s tablet.',
  'ev_5',
  false,
  '{"descriptions":["Vance checks the station network traffic log.","At 10:20 AM: Vance checks the station network traffic log.","Notice this clue: Vance checks the station network traffic log."],"hints":["Network trace proving the command to open the hatch came from Ronald’s tablet.","Clue hint: Think about terminal ip vent command.","Search for: the 10-vent command originated from ip address 192.168.1.42 belonging to hayes’s tablet."],"clues":["Terminal IP vent command","Item: Terminal IP vent command","Clue Word: Terminal IP vent command"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3046f369-b315-5da0-affe-fa9df173a40f',
  'story_090',
  'ev_5',
  5,
  '10:40 AM',
  'Vance inspects Ronald’s tool belt in the crew quarters.',
  'Vance inspects Ronald’s tool belt in the crew quarters.',
  'Matching insulated copper wire cutters with microscopic insulation shavings.',
  'Insulated wire cutters',
  'Precision Wire Cutters',
  '["Wrench","Screwdriver","Flashlight"]'::jsonb,
  'Insulated wire cutters',
  '["insulated wire cutters","wire cutters","cutters","precision cutters","pliers"]'::jsonb,
  'Tool used to manufacture the jumper wire found in the relay panel.',
  'ev_6',
  true,
  '{"descriptions":["Vance inspects Ronald’s tool belt in the crew quarters.","At 10:40 AM: Vance inspects Ronald’s tool belt in the crew quarters.","Notice this clue: Vance inspects Ronald’s tool belt in the crew quarters."],"hints":["Tool used to manufacture the jumper wire found in the relay panel.","Clue hint: Think about insulated wire cutters.","Search for: matching insulated copper wire cutters with microscopic insulation shavings."],"clues":["Insulated wire cutters","Item: Insulated wire cutters","Clue Word: Insulated wire cutters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4825e9d9-755f-52bf-b6e2-de3c38fea57d',
  'story_090',
  'ev_6',
  6,
  '11:00 AM',
  'Vance searches Ronald’s email drafts on the secure satellite uplink.',
  'Vance searches Ronald’s email drafts on the secure satellite uplink.',
  'A patent application for the grain filed under Ronald Hayes’s name as sole creator.',
  'Sole creator patent filing',
  'Patent Application Draft',
  '["Letter to wife","Research paper","Supply order"]'::jsonb,
  'Sole creator patent filing',
  '["sole creator patent filing","patent filing","patent draft","sole patent","application"]'::jsonb,
  'Legal papers showing Ronald stood to make billions alone if Elena was gone.',
  'ev_7',
  false,
  '{"descriptions":["Vance searches Ronald’s email drafts on the secure satellite uplink.","At 11:00 AM: Vance searches Ronald’s email drafts on the secure satellite uplink.","Notice this clue: Vance searches Ronald’s email drafts on the secure satellite uplink."],"hints":["Legal papers showing Ronald stood to make billions alone if Elena was gone.","Clue hint: Think about sole creator patent filing.","Search for: a patent application for the grain filed under ronald hayes’s name as sole creator."],"clues":["Sole creator patent filing","Item: Sole creator patent filing","Clue Word: Sole creator patent filing"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c67d7425-2b4b-5dec-8a21-4b1adeb8c230',
  'story_090',
  'ev_7',
  7,
  '11:20 AM',
  'Vance checks the gym security cameras.',
  'Vance checks the gym security cameras.',
  'The centrifuge gym was completely empty at 09:42 AM, disproving Ronald’s alibi.',
  'Empty gym camera',
  'CCTV Alibi Disproof',
  '["Running machine","Locker room","Weight bench"]'::jsonb,
  'Empty gym camera',
  '["empty gym camera","gym camera","empty gym","cctv footage","alibi disproof"]'::jsonb,
  'Video footage proving Ronald was not working out when the hatch blew.',
  'ev_8',
  false,
  '{"descriptions":["Vance checks the gym security cameras.","At 11:20 AM: Vance checks the gym security cameras.","Notice this clue: Vance checks the gym security cameras."],"hints":["Video footage proving Ronald was not working out when the hatch blew.","Clue hint: Think about empty gym camera.","Search for: the centrifuge gym was completely empty at 09:42 am, disproving ronald’s alibi."],"clues":["Empty gym camera","Item: Empty gym camera","Clue Word: Empty gym camera"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '77988b23-0397-552f-bf26-2256f229a141',
  'story_090',
  'ev_8',
  8,
  '11:40 AM',
  'Commander Vance arrests Dr. Hayes and places him in magnetic cuffs.',
  'Commander Vance arrests Dr. Hayes and places him in magnetic cuffs.',
  'Hayes’s confession admitting he vented Elena to steal the patent rights.',
  'Scientist confession',
  'Signed Deposition Record',
  '["Denial","Suicide attempt","Silence"]'::jsonb,
  'Scientist confession',
  '["scientist confession","confession","signed deposition","admission"]'::jsonb,
  'Full admission given by the greedy botanist.',
  NULL,
  true,
  '{"descriptions":["Commander Vance arrests Dr. Hayes and places him in magnetic cuffs.","At 11:40 AM: Commander Vance arrests Dr. Hayes and places him in magnetic cuffs.","Notice this clue: Commander Vance arrests Dr. Hayes and places him in magnetic cuffs."],"hints":["Full admission given by the greedy botanist.","Clue hint: Think about scientist confession.","Search for: hayes’s confession admitting he vented elena to steal the patent rights."],"clues":["Scientist confession","Item: Scientist confession","Clue Word: Scientist confession"]}'::jsonb
);
