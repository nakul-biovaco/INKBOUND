-- ============================================================================
-- INKBOUND — SEED STORIES 001 TO 030
-- Part of the 120 Complete Connected Story Database with Dynamic Wording
-- ============================================================================

-- ----------------------------------------------------------------------------
-- CASE: STORY_001 — THE MIDNIGHT MUSEUM HEIST
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_001',
  'The Midnight Museum Heist',
  'Noir Mystery',
  'The Kessler Antiquities Museum, 3rd Floor Vault Gallery',
  'The blue diamond vanished from the locked glass case during a three-minute blackout.',
  '[{"name":"Dominic Hart","role":"Board Chairman","alibi":"Reception hall near front entrance","avatar":"🎩"},{"name":"Elena Voss","role":"Head Curator","alibi":"Archival library second floor","avatar":"🏛️"},{"name":"Marcus Reyes","role":"Night Guard","alibi":"Perimeter garden walkway","avatar":"🛡️"},{"name":"Isabelle Chen","role":"Insurance Auditor","alibi":"Security office checking log books","avatar":"🔍"}]'::jsonb,
  'Board Chairman Dominic Hart cut the power in the basement. He used master keys to take the diamond, put it in his briefcase, and walked out to his red car.',
  'Dominic Hart',
  'He had huge secret gambling debts and needed quick cash.',
  '[{"time":"01:30 AM","event":"Elena completes final display check."},{"time":"01:45 AM","event":"Dominic sneaks into the dark basement."},{"time":"02:00 AM","event":"Power cables cut; museum goes black."},{"time":"02:03 AM","event":"Blue diamond taken from glass pedestal."},{"time":"02:08 AM","event":"Red sports car speeds away from loading dock."}]'::jsonb,
  '[{"id":"ev1","title":"Vault Keys","detail":"Brass keys found near basement air shaft."},{"id":"ev2","title":"Wire Cutters","detail":"Cutters with copper wire residue."},{"id":"ev3","title":"Betting Slip","detail":"Receipt showing half a million in unpaid gambling debts."},{"id":"ev4","title":"Tire Tracks","detail":"Fresh tire marks matching Dominic’s sports car."}]'::jsonb,
  '[{"order":1,"title":"Vault Keys","text":"Brass keys dropped near basement air shaft."},{"order":2,"title":"Wire Cutters","text":"Pliers used to cut the electricity line."},{"order":3,"title":"Blue Diamond","text":"The missing 140-carat gem from the display."},{"order":4,"title":"Briefcase","text":"Leather case used to carry the stolen jewel."},{"order":5,"title":"Red Car","text":"Fast vehicle seen leaving rear gate in the rain."},{"order":6,"title":"Betting Slip","text":"Proof of gambling debt found in the desk."}]'::jsonb,
  'Guard Marcus left his post for ten minutes.: He only stepped away to fix a coffee pot.; Curator Elena had a glass cutter in her drawer.: Used only to trim glass for framing paintings.',
  'Blame the guard Marcus Reyes or claim a thief dropped through the roof.',
  'NORMAL',
  'Who took the diamond and how did they get out of the locked museum?',
  '[{"character":"Dominic Hart","secret":"He owes half a million dollars to mob loan sharks."},{"character":"Elena Voss","secret":"She suspected Dominic was stealing art pieces before."},{"character":"Marcus Reyes","secret":"Left post for ten minutes to fix coffee pot."},{"character":"Isabelle Chen","secret":"Hired to uncover insurance fraud."}]'::jsonb,
  '[{"lead":"Guard Marcus left his post for ten minutes.","explanation":"He only stepped away to fix a coffee pot."},{"lead":"Curator Elena had a glass cutter in her drawer.","explanation":"Used only to trim glass for framing paintings."}]'::jsonb,
  '{"wrongTheories":["A professional cat burglar swung down from the glass skylight in the dark.","Night guard Marcus took the jewel and hid it inside the ventilation duct."],"correctTheory":"Dominic Hart cut the power in the basement, opened the case with his master key, put the diamond in his briefcase, and escaped in his red car to pay his gambling debts."}'::jsonb,
  'Dominic Hart stole the blue diamond to pay his secret gambling debts!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Dominic Hart was stopped at the toll booth with the diamond in his briefcase. Marcus was cleared of all suspicion."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Marcus Reyes was wrongfully blamed for the missing keys. Dominic boarded a private flight with the diamond."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The team believed a phantom burglar leaped through the skylight. Dominic sold the blue diamond overseas."}]'::jsonb,
  '{"intros":["The blue diamond vanished from the locked glass case during a three-minute blackout.","Case file story_001: The blue diamond vanished from the locked glass case during a three-minute blackout. Look closely at every clue.","Trouble begins in The Kessler Antiquities Museum, 3rd Floor Vault Gallery. The blue diamond vanished from the locked glass case during a three-minute blackout.","The mystery starts now. The blue diamond vanished from the locked glass case during a three-minute blackout. Can you solve it?"],"reveals":["Dominic Hart stole the blue diamond to pay his secret gambling debts!","The mystery is unraveled! Dominic Hart stole the blue diamond to pay his secret gambling debts!","At last, the truth comes out: Dominic Hart stole the blue diamond to pay his secret gambling debts!","Case resolved! Here is what happened: Dominic Hart stole the blue diamond to pay his secret gambling debts!"],"hints":["Pay attention to where Dominic Hart was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_001';
DELETE FROM public.case_events WHERE case_id = 'story_001';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '64310785-ccba-5315-93de-8e0754c0a713',
  'story_001',
  'Dominic Hart',
  'Board Chairman',
  'Polite, nervous, well-dressed',
  'I was greeting guests at the reception desk all night.',
  'He owes half a million dollars to mob loan sharks.',
  'Reception hall near front entrance',
  'Has master security keys to every museum door',
  'Basement breaker cuts power to cameras.',
  'Did not know dropped keys were found by cleaner.',
  '🎩',
  '["I was greeting guests at the reception desk all night.","\"I was greeting guests at the reception desk all night.\"","Listen to me: I was greeting guests at the reception desk all night.","I tell you the truth: I was greeting guests at the reception desk all night."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5da87ec7-e4ee-5395-a9d3-cc9b241697c7',
  'story_001',
  'Elena Voss',
  'Head Curator',
  'Stern, sharp-eyed, protective',
  'I locked the display at midnight and kept the log.',
  'She suspected Dominic was stealing art pieces before.',
  'Archival library second floor',
  'In charge of the blue diamond display',
  'Saw Dominic heading to basement at 1:45 AM.',
  'Did not know alarm was wired to breaker.',
  '🏛️',
  '["I locked the display at midnight and kept the log.","\"I locked the display at midnight and kept the log.\"","Listen to me: I locked the display at midnight and kept the log.","I tell you the truth: I locked the display at midnight and kept the log."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3d1a6519-b60d-52b8-bcd8-6c33f6fe7f43',
  'story_001',
  'Marcus Reyes',
  'Night Guard',
  'Quiet, tired, careful',
  'I walked my regular patrol outside in the rain.',
  'Left post for ten minutes to fix coffee pot.',
  'Perimeter garden walkway',
  'Holds security radio transmitter',
  'Heard tires screeching in the alley.',
  'Did not know who took his spare keys.',
  '🛡️',
  '["I walked my regular patrol outside in the rain.","\"I walked my regular patrol outside in the rain.\"","Listen to me: I walked my regular patrol outside in the rain.","I tell you the truth: I walked my regular patrol outside in the rain."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1e7258e2-8f1d-50e7-9694-f01a45361967',
  'story_001',
  'Isabelle Chen',
  'Insurance Auditor',
  'Inquisitive, calm, analytical',
  'I checked display sensors at 1:00 AM and all was green.',
  'Hired to uncover insurance fraud.',
  'Security office checking log books',
  'Auditing policy on high-value jewels',
  'Glass was not smashed; it was unlocked.',
  'Did not see Dominic run out rear door.',
  '🔍',
  '["I checked display sensors at 1:00 AM and all was green.","\"I checked display sensors at 1:00 AM and all was green.\"","Listen to me: I checked display sensors at 1:00 AM and all was green.","I tell you the truth: I checked display sensors at 1:00 AM and all was green."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c674c133-c983-520c-babc-f8571704f1ae',
  'story_001',
  'ev_1',
  1,
  '01:45 AM',
  'Heavy brass keys are dropped near the air shaft.',
  'Heavy brass keys are dropped near the air shaft.',
  'The dropped master keys belonged to the chairman.',
  'Vault Keys',
  'Brass keys with initials D.H.',
  '["Pocket Knife","Flashlight","Gold Coin"]'::jsonb,
  'Vault Keys',
  '["vault keys","keys","key","brass keys","vault key"]'::jsonb,
  'Something made of brass used to unlock doors.',
  'ev_2',
  true,
  '{"descriptions":["Heavy brass keys are dropped near the air shaft.","At 01:45 AM: Heavy brass keys are dropped near the air shaft.","Notice this clue: Heavy brass keys are dropped near the air shaft."],"hints":["Something made of brass used to unlock doors.","Clue hint: Think about vault keys.","Search for: the dropped master keys belonged to the chairman."],"clues":["Vault Keys","Item: Vault Keys","Clue Word: Vault Keys"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '84ebfe33-6f08-543d-8f04-8702c36538b7',
  'story_001',
  'ev_2',
  2,
  '01:55 AM',
  'Insulated cutters are left near the power breaker.',
  'Insulated cutters are left near the power breaker.',
  'Cables were cut with heavy electrical cutters.',
  'Wire Cutters',
  'Yellow rubber-handled cutters with copper residue.',
  '["Hammer","Crowbar","Screwdriver"]'::jsonb,
  'Wire Cutters',
  '["wire cutters","wire cutter","pliers","cutters"]'::jsonb,
  'A tool used to snip thick wires.',
  'ev_3',
  false,
  '{"descriptions":["Insulated cutters are left near the power breaker.","At 01:55 AM: Insulated cutters are left near the power breaker.","Notice this clue: Insulated cutters are left near the power breaker."],"hints":["A tool used to snip thick wires.","Clue hint: Think about wire cutters.","Search for: cables were cut with heavy electrical cutters."],"clues":["Wire Cutters","Item: Wire Cutters","Clue Word: Wire Cutters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '63c8b713-6634-5edd-ab8e-ae2111478b07',
  'story_001',
  'ev_3',
  3,
  '02:02 AM',
  'The glowing blue diamond vanishes from the pedestal.',
  'The glowing blue diamond vanishes from the pedestal.',
  'The target of the robbery was the priceless gem.',
  'Blue Diamond',
  'Empty velvet stand with dust ring.',
  '["Golden Statue","Old Painting","Silver Crown"]'::jsonb,
  'Blue Diamond',
  '["blue diamond","diamond","gem","jewel"]'::jsonb,
  'A sparkling blue precious stone.',
  'ev_4',
  false,
  '{"descriptions":["The glowing blue diamond vanishes from the pedestal.","At 02:02 AM: The glowing blue diamond vanishes from the pedestal.","Notice this clue: The glowing blue diamond vanishes from the pedestal."],"hints":["A sparkling blue precious stone.","Clue hint: Think about blue diamond.","Search for: the target of the robbery was the priceless gem."],"clues":["Blue Diamond","Item: Blue Diamond","Clue Word: Blue Diamond"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '381c399b-88ff-54c5-a8c3-7579fd208717',
  'story_001',
  'ev_4',
  4,
  '02:04 AM',
  'A dark leather briefcase is packed behind the column.',
  'A dark leather briefcase is packed behind the column.',
  'The thief used a padded case for the stolen gem.',
  'Briefcase',
  'Black leather case with luxury stitching.',
  '["Backpack","Paper Bag","Wooden Box"]'::jsonb,
  'Briefcase',
  '["briefcase","leather case","bag","case"]'::jsonb,
  'A businessman uses this to carry files or valuables.',
  'ev_5',
  false,
  '{"descriptions":["A dark leather briefcase is packed behind the column.","At 02:04 AM: A dark leather briefcase is packed behind the column.","Notice this clue: A dark leather briefcase is packed behind the column."],"hints":["A businessman uses this to carry files or valuables.","Clue hint: Think about briefcase.","Search for: the thief used a padded case for the stolen gem."],"clues":["Briefcase","Item: Briefcase","Clue Word: Briefcase"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b07eae4d-6a66-50b9-8914-57bbc8a71664',
  'story_001',
  'ev_5',
  5,
  '02:06 AM',
  'A red sports sedan burns rubber as it leaves the dock.',
  'A red sports sedan burns rubber as it leaves the dock.',
  'The getaway car matches Dominic’s vehicle.',
  'Red Car',
  'Red paint scrape on loading gate.',
  '["Black Van","Bicycle","Motorcycle"]'::jsonb,
  'Red Car',
  '["red car","car","sports car","sedan"]'::jsonb,
  'A fast vehicle with four wheels and bright red color.',
  'ev_6',
  true,
  '{"descriptions":["A red sports sedan burns rubber as it leaves the dock.","At 02:06 AM: A red sports sedan burns rubber as it leaves the dock.","Notice this clue: A red sports sedan burns rubber as it leaves the dock."],"hints":["A fast vehicle with four wheels and bright red color.","Clue hint: Think about red car.","Search for: the getaway car matches dominic’s vehicle."],"clues":["Red Car","Item: Red Car","Clue Word: Red Car"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f9236f19-31de-5292-b61d-cc8371750c04',
  'story_001',
  'ev_6',
  6,
  '02:15 AM',
  'A torn betting slip is found in the private office.',
  'A torn betting slip is found in the private office.',
  'Dominic owed thousands on horse racing.',
  'Betting Slip',
  'Underground casino receipt with huge debt.',
  '["Hotel Key","Train Ticket","Love Note"]'::jsonb,
  'Betting Slip',
  '["betting slip","receipt","ticket","iou"]'::jsonb,
  'Paper showing money lost on bets.',
  'ev_7',
  false,
  '{"descriptions":["A torn betting slip is found in the private office.","At 02:15 AM: A torn betting slip is found in the private office.","Notice this clue: A torn betting slip is found in the private office."],"hints":["Paper showing money lost on bets.","Clue hint: Think about betting slip.","Search for: dominic owed thousands on horse racing."],"clues":["Betting Slip","Item: Betting Slip","Clue Word: Betting Slip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '740e5b1e-04d2-5d07-89a1-6929706e88c0',
  'story_001',
  'ev_7',
  7,
  '02:20 AM',
  'A wet overcoat smelling of rain is found in the closet.',
  'A wet overcoat smelling of rain is found in the closet.',
  'The thief wore an expensive wool overcoat.',
  'Wool Coat',
  'Dark wool coat hung in executive closet.',
  '["Guard Uniform","Rain Poncho","Leather Jacket"]'::jsonb,
  'Wool Coat',
  '["wool coat","coat","overcoat","jacket"]'::jsonb,
  'Warm winter clothing worn by wealthy men.',
  'ev_8',
  false,
  '{"descriptions":["A wet overcoat smelling of rain is found in the closet.","At 02:20 AM: A wet overcoat smelling of rain is found in the closet.","Notice this clue: A wet overcoat smelling of rain is found in the closet."],"hints":["Warm winter clothing worn by wealthy men.","Clue hint: Think about wool coat.","Search for: the thief wore an expensive wool overcoat."],"clues":["Wool Coat","Item: Wool Coat","Clue Word: Wool Coat"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dc2e6469-d187-53f4-a674-9911154c3bd4',
  'story_001',
  'ev_8',
  8,
  '02:30 AM',
  'Investigators find the emergency exit pushed open.',
  'Investigators find the emergency exit pushed open.',
  'The thief left smoothly through the back door.',
  'Exit Door',
  'Steel bar pressed open with damp glove prints.',
  '["Broken Window","Vent Shaft","Chimney"]'::jsonb,
  'Exit Door',
  '["exit door","door","exit","gate"]'::jsonb,
  'A steel barrier you push open to leave a building.',
  NULL,
  true,
  '{"descriptions":["Investigators find the emergency exit pushed open.","At 02:30 AM: Investigators find the emergency exit pushed open.","Notice this clue: Investigators find the emergency exit pushed open."],"hints":["A steel barrier you push open to leave a building.","Clue hint: Think about exit door.","Search for: the thief left smoothly through the back door."],"clues":["Exit Door","Item: Exit Door","Clue Word: Exit Door"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_002 — RAIN ON NEON STREET
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_002',
  'Rain on Neon Street',
  'Noir Mystery',
  'The alley behind the Blue Moon Diner, wet pavement and buzzing neon',
  'Informant Eddie Finch was found unconscious in the alley holding a sealed envelope.',
  '[{"name":"Detective Silas Vance","role":"Senior Police Detective","alibi":"Typing reports at central station","avatar":"🕵️"},{"name":"Rita Morales","role":"Diner Waitress","alibi":"Serving late night coffee behind counter","avatar":"☕"},{"name":"Frankie \"Two-Knives\"","role":"Diner Short-Order Cook","alibi":"Near the kitchen grill","avatar":"🍳"},{"name":"Eddie Finch","role":"Street Informant","alibi":"Victim found in the alley","avatar":"🗞️"}]'::jsonb,
  'Detective Silas Vance learned Eddie had photographs of his illegal payoffs. Silas ambushed Eddie in the rainy alley and tried to take the evidence.',
  'Detective Silas Vance',
  'Silas took bribes from dock smugglers and Eddie was about to report him.',
  '[{"time":"11:15 PM","event":"Eddie orders black coffee and waits by the booth."},{"time":"11:35 PM","event":"Silas pulls up in an unmarked police cruiser."},{"time":"11:45 PM","event":"Eddie steps out into the rainy alley."},{"time":"11:48 PM","event":"A scuffle breaks out near the metal trash cans."},{"time":"11:52 PM","event":"Rita opens the back door and shouts; Silas flees."}]'::jsonb,
  '[{"id":"ev1","title":"Police Flashlight","detail":"Heavy metal light matching Silas Vance’s unit."},{"id":"ev2","title":"Manila Envelope","detail":"Contains pictures of payoffs down at the harbor."},{"id":"ev3","title":"Alley Badge Scrape","detail":"Gold paint and serial number matching Silas’s shield."},{"id":"ev4","title":"Silver Cufflink","detail":"Found near the drain with blood from the struggle."}]'::jsonb,
  '[{"order":1,"title":"Flashlight","text":"Police flashlight left behind in the rain puddle."},{"order":2,"title":"Envelope","text":"Paper pouch containing secret photos of dock bribes."},{"order":3,"title":"Police Badge","text":"Gold detective shield that scraped the alley wall."},{"order":4,"title":"Tire Tracks","text":"Tread marks from an unmarked police cruiser."},{"order":5,"title":"Cigar","text":"Cigar butt with Turkish tobacco found by the curb."},{"order":6,"title":"Film Strip","text":"Camera negatives showing cash passed between men."}]'::jsonb,
  'Frankie the cook shouted at Eddie earlier.: He was only yelling about an unpaid three-dollar food bill.; A street vagrant had Eddie’s hat.: He picked it up off the sidewalk after Silas ran away.',
  'Blame the diner cook Frankie or claim Eddie slipped on wet bricks.',
  'NORMAL',
  'Who attacked Eddie Finch and what secret was written inside the envelope?',
  '[{"character":"Detective Silas Vance","secret":"He took thousands of dollars from dock smugglers."},{"character":"Rita Morales","secret":"She slipped Eddie’s notebook into her apron pocket."},{"character":"Frankie \"Two-Knives\"","secret":"He owes money to the same loan shark as Eddie."},{"character":"Eddie Finch","secret":"He made copies of every bribe receipt."}]'::jsonb,
  '[{"lead":"Frankie the cook shouted at Eddie earlier.","explanation":"He was only yelling about an unpaid three-dollar food bill."},{"lead":"A street vagrant had Eddie’s hat.","explanation":"He picked it up off the sidewalk after Silas ran away."}]'::jsonb,
  '{"wrongTheories":["Eddie slipped on wet bricks and struck his head on the dumpster.","Frankie chased Eddie outside with a knife over unpaid food tabs."],"correctTheory":"Detective Silas Vance ambushed informant Eddie Finch with a heavy flashlight to silence him before he exposed his dirty dock bribes."}'::jsonb,
  'Detective Silas Vance attacked Eddie Finch to hide his dock payoff bribes!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The film negatives and silver cufflink proved Silas Vance was the attacker. Internal Affairs arrested Silas, and Eddie survived."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Frankie the cook was taken into custody. Silas Vance quietly destroyed the negative strips and returned to duty."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The court ruled Eddie slipped in the rain. Silas continued running dock payoffs in complete safety."}]'::jsonb,
  '{"intros":["Informant Eddie Finch was found unconscious in the alley holding a sealed envelope.","Case file story_002: Informant Eddie Finch was found unconscious in the alley holding a sealed envelope. Look closely at every clue.","Trouble begins in The alley behind the Blue Moon Diner, wet pavement and buzzing neon. Informant Eddie Finch was found unconscious in the alley holding a sealed envelope.","The mystery starts now. Informant Eddie Finch was found unconscious in the alley holding a sealed envelope. Can you solve it?"],"reveals":["Detective Silas Vance attacked Eddie Finch to hide his dock payoff bribes!","The mystery is unraveled! Detective Silas Vance attacked Eddie Finch to hide his dock payoff bribes!","At last, the truth comes out: Detective Silas Vance attacked Eddie Finch to hide his dock payoff bribes!","Case resolved! Here is what happened: Detective Silas Vance attacked Eddie Finch to hide his dock payoff bribes!"],"hints":["Pay attention to where Detective Silas Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_002';
DELETE FROM public.case_events WHERE case_id = 'story_002';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fb45eddb-d670-5b90-b965-a945c1d38ecc',
  'story_002',
  'Detective Silas Vance',
  'Senior Police Detective',
  'Cold, cynical, sharp suit soaked in rain',
  'I just got the radio call and rushed to the scene.',
  'He took thousands of dollars from dock smugglers.',
  'Typing reports at central station',
  'Eddie Finch was his long-time street informant',
  'Eddie hid photos in the diner jukebox.',
  'The waitress saw his badge flash in the alley.',
  '🕵️',
  '["I just got the radio call and rushed to the scene.","\"I just got the radio call and rushed to the scene.\"","Listen to me: I just got the radio call and rushed to the scene.","I tell you the truth: I just got the radio call and rushed to the scene."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd7bb96ad-3ad2-51c5-bff4-1f957dd842d8',
  'story_002',
  'Rita Morales',
  'Diner Waitress',
  'Observant, tired, honest',
  'I took out the trash and saw a tall man run toward the street.',
  'She slipped Eddie’s notebook into her apron pocket.',
  'Serving late night coffee behind counter',
  'Eddie was a regular customer who drank black coffee',
  'Saw a gold shield flash under the streetlamp.',
  'Did not know Silas was on the smugglers’ payroll.',
  '☕',
  '["I took out the trash and saw a tall man run toward the street.","\"I took out the trash and saw a tall man run toward the street.\"","Listen to me: I took out the trash and saw a tall man run toward the street.","I tell you the truth: I took out the trash and saw a tall man run toward the street."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'eac69a06-8dcf-5b67-b698-e5560d632d1b',
  'story_002',
  'Frankie "Two-Knives"',
  'Diner Short-Order Cook',
  'Gruff, loud, easily angered',
  'I was chopping onions in the kitchen all night.',
  'He owes money to the same loan shark as Eddie.',
  'Near the kitchen grill',
  'Argued with Eddie earlier over an unpaid food tab',
  'Heard two men shouting by the back door.',
  'Did not see who threw the metal flashlight.',
  '🍳',
  '["I was chopping onions in the kitchen all night.","\"I was chopping onions in the kitchen all night.\"","Listen to me: I was chopping onions in the kitchen all night.","I tell you the truth: I was chopping onions in the kitchen all night."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0f1d5b0f-1d73-5443-8d35-3ad4f5dd7d39',
  'story_002',
  'Eddie Finch',
  'Street Informant',
  'Paranoid, fast-talking, observant',
  'He whispers: "The badge... check the dock logs..."',
  'He made copies of every bribe receipt.',
  'Victim found in the alley',
  'Sold secrets to cops and reporters',
  'Witnessed Silas receiving cash at Pier 4.',
  'Did not expect Silas to ambush him so quickly.',
  '🗞️',
  '["He whispers: \"The badge... check the dock logs...\"","\"He whispers: \"The badge... check the dock logs...\"\"","Listen to me: He whispers: \"The badge... check the dock logs...\"","I tell you the truth: He whispers: \"The badge... check the dock logs...\""]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '37fc59f8-bc25-53e1-a6cf-a7270792a6b0',
  'story_002',
  'ev_1',
  1,
  '11:46 PM',
  'A heavy metal flashlight is found abandoned in the puddle.',
  'A heavy metal flashlight is found abandoned in the puddle.',
  'The attack weapon was standard police issue.',
  'Flashlight',
  'Heavy steel flashlight engraved with precinct numbers.',
  '["Baseball Bat","Lead Pipe","Wine Bottle"]'::jsonb,
  'Flashlight',
  '["flashlight","torch","police flashlight"]'::jsonb,
  'A metal tool that shines bright light.',
  'ev_2',
  true,
  '{"descriptions":["A heavy metal flashlight is found abandoned in the puddle.","At 11:46 PM: A heavy metal flashlight is found abandoned in the puddle.","Notice this clue: A heavy metal flashlight is found abandoned in the puddle."],"hints":["A metal tool that shines bright light.","Clue hint: Think about flashlight.","Search for: the attack weapon was standard police issue."],"clues":["Flashlight","Item: Flashlight","Clue Word: Flashlight"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f06c1091-c185-51a5-adb8-16c5f17024b8',
  'story_002',
  'ev_2',
  2,
  '11:47 PM',
  'A sealed brown envelope is clutched in Eddie’s hand.',
  'A sealed brown envelope is clutched in Eddie’s hand.',
  'The envelope has photos of illegal cash transfers.',
  'Envelope',
  'Manila paper envelope marked confidential.',
  '["Wallet","Pocket Watch","Cigarette Case"]'::jsonb,
  'Envelope',
  '["envelope","paper envelope","letter","packet"]'::jsonb,
  'A paper pouch used to hold letters.',
  'ev_3',
  false,
  '{"descriptions":["A sealed brown envelope is clutched in Eddie’s hand.","At 11:47 PM: A sealed brown envelope is clutched in Eddie’s hand.","Notice this clue: A sealed brown envelope is clutched in Eddie’s hand."],"hints":["A paper pouch used to hold letters.","Clue hint: Think about envelope.","Search for: the envelope has photos of illegal cash transfers."],"clues":["Envelope","Item: Envelope","Clue Word: Envelope"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9fb6ac2d-100d-5962-b61d-5e185b1f6db8',
  'story_002',
  'ev_3',
  3,
  '11:49 PM',
  'A brass police badge scrapes against the alley brick.',
  'A brass police badge scrapes against the alley brick.',
  'The attacker dropped or scraped their detective badge.',
  'Police Badge',
  'Gold-plated shield with serial number 418.',
  '["Silver Coin","Belt Buckle","Watch Face"]'::jsonb,
  'Police Badge',
  '["police badge","badge","shield","gold badge"]'::jsonb,
  'A metal shield worn to prove police authority.',
  'ev_4',
  false,
  '{"descriptions":["A brass police badge scrapes against the alley brick.","At 11:49 PM: A brass police badge scrapes against the alley brick.","Notice this clue: A brass police badge scrapes against the alley brick."],"hints":["A metal shield worn to prove police authority.","Clue hint: Think about police badge.","Search for: the attacker dropped or scraped their detective badge."],"clues":["Police Badge","Item: Police Badge","Clue Word: Police Badge"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bfd695d7-25be-5b27-bd5f-fd910e3d2ce4',
  'story_002',
  'ev_4',
  4,
  '11:51 PM',
  'Wet tire tracks show an official vehicle parked nearby.',
  'Wet tire tracks show an official vehicle parked nearby.',
  'The attacker fled in an unmarked police cruiser.',
  'Tire Tracks',
  'Tread marks matching department sedans.',
  '["Boot Print","Bicycle Tracks","Puddle Splash"]'::jsonb,
  'Tire Tracks',
  '["tire tracks","tread marks","tracks","tires"]'::jsonb,
  'Marks pressed into wet ground by car wheels.',
  'ev_5',
  false,
  '{"descriptions":["Wet tire tracks show an official vehicle parked nearby.","At 11:51 PM: Wet tire tracks show an official vehicle parked nearby.","Notice this clue: Wet tire tracks show an official vehicle parked nearby."],"hints":["Marks pressed into wet ground by car wheels.","Clue hint: Think about tire tracks.","Search for: the attacker fled in an unmarked police cruiser."],"clues":["Tire Tracks","Item: Tire Tracks","Clue Word: Tire Tracks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ca4a38b9-f10e-5d57-b6f4-043aa915caf6',
  'story_002',
  'ev_5',
  5,
  '11:55 PM',
  'A crushed cigar butt smelling of Turkish tobacco is found.',
  'A crushed cigar butt smelling of Turkish tobacco is found.',
  'The attacker smoked distinctive imported cigars.',
  'Cigar',
  'Gold-banded cigar butt found in the gutter.',
  '["Cigarette","Matchbook","Lighter"]'::jsonb,
  'Cigar',
  '["cigar","cigar butt","tobacco","smoke"]'::jsonb,
  'Thick roll of dried tobacco smoked by wealthy men.',
  'ev_6',
  true,
  '{"descriptions":["A crushed cigar butt smelling of Turkish tobacco is found.","At 11:55 PM: A crushed cigar butt smelling of Turkish tobacco is found.","Notice this clue: A crushed cigar butt smelling of Turkish tobacco is found."],"hints":["Thick roll of dried tobacco smoked by wealthy men.","Clue hint: Think about cigar.","Search for: the attacker smoked distinctive imported cigars."],"clues":["Cigar","Item: Cigar","Clue Word: Cigar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '599f216c-2846-5bbe-898a-e02424922daf',
  'story_002',
  'ev_6',
  6,
  '12:05 AM',
  'Film negatives are discovered hidden inside the jukebox.',
  'Film negatives are discovered hidden inside the jukebox.',
  'Eddie hid the master photos of the dock bribes.',
  'Film Strip',
  '35mm black-and-white film showing cash handed over.',
  '["Cassette Tape","Newspaper","Map"]'::jsonb,
  'Film Strip',
  '["film strip","film","negatives","photos"]'::jsonb,
  'Dark plastic strip used in cameras to take pictures.',
  'ev_7',
  false,
  '{"descriptions":["Film negatives are discovered hidden inside the jukebox.","At 12:05 AM: Film negatives are discovered hidden inside the jukebox.","Notice this clue: Film negatives are discovered hidden inside the jukebox."],"hints":["Dark plastic strip used in cameras to take pictures.","Clue hint: Think about film strip.","Search for: eddie hid the master photos of the dock bribes."],"clues":["Film Strip","Item: Film Strip","Clue Word: Film Strip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '80aea73e-c2ae-578c-8a53-313be02b2a0b',
  'story_002',
  'ev_7',
  7,
  '12:15 AM',
  'A black ledger with bribe dates is pulled from a locker.',
  'A black ledger with bribe dates is pulled from a locker.',
  'Silas had been taking cash for eighteen months.',
  'Secret Ledger',
  'Notebook with initials and payment dates.',
  '["Phone Book","Menu Card","Dictionary"]'::jsonb,
  'Secret Ledger',
  '["secret ledger","ledger","notebook","black book","bribe book"]'::jsonb,
  'A book used to record secret accounts.',
  'ev_8',
  false,
  '{"descriptions":["A black ledger with bribe dates is pulled from a locker.","At 12:15 AM: A black ledger with bribe dates is pulled from a locker.","Notice this clue: A black ledger with bribe dates is pulled from a locker."],"hints":["A book used to record secret accounts.","Clue hint: Think about secret ledger.","Search for: silas had been taking cash for eighteen months."],"clues":["Secret Ledger","Item: Secret Ledger","Clue Word: Secret Ledger"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '68da7a77-2a32-55b0-81b7-b6af19939226',
  'story_002',
  'ev_8',
  8,
  '12:30 AM',
  'A silver cufflink with letter V is found near the drain.',
  'A silver cufflink with letter V is found near the drain.',
  'Matches the monogram on Silas Vance’s shirt sleeve.',
  'Silver Cufflink',
  'Sterling silver cufflink with engraved letter V.',
  '["Shirt Button","Tie Clip","Ring"]'::jsonb,
  'Silver Cufflink',
  '["silver cufflink","cufflink","button","jewelry"]'::jsonb,
  'A small decorative metal clasp for shirt sleeves.',
  NULL,
  true,
  '{"descriptions":["A silver cufflink with letter V is found near the drain.","At 12:30 AM: A silver cufflink with letter V is found near the drain.","Notice this clue: A silver cufflink with letter V is found near the drain."],"hints":["A small decorative metal clasp for shirt sleeves.","Clue hint: Think about silver cufflink.","Search for: matches the monogram on silas vance’s shirt sleeve."],"clues":["Silver Cufflink","Item: Silver Cufflink","Clue Word: Silver Cufflink"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_003 — THE VELVET CIGAR LOUNGE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_003',
  'The Velvet Cigar Lounge',
  'Noir Mystery',
  'The private VIP parlor of the Velvet Smoke Club, mahogany and smoke',
  'A magnetic audio tape was stolen from the owner’s private wall safe behind an oil painting.',
  '[{"name":"Cassandra Bell","role":"Lounge Singer","alibi":"Backstage dressing room during drum solo","avatar":"🎤"},{"name":"Victor Vance","role":"Head Bartender","alibi":"Main lounge bar station","avatar":"🍸"},{"name":"Arthur Sterling","role":"Club Owner & Fixer","alibi":"Sitting at VIP table 1 talking to city officials","avatar":"💼"},{"name":"Dr. Julian Ross","role":"Club Regular & Physician","alibi":"Boasting at the corner booth with friends","avatar":"🩺"}]'::jsonb,
  'Club singer Cassandra Bell slipped into the parlor during the band solo. Using a medical stethoscope stolen from Dr. Ross, she cracked the safe and stole the tape.',
  'Cassandra Bell',
  'The tape contained her private confession that would send her to prison.',
  '[{"time":"10:00 PM","event":"Dr. Ross hangs his medical bag by the coat check."},{"time":"10:30 PM","event":"Cassandra takes stethoscope from the doctor’s bag."},{"time":"11:00 PM","event":"The jazz band begins a loud ten-minute drum solo."},{"time":"11:05 PM","event":"The wall safe behind the portrait is spun open."},{"time":"11:15 PM","event":"Arthur enters the parlor and finds the safe ajar."}]'::jsonb,
  '[{"id":"ev1","title":"Missing Stethoscope","detail":"Taken from Dr. Ross’s bag to listen to safe tumblers."},{"id":"ev2","title":"Red Silk Fiber","detail":"Found pinched in the door of Arthur’s wall safe."},{"id":"ev3","title":"Scarlet Lipstick","detail":"Dropped on the rug behind the parlor sofa."},{"id":"ev4","title":"Hidden Tape in Vanity","detail":"Magnetic spool discovered beneath cosmetic powder."}]'::jsonb,
  '[{"order":1,"title":"Stethoscope","text":"Doctor tool used to hear tumblers click inside the safe."},{"order":2,"title":"Oil Painting","text":"Canvas painting tilted aside to reveal the secret wall safe."},{"order":3,"title":"Safe Dial","text":"Numbered wheel spun cleanly during the loud drum solo."},{"order":4,"title":"Cassette Tape","text":"Magnetic audio reel holding dangerous blackmail voices."},{"order":5,"title":"Red Silk Thread","text":"Crimson cloth fibers matching the singer’s evening gown."},{"order":6,"title":"Lipstick Tube","text":"Silver makeup stick dropped under the VIP parlor couch."}]'::jsonb,
  'Bartender Victor had a duplicate brass key.: The key was only for wine storage, not the safe.; Dr. Ross was seen pacing near the VIP door.: He was waiting for his turn to use the restroom.',
  'Blame bartender Victor or claim an outside mob crew kicked open the safe.',
  'NORMAL',
  'Who cracked the wall safe and took the tape that records the mayor’s secret deals?',
  '[{"character":"Cassandra Bell","secret":"She was blackmailed on that tape for diamond smuggling."},{"character":"Victor Vance","secret":"He was skimming cash from top-shelf liquor orders."},{"character":"Arthur Sterling","secret":"Used secret audio recordings to blackmail city leaders."},{"character":"Dr. Julian Ross","secret":"Wrote false prescriptions for lounge patrons."}]'::jsonb,
  '[{"lead":"Bartender Victor had a duplicate brass key.","explanation":"The key was only for wine storage, not the safe."},{"lead":"Dr. Ross was seen pacing near the VIP door.","explanation":"He was waiting for his turn to use the restroom."}]'::jsonb,
  '{"wrongTheories":["A rival mob gang brought dynamite and blew open the safe.","Victor Vance unlocked the safe with his bar key to steal money."],"correctTheory":"Cassandra Bell used a stolen stethoscope to crack the combination during the loud drum solo and took the blackmail tape to protect her freedom."}'::jsonb,
  'Cassandra Bell used Dr. Ross’s stethoscope to steal her own blackmail tape!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The red silk thread and lipstick proved Cassandra took the tape. Arthur’s blackmail empire collapsed when police impounded the recordings."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Bartender Victor was accused of safecracking. Cassandra quietly slipped out of town with the tape on the morning train."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The blame fell on fictitious mob rivals. Arthur destroyed the club in revenge while Cassandra remained free."}]'::jsonb,
  '{"intros":["A magnetic audio tape was stolen from the owner’s private wall safe behind an oil painting.","Case file story_003: A magnetic audio tape was stolen from the owner’s private wall safe behind an oil painting. Look closely at every clue.","Trouble begins in The private VIP parlor of the Velvet Smoke Club, mahogany and smoke. A magnetic audio tape was stolen from the owner’s private wall safe behind an oil painting.","The mystery starts now. A magnetic audio tape was stolen from the owner’s private wall safe behind an oil painting. Can you solve it?"],"reveals":["Cassandra Bell used Dr. Ross’s stethoscope to steal her own blackmail tape!","The mystery is unraveled! Cassandra Bell used Dr. Ross’s stethoscope to steal her own blackmail tape!","At last, the truth comes out: Cassandra Bell used Dr. Ross’s stethoscope to steal her own blackmail tape!","Case resolved! Here is what happened: Cassandra Bell used Dr. Ross’s stethoscope to steal her own blackmail tape!"],"hints":["Pay attention to where Cassandra Bell was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_003';
DELETE FROM public.case_events WHERE case_id = 'story_003';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4de586ef-363e-51a3-ba65-ad20e4677a1a',
  'story_003',
  'Cassandra Bell',
  'Lounge Singer',
  'Charming, anxious, elegant',
  'I was on stage singing until the interlude lights blinked.',
  'She was blackmailed on that tape for diamond smuggling.',
  'Backstage dressing room during drum solo',
  'Main performer at the Velvet Smoke Club',
  'Safe is hidden behind the portrait of the founder.',
  'Left a red silk thread caught in the door hinge.',
  '🎤',
  '["I was on stage singing until the interlude lights blinked.","\"I was on stage singing until the interlude lights blinked.\"","Listen to me: I was on stage singing until the interlude lights blinked.","I tell you the truth: I was on stage singing until the interlude lights blinked."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c6a6c044-d338-50f9-99d8-5d6e8f23a0fd',
  'story_003',
  'Victor Vance',
  'Head Bartender',
  'Quiet, observant, always polishing glasses',
  'I stayed behind the brass bar mixing martinis all night.',
  'He was skimming cash from top-shelf liquor orders.',
  'Main lounge bar station',
  'Holds key to VIP liquor cabinet',
  'Saw Cassandra slip into back hall with a purse.',
  'Did not know the wall safe had an alarm trigger.',
  '🍸',
  '["I stayed behind the brass bar mixing martinis all night.","\"I stayed behind the brass bar mixing martinis all night.\"","Listen to me: I stayed behind the brass bar mixing martinis all night.","I tell you the truth: I stayed behind the brass bar mixing martinis all night."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '407f1e50-500f-55bf-891b-41fc2bf6b220',
  'story_003',
  'Arthur Sterling',
  'Club Owner & Fixer',
  'Greedy, calculating, ruthless',
  'Whoever touched my safe is going into the river.',
  'Used secret audio recordings to blackmail city leaders.',
  'Sitting at VIP table 1 talking to city officials',
  'Owner of the club and creator of secret tapes',
  'Only three people knew the painting hid a steel safe.',
  'Did not know Cassandra had medical tools in her bag.',
  '💼',
  '["Whoever touched my safe is going into the river.","\"Whoever touched my safe is going into the river.\"","Listen to me: Whoever touched my safe is going into the river.","I tell you the truth: Whoever touched my safe is going into the river."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7bb601ff-708e-5253-b354-8a75f22f2288',
  'story_003',
  'Dr. Julian Ross',
  'Club Regular & Physician',
  'Drunk, talkative, distracted',
  'I lost my doctor bag under the coat rack around nine o’clock.',
  'Wrote false prescriptions for lounge patrons.',
  'Boasting at the corner booth with friends',
  'Friendly patron who chatted with Cassandra backstage',
  'Noticed his stethoscope was missing from his bag.',
  'Did not realize his friend Cassandra took it.',
  '🩺',
  '["I lost my doctor bag under the coat rack around nine o’clock.","\"I lost my doctor bag under the coat rack around nine o’clock.\"","Listen to me: I lost my doctor bag under the coat rack around nine o’clock.","I tell you the truth: I lost my doctor bag under the coat rack around nine o’clock."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '907ea334-5406-52d7-aa99-cf6e7e89e780',
  'story_003',
  'ev_1',
  1,
  '10:30 PM',
  'A stethoscope is missing from Dr. Ross’s leather bag.',
  'A stethoscope is missing from Dr. Ross’s leather bag.',
  'The safecracker needed listening gear to hear tumblers.',
  'Stethoscope',
  'Empty velvet pouch in the medical travel kit.',
  '["Syringe","Thermometer","Scalpel"]'::jsonb,
  'Stethoscope',
  '["stethoscope","medical tool","hearing device"]'::jsonb,
  'Doctors press this cold metal disc to your chest.',
  'ev_2',
  true,
  '{"descriptions":["A stethoscope is missing from Dr. Ross’s leather bag.","At 10:30 PM: A stethoscope is missing from Dr. Ross’s leather bag.","Notice this clue: A stethoscope is missing from Dr. Ross’s leather bag."],"hints":["Doctors press this cold metal disc to your chest.","Clue hint: Think about stethoscope.","Search for: the safecracker needed listening gear to hear tumblers."],"clues":["Stethoscope","Item: Stethoscope","Clue Word: Stethoscope"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '689ca744-cfee-5a14-892e-35c388afecc9',
  'story_003',
  'ev_2',
  2,
  '11:02 PM',
  'The heavy oil painting of the club founder is tilted on its wire.',
  'The heavy oil painting of the club founder is tilted on its wire.',
  'The safe was reached by swinging the portrait to the side.',
  'Oil Painting',
  'Gilded picture frame with smudges on the corner.',
  '["Mirror","Wall Clock","Tapestry"]'::jsonb,
  'Oil Painting',
  '["oil painting","painting","portrait","picture"]'::jsonb,
  'A canvas with painted colors hanging on the wall.',
  'ev_3',
  false,
  '{"descriptions":["The heavy oil painting of the club founder is tilted on its wire.","At 11:02 PM: The heavy oil painting of the club founder is tilted on its wire.","Notice this clue: The heavy oil painting of the club founder is tilted on its wire."],"hints":["A canvas with painted colors hanging on the wall.","Clue hint: Think about oil painting.","Search for: the safe was reached by swinging the portrait to the side."],"clues":["Oil Painting","Item: Oil Painting","Clue Word: Oil Painting"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '26e17317-06ad-54b2-b648-a87696a8d2a6',
  'story_003',
  'ev_3',
  3,
  '11:05 PM',
  'The steel combination dial is spun open without drills.',
  'The steel combination dial is spun open without drills.',
  'The safe was opened cleanly using acoustic listening.',
  'Safe Dial',
  'Chrome tumbler dial with zero scratch marks.',
  '["Keyhole","Padlock","Deadbolt"]'::jsonb,
  'Safe Dial',
  '["safe dial","dial","combination","lock"]'::jsonb,
  'A round numbered knob you turn left and right.',
  'ev_4',
  false,
  '{"descriptions":["The steel combination dial is spun open without drills.","At 11:05 PM: The steel combination dial is spun open without drills.","Notice this clue: The steel combination dial is spun open without drills."],"hints":["A round numbered knob you turn left and right.","Clue hint: Think about safe dial.","Search for: the safe was opened cleanly using acoustic listening."],"clues":["Safe Dial","Item: Safe Dial","Clue Word: Safe Dial"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ad5cc523-e8e4-583f-a5d4-38e5e24c73fc',
  'story_003',
  'ev_4',
  4,
  '11:06 PM',
  'A reel of magnetic recording tape is pulled from the safe.',
  'A reel of magnetic recording tape is pulled from the safe.',
  'The stolen item was an audio reel with blackmail voices.',
  'Cassette Tape',
  'Plastic reel case marked "Mayor & Cassandra".',
  '["Gold Bar","Stack of Cash","Diamond Necklace"]'::jsonb,
  'Cassette Tape',
  '["cassette tape","tape","audio tape","reel"]'::jsonb,
  'A spool of dark brown magnetic tape that plays voices.',
  'ev_5',
  false,
  '{"descriptions":["A reel of magnetic recording tape is pulled from the safe.","At 11:06 PM: A reel of magnetic recording tape is pulled from the safe.","Notice this clue: A reel of magnetic recording tape is pulled from the safe."],"hints":["A spool of dark brown magnetic tape that plays voices.","Clue hint: Think about cassette tape.","Search for: the stolen item was an audio reel with blackmail voices."],"clues":["Cassette Tape","Item: Cassette Tape","Clue Word: Cassette Tape"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e4ff7065-bfed-52c6-9389-e6b3c031700d',
  'story_003',
  'ev_5',
  5,
  '11:08 PM',
  'A strand of red silk thread is caught in the safe hinge.',
  'A strand of red silk thread is caught in the safe hinge.',
  'The thief wore a red silk evening gown.',
  'Red Silk Thread',
  'Crimson fabric fiber matching Cassandra’s dress.',
  '["Cotton Fiber","Nylon Cord","Wool Fluff"]'::jsonb,
  'Red Silk Thread',
  '["red silk thread","silk","red silk","thread","silk thread"]'::jsonb,
  'A delicate shiny fiber from luxury red cloth.',
  'ev_6',
  true,
  '{"descriptions":["A strand of red silk thread is caught in the safe hinge.","At 11:08 PM: A strand of red silk thread is caught in the safe hinge.","Notice this clue: A strand of red silk thread is caught in the safe hinge."],"hints":["A delicate shiny fiber from luxury red cloth.","Clue hint: Think about red silk thread.","Search for: the thief wore a red silk evening gown."],"clues":["Red Silk Thread","Item: Red Silk Thread","Clue Word: Red Silk Thread"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '47968651-c374-5df3-82b6-6361adcd77ba',
  'story_003',
  'ev_6',
  6,
  '11:12 PM',
  'A silver lipstick tube is dropped under the sofa.',
  'A silver lipstick tube is dropped under the sofa.',
  'The shade is "Scarlet Velvet", Cassandra’s makeup.',
  'Lipstick Tube',
  'Engraved silver cosmetic tube with red paste.',
  '["Lighter","Cigar Tube","Perfume Bottle"]'::jsonb,
  'Lipstick Tube',
  '["lipstick tube","lipstick","makeup"]'::jsonb,
  'A small colored cosmetic stick used on lips.',
  'ev_7',
  false,
  '{"descriptions":["A silver lipstick tube is dropped under the sofa.","At 11:12 PM: A silver lipstick tube is dropped under the sofa.","Notice this clue: A silver lipstick tube is dropped under the sofa."],"hints":["A small colored cosmetic stick used on lips.","Clue hint: Think about lipstick tube.","Search for: the shade is \"scarlet velvet\", cassandra’s makeup."],"clues":["Lipstick Tube","Item: Lipstick Tube","Clue Word: Lipstick Tube"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a956fc48-d002-5edc-b988-e41a9cb2814f',
  'story_003',
  'ev_7',
  7,
  '11:20 PM',
  'Pointed heel marks in cigar ash lead toward the dressing room.',
  'Pointed heel marks in cigar ash lead toward the dressing room.',
  'The thief wore high heels leaving footprints in ash.',
  'High Heels',
  'Pointed heel impressions in the deep carpet.',
  '["Work Boots","Sneakers","Loafers"]'::jsonb,
  'High Heels',
  '["high heels","heels","shoes","footprints"]'::jsonb,
  'Women’s dress shoes with tall pointed heels.',
  'ev_8',
  false,
  '{"descriptions":["Pointed heel marks in cigar ash lead toward the dressing room.","At 11:20 PM: Pointed heel marks in cigar ash lead toward the dressing room.","Notice this clue: Pointed heel marks in cigar ash lead toward the dressing room."],"hints":["Women’s dress shoes with tall pointed heels.","Clue hint: Think about high heels.","Search for: the thief wore high heels leaving footprints in ash."],"clues":["High Heels","Item: High Heels","Clue Word: High Heels"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1dd3b409-8560-5e39-8d2c-0ae59932695b',
  'story_003',
  'ev_8',
  8,
  '11:30 PM',
  'The stolen audio reel is found in a cosmetic vanity case.',
  'The stolen audio reel is found in a cosmetic vanity case.',
  'Cassandra hid the reel under her makeup powder.',
  'Makeup Case',
  'Black leather vanity box with powders and tape reel.',
  '["Instrument Box","Guitar Case","Trash Can"]'::jsonb,
  'Makeup Case',
  '["makeup case","vanity case","vanity box"]'::jsonb,
  'A portable box with mirrors and beauty products.',
  NULL,
  true,
  '{"descriptions":["The stolen audio reel is found in a cosmetic vanity case.","At 11:30 PM: The stolen audio reel is found in a cosmetic vanity case.","Notice this clue: The stolen audio reel is found in a cosmetic vanity case."],"hints":["A portable box with mirrors and beauty products.","Clue hint: Think about makeup case.","Search for: cassandra hid the reel under her makeup powder."],"clues":["Makeup Case","Item: Makeup Case","Clue Word: Makeup Case"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_004 — SHADOW OVER PIER 9
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_004',
  'Shadow over Pier 9',
  'Noir Mystery',
  'Pier 9 Shipping Docks, rusty iron cranes and sea mist',
  'A shipping container marked "Import Tea" was broken into at 3:00 AM, revealing counterfeit gold bars.',
  '[{"name":"Owen Reed","role":"Harbor Master","alibi":"Harbor control tower third floor","avatar":"⚓"},{"name":"Benny \"Gears\" Cooper","role":"Night Crane Operator","alibi":"Dock cafeteria drinking tea","avatar":"🏗️"},{"name":"Captain Sean Murphy","role":"Cargo Ship Captain","alibi":"Asleep in cabin aboard freighter","avatar":"🚢"},{"name":"Tara Lin","role":"Customs Inspector","alibi":"Inspecting customs shed B","avatar":"📋"}]'::jsonb,
  'Harbor Master Owen Reed used his master crane keycard to move Container 44 into dark shadows. He cut the lock with a torch, expecting gold bullion, but found fake painted lead.',
  'Harbor Master Owen Reed',
  'He was paid ten thousand dollars to help swap contraband cargo.',
  '[{"time":"01:00 AM","event":"Freighter Sea Serpent docks at Pier 9 in thick fog."},{"time":"02:00 AM","event":"Container 44 unloaded onto concrete apron."},{"time":"02:35 AM","event":"Crane 3 is switched on without a work order."},{"time":"02:50 AM","event":"Blowtorch sparks fly as the container seal is cut."},{"time":"03:10 AM","event":"Inspector Tara Lin discovers the container open."}]'::jsonb,
  '[{"id":"ev1","title":"Supervisor Keycard","detail":"Used to turn on Crane 3; registered to Owen Reed."},{"id":"ev2","title":"Acetylene Blowtorch","detail":"Found behind salt bins with Owen’s initials on the regulator."},{"id":"ev3","title":"Forged Manifest","detail":"Cargo sheet printed on harbor tower stationery."},{"id":"ev4","title":"Lead Gold Bars","detail":"Crude lead bars sprayed with metallic yellow paint."}]'::jsonb,
  '[{"order":1,"title":"Crane Keycard","text":"Plastic badge used to start the crane in the dark."},{"order":2,"title":"Shipping Container","text":"Green iron freight box marked 44 moved to the shadows."},{"order":3,"title":"Blowtorch","text":"Gas flame burner used to melt through the hardened door latch."},{"order":4,"title":"Fake Gold Bars","text":"Heavy yellow bricks that were actually grey lead."},{"order":5,"title":"Forged Manifest","text":"Paper document stamped with fake port authority seals."},{"order":6,"title":"Work Glove","text":"Leather glove with scorch burns and the initials O.R."}]'::jsonb,
  'Benny had grease on his hands in cafeteria.: He repaired the cafeteria dishwasher on break.; Captain Murphy had foreign banknotes.: Legitimate crew payroll from his home port in Lisbon.',
  'Blame crane operator Benny or claim pirates raided the pier from speedboats.',
  'NORMAL',
  'Who replaced the manifest and broke into Container 44 on Pier 9?',
  '[{"character":"Owen Reed","secret":"Took payoffs in foreign accounts to clear illegal cargo."},{"character":"Benny \"Gears\" Cooper","secret":"Saw Owen climbing up the crane ladder around 2:30 AM."},{"character":"Captain Sean Murphy","secret":"Carried secret orders to hand the container key to Owen Reed."},{"character":"Tara Lin","secret":"Placed a tracking transmitter on the container doors."}]'::jsonb,
  '[{"lead":"Benny had grease on his hands in cafeteria.","explanation":"He repaired the cafeteria dishwasher on break."},{"lead":"Captain Murphy had foreign banknotes.","explanation":"Legitimate crew payroll from his home port in Lisbon."}]'::jsonb,
  '{"wrongTheories":["Pirates arrived in high-speed boats and raided the pier under fog.","Benny the operator stole the container to sell scrap metal."],"correctTheory":"Harbor Master Owen Reed used his keycard to move Container 44, melted the lock with a torch, and attempted to steal what he thought was smuggled gold bullion."}'::jsonb,
  'Harbor Master Owen Reed raided the container expecting real gold bullion!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The crane keycard logs and scorched glove sealed Owen Reed’s arrest. Inspector Tara Lin broke the smuggling syndicate."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Benny Cooper was charged with machine tampering. Owen Reed slipped onto a ship bound for South America."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The docks fell into panic after rumors of sea pirates. Owen covered his tracks and kept his job."}]'::jsonb,
  '{"intros":["A shipping container marked \"Import Tea\" was broken into at 3:00 AM, revealing counterfeit gold bars.","Case file story_004: A shipping container marked \"Import Tea\" was broken into at 3:00 AM, revealing counterfeit gold bars. Look closely at every clue.","Trouble begins in Pier 9 Shipping Docks, rusty iron cranes and sea mist. A shipping container marked \"Import Tea\" was broken into at 3:00 AM, revealing counterfeit gold bars.","The mystery starts now. A shipping container marked \"Import Tea\" was broken into at 3:00 AM, revealing counterfeit gold bars. Can you solve it?"],"reveals":["Harbor Master Owen Reed raided the container expecting real gold bullion!","The mystery is unraveled! Harbor Master Owen Reed raided the container expecting real gold bullion!","At last, the truth comes out: Harbor Master Owen Reed raided the container expecting real gold bullion!","Case resolved! Here is what happened: Harbor Master Owen Reed raided the container expecting real gold bullion!"],"hints":["Pay attention to where Harbor Master Owen Reed was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_004';
DELETE FROM public.case_events WHERE case_id = 'story_004';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c36fd78b-6dd8-56c1-a533-0c00e9d48a26',
  'story_004',
  'Owen Reed',
  'Harbor Master',
  'Authoritarian, calculating, weathered face',
  'I was in the control tower inspecting dock weather logs all night.',
  'Took payoffs in foreign accounts to clear illegal cargo.',
  'Harbor control tower third floor',
  'Master clearance over every crane and container slip',
  'Container 44 was listed under a dummy corporation.',
  'Smugglers cheated him with fake gold bars.',
  '⚓',
  '["I was in the control tower inspecting dock weather logs all night.","\"I was in the control tower inspecting dock weather logs all night.\"","Listen to me: I was in the control tower inspecting dock weather logs all night.","I tell you the truth: I was in the control tower inspecting dock weather logs all night."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4d3670ff-4c52-57b5-88c6-e977c5d787b3',
  'story_004',
  'Benny "Gears" Cooper',
  'Night Crane Operator',
  'Nervous, hard-working, dirty overalls',
  'I shut down crane three at midnight like my supervisor ordered.',
  'Saw Owen climbing up the crane ladder around 2:30 AM.',
  'Dock cafeteria drinking tea',
  'Operates heavy machinery on Pier 9',
  'Saw the boom light on Crane 3 swing toward Container 44.',
  'Did not know what was packed inside the iron crates.',
  '🏗️',
  '["I shut down crane three at midnight like my supervisor ordered.","\"I shut down crane three at midnight like my supervisor ordered.\"","Listen to me: I shut down crane three at midnight like my supervisor ordered.","I tell you the truth: I shut down crane three at midnight like my supervisor ordered."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7635b519-0eb0-5efe-a69a-16ecdaac24c4',
  'story_004',
  'Captain Sean Murphy',
  'Cargo Ship Captain',
  'Gruff, bearded, smells of tobacco and salt',
  'My crew delivered twenty containers. What happens on the pier is not my job.',
  'Carried secret orders to hand the container key to Owen Reed.',
  'Asleep in cabin aboard freighter',
  'Master of vessel carrying Container 44',
  'Portuguese manifest originally listed scrap metal.',
  'Did not know local syndicates planned to raid it tonight.',
  '🚢',
  '["My crew delivered twenty containers. What happens on the pier is not my job.","\"My crew delivered twenty containers. What happens on the pier is not my job.\"","Listen to me: My crew delivered twenty containers. What happens on the pier is not my job.","I tell you the truth: My crew delivered twenty containers. What happens on the pier is not my job."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'be6aff87-eff4-549b-bfcd-a6048f24cd2d',
  'story_004',
  'Tara Lin',
  'Customs Inspector',
  'Sharp, relentless, armed with clipboard and flashlight',
  'Container 44 had a forged customs stamp on the gate sheet.',
  'Placed a tracking transmitter on the container doors.',
  'Inspecting customs shed B',
  'Investigating illegal maritime smuggling routes',
  'Found melted metal residue from an industrial torch.',
  'Did not know Owen had master keycard access.',
  '📋',
  '["Container 44 had a forged customs stamp on the gate sheet.","\"Container 44 had a forged customs stamp on the gate sheet.\"","Listen to me: Container 44 had a forged customs stamp on the gate sheet.","I tell you the truth: Container 44 had a forged customs stamp on the gate sheet."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '82767bb9-a22f-5dc2-ab08-abfce5c785b0',
  'story_004',
  'ev_1',
  1,
  '02:35 AM',
  'Crane 3 is engaged with a supervisor keycard.',
  'Crane 3 is engaged with a supervisor keycard.',
  'Only top supervisors carry keycards that activate the crane.',
  'Crane Keycard',
  'Magnetic card stamped with harbor administration crest.',
  '["Truck Key","Padlock Key","Elevator Fob"]'::jsonb,
  'Crane Keycard',
  '["crane keycard","keycard","card","badge"]'::jsonb,
  'A plastic card used to turn on large machines.',
  'ev_2',
  true,
  '{"descriptions":["Crane 3 is engaged with a supervisor keycard.","At 02:35 AM: Crane 3 is engaged with a supervisor keycard.","Notice this clue: Crane 3 is engaged with a supervisor keycard."],"hints":["A plastic card used to turn on large machines.","Clue hint: Think about crane keycard.","Search for: only top supervisors carry keycards that activate the crane."],"clues":["Crane Keycard","Item: Crane Keycard","Clue Word: Crane Keycard"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '995a5dac-7ee8-5dd9-88a8-90ded3ac04d1',
  'story_004',
  'ev_2',
  2,
  '02:45 AM',
  'A heavy iron shipping container is moved into the shadows.',
  'A heavy iron shipping container is moved into the shadows.',
  'The container was moved to evade security cameras.',
  'Shipping Container',
  'Green corrugated steel box with number 44.',
  '["Wooden Crate","Cardboard Box","Metal Barrel"]'::jsonb,
  'Shipping Container',
  '["shipping container","container","cargo box"]'::jsonb,
  'A giant metal box used on freight ships.',
  'ev_3',
  false,
  '{"descriptions":["A heavy iron shipping container is moved into the shadows.","At 02:45 AM: A heavy iron shipping container is moved into the shadows.","Notice this clue: A heavy iron shipping container is moved into the shadows."],"hints":["A giant metal box used on freight ships.","Clue hint: Think about shipping container.","Search for: the container was moved to evade security cameras."],"clues":["Shipping Container","Item: Shipping Container","Clue Word: Shipping Container"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '418fc2b4-bd69-5597-a47a-5341e4db616c',
  'story_004',
  'ev_3',
  3,
  '02:50 AM',
  'An acetylene blowtorch melts through the door latch.',
  'An acetylene blowtorch melts through the door latch.',
  'The heavy steel lock was cut with gas flame.',
  'Blowtorch',
  'Portable gas torch with red and green hoses.',
  '["Hand Saw","Crowbar","Sledgehammer"]'::jsonb,
  'Blowtorch',
  '["blowtorch","torch","cutting torch","gas torch"]'::jsonb,
  'A tool that shoots a hot blue flame to cut metal.',
  'ev_4',
  false,
  '{"descriptions":["An acetylene blowtorch melts through the door latch.","At 02:50 AM: An acetylene blowtorch melts through the door latch.","Notice this clue: An acetylene blowtorch melts through the door latch."],"hints":["A tool that shoots a hot blue flame to cut metal.","Clue hint: Think about blowtorch.","Search for: the heavy steel lock was cut with gas flame."],"clues":["Blowtorch","Item: Blowtorch","Clue Word: Blowtorch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '74e9c539-c758-5e21-95d4-5f1bcde4f421',
  'story_004',
  'ev_4',
  4,
  '02:55 AM',
  'Heavy yellow metal bars wrapped in burlap are dropped.',
  'Heavy yellow metal bars wrapped in burlap are dropped.',
  'The bars look like gold but are lead painted yellow.',
  'Fake Gold Bars',
  'Heavy bars with chipped paint showing grey lead.',
  '["Silver Coins","Copper Ingots","Iron Bricks"]'::jsonb,
  'Fake Gold Bars',
  '["fake gold bars","gold bars","fake gold","gold","bars"]'::jsonb,
  'Shiny yellow bricks that turn out to be cheap fake metals.',
  'ev_5',
  false,
  '{"descriptions":["Heavy yellow metal bars wrapped in burlap are dropped.","At 02:55 AM: Heavy yellow metal bars wrapped in burlap are dropped.","Notice this clue: Heavy yellow metal bars wrapped in burlap are dropped."],"hints":["Shiny yellow bricks that turn out to be cheap fake metals.","Clue hint: Think about fake gold bars.","Search for: the bars look like gold but are lead painted yellow."],"clues":["Fake Gold Bars","Item: Fake Gold Bars","Clue Word: Fake Gold Bars"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c8950d3a-421f-5ed2-a788-3c0d0cecb295',
  'story_004',
  'ev_5',
  5,
  '03:00 AM',
  'A forged paper manifest is dropped near the container.',
  'A forged paper manifest is dropped near the container.',
  'The paper came from the Harbor Master’s printer.',
  'Forged Manifest',
  'Printed cargo invoice with fake customs stamps.',
  '["Newspaper","Map","Receipt"]'::jsonb,
  'Forged Manifest',
  '["forged manifest","manifest","paper","invoice"]'::jsonb,
  'An official list of cargo on a ship.',
  'ev_6',
  true,
  '{"descriptions":["A forged paper manifest is dropped near the container.","At 03:00 AM: A forged paper manifest is dropped near the container.","Notice this clue: A forged paper manifest is dropped near the container."],"hints":["An official list of cargo on a ship.","Clue hint: Think about forged manifest.","Search for: the paper came from the harbor master’s printer."],"clues":["Forged Manifest","Item: Forged Manifest","Clue Word: Forged Manifest"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '09788675-08e9-5237-bf20-ad77d2d8b03f',
  'story_004',
  'ev_6',
  6,
  '03:05 AM',
  'A scorched leather work glove is found in the mud.',
  'A scorched leather work glove is found in the mud.',
  'The glove has initials O.R. stamped in the cuff.',
  'Work Glove',
  'Cowhide glove stained with blue scorch burns.',
  '["Wool Mitten","Rubber Glove","Silk Handkerchief"]'::jsonb,
  'Work Glove',
  '["work glove","glove","leather glove"]'::jsonb,
  'Heavy protective clothing you wear on your hands.',
  'ev_7',
  false,
  '{"descriptions":["A scorched leather work glove is found in the mud.","At 03:05 AM: A scorched leather work glove is found in the mud.","Notice this clue: A scorched leather work glove is found in the mud."],"hints":["Heavy protective clothing you wear on your hands.","Clue hint: Think about work glove.","Search for: the glove has initials o.r. stamped in the cuff."],"clues":["Work Glove","Item: Work Glove","Clue Word: Work Glove"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '767cb0da-d45f-53c9-a8f7-fa005caf86b3',
  'story_004',
  'ev_7',
  7,
  '03:15 AM',
  'A tiny GPS tracking beacon blinks red under the frame.',
  'A tiny GPS tracking beacon blinks red under the frame.',
  'Customs was secretly tracking this exact container.',
  'GPS Tracker',
  'Magnetic black box with a blinking red light.',
  '["Flashlight","Pocket Radio","Watch"]'::jsonb,
  'GPS Tracker',
  '["gps tracker","tracker","beacon","gps"]'::jsonb,
  'A small device that sends location signals to satellites.',
  'ev_8',
  false,
  '{"descriptions":["A tiny GPS tracking beacon blinks red under the frame.","At 03:15 AM: A tiny GPS tracking beacon blinks red under the frame.","Notice this clue: A tiny GPS tracking beacon blinks red under the frame."],"hints":["A small device that sends location signals to satellites.","Clue hint: Think about gps tracker.","Search for: customs was secretly tracking this exact container."],"clues":["GPS Tracker","Item: GPS Tracker","Clue Word: GPS Tracker"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9bbd1e80-08fb-5942-b28d-b4d8866ba5bc',
  'story_004',
  'ev_8',
  8,
  '03:25 AM',
  'Muddy boots with grease are found inside the tower.',
  'Muddy boots with grease are found inside the tower.',
  'Owen walked directly from the container up to his office.',
  'Dock Boots',
  'Steel-toed boots matching tracks left on the pier.',
  '["Running Shoes","Rain Slippers","Sandals"]'::jsonb,
  'Dock Boots',
  '["dock boots","boots","shoes","work boots"]'::jsonb,
  'Thick waterproof footwear with steel toes.',
  NULL,
  true,
  '{"descriptions":["Muddy boots with grease are found inside the tower.","At 03:25 AM: Muddy boots with grease are found inside the tower.","Notice this clue: Muddy boots with grease are found inside the tower."],"hints":["Thick waterproof footwear with steel toes.","Clue hint: Think about dock boots.","Search for: owen walked directly from the container up to his office."],"clues":["Dock Boots","Item: Dock Boots","Clue Word: Dock Boots"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_005 — THE BROKEN RECORD DEAL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_005',
  'The Broken Record Deal',
  'Noir Mystery',
  'Black Note Recording Studios & Back Alley Burn Barrel, downtown',
  'A master vinyl recording and a multimillion-dollar contract were burned in a rusty barrel.',
  '[{"name":"Leo Vance","role":"Record Producer","alibi":"Steakhouse dining until midnight","avatar":"🎷"},{"name":"Billie Holiday","role":"Star Jazz Singer","alibi":"Rehearsing with pianist uptown","avatar":"🎙️"},{"name":"Duke \"Horn\" Kelly","role":"Lead Trumpet Player","alibi":"Sleeping in boarding house room","avatar":"🎺"},{"name":"Gus Miller","role":"Sound Engineer","alibi":"Working in mixing booth B with headphones","avatar":"🎧"}]'::jsonb,
  'Producer Leo Vance secretly sold singer Billie’s album twice. When Billie ordered an audit, Leo burned the original contract and master vinyl in an alley oil drum.',
  'Leo Vance',
  'Leo sold song rights to another company and was about to get sued for fraud.',
  '[{"time":"09:00 PM","event":"Billie’s lawyer calls Leo demanding a full financial audit."},{"time":"10:30 PM","event":"Leo buys a gallon of kerosene at corner gas station."},{"time":"11:15 PM","event":"Leo takes master vinyl and contract from his safe."},{"time":"11:30 PM","event":"Smoke and flames rise from the metal drum in the alley."},{"time":"11:45 PM","event":"Leo drives away in his black sedan leaving fire burning."}]'::jsonb,
  '[{"id":"ev1","title":"Kerosene Can","detail":"Purchased at the corner gas station with Leo’s credit slip."},{"id":"ev2","title":"Melted Vinyl Puddle","detail":"Remains of the master album in the bottom of the barrel."},{"id":"ev3","title":"Charred Contract Fragment","detail":"Shows Leo’s signature and the 50% royalty clause."},{"id":"ev4","title":"Blue Flamingo Matchbook","detail":"Dropped by the barrel with Leo’s fingerprints."}]'::jsonb,
  '[{"order":1,"title":"Kerosene Can","text":"Metal jug used to pour fuel over the documents."},{"order":2,"title":"Vinyl Record","text":"The master musical album melted into black goo."},{"order":3,"title":"Record Contract","text":"Legal paper promising singer Billie half the studio profits."},{"order":4,"title":"Matchbox","text":"VIP nightclub matchbook used to light the fire."},{"order":5,"title":"Burn Barrel","text":"Rusty oil drum in the alley where the fire was set."},{"order":6,"title":"Bank Check","text":"Charred paper showing secret payoff from a rival label."}]'::jsonb,
  'Duke Kelly punched Leo in the face earlier.: He was furious about pay, but went straight home to sleep.; A homeless man warmed his hands by the barrel.: He only walked over after the fire was already dying.',
  'Blame trumpet player Duke or claim a homeless drifter lit the fire for heat.',
  'NORMAL',
  'Who burned the jazz master record and contract behind the studio?',
  '[{"character":"Leo Vance","secret":"Pocketed two separate advances for the same master album."},{"character":"Billie Holiday","secret":"She had already kept a secret acetate copy at home."},{"character":"Duke \"Horn\" Kelly","secret":"Punched Leo in the face during an argument yesterday."},{"character":"Gus Miller","secret":"Overheard Leo demanding the storage room combination."}]'::jsonb,
  '[{"lead":"Duke Kelly punched Leo in the face earlier.","explanation":"He was furious about pay, but went straight home to sleep."},{"lead":"A homeless man warmed his hands by the barrel.","explanation":"He only walked over after the fire was already dying."}]'::jsonb,
  '{"wrongTheories":["A jealous rival musician broke in and burned the album out of envy.","A passing drifter started the fire with trash to keep warm."],"correctTheory":"Producer Leo Vance burned the master vinyl and original contract in the alley barrel to hide his illegal double-sale of album rights before the morning audit."}'::jsonb,
  'Leo Vance burned the record and contract to cover up his double-deal fraud!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The gas station receipt and fingerprints on the matchbook trapped Leo Vance. Gus’s backup disc saved Billie’s album."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Trumpeter Duke Kelly was arrested because of his earlier fight. Leo collected his payoff and fled town."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The fire was written off as an accidental trash fire. Leo kept the money and Billie lost her royalties."}]'::jsonb,
  '{"intros":["A master vinyl recording and a multimillion-dollar contract were burned in a rusty barrel.","Case file story_005: A master vinyl recording and a multimillion-dollar contract were burned in a rusty barrel. Look closely at every clue.","Trouble begins in Black Note Recording Studios & Back Alley Burn Barrel, downtown. A master vinyl recording and a multimillion-dollar contract were burned in a rusty barrel.","The mystery starts now. A master vinyl recording and a multimillion-dollar contract were burned in a rusty barrel. Can you solve it?"],"reveals":["Leo Vance burned the record and contract to cover up his double-deal fraud!","The mystery is unraveled! Leo Vance burned the record and contract to cover up his double-deal fraud!","At last, the truth comes out: Leo Vance burned the record and contract to cover up his double-deal fraud!","Case resolved! Here is what happened: Leo Vance burned the record and contract to cover up his double-deal fraud!"],"hints":["Pay attention to where Leo Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_005';
DELETE FROM public.case_events WHERE case_id = 'story_005';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '82b81904-c632-5a7b-9a1d-c403f8f4528b',
  'story_005',
  'Leo Vance',
  'Record Producer',
  'Greedy, sweaty, wears silk shirts and cheap cologne',
  'I arrived at 8:00 AM and found my office ransacked.',
  'Pocketed two separate advances for the same master album.',
  'Steakhouse dining until midnight',
  'Managing producer and owner of Black Note Studios',
  'The audit was scheduled for 9:00 AM this morning.',
  'A charred corner of his signed check survived the fire.',
  '🎷',
  '["I arrived at 8:00 AM and found my office ransacked.","\"I arrived at 8:00 AM and found my office ransacked.\"","Listen to me: I arrived at 8:00 AM and found my office ransacked.","I tell you the truth: I arrived at 8:00 AM and found my office ransacked."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '53894113-d51a-5e00-bf7d-7b856389cde9',
  'story_005',
  'Billie Holiday',
  'Star Jazz Singer',
  'Proud, weary, brilliant voice',
  'That master record was my life’s work. Leo promised me royal shares.',
  'She had already kept a secret acetate copy at home.',
  'Rehearsing with pianist uptown',
  'The artist whose contract and master were burned',
  'Heard Leo arguing on the phone about double payments.',
  'Did not know Leo bought kerosene from the corner station.',
  '🎙️',
  '["That master record was my life’s work. Leo promised me royal shares.","\"That master record was my life’s work. Leo promised me royal shares.\"","Listen to me: That master record was my life’s work. Leo promised me royal shares.","I tell you the truth: That master record was my life’s work. Leo promised me royal shares."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '34bbc1c9-bc07-529a-93d3-677338a78c2c',
  'story_005',
  'Duke "Horn" Kelly',
  'Lead Trumpet Player',
  'Passionate, quick-tempered, loyal to Billie',
  'Leo was a crook who cheated every musician on the strip.',
  'Punched Leo in the face during an argument yesterday.',
  'Sleeping in boarding house room',
  'Billie’s bandleader and co-writer',
  'Saw Leo carrying a metal can into the alley.',
  'Did not see Leo throw the match into the drum.',
  '🎺',
  '["Leo was a crook who cheated every musician on the strip.","\"Leo was a crook who cheated every musician on the strip.\"","Listen to me: Leo was a crook who cheated every musician on the strip.","I tell you the truth: Leo was a crook who cheated every musician on the strip."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f94363e5-f5d3-563e-8492-7fc74ea93001',
  'story_005',
  'Gus Miller',
  'Sound Engineer',
  'Quiet, bespectacled, meticulous',
  'The master reel was locked in the safe at 7:00 PM.',
  'Overheard Leo demanding the storage room combination.',
  'Working in mixing booth B with headphones',
  'Engineer who pressed the original master',
  'Smelled kerosene fumes coming through the vent pipe.',
  'Did not know the contract was bundled with the record.',
  '🎧',
  '["The master reel was locked in the safe at 7:00 PM.","\"The master reel was locked in the safe at 7:00 PM.\"","Listen to me: The master reel was locked in the safe at 7:00 PM.","I tell you the truth: The master reel was locked in the safe at 7:00 PM."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '15c19276-2e6a-56ad-8d26-042fae41f235',
  'story_005',
  'ev_1',
  1,
  '10:30 PM',
  'A red metal fuel can is bought with cash at the station.',
  'A red metal fuel can is bought with cash at the station.',
  'The arsonist bought kerosene before going to the studio.',
  'Kerosene Can',
  'Galvanized fuel can with fresh red paint and oily smell.',
  '["Water Jug","Oil Lamp","Paint Bucket"]'::jsonb,
  'Kerosene Can',
  '["kerosene can","fuel can","can","gas can","kerosene"]'::jsonb,
  'A metal container used to hold fuel.',
  'ev_2',
  true,
  '{"descriptions":["A red metal fuel can is bought with cash at the station.","At 10:30 PM: A red metal fuel can is bought with cash at the station.","Notice this clue: A red metal fuel can is bought with cash at the station."],"hints":["A metal container used to hold fuel.","Clue hint: Think about kerosene can.","Search for: the arsonist bought kerosene before going to the studio."],"clues":["Kerosene Can","Item: Kerosene Can","Clue Word: Kerosene Can"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1b52d45c-1b1a-5462-97c1-feeb2d5767c7',
  'story_005',
  'ev_2',
  2,
  '11:15 PM',
  'The black vinyl disc is removed from its sleeve.',
  'The black vinyl disc is removed from its sleeve.',
  'The master record was taken specifically to be destroyed.',
  'Vinyl Record',
  'Melted black plastic puddle with grooved edges in ash.',
  '["Cassette","Sheet Music","Microphone"]'::jsonb,
  'Vinyl Record',
  '["vinyl record","record","vinyl","disc","album"]'::jsonb,
  'A flat black plastic disc with grooves that plays music.',
  'ev_3',
  false,
  '{"descriptions":["The black vinyl disc is removed from its sleeve.","At 11:15 PM: The black vinyl disc is removed from its sleeve.","Notice this clue: The black vinyl disc is removed from its sleeve."],"hints":["A flat black plastic disc with grooves that plays music.","Clue hint: Think about vinyl record.","Search for: the master record was taken specifically to be destroyed."],"clues":["Vinyl Record","Item: Vinyl Record","Clue Word: Vinyl Record"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '923780a2-a3ad-5667-a9f8-552447f0679b',
  'story_005',
  'ev_3',
  3,
  '11:20 PM',
  'A paper contract with gold seals is thrown into the barrel.',
  'A paper contract with gold seals is thrown into the barrel.',
  'The contract promised Billie 50 percent of all profits.',
  'Record Contract',
  'Charred legal parchment showing Leo’s signature.',
  '["Magazine","Newspaper","Diary"]'::jsonb,
  'Record Contract',
  '["record contract","contract","document","paper"]'::jsonb,
  'A legal document signed by two parties.',
  'ev_4',
  false,
  '{"descriptions":["A paper contract with gold seals is thrown into the barrel.","At 11:20 PM: A paper contract with gold seals is thrown into the barrel.","Notice this clue: A paper contract with gold seals is thrown into the barrel."],"hints":["A legal document signed by two parties.","Clue hint: Think about record contract.","Search for: the contract promised billie 50 percent of all profits."],"clues":["Record Contract","Item: Record Contract","Clue Word: Record Contract"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '52acaf32-7d3a-5122-808b-83ee06ecfd05',
  'story_005',
  'ev_4',
  4,
  '11:25 PM',
  'A matchbox from the Blue Flamingo Club is dropped nearby.',
  'A matchbox from the Blue Flamingo Club is dropped nearby.',
  'Leo is a VIP member at the Blue Flamingo Club.',
  'Matchbox',
  'Blue cardboard matchbook with one burnt match missing.',
  '["Cigarette Lighter","Candle","Flint"]'::jsonb,
  'Matchbox',
  '["matchbox","matchbook","matches","match"]'::jsonb,
  'A cardboard box with little wooden sticks that strike fire.',
  'ev_5',
  false,
  '{"descriptions":["A matchbox from the Blue Flamingo Club is dropped nearby.","At 11:25 PM: A matchbox from the Blue Flamingo Club is dropped nearby.","Notice this clue: A matchbox from the Blue Flamingo Club is dropped nearby."],"hints":["A cardboard box with little wooden sticks that strike fire.","Clue hint: Think about matchbox.","Search for: leo is a vip member at the blue flamingo club."],"clues":["Matchbox","Item: Matchbox","Clue Word: Matchbox"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5e45d081-1913-5261-bae3-59563f78bde8',
  'story_005',
  'ev_5',
  5,
  '11:30 PM',
  'Flames rise from a rusted iron burn barrel in the alley.',
  'Flames rise from a rusted iron burn barrel in the alley.',
  'The arson took place inside an ordinary 55-gallon drum.',
  'Burn Barrel',
  'Charred steel oil drum radiating heat.',
  '["Trash Dumpster","Fireplace","Campfire"]'::jsonb,
  'Burn Barrel',
  '["burn barrel","barrel","drum","oil drum"]'::jsonb,
  'A round metal container used to burn garbage.',
  'ev_6',
  true,
  '{"descriptions":["Flames rise from a rusted iron burn barrel in the alley.","At 11:30 PM: Flames rise from a rusted iron burn barrel in the alley.","Notice this clue: Flames rise from a rusted iron burn barrel in the alley."],"hints":["A round metal container used to burn garbage.","Clue hint: Think about burn barrel.","Search for: the arson took place inside an ordinary 55-gallon drum."],"clues":["Burn Barrel","Item: Burn Barrel","Clue Word: Burn Barrel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f7ae9223-a497-517e-b367-92feef507256',
  'story_005',
  'ev_6',
  6,
  '11:40 PM',
  'A charred scrap of a cashier check to Empire Records is found.',
  'A charred scrap of a cashier check to Empire Records is found.',
  'Leo received twenty thousand dollars from a rival label.',
  'Bank Check',
  'Burnt corner of a check with Empire Records printed.',
  '["Dollar Bill","Postage Stamp","Train Ticket"]'::jsonb,
  'Bank Check',
  '["bank check","check","cashier check","cheque"]'::jsonb,
  'A printed slip from a bank ordering payment of money.',
  'ev_7',
  false,
  '{"descriptions":["A charred scrap of a cashier check to Empire Records is found.","At 11:40 PM: A charred scrap of a cashier check to Empire Records is found.","Notice this clue: A charred scrap of a cashier check to Empire Records is found."],"hints":["A printed slip from a bank ordering payment of money.","Clue hint: Think about bank check.","Search for: leo received twenty thousand dollars from a rival label."],"clues":["Bank Check","Item: Bank Check","Clue Word: Bank Check"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '33c6f10a-21e2-5fbd-a75a-64ab0c3a45f6',
  'story_005',
  'ev_7',
  7,
  '12:00 AM',
  'Black soot is found on the steering wheel of Leo’s sedan.',
  'Black soot is found on the steering wheel of Leo’s sedan.',
  'Leo drove his car immediately after burning the evidence.',
  'Soot Smudges',
  'Carbon powder lifted from the ivory steering wheel.',
  '["Coffee Stains","Mud Drops","Ink Marks"]'::jsonb,
  'Soot Smudges',
  '["soot smudges","soot","ash","smoke marks"]'::jsonb,
  'Black powdery dust left behind by thick smoke.',
  'ev_8',
  false,
  '{"descriptions":["Black soot is found on the steering wheel of Leo’s sedan.","At 12:00 AM: Black soot is found on the steering wheel of Leo’s sedan.","Notice this clue: Black soot is found on the steering wheel of Leo’s sedan."],"hints":["Black powdery dust left behind by thick smoke.","Clue hint: Think about soot smudges.","Search for: leo drove his car immediately after burning the evidence."],"clues":["Soot Smudges","Item: Soot Smudges","Clue Word: Soot Smudges"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '32eaf9ff-0157-5968-b695-7f9e94361c4f',
  'story_005',
  'ev_8',
  8,
  '12:30 AM',
  'Sound engineer Gus produces a hidden backup safety disc.',
  'Sound engineer Gus produces a hidden backup safety disc.',
  'The music was saved; Gus kept a secret reference cut.',
  'Backup Disc',
  '12-inch lacquer reference disc marked "Billie Safety".',
  '["Radio Tape","Guitar String","Notebook"]'::jsonb,
  'Backup Disc',
  '["backup disc","backup record","disc","safety copy"]'::jsonb,
  'A spare copy made to keep recordings safe.',
  NULL,
  true,
  '{"descriptions":["Sound engineer Gus produces a hidden backup safety disc.","At 12:30 AM: Sound engineer Gus produces a hidden backup safety disc.","Notice this clue: Sound engineer Gus produces a hidden backup safety disc."],"hints":["A spare copy made to keep recordings safe.","Clue hint: Think about backup disc.","Search for: the music was saved; gus kept a secret reference cut."],"clues":["Backup Disc","Item: Backup Disc","Clue Word: Backup Disc"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_006 — RED CARNATION AT DUSK
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_006',
  'Red Carnation at Dusk',
  'Noir Mystery',
  'The Golden Lotus Tea House, red paper lanterns and wooden screens',
  'A syndicate accountant vanished, leaving a coded black ledger and a crushed red carnation.',
  '[{"name":"Madame Li Chen","role":"Tea House Owner","alibi":"Counting cash in the rear accounting office","avatar":"🪭"},{"name":"Arthur Wu","role":"Syndicate Accountant","alibi":"Missing person","avatar":"👓"},{"name":"Jimmy \"Flash\" Tang","role":"Tea House Waiter","alibi":"Busy serving patrons in the front dining room","avatar":"🍵"},{"name":"Detective Frank Malone","role":"Underworld Squad Detective","alibi":"Watching the front street from an unmarked sedan","avatar":"🕵️"}]'::jsonb,
  'Tea house owner Madame Li Chen slipped crushed lotus root sleeping powder into Arthur’s tea. She locked him in a laundry crate and removed the pages exposing her gambling theft.',
  'Madame Li Chen',
  'Arthur discovered Madame Li was skimming money from the syndicate gambling tables.',
  '[{"time":"05:30 PM","event":"Arthur Wu arrives wearing his trademark red carnation."},{"time":"06:00 PM","event":"Madame Li pours special jasmine tea for Arthur."},{"time":"06:15 PM","event":"Arthur’s head slumps onto the table; tea cup spills."},{"time":"06:25 PM","event":"A wicker laundry hamper is wheeled out to a delivery van."},{"time":"06:40 PM","event":"Jimmy clears Table 4 and finds Arthur’s glasses on the floor."}]'::jsonb,
  '[{"id":"ev1","title":"Jasmine Teapot Dregs","detail":"Contains crushed lotus root sleeping powder."},{"id":"ev2","title":"Crushed Red Carnation","detail":"Arthur’s personal flower stepped on near the table."},{"id":"ev3","title":"Hollow Umbrella","detail":"Hides duplicate microfilm of the casino accounts."},{"id":"ev4","title":"Laundry Van Receipt","detail":"Links Madame Li directly to the warehouse van."}]'::jsonb,
  '[{"order":1,"title":"Sleeping Powder","text":"White sedative stirred into the tea to knock Arthur out."},{"order":2,"title":"Red Carnation","text":"Arthur’s lapel flower crushed under foot during the kidnapping."},{"order":3,"title":"Coded Ledger","text":"Account book with pages sliced out to hide missing money."},{"order":4,"title":"Hollow Umbrella","text":"Arthur’s secret hiding spot for financial film strips."},{"order":5,"title":"Laundry Hamper","text":"Woven wicker basket used to wheel Arthur out the back door."},{"order":6,"title":"Delivery Receipt","text":"Paper slip showing the destination of the getaway van."}]'::jsonb,
  'Jimmy the waiter had white sugar powder on his apron.: Just powdered sugar for serving sweet rice cakes.; A black sedan with gang members drove by outside.: They were only collecting restaurant protection dues.',
  'Blame waiter Jimmy or claim rival gangsters stormed the tea house with submachine guns.',
  'NORMAL',
  'Who abducted the accountant Arthur Wu and where did the ledger pages go?',
  '[{"character":"Madame Li Chen","secret":"Stole tens of thousands from mob gambling profits."},{"character":"Arthur Wu","secret":"Kept duplicate coded files inside his hollow umbrella handle."},{"character":"Jimmy \"Flash\" Tang","secret":"Takes bets for an illegal horse racing wire."},{"character":"Detective Frank Malone","secret":"Owes a favor to the syndicate boss."}]'::jsonb,
  '[{"lead":"Jimmy the waiter had white sugar powder on his apron.","explanation":"Just powdered sugar for serving sweet rice cakes."},{"lead":"A black sedan with gang members drove by outside.","explanation":"They were only collecting restaurant protection dues."}]'::jsonb,
  '{"wrongTheories":["A rival gang stormed the tea house with guns and took Arthur hostage.","Arthur took the syndicate money and fled to another city willingly."],"correctTheory":"Madame Li Chen drugged Arthur’s tea with sleeping powder, sliced the incriminating pages from his ledger, and had him smuggled out in a laundry basket to conceal her gambling theft."}'::jsonb,
  'Madame Li Chen drugged Arthur to hide her secret gambling thefts!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Police raided the laundry warehouse and freed Arthur Wu unharmed. The stolen pages found behind the altar convicted Madame Li Chen."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Waiter Jimmy Tang was blamed for tampering with the tea. Madame Li disposed of the accountant and kept the stolen fortunes."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The case was dismissed as a gangland shootout rumor. Arthur Wu disappeared forever and Madame Li expanded her casino empire."}]'::jsonb,
  '{"intros":["A syndicate accountant vanished, leaving a coded black ledger and a crushed red carnation.","Case file story_006: A syndicate accountant vanished, leaving a coded black ledger and a crushed red carnation. Look closely at every clue.","Trouble begins in The Golden Lotus Tea House, red paper lanterns and wooden screens. A syndicate accountant vanished, leaving a coded black ledger and a crushed red carnation.","The mystery starts now. A syndicate accountant vanished, leaving a coded black ledger and a crushed red carnation. Can you solve it?"],"reveals":["Madame Li Chen drugged Arthur to hide her secret gambling thefts!","The mystery is unraveled! Madame Li Chen drugged Arthur to hide her secret gambling thefts!","At last, the truth comes out: Madame Li Chen drugged Arthur to hide her secret gambling thefts!","Case resolved! Here is what happened: Madame Li Chen drugged Arthur to hide her secret gambling thefts!"],"hints":["Pay attention to where Madame Li Chen was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_006';
DELETE FROM public.case_events WHERE case_id = 'story_006';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e462e0b7-f3b1-5a22-91de-091f982dbaa6',
  'story_006',
  'Madame Li Chen',
  'Tea House Owner',
  'Gracious, smiling, cold-hearted under silk robes',
  'Arthur Wu had one cup of tea and left through the courtyard door.',
  'Stole tens of thousands from mob gambling profits.',
  'Counting cash in the rear accounting office',
  'Owner of the tea house where Arthur did his audits',
  'Arthur found the false gambling receipts.',
  'Did not notice the red carnation petal on the floor.',
  '🪭',
  '["Arthur Wu had one cup of tea and left through the courtyard door.","\"Arthur Wu had one cup of tea and left through the courtyard door.\"","Listen to me: Arthur Wu had one cup of tea and left through the courtyard door.","I tell you the truth: Arthur Wu had one cup of tea and left through the courtyard door."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7277388a-3113-567d-93b2-eae16efe5ac0',
  'story_006',
  'Arthur Wu',
  'Syndicate Accountant',
  'Quiet, timid, wears spectacles and grey suit',
  'Victim is missing; left behind his glasses and open tea cup.',
  'Kept duplicate coded files inside his hollow umbrella handle.',
  'Missing person',
  'Senior bookkeeper for the waterfront syndicate',
  'Madame Li took money from the baccarat room.',
  'Trusted Madame Li when she poured his personal tea.',
  '👓',
  '["Victim is missing; left behind his glasses and open tea cup.","\"Victim is missing; left behind his glasses and open tea cup.\"","Listen to me: Victim is missing; left behind his glasses and open tea cup.","I tell you the truth: Victim is missing; left behind his glasses and open tea cup."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f6bdb577-67d2-5bdb-b48c-c3bc42b432b4',
  'story_006',
  'Jimmy "Flash" Tang',
  'Tea House Waiter',
  'Energetic, observant, speaks fast',
  'I served Table 4 and brought fresh hot water twice.',
  'Takes bets for an illegal horse racing wire.',
  'Busy serving patrons in the front dining room',
  'Brought the tea tray to Arthur’s private booth',
  'Saw Madame Li drop white powder into the ceramic pot.',
  'Did not know the white powder was sleeping sedative.',
  '🍵',
  '["I served Table 4 and brought fresh hot water twice.","\"I served Table 4 and brought fresh hot water twice.\"","Listen to me: I served Table 4 and brought fresh hot water twice.","I tell you the truth: I served Table 4 and brought fresh hot water twice."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '77f61c05-f65a-5acc-ada2-856084729bb0',
  'story_006',
  'Detective Frank Malone',
  'Underworld Squad Detective',
  'Hardboiled, cynical, trenchcoat and fedora',
  'When an accountant goes missing, money is always the reason.',
  'Owes a favor to the syndicate boss.',
  'Watching the front street from an unmarked sedan',
  'Assigned to investigate syndicate disappearances',
  'Arthur wore a fresh red carnation in his lapel every day.',
  'Did not see the laundry van leave via the rear tunnel.',
  '🕵️',
  '["When an accountant goes missing, money is always the reason.","\"When an accountant goes missing, money is always the reason.\"","Listen to me: When an accountant goes missing, money is always the reason.","I tell you the truth: When an accountant goes missing, money is always the reason."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9bf36b94-a2a3-5ca8-bca7-2e4454db81c4',
  'story_006',
  'ev_1',
  1,
  '06:00 PM',
  'A fine white botanical powder is stirred into the green ceramic teapot.',
  'A fine white botanical powder is stirred into the green ceramic teapot.',
  'Arthur was drugged with a powerful herbal sleeping powder.',
  'Sleeping Powder',
  'Porcelain tea dregs containing crushed lotus root sedative.',
  '["Sugar Cube","Salt Pinch","Baking Powder"]'::jsonb,
  'Sleeping Powder',
  '["sleeping powder","powder","sedative","drug","poison"]'::jsonb,
  'White substance mixed into drinks to put people to sleep.',
  'ev_2',
  true,
  '{"descriptions":["A fine white botanical powder is stirred into the green ceramic teapot.","At 06:00 PM: A fine white botanical powder is stirred into the green ceramic teapot.","Notice this clue: A fine white botanical powder is stirred into the green ceramic teapot."],"hints":["White substance mixed into drinks to put people to sleep.","Clue hint: Think about sleeping powder.","Search for: arthur was drugged with a powerful herbal sleeping powder."],"clues":["Sleeping Powder","Item: Sleeping Powder","Clue Word: Sleeping Powder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3c5f3df3-b659-5bfe-86c7-e24a49dfe951',
  'story_006',
  'ev_2',
  2,
  '06:15 PM',
  'A crushed red carnation flower is stepped on beside the table.',
  'A crushed red carnation flower is stepped on beside the table.',
  'Arthur struggled or collapsed, knocking his boutonniere off.',
  'Red Carnation',
  'Fresh crimson carnation petal crushed into bamboo matting.',
  '["Rose","Tulip","Daisy"]'::jsonb,
  'Red Carnation',
  '["red carnation","carnation","flower","petal"]'::jsonb,
  'A ruffled red flower men wear pinned on their suit lapel.',
  'ev_3',
  false,
  '{"descriptions":["A crushed red carnation flower is stepped on beside the table.","At 06:15 PM: A crushed red carnation flower is stepped on beside the table.","Notice this clue: A crushed red carnation flower is stepped on beside the table."],"hints":["A ruffled red flower men wear pinned on their suit lapel.","Clue hint: Think about red carnation.","Search for: arthur struggled or collapsed, knocking his boutonniere off."],"clues":["Red Carnation","Item: Red Carnation","Clue Word: Red Carnation"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bdf2ef13-a0ef-5e7c-9bb8-c51baa09a642',
  'story_006',
  'ev_3',
  3,
  '06:18 PM',
  'Three pages are sliced out of a black leather accounting book.',
  'Three pages are sliced out of a black leather accounting book.',
  'The missing pages recorded gambling revenue from Room 8.',
  'Coded Ledger',
  'Black leather book with jagged cut marks along the spine.',
  '["Telephone Book","Menu","Bible"]'::jsonb,
  'Coded Ledger',
  '["coded ledger","ledger","book","account book"]'::jsonb,
  'A book where financial numbers and business profits are kept.',
  'ev_4',
  false,
  '{"descriptions":["Three pages are sliced out of a black leather accounting book.","At 06:18 PM: Three pages are sliced out of a black leather accounting book.","Notice this clue: Three pages are sliced out of a black leather accounting book."],"hints":["A book where financial numbers and business profits are kept.","Clue hint: Think about coded ledger.","Search for: the missing pages recorded gambling revenue from room 8."],"clues":["Coded Ledger","Item: Coded Ledger","Clue Word: Coded Ledger"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5a60edd2-f395-51cc-9082-fd93b572ef56',
  'story_006',
  'ev_4',
  4,
  '06:22 PM',
  'A black umbrella with a hollow brass handle is left behind.',
  'A black umbrella with a hollow brass handle is left behind.',
  'Arthur hid micro-photographs inside the hollow umbrella shaft.',
  'Hollow Umbrella',
  'Gentleman umbrella with a screw-off brass handle.',
  '["Walking Cane","Briefcase","Hat"]'::jsonb,
  'Hollow Umbrella',
  '["hollow umbrella","umbrella","cane"]'::jsonb,
  'Something you open to stay dry when it rains.',
  'ev_5',
  false,
  '{"descriptions":["A black umbrella with a hollow brass handle is left behind.","At 06:22 PM: A black umbrella with a hollow brass handle is left behind.","Notice this clue: A black umbrella with a hollow brass handle is left behind."],"hints":["Something you open to stay dry when it rains.","Clue hint: Think about hollow umbrella.","Search for: arthur hid micro-photographs inside the hollow umbrella shaft."],"clues":["Hollow Umbrella","Item: Hollow Umbrella","Clue Word: Hollow Umbrella"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c1ffcea6-c113-5d1e-89cc-9914ee91b121',
  'story_006',
  'ev_5',
  5,
  '06:26 PM',
  'A large wicker laundry hamper is loaded into a grey van.',
  'A large wicker laundry hamper is loaded into a grey van.',
  'Arthur was packed inside the laundry basket while unconscious.',
  'Laundry Hamper',
  'Woven wicker basket smelling of jasmine and laundry starch.',
  '["Wooden Box","Trunk","Trash Can"]'::jsonb,
  'Laundry Hamper',
  '["laundry hamper","hamper","basket","laundry basket"]'::jsonb,
  'A large woven basket used to carry clothes and towels.',
  'ev_6',
  true,
  '{"descriptions":["A large wicker laundry hamper is loaded into a grey van.","At 06:26 PM: A large wicker laundry hamper is loaded into a grey van.","Notice this clue: A large wicker laundry hamper is loaded into a grey van."],"hints":["A large woven basket used to carry clothes and towels.","Clue hint: Think about laundry hamper.","Search for: arthur was packed inside the laundry basket while unconscious."],"clues":["Laundry Hamper","Item: Laundry Hamper","Clue Word: Laundry Hamper"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '88386876-d06d-539a-8d9f-7cd63fe9d1c4',
  'story_006',
  'ev_6',
  6,
  '06:30 PM',
  'A delivery receipt for Jade Mountain Laundry is dropped.',
  'A delivery receipt for Jade Mountain Laundry is dropped.',
  'The van was dispatched to a warehouse near the river.',
  'Delivery Receipt',
  'Yellow paper receipt stamped by Jade Mountain Laundry.',
  '["Train Ticket","Movie Stub","Postcard"]'::jsonb,
  'Delivery Receipt',
  '["delivery receipt","receipt","ticket","paper"]'::jsonb,
  'Paper slip given when goods are delivered or paid for.',
  'ev_7',
  false,
  '{"descriptions":["A delivery receipt for Jade Mountain Laundry is dropped.","At 06:30 PM: A delivery receipt for Jade Mountain Laundry is dropped.","Notice this clue: A delivery receipt for Jade Mountain Laundry is dropped."],"hints":["Paper slip given when goods are delivered or paid for.","Clue hint: Think about delivery receipt.","Search for: the van was dispatched to a warehouse near the river."],"clues":["Delivery Receipt","Item: Delivery Receipt","Clue Word: Delivery Receipt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ca96661a-da3a-5d8f-bc02-7cbf92cd1c0b',
  'story_006',
  'ev_7',
  7,
  '06:45 PM',
  'Arthur’s gold-rimmed spectacles are found under the tea bench.',
  'Arthur’s gold-rimmed spectacles are found under the tea bench.',
  'Arthur could not have walked out on his own without his glasses.',
  'Gold Spectacles',
  'Wire-rimmed reading glasses with Arthur’s prescription.',
  '["Pocket Watch","Coin Purse","Pen"]'::jsonb,
  'Gold Spectacles',
  '["gold spectacles","spectacles","glasses","reading glasses","eyeglass"]'::jsonb,
  'Lenses worn on your face to help you see clearly.',
  'ev_8',
  false,
  '{"descriptions":["Arthur’s gold-rimmed spectacles are found under the tea bench.","At 06:45 PM: Arthur’s gold-rimmed spectacles are found under the tea bench.","Notice this clue: Arthur’s gold-rimmed spectacles are found under the tea bench."],"hints":["Lenses worn on your face to help you see clearly.","Clue hint: Think about gold spectacles.","Search for: arthur could not have walked out on his own without his glasses."],"clues":["Gold Spectacles","Item: Gold Spectacles","Clue Word: Gold Spectacles"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bfb34828-2bea-5d98-975c-cbe50dc6a6f1',
  'story_006',
  'ev_8',
  8,
  '07:00 PM',
  'A bundle of sliced ledger sheets is found behind the shrine altar.',
  'A bundle of sliced ledger sheets is found behind the shrine altar.',
  'Madame Li hid the stolen ledger pages behind the bronze Buddha.',
  'Stolen Pages',
  'Handwritten sheets showing fifty thousand dollars missing.',
  '["Bank Notes","Incense Sticks","Silk Scarf"]'::jsonb,
  'Stolen Pages',
  '["stolen pages","pages","sheets","papers"]'::jsonb,
  'Sheets of paper cut out from a book.',
  NULL,
  true,
  '{"descriptions":["A bundle of sliced ledger sheets is found behind the shrine altar.","At 07:00 PM: A bundle of sliced ledger sheets is found behind the shrine altar.","Notice this clue: A bundle of sliced ledger sheets is found behind the shrine altar."],"hints":["Sheets of paper cut out from a book.","Clue hint: Think about stolen pages.","Search for: madame li hid the stolen ledger pages behind the bronze buddha."],"clues":["Stolen Pages","Item: Stolen Pages","Clue Word: Stolen Pages"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_007 — THE PAWNSHOP CLOCK
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_007',
  'The Pawnshop Clock',
  'Noir Mystery',
  'Old Town Pawn & Antiques, dusty shelves of brass instruments and clocks',
  'The pawnbroker was found bound and gagged; a 19th-century grandfather clock was smashed open.',
  '[{"name":"Frankie \"Two-Knives\"","role":"Ex-Convict Jewel Thief","alibi":"Bowling alley three blocks away","avatar":"🪓"},{"name":"Moe Zimmerman","role":"Pawnbroker","alibi":"Victim found tied up in the back office","avatar":"🕰️"},{"name":"Toby Miller","role":"Shop Apprentice","alibi":"At the cinema watching a double feature","avatar":"👦"},{"name":"Officer Jack Riley","role":"Beat Patrolman","alibi":"Patrolling Main Street storefronts","avatar":"👮"}]'::jsonb,
  'Thief Frankie broke into the antique shop after hours. He smashed the hollow pendulum of the antique clock, retrieved the train station locker key he had pawned months ago, and fled before the alarm sounded.',
  'Frankie "Two-Knives"',
  'The clock concealed a brass safe-deposit locker key holding stolen diamonds.',
  '[{"time":"07:00 PM","event":"Toby locks up the shop and leaves for the cinema."},{"time":"08:15 PM","event":"Frankie picks the back door padlock in the alley."},{"time":"08:20 PM","event":"Moe is overpowered and tied with clothesline cord."},{"time":"08:24 PM","event":"The clock glass and pendulum are smashed with a crowbar."},{"time":"08:30 PM","event":"Officer Riley hears glass shattering and runs to the door."}]'::jsonb,
  '[{"id":"ev1","title":"Lockpick Wire","detail":"Found in the alley door; matches professional thief kits."},{"id":"ev2","title":"Split Brass Pendulum","detail":"Hollow compartment inside the clock weight was emptied."},{"id":"ev3","title":"Silver Dice","detail":"Carries Frankie’s initials F.T., dropped beneath the glass counter."},{"id":"ev4","title":"Crowbar with Wood Stains","detail":"Discarded in the bin with mahogany paint from the clock."}]'::jsonb,
  '[{"order":1,"title":"Lockpick Wire","text":"Thin metal pick used to open the back door latch."},{"order":2,"title":"Clothesline Rope","text":"White cord used to bind the pawnbroker’s hands."},{"order":3,"title":"Grandfather Clock","text":"Tall antique clock smashed open in the showroom."},{"order":4,"title":"Brass Pendulum","text":"Hollow swinging weight that held the secret locker key."},{"order":5,"title":"Silver Dice","text":"Frankie’s personal engraved dice left behind at the scene."},{"order":6,"title":"Crowbar","text":"Iron pry bar used to smash the clock wooden frame."}]'::jsonb,
  'Shop apprentice Toby had stolen ten dollars from register.: He only took bus fare to go to the movies.; Pawnbroker Moe had an insurance policy claim form.: He was filling out flood insurance from last year.',
  'Blame the shop assistant Toby or claim the owner staged a robbery for insurance.',
  'NORMAL',
  'What was hidden inside the antique pendulum and who took it?',
  '[{"character":"Frankie \"Two-Knives\"","secret":"He hid the key inside the pendulum before going to prison."},{"character":"Moe Zimmerman","secret":"He knew the clock had a secret compartment when he bought it."},{"character":"Toby Miller","secret":"He borrowed money from the cash register to place a dog bet."},{"character":"Officer Jack Riley","secret":"He arrived three minutes late because he was eating pie."}]'::jsonb,
  '[{"lead":"Shop apprentice Toby had stolen ten dollars from register.","explanation":"He only took bus fare to go to the movies."},{"lead":"Pawnbroker Moe had an insurance policy claim form.","explanation":"He was filling out flood insurance from last year."}]'::jsonb,
  '{"wrongTheories":["Apprentice Toby staged the break-in to cover his register thefts.","Pawnbroker Moe tied himself up to claim insurance money for the clock."],"correctTheory":"Frankie \"Two-Knives\" broke into the pawnshop to recover the locker key he had hidden inside the antique clock’s pendulum before his arrest."}'::jsonb,
  'Frankie "Two-Knives" smashed the clock to retrieve his stolen diamond locker key!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The silver dice and crowbar linked Frankie directly to the break-in. Police arrested him at Train Locker 104 with the diamond pouch."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Apprentice Toby was arrested for the break-in. Frankie retrieved the diamonds from Locker 104 and caught the night train."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The police suspected an insurance fraud scam by Moe. Frankie cashed in the diamonds and left the city behind."}]'::jsonb,
  '{"intros":["The pawnbroker was found bound and gagged; a 19th-century grandfather clock was smashed open.","Case file story_007: The pawnbroker was found bound and gagged; a 19th-century grandfather clock was smashed open. Look closely at every clue.","Trouble begins in Old Town Pawn & Antiques, dusty shelves of brass instruments and clocks. The pawnbroker was found bound and gagged; a 19th-century grandfather clock was smashed open.","The mystery starts now. The pawnbroker was found bound and gagged; a 19th-century grandfather clock was smashed open. Can you solve it?"],"reveals":["Frankie \"Two-Knives\" smashed the clock to retrieve his stolen diamond locker key!","The mystery is unraveled! Frankie \"Two-Knives\" smashed the clock to retrieve his stolen diamond locker key!","At last, the truth comes out: Frankie \"Two-Knives\" smashed the clock to retrieve his stolen diamond locker key!","Case resolved! Here is what happened: Frankie \"Two-Knives\" smashed the clock to retrieve his stolen diamond locker key!"],"hints":["Pay attention to where Frankie \"Two-Knives\" was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_007';
DELETE FROM public.case_events WHERE case_id = 'story_007';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '95da5050-ea82-5247-a6d8-e8179a76e630',
  'story_007',
  'Frankie "Two-Knives"',
  'Ex-Convict Jewel Thief',
  'Nervous, twitchy, scar over his eyebrow',
  'I was drinking cider at the bowling alley all evening.',
  'He hid the key inside the pendulum before going to prison.',
  'Bowling alley three blocks away',
  'Original owner who pawned the grandfather clock',
  'The key was taped inside the hollow brass pendulum bob.',
  'Dropped his lucky silver dice behind the counter.',
  '🪓',
  '["I was drinking cider at the bowling alley all evening.","\"I was drinking cider at the bowling alley all evening.\"","Listen to me: I was drinking cider at the bowling alley all evening.","I tell you the truth: I was drinking cider at the bowling alley all evening."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c01817ff-1028-56d2-b734-3a5ef562a96e',
  'story_007',
  'Moe Zimmerman',
  'Pawnbroker',
  'Grumpy, elderly, sharp eye for gold',
  'A masked man kicked in the back door and pushed me down.',
  'He knew the clock had a secret compartment when he bought it.',
  'Victim found tied up in the back office',
  'Owner of Old Town Pawn & Antiques',
  'The intruder went straight for the mahogany grandfather clock.',
  'Did not recognize Frankie under his ski mask.',
  '🕰️',
  '["A masked man kicked in the back door and pushed me down.","\"A masked man kicked in the back door and pushed me down.\"","Listen to me: A masked man kicked in the back door and pushed me down.","I tell you the truth: A masked man kicked in the back door and pushed me down."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b29bf4a4-e5cf-5a6b-87d6-61e0bbe6df8c',
  'story_007',
  'Toby Miller',
  'Shop Apprentice',
  'Young, eager, clumsy',
  'I locked the front display cabinets and left at 7:00 PM sharp.',
  'He borrowed money from the cash register to place a dog bet.',
  'At the cinema watching a double feature',
  'Employee who polished the grandfather clock yesterday',
  'Noticed the pendulum felt unusually heavy and rattled.',
  'Did not know Frankie was just released from prison.',
  '👦',
  '["I locked the front display cabinets and left at 7:00 PM sharp.","\"I locked the front display cabinets and left at 7:00 PM sharp.\"","Listen to me: I locked the front display cabinets and left at 7:00 PM sharp.","I tell you the truth: I locked the front display cabinets and left at 7:00 PM sharp."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '475425ca-7e4e-5193-b512-496751432ebb',
  'story_007',
  'Officer Jack Riley',
  'Beat Patrolman',
  'Burly, straightforward, heavy boots',
  'I heard glass breaking while walking my 8:30 PM patrol round.',
  'He arrived three minutes late because he was eating pie.',
  'Patrolling Main Street storefronts',
  'First officer to respond to the shop alarm',
  'Saw a figure in a dark jacket run down alley four.',
  'Did not see what the runner slipped into his pocket.',
  '👮',
  '["I heard glass breaking while walking my 8:30 PM patrol round.","\"I heard glass breaking while walking my 8:30 PM patrol round.\"","Listen to me: I heard glass breaking while walking my 8:30 PM patrol round.","I tell you the truth: I heard glass breaking while walking my 8:30 PM patrol round."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '03c51e6c-2b23-54e1-89bb-d18dbfaecfe9',
  'story_007',
  'ev_1',
  1,
  '08:15 PM',
  'A steel lockpick wire is left twisted inside the back door lock.',
  'A steel lockpick wire is left twisted inside the back door lock.',
  'The burglar entered through the rear alley door cleanly.',
  'Lockpick Wire',
  'Tension wrench and pick left in the brass keyway.',
  '["Crowbar","Sledgehammer","Brick"]'::jsonb,
  'Lockpick Wire',
  '["lockpick wire","lockpick","pick","wire"]'::jsonb,
  'A thin metal tool used by thieves to open locks without keys.',
  'ev_2',
  true,
  '{"descriptions":["A steel lockpick wire is left twisted inside the back door lock.","At 08:15 PM: A steel lockpick wire is left twisted inside the back door lock.","Notice this clue: A steel lockpick wire is left twisted inside the back door lock."],"hints":["A thin metal tool used by thieves to open locks without keys.","Clue hint: Think about lockpick wire.","Search for: the burglar entered through the rear alley door cleanly."],"clues":["Lockpick Wire","Item: Lockpick Wire","Clue Word: Lockpick Wire"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cbb86c0e-5894-5427-9a3d-cae87de838da',
  'story_007',
  'ev_2',
  2,
  '08:20 PM',
  'White clothesline rope is used to bind Moe’s wrists.',
  'White clothesline rope is used to bind Moe’s wrists.',
  'The robber tied up the owner to work without interference.',
  'Clothesline Rope',
  'Nylon cord with sailor knots tied behind Moe’s back.',
  '["Handcuffs","Chain","Duct Tape"]'::jsonb,
  'Clothesline Rope',
  '["clothesline rope","rope","clothesline","cord"]'::jsonb,
  'Thick braided string used to hang wet laundry.',
  'ev_3',
  false,
  '{"descriptions":["White clothesline rope is used to bind Moe’s wrists.","At 08:20 PM: White clothesline rope is used to bind Moe’s wrists.","Notice this clue: White clothesline rope is used to bind Moe’s wrists."],"hints":["Thick braided string used to hang wet laundry.","Clue hint: Think about clothesline rope.","Search for: the robber tied up the owner to work without interference."],"clues":["Clothesline Rope","Item: Clothesline Rope","Clue Word: Clothesline Rope"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'eb1c4417-e4f0-5545-9960-ee9f7b9ba14e',
  'story_007',
  'ev_3',
  3,
  '08:24 PM',
  'The ornate mahogany grandfather clock is cracked open.',
  'The ornate mahogany grandfather clock is cracked open.',
  'The clock was the sole target of the violent break-in.',
  'Grandfather Clock',
  'Antique wooden clock with broken curved glass door.',
  '["Pocket Watch","Wall Clock","Digital Clock"]'::jsonb,
  'Grandfather Clock',
  '["grandfather clock","clock","antique clock"]'::jsonb,
  'A tall standing wooden clock with swinging pendulum and weights.',
  'ev_4',
  false,
  '{"descriptions":["The ornate mahogany grandfather clock is cracked open.","At 08:24 PM: The ornate mahogany grandfather clock is cracked open.","Notice this clue: The ornate mahogany grandfather clock is cracked open."],"hints":["A tall standing wooden clock with swinging pendulum and weights.","Clue hint: Think about grandfather clock.","Search for: the clock was the sole target of the violent break-in."],"clues":["Grandfather Clock","Item: Grandfather Clock","Clue Word: Grandfather Clock"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '28081aff-1b25-58df-9f18-b9cb16c729fd',
  'story_007',
  'ev_4',
  4,
  '08:25 PM',
  'The round brass pendulum is pried apart with a small blade.',
  'The round brass pendulum is pried apart with a small blade.',
  'The secret hiding compartment was inside the pendulum bob.',
  'Brass Pendulum',
  'Heavy round brass disc split open with glue residue inside.',
  '["Clock Gears","Chime Bell","Hour Hand"]'::jsonb,
  'Brass Pendulum',
  '["brass pendulum","pendulum","clock pendulum"]'::jsonb,
  'The heavy weight that swings back and forth inside a tall clock.',
  'ev_5',
  false,
  '{"descriptions":["The round brass pendulum is pried apart with a small blade.","At 08:25 PM: The round brass pendulum is pried apart with a small blade.","Notice this clue: The round brass pendulum is pried apart with a small blade."],"hints":["The heavy weight that swings back and forth inside a tall clock.","Clue hint: Think about brass pendulum.","Search for: the secret hiding compartment was inside the pendulum bob."],"clues":["Brass Pendulum","Item: Brass Pendulum","Clue Word: Brass Pendulum"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '32185703-fa79-54a8-b5a8-067a142cd6f2',
  'story_007',
  'ev_5',
  5,
  '08:26 PM',
  'A small brass key stamped "Locker 104" was removed.',
  'A small brass key stamped "Locker 104" was removed.',
  'The hidden treasure was a key to a train station locker.',
  'Locker Key',
  'Brass key tag impression left in the felt lining.',
  '["Car Key","House Key","Vault Key"]'::jsonb,
  'Locker Key',
  '["locker key","key","station key","brass key"]'::jsonb,
  'A small metal item used to open a station storage box.',
  'ev_6',
  true,
  '{"descriptions":["A small brass key stamped \"Locker 104\" was removed.","At 08:26 PM: A small brass key stamped \"Locker 104\" was removed.","Notice this clue: A small brass key stamped \"Locker 104\" was removed."],"hints":["A small metal item used to open a station storage box.","Clue hint: Think about locker key.","Search for: the hidden treasure was a key to a train station locker."],"clues":["Locker Key","Item: Locker Key","Clue Word: Locker Key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '231264a0-5a9a-5cf0-957f-5ee69da25529',
  'story_007',
  'ev_6',
  6,
  '08:28 PM',
  'A pair of lucky silver dice is dropped under the counter.',
  'A pair of lucky silver dice is dropped under the counter.',
  'Frankie is known across town for carrying silver gaming dice.',
  'Silver Dice',
  'Pair of solid silver dice with initials F.T. engraved.',
  '["Poker Chips","Playing Cards","Dominoes"]'::jsonb,
  'Silver Dice',
  '["silver dice","dice","pair of dice"]'::jsonb,
  'Small cubes with dots on each side used in gambling games.',
  'ev_7',
  false,
  '{"descriptions":["A pair of lucky silver dice is dropped under the counter.","At 08:28 PM: A pair of lucky silver dice is dropped under the counter.","Notice this clue: A pair of lucky silver dice is dropped under the counter."],"hints":["Small cubes with dots on each side used in gambling games.","Clue hint: Think about silver dice.","Search for: frankie is known across town for carrying silver gaming dice."],"clues":["Silver Dice","Item: Silver Dice","Clue Word: Silver Dice"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6036df99-f80a-5d18-b77e-a44ee38f0f08',
  'story_007',
  'ev_7',
  7,
  '08:35 PM',
  'Muddy sneaker footprints lead directly toward the train terminal.',
  'Muddy sneaker footprints lead directly toward the train terminal.',
  'The thief was running straight to claim the locker contents.',
  'Sneaker Prints',
  'Waffle-soled athletic shoe prints in the alley puddle.',
  '["Boot Prints","Dress Shoes","Bare Footprints"]'::jsonb,
  'Sneaker Prints',
  '["sneaker prints","footprints","prints","tracks"]'::jsonb,
  'Shoe marks left in wet dirt or mud.',
  'ev_8',
  false,
  '{"descriptions":["Muddy sneaker footprints lead directly toward the train terminal.","At 08:35 PM: Muddy sneaker footprints lead directly toward the train terminal.","Notice this clue: Muddy sneaker footprints lead directly toward the train terminal."],"hints":["Shoe marks left in wet dirt or mud.","Clue hint: Think about sneaker prints.","Search for: the thief was running straight to claim the locker contents."],"clues":["Sneaker Prints","Item: Sneaker Prints","Clue Word: Sneaker Prints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '062d0951-4fe2-5a22-86ca-324374751251',
  'story_007',
  'ev_8',
  8,
  '08:50 PM',
  'A rusted crowbar with mahogany wood splinters is discarded.',
  'A rusted crowbar with mahogany wood splinters is discarded.',
  'The tool used to break the clock frame was tossed in a bin.',
  'Crowbar',
  'Short iron pry bar with red mahogany varnish on its tip.',
  '["Hammer","Wrench","Pipe"]'::jsonb,
  'Crowbar',
  '["crowbar","pry bar","iron bar"]'::jsonb,
  'A heavy curved iron bar used to pry things apart.',
  NULL,
  true,
  '{"descriptions":["A rusted crowbar with mahogany wood splinters is discarded.","At 08:50 PM: A rusted crowbar with mahogany wood splinters is discarded.","Notice this clue: A rusted crowbar with mahogany wood splinters is discarded."],"hints":["A heavy curved iron bar used to pry things apart.","Clue hint: Think about crowbar.","Search for: the tool used to break the clock frame was tossed in a bin."],"clues":["Crowbar","Item: Crowbar","Clue Word: Crowbar"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_008 — FOG ON HARBOR BRIDGE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_008',
  'Fog on Harbor Bridge',
  'Noir Mystery',
  'Harbor Suspension Bridge, thick ocean fog and yellow streetlamps',
  'A patrol car was found idling in the center lane with the driver door open and wet footprints.',
  '[{"name":"Victor Drake","role":"Syndicate Truck Driver","alibi":"Truck stop diner three miles north","avatar":"🚚"},{"name":"Officer Paul Miller","role":"Bridge Patrol Officer","alibi":"Missing person","avatar":"👮"},{"name":"Gus Henderson","role":"Bridge Toll Collector","alibi":"Toll booth north plaza","avatar":"🎫"},{"name":"Officer Clara Cole","role":"Patrol Partner","alibi":"Patrolling the south harbor approach","avatar":"🚨"}]'::jsonb,
  'Smuggler Victor Drake was driving an illegal shipment across the bridge when Officer Miller pulled him over. Drake held Miller at gunpoint, left the police car idling as a decoy, and kidnapped Miller to a coastal warehouse.',
  'Smuggler Victor Drake',
  'Officer Miller intercepted Drake’s contraband whiskey truck on the bridge.',
  '[{"time":"01:50 AM","event":"Miller spots a heavy diesel truck speeding across the bridge."},{"time":"02:02 AM","event":"Miller turns on siren and pulls the truck over in the center lane."},{"time":"02:06 AM","event":"Drake steps out armed with a revolver and corners Miller."},{"time":"02:10 AM","event":"Miller is forced into the truck; patrol car left idling in fog."},{"time":"02:15 AM","event":"Toll collector Gus sees the truck smash through the exit gate."}]'::jsonb,
  '[{"id":"ev1","title":"Amber Lens Fragments","detail":"Matches the broken front indicator of Drake’s diesel truck."},{"id":"ev2","title":"Miller’s Dropped Whistle","detail":"Found near the patrol car door with signs of a struggle."},{"id":"ev3","title":"Drake Hauling Bill","detail":"Found on the bridge asphalt showing contraband cargo."},{"id":"ev4","title":"Patrol Cap at Pier 12","detail":"Proves Officer Miller was taken to the seaside warehouse."}]'::jsonb,
  '[{"order":1,"title":"Police Siren","text":"Rotating beacon left flashing on the empty patrol car."},{"order":2,"title":"Broken Glass","text":"Amber plastic lens shattered during the vehicle encounter."},{"order":3,"title":"Police Whistle","text":"Officer Miller’s whistle dropped during the kidnapping."},{"order":4,"title":"Radio Mic","text":"Microphone left hanging off the hook on the cruiser dash."},{"order":5,"title":"Dual Tire Tracks","text":"Twin wheel tire prints from a large freight truck."},{"order":6,"title":"Shipping Bill","text":"Freight document naming Drake Hauling found on the bridge."}]'::jsonb,
  'A fishing net dangled over the bridge railing.: Left by late-night crab fishermen earlier in the evening.; Partner Clara Cole had Miller’s locker key.: She was keeping it safe while he was on solo patrol.',
  'Claim Miller jumped into the cold river below or blame his patrol partner.',
  'NORMAL',
  'What happened to Officer Paul Miller on the fog-covered bridge?',
  '[{"character":"Victor Drake","secret":"He was hauling forty crates of untaxed contraband."},{"character":"Officer Paul Miller","secret":"He was refusing bribes offered by Drake’s syndicate."},{"character":"Gus Henderson","secret":"He occasionally takes five-dollar bills to let trucks pass without tickets."},{"character":"Officer Clara Cole","secret":"She was investigating Drake’s warehouse independently."}]'::jsonb,
  '[{"lead":"A fishing net dangled over the bridge railing.","explanation":"Left by late-night crab fishermen earlier in the evening."},{"lead":"Partner Clara Cole had Miller’s locker key.","explanation":"She was keeping it safe while he was on solo patrol."}]'::jsonb,
  '{"wrongTheories":["Officer Miller fell or jumped off the bridge into the dark harbor.","Miller abandoned his car intentionally to flee the police force."],"correctTheory":"Smuggler Victor Drake intercepted and kidnapped Officer Paul Miller during a traffic stop on the bridge, fleeing with him to his warehouse at Pier 12."}'::jsonb,
  'Victor Drake kidnapped Officer Miller to hide his illegal bootleg shipment!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Officer Clara Cole led a raid on Pier 12, rescuing Officer Miller and arresting Victor Drake with forty crates of bootleg spirits."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Search boats spent days dragging the river for a jumper. Drake moved his operations north while Miller remained captive."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The department ruled Miller had deserted his post. Drake continued smuggling unhindered through city bridges."}]'::jsonb,
  '{"intros":["A patrol car was found idling in the center lane with the driver door open and wet footprints.","Case file story_008: A patrol car was found idling in the center lane with the driver door open and wet footprints. Look closely at every clue.","Trouble begins in Harbor Suspension Bridge, thick ocean fog and yellow streetlamps. A patrol car was found idling in the center lane with the driver door open and wet footprints.","The mystery starts now. A patrol car was found idling in the center lane with the driver door open and wet footprints. Can you solve it?"],"reveals":["Victor Drake kidnapped Officer Miller to hide his illegal bootleg shipment!","The mystery is unraveled! Victor Drake kidnapped Officer Miller to hide his illegal bootleg shipment!","At last, the truth comes out: Victor Drake kidnapped Officer Miller to hide his illegal bootleg shipment!","Case resolved! Here is what happened: Victor Drake kidnapped Officer Miller to hide his illegal bootleg shipment!"],"hints":["Pay attention to where Smuggler Victor Drake was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_008';
DELETE FROM public.case_events WHERE case_id = 'story_008';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '423e6149-e3b0-5c79-a993-0921c9facb7d',
  'story_008',
  'Victor Drake',
  'Syndicate Truck Driver',
  'Muscular, cold-eyed, leather bomber jacket',
  'I was sleeping in my cab at the interstate truck stop.',
  'He was hauling forty crates of untaxed contraband.',
  'Truck stop diner three miles north',
  'Drove the heavy freight truck stopped by Miller',
  'Miller’s radio was broadcasting their exact bridge location.',
  'Did not see Miller drop his brass whistle on the asphalt.',
  '🚚',
  '["I was sleeping in my cab at the interstate truck stop.","\"I was sleeping in my cab at the interstate truck stop.\"","Listen to me: I was sleeping in my cab at the interstate truck stop.","I tell you the truth: I was sleeping in my cab at the interstate truck stop."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'bbcb062a-ac74-500d-b397-1995787df8d4',
  'story_008',
  'Officer Paul Miller',
  'Bridge Patrol Officer',
  'Honest, brave, young recruit',
  'Missing victim; radio was left dangling from the cruiser dash.',
  'He was refusing bribes offered by Drake’s syndicate.',
  'Missing person',
  'Sole officer assigned to Bridge Sector 4',
  'Drake’s truck had a damaged left headlight and cargo smell.',
  'Did not know Drake carried an unlicensed snub-nosed revolver.',
  '👮',
  '["Missing victim; radio was left dangling from the cruiser dash.","\"Missing victim; radio was left dangling from the cruiser dash.\"","Listen to me: Missing victim; radio was left dangling from the cruiser dash.","I tell you the truth: Missing victim; radio was left dangling from the cruiser dash."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9173131b-b8d7-5c4b-b4a5-80e9472ae207',
  'story_008',
  'Gus Henderson',
  'Bridge Toll Collector',
  'Weary, shivering, sipping coffee in the booth',
  'I saw a huge diesel truck roar through without paying at 2:10 AM.',
  'He occasionally takes five-dollar bills to let trucks pass without tickets.',
  'Toll booth north plaza',
  'Controls the gate barrier at the bridge exit',
  'Heard two heavy vehicle doors slam out in the fog.',
  'Could not read the truck’s rear license plate in the fog.',
  '🎫',
  '["I saw a huge diesel truck roar through without paying at 2:10 AM.","\"I saw a huge diesel truck roar through without paying at 2:10 AM.\"","Listen to me: I saw a huge diesel truck roar through without paying at 2:10 AM.","I tell you the truth: I saw a huge diesel truck roar through without paying at 2:10 AM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c48b3b71-241d-5d4c-b1c6-27d2ad67a9a8',
  'story_008',
  'Officer Clara Cole',
  'Patrol Partner',
  'Determined, sharp, loyal',
  'Paul answered my radio call at 2:00 AM, then total static.',
  'She was investigating Drake’s warehouse independently.',
  'Patrolling the south harbor approach',
  'Miller’s regular patrol partner',
  'Found skid marks and glass shards on Bridge Span 3.',
  'Did not know Drake had an abandoned warehouse at Pier 12.',
  '🚨',
  '["Paul answered my radio call at 2:00 AM, then total static.","\"Paul answered my radio call at 2:00 AM, then total static.\"","Listen to me: Paul answered my radio call at 2:00 AM, then total static.","I tell you the truth: Paul answered my radio call at 2:00 AM, then total static."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f03cf2d5-71f7-59f5-b2b2-fc8576387737',
  'story_008',
  'ev_1',
  1,
  '02:02 AM',
  'The red and blue emergency beacon flashes on the empty patrol car.',
  'The red and blue emergency beacon flashes on the empty patrol car.',
  'The officer conducted an official traffic stop in the center lane.',
  'Police Siren',
  'Flashing light bar rotating silently in the thick grey fog.',
  '["Streetlight","Foghorn","Lighthouse"]'::jsonb,
  'Police Siren',
  '["police siren","siren","flashing light","beacon"]'::jsonb,
  'Flashing colored emergency light on top of a police cruiser.',
  'ev_2',
  true,
  '{"descriptions":["The red and blue emergency beacon flashes on the empty patrol car.","At 02:02 AM: The red and blue emergency beacon flashes on the empty patrol car.","Notice this clue: The red and blue emergency beacon flashes on the empty patrol car."],"hints":["Flashing colored emergency light on top of a police cruiser.","Clue hint: Think about police siren.","Search for: the officer conducted an official traffic stop in the center lane."],"clues":["Police Siren","Item: Police Siren","Clue Word: Police Siren"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3583994d-ce5d-57b9-8772-dae9aa6f4b2c',
  'story_008',
  'ev_2',
  2,
  '02:04 AM',
  'Broken amber glass from a heavy truck indicator covers the roadway.',
  'Broken amber glass from a heavy truck indicator covers the roadway.',
  'A large truck collided with or sideswiped the cruiser.',
  'Broken Glass',
  'Amber plastic lens fragments with heavy-duty commercial markings.',
  '["Windshield Shard","Mirror Glass","Bottle Glass"]'::jsonb,
  'Broken Glass',
  '["broken glass","glass","amber glass","lens"]'::jsonb,
  'Shattered pieces of colored vehicle indicator lights.',
  'ev_3',
  false,
  '{"descriptions":["Broken amber glass from a heavy truck indicator covers the roadway.","At 02:04 AM: Broken amber glass from a heavy truck indicator covers the roadway.","Notice this clue: Broken amber glass from a heavy truck indicator covers the roadway."],"hints":["Shattered pieces of colored vehicle indicator lights.","Clue hint: Think about broken glass.","Search for: a large truck collided with or sideswiped the cruiser."],"clues":["Broken Glass","Item: Broken Glass","Clue Word: Broken Glass"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '45baf142-2cc5-5ccd-a81e-1241a51337d7',
  'story_008',
  'ev_3',
  3,
  '02:06 AM',
  'A brass police whistle is found dropped near the driver door.',
  'A brass police whistle is found dropped near the driver door.',
  'Miller dropped his whistle as he was dragged away.',
  'Police Whistle',
  'Heavy brass whistle on a broken lanyard stamped with Miller’s badge number.',
  '["Badge","Handcuffs","Keyring"]'::jsonb,
  'Police Whistle',
  '["police whistle","whistle","brass whistle"]'::jsonb,
  'A small metal instrument blown to make a loud shrill sound.',
  'ev_4',
  false,
  '{"descriptions":["A brass police whistle is found dropped near the driver door.","At 02:06 AM: A brass police whistle is found dropped near the driver door.","Notice this clue: A brass police whistle is found dropped near the driver door."],"hints":["A small metal instrument blown to make a loud shrill sound.","Clue hint: Think about police whistle.","Search for: miller dropped his whistle as he was dragged away."],"clues":["Police Whistle","Item: Police Whistle","Clue Word: Police Whistle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4da851f6-ca67-514c-9b22-f178ebc09d7b',
  'story_008',
  'ev_4',
  4,
  '02:08 AM',
  'The two-way police radio microphone dangles on its cord.',
  'The two-way police radio microphone dangles on its cord.',
  'The officer was interrupted mid-sentence while calling dispatch.',
  'Radio Mic',
  'Black coiled cord dangling over the patrol car gearshift.',
  '["Telephone","Walkie Talkie","Megaphone"]'::jsonb,
  'Radio Mic',
  '["radio mic","radio","microphone","police radio"]'::jsonb,
  'Handheld speaker unit used to speak to police dispatch.',
  'ev_5',
  false,
  '{"descriptions":["The two-way police radio microphone dangles on its cord.","At 02:08 AM: The two-way police radio microphone dangles on its cord.","Notice this clue: The two-way police radio microphone dangles on its cord."],"hints":["Handheld speaker unit used to speak to police dispatch.","Clue hint: Think about radio mic.","Search for: the officer was interrupted mid-sentence while calling dispatch."],"clues":["Radio Mic","Item: Radio Mic","Clue Word: Radio Mic"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3a680cc1-38a5-539d-89f9-6a5aae232f0e',
  'story_008',
  'ev_5',
  5,
  '02:10 AM',
  'Heavy diesel tire tracks show twin wheels accelerating away.',
  'Heavy diesel tire tracks show twin wheels accelerating away.',
  'The suspect vehicle was an 18-wheel commercial flatbed truck.',
  'Dual Tire Tracks',
  'Deep rubber tread marks from twin rear truck tires.',
  '["Car Tracks","Motorcycle Marks","Bicycle Skid"]'::jsonb,
  'Dual Tire Tracks',
  '["dual tire tracks","tire tracks","truck tracks","tracks","tread"]'::jsonb,
  'Grooves left in the road by pairs of large heavy truck tires.',
  'ev_6',
  true,
  '{"descriptions":["Heavy diesel tire tracks show twin wheels accelerating away.","At 02:10 AM: Heavy diesel tire tracks show twin wheels accelerating away.","Notice this clue: Heavy diesel tire tracks show twin wheels accelerating away."],"hints":["Grooves left in the road by pairs of large heavy truck tires.","Clue hint: Think about dual tire tracks.","Search for: the suspect vehicle was an 18-wheel commercial flatbed truck."],"clues":["Dual Tire Tracks","Item: Dual Tire Tracks","Clue Word: Dual Tire Tracks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bc6899bf-6e67-5abd-af27-e2c4f9f65565',
  'story_008',
  'ev_6',
  6,
  '02:12 AM',
  'A dropped bill of lading smelling of aged whiskey is found.',
  'A dropped bill of lading smelling of aged whiskey is found.',
  'The truck was carrying illegal cases of bootleg spirits.',
  'Shipping Bill',
  'Water-stained freight invoice marked "Drake Hauling".',
  '["Newspaper","Map","Receipt"]'::jsonb,
  'Shipping Bill',
  '["shipping bill","bill","invoice","paper"]'::jsonb,
  'A commercial paper listing goods carried on a cargo trip.',
  'ev_7',
  false,
  '{"descriptions":["A dropped bill of lading smelling of aged whiskey is found.","At 02:12 AM: A dropped bill of lading smelling of aged whiskey is found.","Notice this clue: A dropped bill of lading smelling of aged whiskey is found."],"hints":["A commercial paper listing goods carried on a cargo trip.","Clue hint: Think about shipping bill.","Search for: the truck was carrying illegal cases of bootleg spirits."],"clues":["Shipping Bill","Item: Shipping Bill","Clue Word: Shipping Bill"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b0961350-0730-5bdf-be23-dd2e6727976f',
  'story_008',
  'ev_7',
  7,
  '02:20 AM',
  'The toll barrier wooden gate is snapped clean off its hinges.',
  'The toll barrier wooden gate is snapped clean off its hinges.',
  'The truck smashed the toll barrier without stopping to pay.',
  'Broken Toll Gate',
  'Splintered wooden gate arm with white and red reflective tape.',
  '["Iron Fence","Guard Rail","Chain"]'::jsonb,
  'Broken Toll Gate',
  '["broken toll gate","toll gate","gate","barrier","broken gate"]'::jsonb,
  'A wooden arm that lowers to stop cars at a toll booth.',
  'ev_8',
  false,
  '{"descriptions":["The toll barrier wooden gate is snapped clean off its hinges.","At 02:20 AM: The toll barrier wooden gate is snapped clean off its hinges.","Notice this clue: The toll barrier wooden gate is snapped clean off its hinges."],"hints":["A wooden arm that lowers to stop cars at a toll booth.","Clue hint: Think about broken toll gate.","Search for: the truck smashed the toll barrier without stopping to pay."],"clues":["Broken Toll Gate","Item: Broken Toll Gate","Clue Word: Broken Toll Gate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6aca4619-82c6-59e0-9aeb-73251b331e8c',
  'story_008',
  'ev_8',
  8,
  '02:40 AM',
  'Miller’s patrol cap is found on the loading dock at Pier 12.',
  'Miller’s patrol cap is found on the loading dock at Pier 12.',
  'Miller was brought to Drake’s seaside warehouse at Pier 12.',
  'Patrol Cap',
  'Navy blue peaked cap with city police badge emblem.',
  '["Fedora","Wool Beanie","Helmet"]'::jsonb,
  'Patrol Cap',
  '["patrol cap","cap","hat","police hat"]'::jsonb,
  'Official stiff hat worn by uniformed police officers.',
  NULL,
  true,
  '{"descriptions":["Miller’s patrol cap is found on the loading dock at Pier 12.","At 02:40 AM: Miller’s patrol cap is found on the loading dock at Pier 12.","Notice this clue: Miller’s patrol cap is found on the loading dock at Pier 12."],"hints":["Official stiff hat worn by uniformed police officers.","Clue hint: Think about patrol cap.","Search for: miller was brought to drake’s seaside warehouse at pier 12."],"clues":["Patrol Cap","Item: Patrol Cap","Clue Word: Patrol Cap"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_009 — THE BLACK DAHLIA HOTEL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_009',
  'The Black Dahlia Hotel',
  'Noir Mystery',
  'The Black Dahlia Hotel, Room 303, peeling wallpaper and rain on windows',
  'A guest in Room 303 checked out at dawn, leaving behind a locked steamer trunk and blood on the rug.',
  '[{"name":"Julian Vance","role":"Disinherited Heir","alibi":"Claims he attended a theater play uptown","avatar":"🎩"},{"name":"Rosa Mendez","role":"Hotel Maid","alibi":"Cleaning rooms on the second floor","avatar":"🧹"},{"name":"Otis Higgins","role":"Night Desk Clerk","alibi":"Behind the lobby reception counter","avatar":"🛎️"},{"name":"Inspector James Cross","role":"Homicide Detective","alibi":"Arrived with the coroner squad at 7:00 AM","avatar":"🔍"}]'::jsonb,
  'Julian Vance met his extortionist partner in Room 303 under the alias John Doe. He laced the port wine with cyanide, packed the victim into the trunk, but fled when the hotel clerk knocked on the door.',
  'Julian Vance',
  'Julian murdered his blackmailing business partner to keep an inheritance.',
  '[{"time":"10:00 PM","event":"A guest in a dark overcoat books Room 303 using cash."},{"time":"11:30 PM","event":"Victim arrives carrying a blackmail dossier."},{"time":"12:15 AM","event":"Cyanide wine is poured; victim collapses onto the carpet."},{"time":"04:45 AM","event":"The victim is packed into the heavy steamer trunk."},{"time":"05:10 AM","event":"Julian flees out the service door as Rosa begins her rounds."}]'::jsonb,
  '[{"id":"ev1","title":"Cyanide Wine Residue","detail":"Bitter almond chemical residue confirms murder by poison."},{"id":"ev2","title":"Fountain Pen J.V.","detail":"Lacquered pen matching Julian Vance found under the bed."},{"id":"ev3","title":"Half-Burned Extortion Letter","detail":"Names Julian Vance and threatens to expose his forged will."},{"id":"ev4","title":"Hollow Poison Ring","detail":"Carried by Julian with cyanide residue under the gemstone."}]'::jsonb,
  '[{"order":1,"title":"Cyanide Glass","text":"Wine goblet smelling of bitter poison found on the nightstand."},{"order":2,"title":"Steamer Trunk","text":"Locked heavy wooden box left in the middle of Room 303."},{"order":3,"title":"Blood Stain","text":"Dark stain soaked into the carpet near the bedpost."},{"order":4,"title":"Fountain Pen","text":"Luxury pen engraved with initials J.V. dropped under the bed."},{"order":5,"title":"Blackmail Letters","text":"Burnt papers proving the victim was extorting Julian Vance."},{"order":6,"title":"Room Key 303","text":"Hotel room key dropped in the lobby spittoon by the door."}]'::jsonb,
  'Maid Rosa stole a gold cigarette case.: She was opportunistic, but had nothing to do with the poison.; Night clerk Otis had cyanide rat poison in the basement.: Used strictly for hotel pest control.',
  'Blame the hotel maid Rosa or claim the blood was animal butcher spill.',
  'NORMAL',
  'What was sealed inside the heavy trunk and who booked Room 303 under a fake name?',
  '[{"character":"Julian Vance","secret":"Paid the room in cash and booked under the alias Mr. Smith."},{"character":"Rosa Mendez","secret":"She took a gold cigarette case from the vanity dresser."},{"character":"Otis Higgins","secret":"Did not ask for identification because he received a ten-dollar tip."},{"character":"Inspector James Cross","secret":"Recognized the victim as a known underworld blackmailer."}]'::jsonb,
  '[{"lead":"Maid Rosa stole a gold cigarette case.","explanation":"She was opportunistic, but had nothing to do with the poison."},{"lead":"Night clerk Otis had cyanide rat poison in the basement.","explanation":"Used strictly for hotel pest control."}]'::jsonb,
  '{"wrongTheories":["Maid Rosa poisoned the guest to steal his expensive luggage.","The victim committed suicide inside the locked hotel room."],"correctTheory":"Julian Vance booked Room 303 under a fake name, poisoned his blackmailer with cyanide from his poison ring, and sealed the body in the steamer trunk."}'::jsonb,
  'Julian Vance murdered his blackmailer using cyanide from a poison ring!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The engraved fountain pen and poison ring trapped Julian Vance. He confessed to the poisoning to avoid the electric chair."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Maid Rosa was arrested when the stolen cigarette case was found in her apron. Julian collected his inheritance in peace."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The death was ruled an accidental rat poison ingestion by a traveler. Julian quietly disposed of the trunk later."}]'::jsonb,
  '{"intros":["A guest in Room 303 checked out at dawn, leaving behind a locked steamer trunk and blood on the rug.","Case file story_009: A guest in Room 303 checked out at dawn, leaving behind a locked steamer trunk and blood on the rug. Look closely at every clue.","Trouble begins in The Black Dahlia Hotel, Room 303, peeling wallpaper and rain on windows. A guest in Room 303 checked out at dawn, leaving behind a locked steamer trunk and blood on the rug.","The mystery starts now. A guest in Room 303 checked out at dawn, leaving behind a locked steamer trunk and blood on the rug. Can you solve it?"],"reveals":["Julian Vance murdered his blackmailer using cyanide from a poison ring!","The mystery is unraveled! Julian Vance murdered his blackmailer using cyanide from a poison ring!","At last, the truth comes out: Julian Vance murdered his blackmailer using cyanide from a poison ring!","Case resolved! Here is what happened: Julian Vance murdered his blackmailer using cyanide from a poison ring!"],"hints":["Pay attention to where Julian Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_009';
DELETE FROM public.case_events WHERE case_id = 'story_009';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '870f591a-64d8-5a6e-a03a-1008c73d11ae',
  'story_009',
  'Julian Vance',
  'Disinherited Heir',
  'Nervous, well-groomed, twitching mustache',
  'I have never set foot in that cheap downtown hotel in my life.',
  'Paid the room in cash and booked under the alias Mr. Smith.',
  'Claims he attended a theater play uptown',
  'Victim was his former business partner blackmailing him',
  'The trunk key is hidden in the lining of his leather wallet.',
  'Left a monogrammed fountain pen under the bedside table.',
  '🎩',
  '["I have never set foot in that cheap downtown hotel in my life.","\"I have never set foot in that cheap downtown hotel in my life.\"","Listen to me: I have never set foot in that cheap downtown hotel in my life.","I tell you the truth: I have never set foot in that cheap downtown hotel in my life."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ab77bb7a-8544-523d-9c0a-441ecfdda15d',
  'story_009',
  'Rosa Mendez',
  'Hotel Maid',
  'Hard-working, fearful, speaks quiet English',
  'I opened Room 303 to change sheets and saw blood on the rug.',
  'She took a gold cigarette case from the vanity dresser.',
  'Cleaning rooms on the second floor',
  'First person to enter Room 303 after checkout',
  'Saw a tall gentleman with a black fedora leave at 5:00 AM.',
  'Did not know the trunk had a victim inside.',
  '🧹',
  '["I opened Room 303 to change sheets and saw blood on the rug.","\"I opened Room 303 to change sheets and saw blood on the rug.\"","Listen to me: I opened Room 303 to change sheets and saw blood on the rug.","I tell you the truth: I opened Room 303 to change sheets and saw blood on the rug."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e8094e53-1c16-56b9-ae04-c4226ab042e9',
  'story_009',
  'Otis Higgins',
  'Night Desk Clerk',
  'Bored, chewing gum, reading pulp magazines',
  'The guest paid cash upfront for one night and took Key 303.',
  'Did not ask for identification because he received a ten-dollar tip.',
  'Behind the lobby reception counter',
  'Handed the room key to the killer at 10:00 PM',
  'The guest carried a heavy empty trunk upstairs with great effort.',
  'Did not hear the poisoned victim collapse upstairs.',
  '🛎️',
  '["The guest paid cash upfront for one night and took Key 303.","\"The guest paid cash upfront for one night and took Key 303.\"","Listen to me: The guest paid cash upfront for one night and took Key 303.","I tell you the truth: The guest paid cash upfront for one night and took Key 303."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '07996946-de26-5b70-83c7-725e51ed817e',
  'story_009',
  'Inspector James Cross',
  'Homicide Detective',
  'Grim, weary, constant pipe smoker',
  'Room 303 smelled of bitter almonds the second we opened the door.',
  'Recognized the victim as a known underworld blackmailer.',
  'Arrived with the coroner squad at 7:00 AM',
  'Leading the murder investigation',
  'Bitter almond scent indicates potassium cyanide poison.',
  'Did not know Julian’s theater ticket was purchased post-show.',
  '🔍',
  '["Room 303 smelled of bitter almonds the second we opened the door.","\"Room 303 smelled of bitter almonds the second we opened the door.\"","Listen to me: Room 303 smelled of bitter almonds the second we opened the door.","I tell you the truth: Room 303 smelled of bitter almonds the second we opened the door."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b14ceff9-db3f-57a7-942d-d3ff32eec775',
  'story_009',
  'ev_1',
  1,
  '12:15 AM',
  'A shattered crystal wine glass smells of bitter almonds.',
  'A shattered crystal wine glass smells of bitter almonds.',
  'The victim was poisoned using fatal potassium cyanide.',
  'Cyanide Glass',
  'Stemmed wine glass with dried white chemical film.',
  '["Whiskey Tumbler","Coffee Mug","Teacup"]'::jsonb,
  'Cyanide Glass',
  '["cyanide glass","glass","wine glass","poison glass"]'::jsonb,
  'A delicate drinking vessel smelling of bitter poison.',
  'ev_2',
  true,
  '{"descriptions":["A shattered crystal wine glass smells of bitter almonds.","At 12:15 AM: A shattered crystal wine glass smells of bitter almonds.","Notice this clue: A shattered crystal wine glass smells of bitter almonds."],"hints":["A delicate drinking vessel smelling of bitter poison.","Clue hint: Think about cyanide glass.","Search for: the victim was poisoned using fatal potassium cyanide."],"clues":["Cyanide Glass","Item: Cyanide Glass","Clue Word: Cyanide Glass"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c5b731e9-22c3-5038-8e53-89c97f08c3d8',
  'story_009',
  'ev_2',
  2,
  '04:45 AM',
  'A heavy brass-bound leather steamer trunk sits locked in the center.',
  'A heavy brass-bound leather steamer trunk sits locked in the center.',
  'The trunk was brought in to conceal and move the victim’s body.',
  'Steamer Trunk',
  'Heavy vintage travel trunk secured with twin brass padlocks.',
  '["Suitcase","Cardboard Box","Duffel Bag"]'::jsonb,
  'Steamer Trunk',
  '["steamer trunk","trunk","chest","box"]'::jsonb,
  'A large heavy wooden and leather box used for ocean voyages.',
  'ev_3',
  false,
  '{"descriptions":["A heavy brass-bound leather steamer trunk sits locked in the center.","At 04:45 AM: A heavy brass-bound leather steamer trunk sits locked in the center.","Notice this clue: A heavy brass-bound leather steamer trunk sits locked in the center."],"hints":["A large heavy wooden and leather box used for ocean voyages.","Clue hint: Think about steamer trunk.","Search for: the trunk was brought in to conceal and move the victim’s body."],"clues":["Steamer Trunk","Item: Steamer Trunk","Clue Word: Steamer Trunk"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2e31872e-f2cb-5b34-aacb-532518add05c',
  'story_009',
  'ev_3',
  3,
  '05:00 AM',
  'A dark red blood stain soaked deep into the floral carpet.',
  'A dark red blood stain soaked deep into the floral carpet.',
  'The victim struck their head on the bedpost as they collapsed.',
  'Blood Stain',
  'Dry dark crimson stain beneath the corner of the rug.',
  '["Wine Spill","Paint Drop","Ink Splash"]'::jsonb,
  'Blood Stain',
  '["blood stain","blood","bloodstain","stain"]'::jsonb,
  'Dark red fluid mark left on the floor after an injury.',
  'ev_4',
  false,
  '{"descriptions":["A dark red blood stain soaked deep into the floral carpet.","At 05:00 AM: A dark red blood stain soaked deep into the floral carpet.","Notice this clue: A dark red blood stain soaked deep into the floral carpet."],"hints":["Dark red fluid mark left on the floor after an injury.","Clue hint: Think about blood stain.","Search for: the victim struck their head on the bedpost as they collapsed."],"clues":["Blood Stain","Item: Blood Stain","Clue Word: Blood Stain"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6f244854-41f9-50eb-8c04-aada7d2d7d3a',
  'story_009',
  'ev_4',
  4,
  '05:15 AM',
  'A gold-nibbed fountain pen with initials J.V. is rolled under the bed.',
  'A gold-nibbed fountain pen with initials J.V. is rolled under the bed.',
  'Julian Vance dropped his expensive personalized pen.',
  'Fountain Pen',
  'Black lacquered fountain pen with engraved initials J.V.',
  '["Pencil","Cigarette Lighter","Comb"]'::jsonb,
  'Fountain Pen',
  '["fountain pen","pen","gold pen"]'::jsonb,
  'An elegant writing instrument that uses liquid black ink.',
  'ev_5',
  false,
  '{"descriptions":["A gold-nibbed fountain pen with initials J.V. is rolled under the bed.","At 05:15 AM: A gold-nibbed fountain pen with initials J.V. is rolled under the bed.","Notice this clue: A gold-nibbed fountain pen with initials J.V. is rolled under the bed."],"hints":["An elegant writing instrument that uses liquid black ink.","Clue hint: Think about fountain pen.","Search for: julian vance dropped his expensive personalized pen."],"clues":["Fountain Pen","Item: Fountain Pen","Clue Word: Fountain Pen"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4ac6be65-eb3a-5328-9d52-252d2ed996be',
  'story_009',
  'ev_5',
  5,
  '05:30 AM',
  'The hotel guest register shows the fake signature "John Doe".',
  'The hotel guest register shows the fake signature "John Doe".',
  'The killer used a false alias to avoid hotel records.',
  'Guest Register',
  'Hotel ledger with shaky handwriting matching Julian’s script.',
  '["Receipt","Phone Book","Menu"]'::jsonb,
  'Guest Register',
  '["guest register","register","ledger","hotel book"]'::jsonb,
  'A large book kept at hotel reception desks where guests sign names.',
  'ev_6',
  true,
  '{"descriptions":["The hotel guest register shows the fake signature \"John Doe\".","At 05:30 AM: The hotel guest register shows the fake signature \"John Doe\".","Notice this clue: The hotel guest register shows the fake signature \"John Doe\"."],"hints":["A large book kept at hotel reception desks where guests sign names.","Clue hint: Think about guest register.","Search for: the killer used a false alias to avoid hotel records."],"clues":["Guest Register","Item: Guest Register","Clue Word: Guest Register"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8ec0b013-3be8-5e85-9424-fad31dcddf3c',
  'story_009',
  'ev_6',
  6,
  '06:00 AM',
  'A blackmail file with Julian’s financial secrets is found in the ashes.',
  'A blackmail file with Julian’s financial secrets is found in the ashes.',
  'The victim was extorting Julian over forged inheritance checks.',
  'Blackmail Letters',
  'Half-burned correspondence demanding twenty thousand dollars.',
  '["Newspaper","Diary","Map"]'::jsonb,
  'Blackmail Letters',
  '["blackmail letters","letters","dossier","papers"]'::jsonb,
  'Threatening written notes demanding money in exchange for silence.',
  'ev_7',
  false,
  '{"descriptions":["A blackmail file with Julian’s financial secrets is found in the ashes.","At 06:00 AM: A blackmail file with Julian’s financial secrets is found in the ashes.","Notice this clue: A blackmail file with Julian’s financial secrets is found in the ashes."],"hints":["Threatening written notes demanding money in exchange for silence.","Clue hint: Think about blackmail letters.","Search for: the victim was extorting julian over forged inheritance checks."],"clues":["Blackmail Letters","Item: Blackmail Letters","Clue Word: Blackmail Letters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ec689e5b-cbb1-50c9-8b28-cba7bb3c1076',
  'story_009',
  'ev_7',
  7,
  '06:30 AM',
  'A brass room key numbered 303 was dropped in the lobby spittoon.',
  'A brass room key numbered 303 was dropped in the lobby spittoon.',
  'The killer threw the key away as he sneaked out the front.',
  'Room Key 303',
  'Heavy brass key attached to an oval plastic room 303 tag.',
  '["Car Key","Padlock Key","Watch Fob"]'::jsonb,
  'Room Key 303',
  '["room key 303","key","room key","brass key","hotel key"]'::jsonb,
  'A numbered key given to hotel guests to unlock their bedroom.',
  'ev_8',
  false,
  '{"descriptions":["A brass room key numbered 303 was dropped in the lobby spittoon.","At 06:30 AM: A brass room key numbered 303 was dropped in the lobby spittoon.","Notice this clue: A brass room key numbered 303 was dropped in the lobby spittoon."],"hints":["A numbered key given to hotel guests to unlock their bedroom.","Clue hint: Think about room key 303.","Search for: the killer threw the key away as he sneaked out the front."],"clues":["Room Key 303","Item: Room Key 303","Clue Word: Room Key 303"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9b3da5e7-6cd1-5338-b0cf-6433f575b1e0',
  'story_009',
  'ev_8',
  8,
  '07:00 AM',
  'Cyanide powder traces are found inside Julian’s silver ring.',
  'Cyanide powder traces are found inside Julian’s silver ring.',
  'Julian carried the poison inside a hidden compartment ring.',
  'Poison Ring',
  'Hollow silver signet ring with a hinged spring bezel.',
  '["Watch Case","Pill Box","Cufflink"]'::jsonb,
  'Poison Ring',
  '["poison ring","ring","signet ring","jewelry"]'::jsonb,
  'A piece of jewelry worn on fingers with a secret cavity.',
  NULL,
  true,
  '{"descriptions":["Cyanide powder traces are found inside Julian’s silver ring.","At 07:00 AM: Cyanide powder traces are found inside Julian’s silver ring.","Notice this clue: Cyanide powder traces are found inside Julian’s silver ring."],"hints":["A piece of jewelry worn on fingers with a secret cavity.","Clue hint: Think about poison ring.","Search for: julian carried the poison inside a hidden compartment ring."],"clues":["Poison Ring","Item: Poison Ring","Clue Word: Poison Ring"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_010 — WHISPERS AT THE SPEAKEASY
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_010',
  'Whispers at the Speakeasy',
  'Noir Mystery',
  'The Blind Pig Cellar, behind a fake barber shop bookcase',
  'A city alderman collapsed in Booth 4 after drinking poisoned bourbon during a secret vote.',
  '[{"name":"Mickey Flynn","role":"Speakeasy Bartender","alibi":"Serving drinks behind the bar counter all night","avatar":"🍸"},{"name":"Alderman George Thomas","role":"City Politician","alibi":"Sitting in private curtained Booth 4","avatar":"🏛️"},{"name":"Lola LaRue","role":"Flapper Dancer","alibi":"Dressing room touching up rouge","avatar":"💃"},{"name":"Salvatore \"Big Sal\" Rossi","role":"Speakeasy Boss","alibi":"Card room in the back playing poker","avatar":"🤵"}]'::jsonb,
  'Bartender Mickey Flynn froze arsenic solution inside hollow square ice cubes. When Alderman Thomas ordered his customary bourbon on the rocks, the melting ice released the poison.',
  'Bartender Mickey Flynn',
  'Mickey’s brother was sent to prison by Thomas’s corrupt zoning decisions.',
  '[{"time":"09:30 PM","event":"Alderman Thomas enters through the secret barber shop bookcase."},{"time":"10:15 PM","event":"Mickey prepares a glass with three special cloudy ice cubes."},{"time":"10:20 PM","event":"Thomas drinks the bourbon while arguing with Lola."},{"time":"10:45 PM","event":"The ice melts; Thomas clutches his throat and collapses."},{"time":"11:00 PM","event":"Big Sal locks the heavy doors and calls for an underworld doctor."}]'::jsonb,
  '[{"id":"ev1","title":"Poisoned Ice Residue","detail":"Chemical analysis shows arsenic frozen inside the ice cube core."},{"id":"ev2","title":"Arsenic Bottle in Bar Cellar","detail":"Hidden behind Mickey’s syrup bottles with his fingerprints."},{"id":"ev3","title":"Prison Letter from Brother","detail":"Establishes Mickey’s motive to eliminate Alderman Thomas."},{"id":"ev4","title":"Ice Pick with Carved M.F.","detail":"Used exclusively by bartender Mickey Flynn."}]'::jsonb,
  '[{"order":1,"title":"Ice Cube Tray","text":"Metal freezer mold used to prepare the poisoned ice cubes."},{"order":2,"title":"Poisoned Ice","text":"Frozen cubes that released lethal arsenic as they melted."},{"order":3,"title":"Bourbon Glass","text":"Crystal rocks glass containing the poisoned drink dregs."},{"order":4,"title":"Ice Pick","text":"Sharp steel tool used to shape the poisoned ice."},{"order":5,"title":"Prison Letter","text":"Vengeful letter detailing the death of Mickey’s brother in prison."},{"order":6,"title":"Arsenic Bottle","text":"Amber glass bottle of rat poison hidden behind the bar."}]'::jsonb,
  'Dancer Lola sat at Booth 4 right before the collapse.: She was trying to steal his political notebook, not kill him.; Big Sal had an argument with Thomas over protection fees.: Big Sal wanted Thomas alive so his club stayed open.',
  'Blame the flapper dancer Lola or claim the whole liquor batch was contaminated.',
  'NORMAL',
  'Who poisoned Alderman Thomas and how did the poison enter his glass?',
  '[{"character":"Mickey Flynn","secret":"His younger brother died in prison because of Alderman Thomas."},{"character":"Alderman George Thomas","secret":"Accepted twenty thousand dollars to approve factory zoning."},{"character":"Lola LaRue","secret":"She was paid to steal Thomas’s vote tally notebook."},{"character":"Salvatore \"Big Sal\" Rossi","secret":"He was bribing Alderman Thomas for police protection."}]'::jsonb,
  '[{"lead":"Dancer Lola sat at Booth 4 right before the collapse.","explanation":"She was trying to steal his political notebook, not kill him."},{"lead":"Big Sal had an argument with Thomas over protection fees.","explanation":"Big Sal wanted Thomas alive so his club stayed open."}]'::jsonb,
  '{"wrongTheories":["Dancer Lola slipped poison into Thomas’s glass while dancing.","The entire barrel of bootleg bourbon was contaminated with wood alcohol."],"correctTheory":"Bartender Mickey Flynn froze arsenic inside the ice cubes of Alderman Thomas’s bourbon to avenge his brother’s death in prison."}'::jsonb,
  'Bartender Mickey Flynn poisoned the ice cubes to avenge his brother!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The poisoned ice tray and the arsenic bottle behind the bar trapped Mickey Flynn. Thomas survived in hospital and Mickey was imprisoned."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Flapper dancer Lola was arrested for tampering with the glass. Mickey Flynn packed his shaker and vanished into the night."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Big Sal threw out the entire shipment of bourbon, blaming bad moonshine. Mickey continued tending bar with his vengeance complete."}]'::jsonb,
  '{"intros":["A city alderman collapsed in Booth 4 after drinking poisoned bourbon during a secret vote.","Case file story_010: A city alderman collapsed in Booth 4 after drinking poisoned bourbon during a secret vote. Look closely at every clue.","Trouble begins in The Blind Pig Cellar, behind a fake barber shop bookcase. A city alderman collapsed in Booth 4 after drinking poisoned bourbon during a secret vote.","The mystery starts now. A city alderman collapsed in Booth 4 after drinking poisoned bourbon during a secret vote. Can you solve it?"],"reveals":["Bartender Mickey Flynn poisoned the ice cubes to avenge his brother!","The mystery is unraveled! Bartender Mickey Flynn poisoned the ice cubes to avenge his brother!","At last, the truth comes out: Bartender Mickey Flynn poisoned the ice cubes to avenge his brother!","Case resolved! Here is what happened: Bartender Mickey Flynn poisoned the ice cubes to avenge his brother!"],"hints":["Pay attention to where Bartender Mickey Flynn was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_010';
DELETE FROM public.case_events WHERE case_id = 'story_010';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '38fa335f-5001-5d71-909a-ca2eeeab6895',
  'story_010',
  'Mickey Flynn',
  'Speakeasy Bartender',
  'Quiet, brooding, quick with a cocktail shaker',
  'I poured the bourbon straight from the sealed bottle on the top shelf.',
  'His younger brother died in prison because of Alderman Thomas.',
  'Serving drinks behind the bar counter all night',
  'Prepared the drink served to Booth 4',
  'Thomas always drinks his bourbon with three square ice cubes.',
  'Left the ice pick and freezer tray smelling of arsenic.',
  '🍸',
  '["I poured the bourbon straight from the sealed bottle on the top shelf.","\"I poured the bourbon straight from the sealed bottle on the top shelf.\"","Listen to me: I poured the bourbon straight from the sealed bottle on the top shelf.","I tell you the truth: I poured the bourbon straight from the sealed bottle on the top shelf."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8fc2aa6f-eb6c-5991-a7b0-e7e04242dea6',
  'story_010',
  'Alderman George Thomas',
  'City Politician',
  'Arrogant, rotund, wearing a silk cravat and gold chain',
  'Victim in critical condition; gasped "the ice... burning..."',
  'Accepted twenty thousand dollars to approve factory zoning.',
  'Sitting in private curtained Booth 4',
  'Target of the poisoning',
  'He had enemies on both sides of the city council.',
  'Did not notice the ice cubes looked cloudy in the glass.',
  '🏛️',
  '["Victim in critical condition; gasped \"the ice... burning...\"","\"Victim in critical condition; gasped \"the ice... burning...\"\"","Listen to me: Victim in critical condition; gasped \"the ice... burning...\"","I tell you the truth: Victim in critical condition; gasped \"the ice... burning...\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '145c5ac2-3869-529b-b8fe-6765b4ef6f89',
  'story_010',
  'Lola LaRue',
  'Flapper Dancer',
  'Vivacious, bold, wears feathers and beaded dress',
  'I sat with George for five minutes, but he was boring and rude.',
  'She was paid to steal Thomas’s vote tally notebook.',
  'Dressing room touching up rouge',
  'Sat at Booth 4 right before Thomas collapsed',
  'Noticed Thomas complaining the ice smelled bitter.',
  'Did not know the bartender made special ice trays.',
  '💃',
  '["I sat with George for five minutes, but he was boring and rude.","\"I sat with George for five minutes, but he was boring and rude.\"","Listen to me: I sat with George for five minutes, but he was boring and rude.","I tell you the truth: I sat with George for five minutes, but he was boring and rude."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '145eae08-fc22-54eb-92da-e47bf7e84dea',
  'story_010',
  'Salvatore "Big Sal" Rossi',
  'Speakeasy Boss',
  'Imposing, sharply dressed, smoking a cigar',
  'Nobody poisons my customers in my cellar. It hurts business.',
  'He was bribing Alderman Thomas for police protection.',
  'Card room in the back playing poker',
  'Owner of the Blind Pig Speakeasy',
  'The bourbon bottle itself was tested and found pure.',
  'Did not inspect the icebox in the kitchen cellar.',
  '🤵',
  '["Nobody poisons my customers in my cellar. It hurts business.","\"Nobody poisons my customers in my cellar. It hurts business.\"","Listen to me: Nobody poisons my customers in my cellar. It hurts business.","I tell you the truth: Nobody poisons my customers in my cellar. It hurts business."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '267f193f-4adf-5d79-8dbf-fd1c2f3a2e9a',
  'story_010',
  'ev_1',
  1,
  '10:15 PM',
  'An antique metal ice cube tray with square molds is found in the freezer.',
  'An antique metal ice cube tray with square molds is found in the freezer.',
  'One tray was kept separate for making poisoned ice.',
  'Ice Cube Tray',
  'Metal ice tray with chemical residue in three compartments.',
  '["Cocktail Shaker","Wine Bucket","Glass Pitcher"]'::jsonb,
  'Ice Cube Tray',
  '["ice cube tray","tray","ice tray","metal tray"]'::jsonb,
  'A metal or plastic container used to freeze water into cubes.',
  'ev_2',
  true,
  '{"descriptions":["An antique metal ice cube tray with square molds is found in the freezer.","At 10:15 PM: An antique metal ice cube tray with square molds is found in the freezer.","Notice this clue: An antique metal ice cube tray with square molds is found in the freezer."],"hints":["A metal or plastic container used to freeze water into cubes.","Clue hint: Think about ice cube tray.","Search for: one tray was kept separate for making poisoned ice."],"clues":["Ice Cube Tray","Item: Ice Cube Tray","Clue Word: Ice Cube Tray"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dfb0f117-5e3c-56a1-9e9e-0194af224cbf',
  'story_010',
  'ev_2',
  2,
  '10:18 PM',
  'Cloudy square ice cubes melt slowly in a heavy glass tumbler.',
  'Cloudy square ice cubes melt slowly in a heavy glass tumbler.',
  'The poison was locked inside the ice until it melted.',
  'Poisoned Ice',
  'Partially melted ice cubes with white arsenic sediment.',
  '["Sugar Cube","Lemon Slice","Olive"]'::jsonb,
  'Poisoned Ice',
  '["poisoned ice","ice","ice cubes","cubes"]'::jsonb,
  'Frozen water that floats in drinks to keep them cold.',
  'ev_3',
  false,
  '{"descriptions":["Cloudy square ice cubes melt slowly in a heavy glass tumbler.","At 10:18 PM: Cloudy square ice cubes melt slowly in a heavy glass tumbler.","Notice this clue: Cloudy square ice cubes melt slowly in a heavy glass tumbler."],"hints":["Frozen water that floats in drinks to keep them cold.","Clue hint: Think about poisoned ice.","Search for: the poison was locked inside the ice until it melted."],"clues":["Poisoned Ice","Item: Poisoned Ice","Clue Word: Poisoned Ice"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '476a2102-d3cd-5ce6-9a30-e5adb01af474',
  'story_010',
  'ev_3',
  3,
  '10:20 PM',
  'A crystal rocks glass smelling of expensive Kentucky bourbon is dropped.',
  'A crystal rocks glass smelling of expensive Kentucky bourbon is dropped.',
  'The bourbon itself was clean; only the melting ice was lethal.',
  'Bourbon Glass',
  'Heavy crystal tumbler with melted watery poison at the bottom.',
  '["Beer Mug","Champagne Flute","Shot Glass"]'::jsonb,
  'Bourbon Glass',
  '["bourbon glass","glass","tumbler","rocks glass"]'::jsonb,
  'A thick, short glass used for drinking whiskey or bourbon.',
  'ev_4',
  false,
  '{"descriptions":["A crystal rocks glass smelling of expensive Kentucky bourbon is dropped.","At 10:20 PM: A crystal rocks glass smelling of expensive Kentucky bourbon is dropped.","Notice this clue: A crystal rocks glass smelling of expensive Kentucky bourbon is dropped."],"hints":["A thick, short glass used for drinking whiskey or bourbon.","Clue hint: Think about bourbon glass.","Search for: the bourbon itself was clean; only the melting ice was lethal."],"clues":["Bourbon Glass","Item: Bourbon Glass","Clue Word: Bourbon Glass"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '612bd8f1-a573-5740-a972-10f40ef1670e',
  'story_010',
  'ev_4',
  4,
  '10:30 PM',
  'A steel ice pick with a wooden handle is stabbed into the ice block.',
  'A steel ice pick with a wooden handle is stabbed into the ice block.',
  'Used to shape and chip the poisoned ice cubes into cubes.',
  'Ice Pick',
  'Pointed steel tool with Mickey’s bartender initials carved.',
  '["Corkscrew","Knife","Screwdriver"]'::jsonb,
  'Ice Pick',
  '["ice pick","pick","ice tool"]'::jsonb,
  'A sharp pointed metal rod used to chip large ice blocks.',
  'ev_5',
  false,
  '{"descriptions":["A steel ice pick with a wooden handle is stabbed into the ice block.","At 10:30 PM: A steel ice pick with a wooden handle is stabbed into the ice block.","Notice this clue: A steel ice pick with a wooden handle is stabbed into the ice block."],"hints":["A sharp pointed metal rod used to chip large ice blocks.","Clue hint: Think about ice pick.","Search for: used to shape and chip the poisoned ice cubes into cubes."],"clues":["Ice Pick","Item: Ice Pick","Clue Word: Ice Pick"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '30727799-d588-5736-bd6d-0d06d048ac6b',
  'story_010',
  'ev_5',
  5,
  '10:40 PM',
  'A handwritten letter from Mickey’s imprisoned brother is found.',
  'A handwritten letter from Mickey’s imprisoned brother is found.',
  'Mickey swore vengeance against Alderman Thomas for the sentence.',
  'Prison Letter',
  'Letter stamped from Blackwood Penitentiary describing abuse.',
  '["Newspaper","Menu","Betting Slip"]'::jsonb,
  'Prison Letter',
  '["prison letter","letter","note","mail"]'::jsonb,
  'Written correspondence sent from an inmate inside jail.',
  'ev_6',
  true,
  '{"descriptions":["A handwritten letter from Mickey’s imprisoned brother is found.","At 10:40 PM: A handwritten letter from Mickey’s imprisoned brother is found.","Notice this clue: A handwritten letter from Mickey’s imprisoned brother is found."],"hints":["Written correspondence sent from an inmate inside jail.","Clue hint: Think about prison letter.","Search for: mickey swore vengeance against alderman thomas for the sentence."],"clues":["Prison Letter","Item: Prison Letter","Clue Word: Prison Letter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1c3bb117-f2a4-52ef-9894-6bf1a88a283b',
  'story_010',
  'ev_6',
  6,
  '10:50 PM',
  'A bottle of rat poison powder is hidden behind the tonic syrup.',
  'A bottle of rat poison powder is hidden behind the tonic syrup.',
  'White arsenic trioxide powder was dissolved in the ice water.',
  'Arsenic Bottle',
  'Amber glass bottle with red skull and crossbones label.',
  '["Medicine Bottle","Perfume Flask","Ink Well"]'::jsonb,
  'Arsenic Bottle',
  '["arsenic bottle","arsenic","poison bottle","rat poison"]'::jsonb,
  'A bottle containing dangerous lethal poison powder.',
  'ev_7',
  false,
  '{"descriptions":["A bottle of rat poison powder is hidden behind the tonic syrup.","At 10:50 PM: A bottle of rat poison powder is hidden behind the tonic syrup.","Notice this clue: A bottle of rat poison powder is hidden behind the tonic syrup."],"hints":["A bottle containing dangerous lethal poison powder.","Clue hint: Think about arsenic bottle.","Search for: white arsenic trioxide powder was dissolved in the ice water."],"clues":["Arsenic Bottle","Item: Arsenic Bottle","Clue Word: Arsenic Bottle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b0be22c0-b854-57c1-93c7-aa3b90d50991',
  'story_010',
  'ev_7',
  7,
  '11:10 PM',
  'The secret barber shop bookcase was wedged shut with an iron bolt.',
  'The secret barber shop bookcase was wedged shut with an iron bolt.',
  'Patrons were locked inside so nobody could flee the crime scene.',
  'Bookcase Door',
  'Revolving wood bookcase with hidden steel latch.',
  '["Trapdoor","Curtain","Iron Gate"]'::jsonb,
  'Bookcase Door',
  '["bookcase door","bookcase","secret door","door"]'::jsonb,
  'A piece of furniture holding books that swings open like a door.',
  'ev_8',
  false,
  '{"descriptions":["The secret barber shop bookcase was wedged shut with an iron bolt.","At 11:10 PM: The secret barber shop bookcase was wedged shut with an iron bolt.","Notice this clue: The secret barber shop bookcase was wedged shut with an iron bolt."],"hints":["A piece of furniture holding books that swings open like a door.","Clue hint: Think about bookcase door.","Search for: patrons were locked inside so nobody could flee the crime scene."],"clues":["Bookcase Door","Item: Bookcase Door","Clue Word: Bookcase Door"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '021305cb-cc71-5a42-84ea-0ca4fd898f7c',
  'story_010',
  'ev_8',
  8,
  '11:30 PM',
  'A silver pocket watch belonging to Thomas was cracked during his fall.',
  'A silver pocket watch belonging to Thomas was cracked during his fall.',
  'The exact time of the lethal collapse was fixed at 10:45 PM.',
  'Pocket Watch',
  'Gold-plated pocket watch stopped at 10:45 with cracked crystal.',
  '["Wristwatch","Clock","Compass"]'::jsonb,
  'Pocket Watch',
  '["pocket watch","watch","gold watch"]'::jsonb,
  'A timepiece carried in a waistcoat pocket attached to a chain.',
  NULL,
  true,
  '{"descriptions":["A silver pocket watch belonging to Thomas was cracked during his fall.","At 11:30 PM: A silver pocket watch belonging to Thomas was cracked during his fall.","Notice this clue: A silver pocket watch belonging to Thomas was cracked during his fall."],"hints":["A timepiece carried in a waistcoat pocket attached to a chain.","Clue hint: Think about pocket watch.","Search for: the exact time of the lethal collapse was fixed at 10:45 pm."],"clues":["Pocket Watch","Item: Pocket Watch","Clue Word: Pocket Watch"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_011 — THE FORGED WILL OF OLD SILAS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_011',
  'The Forged Will of Old Silas',
  'Noir Mystery',
  'Blackwood Hollow Manor, dark mahogany library and crackling fireplace',
  'Tycoon Silas Sterling died in his leather armchair; his last will and testament was missing its signature page.',
  '[{"name":"Evelyn Sterling","role":"Socialite Daughter","alibi":"Sitting in the second-floor sitting room","avatar":"🪡"},{"name":"Jarvis Finch","role":"Head Butler","alibi":"Polishing silver in the basement pantry","avatar":"🤵"},{"name":"Horace Vance","role":"Family Lawyer","alibi":"Driving through the rainstorm from the city","avatar":"📜"},{"name":"Dr. Alistair Ross","role":"Family Physician","alibi":"Arrived at 10:30 PM to certify the death certificate","avatar":"🩺"}]'::jsonb,
  'Daughter Evelyn Sterling found her father dead of heart failure. Discovering the will left his millions to charity, she cut out the final page with her embroidery scissors and burned it in the grate.',
  'Evelyn Sterling',
  'Old Silas disinherited Evelyn in favor of the town children’s hospital.',
  '[{"time":"09:00 PM","event":"Jarvis serves chamomile tea and leaves the study."},{"time":"09:45 PM","event":"Silas suffers a fatal heart attack while reviewing his will."},{"time":"10:00 PM","event":"Evelyn enters the study and discovers Silas deceased."},{"time":"10:10 PM","event":"Evelyn cuts out the signature page and burns it in the hearth."},{"time":"11:00 PM","event":"Lawyer Horace arrives and finds the mutilated document."}]'::jsonb,
  '[{"id":"ev1","title":"Embroidery Scissors with Paper Fibers","detail":"Found on the blotter with Evelyn’s monogram."},{"id":"ev2","title":"Purple Ink on Ash in Fireplace","detail":"Confirms the burnt paper was Silas’s signed will page."},{"id":"ev3","title":"Black Lace Handkerchief","detail":"Dropped by Evelyn while she threw the page into the grate."},{"id":"ev4","title":"Lawyer’s Carbon Copy","detail":"Proves the true intent of Silas to fund the children’s hospital."}]'::jsonb,
  '[{"order":1,"title":"Mutilated Will","text":"Parchment document missing its final signature page."},{"order":2,"title":"Embroidery Scissors","text":"Gold sewing scissors used to snip the page from the binding."},{"order":3,"title":"Purple Ink","text":"Signature ink traces found on desk blotter and fireplace ash."},{"order":4,"title":"Paper Ash","text":"Fragile burnt remains of the will in the study fireplace."},{"order":5,"title":"Black Lace Handkerchief","text":"Silk handkerchief dropped by the hearth with initial E."},{"order":6,"title":"Carbon Copy","text":"Lawyer’s spare copy proving the true contents of the will."}]'::jsonb,
  'Butler Jarvis had silver polish on his hands.: He was polishing candelabras in the pantry all night.; Dr. Ross owed money to Silas.: It was a small house mortgage paid off years ago.',
  'Blame the butler Jarvis or claim the family lawyer brought a forged copy.',
  'NORMAL',
  'Who ripped the signature page from Old Silas’s will before the lawyer arrived?',
  '[{"character":"Evelyn Sterling","secret":"She was heavily indebted to high-stakes jewelry designers."},{"character":"Jarvis Finch","secret":"He was promised five thousand dollars in the old will."},{"character":"Horace Vance","secret":"He had not yet filed the official probate copy with the courthouse."},{"character":"Dr. Alistair Ross","secret":"He warned Silas that stress from arguments would be fatal."}]'::jsonb,
  '[{"lead":"Butler Jarvis had silver polish on his hands.","explanation":"He was polishing candelabras in the pantry all night."},{"lead":"Dr. Ross owed money to Silas.","explanation":"It was a small house mortgage paid off years ago."}]'::jsonb,
  '{"wrongTheories":["Butler Jarvis burned the will to protect his small inheritance.","Lawyer Horace lost the signature page on his drive through the storm."],"correctTheory":"Evelyn Sterling cut the signature page from her father’s will with embroidery scissors and burned it in the fireplace to prevent his estate from going to charity."}'::jsonb,
  'Evelyn Sterling burned the signature page to steal the family fortune!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The lawyer’s carbon copy and the gold scissors trapped Evelyn. The estate was handed over to the children’s hospital as Silas intended."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Butler Jarvis was blamed for the missing page. Evelyn inherited the estate under intestacy rules and squandered the fortune."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The court ruled Silas died before signing the document. The family fought in court for twenty years while the money vanished in fees."}]'::jsonb,
  '{"intros":["Tycoon Silas Sterling died in his leather armchair; his last will and testament was missing its signature page.","Case file story_011: Tycoon Silas Sterling died in his leather armchair; his last will and testament was missing its signature page. Look closely at every clue.","Trouble begins in Blackwood Hollow Manor, dark mahogany library and crackling fireplace. Tycoon Silas Sterling died in his leather armchair; his last will and testament was missing its signature page.","The mystery starts now. Tycoon Silas Sterling died in his leather armchair; his last will and testament was missing its signature page. Can you solve it?"],"reveals":["Evelyn Sterling burned the signature page to steal the family fortune!","The mystery is unraveled! Evelyn Sterling burned the signature page to steal the family fortune!","At last, the truth comes out: Evelyn Sterling burned the signature page to steal the family fortune!","Case resolved! Here is what happened: Evelyn Sterling burned the signature page to steal the family fortune!"],"hints":["Pay attention to where Evelyn Sterling was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_011';
DELETE FROM public.case_events WHERE case_id = 'story_011';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c3b11061-4825-52ed-b52c-dc0f20e4ad70',
  'story_011',
  'Evelyn Sterling',
  'Socialite Daughter',
  'Spoiled, desperate, dressed in black mourning lace',
  'Father was frail. I sat by his bedside reading until he fell asleep.',
  'She was heavily indebted to high-stakes jewelry designers.',
  'Sitting in the second-floor sitting room',
  'Eldest daughter facing disinheritance',
  'Saw the revised will lying open on the mahogany desk.',
  'Did not realize her gold embroidery scissors left brass flakes on the desk.',
  '🪡',
  '["Father was frail. I sat by his bedside reading until he fell asleep.","\"Father was frail. I sat by his bedside reading until he fell asleep.\"","Listen to me: Father was frail. I sat by his bedside reading until he fell asleep.","I tell you the truth: Father was frail. I sat by his bedside reading until he fell asleep."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9b6504be-72d7-58ca-b5a9-80630842b110',
  'story_011',
  'Jarvis Finch',
  'Head Butler',
  'Stately, formal, unyielding loyalty',
  'I served master Silas his chamomile tea at 9:00 PM as I have for forty years.',
  'He was promised five thousand dollars in the old will.',
  'Polishing silver in the basement pantry',
  'Found Silas slumped in his chair at 11:00 PM',
  'Silas was furious with Evelyn over her gambling debts.',
  'Did not see Evelyn slip into the study with scissors.',
  '🤵',
  '["I served master Silas his chamomile tea at 9:00 PM as I have for forty years.","\"I served master Silas his chamomile tea at 9:00 PM as I have for forty years.\"","Listen to me: I served master Silas his chamomile tea at 9:00 PM as I have for forty years.","I tell you the truth: I served master Silas his chamomile tea at 9:00 PM as I have for forty years."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0b2cf9a9-c0ac-59fa-acfa-6205ba900b12',
  'story_011',
  'Horace Vance',
  'Family Lawyer',
  'Pedantic, nervous, clutching a leather briefcase',
  'I drafted the new will yesterday. Silas signed every page in purple ink.',
  'He had not yet filed the official probate copy with the courthouse.',
  'Driving through the rainstorm from the city',
  'Legal executor of the Sterling estate',
  'The final page transferred eighty percent to the hospital.',
  'Did not expect the family to destroy evidence so quickly.',
  '📜',
  '["I drafted the new will yesterday. Silas signed every page in purple ink.","\"I drafted the new will yesterday. Silas signed every page in purple ink.\"","Listen to me: I drafted the new will yesterday. Silas signed every page in purple ink.","I tell you the truth: I drafted the new will yesterday. Silas signed every page in purple ink."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6277f71a-a63a-5603-9bfd-e5416b535fb7',
  'story_011',
  'Dr. Alistair Ross',
  'Family Physician',
  'Gruff, fatigued, smelling of antiseptic',
  'Silas passed away peacefully from natural heart failure around 9:45 PM.',
  'He warned Silas that stress from arguments would be fatal.',
  'Arrived at 10:30 PM to certify the death certificate',
  'Treated Silas for high blood pressure for decades',
  'Silas was holding his desk pen when he collapsed.',
  'Did not pay attention to the documents on the desk.',
  '🩺',
  '["Silas passed away peacefully from natural heart failure around 9:45 PM.","\"Silas passed away peacefully from natural heart failure around 9:45 PM.\"","Listen to me: Silas passed away peacefully from natural heart failure around 9:45 PM.","I tell you the truth: Silas passed away peacefully from natural heart failure around 9:45 PM."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8ac474d1-9eea-5f68-a08c-63f8e9f6a54b',
  'story_011',
  'ev_1',
  1,
  '10:05 PM',
  'A legal document bound with blue ribbon is torn at the binding.',
  'A legal document bound with blue ribbon is torn at the binding.',
  'Page 5 containing the signature was removed deliberately.',
  'Mutilated Will',
  'Parchment document with page 5 cleanly sliced from the ribbons.',
  '["Diary","Bank Book","Stock Certificate"]'::jsonb,
  'Mutilated Will',
  '["mutilated will","will","document","testament","paper"]'::jsonb,
  'A legal paper declaring who inherits a person’s money after death.',
  'ev_2',
  true,
  '{"descriptions":["A legal document bound with blue ribbon is torn at the binding.","At 10:05 PM: A legal document bound with blue ribbon is torn at the binding.","Notice this clue: A legal document bound with blue ribbon is torn at the binding."],"hints":["A legal paper declaring who inherits a person’s money after death.","Clue hint: Think about mutilated will.","Search for: page 5 containing the signature was removed deliberately."],"clues":["Mutilated Will","Item: Mutilated Will","Clue Word: Mutilated Will"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a74f02b5-9271-536f-beb4-03a71a34c716',
  'story_011',
  'ev_2',
  2,
  '10:10 PM',
  'Small curved gold embroidery scissors are left on the writing blotter.',
  'Small curved gold embroidery scissors are left on the writing blotter.',
  'The tool used to slice the parchment was delicate embroidery scissors.',
  'Embroidery Scissors',
  'Gold stork-shaped scissors with parchment fibers on the blade.',
  '["Kitchen Knife","Paper Cutter","Razor Blade"]'::jsonb,
  'Embroidery Scissors',
  '["embroidery scissors","scissors","gold scissors"]'::jsonb,
  'Small delicate metal cutting tool used for sewing and needlework.',
  'ev_3',
  false,
  '{"descriptions":["Small curved gold embroidery scissors are left on the writing blotter.","At 10:10 PM: Small curved gold embroidery scissors are left on the writing blotter.","Notice this clue: Small curved gold embroidery scissors are left on the writing blotter."],"hints":["Small delicate metal cutting tool used for sewing and needlework.","Clue hint: Think about embroidery scissors.","Search for: the tool used to slice the parchment was delicate embroidery scissors."],"clues":["Embroidery Scissors","Item: Embroidery Scissors","Clue Word: Embroidery Scissors"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '11ec7c94-84f9-5c03-a831-c8c1b80e5c8b',
  'story_011',
  'ev_3',
  3,
  '10:12 PM',
  'Purple fountain pen ink stains the mahogany desk blotter.',
  'Purple fountain pen ink stains the mahogany desk blotter.',
  'Silas used his signature purple ink to sign the document.',
  'Purple Ink',
  'Ink blot on the green felt blotter from Silas’s signet pen.',
  '["Black Ink","Red Ink","Blue Ink"]'::jsonb,
  'Purple Ink',
  '["purple ink","ink","fountain pen ink"]'::jsonb,
  'Colored liquid used for writing with fountain pens.',
  'ev_4',
  false,
  '{"descriptions":["Purple fountain pen ink stains the mahogany desk blotter.","At 10:12 PM: Purple fountain pen ink stains the mahogany desk blotter.","Notice this clue: Purple fountain pen ink stains the mahogany desk blotter."],"hints":["Colored liquid used for writing with fountain pens.","Clue hint: Think about purple ink.","Search for: silas used his signature purple ink to sign the document."],"clues":["Purple Ink","Item: Purple Ink","Clue Word: Purple Ink"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a2ce7dd4-28c9-56e4-80ba-556bce430a2e',
  'story_011',
  'ev_4',
  4,
  '10:15 PM',
  'Fluffy white paper ashes swirl in the fireplace grate.',
  'Fluffy white paper ashes swirl in the fireplace grate.',
  'The missing signature page was burned in the fireplace.',
  'Paper Ash',
  'Fragile burnt parchment flakes showing purple ink traces.',
  '["Wood Ash","Coal Lump","Burnt Cloth"]'::jsonb,
  'Paper Ash',
  '["paper ash","ash","ashes","burnt paper"]'::jsonb,
  'Grey powdery remains left after paper is destroyed by fire.',
  'ev_5',
  false,
  '{"descriptions":["Fluffy white paper ashes swirl in the fireplace grate.","At 10:15 PM: Fluffy white paper ashes swirl in the fireplace grate.","Notice this clue: Fluffy white paper ashes swirl in the fireplace grate."],"hints":["Grey powdery remains left after paper is destroyed by fire.","Clue hint: Think about paper ash.","Search for: the missing signature page was burned in the fireplace."],"clues":["Paper Ash","Item: Paper Ash","Clue Word: Paper Ash"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '704cfb03-64d4-50e8-8cd7-2b8f781df7c4',
  'story_011',
  'ev_5',
  5,
  '10:20 PM',
  'A black lace mourning handkerchief is dropped by the hearth.',
  'A black lace mourning handkerchief is dropped by the hearth.',
  'Evelyn was standing right beside the fireplace burning the page.',
  'Black Lace Handkerchief',
  'Silk lace handkerchief embroidered with the letter E.',
  '["White Napkin","Wool Glove","Pocket Square"]'::jsonb,
  'Black Lace Handkerchief',
  '["black lace handkerchief","handkerchief","lace handkerchief","black lace"]'::jsonb,
  'A small square of fabric used to wipe tears or face.',
  'ev_6',
  true,
  '{"descriptions":["A black lace mourning handkerchief is dropped by the hearth.","At 10:20 PM: A black lace mourning handkerchief is dropped by the hearth.","Notice this clue: A black lace mourning handkerchief is dropped by the hearth."],"hints":["A small square of fabric used to wipe tears or face.","Clue hint: Think about black lace handkerchief.","Search for: evelyn was standing right beside the fireplace burning the page."],"clues":["Black Lace Handkerchief","Item: Black Lace Handkerchief","Clue Word: Black Lace Handkerchief"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2949df6e-0b75-5374-8b8b-f0d175cc46d0',
  'story_011',
  'ev_6',
  6,
  '10:30 PM',
  'A porcelain tea cup with cold chamomile tea sits on the coaster.',
  'A porcelain tea cup with cold chamomile tea sits on the coaster.',
  'Confirms Jarvis served the master at 9:00 PM as stated.',
  'Chamomile Teacup',
  'Fine bone china teacup with dried yellow floral tea residue.',
  '["Coffee Cup","Whiskey Tumbler","Water Goblet"]'::jsonb,
  'Chamomile Teacup',
  '["chamomile teacup","teacup","tea cup","cup","tea"]'::jsonb,
  'A small porcelain cup with a handle used for drinking hot herbal tea.',
  'ev_7',
  false,
  '{"descriptions":["A porcelain tea cup with cold chamomile tea sits on the coaster.","At 10:30 PM: A porcelain tea cup with cold chamomile tea sits on the coaster.","Notice this clue: A porcelain tea cup with cold chamomile tea sits on the coaster."],"hints":["A small porcelain cup with a handle used for drinking hot herbal tea.","Clue hint: Think about chamomile teacup.","Search for: confirms jarvis served the master at 9:00 pm as stated."],"clues":["Chamomile Teacup","Item: Chamomile Teacup","Clue Word: Chamomile Teacup"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '70f0adb4-2cca-5cb5-8cf2-f37bd73785f1',
  'story_011',
  'ev_7',
  7,
  '11:15 PM',
  'Lawyer Horace opens his briefcase and reveals the carbon copy.',
  'Lawyer Horace opens his briefcase and reveals the carbon copy.',
  'Horace had kept a full signed carbon copy at his office.',
  'Carbon Copy',
  'Thin blue carbon paper duplicating Silas’s signature and will.',
  '["Newspaper","Map","Checkbook"]'::jsonb,
  'Carbon Copy',
  '["carbon copy","copy","duplicate will","duplicate"]'::jsonb,
  'A duplicate paper made using black or blue transfer sheets.',
  'ev_8',
  false,
  '{"descriptions":["Lawyer Horace opens his briefcase and reveals the carbon copy.","At 11:15 PM: Lawyer Horace opens his briefcase and reveals the carbon copy.","Notice this clue: Lawyer Horace opens his briefcase and reveals the carbon copy."],"hints":["A duplicate paper made using black or blue transfer sheets.","Clue hint: Think about carbon copy.","Search for: horace had kept a full signed carbon copy at his office."],"clues":["Carbon Copy","Item: Carbon Copy","Clue Word: Carbon Copy"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '894b1b0b-9cfd-582b-8930-6d5671224dd1',
  'story_011',
  'ev_8',
  8,
  '11:30 PM',
  'Unpaid jewelry bills totaling eighty thousand dollars are found.',
  'Unpaid jewelry bills totaling eighty thousand dollars are found.',
  'Evelyn was under immediate threat of debtor’s prison.',
  'Jewelry Debts',
  'Demands for payment from luxury jewelers on Fifth Avenue.',
  '["Tax Bill","Rent Slip","Grocery Note"]'::jsonb,
  'Jewelry Debts',
  '["jewelry debts","debts","bills","unpaid bills"]'::jsonb,
  'Written notices demanding immediate payment for luxury gems.',
  NULL,
  true,
  '{"descriptions":["Unpaid jewelry bills totaling eighty thousand dollars are found.","At 11:30 PM: Unpaid jewelry bills totaling eighty thousand dollars are found.","Notice this clue: Unpaid jewelry bills totaling eighty thousand dollars are found."],"hints":["Written notices demanding immediate payment for luxury gems.","Clue hint: Think about jewelry debts.","Search for: evelyn was under immediate threat of debtor’s prison."],"clues":["Jewelry Debts","Item: Jewelry Debts","Clue Word: Jewelry Debts"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_012 — THE MIDNIGHT TAXI RIDE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_012',
  'The Midnight Taxi Ride',
  'Noir Mystery',
  'Central Railway Station Curb & Yellow Checker Cab 77, wet midnight',
  'A taxi driver found a leather briefcase filled with hundred-dollar bills and a bloodstained train ticket in the backseat.',
  '[{"name":"Gus Malone","role":"Railway Baggage Clerk","alibi":"Claims he took the night bus straight home","avatar":"🧳"},{"name":"Sal Spinelli","role":"Taxi Driver","alibi":"Driving Yellow Cab 77 on midnight shift","avatar":"🚕"},{"name":"Officer Dan Murphy","role":"Station Transit Guard","alibi":"Guarding Platform 2 baggage office","avatar":"👮"},{"name":"Vera Vance","role":"Station Diner Cashier","alibi":"Working the 24-hour station coffee counter","avatar":"☕"}]'::jsonb,
  'Railway clerk Gus Malone robbed the midnight payroll shipment. Wounded by returning fire, he jumped into Cab 77, panicked when he saw police roadblocks ahead, and fled on foot leaving the money behind.',
  'Gus Malone',
  'Gus robbed the railway payroll express safe and had to ditch the bag when spotted.',
  '[{"time":"11:45 PM","event":"The midnight express delivers the city payroll safe."},{"time":"12:05 AM","event":"Gus cracks the baggage safe; Officer Murphy confronts him."},{"time":"12:07 AM","event":"Shots fired; Murphy wounded in shoulder, Gus grazed in arm."},{"time":"12:12 AM","event":"Gus dives into Cab 77, telling Sal to drive fast."},{"time":"12:18 AM","event":"Seeing police sirens at the intersection, Gus jumps out and flees."}]'::jsonb,
  '[{"id":"ev1","title":"Payroll Cash Briefcase","detail":"Contains fifty thousand dollars stolen from the railway safe."},{"id":"ev2","title":"Bloodstained Train Ticket","detail":"Stamped with Gus Malone’s station clerk employee discount."},{"id":"ev3","title":"Discarded .38 Revolver","detail":"Ballistics match the slug removed from Officer Murphy’s arm."},{"id":"ev4","title":"Uniform Jacket with Bullet Hole","detail":"Found in the alley with Gus Malone’s official badge."}]'::jsonb,
  '[{"order":1,"title":"Cash Briefcase","text":"Leather case filled with fifty thousand dollars in bank notes."},{"order":2,"title":"Train Ticket","text":"Ticket to Chicago stained with the robber’s blood."},{"order":3,"title":"Yellow Taxi","text":"Checker cab used to flee the scene before hitting a roadblock."},{"order":4,"title":"Revolver","text":"Snub-nosed handgun fired during the baggage room confrontation."},{"order":5,"title":"Bloody Bandage","text":"Torn cloth used to wrap a fresh gunshot graze wound."},{"order":6,"title":"Clerk Jacket","text":"Railway uniform jacket with name tag G. Malone."}]'::jsonb,
  'Cab driver Sal hesitated before calling police.: He was tempted by the cash, but did the right thing.; A known pickpocket was arrested on Platform 4.: He was only stealing wallets and knew nothing of the safe.',
  'Blame the taxi driver Sal or claim the money was counterfeit movie prop cash.',
  'NORMAL',
  'Who left the money briefcase in Cab 77 and what crime took place at the station?',
  '[{"character":"Gus Malone","secret":"He has a gunshot graze on his left forearm."},{"character":"Sal Spinelli","secret":"He thought about keeping the briefcase for himself for ten minutes."},{"character":"Officer Dan Murphy","secret":"He fired two shots back into the dark corridor."},{"character":"Vera Vance","secret":"She noticed he had blood soaking through his sleeve."}]'::jsonb,
  '[{"lead":"Cab driver Sal hesitated before calling police.","explanation":"He was tempted by the cash, but did the right thing."},{"lead":"A known pickpocket was arrested on Platform 4.","explanation":"He was only stealing wallets and knew nothing of the safe."}]'::jsonb,
  '{"wrongTheories":["Cab driver Sal robbed the train station and used his own cab to flee.","An organized gang from Chicago arrived by car and blew the vault."],"correctTheory":"Railway clerk Gus Malone robbed the payroll vault, shot the guard, hopped into Cab 77, and panicked when he saw police cruisers, ditching the cash briefcase in the backseat."}'::jsonb,
  'Baggage clerk Gus Malone robbed the safe and abandoned the cash in the taxi!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Police followed the blood trail into the subway tunnel and arrested Gus Malone. Officer Murphy made a full recovery."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Taxi driver Sal was arrested on suspicion of keeping robbery loot. Gus bandaged his arm and escaped on an outbound freight car."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Rumors spread that the money was fake movie cash. The case stalled while Gus quietly recovered the loot from an accomplice."}]'::jsonb,
  '{"intros":["A taxi driver found a leather briefcase filled with hundred-dollar bills and a bloodstained train ticket in the backseat.","Case file story_012: A taxi driver found a leather briefcase filled with hundred-dollar bills and a bloodstained train ticket in the backseat. Look closely at every clue.","Trouble begins in Central Railway Station Curb & Yellow Checker Cab 77, wet midnight. A taxi driver found a leather briefcase filled with hundred-dollar bills and a bloodstained train ticket in the backseat.","The mystery starts now. A taxi driver found a leather briefcase filled with hundred-dollar bills and a bloodstained train ticket in the backseat. Can you solve it?"],"reveals":["Baggage clerk Gus Malone robbed the safe and abandoned the cash in the taxi!","The mystery is unraveled! Baggage clerk Gus Malone robbed the safe and abandoned the cash in the taxi!","At last, the truth comes out: Baggage clerk Gus Malone robbed the safe and abandoned the cash in the taxi!","Case resolved! Here is what happened: Baggage clerk Gus Malone robbed the safe and abandoned the cash in the taxi!"],"hints":["Pay attention to where Gus Malone was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_012';
DELETE FROM public.case_events WHERE case_id = 'story_012';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e00ebd96-ac68-5b37-a41d-953d9cdfe6ba',
  'story_012',
  'Gus Malone',
  'Railway Baggage Clerk',
  'Desperate, trembling, bandaged left arm',
  'I was checking freight crates on Platform 9 until my shift ended.',
  'He has a gunshot graze on his left forearm.',
  'Claims he took the night bus straight home',
  'Had access to the rail express baggage safe codes',
  'The payroll car carried fifty thousand dollars in cash.',
  'Did not realize his blood dripped onto the train ticket.',
  '🧳',
  '["I was checking freight crates on Platform 9 until my shift ended.","\"I was checking freight crates on Platform 9 until my shift ended.\"","Listen to me: I was checking freight crates on Platform 9 until my shift ended.","I tell you the truth: I was checking freight crates on Platform 9 until my shift ended."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4b1779ba-2c51-5d37-b640-617b6b5d15f3',
  'story_012',
  'Sal Spinelli',
  'Taxi Driver',
  'Fast-talking, street-smart, chewing a cigar',
  'A guy in an oilskin jacket jumped in shouting "Drive!" then bolted at the light.',
  'He thought about keeping the briefcase for himself for ten minutes.',
  'Driving Yellow Cab 77 on midnight shift',
  'Driver of the cab where the briefcase was found',
  'The passenger smelled like coal smoke and gun oil.',
  'Did not see which alley the passenger ran into.',
  '🚕',
  '["A guy in an oilskin jacket jumped in shouting \"Drive!\" then bolted at the light.","\"A guy in an oilskin jacket jumped in shouting \"Drive!\" then bolted at the light.\"","Listen to me: A guy in an oilskin jacket jumped in shouting \"Drive!\" then bolted at the light.","I tell you the truth: A guy in an oilskin jacket jumped in shouting \"Drive!\" then bolted at the light."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '38a48d64-fadc-57a2-b8a6-18fb2f6a1bec',
  'story_012',
  'Officer Dan Murphy',
  'Station Transit Guard',
  'Stern, bleeding arm, holding a service revolver',
  'A masked man opened the payroll vault and shot at me when I called out.',
  'He fired two shots back into the dark corridor.',
  'Guarding Platform 2 baggage office',
  'Victim wounded during the payroll robbery',
  'He struck the robber in the left arm as he ran.',
  'Did not see the robber enter the yellow taxi.',
  '👮',
  '["A masked man opened the payroll vault and shot at me when I called out.","\"A masked man opened the payroll vault and shot at me when I called out.\"","Listen to me: A masked man opened the payroll vault and shot at me when I called out.","I tell you the truth: A masked man opened the payroll vault and shot at me when I called out."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c84a8e65-cb20-5e71-afe4-3e92e7c1d0c3',
  'story_012',
  'Vera Vance',
  'Station Diner Cashier',
  'Sharp-eyed, tired, pouring coffee',
  'A man in a dark cap bought a ticket to Chicago with shaking hands.',
  'She noticed he had blood soaking through his sleeve.',
  'Working the 24-hour station coffee counter',
  'Sold coffee to Gus right before the robbery',
  'Saw Gus clutching his left arm under his coat.',
  'Did not know the baggage vault was being robbed.',
  '☕',
  '["A man in a dark cap bought a ticket to Chicago with shaking hands.","\"A man in a dark cap bought a ticket to Chicago with shaking hands.\"","Listen to me: A man in a dark cap bought a ticket to Chicago with shaking hands.","I tell you the truth: A man in a dark cap bought a ticket to Chicago with shaking hands."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ff0706e5-697e-5d80-bf1f-9ae4206d35bf',
  'story_012',
  'ev_1',
  1,
  '12:12 AM',
  'A heavy brown leather briefcase is left on the taxi floor mat.',
  'A heavy brown leather briefcase is left on the taxi floor mat.',
  'The briefcase contains fifty thousand dollars in crisp payroll cash.',
  'Cash Briefcase',
  'Sturdy leather case stuffed with banded federal reserve notes.',
  '["Toolbox","Hatbox","Cardboard Box"]'::jsonb,
  'Cash Briefcase',
  '["cash briefcase","briefcase","money bag","case","bag"]'::jsonb,
  'A leather case used to carry large stacks of banknotes.',
  'ev_2',
  true,
  '{"descriptions":["A heavy brown leather briefcase is left on the taxi floor mat.","At 12:12 AM: A heavy brown leather briefcase is left on the taxi floor mat.","Notice this clue: A heavy brown leather briefcase is left on the taxi floor mat."],"hints":["A leather case used to carry large stacks of banknotes.","Clue hint: Think about cash briefcase.","Search for: the briefcase contains fifty thousand dollars in crisp payroll cash."],"clues":["Cash Briefcase","Item: Cash Briefcase","Clue Word: Cash Briefcase"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4514bde7-4241-566c-b156-d63248b5d577',
  'story_012',
  'ev_2',
  2,
  '12:14 AM',
  'A one-way train ticket to Chicago is smeared with fresh blood.',
  'A one-way train ticket to Chicago is smeared with fresh blood.',
  'The passenger had blood on his hands and intended to flee the state.',
  'Train Ticket',
  'Cardstock ticket stamped "Midwest Express - Depart 12:30 AM".',
  '["Bus Pass","Movie Ticket","Receipt"]'::jsonb,
  'Train Ticket',
  '["train ticket","ticket","rail ticket"]'::jsonb,
  'A small paper ticket used to board a passenger train.',
  'ev_3',
  false,
  '{"descriptions":["A one-way train ticket to Chicago is smeared with fresh blood.","At 12:14 AM: A one-way train ticket to Chicago is smeared with fresh blood.","Notice this clue: A one-way train ticket to Chicago is smeared with fresh blood."],"hints":["A small paper ticket used to board a passenger train.","Clue hint: Think about train ticket.","Search for: the passenger had blood on his hands and intended to flee the state."],"clues":["Train Ticket","Item: Train Ticket","Clue Word: Train Ticket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c4cd4d29-3060-52cf-a570-2736d270036b',
  'story_012',
  'ev_3',
  3,
  '12:15 AM',
  'A Yellow Checker cab with taxi number 77 idles at the curb.',
  'A Yellow Checker cab with taxi number 77 idles at the curb.',
  'The cab was the getaway vehicle used immediately after the theft.',
  'Yellow Taxi',
  'Yellow sedan with lit taxi roof sign and fare meter running.',
  '["Police Cruiser","Black Sedan","Delivery Van"]'::jsonb,
  'Yellow Taxi',
  '["yellow taxi","taxi","cab","yellow cab"]'::jsonb,
  'A yellow commercial car for hire with a roof sign and fare meter.',
  'ev_4',
  false,
  '{"descriptions":["A Yellow Checker cab with taxi number 77 idles at the curb.","At 12:15 AM: A Yellow Checker cab with taxi number 77 idles at the curb.","Notice this clue: A Yellow Checker cab with taxi number 77 idles at the curb."],"hints":["A yellow commercial car for hire with a roof sign and fare meter.","Clue hint: Think about yellow taxi.","Search for: the cab was the getaway vehicle used immediately after the theft."],"clues":["Yellow Taxi","Item: Yellow Taxi","Clue Word: Yellow Taxi"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e5a6514c-e29a-5f53-89d4-2fe539c658c4',
  'story_012',
  'ev_4',
  4,
  '12:16 AM',
  'A snub-nosed .38 revolver smelling of fresh cordite is dropped in the gutter.',
  'A snub-nosed .38 revolver smelling of fresh cordite is dropped in the gutter.',
  'The weapon matches the bullet that wounded Officer Murphy.',
  'Revolver',
  'Steel .38 revolver with one spent cartridge in the cylinder.',
  '["Rifle","Shotgun","Pocket Knife"]'::jsonb,
  'Revolver',
  '["revolver","gun","pistol","handgun"]'::jsonb,
  'A handheld firearm with a revolving cylinder for bullets.',
  'ev_5',
  false,
  '{"descriptions":["A snub-nosed .38 revolver smelling of fresh cordite is dropped in the gutter.","At 12:16 AM: A snub-nosed .38 revolver smelling of fresh cordite is dropped in the gutter.","Notice this clue: A snub-nosed .38 revolver smelling of fresh cordite is dropped in the gutter."],"hints":["A handheld firearm with a revolving cylinder for bullets.","Clue hint: Think about revolver.","Search for: the weapon matches the bullet that wounded officer murphy."],"clues":["Revolver","Item: Revolver","Clue Word: Revolver"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '23374da6-ac13-56c5-b61e-e83781c16fd7',
  'story_012',
  'ev_5',
  5,
  '12:18 AM',
  'A bloody handkerchief pressed against a bullet graze is tossed aside.',
  'A bloody handkerchief pressed against a bullet graze is tossed aside.',
  'The robber was bleeding heavily from his left forearm.',
  'Bloody Bandage',
  'Torn white cotton cloth soaked in fresh Type O blood.',
  '["Clean Towel","Silk Scarf","Paper Napkin"]'::jsonb,
  'Bloody Bandage',
  '["bloody bandage","bandage","cloth","handkerchief"]'::jsonb,
  'A piece of cloth wrapped around a wound to stop bleeding.',
  'ev_6',
  true,
  '{"descriptions":["A bloody handkerchief pressed against a bullet graze is tossed aside.","At 12:18 AM: A bloody handkerchief pressed against a bullet graze is tossed aside.","Notice this clue: A bloody handkerchief pressed against a bullet graze is tossed aside."],"hints":["A piece of cloth wrapped around a wound to stop bleeding.","Clue hint: Think about bloody bandage.","Search for: the robber was bleeding heavily from his left forearm."],"clues":["Bloody Bandage","Item: Bloody Bandage","Clue Word: Bloody Bandage"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '75a1c705-4ea1-55b1-a55e-a3f9c3ba95cf',
  'story_012',
  'ev_6',
  6,
  '12:20 AM',
  'The steel door of the station baggage vault stands swung wide open.',
  'The steel door of the station baggage vault stands swung wide open.',
  'The vault was opened using employee combinations, not explosives.',
  'Baggage Vault',
  'Heavy steel wall safe with dial spun to combination numbers.',
  '["Wooden Cabinet","Locker","Desk Drawer"]'::jsonb,
  'Baggage Vault',
  '["baggage vault","vault","safe","wall safe"]'::jsonb,
  'A heavily fortified steel room or box used to store money.',
  'ev_7',
  false,
  '{"descriptions":["The steel door of the station baggage vault stands swung wide open.","At 12:20 AM: The steel door of the station baggage vault stands swung wide open.","Notice this clue: The steel door of the station baggage vault stands swung wide open."],"hints":["A heavily fortified steel room or box used to store money.","Clue hint: Think about baggage vault.","Search for: the vault was opened using employee combinations, not explosives."],"clues":["Baggage Vault","Item: Baggage Vault","Clue Word: Baggage Vault"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6fe8b6f7-1b8f-517a-a61e-7487f3822ba2',
  'story_012',
  'ev_7',
  7,
  '12:35 AM',
  'A railway clerk uniform jacket is found stuffed inside an alley trash bin.',
  'A railway clerk uniform jacket is found stuffed inside an alley trash bin.',
  'The jacket has a name tag reading "G. Malone".',
  'Clerk Jacket',
  'Navy blue wool jacket with railway brass buttons and bullet tear.',
  '["Trenchcoat","Leather Jacket","Overcoat"]'::jsonb,
  'Clerk Jacket',
  '["clerk jacket","jacket","uniform","coat"]'::jsonb,
  'An official wool uniform coat worn by station baggage clerks.',
  'ev_8',
  false,
  '{"descriptions":["A railway clerk uniform jacket is found stuffed inside an alley trash bin.","At 12:35 AM: A railway clerk uniform jacket is found stuffed inside an alley trash bin.","Notice this clue: A railway clerk uniform jacket is found stuffed inside an alley trash bin."],"hints":["An official wool uniform coat worn by station baggage clerks.","Clue hint: Think about clerk jacket.","Search for: the jacket has a name tag reading \"g. malone\"."],"clues":["Clerk Jacket","Item: Clerk Jacket","Clue Word: Clerk Jacket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5f6ee6f9-a716-5ba3-b5de-553269cc2831',
  'story_012',
  'ev_8',
  8,
  '12:50 AM',
  'Fresh blood droplets lead from the curb directly into the subway tunnel.',
  'Fresh blood droplets lead from the curb directly into the subway tunnel.',
  'Gus fled into the subterranean train tunnels to escape the roadblocks.',
  'Blood Trail',
  'Trail of red droplets on the subway platform steps.',
  '["Oil Leak","Paint Trail","Water Drips"]'::jsonb,
  'Blood Trail',
  '["blood trail","blood drops","trail","blood"]'::jsonb,
  'A line of red drops left by an injured person walking.',
  NULL,
  true,
  '{"descriptions":["Fresh blood droplets lead from the curb directly into the subway tunnel.","At 12:50 AM: Fresh blood droplets lead from the curb directly into the subway tunnel.","Notice this clue: Fresh blood droplets lead from the curb directly into the subway tunnel."],"hints":["A line of red drops left by an injured person walking.","Clue hint: Think about blood trail.","Search for: gus fled into the subterranean train tunnels to escape the roadblocks."],"clues":["Blood Trail","Item: Blood Trail","Clue Word: Blood Trail"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_013 — THE GRAND LIBRARY ARCHIVE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_013',
  'The Grand Library Archive',
  'Investigation',
  'The Grand University Library, Rare Books Vault, smelling of old parchment and cedar',
  'A centuries-old nautical map vanished from the temperature-controlled display case.',
  '[{"name":"Professor Arthur Pendelton","role":"Senior Historian","alibi":"Faculty lounge second floor","avatar":"📚"},{"name":"Dr. Helena Vance","role":"Chief Archivist","alibi":"Her home apartment across town","avatar":"🔍"},{"name":"Maya Lin","role":"Graduate Research Student","alibi":"Campus cafeteria with classmates","avatar":"🎓"},{"name":"Detective Ray Cooper","role":"Art Crimes Investigator","alibi":"Arrived at the scene at 9:15 AM","avatar":"🕵️"}]'::jsonb,
  'History Professor Arthur Pendelton used a duplicate brass key to enter the vault after closing. He sliced the map from its velvet backing with a scalpel and slipped it between cardboard sheets in his lecture portfolio.',
  'Professor Arthur Pendelton',
  'Arthur owed large debts to private collectors and agreed to steal the map for fifty thousand dollars.',
  '[{"time":"05:00 PM","event":"Library public doors close; students leave the building."},{"time":"07:30 PM","event":"Professor Pendelton enters the vault using his duplicate key."},{"time":"07:45 PM","event":"The Magellan Map is sliced from its velvet mounting."},{"time":"08:00 PM","event":"Pendelton exits carrying his oversized leather lecture portfolio."},{"time":"08:15 AM","event":"Dr. Vance opens the vault and discovers the empty frame."}]'::jsonb,
  '[{"id":"ev1","title":"Fresh Brass Shavings","detail":"Found in the vault lock, proving an unauthorized duplicate key."},{"id":"ev2","title":"Surgical Scalpel Blade","detail":"Dropped behind the pedestal with fibers from the map velvet."},{"id":"ev3","title":"Green Wax Key Mold","detail":"Discovered in Arthur’s locked desk drawer at the department."},{"id":"ev4","title":"Airport Hotel Locker Slip","detail":"Shows the planned drop point for the stolen Magellan map."}]'::jsonb,
  '[{"order":1,"title":"Brass Shavings","text":"Metal filings indicating a newly duplicated vault key."},{"order":2,"title":"Scalpel Blade","text":"Surgical knife used to cut the ancient map from its mount."},{"order":3,"title":"Nautical Map","text":"Priceless 1520 world map stolen from the temperature vault."},{"order":4,"title":"Leather Portfolio","text":"Large flat case used to carry the stolen map out of the library."},{"order":5,"title":"Wax Mold","text":"Jeweler’s wax block used to duplicate the archivist’s master key."},{"order":6,"title":"Wire Transfer Slip","text":"Financial proof of a fifty-thousand-dollar foreign payoff."}]'::jsonb,
  'Student Maya took flash photographs of the vault earlier.: She was gathering images for her dissertation on binding.; Dr. Vance forgot to sign the daily inspection log.: An administrative oversight due to a head cold.',
  'Blame the graduate student Maya or claim a tourist hid in the bathroom overnight.',
  'NORMAL',
  'Who took the Magellan World Map from the locked vault and how did they get inside?',
  '[{"character":"Professor Arthur Pendelton","secret":"He owes fifty thousand dollars on bad stock investments."},{"character":"Dr. Helena Vance","secret":"She forgot to log the vault inspection book yesterday afternoon."},{"character":"Maya Lin","secret":"She was taking unauthorized photos of old manuscripts for her thesis."},{"character":"Detective Ray Cooper","secret":"Investigating Arthur for a stolen manuscript three years ago."}]'::jsonb,
  '[{"lead":"Student Maya took flash photographs of the vault earlier.","explanation":"She was gathering images for her dissertation on binding."},{"lead":"Dr. Vance forgot to sign the daily inspection log.","explanation":"An administrative oversight due to a head cold."}]'::jsonb,
  '{"wrongTheories":["A student sneaked in through the heating vent to steal the map.","Dr. Vance stole the map to cover up an inventory discrepancy."],"correctTheory":"Professor Arthur Pendelton made a wax mold of the vault key, cut the Magellan Map free with a scalpel, and carried it out in his portfolio to sell to a foreign buyer."}'::jsonb,
  'Professor Arthur Pendelton stole the map to pay his secret debts!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Police intercepted Arthur at the airport hotel and recovered the intact Magellan map. Arthur was convicted of grand cultural theft."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Student Maya Lin was blamed because of her photo equipment. Arthur flew to Zurich and delivered the map to a private collector."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The theft was attributed to a fictitious museum cat burglar. Arthur kept the payout while the university mourned its loss."}]'::jsonb,
  '{"intros":["A centuries-old nautical map vanished from the temperature-controlled display case.","Case file story_013: A centuries-old nautical map vanished from the temperature-controlled display case. Look closely at every clue.","Trouble begins in The Grand University Library, Rare Books Vault, smelling of old parchment and cedar. A centuries-old nautical map vanished from the temperature-controlled display case.","The mystery starts now. A centuries-old nautical map vanished from the temperature-controlled display case. Can you solve it?"],"reveals":["Professor Arthur Pendelton stole the map to pay his secret debts!","The mystery is unraveled! Professor Arthur Pendelton stole the map to pay his secret debts!","At last, the truth comes out: Professor Arthur Pendelton stole the map to pay his secret debts!","Case resolved! Here is what happened: Professor Arthur Pendelton stole the map to pay his secret debts!"],"hints":["Pay attention to where Professor Arthur Pendelton was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_013';
DELETE FROM public.case_events WHERE case_id = 'story_013';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ea3856c3-44ea-5a9b-abaa-25fd0f9a9f93',
  'story_013',
  'Professor Arthur Pendelton',
  'Senior Historian',
  'Distinguished, tweed jacket, calm voice concealing panic',
  'I was in the faculty lounge grading essays until 9:00 PM.',
  'He owes fifty thousand dollars on bad stock investments.',
  'Faculty lounge second floor',
  'Had authorized research access to the rare book vault',
  'The display case alarm was disabled for scheduled maintenance.',
  'Did not notice a sliver of 16th-century parchment caught in his sleeve.',
  '📚',
  '["I was in the faculty lounge grading essays until 9:00 PM.","\"I was in the faculty lounge grading essays until 9:00 PM.\"","Listen to me: I was in the faculty lounge grading essays until 9:00 PM.","I tell you the truth: I was in the faculty lounge grading essays until 9:00 PM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1dbf07bd-f7b5-5fc8-b44c-48607f903302',
  'story_013',
  'Dr. Helena Vance',
  'Chief Archivist',
  'Fierce, protective of books, wears reading glasses on a chain',
  'The vault door was bolted from the outside when I arrived at 8:00 AM.',
  'She forgot to log the vault inspection book yesterday afternoon.',
  'Her home apartment across town',
  'Custodian of the rare book collection',
  'Only two keys exist that can open the temperature vault.',
  'Did not know Arthur made wax impressions of the key.',
  '🔍',
  '["The vault door was bolted from the outside when I arrived at 8:00 AM.","\"The vault door was bolted from the outside when I arrived at 8:00 AM.\"","Listen to me: The vault door was bolted from the outside when I arrived at 8:00 AM.","I tell you the truth: The vault door was bolted from the outside when I arrived at 8:00 AM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c020d37d-1415-5a63-afdf-11b4671e98ab',
  'story_013',
  'Maya Lin',
  'Graduate Research Student',
  'Quiet, nervous, constantly taking notes',
  'I returned my study keys to Dr. Vance at 5:00 PM and went to dinner.',
  'She was taking unauthorized photos of old manuscripts for her thesis.',
  'Campus cafeteria with classmates',
  'Arthur’s research assistant who cleaned the vault cases',
  'Saw Professor Pendelton lingering by the vault door after closing.',
  'Did not know the map had been sold to a foreign collector.',
  '🎓',
  '["I returned my study keys to Dr. Vance at 5:00 PM and went to dinner.","\"I returned my study keys to Dr. Vance at 5:00 PM and went to dinner.\"","Listen to me: I returned my study keys to Dr. Vance at 5:00 PM and went to dinner.","I tell you the truth: I returned my study keys to Dr. Vance at 5:00 PM and went to dinner."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b3c92f0c-e21c-5085-931a-7cc82c819c92',
  'story_013',
  'Detective Ray Cooper',
  'Art Crimes Investigator',
  'Meticulous, observant, checks every fingerprint',
  'This was not a smash-and-grab. The thief used surgical tools and a key.',
  'Investigating Arthur for a stolen manuscript three years ago.',
  'Arrived at the scene at 9:15 AM',
  'Assigned to investigate high-value cultural thefts',
  'Found microscopic brass shavings inside the vault keyhole.',
  'Did not know Arthur’s buyer was waiting at the airport hotel.',
  '🕵️',
  '["This was not a smash-and-grab. The thief used surgical tools and a key.","\"This was not a smash-and-grab. The thief used surgical tools and a key.\"","Listen to me: This was not a smash-and-grab. The thief used surgical tools and a key.","I tell you the truth: This was not a smash-and-grab. The thief used surgical tools and a key."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c976cfa7-ccc6-5ba7-a0ec-c4c8f3ab4053',
  'story_013',
  'ev_1',
  1,
  '07:30 PM',
  'Microscopic brass filings are found inside the high-security keyway.',
  'Microscopic brass filings are found inside the high-security keyway.',
  'A freshly cut duplicate key was used to unlock the vault door.',
  'Brass Shavings',
  'Fine metallic dust collected with a magnetic forensic swab.',
  '["Iron Dust","Sawdust","Chalk Powder"]'::jsonb,
  'Brass Shavings',
  '["brass shavings","shavings","metal filings","dust"]'::jsonb,
  'Tiny metallic powder left behind when a newly cut key is turned.',
  'ev_2',
  true,
  '{"descriptions":["Microscopic brass filings are found inside the high-security keyway.","At 07:30 PM: Microscopic brass filings are found inside the high-security keyway.","Notice this clue: Microscopic brass filings are found inside the high-security keyway."],"hints":["Tiny metallic powder left behind when a newly cut key is turned.","Clue hint: Think about brass shavings.","Search for: a freshly cut duplicate key was used to unlock the vault door."],"clues":["Brass Shavings","Item: Brass Shavings","Clue Word: Brass Shavings"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '769d6287-79dc-5dd1-ac03-c92d7e0bb525',
  'story_013',
  'ev_2',
  2,
  '07:42 PM',
  'A surgical scalpel blade is dropped behind the display pedestal.',
  'A surgical scalpel blade is dropped behind the display pedestal.',
  'The thief used a medical blade to slice the ancient paper clean.',
  'Scalpel Blade',
  'Stainless steel number 11 scalpel blade with velvet fibers.',
  '["Scissors","Box Cutter","Razor Blade"]'::jsonb,
  'Scalpel Blade',
  '["scalpel blade","scalpel","blade","knife"]'::jsonb,
  'A tiny, extremely sharp knife used by doctors during surgery.',
  'ev_3',
  false,
  '{"descriptions":["A surgical scalpel blade is dropped behind the display pedestal.","At 07:42 PM: A surgical scalpel blade is dropped behind the display pedestal.","Notice this clue: A surgical scalpel blade is dropped behind the display pedestal."],"hints":["A tiny, extremely sharp knife used by doctors during surgery.","Clue hint: Think about scalpel blade.","Search for: the thief used a medical blade to slice the ancient paper clean."],"clues":["Scalpel Blade","Item: Scalpel Blade","Clue Word: Scalpel Blade"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5aedc5dd-60a9-57fe-ba95-32e949c8c95a',
  'story_013',
  'ev_3',
  3,
  '07:45 PM',
  'The empty walnut frame sits with sliced blue velvet ribbon.',
  'The empty walnut frame sits with sliced blue velvet ribbon.',
  'The 1520 Magellan World Map was the only item taken.',
  'Nautical Map',
  'Gilded walnut display case with cut mounting threads.',
  '["Antique Globe","Golden Compass","Leather Journal"]'::jsonb,
  'Nautical Map',
  '["nautical map","map","ancient map","world map"]'::jsonb,
  'A drawing of oceans and continents used by sailors long ago.',
  'ev_4',
  false,
  '{"descriptions":["The empty walnut frame sits with sliced blue velvet ribbon.","At 07:45 PM: The empty walnut frame sits with sliced blue velvet ribbon.","Notice this clue: The empty walnut frame sits with sliced blue velvet ribbon."],"hints":["A drawing of oceans and continents used by sailors long ago.","Clue hint: Think about nautical map.","Search for: the 1520 magellan world map was the only item taken."],"clues":["Nautical Map","Item: Nautical Map","Clue Word: Nautical Map"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7f544cb9-c628-50e3-869b-1f784809d513',
  'story_013',
  'ev_4',
  4,
  '08:00 PM',
  'An oversized brown leather portfolio is carried past the lobby camera.',
  'An oversized brown leather portfolio is carried past the lobby camera.',
  'The portfolio was large enough to carry the unrolled map flat.',
  'Leather Portfolio',
  'Brown zippered folder with cardboard backing boards inside.',
  '["Briefcase","Backpack","Shopping Bag"]'::jsonb,
  'Leather Portfolio',
  '["leather portfolio","portfolio","folder","case"]'::jsonb,
  'A large flat case used by artists and professors to carry large papers.',
  'ev_5',
  false,
  '{"descriptions":["An oversized brown leather portfolio is carried past the lobby camera.","At 08:00 PM: An oversized brown leather portfolio is carried past the lobby camera.","Notice this clue: An oversized brown leather portfolio is carried past the lobby camera."],"hints":["A large flat case used by artists and professors to carry large papers.","Clue hint: Think about leather portfolio.","Search for: the portfolio was large enough to carry the unrolled map flat."],"clues":["Leather Portfolio","Item: Leather Portfolio","Clue Word: Leather Portfolio"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c8309f58-6433-5a34-8b99-f29269efe597',
  'story_013',
  'ev_5',
  5,
  '08:10 PM',
  'A wax impression block of the vault key is found in Arthur’s desk.',
  'A wax impression block of the vault key is found in Arthur’s desk.',
  'Arthur made a wax mold of the key during his previous visit.',
  'Wax Mold',
  'Green jeweler’s wax block showing teeth of the vault key.',
  '["Clay Slab","Soap Bar","Rubber Stamp"]'::jsonb,
  'Wax Mold',
  '["wax mold","mold","wax","impression"]'::jsonb,
  'A soft block of wax used to make a copy of a metal key.',
  'ev_6',
  true,
  '{"descriptions":["A wax impression block of the vault key is found in Arthur’s desk.","At 08:10 PM: A wax impression block of the vault key is found in Arthur’s desk.","Notice this clue: A wax impression block of the vault key is found in Arthur’s desk."],"hints":["A soft block of wax used to make a copy of a metal key.","Clue hint: Think about wax mold.","Search for: arthur made a wax mold of the key during his previous visit."],"clues":["Wax Mold","Item: Wax Mold","Clue Word: Wax Mold"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ff8ef72c-9ed8-53d7-af92-593a7dc8fab3',
  'story_013',
  'ev_6',
  6,
  '08:30 PM',
  'An email printout shows wire transfer instructions from Zurich.',
  'An email printout shows wire transfer instructions from Zurich.',
  'Arthur had arranged a fifty-thousand-dollar payout for delivery.',
  'Wire Transfer Slip',
  'Printed bank routing instructions tucked in an art magazine.',
  '["Checkbook","Train Ticket","Postcard"]'::jsonb,
  'Wire Transfer Slip',
  '["wire transfer slip","slip","wire transfer","transfer slip","bank slip"]'::jsonb,
  'A paper slip confirming money sent electronically between banks.',
  'ev_7',
  false,
  '{"descriptions":["An email printout shows wire transfer instructions from Zurich.","At 08:30 PM: An email printout shows wire transfer instructions from Zurich.","Notice this clue: An email printout shows wire transfer instructions from Zurich."],"hints":["A paper slip confirming money sent electronically between banks.","Clue hint: Think about wire transfer slip.","Search for: arthur had arranged a fifty-thousand-dollar payout for delivery."],"clues":["Wire Transfer Slip","Item: Wire Transfer Slip","Clue Word: Wire Transfer Slip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6aec3fbf-3bcd-512f-b3ce-f4057add9cb4',
  'story_013',
  'ev_7',
  7,
  '09:00 PM',
  'A tiny triangular scrap of 500-year-old rag parchment is recovered.',
  'A tiny triangular scrap of 500-year-old rag parchment is recovered.',
  'The torn paper corner matches the frayed edge on Arthur’s coat.',
  'Parchment Fragment',
  'Yellowed 16th-century rag paper fiber tested by the lab.',
  '["Cotton Thread","Wood Splinter","Glass Chip"]'::jsonb,
  'Parchment Fragment',
  '["parchment fragment","parchment","paper scrap","fragment"]'::jsonb,
  'A piece of thick, ancient paper made from animal skin or linen.',
  'ev_8',
  false,
  '{"descriptions":["A tiny triangular scrap of 500-year-old rag parchment is recovered.","At 09:00 PM: A tiny triangular scrap of 500-year-old rag parchment is recovered.","Notice this clue: A tiny triangular scrap of 500-year-old rag parchment is recovered."],"hints":["A piece of thick, ancient paper made from animal skin or linen.","Clue hint: Think about parchment fragment.","Search for: the torn paper corner matches the frayed edge on arthur’s coat."],"clues":["Parchment Fragment","Item: Parchment Fragment","Clue Word: Parchment Fragment"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '18170d7d-7db0-50be-933f-5bd0ddbe3d55',
  'story_013',
  'ev_8',
  8,
  '09:30 PM',
  'Airport hotel baggage claim receipt is found in Arthur’s coat.',
  'Airport hotel baggage claim receipt is found in Arthur’s coat.',
  'Arthur booked a locker at the airport terminal to hand over the map.',
  'Hotel Receipt',
  'Receipt from the Skyway Airport Inn room 104.',
  '["Dinner Receipt","Parking Ticket","Subway Token"]'::jsonb,
  'Hotel Receipt',
  '["hotel receipt","receipt","paper ticket"]'::jsonb,
  'A printed slip proving payment for a hotel room.',
  NULL,
  true,
  '{"descriptions":["Airport hotel baggage claim receipt is found in Arthur’s coat.","At 09:30 PM: Airport hotel baggage claim receipt is found in Arthur’s coat.","Notice this clue: Airport hotel baggage claim receipt is found in Arthur’s coat."],"hints":["A printed slip proving payment for a hotel room.","Clue hint: Think about hotel receipt.","Search for: arthur booked a locker at the airport terminal to hand over the map."],"clues":["Hotel Receipt","Item: Hotel Receipt","Clue Word: Hotel Receipt"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_014 — HIGHRISE BOARDROOM FALL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_014',
  'Highrise Boardroom Fall',
  'Investigation',
  'Meridian Tower, 40th Floor Executive Suite, floor-to-ceiling glass during a storm',
  'CEO Donald Vance fell from the 40th-floor terrace during a blackout thunderstorm.',
  '[{"name":"Victor Stone","role":"Chief Financial Officer","alibi":"In the boardroom pouring coffee when the blackout hit","avatar":"💼"},{"name":"Claire Dupont","role":"Executive Secretary","alibi":"Reception foyer outside the boardroom doors","avatar":"📱"},{"name":"Marcus Bell","role":"Building Security Director","alibi":"Ground floor security control desk","avatar":"🛡️"},{"name":"Detective Sarah Cross","role":"Lead Homicide Investigator","alibi":"Dispatched to the scene at 10:15 PM","avatar":"🔍"}]'::jsonb,
  'During the thunderstorm blackout, CFO Victor Stone lured CEO Donald Vance onto the wet observation balcony under the pretext of checking the lightning rod. He shoved Donald over the low rail and claimed he slipped on wet tiles.',
  'CFO Victor Stone',
  'Donald was about to announce an audit that would expose Victor’s embezzlement of millions.',
  '[{"time":"09:30 PM","event":"Donald Vance calls an emergency meeting regarding the audit."},{"time":"10:00 PM","event":"Lightning strikes the substation; tower power cuts out."},{"time":"10:04 PM","event":"Victor lures Donald onto the terrace to discuss the audit."},{"time":"10:07 PM","event":"Thunder crashes; Donald is shoved over the railing."},{"time":"10:15 PM","event":"Building security finds Donald’s body on the fourth-floor terrace below."}]'::jsonb,
  '[{"id":"ev1","title":"Tile Scuff Marks","detail":"Shows backward force consistent with a violent shove, not a slip."},{"id":"ev2","title":"Suit Wool Fibers Under Nails","detail":"Fibers from Donald’s hands match Victor’s torn pinstripe jacket."},{"id":"ev3","title":"Electronic Keycard Log","detail":"Records Victor accessing the terrace door at 10:04 PM during the blackout."},{"id":"ev4","title":"Audit USB Drive","detail":"Contains documents proving Victor’s four-million-dollar embezzlement."}]'::jsonb,
  '[{"order":1,"title":"Scuff Marks","text":"Skid marks on the terrace floor proving a violent shove."},{"order":2,"title":"Gold Watch Band","text":"Snapped watch band left clinging to the high railing."},{"order":3,"title":"Pinstripe Fibers","text":"Clothing threads matching Victor Stone’s jacket under victim’s nails."},{"order":4,"title":"Thumb Drive","text":"Encrypted drive exposing four million dollars in stolen corporate funds."},{"order":5,"title":"Terrace Keycard","text":"Access log proving Victor stepped onto the balcony during the blackout."},{"order":6,"title":"Torn Pocket","text":"Damage on Victor’s jacket from the struggle at the edge."}]'::jsonb,
  'Secretary Claire was crying and holding Donald’s files.: She was in shock and worried her press leaks would be blamed.; The terrace tiles were wet from the thunderstorm.: While slippery, the 48-inch rail prevented accidental falls.',
  'Claim Donald slipped on the wet terrace floor or blame his personal secretary.',
  'NORMAL',
  'Did Donald Vance jump, or was he pushed over the wet terrace railing?',
  '[{"character":"Victor Stone","secret":"Embezzled four million dollars into offshore dummy companies."},{"character":"Claire Dupont","secret":"She secretly leaked company financial memos to the press."},{"character":"Marcus Bell","secret":"Failed to replace the backup battery on the terrace camera."},{"character":"Detective Sarah Cross","secret":"Knew the victim from a previous white-collar fraud probe."}]'::jsonb,
  '[{"lead":"Secretary Claire was crying and holding Donald’s files.","explanation":"She was in shock and worried her press leaks would be blamed."},{"lead":"The terrace tiles were wet from the thunderstorm.","explanation":"While slippery, the 48-inch rail prevented accidental falls."}]'::jsonb,
  '{"wrongTheories":["Donald Vance had vertigo and accidentally slipped over the low railing.","A disgruntled investor snuck into the executive suite and committed the crime."],"correctTheory":"CFO Victor Stone lured Donald onto the wet terrace during the blackout and pushed him over the railing to prevent his multimillion-dollar embezzlement from being audited."}'::jsonb,
  'CFO Victor Stone pushed Donald Vance to stop the financial audit!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The forensic fiber analysis and keycard records shattered Victor’s alibi. Victor Stone was arrested and charged with first-degree murder."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The coroner ruled the death an accidental slip due to severe weather. Victor assumed the CEO position and erased the audit files."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Rumors of financial suicide circulated in the press. Victor liquidated the company and retired to a private yacht in the Caribbean."}]'::jsonb,
  '{"intros":["CEO Donald Vance fell from the 40th-floor terrace during a blackout thunderstorm.","Case file story_014: CEO Donald Vance fell from the 40th-floor terrace during a blackout thunderstorm. Look closely at every clue.","Trouble begins in Meridian Tower, 40th Floor Executive Suite, floor-to-ceiling glass during a storm. CEO Donald Vance fell from the 40th-floor terrace during a blackout thunderstorm.","The mystery starts now. CEO Donald Vance fell from the 40th-floor terrace during a blackout thunderstorm. Can you solve it?"],"reveals":["CFO Victor Stone pushed Donald Vance to stop the financial audit!","The mystery is unraveled! CFO Victor Stone pushed Donald Vance to stop the financial audit!","At last, the truth comes out: CFO Victor Stone pushed Donald Vance to stop the financial audit!","Case resolved! Here is what happened: CFO Victor Stone pushed Donald Vance to stop the financial audit!"],"hints":["Pay attention to where CFO Victor Stone was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_014';
DELETE FROM public.case_events WHERE case_id = 'story_014';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8388b59d-9b97-5d34-8584-0946f000c85e',
  'story_014',
  'Victor Stone',
  'Chief Financial Officer',
  'Cold, polished, calculating, wearing a bespoke pinstripe suit',
  'Donald went onto the balcony to check the storm and must have lost his footing on the wet marble.',
  'Embezzled four million dollars into offshore dummy companies.',
  'In the boardroom pouring coffee when the blackout hit',
  'Second-in-command of Meridian Financial Holdings',
  'The terrace surveillance camera had a dead backup battery.',
  'Did not notice Donald’s torn gold watch strap caught in his jacket pocket.',
  '💼',
  '["Donald went onto the balcony to check the storm and must have lost his footing on the wet marble.","\"Donald went onto the balcony to check the storm and must have lost his footing on the wet marble.\"","Listen to me: Donald went onto the balcony to check the storm and must have lost his footing on the wet marble.","I tell you the truth: Donald went onto the balcony to check the storm and must have lost his footing on the wet marble."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '28b8779b-78ca-5886-96c7-10424c72d9af',
  'story_014',
  'Claire Dupont',
  'Executive Secretary',
  'Efficient, nervous, holding an encrypted tablet',
  'Mr. Vance called an emergency meeting to sign the independent audit papers.',
  'She secretly leaked company financial memos to the press.',
  'Reception foyer outside the boardroom doors',
  'Donald’s trusted personal assistant for twelve years',
  'Donald argued fiercely with Victor over bank accounts thirty minutes earlier.',
  'Did not see what happened out on the dark terrace.',
  '📱',
  '["Mr. Vance called an emergency meeting to sign the independent audit papers.","\"Mr. Vance called an emergency meeting to sign the independent audit papers.\"","Listen to me: Mr. Vance called an emergency meeting to sign the independent audit papers.","I tell you the truth: Mr. Vance called an emergency meeting to sign the independent audit papers."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3c6d26bf-6eaa-5a13-9424-a046af70f4fe',
  'story_014',
  'Marcus Bell',
  'Building Security Director',
  'Former detective, sharp, suspicious of corporate brass',
  'The terrace railing is four feet high. Nobody simply falls over accidentally.',
  'Failed to replace the backup battery on the terrace camera.',
  'Ground floor security control desk',
  'In charge of electronic access logs and tower safety',
  'Only two keycards accessed the 40th floor during the blackout.',
  'Did not know Victor had a duplicate terrace key.',
  '🛡️',
  '["The terrace railing is four feet high. Nobody simply falls over accidentally.","\"The terrace railing is four feet high. Nobody simply falls over accidentally.\"","Listen to me: The terrace railing is four feet high. Nobody simply falls over accidentally.","I tell you the truth: The terrace railing is four feet high. Nobody simply falls over accidentally."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd9e9749c-2145-526f-b7b0-41999e24f4c8',
  'story_014',
  'Detective Sarah Cross',
  'Lead Homicide Investigator',
  'Direct, skeptical, never accepts easy accidents',
  'Torn clothing fibers on the railing tell a very different story than slipping.',
  'Knew the victim from a previous white-collar fraud probe.',
  'Dispatched to the scene at 10:15 PM',
  'Leading the suspicious death investigation',
  'Found fresh scuff marks indicating a violent push on the wet tiles.',
  'Did not have immediate access to the encrypted financial server.',
  '🔍',
  '["Torn clothing fibers on the railing tell a very different story than slipping.","\"Torn clothing fibers on the railing tell a very different story than slipping.\"","Listen to me: Torn clothing fibers on the railing tell a very different story than slipping.","I tell you the truth: Torn clothing fibers on the railing tell a very different story than slipping."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cb7cf8b6-c289-57d5-a37f-de18ce9e2721',
  'story_014',
  'ev_1',
  1,
  '10:05 PM',
  'Wet rubber shoe scuffs show heels skidding backward toward the edge.',
  'Wet rubber shoe scuffs show heels skidding backward toward the edge.',
  'Donald was pushed backward with force, not sliding forward accidentally.',
  'Scuff Marks',
  'Deep rubber skid marks on the wet green marble tiles.',
  '["Water Puddle","Mud Tracks","Oil Slick"]'::jsonb,
  'Scuff Marks',
  '["scuff marks","skid marks","marks","shoe marks"]'::jsonb,
  'Friction marks left on a floor when rubber soles are pushed violently.',
  'ev_2',
  true,
  '{"descriptions":["Wet rubber shoe scuffs show heels skidding backward toward the edge.","At 10:05 PM: Wet rubber shoe scuffs show heels skidding backward toward the edge.","Notice this clue: Wet rubber shoe scuffs show heels skidding backward toward the edge."],"hints":["Friction marks left on a floor when rubber soles are pushed violently.","Clue hint: Think about scuff marks.","Search for: donald was pushed backward with force, not sliding forward accidentally."],"clues":["Scuff Marks","Item: Scuff Marks","Clue Word: Scuff Marks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '60d362a3-531d-5a32-ba5c-daf361237a41',
  'story_014',
  'ev_2',
  2,
  '10:07 PM',
  'A torn gold watch band with a snapped clasp is hooked on the railing.',
  'A torn gold watch band with a snapped clasp is hooked on the railing.',
  'Donald grabbed the railing desperately as he was pushed over.',
  'Gold Watch Band',
  '18-carat gold link band with a torn spring pin.',
  '["Ring","Cufflink","Tie Clip"]'::jsonb,
  'Gold Watch Band',
  '["gold watch band","watch band","watch","gold band","strap"]'::jsonb,
  'A metallic strap that holds a timepiece onto a wrist.',
  'ev_3',
  false,
  '{"descriptions":["A torn gold watch band with a snapped clasp is hooked on the railing.","At 10:07 PM: A torn gold watch band with a snapped clasp is hooked on the railing.","Notice this clue: A torn gold watch band with a snapped clasp is hooked on the railing."],"hints":["A metallic strap that holds a timepiece onto a wrist.","Clue hint: Think about gold watch band.","Search for: donald grabbed the railing desperately as he was pushed over."],"clues":["Gold Watch Band","Item: Gold Watch Band","Clue Word: Gold Watch Band"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '46b07d05-6cbb-5dfc-9814-a80816fbd784',
  'story_014',
  'ev_3',
  3,
  '10:08 PM',
  'Dark pinstripe wool fibers are found caught under Donald’s fingernails.',
  'Dark pinstripe wool fibers are found caught under Donald’s fingernails.',
  'Donald scratched his attacker’s suit jacket during the struggle.',
  'Pinstripe Fibers',
  'Fine charcoal wool fibers matching Victor Stone’s jacket.',
  '["Silk Threads","Cotton Fluff","Nylon Strings"]'::jsonb,
  'Pinstripe Fibers',
  '["pinstripe fibers","fibers","suit fibers","wool fibers"]'::jsonb,
  'Tiny hair-like threads from clothing cloth.',
  'ev_4',
  false,
  '{"descriptions":["Dark pinstripe wool fibers are found caught under Donald’s fingernails.","At 10:08 PM: Dark pinstripe wool fibers are found caught under Donald’s fingernails.","Notice this clue: Dark pinstripe wool fibers are found caught under Donald’s fingernails."],"hints":["Tiny hair-like threads from clothing cloth.","Clue hint: Think about pinstripe fibers.","Search for: donald scratched his attacker’s suit jacket during the struggle."],"clues":["Pinstripe Fibers","Item: Pinstripe Fibers","Clue Word: Pinstripe Fibers"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a309faf2-8e16-507b-85c0-b195b45984c4',
  'story_014',
  'ev_4',
  4,
  '10:10 PM',
  'An encrypted thumb drive containing the audit files is in Donald’s pocket.',
  'An encrypted thumb drive containing the audit files is in Donald’s pocket.',
  'The drive had concrete proof of four million dollars stolen by Victor.',
  'Thumb Drive',
  'Encrypted titanium flash drive with audit records.',
  '["Car Key","Wallet","Lighter"]'::jsonb,
  'Thumb Drive',
  '["thumb drive","usb","flash drive","drive"]'::jsonb,
  'A small portable memory stick you plug into a computer.',
  'ev_5',
  false,
  '{"descriptions":["An encrypted thumb drive containing the audit files is in Donald’s pocket.","At 10:10 PM: An encrypted thumb drive containing the audit files is in Donald’s pocket.","Notice this clue: An encrypted thumb drive containing the audit files is in Donald’s pocket."],"hints":["A small portable memory stick you plug into a computer.","Clue hint: Think about thumb drive.","Search for: the drive had concrete proof of four million dollars stolen by victor."],"clues":["Thumb Drive","Item: Thumb Drive","Clue Word: Thumb Drive"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ddb85ec7-b28d-534a-8f42-5eebfa613f25',
  'story_014',
  'ev_5',
  5,
  '10:12 PM',
  'A glass terrace door keycard was used twice during the blackout.',
  'A glass terrace door keycard was used twice during the blackout.',
  'Victor’s keycard logged entry onto the terrace at 10:04 PM.',
  'Terrace Keycard',
  'Electronic keycard log showing Victor Stone’s badge ID.',
  '["Master Key","Padlock Key","Elevator Code"]'::jsonb,
  'Terrace Keycard',
  '["terrace keycard","keycard","card","badge"]'::jsonb,
  'A plastic magnetic card used to open electronic office doors.',
  'ev_6',
  true,
  '{"descriptions":["A glass terrace door keycard was used twice during the blackout.","At 10:12 PM: A glass terrace door keycard was used twice during the blackout.","Notice this clue: A glass terrace door keycard was used twice during the blackout."],"hints":["A plastic magnetic card used to open electronic office doors.","Clue hint: Think about terrace keycard.","Search for: victor’s keycard logged entry onto the terrace at 10:04 pm."],"clues":["Terrace Keycard","Item: Terrace Keycard","Clue Word: Terrace Keycard"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c1f1f0e1-782e-5092-aae2-372a61cf8f25',
  'story_014',
  'ev_6',
  6,
  '10:20 PM',
  'A ripped jacket pocket with a broken button is found on Victor’s suit.',
  'A ripped jacket pocket with a broken button is found on Victor’s suit.',
  'Victor’s suit jacket was damaged during the physical push.',
  'Torn Pocket',
  'Charcoal pinstripe suit coat with missing horn button.',
  '["Stained Tie","Torn Shirt","Broken Belt"]'::jsonb,
  'Torn Pocket',
  '["torn pocket","pocket","torn jacket","jacket"]'::jsonb,
  'A ripped pouch on clothing where you put your hands or small items.',
  'ev_7',
  false,
  '{"descriptions":["A ripped jacket pocket with a broken button is found on Victor’s suit.","At 10:20 PM: A ripped jacket pocket with a broken button is found on Victor’s suit.","Notice this clue: A ripped jacket pocket with a broken button is found on Victor’s suit."],"hints":["A ripped pouch on clothing where you put your hands or small items.","Clue hint: Think about torn pocket.","Search for: victor’s suit jacket was damaged during the physical push."],"clues":["Torn Pocket","Item: Torn Pocket","Clue Word: Torn Pocket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '81e1f02f-5e10-58bb-8602-9dc1e55cb690',
  'story_014',
  'ev_7',
  7,
  '10:35 PM',
  'The four-foot steel terrace railing is tested for height safety.',
  'The four-foot steel terrace railing is tested for height safety.',
  'The rail is too high for a grown man to stumble over accidentally.',
  'Terrace Railing',
  'Polished stainless steel barrier measuring 48 inches high.',
  '["Glass Wall","Wooden Fence","Low Curb"]'::jsonb,
  'Terrace Railing',
  '["terrace railing","railing","rail","barrier"]'::jsonb,
  'A protective safety fence along the edge of a high balcony.',
  'ev_8',
  false,
  '{"descriptions":["The four-foot steel terrace railing is tested for height safety.","At 10:35 PM: The four-foot steel terrace railing is tested for height safety.","Notice this clue: The four-foot steel terrace railing is tested for height safety."],"hints":["A protective safety fence along the edge of a high balcony.","Clue hint: Think about terrace railing.","Search for: the rail is too high for a grown man to stumble over accidentally."],"clues":["Terrace Railing","Item: Terrace Railing","Clue Word: Terrace Railing"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0543a811-b7f9-5c80-9c71-038afe3ece93',
  'story_014',
  'ev_8',
  8,
  '10:50 PM',
  'A wet umbrella left by the terrace door has Victor’s fingerprints.',
  'A wet umbrella left by the terrace door has Victor’s fingerprints.',
  'Victor stepped out into the rain despite claiming he stayed inside.',
  'Wet Umbrella',
  'Black telescopic umbrella dripping with rainwater.',
  '["Raincoat","Towel","Hat"]'::jsonb,
  'Wet Umbrella',
  '["wet umbrella","umbrella","parasol"]'::jsonb,
  'A handheld canopy used to protect from falling rain.',
  NULL,
  true,
  '{"descriptions":["A wet umbrella left by the terrace door has Victor’s fingerprints.","At 10:50 PM: A wet umbrella left by the terrace door has Victor’s fingerprints.","Notice this clue: A wet umbrella left by the terrace door has Victor’s fingerprints."],"hints":["A handheld canopy used to protect from falling rain.","Clue hint: Think about wet umbrella.","Search for: victor stepped out into the rain despite claiming he stayed inside."],"clues":["Wet Umbrella","Item: Wet Umbrella","Clue Word: Wet Umbrella"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_015 — THE LOCKED GREENHOUSE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_015',
  'The Locked Greenhouse',
  'Investigation',
  'Blackwood Botanical Conservatory, glass dome filled with exotic ferns and orchids',
  'Six specimens of the lethal Ghost Orchid were clipped from the tropical pavilion overnight.',
  '[{"name":"Dr. Gregory Vance","role":"Chief Botanist","alibi":"Department laboratory building A","avatar":"🔬"},{"name":"Tom Bradley","role":"Head Greenhouse Gardener","alibi":"Potting shed at the rear of the gardens","avatar":"🌱"},{"name":"Iris Thorne","role":"University Grant Inspector","alibi":"Campus administration building","avatar":"📋"},{"name":"Inspector Mark Hansen","role":"Agricultural Crimes Detective","alibi":"Arrived at the conservatory at 7:30 AM","avatar":"🔍"}]'::jsonb,
  'Botanist Dr. Gregory Vance altered the temperature sensors to mask his presence. He used brass pruning shears to take six Ghost Orchid buds, aiming to synthesize a lucrative pharmaceutical patent before his university contract expired.',
  'Dr. Gregory Vance',
  'Gregory was developing a patented heart medication derived from the orchid’s rare toxin.',
  '[{"time":"06:00 PM","event":"Tom finishes watering and locks the tropical pavilion."},{"time":"08:30 PM","event":"Gregory logs into the climate terminal and disables thermal alerts."},{"time":"09:15 PM","event":"Six Ghost Orchid flowers are clipped with surgical pruning shears."},{"time":"09:40 PM","event":"The flowers are sealed inside an insulated liquid nitrogen container."},{"time":"07:00 AM","event":"Tom discovers the clipped stalks and calls university security."}]'::jsonb,
  '[{"id":"ev1","title":"Climate Override Log","detail":"Shows Dr. Gregory Vance’s account disabled the temperature alarms."},{"id":"ev2","title":"Pruning Shears with Orchid Sap","detail":"Matches the clean 45-degree angle cuts on the six missing stems."},{"id":"ev3","title":"Fluorescent Sap on Lab Bench","detail":"Blacklight reveals Ghost Orchid resin across Gregory’s workstation."},{"id":"ev4","title":"Apex Pharma Patent Agreement","detail":"Offers three million dollars for synthesized orchid alkaloid."}]'::jsonb,
  '[{"order":1,"title":"Climate Override","text":"Computer log showing sensor thresholds disabled before the theft."},{"order":2,"title":"Cut Orchid Stems","text":"Cleanly severed stems of the six stolen Ghost Orchids."},{"order":3,"title":"Pruning Shears","text":"Botanical cutting tool containing traces of rare sap on the hinge."},{"order":4,"title":"Nitrogen Flask","text":"Insulated container missing from the cryogenic storage shelf."},{"order":5,"title":"Fluorescent Sap","text":"Orchid resin glowing under blacklight on the laboratory table."},{"order":6,"title":"Patent Offer Letter","text":"Contract proving a multi-million-dollar incentive to steal the flowers."}]'::jsonb,
  'Gardener Tom Bradley had plant clippings in his truck.: They were common Boston ferns he grew for home sale.; Grant inspector Iris had a camera in her purse.: She was photographing the facilities for the funding audit.',
  'Blame greenhouse gardener Tom or claim an environmental activist broke in.',
  'NORMAL',
  'Who bypassed the climate alarms and stole the poisonous orchids?',
  '[{"character":"Dr. Gregory Vance","secret":"His research grant was being revoked at the end of the month."},{"character":"Tom Bradley","secret":"He had smuggled common fern cuttings to sell at the local nursery."},{"character":"Iris Thorne","secret":"She was preparing to fire Gregory on Monday morning."},{"character":"Inspector Mark Hansen","secret":"Worked on an illegal rare plant smuggling case two years prior."}]'::jsonb,
  '[{"lead":"Gardener Tom Bradley had plant clippings in his truck.","explanation":"They were common Boston ferns he grew for home sale."},{"lead":"Grant inspector Iris had a camera in her purse.","explanation":"She was photographing the facilities for the funding audit."}]'::jsonb,
  '{"wrongTheories":["Gardener Tom Bradley stole the orchids to sell at the local street flower market.","Environmental activists raided the greenhouse and destroyed the plants in protest."],"correctTheory":"Dr. Gregory Vance overridden the climate alarms, cut six Ghost Orchids with his lab pruning shears, and stored them in a nitrogen flask to secure a three-million-dollar pharmaceutical patent."}'::jsonb,
  'Dr. Gregory Vance stole the orchids for a three-million-dollar drug patent!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Inspectors raided Gregory’s off-campus private lab, recovering the intact orchids in the nitrogen flask. Gregory was stripped of his doctorate and indicted."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Gardener Tom was fired on suspicion of plant theft. Gregory patented the compound under a corporate dummy name and became wealthy."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The loss was chalked up to an environmental activist raid. Gregory claimed insurance research funds and continued his work."}]'::jsonb,
  '{"intros":["Six specimens of the lethal Ghost Orchid were clipped from the tropical pavilion overnight.","Case file story_015: Six specimens of the lethal Ghost Orchid were clipped from the tropical pavilion overnight. Look closely at every clue.","Trouble begins in Blackwood Botanical Conservatory, glass dome filled with exotic ferns and orchids. Six specimens of the lethal Ghost Orchid were clipped from the tropical pavilion overnight.","The mystery starts now. Six specimens of the lethal Ghost Orchid were clipped from the tropical pavilion overnight. Can you solve it?"],"reveals":["Dr. Gregory Vance stole the orchids for a three-million-dollar drug patent!","The mystery is unraveled! Dr. Gregory Vance stole the orchids for a three-million-dollar drug patent!","At last, the truth comes out: Dr. Gregory Vance stole the orchids for a three-million-dollar drug patent!","Case resolved! Here is what happened: Dr. Gregory Vance stole the orchids for a three-million-dollar drug patent!"],"hints":["Pay attention to where Dr. Gregory Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_015';
DELETE FROM public.case_events WHERE case_id = 'story_015';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '17cd3967-57c3-5bd6-9e45-15309b502fc4',
  'story_015',
  'Dr. Gregory Vance',
  'Chief Botanist',
  'Brilliant, impatient, obsessive about pharmaceutical discoveries',
  'I was reviewing specimen slides in the main laboratory until midnight.',
  'His research grant was being revoked at the end of the month.',
  'Department laboratory building A',
  'Lead researcher studying orchid alkaloid chemistry',
  'The Ghost Orchid flowers produce high concentrations of neurotoxin.',
  'Did not notice sticky sap from the cut stems was left on his tweezers.',
  '🔬',
  '["I was reviewing specimen slides in the main laboratory until midnight.","\"I was reviewing specimen slides in the main laboratory until midnight.\"","Listen to me: I was reviewing specimen slides in the main laboratory until midnight.","I tell you the truth: I was reviewing specimen slides in the main laboratory until midnight."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '31ac99f3-6ab2-5510-8136-eef0bce00fd7',
  'story_015',
  'Tom Bradley',
  'Head Greenhouse Gardener',
  'Earthy, gruff, deeply caring about plant health',
  'I watered the orchid bed at 6:00 PM and sealed the hydraulic glass door.',
  'He had smuggled common fern cuttings to sell at the local nursery.',
  'Potting shed at the rear of the gardens',
  'Responsible for daily care of the rare tropical flora',
  'The temperature inside the Ghost Orchid case was lowered by four degrees.',
  'Did not know Gregory had access to the environmental computer.',
  '🌱',
  '["I watered the orchid bed at 6:00 PM and sealed the hydraulic glass door.","\"I watered the orchid bed at 6:00 PM and sealed the hydraulic glass door.\"","Listen to me: I watered the orchid bed at 6:00 PM and sealed the hydraulic glass door.","I tell you the truth: I watered the orchid bed at 6:00 PM and sealed the hydraulic glass door."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'be26778b-90e2-5016-bf08-c9d504d00d67',
  'story_015',
  'Iris Thorne',
  'University Grant Inspector',
  'Sharp, suspicious, carrying financial ledgers',
  'The university was shutting down Gregory’s lab due to lack of results.',
  'She was preparing to fire Gregory on Monday morning.',
  'Campus administration building',
  'Auditing the botanical department’s federal grants',
  'A pharmaceutical giant offered three million dollars for the orchid patent.',
  'Did not expect Gregory to steal the specimens outright.',
  '📋',
  '["The university was shutting down Gregory’s lab due to lack of results.","\"The university was shutting down Gregory’s lab due to lack of results.\"","Listen to me: The university was shutting down Gregory’s lab due to lack of results.","I tell you the truth: The university was shutting down Gregory’s lab due to lack of results."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0d32bd57-06d0-5c26-a369-3e8e60a27092',
  'story_015',
  'Inspector Mark Hansen',
  'Agricultural Crimes Detective',
  'Calm, methodical, carries a magnifying glass and sample vials',
  'The cuts were made with botanical precision. This was an expert job.',
  'Worked on an illegal rare plant smuggling case two years prior.',
  'Arrived at the conservatory at 7:30 AM',
  'Investigating endangered flora theft',
  'Ghost Orchid sap leaves a distinctive fluorescent glow under UV light.',
  'Did not know where Gregory’s private extraction kit was stashed.',
  '🔍',
  '["The cuts were made with botanical precision. This was an expert job.","\"The cuts were made with botanical precision. This was an expert job.\"","Listen to me: The cuts were made with botanical precision. This was an expert job.","I tell you the truth: The cuts were made with botanical precision. This was an expert job."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c746071f-1e7f-5a31-9237-71928c4cb472',
  'story_015',
  'ev_1',
  1,
  '08:30 PM',
  'The climate control terminal logs a thermostat override from admin account VANCE.',
  'The climate control terminal logs a thermostat override from admin account VANCE.',
  'The environmental sensors were adjusted to prevent body-heat alarms.',
  'Climate Override',
  'Digital log showing temperature override at 8:30 PM.',
  '["Power Surge","Fuse Failure","Glass Breach"]'::jsonb,
  'Climate Override',
  '["climate override","override","log","computer log"]'::jsonb,
  'A computer command used to change settings and bypass system rules.',
  'ev_2',
  true,
  '{"descriptions":["The climate control terminal logs a thermostat override from admin account VANCE.","At 08:30 PM: The climate control terminal logs a thermostat override from admin account VANCE.","Notice this clue: The climate control terminal logs a thermostat override from admin account VANCE."],"hints":["A computer command used to change settings and bypass system rules.","Clue hint: Think about climate override.","Search for: the environmental sensors were adjusted to prevent body-heat alarms."],"clues":["Climate Override","Item: Climate Override","Clue Word: Climate Override"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd0949f17-11de-5a83-ab71-2fd814f089f1',
  'story_015',
  'ev_2',
  2,
  '09:15 PM',
  'Six clipped green stalks ooze clear, sticky sap under the misting nozzles.',
  'Six clipped green stalks ooze clear, sticky sap under the misting nozzles.',
  'The rare Ghost Orchids were cleanly harvested at the stem joints.',
  'Cut Orchid Stems',
  'Severed plant stems showing precise 45-degree angle cuts.',
  '["Torn Leaves","Crushed Flowers","Broken Pots"]'::jsonb,
  'Cut Orchid Stems',
  '["cut orchid stems","orchid stems","stems","cut stems","orchid","plants"]'::jsonb,
  'The severed green stalks of rare flowers remaining in the soil.',
  'ev_3',
  false,
  '{"descriptions":["Six clipped green stalks ooze clear, sticky sap under the misting nozzles.","At 09:15 PM: Six clipped green stalks ooze clear, sticky sap under the misting nozzles.","Notice this clue: Six clipped green stalks ooze clear, sticky sap under the misting nozzles."],"hints":["The severed green stalks of rare flowers remaining in the soil.","Clue hint: Think about cut orchid stems.","Search for: the rare ghost orchids were cleanly harvested at the stem joints."],"clues":["Cut Orchid Stems","Item: Cut Orchid Stems","Clue Word: Cut Orchid Stems"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'db476c25-938d-5d6c-922e-b66192198160',
  'story_015',
  'ev_3',
  3,
  '09:18 PM',
  'A pair of curved brass pruning shears is found wiped with ethanol.',
  'A pair of curved brass pruning shears is found wiped with ethanol.',
  'The shears used to cut the plants belonged to Gregory’s lab kit.',
  'Pruning Shears',
  'Brass shears with microscopic plant sap traces on the pivot hinge.',
  '["Kitchen Knife","Pocket Scissors","Wire Cutters"]'::jsonb,
  'Pruning Shears',
  '["pruning shears","shears","pruner","cutters"]'::jsonb,
  'Heavy garden scissors used for trimming and cutting plant branches.',
  'ev_4',
  false,
  '{"descriptions":["A pair of curved brass pruning shears is found wiped with ethanol.","At 09:18 PM: A pair of curved brass pruning shears is found wiped with ethanol.","Notice this clue: A pair of curved brass pruning shears is found wiped with ethanol."],"hints":["Heavy garden scissors used for trimming and cutting plant branches.","Clue hint: Think about pruning shears.","Search for: the shears used to cut the plants belonged to gregory’s lab kit."],"clues":["Pruning Shears","Item: Pruning Shears","Clue Word: Pruning Shears"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b51489ad-95d3-5684-a311-935b6473d9f9',
  'story_015',
  'ev_4',
  4,
  '09:25 PM',
  'A small stainless steel liquid nitrogen flask is missing from Room 2.',
  'A small stainless steel liquid nitrogen flask is missing from Room 2.',
  'The thief needed freezing temperatures to preserve the delicate toxins.',
  'Nitrogen Flask',
  'Vacuum-insulated cryogenic cylinder used to preserve biological samples.',
  '["Thermos","Water Bottle","Gas Can"]'::jsonb,
  'Nitrogen Flask',
  '["nitrogen flask","flask","cryo flask","container"]'::jsonb,
  'A metal insulated bottle used to keep samples freezing cold.',
  'ev_5',
  false,
  '{"descriptions":["A small stainless steel liquid nitrogen flask is missing from Room 2.","At 09:25 PM: A small stainless steel liquid nitrogen flask is missing from Room 2.","Notice this clue: A small stainless steel liquid nitrogen flask is missing from Room 2."],"hints":["A metal insulated bottle used to keep samples freezing cold.","Clue hint: Think about nitrogen flask.","Search for: the thief needed freezing temperatures to preserve the delicate toxins."],"clues":["Nitrogen Flask","Item: Nitrogen Flask","Clue Word: Nitrogen Flask"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b686ca2f-8c2a-56e5-ab24-c463411571a6',
  'story_015',
  'ev_5',
  5,
  '09:35 PM',
  'A patch of fluorescent green sap glows under a blacklight on a lab bench.',
  'A patch of fluorescent green sap glows under a blacklight on a lab bench.',
  'Ghost Orchid sap was spilled on Gregory’s private lab workbench.',
  'Fluorescent Sap',
  'Luminescent chemical stain visible only under ultraviolet light.',
  '["Paint Spot","Coffee Ring","Water Stain"]'::jsonb,
  'Fluorescent Sap',
  '["fluorescent sap","sap","glow sap","plant sap"]'::jsonb,
  'Sticky plant juice that shines bright green under ultraviolet light.',
  'ev_6',
  true,
  '{"descriptions":["A patch of fluorescent green sap glows under a blacklight on a lab bench.","At 09:35 PM: A patch of fluorescent green sap glows under a blacklight on a lab bench.","Notice this clue: A patch of fluorescent green sap glows under a blacklight on a lab bench."],"hints":["Sticky plant juice that shines bright green under ultraviolet light.","Clue hint: Think about fluorescent sap.","Search for: ghost orchid sap was spilled on gregory’s private lab workbench."],"clues":["Fluorescent Sap","Item: Fluorescent Sap","Clue Word: Fluorescent Sap"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7f7f676c-5d20-575c-8651-c435c5bc1fb3',
  'story_015',
  'ev_6',
  6,
  '09:50 PM',
  'A pharmaceutical offer letter promising three million dollars is recovered.',
  'A pharmaceutical offer letter promising three million dollars is recovered.',
  'Gregory had a signed contract contingent on delivering live plant toxin.',
  'Patent Offer Letter',
  'Confidential letter from Apex Pharma offering a patent payout.',
  '["Newspaper","Textbook","Receipt"]'::jsonb,
  'Patent Offer Letter',
  '["patent offer letter","letter","offer letter","patent letter","contract"]'::jsonb,
  'A formal written document offering money for an invention or discovery.',
  'ev_7',
  false,
  '{"descriptions":["A pharmaceutical offer letter promising three million dollars is recovered.","At 09:50 PM: A pharmaceutical offer letter promising three million dollars is recovered.","Notice this clue: A pharmaceutical offer letter promising three million dollars is recovered."],"hints":["A formal written document offering money for an invention or discovery.","Clue hint: Think about patent offer letter.","Search for: gregory had a signed contract contingent on delivering live plant toxin."],"clues":["Patent Offer Letter","Item: Patent Offer Letter","Clue Word: Patent Offer Letter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0c4e8769-e0b5-57bf-a7b2-e949c6038cdb',
  'story_015',
  'ev_7',
  7,
  '10:10 PM',
  'A rubber laboratory glove with a sliced fingertip is tossed in the bin.',
  'A rubber laboratory glove with a sliced fingertip is tossed in the bin.',
  'Gregory nicked his glove while snipping the thorny orchid vines.',
  'Torn Lab Glove',
  'Purple nitrile glove with plant sap inside the torn thumb.',
  '["Work Glove","Cloth Mitten","Sponge"]'::jsonb,
  'Torn Lab Glove',
  '["torn lab glove","glove","lab glove","nitrile glove","rubber glove"]'::jsonb,
  'Thin protective rubber covering worn on hands in scientific labs.',
  'ev_8',
  false,
  '{"descriptions":["A rubber laboratory glove with a sliced fingertip is tossed in the bin.","At 10:10 PM: A rubber laboratory glove with a sliced fingertip is tossed in the bin.","Notice this clue: A rubber laboratory glove with a sliced fingertip is tossed in the bin."],"hints":["Thin protective rubber covering worn on hands in scientific labs.","Clue hint: Think about torn lab glove.","Search for: gregory nicked his glove while snipping the thorny orchid vines."],"clues":["Torn Lab Glove","Item: Torn Lab Glove","Clue Word: Torn Lab Glove"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '14613bcf-ae0a-5311-83ee-7c02a765c760',
  'story_015',
  'ev_8',
  8,
  '10:30 PM',
  'An electronic passcard registered to Gregory was swiped at the side gate.',
  'An electronic passcard registered to Gregory was swiped at the side gate.',
  'Gregory left the greenhouse grounds carrying the insulated cylinder.',
  'Passcard Log',
  'Card reader memory log recording Gregory’s badge at 9:42 PM.',
  '["Keyhole Log","Guard Note","Alarm Bell"]'::jsonb,
  'Passcard Log',
  '["passcard log","passcard","badge log","card log","log"]'::jsonb,
  'A digital record of which employee card opened a security door.',
  NULL,
  true,
  '{"descriptions":["An electronic passcard registered to Gregory was swiped at the side gate.","At 10:30 PM: An electronic passcard registered to Gregory was swiped at the side gate.","Notice this clue: An electronic passcard registered to Gregory was swiped at the side gate."],"hints":["A digital record of which employee card opened a security door.","Clue hint: Think about passcard log.","Search for: gregory left the greenhouse grounds carrying the insulated cylinder."],"clues":["Passcard Log","Item: Passcard Log","Clue Word: Passcard Log"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_016 — THE MISSING SILVER EXPRESS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_016',
  'The Missing Silver Express',
  'Investigation',
  'Blackwood Mountain Terminal & Railway Tunnel 4, freezing snowstorm',
  'Carriage 4 of the Silver Express arrived at the terminal completely empty with all passenger luggage left behind.',
  '[{"name":"Silas Thorne","role":"Train Conductor","alibi":"Conductor’s caboose checking manifest tickets","avatar":"🚂"},{"name":"Marta Kovacs","role":"Lead Missing Passenger","alibi":"Last seen seated in Compartment B","avatar":"🧣"},{"name":"Henry \"Cinders\" Cole","role":"Locomotive Engineer","alibi":"Engine cab shoveling coal with the stoker","avatar":"🔧"},{"name":"Inspector James Sterling","role":"Railway Police Detective","alibi":"Waiting on Platform 1 with six armed officers","avatar":"🔍"}]'::jsonb,
  'Conductor Silas Thorne stopped the train briefly inside the unlit maintenance siding of Tunnel 4. He escorted the four passengers out through an old mining shaft to a waiting truck, leaving their luggage as a puzzle to delay pursuit.',
  'Conductor Silas Thorne',
  'Silas was smuggling four wanted political refugees across the border for a fortune in gold.',
  '[{"time":"10:45 PM","event":"The Silver Express leaves Mountain Base Station into heavy snow."},{"time":"11:15 PM","event":"The train enters Tunnel 4, a two-mile subterranean pass."},{"time":"11:20 PM","event":"Silas trips the emergency air valve, slowing the train to a crawl."},{"time":"11:23 PM","event":"The passengers slip out into the old mine drift with Silas."},{"time":"11:45 PM","event":"The train arrives at the terminal; Carriage 4 is discovered empty."}]'::jsonb,
  '[{"id":"ev1","title":"Emergency Brake Valve Prints","detail":"Conductor Silas Thorne’s fingerprints found on the air brake lever."},{"id":"ev2","title":"Silas’s Engraved Brass Lantern","detail":"Found inside the abandoned mine shaft leading out to Logging Road."},{"id":"ev3","title":"Austrian Gold Bar Pouch","detail":"Discovered hidden behind the coal bin in Silas’s private locker."},{"id":"ev4","title":"Marta’s Snagged Red Scarf","detail":"Proves the passengers were guided through the old mine drift."}]'::jsonb,
  '[{"order":1,"title":"Brake Valve","text":"Air pressure lever pulled to slow the train inside Tunnel 4."},{"order":2,"title":"Vestibule Door","text":"Carriage side door found unlatched and swinging in the cold air."},{"order":3,"title":"Brass Lantern","text":"Conductor Thorne’s personal lamp left in the abandoned mine shaft."},{"order":4,"title":"Coal Dust Tracks","text":"Five sets of footprints leading along the underground mine rails."},{"order":5,"title":"Red Wool Scarf","text":"Passenger Marta Kovacs’s scarf caught on a timber beam."},{"order":6,"title":"Gold Bars","text":"Payment pouch hidden in the conductor’s caboose locker."}]'::jsonb,
  'Engineer Henry was deaf and missed the signal bell.: A physical condition, but he was completely unaware of the escape.; Passengers in Carriage 3 claimed to hear ghostly whispering.: Just wind howling through the broken ventilation shafts of Tunnel 4.',
  'Claim a supernatural ghost train swallowed the passengers or blame the rail engineer.',
  'NORMAL',
  'Where did the four passengers of Carriage 4 go while the train passed through the tunnel?',
  '[{"character":"Silas Thorne","secret":"Received thirty gold bars to guide the refugees through the mountain shaft."},{"character":"Marta Kovacs","secret":"She was carrying documents exposing government corruption."},{"character":"Henry \"Cinders\" Cole","secret":"He ignored the signal brake warning because he was behind schedule."},{"character":"Inspector James Sterling","secret":"He was waiting at the terminal specifically to arrest the passengers."}]'::jsonb,
  '[{"lead":"Engineer Henry was deaf and missed the signal bell.","explanation":"A physical condition, but he was completely unaware of the escape."},{"lead":"Passengers in Carriage 3 claimed to hear ghostly whispering.","explanation":"Just wind howling through the broken ventilation shafts of Tunnel 4."}]'::jsonb,
  '{"wrongTheories":["The passengers jumped from the moving train into the deep snow ravine.","A mythical mountain ghost train opened a rift and absorbed the passengers."],"correctTheory":"Conductor Silas Thorne pulled the emergency brake valve inside Tunnel 4, guided the four passengers through an abandoned mine drift to a waiting truck, and accepted thirty gold bars for his smuggling service."}'::jsonb,
  'Conductor Silas Thorne smuggled the passengers out through the mine for gold!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Inspector Sterling recovered the gold bars from Silas’s locker and traced the tire chains. Silas was arrested for smuggling, while the refugees reached safe exile."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Engineer Henry Cole was blamed for gross negligence and dismissed. Silas retired with his thirty bars of gold."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The newspapers printed tales of the \"Phantom of Tunnel 4.\" Silas became a mountain legend while pocketing his secret riches."}]'::jsonb,
  '{"intros":["Carriage 4 of the Silver Express arrived at the terminal completely empty with all passenger luggage left behind.","Case file story_016: Carriage 4 of the Silver Express arrived at the terminal completely empty with all passenger luggage left behind. Look closely at every clue.","Trouble begins in Blackwood Mountain Terminal & Railway Tunnel 4, freezing snowstorm. Carriage 4 of the Silver Express arrived at the terminal completely empty with all passenger luggage left behind.","The mystery starts now. Carriage 4 of the Silver Express arrived at the terminal completely empty with all passenger luggage left behind. Can you solve it?"],"reveals":["Conductor Silas Thorne smuggled the passengers out through the mine for gold!","The mystery is unraveled! Conductor Silas Thorne smuggled the passengers out through the mine for gold!","At last, the truth comes out: Conductor Silas Thorne smuggled the passengers out through the mine for gold!","Case resolved! Here is what happened: Conductor Silas Thorne smuggled the passengers out through the mine for gold!"],"hints":["Pay attention to where Conductor Silas Thorne was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_016';
DELETE FROM public.case_events WHERE case_id = 'story_016';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b0d05416-caf2-552d-9c9c-2b3f11ccf6c1',
  'story_016',
  'Silas Thorne',
  'Train Conductor',
  'Veteran railman, quiet, watchful, pocket watch always in hand',
  'I punched their tickets before Tunnel 4. When we emerged, the carriage was empty.',
  'Received thirty gold bars to guide the refugees through the mountain shaft.',
  'Conductor’s caboose checking manifest tickets',
  'In charge of passenger safety on Carriage 4',
  'The maintenance tunnel has an unmonitored exit onto Old Logging Road.',
  'Did not realize he dropped his brass conductor lantern in the mining shaft.',
  '🚂',
  '["I punched their tickets before Tunnel 4. When we emerged, the carriage was empty.","\"I punched their tickets before Tunnel 4. When we emerged, the carriage was empty.\"","Listen to me: I punched their tickets before Tunnel 4. When we emerged, the carriage was empty.","I tell you the truth: I punched their tickets before Tunnel 4. When we emerged, the carriage was empty."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd5071d03-4567-5179-9f45-68bd7ecef908',
  'story_016',
  'Marta Kovacs',
  'Lead Missing Passenger',
  'Determined, quiet, political dissident carrying family archives',
  'Missing person; left behind an open book and a warm wool scarf.',
  'She was carrying documents exposing government corruption.',
  'Last seen seated in Compartment B',
  'Leader of the four escaped travelers',
  'Silas had arranged a heated truck on the other side of the ridge.',
  'Did not know rail police had set up a checkpoint at the terminal.',
  '🧣',
  '["Missing person; left behind an open book and a warm wool scarf.","\"Missing person; left behind an open book and a warm wool scarf.\"","Listen to me: Missing person; left behind an open book and a warm wool scarf.","I tell you the truth: Missing person; left behind an open book and a warm wool scarf."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5cc2ce85-9f94-521d-a577-d07a01563257',
  'story_016',
  'Henry "Cinders" Cole',
  'Locomotive Engineer',
  'Grease-stained, deaf in one ear, focused on boiler steam pressure',
  'I felt a drag on the engine for two minutes in Tunnel 4, but pressure held fine.',
  'He ignored the signal brake warning because he was behind schedule.',
  'Engine cab shoveling coal with the stoker',
  'Drove the train through the mountain pass',
  'The emergency brake line lost air pressure briefly at 11:20 PM.',
  'Did not see Silas unlatch the side vestibule door.',
  '🔧',
  '["I felt a drag on the engine for two minutes in Tunnel 4, but pressure held fine.","\"I felt a drag on the engine for two minutes in Tunnel 4, but pressure held fine.\"","Listen to me: I felt a drag on the engine for two minutes in Tunnel 4, but pressure held fine.","I tell you the truth: I felt a drag on the engine for two minutes in Tunnel 4, but pressure held fine."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '56a04d88-d454-5f3b-96db-64b6f122ad1c',
  'story_016',
  'Inspector James Sterling',
  'Railway Police Detective',
  'Sharp, relentless, clad in a heavy winter trenchcoat',
  'Four adults do not vanish into thin air while a train is moving at forty miles an hour.',
  'He was waiting at the terminal specifically to arrest the passengers.',
  'Waiting on Platform 1 with six armed officers',
  'Assigned to intercept the political refugees',
  'Tunnel 4 connects to the abandoned 19th-century Silver Vein mine.',
  'Did not expect the conductor to be an accomplice in the escape.',
  '🔍',
  '["Four adults do not vanish into thin air while a train is moving at forty miles an hour.","\"Four adults do not vanish into thin air while a train is moving at forty miles an hour.\"","Listen to me: Four adults do not vanish into thin air while a train is moving at forty miles an hour.","I tell you the truth: Four adults do not vanish into thin air while a train is moving at forty miles an hour."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0d56282f-5d53-56a3-9da2-65e74a504ad8',
  'story_016',
  'ev_1',
  1,
  '11:20 PM',
  'An emergency brake pressure valve was pulled and manually reset.',
  'An emergency brake pressure valve was pulled and manually reset.',
  'The train was intentionally slowed down inside the dark tunnel.',
  'Brake Valve',
  'Brass air pressure cock on Carriage 4 showing fresh thumbprints.',
  '["Boiler Gauge","Coupling Pin","Steam Pipe"]'::jsonb,
  'Brake Valve',
  '["brake valve","valve","pressure valve","brake"]'::jsonb,
  'A metal lever pulled on trains to release air pressure and stop wheels.',
  'ev_2',
  true,
  '{"descriptions":["An emergency brake pressure valve was pulled and manually reset.","At 11:20 PM: An emergency brake pressure valve was pulled and manually reset.","Notice this clue: An emergency brake pressure valve was pulled and manually reset."],"hints":["A metal lever pulled on trains to release air pressure and stop wheels.","Clue hint: Think about brake valve.","Search for: the train was intentionally slowed down inside the dark tunnel."],"clues":["Brake Valve","Item: Brake Valve","Clue Word: Brake Valve"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cfcf96fe-b19c-5acf-a7c6-f6c4f4f15824',
  'story_016',
  'ev_2',
  2,
  '11:22 PM',
  'A heavy iron side door on Carriage 4 is unlatched and swinging open.',
  'A heavy iron side door on Carriage 4 is unlatched and swinging open.',
  'The passengers exited through the side vestibule into the tunnel.',
  'Vestibule Door',
  'Iron latch covered in mountain frost swung open on its hinges.',
  '["Carriage Window","Roof Hatch","Floor Panel"]'::jsonb,
  'Vestibule Door',
  '["vestibule door","door","train door","side door"]'::jsonb,
  'A heavy metal door at the end of a train carriage connecting to the outside.',
  'ev_3',
  false,
  '{"descriptions":["A heavy iron side door on Carriage 4 is unlatched and swinging open.","At 11:22 PM: A heavy iron side door on Carriage 4 is unlatched and swinging open.","Notice this clue: A heavy iron side door on Carriage 4 is unlatched and swinging open."],"hints":["A heavy metal door at the end of a train carriage connecting to the outside.","Clue hint: Think about vestibule door.","Search for: the passengers exited through the side vestibule into the tunnel."],"clues":["Vestibule Door","Item: Vestibule Door","Clue Word: Vestibule Door"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '25d7374c-bb52-5f17-8271-872843b9282a',
  'story_016',
  'ev_3',
  3,
  '11:25 PM',
  'A brass conductor lantern stamped "S. Thorne" sits on an old ore cart.',
  'A brass conductor lantern stamped "S. Thorne" sits on an old ore cart.',
  'Silas guided the passengers through the abandoned Silver Vein mine.',
  'Brass Lantern',
  'Kerosene railroad lamp with yellow lens and engraved conductor plate.',
  '["Electric Torch","Candle","Flare"]'::jsonb,
  'Brass Lantern',
  '["brass lantern","lantern","lamp","rail lantern"]'::jsonb,
  'A portable glass and metal light source that burns oil or kerosene.',
  'ev_4',
  false,
  '{"descriptions":["A brass conductor lantern stamped \"S. Thorne\" sits on an old ore cart.","At 11:25 PM: A brass conductor lantern stamped \"S. Thorne\" sits on an old ore cart.","Notice this clue: A brass conductor lantern stamped \"S. Thorne\" sits on an old ore cart."],"hints":["A portable glass and metal light source that burns oil or kerosene.","Clue hint: Think about brass lantern.","Search for: silas guided the passengers through the abandoned silver vein mine."],"clues":["Brass Lantern","Item: Brass Lantern","Clue Word: Brass Lantern"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'beab85d8-afc7-5ec7-aaf8-9fecfe517cd0',
  'story_016',
  'ev_4',
  4,
  '11:28 PM',
  'Fresh boot prints in coal dust lead along the mine cart tracks.',
  'Fresh boot prints in coal dust lead along the mine cart tracks.',
  'Five individuals walked along the abandoned tunnel tracks.',
  'Coal Dust Tracks',
  'Five distinct sets of footprints heading toward the mountain ridge exit.',
  '["Animal Tracks","Tire Marks","Water Drips"]'::jsonb,
  'Coal Dust Tracks',
  '["coal dust tracks","tracks","footprints","coal tracks","boot prints"]'::jsonb,
  'Marks left in black powdery coal dust by people walking.',
  'ev_5',
  false,
  '{"descriptions":["Fresh boot prints in coal dust lead along the mine cart tracks.","At 11:28 PM: Fresh boot prints in coal dust lead along the mine cart tracks.","Notice this clue: Fresh boot prints in coal dust lead along the mine cart tracks."],"hints":["Marks left in black powdery coal dust by people walking.","Clue hint: Think about coal dust tracks.","Search for: five individuals walked along the abandoned tunnel tracks."],"clues":["Coal Dust Tracks","Item: Coal Dust Tracks","Clue Word: Coal Dust Tracks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3d184500-87ca-5c20-a65f-7b7aaa989f11',
  'story_016',
  'ev_5',
  5,
  '11:35 PM',
  'A red wool scarf belonging to Marta Kovacs is caught on a wooden mine timber.',
  'A red wool scarf belonging to Marta Kovacs is caught on a wooden mine timber.',
  'Marta brushed past the support beam during the rapid evacuation.',
  'Red Wool Scarf',
  'Hand-knit crimson wool scarf matching Marta’s description.',
  '["Cotton Shawl","Silk Scarf","Linen Band"]'::jsonb,
  'Red Wool Scarf',
  '["red wool scarf","scarf","wool scarf","red scarf"]'::jsonb,
  'A long warm piece of cloth wrapped around your neck in winter.',
  'ev_6',
  true,
  '{"descriptions":["A red wool scarf belonging to Marta Kovacs is caught on a wooden mine timber.","At 11:35 PM: A red wool scarf belonging to Marta Kovacs is caught on a wooden mine timber.","Notice this clue: A red wool scarf belonging to Marta Kovacs is caught on a wooden mine timber."],"hints":["A long warm piece of cloth wrapped around your neck in winter.","Clue hint: Think about red wool scarf.","Search for: marta brushed past the support beam during the rapid evacuation."],"clues":["Red Wool Scarf","Item: Red Wool Scarf","Clue Word: Red Wool Scarf"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5a08ae09-b8ec-52b4-9d02-57962c873ab3',
  'story_016',
  'ev_6',
  6,
  '11:40 PM',
  'A pouch of stamped Austrian gold bars is hidden in the conductor’s locker.',
  'A pouch of stamped Austrian gold bars is hidden in the conductor’s locker.',
  'Silas was paid thirty gold bars for arranging the mountain escape.',
  'Gold Bars',
  'Velvet drawstring pouch containing stamped European gold ingots.',
  '["Silver Coins","Paper Money","Diamonds"]'::jsonb,
  'Gold Bars',
  '["gold bars","gold","pouch","gold bullion"]'::jsonb,
  'Heavy yellow precious metal ingots stamped with bank seals.',
  'ev_7',
  false,
  '{"descriptions":["A pouch of stamped Austrian gold bars is hidden in the conductor’s locker.","At 11:40 PM: A pouch of stamped Austrian gold bars is hidden in the conductor’s locker.","Notice this clue: A pouch of stamped Austrian gold bars is hidden in the conductor’s locker."],"hints":["Heavy yellow precious metal ingots stamped with bank seals.","Clue hint: Think about gold bars.","Search for: silas was paid thirty gold bars for arranging the mountain escape."],"clues":["Gold Bars","Item: Gold Bars","Clue Word: Gold Bars"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7d63c48c-aec7-5f45-ab2c-589bfde68961',
  'story_016',
  'ev_7',
  7,
  '11:48 PM',
  'Luggage bags remain neatly stacked on the overhead racks of Carriage 4.',
  'Luggage bags remain neatly stacked on the overhead racks of Carriage 4.',
  'The luggage was left behind deliberately to make pursuit slower.',
  'Stacked Luggage',
  'Four leather suitcases filled with clothing and decoy books.',
  '["Empty Boxes","Wooden Crates","Duffel Bags"]'::jsonb,
  'Stacked Luggage',
  '["stacked luggage","luggage","suitcases","bags"]'::jsonb,
  'Leather travel bags used to carry clothes on long train journeys.',
  'ev_8',
  false,
  '{"descriptions":["Luggage bags remain neatly stacked on the overhead racks of Carriage 4.","At 11:48 PM: Luggage bags remain neatly stacked on the overhead racks of Carriage 4.","Notice this clue: Luggage bags remain neatly stacked on the overhead racks of Carriage 4."],"hints":["Leather travel bags used to carry clothes on long train journeys.","Clue hint: Think about stacked luggage.","Search for: the luggage was left behind deliberately to make pursuit slower."],"clues":["Stacked Luggage","Item: Stacked Luggage","Clue Word: Stacked Luggage"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'de2823bd-4950-5709-84fb-0908a1ae9789',
  'story_016',
  'ev_8',
  8,
  '12:05 AM',
  'Snow chains tire tracks are found at the abandoned logging road exit.',
  'Snow chains tire tracks are found at the abandoned logging road exit.',
  'A four-wheel-drive truck met the refugees and drove them across the state line.',
  'Snow Chain Tracks',
  'Deep zig-zag tire impressions in two feet of fresh mountain snow.',
  '["Sled Tracks","Footpath","Ski Tracks"]'::jsonb,
  'Snow Chain Tracks',
  '["snow chain tracks","tracks","tire tracks","snow tracks","chain tracks"]'::jsonb,
  'Grooves left in deep snow by car tires wrapped in steel traction chains.',
  NULL,
  true,
  '{"descriptions":["Snow chains tire tracks are found at the abandoned logging road exit.","At 12:05 AM: Snow chains tire tracks are found at the abandoned logging road exit.","Notice this clue: Snow chains tire tracks are found at the abandoned logging road exit."],"hints":["Grooves left in deep snow by car tires wrapped in steel traction chains.","Clue hint: Think about snow chain tracks.","Search for: a four-wheel-drive truck met the refugees and drove them across the state line."],"clues":["Snow Chain Tracks","Item: Snow Chain Tracks","Clue Word: Snow Chain Tracks"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_017 — THE CROWN JEWELER'S SAFE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_017',
  'The Crown Jeweler''s Safe',
  'Investigation',
  'Vanderbilt & Sons Fine Jewelers, fortified subterranean vault room',
  'A 50-carat royal emerald necklace vanished from a safe without triggering laser grids or keypad alarms.',
  '[{"name":"Liam Vance","role":"Master Alarm Technician","alibi":"Sitting in the technician van outside running diagnostic software","avatar":"🔧"},{"name":"Gareth Vanderbilt","role":"Master Jeweler & Owner","alibi":"Upstairs in the private showroom reviewing ledger books","avatar":"💎"},{"name":"Leo Chen","role":"Apprentice Gemologist","alibi":"In the basement workshop polishing silver rings","avatar":"🔬"},{"name":"Inspector Elena Cruz","role":"High-Tech Theft Investigator","alibi":"Arrived at the scene thirty minutes after the alarm was reported","avatar":"📡"}]'::jsonb,
  'Alarm technician Liam Vance used a custom radio frequency jammer to loop the optical laser sensors. He entered his secret technician bypass code, bagged the Empress Emerald necklace, and walked out during his scheduled system inspection.',
  'Security Technician Liam Vance',
  'Liam was blackmailed by an international cartel to use his technician bypass code.',
  '[{"time":"04:00 PM","event":"Leo finishes polishing the Empress Emerald and stores it."},{"time":"05:00 PM","event":"Liam Vance arrives for scheduled quarterly alarm inspection."},{"time":"05:15 PM","event":"Liam activates the frequency jammer, freezing laser sensors."},{"time":"05:16 PM","event":"Liam uses technician code 9901 to open the safe silently."},{"time":"06:00 PM","event":"Gareth Vanderbilt discovers the empty velvet stand."}]'::jsonb,
  '[{"id":"ev1","title":"Copper Frequency Jammer","detail":"Found clipped behind the laser emitter; broadcasts a 433 MHz loop."},{"id":"ev2","title":"Digital Safe Log \"TECH-9901\"","detail":"Proves the vault was opened using Liam’s private service keycode."},{"id":"ev3","title":"Soldering Spool on Junction Box","detail":"Matches the solder composition in Liam’s technician kit."},{"id":"ev4","title":"Burner Phone Extortion Messages","detail":"Shows the criminal cartel forced Liam to deliver the emerald."}]'::jsonb,
  '[{"order":1,"title":"Frequency Jammer","text":"Electronic device used to freeze and bypass the laser security grid."},{"order":2,"title":"Master Override Code","text":"Technician backdoor code used to open the safe without combination."},{"order":3,"title":"Emerald Necklace","text":"Priceless 50-carat royal jewel stolen from the vault display."},{"order":4,"title":"Technician Toolbag","text":"Canvas bag used to smuggle the emerald out of the shop."},{"order":5,"title":"Soldering Wire","text":"Fine metal wire used to splice into the alarm junction circuits."},{"order":6,"title":"Technician Van","text":"Service vehicle equipped with signal equipment parked outside."}]'::jsonb,
  'Gareth Vanderbilt doubled the emerald’s insurance.: He did so because the gem was loaned for a royal exhibition.; Apprentice Leo bent a setting prong earlier.: An accidental slip of the tweezers while cleaning.',
  'Blame apprentice jeweler Leo or claim a tunneling crew dug in from the sewer.',
  'NORMAL',
  'How was the vault opened without sounding the digital alarm or leaving forced entry marks?',
  '[{"character":"Liam Vance","secret":"His daughter’s medical bills left him vulnerable to cartel extortion."},{"character":"Gareth Vanderbilt","secret":"He had secretly insured the emerald for twice its true market value."},{"character":"Leo Chen","secret":"He dropped the necklace earlier and bent a minor platinum prong."},{"character":"Inspector Elena Cruz","secret":"Tracking a frequency-cloning syndicate across three major cities."}]'::jsonb,
  '[{"lead":"Gareth Vanderbilt doubled the emerald’s insurance.","explanation":"He did so because the gem was loaned for a royal exhibition."},{"lead":"Apprentice Leo bent a setting prong earlier.","explanation":"An accidental slip of the tweezers while cleaning."}]'::jsonb,
  '{"wrongTheories":["Apprentice Leo stole the necklace to cover his mistake with the bent prong.","A team of thieves dug through the city sewers into the vault floor."],"correctTheory":"Alarm technician Liam Vance used a frequency jammer to loop the laser sensors and entered his master technician override code to steal the Empress Emerald under cartel extortion."}'::jsonb,
  'Technician Liam Vance bypassed the lasers with a jammer and master code!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Police intercepted Liam’s van before he could hand the emerald to the cartel. The necklace was recovered and Liam was given protection in exchange for testimony."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Apprentice Leo was arrested for the theft. Liam delivered the emerald to the cartel and disappeared with his family."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Gareth was prosecuted for insurance fraud. The real emerald was cut down into loose stones across Europe."}]'::jsonb,
  '{"intros":["A 50-carat royal emerald necklace vanished from a safe without triggering laser grids or keypad alarms.","Case file story_017: A 50-carat royal emerald necklace vanished from a safe without triggering laser grids or keypad alarms. Look closely at every clue.","Trouble begins in Vanderbilt & Sons Fine Jewelers, fortified subterranean vault room. A 50-carat royal emerald necklace vanished from a safe without triggering laser grids or keypad alarms.","The mystery starts now. A 50-carat royal emerald necklace vanished from a safe without triggering laser grids or keypad alarms. Can you solve it?"],"reveals":["Technician Liam Vance bypassed the lasers with a jammer and master code!","The mystery is unraveled! Technician Liam Vance bypassed the lasers with a jammer and master code!","At last, the truth comes out: Technician Liam Vance bypassed the lasers with a jammer and master code!","Case resolved! Here is what happened: Technician Liam Vance bypassed the lasers with a jammer and master code!"],"hints":["Pay attention to where Security Technician Liam Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_017';
DELETE FROM public.case_events WHERE case_id = 'story_017';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '57666290-81f6-597c-b94f-9ba4fa4c57af',
  'story_017',
  'Liam Vance',
  'Master Alarm Technician',
  'Quiet, bespectacled, nervous hands constantly adjusting wires',
  'I completed the quarterly diagnostic check and all laser circuits tested green.',
  'His daughter’s medical bills left him vulnerable to cartel extortion.',
  'Sitting in the technician van outside running diagnostic software',
  'Installed and serviced the laser alarm grid',
  'The laser sensors operate on a 433 MHz feedback frequency.',
  'Left a miniature antenna coil behind the sensor panel.',
  '🔧',
  '["I completed the quarterly diagnostic check and all laser circuits tested green.","\"I completed the quarterly diagnostic check and all laser circuits tested green.\"","Listen to me: I completed the quarterly diagnostic check and all laser circuits tested green.","I tell you the truth: I completed the quarterly diagnostic check and all laser circuits tested green."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '84c2a78c-1ab9-5f65-a9af-722ff24d121a',
  'story_017',
  'Gareth Vanderbilt',
  'Master Jeweler & Owner',
  'Proud, elderly, wearing an eye loupe and velvet waistcoat',
  'Only myself and my son know the six-digit keypad combination.',
  'He had secretly insured the emerald for twice its true market value.',
  'Upstairs in the private showroom reviewing ledger books',
  'Owner of the dealership and custodian of the Empress Emerald',
  'The safe door was locked when he checked it at closing.',
  'Did not know the alarm company possessed a master backdoor code.',
  '💎',
  '["Only myself and my son know the six-digit keypad combination.","\"Only myself and my son know the six-digit keypad combination.\"","Listen to me: Only myself and my son know the six-digit keypad combination.","I tell you the truth: Only myself and my son know the six-digit keypad combination."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd2a87eb4-b03e-5e84-8305-afd036b35b2e',
  'story_017',
  'Leo Chen',
  'Apprentice Gemologist',
  'Eager, skilled with magnifying lenses, easily intimidated',
  'I cleaned the emerald setting at 4:00 PM and placed it on the velvet pedestal.',
  'He dropped the necklace earlier and bent a minor platinum prong.',
  'In the basement workshop polishing silver rings',
  'Handled the gem before it was locked inside the safe',
  'Noticed the red laser beams flickered off for five seconds at 5:15 PM.',
  'Did not know Liam had a frequency jammer in his toolbag.',
  '🔬',
  '["I cleaned the emerald setting at 4:00 PM and placed it on the velvet pedestal.","\"I cleaned the emerald setting at 4:00 PM and placed it on the velvet pedestal.\"","Listen to me: I cleaned the emerald setting at 4:00 PM and placed it on the velvet pedestal.","I tell you the truth: I cleaned the emerald setting at 4:00 PM and placed it on the velvet pedestal."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '16b9da63-c6d7-520d-bd92-43f7fd211abf',
  'story_017',
  'Inspector Elena Cruz',
  'High-Tech Theft Investigator',
  'Sharp, tech-savvy, carries signal analyzers',
  'No lasers were tripped because the sensors were fed a continuous looped signal.',
  'Tracking a frequency-cloning syndicate across three major cities.',
  'Arrived at the scene thirty minutes after the alarm was reported',
  'Specialist in electronic safecracking',
  'The safe’s digital log registered an internal override code at 5:16 PM.',
  'Did not immediately identify Liam’s van as the broadcasting source.',
  '📡',
  '["No lasers were tripped because the sensors were fed a continuous looped signal.","\"No lasers were tripped because the sensors were fed a continuous looped signal.\"","Listen to me: No lasers were tripped because the sensors were fed a continuous looped signal.","I tell you the truth: No lasers were tripped because the sensors were fed a continuous looped signal."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5befd7b3-60e4-55ea-846b-a3da032e1794',
  'story_017',
  'ev_1',
  1,
  '05:15 PM',
  'A tiny electronic frequency jammer is clipped to the laser emitter.',
  'A tiny electronic frequency jammer is clipped to the laser emitter.',
  'The alarm was blinded by feeding it a repeated radio frequency loop.',
  'Frequency Jammer',
  'Black circuit board with a soldered copper loop antenna.',
  '["Battery Pack","Flashlight","Audio Recorder"]'::jsonb,
  'Frequency Jammer',
  '["frequency jammer","jammer","circuit board","device"]'::jsonb,
  'An electronic device that blocks or fakes radio and laser signals.',
  'ev_2',
  true,
  '{"descriptions":["A tiny electronic frequency jammer is clipped to the laser emitter.","At 05:15 PM: A tiny electronic frequency jammer is clipped to the laser emitter.","Notice this clue: A tiny electronic frequency jammer is clipped to the laser emitter."],"hints":["An electronic device that blocks or fakes radio and laser signals.","Clue hint: Think about frequency jammer.","Search for: the alarm was blinded by feeding it a repeated radio frequency loop."],"clues":["Frequency Jammer","Item: Frequency Jammer","Clue Word: Frequency Jammer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '762bad08-bae7-514e-9495-c0b843f1fae8',
  'story_017',
  'ev_2',
  2,
  '05:16 PM',
  'The digital safe panel registers an internal "TECH-9901" master override.',
  'The digital safe panel registers an internal "TECH-9901" master override.',
  'The safe was unlocked using the manufacturer’s backdoor code.',
  'Master Override Code',
  'Printed digital audit trail showing authorization code 9901.',
  '["Key Hole Log","Broken Dial","Burnt Lock"]'::jsonb,
  'Master Override Code',
  '["master override code","code","override code","master code","audit log"]'::jsonb,
  'A secret sequence of numbers used by engineers to open locks.',
  'ev_3',
  false,
  '{"descriptions":["The digital safe panel registers an internal \"TECH-9901\" master override.","At 05:16 PM: The digital safe panel registers an internal \"TECH-9901\" master override.","Notice this clue: The digital safe panel registers an internal \"TECH-9901\" master override."],"hints":["A secret sequence of numbers used by engineers to open locks.","Clue hint: Think about master override code.","Search for: the safe was unlocked using the manufacturer’s backdoor code."],"clues":["Master Override Code","Item: Master Override Code","Clue Word: Master Override Code"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '664a868b-0426-53aa-a294-43f34b99fff8',
  'story_017',
  'ev_3',
  3,
  '05:17 PM',
  'The empty velvet neck display sits under the silent green laser beams.',
  'The empty velvet neck display sits under the silent green laser beams.',
  'The 50-carat Empress Emerald necklace was lifted without damage.',
  'Emerald Necklace',
  'Empty emerald-green velvet bust with indentations of 50 carats of gems.',
  '["Diamond Tiara","Ruby Ring","Sapphire Brooch"]'::jsonb,
  'Emerald Necklace',
  '["emerald necklace","necklace","emerald","jewel"]'::jsonb,
  'A circle of glittering green precious stones worn around the neck.',
  'ev_4',
  false,
  '{"descriptions":["The empty velvet neck display sits under the silent green laser beams.","At 05:17 PM: The empty velvet neck display sits under the silent green laser beams.","Notice this clue: The empty velvet neck display sits under the silent green laser beams."],"hints":["A circle of glittering green precious stones worn around the neck.","Clue hint: Think about emerald necklace.","Search for: the 50-carat empress emerald necklace was lifted without damage."],"clues":["Emerald Necklace","Item: Emerald Necklace","Clue Word: Emerald Necklace"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f4a74164-c495-53f6-8f1e-47c70bb2766d',
  'story_017',
  'ev_4',
  4,
  '05:20 PM',
  'A technician canvas toolbag smelling of soldering resin is zipped shut.',
  'A technician canvas toolbag smelling of soldering resin is zipped shut.',
  'The thief used an ordinary technician kit to conceal the necklace.',
  'Technician Toolbag',
  'Heavy canvas bag stamped "SafeGuard Security Systems".',
  '["Backpack","Briefcase","Paper Sack"]'::jsonb,
  'Technician Toolbag',
  '["technician toolbag","toolbag","bag","technician bag","canvas bag"]'::jsonb,
  'A heavy cloth bag used by repair workers to carry screwdrivers and tools.',
  'ev_5',
  false,
  '{"descriptions":["A technician canvas toolbag smelling of soldering resin is zipped shut.","At 05:20 PM: A technician canvas toolbag smelling of soldering resin is zipped shut.","Notice this clue: A technician canvas toolbag smelling of soldering resin is zipped shut."],"hints":["A heavy cloth bag used by repair workers to carry screwdrivers and tools.","Clue hint: Think about technician toolbag.","Search for: the thief used an ordinary technician kit to conceal the necklace."],"clues":["Technician Toolbag","Item: Technician Toolbag","Clue Word: Technician Toolbag"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '11c8abdb-42ad-5246-b417-f3b671a8fac1',
  'story_017',
  'ev_5',
  5,
  '05:25 PM',
  'A micro-soldering wire spool with silver solder is left on the junction box.',
  'A micro-soldering wire spool with silver solder is left on the junction box.',
  'The technician spliced into the optical circuit directly.',
  'Soldering Wire',
  'Spool of 0.5mm silver alloy solder with flux residue.',
  '["Copper Wire","Duct Tape","Glue Stick"]'::jsonb,
  'Soldering Wire',
  '["soldering wire","wire","solder","metal wire"]'::jsonb,
  'Thin soft metal wire melted with heat to join electronic circuits.',
  'ev_6',
  true,
  '{"descriptions":["A micro-soldering wire spool with silver solder is left on the junction box.","At 05:25 PM: A micro-soldering wire spool with silver solder is left on the junction box.","Notice this clue: A micro-soldering wire spool with silver solder is left on the junction box."],"hints":["Thin soft metal wire melted with heat to join electronic circuits.","Clue hint: Think about soldering wire.","Search for: the technician spliced into the optical circuit directly."],"clues":["Soldering Wire","Item: Soldering Wire","Clue Word: Soldering Wire"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f173f0b8-6ff0-55d5-b46f-2e21974007a2',
  'story_017',
  'ev_6',
  6,
  '05:40 PM',
  'A white surveillance van with diagnostic laptops is parked across the street.',
  'A white surveillance van with diagnostic laptops is parked across the street.',
  'Liam operated from his company service van right outside the shop.',
  'Technician Van',
  'Company van containing signal generators and spare sensor boards.',
  '["Sedan","Motorcycle","Delivery Truck"]'::jsonb,
  'Technician Van',
  '["technician van","van","company van","service van"]'::jsonb,
  'A white boxy work vehicle used by service technicians.',
  'ev_7',
  false,
  '{"descriptions":["A white surveillance van with diagnostic laptops is parked across the street.","At 05:40 PM: A white surveillance van with diagnostic laptops is parked across the street.","Notice this clue: A white surveillance van with diagnostic laptops is parked across the street."],"hints":["A white boxy work vehicle used by service technicians.","Clue hint: Think about technician van.","Search for: liam operated from his company service van right outside the shop."],"clues":["Technician Van","Item: Technician Van","Clue Word: Technician Van"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd8f1b415-bedd-5596-b6b2-018e19a71b18',
  'story_017',
  'ev_7',
  7,
  '06:05 PM',
  'Red laser sensors hum quietly without showing any breach signals.',
  'Red laser sensors hum quietly without showing any breach signals.',
  'The lasers were still active because the loop continued broadcasting.',
  'Laser Grid',
  'Network of criss-crossing red optical beams across the vault floor.',
  '["Electric Fence","Iron Bars","Glass Wall"]'::jsonb,
  'Laser Grid',
  '["laser grid","laser","lasers","optical beams"]'::jsonb,
  'Narrow beams of red light that trigger alarms if someone walks through.',
  'ev_8',
  false,
  '{"descriptions":["Red laser sensors hum quietly without showing any breach signals.","At 06:05 PM: Red laser sensors hum quietly without showing any breach signals.","Notice this clue: Red laser sensors hum quietly without showing any breach signals."],"hints":["Narrow beams of red light that trigger alarms if someone walks through.","Clue hint: Think about laser grid.","Search for: the lasers were still active because the loop continued broadcasting."],"clues":["Laser Grid","Item: Laser Grid","Clue Word: Laser Grid"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '745489db-7772-59e4-8d0a-d6ec4b7e5752',
  'story_017',
  'ev_8',
  8,
  '06:30 PM',
  'Blackmail text messages demanding the emerald are found on a burner phone.',
  'Blackmail text messages demanding the emerald are found on a burner phone.',
  'Liam was coerced by criminals who threatened his family.',
  'Burner Phone',
  'Cheap disposable flip phone with threatening SMS messages.',
  '["Tablet","Pager","Radio"]'::jsonb,
  'Burner Phone',
  '["burner phone","phone","cell phone","mobile"]'::jsonb,
  'A cheap prepaid phone used anonymously and thrown away.',
  NULL,
  true,
  '{"descriptions":["Blackmail text messages demanding the emerald are found on a burner phone.","At 06:30 PM: Blackmail text messages demanding the emerald are found on a burner phone.","Notice this clue: Blackmail text messages demanding the emerald are found on a burner phone."],"hints":["A cheap prepaid phone used anonymously and thrown away.","Clue hint: Think about burner phone.","Search for: liam was coerced by criminals who threatened his family."],"clues":["Burner Phone","Item: Burner Phone","Clue Word: Burner Phone"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_018 — THE SUBSTATION BLACKOUT
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_018',
  'The Substation Blackout',
  'Investigation',
  'Metro Electric Substation 9, humming high-voltage transformers and barbed-wire fences',
  'A targeted sabotage at 2:00 AM plunged the city financial district into darkness for three hours.',
  '[{"name":"Frank Miller","role":"Senior Grid Engineer","alibi":"Central operations dispatch floor","avatar":"⚡"},{"name":"Carlos Ruiz","role":"Substation Night Guard","alibi":"Main gate guardhouse","avatar":"🛡️"},{"name":"Rachel Adams","role":"Financial Systems Director","alibi":"In the downtown trading room managing server failures","avatar":"📊"},{"name":"Detective Marcus Vance","role":"Infrastructure Sabotage Investigator","alibi":"Arrived at Substation 9 at 3:00 AM with the repair crew","avatar":"🔍"}]'::jsonb,
  'Senior Grid Engineer Frank Miller entered Substation 9 using his supervisor badge. He drained the oil coolant from Transformer 3, triggering an automated thermal shutdown that disabled the financial district, while his trading account shorted the market.',
  'Senior Engineer Frank Miller',
  'Frank shorted city utility stocks and stood to gain two million dollars from the power crash.',
  '[{"time":"01:30 AM","event":"Frank Miller takes a company utility truck from the central depot."},{"time":"01:50 AM","event":"Frank uses his supervisor badge to enter Substation 9."},{"time":"01:58 AM","event":"Frank turns the drain valve on Transformer 3 with a pipe wrench."},{"time":"02:00 AM","event":"Overheating triggers automatic trip switches; financial district goes black."},{"time":"02:05 AM","event":"Frank drives away while Carlos wakes up to siren alarms."}]'::jsonb,
  '[{"id":"ev1","title":"Transformer Drain Valve Residue","detail":"Matches tool marks from utility pipe wrench #44."},{"id":"ev2","title":"RFID Gate Log #088","detail":"Proves Frank Miller entered Substation 9 eight minutes before the blackout."},{"id":"ev3","title":"Oily Utility Truck Pedal","detail":"Shows mineral oil transferred from Frank’s boots onto Truck 104."},{"id":"ev4","title":"Market Short Options Account","detail":"Proves Frank set up a two-million-dollar payout from the power failure."}]'::jsonb,
  '[{"order":1,"title":"Transformer Drain Valve","text":"Brass valve opened manually to drain the transformer cooling oil."},{"order":2,"title":"Cooling Oil","text":"Dielectric liquid spilled across the substation gravel bed."},{"order":3,"title":"Pipe Wrench","text":"Cast-iron tool used to force the drain valve open."},{"order":4,"title":"Circuit Breaker","text":"Massive safety switch tripped by thermal overload."},{"order":5,"title":"Supervisor Badge","text":"Electronic pass logging Frank Miller at the substation gate."},{"order":6,"title":"Stock Trading Slip","text":"Financial proof of a massive bet on a power crash."}]'::jsonb,
  'Guard Carlos took a nap at his post.: An embarrassing lapse in duty, but he had no technical knowledge.; Financial servers reported foreign IP pings.: Routine automated network scans unrelated to the physical damage.',
  'Blame the night security guard or claim cyber-hackers infiltrated the grid remotely.',
  'NORMAL',
  'Who bypassed the electrified perimeter and cut the main busbar cooling lines?',
  '[{"character":"Frank Miller","secret":"Placed fifty thousand dollars into high-leverage market short options."},{"character":"Carlos Ruiz","secret":"He took a ten-minute nap in the guard shack around 1:45 AM."},{"character":"Rachel Adams","secret":"Her firm had weak backup generators that failed immediately."},{"character":"Detective Marcus Vance","secret":"Suspected an insider trading angle from the moment the power dropped."}]'::jsonb,
  '[{"lead":"Guard Carlos took a nap at his post.","explanation":"An embarrassing lapse in duty, but he had no technical knowledge."},{"lead":"Financial servers reported foreign IP pings.","explanation":"Routine automated network scans unrelated to the physical damage."}]'::jsonb,
  '{"wrongTheories":["Foreign cyber-hackers infected the grid control software with malware.","A lightning strike caused an accidental electrical blowout in Transformer 3."],"correctTheory":"Senior Engineer Frank Miller used his supervisor badge to enter Substation 9, drained the cooling oil from Transformer 3 with a pipe wrench, and crashed the grid to profit from short stock positions."}'::jsonb,
  'Senior Engineer Frank Miller sabotaged the grid for a stock market profit!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The RFID entry logs and the oily rag in Frank’s locker provided undeniable proof. Frank was arrested and his illicit trading profits were frozen."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Guard Carlos was fired and blamed for the sabotage. Frank Miller quietly closed his short positions and walked away a multimillionaire."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The power outage was blamed on a freak lightning surge. Frank kept his high-level job and executed further market manipulations."}]'::jsonb,
  '{"intros":["A targeted sabotage at 2:00 AM plunged the city financial district into darkness for three hours.","Case file story_018: A targeted sabotage at 2:00 AM plunged the city financial district into darkness for three hours. Look closely at every clue.","Trouble begins in Metro Electric Substation 9, humming high-voltage transformers and barbed-wire fences. A targeted sabotage at 2:00 AM plunged the city financial district into darkness for three hours.","The mystery starts now. A targeted sabotage at 2:00 AM plunged the city financial district into darkness for three hours. Can you solve it?"],"reveals":["Senior Engineer Frank Miller sabotaged the grid for a stock market profit!","The mystery is unraveled! Senior Engineer Frank Miller sabotaged the grid for a stock market profit!","At last, the truth comes out: Senior Engineer Frank Miller sabotaged the grid for a stock market profit!","Case resolved! Here is what happened: Senior Engineer Frank Miller sabotaged the grid for a stock market profit!"],"hints":["Pay attention to where Senior Engineer Frank Miller was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_018';
DELETE FROM public.case_events WHERE case_id = 'story_018';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '76da08d3-b00f-5692-b59d-904fc1affa73',
  'story_018',
  'Frank Miller',
  'Senior Grid Engineer',
  'Arrogant, brilliant, wearing steel-toed boots and safety goggles',
  'I was monitoring grid balance from the central dispatch room ten miles away.',
  'Placed fifty thousand dollars into high-leverage market short options.',
  'Central operations dispatch floor',
  'Designed the emergency cooling systems for Substation 9',
  'Draining Transformer 3’s mineral oil causes an automatic blackout within eight minutes.',
  'Did not realize his boots left oily residue on the maintenance ladder.',
  '⚡',
  '["I was monitoring grid balance from the central dispatch room ten miles away.","\"I was monitoring grid balance from the central dispatch room ten miles away.\"","Listen to me: I was monitoring grid balance from the central dispatch room ten miles away.","I tell you the truth: I was monitoring grid balance from the central dispatch room ten miles away."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c9ef069f-378f-5723-b56e-d622e919548f',
  'story_018',
  'Carlos Ruiz',
  'Substation Night Guard',
  'Alert, honest, carrying an electric patrol torch',
  'The perimeter fence was untouched. The intruder had an authorized security fob.',
  'He took a ten-minute nap in the guard shack around 1:45 AM.',
  'Main gate guardhouse',
  'Guarding the outer perimeter of Substation 9',
  'Saw the taillights of an official utility truck leaving at 2:05 AM.',
  'Did not see who was driving the utility truck.',
  '🛡️',
  '["The perimeter fence was untouched. The intruder had an authorized security fob.","\"The perimeter fence was untouched. The intruder had an authorized security fob.\"","Listen to me: The perimeter fence was untouched. The intruder had an authorized security fob.","I tell you the truth: The perimeter fence was untouched. The intruder had an authorized security fob."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'eac33c41-224d-5f61-bd5d-9bb111d898e9',
  'story_018',
  'Rachel Adams',
  'Financial Systems Director',
  'Furious, high-strung, clutching trade loss summaries',
  'The blackout hit at the exact minute Asian stock markets opened, causing chaos.',
  'Her firm had weak backup generators that failed immediately.',
  'In the downtown trading room managing server failures',
  'Victim of the financial trading collapse caused by the outage',
  'Trading algorithms automatically dumped stock when power failed.',
  'Did not know the sabotage was executed by an electrical engineer.',
  '📊',
  '["The blackout hit at the exact minute Asian stock markets opened, causing chaos.","\"The blackout hit at the exact minute Asian stock markets opened, causing chaos.\"","Listen to me: The blackout hit at the exact minute Asian stock markets opened, causing chaos.","I tell you the truth: The blackout hit at the exact minute Asian stock markets opened, causing chaos."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e7966935-9d6d-5488-abc5-a40333b2629b',
  'story_018',
  'Detective Marcus Vance',
  'Infrastructure Sabotage Investigator',
  'Tenacious, methodical, wears insulated boots',
  'This wasn’t a cyber-attack. Somebody physically turned an oil drain valve with a wrench.',
  'Suspected an insider trading angle from the moment the power dropped.',
  'Arrived at Substation 9 at 3:00 AM with the repair crew',
  'Investigating critical infrastructure crimes',
  'Found mineral transformer oil soaked into a discarded wiping rag.',
  'Did not immediately have access to offshore brokerage accounts.',
  '🔍',
  '["This wasn’t a cyber-attack. Somebody physically turned an oil drain valve with a wrench.","\"This wasn’t a cyber-attack. Somebody physically turned an oil drain valve with a wrench.\"","Listen to me: This wasn’t a cyber-attack. Somebody physically turned an oil drain valve with a wrench.","I tell you the truth: This wasn’t a cyber-attack. Somebody physically turned an oil drain valve with a wrench."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd63914af-dbc5-591e-98b3-295584aeed1a',
  'story_018',
  'ev_1',
  1,
  '01:58 AM',
  'A heavy brass drain valve on Transformer 3 is turned open.',
  'A heavy brass drain valve on Transformer 3 is turned open.',
  'Hundreds of gallons of mineral cooling oil spilled onto the gravel bed.',
  'Transformer Drain Valve',
  'Large threaded brass valve dripping with amber dielectric oil.',
  '["Wire Conduit","Fuse Box","Circuit Breaker"]'::jsonb,
  'Transformer Drain Valve',
  '["transformer drain valve","valve","drain valve","transformer valve","brass valve"]'::jsonb,
  'A metal turnable fixture used to drain liquids from large industrial tanks.',
  'ev_2',
  true,
  '{"descriptions":["A heavy brass drain valve on Transformer 3 is turned open.","At 01:58 AM: A heavy brass drain valve on Transformer 3 is turned open.","Notice this clue: A heavy brass drain valve on Transformer 3 is turned open."],"hints":["A metal turnable fixture used to drain liquids from large industrial tanks.","Clue hint: Think about transformer drain valve.","Search for: hundreds of gallons of mineral cooling oil spilled onto the gravel bed."],"clues":["Transformer Drain Valve","Item: Transformer Drain Valve","Clue Word: Transformer Drain Valve"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '41870a2b-b14a-5a2f-b9b8-a1c235207f79',
  'story_018',
  'ev_2',
  2,
  '01:59 AM',
  'An amber pool of dielectric mineral oil spreads across the crushed gravel.',
  'An amber pool of dielectric mineral oil spreads across the crushed gravel.',
  'Without cooling oil, the transformer rapidly overheated and tripped.',
  'Cooling Oil',
  'Highly refined amber transformer oil smelling of petroleum.',
  '["Water Puddle","Gasoline","Motor Oil"]'::jsonb,
  'Cooling Oil',
  '["cooling oil","oil","mineral oil","transformer oil"]'::jsonb,
  'Special clear or amber liquid used to cool electrical transformers.',
  'ev_3',
  false,
  '{"descriptions":["An amber pool of dielectric mineral oil spreads across the crushed gravel.","At 01:59 AM: An amber pool of dielectric mineral oil spreads across the crushed gravel.","Notice this clue: An amber pool of dielectric mineral oil spreads across the crushed gravel."],"hints":["Special clear or amber liquid used to cool electrical transformers.","Clue hint: Think about cooling oil.","Search for: without cooling oil, the transformer rapidly overheated and tripped."],"clues":["Cooling Oil","Item: Cooling Oil","Clue Word: Cooling Oil"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4f2466e4-97f8-5055-be98-113d8c7688b3',
  'story_018',
  'ev_3',
  3,
  '02:00 AM',
  'A heavy 18-inch steel pipe wrench is dropped behind the breaker fence.',
  'A heavy 18-inch steel pipe wrench is dropped behind the breaker fence.',
  'The tool used to force the stuck valve was left at the scene.',
  'Pipe Wrench',
  'Cast-iron red wrench engraved with utility company tool ID #44.',
  '["Hammer","Crowbar","Pliers"]'::jsonb,
  'Pipe Wrench',
  '["pipe wrench","wrench","tool","red wrench"]'::jsonb,
  'A heavy adjustable metal tool used by plumbers and mechanics to turn pipes.',
  'ev_4',
  false,
  '{"descriptions":["A heavy 18-inch steel pipe wrench is dropped behind the breaker fence.","At 02:00 AM: A heavy 18-inch steel pipe wrench is dropped behind the breaker fence.","Notice this clue: A heavy 18-inch steel pipe wrench is dropped behind the breaker fence."],"hints":["A heavy adjustable metal tool used by plumbers and mechanics to turn pipes.","Clue hint: Think about pipe wrench.","Search for: the tool used to force the stuck valve was left at the scene."],"clues":["Pipe Wrench","Item: Pipe Wrench","Clue Word: Pipe Wrench"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ce8b202e-067d-594e-b9ad-f802b0229513',
  'story_018',
  'ev_4',
  4,
  '02:02 AM',
  'The main digital breaker trips, snapping with a sound like a cannon shot.',
  'The main digital breaker trips, snapping with a sound like a cannon shot.',
  'The safety breaker disengaged the entire high-voltage power grid.',
  'Circuit Breaker',
  'Massive 500-kilovolt air-blast circuit breaker locked in OPEN position.',
  '["Transformer Core","Light Bulb","Battery"]'::jsonb,
  'Circuit Breaker',
  '["circuit breaker","breaker","switch","power switch"]'::jsonb,
  'An automatic electrical switch designed to protect circuits from damage.',
  'ev_5',
  false,
  '{"descriptions":["The main digital breaker trips, snapping with a sound like a cannon shot.","At 02:02 AM: The main digital breaker trips, snapping with a sound like a cannon shot.","Notice this clue: The main digital breaker trips, snapping with a sound like a cannon shot."],"hints":["An automatic electrical switch designed to protect circuits from damage.","Clue hint: Think about circuit breaker.","Search for: the safety breaker disengaged the entire high-voltage power grid."],"clues":["Circuit Breaker","Item: Circuit Breaker","Clue Word: Circuit Breaker"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '82221985-b177-5784-88e4-8a03002de7e6',
  'story_018',
  'ev_5',
  5,
  '02:05 AM',
  'An electronic gate log records Supervisor Badge #088 at the access gate.',
  'An electronic gate log records Supervisor Badge #088 at the access gate.',
  'The gate was opened using Frank Miller’s personal security fob.',
  'Supervisor Badge',
  'RFID entry log recording Frank Miller’s clearance code.',
  '["Visitor Pass","Parking Ticket","Paper Log"]'::jsonb,
  'Supervisor Badge',
  '["supervisor badge","badge","fob","keycard"]'::jsonb,
  'A plastic security card that opens restricted electronic gates.',
  'ev_6',
  true,
  '{"descriptions":["An electronic gate log records Supervisor Badge #088 at the access gate.","At 02:05 AM: An electronic gate log records Supervisor Badge #088 at the access gate.","Notice this clue: An electronic gate log records Supervisor Badge #088 at the access gate."],"hints":["A plastic security card that opens restricted electronic gates.","Clue hint: Think about supervisor badge.","Search for: the gate was opened using frank miller’s personal security fob."],"clues":["Supervisor Badge","Item: Supervisor Badge","Clue Word: Supervisor Badge"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0af48428-0cd6-587e-9830-e29ba5d93844',
  'story_018',
  'ev_6',
  6,
  '02:30 AM',
  'Utility truck 104 is parked back at the depot with warm tires and oil on the pedal.',
  'Utility truck 104 is parked back at the depot with warm tires and oil on the pedal.',
  'Frank used company vehicle 104 during the exact blackout window.',
  'Utility Truck',
  'White pickup truck with company logo and dielectric oil on floor mats.',
  '["Sedan","Van","Motorcycle"]'::jsonb,
  'Utility Truck',
  '["utility truck","truck","pickup truck","vehicle"]'::jsonb,
  'A work truck used by electric utility line workers.',
  'ev_7',
  false,
  '{"descriptions":["Utility truck 104 is parked back at the depot with warm tires and oil on the pedal.","At 02:30 AM: Utility truck 104 is parked back at the depot with warm tires and oil on the pedal.","Notice this clue: Utility truck 104 is parked back at the depot with warm tires and oil on the pedal."],"hints":["A work truck used by electric utility line workers.","Clue hint: Think about utility truck.","Search for: frank used company vehicle 104 during the exact blackout window."],"clues":["Utility Truck","Item: Utility Truck","Clue Word: Utility Truck"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '78244bd9-9887-5c83-91c2-5d25935a0615',
  'story_018',
  'ev_7',
  7,
  '03:15 AM',
  'A broker confirmation slip shows a short position on Power Grid Holdings.',
  'A broker confirmation slip shows a short position on Power Grid Holdings.',
  'Frank bet heavily on the utility stock plummeting before market open.',
  'Stock Trading Slip',
  'Digital trading confirmation showing high-risk put options.',
  '["Receipt","Bank Check","Invoice"]'::jsonb,
  'Stock Trading Slip',
  '["stock trading slip","trading slip","slip","stock slip","trade document"]'::jsonb,
  'A paper or digital document confirming the purchase of financial stocks.',
  'ev_8',
  false,
  '{"descriptions":["A broker confirmation slip shows a short position on Power Grid Holdings.","At 03:15 AM: A broker confirmation slip shows a short position on Power Grid Holdings.","Notice this clue: A broker confirmation slip shows a short position on Power Grid Holdings."],"hints":["A paper or digital document confirming the purchase of financial stocks.","Clue hint: Think about stock trading slip.","Search for: frank bet heavily on the utility stock plummeting before market open."],"clues":["Stock Trading Slip","Item: Stock Trading Slip","Clue Word: Stock Trading Slip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '21e9944e-a79a-54a6-b985-8c1a7a65a6aa',
  'story_018',
  'ev_8',
  8,
  '03:40 AM',
  'A cloth wiping rag soaked with dielectric oil is found in Frank’s locker.',
  'A cloth wiping rag soaked with dielectric oil is found in Frank’s locker.',
  'Frank wiped the oil from his hands and stashed the rag in his locker.',
  'Oily Rag',
  'Yellow cotton shop cloth saturated with Transformer 3 mineral oil.',
  '["Paper Towel","Bandage","Sponge"]'::jsonb,
  'Oily Rag',
  '["oily rag","rag","cloth","wiping rag"]'::jsonb,
  'A piece of fabric used to clean oil, grease, or dirt from hands.',
  NULL,
  true,
  '{"descriptions":["A cloth wiping rag soaked with dielectric oil is found in Frank’s locker.","At 03:40 AM: A cloth wiping rag soaked with dielectric oil is found in Frank’s locker.","Notice this clue: A cloth wiping rag soaked with dielectric oil is found in Frank’s locker."],"hints":["A piece of fabric used to clean oil, grease, or dirt from hands.","Clue hint: Think about oily rag.","Search for: frank wiped the oil from his hands and stashed the rag in his locker."],"clues":["Oily Rag","Item: Oily Rag","Clue Word: Oily Rag"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_019 — THE HARBOR CUSTOMS RAID
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_019',
  'The Harbor Customs Raid',
  'Investigation',
  'Customs Warehouse 12, stacks of wooden pallets and scent of saltwater fish',
  'A shipment labeled "Canned Sardines" was raided by federal agents, revealing stolen archaeological relics.',
  '[{"name":"Donald Vance","role":"Customs Inspection Supervisor","alibi":"In the administration office reviewing cargo paperwork","avatar":"📋"},{"name":"Pete \"Forklift\" Larson","role":"Warehouse Forklift Operator","alibi":"Operating Forklift 3 on the warehouse floor","avatar":"🚜"},{"name":"Agent Marcus Brody","role":"Homeland Artifacts Investigator","alibi":"Led the tactical raid team through the warehouse doors at 4:00 PM","avatar":"🏛️"},{"name":"Captain Marco Bellini","role":"Freighter Captain","alibi":"Aboard the cargo vessel docked at Slipway 3","avatar":"⚓"}]'::jsonb,
  'Customs Supervisor Donald Vance used his official green inspection stamp to mark uninspected crates as cleared. He replaced original customs barcodes with canned fish documentation to smuggle ancient Roman bronzes.',
  'Customs Supervisor Donald Vance',
  'Donald was paid fifty thousand dollars per container by an illicit black-market art dealer.',
  '[{"time":"08:00 AM","event":"The freighter Andrea Doria unloads two hundred cargo crates."},{"time":"10:30 AM","event":"Donald Vance inspects Bay 4 and applies green approval stamps."},{"time":"01:15 PM","event":"Pete moves the crates to Bay 4; notices extreme weight."},{"time":"03:50 PM","event":"Federal agents surround Warehouse 12 with a search warrant."},{"time":"04:00 PM","event":"Pry bars crack open Crate 412, exposing ancient Roman bronzes."}]'::jsonb,
  '[{"id":"ev1","title":"Customs Stamp #14","detail":"Green ink stamp registered exclusively to Supervisor Donald Vance."},{"id":"ev2","title":"Forged Manifest Stationery","detail":"Printed using Donald Vance’s private office laser printer."},{"id":"ev3","title":"Cash Envelope in Office","detail":"Fifty thousand dollars in crisp bills hidden behind Donald’s cabinet."},{"id":"ev4","title":"Scale Ticket Discrepancy","detail":"Signed by Donald despite declaring 80 pounds on a 412-pound crate."}]'::jsonb,
  '[{"order":1,"title":"Customs Stamp","text":"Official green rubber stamp used to falsely clear the smuggling crates."},{"order":2,"title":"Fish Crate","text":"Pine crate labeled \"Canned Sardines\" concealing heavy ancient bronzes."},{"order":3,"title":"Roman Statuette","text":"Priceless 2,000-year-old bronze artifact excavated illegally."},{"order":4,"title":"Forged Manifest","text":"False documentation printed on customs office paper."},{"order":5,"title":"Barcode Labels","text":"Adhesive stickers used to disguise the cargo tracking number."},{"order":6,"title":"Cash Envelope","text":"Fifty thousand dollars in bribe money hidden in the supervisor’s office."}]'::jsonb,
  'Forklift driver Pete dropped a crate and saw bronze.: He kept quiet out of fear for his job, but took no bribes.; Captain Bellini had Italian wine bottles in his cabin.: Personal vintage wine from his family vineyard.',
  'Blame forklift driver Pete or claim the shipping company in Genoa loaded the wrong crates.',
  'NORMAL',
  'Who altered the customs manifests and organized the smuggling pipeline at Warehouse 12?',
  '[{"character":"Donald Vance","secret":"Received fifty thousand dollars in cash delivered to his seaside cottage."},{"character":"Pete \"Forklift\" Larson","secret":"He dropped one crate and noticed bronze metal through the broken wood slats."},{"character":"Agent Marcus Brody","secret":"He had an informant inside the Genoa maritime freight syndicate."},{"character":"Captain Marco Bellini","secret":"He suspected the Genoa freight forwarder was paying off harbor officials."}]'::jsonb,
  '[{"lead":"Forklift driver Pete dropped a crate and saw bronze.","explanation":"He kept quiet out of fear for his job, but took no bribes."},{"lead":"Captain Bellini had Italian wine bottles in his cabin.","explanation":"Personal vintage wine from his family vineyard."}]'::jsonb,
  '{"wrongTheories":["Forklift driver Pete operated an independent dockside smuggling ring.","The Genoa shipping company accidentally packed ancient bronzes into fish boxes."],"correctTheory":"Customs Supervisor Donald Vance used his official clearance stamp, printed forged manifests, and swapped barcodes to smuggle looted Roman bronzes for a fifty-thousand-dollar cash bribe."}'::jsonb,
  'Supervisor Donald Vance stamped the false crates for a fifty-thousand-dollar bribe!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Federal agents matched the green ink and seized the cash envelope in Donald’s office. Donald was arrested and the Roman artifacts were repatriated to Italy."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Forklift driver Pete was arrested for moving suspicious cargo. Donald collected his payoff and bought a luxury yacht."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The shipping line was fined for cargo mislabeling while Donald remained undetected, running further smuggling shipments."}]'::jsonb,
  '{"intros":["A shipment labeled \"Canned Sardines\" was raided by federal agents, revealing stolen archaeological relics.","Case file story_019: A shipment labeled \"Canned Sardines\" was raided by federal agents, revealing stolen archaeological relics. Look closely at every clue.","Trouble begins in Customs Warehouse 12, stacks of wooden pallets and scent of saltwater fish. A shipment labeled \"Canned Sardines\" was raided by federal agents, revealing stolen archaeological relics.","The mystery starts now. A shipment labeled \"Canned Sardines\" was raided by federal agents, revealing stolen archaeological relics. Can you solve it?"],"reveals":["Supervisor Donald Vance stamped the false crates for a fifty-thousand-dollar bribe!","The mystery is unraveled! Supervisor Donald Vance stamped the false crates for a fifty-thousand-dollar bribe!","At last, the truth comes out: Supervisor Donald Vance stamped the false crates for a fifty-thousand-dollar bribe!","Case resolved! Here is what happened: Supervisor Donald Vance stamped the false crates for a fifty-thousand-dollar bribe!"],"hints":["Pay attention to where Customs Supervisor Donald Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_019';
DELETE FROM public.case_events WHERE case_id = 'story_019';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2896731a-bd43-5174-8803-318a9fedae47',
  'story_019',
  'Donald Vance',
  'Customs Inspection Supervisor',
  'Bureaucratic, calm, unbothered, stamping papers with a gold signet ring',
  'I stamped the manifest based on the certified shipping documentation from Genoa.',
  'Received fifty thousand dollars in cash delivered to his seaside cottage.',
  'In the administration office reviewing cargo paperwork',
  'Directly approved the customs clearance for Warehouse 12',
  'Crate 412 contained looted 2,000-year-old Roman bronze statuettes.',
  'Did not know the green stamp ink contained a unique forensic chemical marker.',
  '📋',
  '["I stamped the manifest based on the certified shipping documentation from Genoa.","\"I stamped the manifest based on the certified shipping documentation from Genoa.\"","Listen to me: I stamped the manifest based on the certified shipping documentation from Genoa.","I tell you the truth: I stamped the manifest based on the certified shipping documentation from Genoa."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b42ee0b4-bba0-59e3-b24c-89a4c2d82a09',
  'story_019',
  'Pete "Forklift" Larson',
  'Warehouse Forklift Operator',
  'Hard-working, blunt, wearing an oil-stained ballcap',
  'I just moved the pallets from the crane apron to Bay 4 like the supervisor ordered.',
  'He dropped one crate and noticed bronze metal through the broken wood slats.',
  'Operating Forklift 3 on the warehouse floor',
  'Moved the suspicious crates into the warehouse storage bay',
  'The crates were three times heavier than ordinary fish tins.',
  'Did not report the weight discrepancy for fear of losing his union job.',
  '🚜',
  '["I just moved the pallets from the crane apron to Bay 4 like the supervisor ordered.","\"I just moved the pallets from the crane apron to Bay 4 like the supervisor ordered.\"","Listen to me: I just moved the pallets from the crane apron to Bay 4 like the supervisor ordered.","I tell you the truth: I just moved the pallets from the crane apron to Bay 4 like the supervisor ordered."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '484f48dd-9f1e-5567-b770-d01b521df37c',
  'story_019',
  'Agent Marcus Brody',
  'Homeland Artifacts Investigator',
  'Sharp, relentless, wearing a dark suit and rubber gloves',
  'These bronzes were excavated illegally from a Roman villa site last winter.',
  'He had an informant inside the Genoa maritime freight syndicate.',
  'Led the tactical raid team through the warehouse doors at 4:00 PM',
  'Investigating international antiquities trafficking',
  'The barcode labels on the crate were printed on an office laser printer.',
  'Did not know Donald had hidden the payoff cash in his cottage floorboards.',
  '🏛️',
  '["These bronzes were excavated illegally from a Roman villa site last winter.","\"These bronzes were excavated illegally from a Roman villa site last winter.\"","Listen to me: These bronzes were excavated illegally from a Roman villa site last winter.","I tell you the truth: These bronzes were excavated illegally from a Roman villa site last winter."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '23e1214b-e12d-534f-8d84-636526628253',
  'story_019',
  'Captain Marco Bellini',
  'Freighter Captain',
  'Italian sailor, bearded, smoking a briar pipe',
  'My ship carried five hundred containers. We do not open sealed boxes at sea.',
  'He suspected the Genoa freight forwarder was paying off harbor officials.',
  'Aboard the cargo vessel docked at Slipway 3',
  'Captain of the vessel that delivered the contraband',
  'The bills of lading were altered after the ship docked in port.',
  'Did not know which specific warehouse officer stamped the boxes.',
  '⚓',
  '["My ship carried five hundred containers. We do not open sealed boxes at sea.","\"My ship carried five hundred containers. We do not open sealed boxes at sea.\"","Listen to me: My ship carried five hundred containers. We do not open sealed boxes at sea.","I tell you the truth: My ship carried five hundred containers. We do not open sealed boxes at sea."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6d9fab6a-7ae2-58ca-b197-ef241eaec7cf',
  'story_019',
  'ev_1',
  1,
  '10:30 AM',
  'An official green rubber stamp reading "CLEARED - U.S. CUSTOMS" marks Crate 412.',
  'An official green rubber stamp reading "CLEARED - U.S. CUSTOMS" marks Crate 412.',
  'The stamp was applied by Supervisor Donald Vance without physical inspection.',
  'Customs Stamp',
  'Green indelible ink stamp with inspector badge number #14.',
  '["Red Warning Stamp","Wax Seal","Bar Code"]'::jsonb,
  'Customs Stamp',
  '["customs stamp","stamp","rubber stamp","green stamp"]'::jsonb,
  'A rubber device with an ink pad used to mark official approval on cargo.',
  'ev_2',
  true,
  '{"descriptions":["An official green rubber stamp reading \"CLEARED - U.S. CUSTOMS\" marks Crate 412.","At 10:30 AM: An official green rubber stamp reading \"CLEARED - U.S. CUSTOMS\" marks Crate 412.","Notice this clue: An official green rubber stamp reading \"CLEARED - U.S. CUSTOMS\" marks Crate 412."],"hints":["A rubber device with an ink pad used to mark official approval on cargo.","Clue hint: Think about customs stamp.","Search for: the stamp was applied by supervisor donald vance without physical inspection."],"clues":["Customs Stamp","Item: Customs Stamp","Clue Word: Customs Stamp"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '27c80ff7-34b0-58f3-ace0-d36894ec8dee',
  'story_019',
  'ev_2',
  2,
  '01:15 PM',
  'A wooden crate stenciled "Canned Sardines - Genoa" sits on a pallet.',
  'A wooden crate stenciled "Canned Sardines - Genoa" sits on a pallet.',
  'The crate weighed four hundred pounds, far too heavy for fish.',
  'Fish Crate',
  'Pine wooden shipping crate marked with fictitious canned food logos.',
  '["Steel Barrel","Cardboard Box","Burlap Sack"]'::jsonb,
  'Fish Crate',
  '["fish crate","crate","wooden crate","shipping crate"]'::jsonb,
  'A heavy wooden box used for transporting commercial freight.',
  'ev_3',
  false,
  '{"descriptions":["A wooden crate stenciled \"Canned Sardines - Genoa\" sits on a pallet.","At 01:15 PM: A wooden crate stenciled \"Canned Sardines - Genoa\" sits on a pallet.","Notice this clue: A wooden crate stenciled \"Canned Sardines - Genoa\" sits on a pallet."],"hints":["A heavy wooden box used for transporting commercial freight.","Clue hint: Think about fish crate.","Search for: the crate weighed four hundred pounds, far too heavy for fish."],"clues":["Fish Crate","Item: Fish Crate","Clue Word: Fish Crate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fc6c3a74-a04f-51c3-8289-7cb93877d5e3',
  'story_019',
  'ev_3',
  3,
  '04:00 PM',
  'A 2,000-year-old bronze Roman statuette is pulled from sawdust packing.',
  'A 2,000-year-old bronze Roman statuette is pulled from sawdust packing.',
  'The crate contained priceless looted cultural artifacts.',
  'Roman Statuette',
  'Green patina bronze figure of a Roman warrior wrapped in burlap.',
  '["Gold Chalice","Silver Coin","Oil Painting"]'::jsonb,
  'Roman Statuette',
  '["roman statuette","statuette","bronze","statue","artifact"]'::jsonb,
  'A small sculpted metal figure from ancient times with greenish age.',
  'ev_4',
  false,
  '{"descriptions":["A 2,000-year-old bronze Roman statuette is pulled from sawdust packing.","At 04:00 PM: A 2,000-year-old bronze Roman statuette is pulled from sawdust packing.","Notice this clue: A 2,000-year-old bronze Roman statuette is pulled from sawdust packing."],"hints":["A small sculpted metal figure from ancient times with greenish age.","Clue hint: Think about roman statuette.","Search for: the crate contained priceless looted cultural artifacts."],"clues":["Roman Statuette","Item: Roman Statuette","Clue Word: Roman Statuette"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '50870d89-10ea-5abf-afb4-f60546520ea7',
  'story_019',
  'ev_4',
  4,
  '04:10 PM',
  'A forged paper manifest showing fictitious Mediterranean food invoices is found.',
  'A forged paper manifest showing fictitious Mediterranean food invoices is found.',
  'The original manifest was swapped for forged documentation.',
  'Forged Manifest',
  'Shipping manifest printed on watermarked customs office stationery.',
  '["Newspaper","Map","Receipt"]'::jsonb,
  'Forged Manifest',
  '["forged manifest","manifest","paper","shipping manifest"]'::jsonb,
  'An official document listing all cargo carried by a transport ship.',
  'ev_5',
  false,
  '{"descriptions":["A forged paper manifest showing fictitious Mediterranean food invoices is found.","At 04:10 PM: A forged paper manifest showing fictitious Mediterranean food invoices is found.","Notice this clue: A forged paper manifest showing fictitious Mediterranean food invoices is found."],"hints":["An official document listing all cargo carried by a transport ship.","Clue hint: Think about forged manifest.","Search for: the original manifest was swapped for forged documentation."],"clues":["Forged Manifest","Item: Forged Manifest","Clue Word: Forged Manifest"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bf754a9d-d3aa-5681-81fd-08901e390e24',
  'story_019',
  'ev_5',
  5,
  '04:15 PM',
  'A roll of adhesive barcode labels printed on an office laser printer is found.',
  'A roll of adhesive barcode labels printed on an office laser printer is found.',
  'The smuggler pasted fake barcodes over the original freight stickers.',
  'Barcode Labels',
  'White adhesive thermal labels matching the printer in Donald’s office.',
  '["Tape Roll","Sticker Sheet","Price Tag"]'::jsonb,
  'Barcode Labels',
  '["barcode labels","barcode","labels","stickers"]'::jsonb,
  'Adhesive stickers with black lines scanned by computers at checkouts.',
  'ev_6',
  true,
  '{"descriptions":["A roll of adhesive barcode labels printed on an office laser printer is found.","At 04:15 PM: A roll of adhesive barcode labels printed on an office laser printer is found.","Notice this clue: A roll of adhesive barcode labels printed on an office laser printer is found."],"hints":["Adhesive stickers with black lines scanned by computers at checkouts.","Clue hint: Think about barcode labels.","Search for: the smuggler pasted fake barcodes over the original freight stickers."],"clues":["Barcode Labels","Item: Barcode Labels","Clue Word: Barcode Labels"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a567cea7-42a8-52f2-9eca-aaab6ebc9a34',
  'story_019',
  'ev_6',
  6,
  '04:30 PM',
  'An envelope stuffed with fifty thousand dollars in hundred-dollar bills is found.',
  'An envelope stuffed with fifty thousand dollars in hundred-dollar bills is found.',
  'The payoff for clearing the illegal artifacts through customs.',
  'Cash Envelope',
  'Manila envelope hidden behind the filing cabinet in Donald’s office.',
  '["Wallet","Briefcase","Checkbook"]'::jsonb,
  'Cash Envelope',
  '["cash envelope","envelope","cash","money"]'::jsonb,
  'A paper pouch filled with stacks of green banknotes.',
  'ev_7',
  false,
  '{"descriptions":["An envelope stuffed with fifty thousand dollars in hundred-dollar bills is found.","At 04:30 PM: An envelope stuffed with fifty thousand dollars in hundred-dollar bills is found.","Notice this clue: An envelope stuffed with fifty thousand dollars in hundred-dollar bills is found."],"hints":["A paper pouch filled with stacks of green banknotes.","Clue hint: Think about cash envelope.","Search for: the payoff for clearing the illegal artifacts through customs."],"clues":["Cash Envelope","Item: Cash Envelope","Clue Word: Cash Envelope"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '29bac1c0-e9b1-5f99-8087-860b362cfa14',
  'story_019',
  'ev_7',
  7,
  '04:45 PM',
  'A steel crowbar used by agents to pop the pine crate lid is dropped.',
  'A steel crowbar used by agents to pop the pine crate lid is dropped.',
  'The crate lid was nailed down with industrial framing staples.',
  'Crowbar',
  'Hexagonal steel pry bar with pine wood splinters on its tip.',
  '["Hammer","Screwdriver","Pliers"]'::jsonb,
  'Crowbar',
  '["crowbar","pry bar","iron bar"]'::jsonb,
  'A heavy metal bar used to force open wooden boxes and doors.',
  'ev_8',
  false,
  '{"descriptions":["A steel crowbar used by agents to pop the pine crate lid is dropped.","At 04:45 PM: A steel crowbar used by agents to pop the pine crate lid is dropped.","Notice this clue: A steel crowbar used by agents to pop the pine crate lid is dropped."],"hints":["A heavy metal bar used to force open wooden boxes and doors.","Clue hint: Think about crowbar.","Search for: the crate lid was nailed down with industrial framing staples."],"clues":["Crowbar","Item: Crowbar","Clue Word: Crowbar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '67169f38-35b8-57b7-a9db-86ede69b5c40',
  'story_019',
  'ev_8',
  8,
  '05:00 PM',
  'A container weight ticket showing 412 pounds instead of the declared 80 pounds.',
  'A container weight ticket showing 412 pounds instead of the declared 80 pounds.',
  'The scale ticket proved the supervisor ignored obvious weight discrepancies.',
  'Weight Ticket',
  'Automated dock scale slip signed with Donald Vance’s initials.',
  '["Parking Ticket","Toll Slip","Receipt"]'::jsonb,
  'Weight Ticket',
  '["weight ticket","ticket","scale ticket","slip"]'::jsonb,
  'A printed slip from heavy scales recording vehicle or cargo weight.',
  NULL,
  true,
  '{"descriptions":["A container weight ticket showing 412 pounds instead of the declared 80 pounds.","At 05:00 PM: A container weight ticket showing 412 pounds instead of the declared 80 pounds.","Notice this clue: A container weight ticket showing 412 pounds instead of the declared 80 pounds."],"hints":["A printed slip from heavy scales recording vehicle or cargo weight.","Clue hint: Think about weight ticket.","Search for: the scale ticket proved the supervisor ignored obvious weight discrepancies."],"clues":["Weight Ticket","Item: Weight Ticket","Clue Word: Weight Ticket"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_020 — THE UNIVERSITY EXAM LEAK
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_020',
  'The University Exam Leak',
  'Investigation',
  'St. Jude University, Dean’s Office, oak paneling and heavy brass bookcases',
  'The final medical licensing exam was leaked online twenty-four hours before testing began.',
  '[{"name":"Dr. Derek Cole","role":"Research Fellow","alibi":"Science lecture hall 2B","avatar":"👨‍⚕️"},{"name":"Dean Evelyn Bradley","role":"Dean of Medicine","alibi":"Attending the weekly faculty lunch in the dining commons","avatar":"👩‍🏫"},{"name":"Samir \"Sam\" Patel","role":"Student Council President","alibi":"Library 4th floor study carrel","avatar":"🎓"},{"name":"Detective Frank Ross","role":"Cyber Crimes Investigator","alibi":"Dispatched to the campus after the exam appeared on the web forum","avatar":"💻"}]'::jsonb,
  'Dr. Derek Cole slipped into Dean Bradley’s office while the Dean was at the faculty lunch. Using a stealth USB keylogger, he captured the Dean’s encryption password, downloaded the medical exam, and sold it to student syndicates.',
  'Research Fellow Dr. Derek Cole',
  'Derek was paid fifteen thousand dollars by wealthy students to provide the answers.',
  '[{"time":"12:45 PM","event":"Dean Bradley locks her office and walks to the faculty dining hall."},{"time":"01:10 PM","event":"Derek Cole uses a duplicate master key to enter the Dean’s suite."},{"time":"01:14 PM","event":"Derek inserts a keystroke-logging USB stick into the laptop."},{"time":"01:22 PM","event":"The encrypted exam PDF is copied onto an external flash card."},{"time":"02:00 PM","event":"The exam questions appear on an anonymous student chat forum."}]'::jsonb,
  '[{"id":"ev1","title":"Silicon USB Dust Cap","detail":"Found beneath the Dean’s desk; matches Derek’s KeySpy device."},{"id":"ev2","title":"Keylogger Registry Log","detail":"Proves a KeySpy Pro hardware tool was plugged in at 1:14 PM."},{"id":"ev3","title":"Micro-SD Card in Derek’s Wallet","detail":"Contains the exact unreleased medical exam PDF with answer keys."},{"id":"ev4","title":"Cash Stash in Derek’s Desk","detail":"Fifteen thousand dollars in small bills paid by cheating students."}]'::jsonb,
  '[{"order":1,"title":"USB Dust Cap","text":"Rubber cap dropped when the spy device was plugged into the laptop."},{"order":2,"title":"Keylogger Device","text":"Hardware tool used to record the Dean’s typing and passwords."},{"order":3,"title":"Micro-SD Card","text":"Tiny storage chip found in Derek’s wallet holding the stolen test."},{"order":4,"title":"Sticky Note","text":"Paper with the Dean’s password lifted from under her keyboard."},{"order":5,"title":"Chat Screenshot","text":"Telegram group messages offering the stolen test for sale."},{"order":6,"title":"Cash Stash","text":"Fifteen thousand dollars in student payoff money hidden in the desk."}]'::jsonb,
  'Student Sam was looking stressed in the hallway.: He was merely anxious about his pathology grade.; The Dean wrote her password on a sticky note.: Poor digital hygiene, but she was the victim, not the thief.',
  'Blame student council president Sam or claim an outside Russian hacker group cracked the server.',
  'NORMAL',
  'Who bypassed the Dean’s password-protected laptop and copied the exam questions?',
  '[{"character":"Dr. Derek Cole","secret":"Gambled away his university research stipend on online poker."},{"character":"Dean Evelyn Bradley","secret":"She wrote her laptop password on a sticky note under her keyboard."},{"character":"Samir \"Sam\" Patel","secret":"He was approached by the buyers to distribute the leaked test sheets."},{"character":"Detective Frank Ross","secret":"Graduated from St. Jude University twenty years prior."}]'::jsonb,
  '[{"lead":"Student Sam was looking stressed in the hallway.","explanation":"He was merely anxious about his pathology grade."},{"lead":"The Dean wrote her password on a sticky note.","explanation":"Poor digital hygiene, but she was the victim, not the thief."}]'::jsonb,
  '{"wrongTheories":["An overseas hacker syndicate penetrated the university mainframe.","Student Council President Sam stole the exam using a remote phishing email."],"correctTheory":"Dr. Derek Cole used a master key to enter the Dean’s office, copied her password from a sticky note, extracted the medical exam using a keylogger USB and micro-SD card, and sold it to students for fifteen thousand dollars."}'::jsonb,
  'Dr. Derek Cole copied the exam using a keylogger and sold it for cash!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The micro-SD card in Derek’s wallet and the USB registry logs sealed his conviction. Derek was arrested for fraud and expelled from the university faculty."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Student Sam Patel was expelled on suspicion of hacking. Derek kept his fifteen thousand dollars and continued his academic career."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The university canceled the exam and blamed foreign internet hackers. Derek quietly spent his illicit cash on his gambling debts."}]'::jsonb,
  '{"intros":["The final medical licensing exam was leaked online twenty-four hours before testing began.","Case file story_020: The final medical licensing exam was leaked online twenty-four hours before testing began. Look closely at every clue.","Trouble begins in St. Jude University, Dean’s Office, oak paneling and heavy brass bookcases. The final medical licensing exam was leaked online twenty-four hours before testing began.","The mystery starts now. The final medical licensing exam was leaked online twenty-four hours before testing began. Can you solve it?"],"reveals":["Dr. Derek Cole copied the exam using a keylogger and sold it for cash!","The mystery is unraveled! Dr. Derek Cole copied the exam using a keylogger and sold it for cash!","At last, the truth comes out: Dr. Derek Cole copied the exam using a keylogger and sold it for cash!","Case resolved! Here is what happened: Dr. Derek Cole copied the exam using a keylogger and sold it for cash!"],"hints":["Pay attention to where Research Fellow Dr. Derek Cole was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_020';
DELETE FROM public.case_events WHERE case_id = 'story_020';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4848d621-19b3-5f58-bf37-e2cf50857d37',
  'story_020',
  'Dr. Derek Cole',
  'Research Fellow',
  'Charming, ambitious, expensive watch, always carrying a leather satchel',
  'I was proctoring mock lab exams in the science hall all afternoon.',
  'Gambled away his university research stipend on online poker.',
  'Science lecture hall 2B',
  'Had access to the hallway outside the Dean’s executive suite',
  'The Dean leaves his laptop plugged in during the Tuesday faculty luncheon.',
  'Did not realize his keylogger left a unique MAC address in the laptop registry.',
  '👨‍⚕️',
  '["I was proctoring mock lab exams in the science hall all afternoon.","\"I was proctoring mock lab exams in the science hall all afternoon.\"","Listen to me: I was proctoring mock lab exams in the science hall all afternoon.","I tell you the truth: I was proctoring mock lab exams in the science hall all afternoon."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f721176a-b6cf-52fa-98a3-fce4e00b5fc2',
  'story_020',
  'Dean Evelyn Bradley',
  'Dean of Medicine',
  'Stern, uncompromising, uncompromising defender of academic integrity',
  'The exam file was encrypted on my personal laptop with a 16-character password.',
  'She wrote her laptop password on a sticky note under her keyboard.',
  'Attending the weekly faculty lunch in the dining commons',
  'Sole author of the confidential medical licensing exam',
  'Only three people had keys to her executive office.',
  'Did not notice a tiny rubber dust cap left behind near her USB port.',
  '👩‍🏫',
  '["The exam file was encrypted on my personal laptop with a 16-character password.","\"The exam file was encrypted on my personal laptop with a 16-character password.\"","Listen to me: The exam file was encrypted on my personal laptop with a 16-character password.","I tell you the truth: The exam file was encrypted on my personal laptop with a 16-character password."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2d3e9da7-5a21-5af0-b516-2d63a4f18e81',
  'story_020',
  'Samir "Sam" Patel',
  'Student Council President',
  'Stressed, studious, carrying stacks of textbooks and highlighters',
  'I was in the library cramming for the pathology exam all night.',
  'He was approached by the buyers to distribute the leaked test sheets.',
  'Library 4th floor study carrel',
  'Top student representative who petitioned for exam date changes',
  'A student group chat was offering the exam answers for two thousand dollars each.',
  'Did not know which faculty member was supplying the leaked test.',
  '🎓',
  '["I was in the library cramming for the pathology exam all night.","\"I was in the library cramming for the pathology exam all night.\"","Listen to me: I was in the library cramming for the pathology exam all night.","I tell you the truth: I was in the library cramming for the pathology exam all night."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6393bbdc-0891-5ce5-aca6-8c1766f3107b',
  'story_020',
  'Detective Frank Ross',
  'Cyber Crimes Investigator',
  'Dry, methodical, stares at terminal log screens for hours',
  'This wasn’t a network hack from the outside. A physical device was plugged into the laptop port at 1:14 PM.',
  'Graduated from St. Jude University twenty years prior.',
  'Dispatched to the campus after the exam appeared on the web forum',
  'Leading the digital forensic examination',
  'Found hardware registration logs for a "KeySpy Pro" USB drive.',
  'Did not immediately locate where the physical keylogger was hidden.',
  '💻',
  '["This wasn’t a network hack from the outside. A physical device was plugged into the laptop port at 1:14 PM.","\"This wasn’t a network hack from the outside. A physical device was plugged into the laptop port at 1:14 PM.\"","Listen to me: This wasn’t a network hack from the outside. A physical device was plugged into the laptop port at 1:14 PM.","I tell you the truth: This wasn’t a network hack from the outside. A physical device was plugged into the laptop port at 1:14 PM."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '122c528c-7e8a-5bbc-a2fc-84af078b9ea8',
  'story_020',
  'ev_1',
  1,
  '01:14 PM',
  'A tiny black rubber USB port dust cap is dropped under the mahogany desk.',
  'A tiny black rubber USB port dust cap is dropped under the mahogany desk.',
  'A USB peripheral was rapidly connected to the Dean’s laptop.',
  'USB Dust Cap',
  'Black silicone protective cap from a miniature USB flash drive.',
  '["Pen Cap","Eraser","Earplug"]'::jsonb,
  'USB Dust Cap',
  '["usb dust cap","cap","usb cap","dust cap","rubber cap"]'::jsonb,
  'A tiny protective rubber cover used to shield USB plugs from dust.',
  'ev_2',
  true,
  '{"descriptions":["A tiny black rubber USB port dust cap is dropped under the mahogany desk.","At 01:14 PM: A tiny black rubber USB port dust cap is dropped under the mahogany desk.","Notice this clue: A tiny black rubber USB port dust cap is dropped under the mahogany desk."],"hints":["A tiny protective rubber cover used to shield USB plugs from dust.","Clue hint: Think about usb dust cap.","Search for: a usb peripheral was rapidly connected to the dean’s laptop."],"clues":["USB Dust Cap","Item: USB Dust Cap","Clue Word: USB Dust Cap"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '10db190b-6b48-5a24-af3e-4cff3309c384',
  'story_020',
  'ev_2',
  2,
  '01:16 PM',
  'The Windows registry logs a connection for hardware device "KeySpy Pro".',
  'The Windows registry logs a connection for hardware device "KeySpy Pro".',
  'A hardware keylogger was deployed to record the Dean’s keystrokes.',
  'Keylogger Device',
  'Digital device entry log in the laptop system registry.',
  '["Printer Cable","Webcam","Mouse"]'::jsonb,
  'Keylogger Device',
  '["keylogger device","keylogger","usb device","spy device","hardware keylogger"]'::jsonb,
  'A secret electronic tool that records every letter typed on a keyboard.',
  'ev_3',
  false,
  '{"descriptions":["The Windows registry logs a connection for hardware device \"KeySpy Pro\".","At 01:16 PM: The Windows registry logs a connection for hardware device \"KeySpy Pro\".","Notice this clue: The Windows registry logs a connection for hardware device \"KeySpy Pro\"."],"hints":["A secret electronic tool that records every letter typed on a keyboard.","Clue hint: Think about keylogger device.","Search for: a hardware keylogger was deployed to record the dean’s keystrokes."],"clues":["Keylogger Device","Item: Keylogger Device","Clue Word: Keylogger Device"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4177022a-e386-5282-b85f-89f86157ff27',
  'story_020',
  'ev_3',
  3,
  '01:22 PM',
  'A 64GB micro-SD memory card is packed with the medical exam PDF.',
  'A 64GB micro-SD memory card is packed with the medical exam PDF.',
  'The exam file was exported to a micro-SD card for quick transport.',
  'Micro-SD Card',
  'Tiny black memory card found inside Derek’s leather wallet.',
  '["Floppy Disk","CD Disc","Audio Cassette"]'::jsonb,
  'Micro-SD Card',
  '["micro-sd card","sd card","micro sd","memory card","card"]'::jsonb,
  'A fingernail-sized plastic chip used to store files in phones and cameras.',
  'ev_4',
  false,
  '{"descriptions":["A 64GB micro-SD memory card is packed with the medical exam PDF.","At 01:22 PM: A 64GB micro-SD memory card is packed with the medical exam PDF.","Notice this clue: A 64GB micro-SD memory card is packed with the medical exam PDF."],"hints":["A fingernail-sized plastic chip used to store files in phones and cameras.","Clue hint: Think about micro-sd card.","Search for: the exam file was exported to a micro-sd card for quick transport."],"clues":["Micro-SD Card","Item: Micro-SD Card","Clue Word: Micro-SD Card"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '16bd332b-96f2-5669-b98d-013c0a71e55f',
  'story_020',
  'ev_4',
  4,
  '01:25 PM',
  'A yellow sticky note with the Dean’s password was lifted and replaced.',
  'A yellow sticky note with the Dean’s password was lifted and replaced.',
  'The thief copied the password: "Hippocrates_2024!".',
  'Sticky Note',
  'Yellow adhesive paper found stuck beneath the desktop keyboard.',
  '["Business Card","Receipt","Bookmark"]'::jsonb,
  'Sticky Note',
  '["sticky note","note","password note","paper"]'::jsonb,
  'A small square of colored paper with a sticky edge for reminders.',
  'ev_5',
  false,
  '{"descriptions":["A yellow sticky note with the Dean’s password was lifted and replaced.","At 01:25 PM: A yellow sticky note with the Dean’s password was lifted and replaced.","Notice this clue: A yellow sticky note with the Dean’s password was lifted and replaced."],"hints":["A small square of colored paper with a sticky edge for reminders.","Clue hint: Think about sticky note.","Search for: the thief copied the password: \"hippocrates_2024!\"."],"clues":["Sticky Note","Item: Sticky Note","Clue Word: Sticky Note"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2416c4ff-87c0-5dd8-87b3-fee4e7caa8ff',
  'story_020',
  'ev_5',
  5,
  '01:35 PM',
  'A group chat screenshot on Telegram shows exam question #12 for sale.',
  'A group chat screenshot on Telegram shows exam question #12 for sale.',
  'The leaked exam was distributed through an encrypted group channel.',
  'Chat Screenshot',
  'Printed smartphone screenshot showing test answers and price lists.',
  '["Newspaper","Textbook","Receipt"]'::jsonb,
  'Chat Screenshot',
  '["chat screenshot","screenshot","message","chat log"]'::jsonb,
  'An image captured from a phone or computer screen showing messages.',
  'ev_6',
  true,
  '{"descriptions":["A group chat screenshot on Telegram shows exam question #12 for sale.","At 01:35 PM: A group chat screenshot on Telegram shows exam question #12 for sale.","Notice this clue: A group chat screenshot on Telegram shows exam question #12 for sale."],"hints":["An image captured from a phone or computer screen showing messages.","Clue hint: Think about chat screenshot.","Search for: the leaked exam was distributed through an encrypted group channel."],"clues":["Chat Screenshot","Item: Chat Screenshot","Clue Word: Chat Screenshot"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e54e31da-100d-5e65-a4ea-85b580218916',
  'story_020',
  'ev_6',
  6,
  '02:15 PM',
  'An envelope containing fifteen thousand dollars in cash is in Derek’s desk.',
  'An envelope containing fifteen thousand dollars in cash is in Derek’s desk.',
  'The upfront payment collected from wealthy medical students.',
  'Cash Stash',
  'Bank envelope filled with twenty and fifty-dollar bills.',
  '["Checkbook","Credit Card","Gold Coin"]'::jsonb,
  'Cash Stash',
  '["cash stash","cash","money","envelope"]'::jsonb,
  'A bundle of physical paper currency hidden away.',
  'ev_7',
  false,
  '{"descriptions":["An envelope containing fifteen thousand dollars in cash is in Derek’s desk.","At 02:15 PM: An envelope containing fifteen thousand dollars in cash is in Derek’s desk.","Notice this clue: An envelope containing fifteen thousand dollars in cash is in Derek’s desk."],"hints":["A bundle of physical paper currency hidden away.","Clue hint: Think about cash stash.","Search for: the upfront payment collected from wealthy medical students."],"clues":["Cash Stash","Item: Cash Stash","Clue Word: Cash Stash"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '41725a48-8c06-59cc-bbe8-8ad2cd62a340',
  'story_020',
  'ev_7',
  7,
  '02:40 PM',
  'A master brass office key is found on Derek Cole’s personal key ring.',
  'A master brass office key is found on Derek Cole’s personal key ring.',
  'Derek acquired a maintenance master key to access administrative rooms.',
  'Master Office Key',
  'Stamped brass key engraved with university crest and "MASTER A".',
  '["Car Key","Padlock Key","Bicycle Key"]'::jsonb,
  'Master Office Key',
  '["master office key","key","master key","office key","brass key"]'::jsonb,
  'A special key that can open every door in a building.',
  'ev_8',
  false,
  '{"descriptions":["A master brass office key is found on Derek Cole’s personal key ring.","At 02:40 PM: A master brass office key is found on Derek Cole’s personal key ring.","Notice this clue: A master brass office key is found on Derek Cole’s personal key ring."],"hints":["A special key that can open every door in a building.","Clue hint: Think about master office key.","Search for: derek acquired a maintenance master key to access administrative rooms."],"clues":["Master Office Key","Item: Master Office Key","Clue Word: Master Office Key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0334d352-3754-5447-a595-f9dc55107351',
  'story_020',
  'ev_8',
  8,
  '03:10 PM',
  'A laptop screen displaying the Dean’s desktop wallpaper at 1:14 PM.',
  'A laptop screen displaying the Dean’s desktop wallpaper at 1:14 PM.',
  'The exact time of unauthorized access matches Derek’s hallway passage.',
  'Dean Laptop',
  'Silver laptop with system logs proving physical file extraction.',
  '["Desktop Monitor","Tablet","Smartphone"]'::jsonb,
  'Dean Laptop',
  '["dean laptop","laptop","computer"]'::jsonb,
  'A portable clamshell computer with a screen and keyboard.',
  NULL,
  true,
  '{"descriptions":["A laptop screen displaying the Dean’s desktop wallpaper at 1:14 PM.","At 03:10 PM: A laptop screen displaying the Dean’s desktop wallpaper at 1:14 PM.","Notice this clue: A laptop screen displaying the Dean’s desktop wallpaper at 1:14 PM."],"hints":["A portable clamshell computer with a screen and keyboard.","Clue hint: Think about dean laptop.","Search for: the exact time of unauthorized access matches derek’s hallway passage."],"clues":["Dean Laptop","Item: Dean Laptop","Clue Word: Dean Laptop"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_021 — THE PHARMACY COLD STORAGE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_021',
  'The Pharmacy Cold Storage',
  'Investigation',
  'BioPharm Research Facility, subterranean sub-zero cold room, frost on steel walls',
  'Fifty vials of a revolutionary cancer treatment were replaced with ordinary saline water.',
  '[{"name":"Nina Bradley","role":"Senior Lab Technician","alibi":"In the centrifuging lab preparing buffer solutions","avatar":"🥼"},{"name":"Dr. Robert Chen","role":"Research Director","alibi":"Attending an executive board dinner across town","avatar":"🔬"},{"name":"Leo Morales","role":"Refrigeration Maintenance Worker","alibi":"Mechanical room below the laboratory wing","avatar":"❄️"},{"name":"Agent Kelly Vance","role":"Pharmaceutical Fraud Investigator","alibi":"Dispatched to the lab when clinical tests yielded zero active agents","avatar":"🔍"}]'::jsonb,
  'Technician Nina Bradley used a silicone mold of her supervisor’s thumbprint to bypass the biometric door. During the scheduled ten-minute defrost cycle, she replaced fifty active peptide vials with saline bottles and hid the medicine in an insulated lunch cooler.',
  'Lab Technician Nina Bradley',
  'Nina was bribed by a rival pharmaceutical firm to steal the active compound formula.',
  '[{"time":"05:30 PM","event":"Dr. Chen locks the peptide vials in Cold Vault 3 and leaves for dinner."},{"time":"06:45 PM","event":"The automated defrost cycle begins, warming the outer vault."},{"time":"06:48 PM","event":"Nina uses a silicone thumbprint to open the biometric scanner."},{"time":"06:51 PM","event":"Fifty active vials are swapped with identical saline bottles."},{"time":"07:30 AM","event":"Lab testing reveals the vials contain pure salt water."}]'::jsonb,
  '[{"id":"ev1","title":"Silicone Thumbprint Mold","detail":"Found behind the extinguisher; carries Dr. Chen’s fingerprint ridges and Nina’s DNA."},{"id":"ev2","title":"Hand-Held Vial Crimper","detail":"Discovered in Nina’s workstation with blue aluminum paint chips."},{"id":"ev3","title":"Insulated Cooler in Nina’s Locker","detail":"Contains the fifty authentic amber peptide vials packed on dry ice."},{"id":"ev4","title":"ChronoMed Wire Transfer Slip","detail":"Confirms an eighty-thousand-dollar payout for industrial espionage."}]'::jsonb,
  '[{"order":1,"title":"Silicone Thumbprint","text":"Fake fingerprint mold used to bypass the biometric door lock."},{"order":2,"title":"Saline Vials","text":"Fifty decoy bottles of salt water left in place of the real medicine."},{"order":3,"title":"Vial Crimper","text":"Tool used to seal aluminum caps onto the replacement bottles."},{"order":4,"title":"Insulated Cooler","text":"Thermal lunch box used to transport the freezing medication."},{"order":5,"title":"Test Strips","text":"Chemical indicator strips proving the vials were switched to saline."},{"order":6,"title":"Wire Transfer Slip","text":"Bank document proving a rival firm paid eighty thousand dollars."}]'::jsonb,
  'Maintenance worker Leo had freon on his clothes.: He was fixing a compressor leak in the basement.; Dr. Chen forgot his laptop at the restaurant.: Distracted by dinner, but he was physically miles away.',
  'Blame the refrigeration repairman or claim the chemical compound naturally degraded.',
  'NORMAL',
  'Who bypassed the biometrics and swapped the experimental vials in Cold Vault 3?',
  '[{"character":"Nina Bradley","secret":"Received a wire transfer of eighty thousand dollars from a competitor."},{"character":"Dr. Robert Chen","secret":"He left his wine glass on his desk where Nina lifted his thumbprint."},{"character":"Leo Morales","secret":"He forgot to log the compressor pressure drop at 7:00 PM."},{"character":"Agent Kelly Vance","secret":"Investigating industrial espionage leaks from BioPharm for six months."}]'::jsonb,
  '[{"lead":"Maintenance worker Leo had freon on his clothes.","explanation":"He was fixing a compressor leak in the basement."},{"lead":"Dr. Chen forgot his laptop at the restaurant.","explanation":"Distracted by dinner, but he was physically miles away."}]'::jsonb,
  '{"wrongTheories":["The experimental cancer peptide naturally broke down due to a cooling malfunction.","Maintenance worker Leo stole the vials to sell on the black market."],"correctTheory":"Technician Nina Bradley used a silicone mold of Dr. Chen’s thumbprint to open Cold Vault 3, swapped fifty active medicine vials for saline using a vial crimper, and hid the stolen treatment in her lunch cooler for an eighty-thousand-dollar bribe."}'::jsonb,
  'Technician Nina Bradley stole the medicine using a fake thumbprint for a bribe!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Investigators searched Nina’s locker and recovered all fifty intact peptide vials in her cooler. Nina was arrested for corporate espionage and grand theft."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Maintenance worker Leo was fired for system negligence. Nina delivered the vials to ChronoMed and fled the country."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The company believed the batch was spoiled by a temperature spike. Nina kept her bribe money and the drug research had to start over."}]'::jsonb,
  '{"intros":["Fifty vials of a revolutionary cancer treatment were replaced with ordinary saline water.","Case file story_021: Fifty vials of a revolutionary cancer treatment were replaced with ordinary saline water. Look closely at every clue.","Trouble begins in BioPharm Research Facility, subterranean sub-zero cold room, frost on steel walls. Fifty vials of a revolutionary cancer treatment were replaced with ordinary saline water.","The mystery starts now. Fifty vials of a revolutionary cancer treatment were replaced with ordinary saline water. Can you solve it?"],"reveals":["Technician Nina Bradley stole the medicine using a fake thumbprint for a bribe!","The mystery is unraveled! Technician Nina Bradley stole the medicine using a fake thumbprint for a bribe!","At last, the truth comes out: Technician Nina Bradley stole the medicine using a fake thumbprint for a bribe!","Case resolved! Here is what happened: Technician Nina Bradley stole the medicine using a fake thumbprint for a bribe!"],"hints":["Pay attention to where Lab Technician Nina Bradley was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_021';
DELETE FROM public.case_events WHERE case_id = 'story_021';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b0fec0d1-2771-5a7a-a9a8-ad80b14109dc',
  'story_021',
  'Nina Bradley',
  'Senior Lab Technician',
  'Quiet, meticulous, wearing sterile white scrubs and latex gloves',
  'I verified the inventory at 6:00 PM and all seals were intact.',
  'Received a wire transfer of eighty thousand dollars from a competitor.',
  'In the centrifuging lab preparing buffer solutions',
  'Had daily access to Cold Vault 3 prep protocols',
  'The defrost cycle warms the vault to 2 degrees Celsius for ten minutes.',
  'Left a drop of silicone casting gel in the biometric reader recess.',
  '🥼',
  '["I verified the inventory at 6:00 PM and all seals were intact.","\"I verified the inventory at 6:00 PM and all seals were intact.\"","Listen to me: I verified the inventory at 6:00 PM and all seals were intact.","I tell you the truth: I verified the inventory at 6:00 PM and all seals were intact."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4fcb15fe-6014-5640-bccb-c42e4de96b79',
  'story_021',
  'Dr. Robert Chen',
  'Research Director',
  'Workaholic, demanding, wears thick tortoiseshell glasses',
  'Only my biometric thumbprint can unlock the sub-zero cryogenic chamber.',
  'He left his wine glass on his desk where Nina lifted his thumbprint.',
  'Attending an executive board dinner across town',
  'Inventor of the synthesized cancer peptide',
  'The active vials contain a faint iridescent amber tint unlike clear saline.',
  'Did not know Nina possessed duplicate sterile vial caps.',
  '🔬',
  '["Only my biometric thumbprint can unlock the sub-zero cryogenic chamber.","\"Only my biometric thumbprint can unlock the sub-zero cryogenic chamber.\"","Listen to me: Only my biometric thumbprint can unlock the sub-zero cryogenic chamber.","I tell you the truth: Only my biometric thumbprint can unlock the sub-zero cryogenic chamber."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'bc7819f0-1c17-5cb0-b54c-d29a66023b27',
  'story_021',
  'Leo Morales',
  'Refrigeration Maintenance Worker',
  'Practical, wearing heavy winter overalls and carrying pressure gauges',
  'I was servicing the freon compressor in the mechanical basement all evening.',
  'He forgot to log the compressor pressure drop at 7:00 PM.',
  'Mechanical room below the laboratory wing',
  'Responsible for keeping the vaults at minus 80 degrees Celsius',
  'The cold vault door was opened for four minutes during the defrost window.',
  'Did not see who stepped into the sub-zero room.',
  '❄️',
  '["I was servicing the freon compressor in the mechanical basement all evening.","\"I was servicing the freon compressor in the mechanical basement all evening.\"","Listen to me: I was servicing the freon compressor in the mechanical basement all evening.","I tell you the truth: I was servicing the freon compressor in the mechanical basement all evening."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c5cf4abe-c2eb-5eb4-8ee6-5ed886f2d50f',
  'story_021',
  'Agent Kelly Vance',
  'Pharmaceutical Fraud Investigator',
  'Analytical, sharp, armed with chemical test strips',
  'The liquid in these fifty vials is sterile saline. The active peptide is completely gone.',
  'Investigating industrial espionage leaks from BioPharm for six months.',
  'Dispatched to the lab when clinical tests yielded zero active agents',
  'Leading the industrial espionage probe',
  'The swap required professional crimping tools to reseal the aluminum caps.',
  'Did not know Nina had the vials packed in her car trunk.',
  '🔍',
  '["The liquid in these fifty vials is sterile saline. The active peptide is completely gone.","\"The liquid in these fifty vials is sterile saline. The active peptide is completely gone.\"","Listen to me: The liquid in these fifty vials is sterile saline. The active peptide is completely gone.","I tell you the truth: The liquid in these fifty vials is sterile saline. The active peptide is completely gone."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1585c9f1-77ca-5062-862a-9d2612d6befd',
  'story_021',
  'ev_1',
  1,
  '06:48 PM',
  'A translucent silicone thumb mold is dropped behind the fire extinguisher.',
  'A translucent silicone thumb mold is dropped behind the fire extinguisher.',
  'The biometric fingerprint reader was spoofed using a cast mold.',
  'Silicone Thumbprint',
  'Flesh-colored silicone prosthetic displaying Dr. Chen’s fingerprint ridges.',
  '["Rubber Glove","Adhesive Tape","Key Fob"]'::jsonb,
  'Silicone Thumbprint',
  '["silicone thumbprint","thumbprint","silicone print","fake fingerprint","print"]'::jsonb,
  'A flexible rubber copy of a human finger used to fool biometric scanners.',
  'ev_2',
  true,
  '{"descriptions":["A translucent silicone thumb mold is dropped behind the fire extinguisher.","At 06:48 PM: A translucent silicone thumb mold is dropped behind the fire extinguisher.","Notice this clue: A translucent silicone thumb mold is dropped behind the fire extinguisher."],"hints":["A flexible rubber copy of a human finger used to fool biometric scanners.","Clue hint: Think about silicone thumbprint.","Search for: the biometric fingerprint reader was spoofed using a cast mold."],"clues":["Silicone Thumbprint","Item: Silicone Thumbprint","Clue Word: Silicone Thumbprint"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '217fd13c-74bb-5740-aa75-cee9240c71d3',
  'story_021',
  'ev_2',
  2,
  '06:50 PM',
  'Glass medicine vials with blue rubber stoppers sit on the cryogenic shelf.',
  'Glass medicine vials with blue rubber stoppers sit on the cryogenic shelf.',
  'The replacement vials contained sterile sodium chloride saline solution.',
  'Saline Vials',
  'Fifty 10ml glass vials with crimped aluminum blue caps containing saline.',
  '["Test Tubes","Beakers","Syringes"]'::jsonb,
  'Saline Vials',
  '["saline vials","vials","medicine vials","bottles"]'::jsonb,
  'Small glass bottles used to hold injectable liquid medicine.',
  'ev_3',
  false,
  '{"descriptions":["Glass medicine vials with blue rubber stoppers sit on the cryogenic shelf.","At 06:50 PM: Glass medicine vials with blue rubber stoppers sit on the cryogenic shelf.","Notice this clue: Glass medicine vials with blue rubber stoppers sit on the cryogenic shelf."],"hints":["Small glass bottles used to hold injectable liquid medicine.","Clue hint: Think about saline vials.","Search for: the replacement vials contained sterile sodium chloride saline solution."],"clues":["Saline Vials","Item: Saline Vials","Clue Word: Saline Vials"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '69f5c868-1b74-5b24-a912-fbed91ed1894',
  'story_021',
  'ev_3',
  3,
  '06:52 PM',
  'A hand-held aluminum vial crimper is tucked inside a drawer.',
  'A hand-held aluminum vial crimper is tucked inside a drawer.',
  'The thief resealed the replacement vials with an official tool.',
  'Vial Crimper',
  'Stainless steel hand tool used to seal aluminum caps onto glass vials.',
  '["Pliers","Wrench","Wire Stripper"]'::jsonb,
  'Vial Crimper',
  '["vial crimper","crimper","crimp tool","tool"]'::jsonb,
  'A metal tool used in labs to clamp aluminum seals onto medicine bottles.',
  'ev_4',
  false,
  '{"descriptions":["A hand-held aluminum vial crimper is tucked inside a drawer.","At 06:52 PM: A hand-held aluminum vial crimper is tucked inside a drawer.","Notice this clue: A hand-held aluminum vial crimper is tucked inside a drawer."],"hints":["A metal tool used in labs to clamp aluminum seals onto medicine bottles.","Clue hint: Think about vial crimper.","Search for: the thief resealed the replacement vials with an official tool."],"clues":["Vial Crimper","Item: Vial Crimper","Clue Word: Vial Crimper"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'aefc1e07-7eec-5896-9f7a-e1eaac250ee3',
  'story_021',
  'ev_4',
  4,
  '06:55 PM',
  'An insulated blue thermal lunch cooler sits inside Nina’s locker.',
  'An insulated blue thermal lunch cooler sits inside Nina’s locker.',
  'The cooler contained frozen gel packs and the stolen amber peptide vials.',
  'Insulated Cooler',
  'Blue nylon cooler bag packed with sub-zero dry-ice gel packs.',
  '["Cardboard Box","Backpack","Paper Bag"]'::jsonb,
  'Insulated Cooler',
  '["insulated cooler","cooler","lunch cooler","bag"]'::jsonb,
  'A padded box or bag designed to keep food or drinks ice cold.',
  'ev_5',
  false,
  '{"descriptions":["An insulated blue thermal lunch cooler sits inside Nina’s locker.","At 06:55 PM: An insulated blue thermal lunch cooler sits inside Nina’s locker.","Notice this clue: An insulated blue thermal lunch cooler sits inside Nina’s locker."],"hints":["A padded box or bag designed to keep food or drinks ice cold.","Clue hint: Think about insulated cooler.","Search for: the cooler contained frozen gel packs and the stolen amber peptide vials."],"clues":["Insulated Cooler","Item: Insulated Cooler","Clue Word: Insulated Cooler"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f60ee5ac-b119-5f11-a86d-6aee37641bba',
  'story_021',
  'ev_5',
  5,
  '07:05 PM',
  'Chemical test strips dip into the solution and turn neutral yellow.',
  'Chemical test strips dip into the solution and turn neutral yellow.',
  'Confirms zero presence of the synthetic active cancer peptide.',
  'Test Strips',
  'Paper diagnostic dipsticks showing absence of active proteins.',
  '["Litmus Paper","Bandage","Thermometer"]'::jsonb,
  'Test Strips',
  '["test strips","strips","diagnostic strips","paper strips"]'::jsonb,
  'Small treated paper strips that change color to test chemical liquids.',
  'ev_6',
  true,
  '{"descriptions":["Chemical test strips dip into the solution and turn neutral yellow.","At 07:05 PM: Chemical test strips dip into the solution and turn neutral yellow.","Notice this clue: Chemical test strips dip into the solution and turn neutral yellow."],"hints":["Small treated paper strips that change color to test chemical liquids.","Clue hint: Think about test strips.","Search for: confirms zero presence of the synthetic active cancer peptide."],"clues":["Test Strips","Item: Test Strips","Clue Word: Test Strips"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dcd36742-869b-5bc3-9962-9ed7c412feed',
  'story_021',
  'ev_6',
  6,
  '07:20 PM',
  'A wire transfer receipt for eighty thousand dollars is found in Nina’s purse.',
  'A wire transfer receipt for eighty thousand dollars is found in Nina’s purse.',
  'Nina was paid by rival firm ChronoMed to deliver the active vials.',
  'Wire Transfer Slip',
  'Foreign banking confirmation showing deposit from ChronoMed Ltd.',
  '["Checkbook","Receipt","Stock Certificate"]'::jsonb,
  'Wire Transfer Slip',
  '["wire transfer slip","slip","wire transfer","receipt","bank slip"]'::jsonb,
  'A paper slip confirming a large electronic bank deposit.',
  'ev_7',
  false,
  '{"descriptions":["A wire transfer receipt for eighty thousand dollars is found in Nina’s purse.","At 07:20 PM: A wire transfer receipt for eighty thousand dollars is found in Nina’s purse.","Notice this clue: A wire transfer receipt for eighty thousand dollars is found in Nina’s purse."],"hints":["A paper slip confirming a large electronic bank deposit.","Clue hint: Think about wire transfer slip.","Search for: nina was paid by rival firm chronomed to deliver the active vials."],"clues":["Wire Transfer Slip","Item: Wire Transfer Slip","Clue Word: Wire Transfer Slip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1f9b1a4e-5809-5538-9bd8-50bd371da6bc',
  'story_021',
  'ev_7',
  7,
  '07:35 PM',
  'The biometric scanner display shows: "ACCESS GRANTED: DR. CHEN 18:48".',
  'The biometric scanner display shows: "ACCESS GRANTED: DR. CHEN 18:48".',
  'The access log proves Dr. Chen’s identity was used while he was at dinner.',
  'Biometric Scanner',
  'Wall-mounted optical fingerprint reader with green verification LED.',
  '["Keypad","Card Reader","Retina Scanner"]'::jsonb,
  'Biometric Scanner',
  '["biometric scanner","scanner","fingerprint reader","reader"]'::jsonb,
  'An electronic security device that scans human fingerprints to unlock doors.',
  'ev_8',
  false,
  '{"descriptions":["The biometric scanner display shows: \"ACCESS GRANTED: DR. CHEN 18:48\".","At 07:35 PM: The biometric scanner display shows: \"ACCESS GRANTED: DR. CHEN 18:48\".","Notice this clue: The biometric scanner display shows: \"ACCESS GRANTED: DR. CHEN 18:48\"."],"hints":["An electronic security device that scans human fingerprints to unlock doors.","Clue hint: Think about biometric scanner.","Search for: the access log proves dr. chen’s identity was used while he was at dinner."],"clues":["Biometric Scanner","Item: Biometric Scanner","Clue Word: Biometric Scanner"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '174ed47d-d6d4-50d6-a0c6-6be72d8542d0',
  'story_021',
  'ev_8',
  8,
  '08:00 PM',
  'A discarded dry-ice pack is found sweating on the lab prep counter.',
  'A discarded dry-ice pack is found sweating on the lab prep counter.',
  'The thief transferred the medicine into portable sub-zero packaging.',
  'Dry-Ice Pack',
  'Foil refrigerant pouch frozen to minus 78 degrees Celsius.',
  '["Ice Cube","Cold Towel","Plastic Bottle"]'::jsonb,
  'Dry-Ice Pack',
  '["dry-ice pack","ice pack","dry ice pack","gel pack","refrigerant"]'::jsonb,
  'A frozen pack used in medical shipping to keep items extremely cold.',
  NULL,
  true,
  '{"descriptions":["A discarded dry-ice pack is found sweating on the lab prep counter.","At 08:00 PM: A discarded dry-ice pack is found sweating on the lab prep counter.","Notice this clue: A discarded dry-ice pack is found sweating on the lab prep counter."],"hints":["A frozen pack used in medical shipping to keep items extremely cold.","Clue hint: Think about dry-ice pack.","Search for: the thief transferred the medicine into portable sub-zero packaging."],"clues":["Dry-Ice Pack","Item: Dry-Ice Pack","Clue Word: Dry-Ice Pack"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_022 — THE STOLEN STRADIVARIUS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_022',
  'The Stolen Stradivarius',
  'Investigation',
  'The Symphony Hall, Backstage VIP Green Room, red velvet cushions and instrument cases',
  'A 300-year-old violin valued at ten million dollars was taken from its locked velvet case during the encore.',
  '[{"name":"Julian Vance","role":"Second Chair Violinist","alibi":"In the orchestra pit (except during the cello solo)","avatar":"🎻"},{"name":"Ariana Bell","role":"Concert Soloist","alibi":"On stage performing the encore pieces","avatar":"🎼"},{"name":"Marco Rossi","role":"Stage Manager","alibi":"Stage left control booth","avatar":"🎭"},{"name":"Inspector Chloe Bennett","role":"Fine Arts Theft Specialist","alibi":"Attending the symphony performance in row 4 of the grand tier","avatar":"🔍"}]'::jsonb,
  'Second Violinist Julian Vance left the orchestra pit during the six-minute cello solo. He entered the green room with a duplicate key, swapped the 1714 Stradivarius with a modern replica, and concealed the antique in his specialized dual-instrument violin case.',
  'Second Violinist Julian Vance',
  'Julian was failing his conservatory audit and needed money to pay gambling enforcers.',
  '[{"time":"08:30 PM","event":"Ariana performs the violin concerto to thunderous applause."},{"time":"09:10 PM","event":"The guest cellist begins a six-minute unaccompanied solo."},{"time":"09:12 PM","event":"Julian steps out of the pit into the dark backstage corridor."},{"time":"09:15 PM","event":"The Stradivarius is swapped for a replica inside the green room."},{"time":"09:40 PM","event":"Ariana unlocks Case 1 after the encore and finds the modern fake."}]'::jsonb,
  '[{"id":"ev1","title":"Monogrammed J.V. Rosin Cake","detail":"Dropped in the green room directly beside Ariana’s empty violin case."},{"id":"ev2","title":"Carbon-Fiber Double Case","detail":"Contains Julian’s practice violin on top and the 1714 Stradivarius underneath."},{"id":"ev3","title":"Loan Shark Threat Letter","detail":"Demands sixty thousand dollars by midnight, establishing Julian’s motive."},{"id":"ev4","title":"Chalk Smudge on Tuxedo","detail":"Matches the narrow stage-access stairway used during the cello solo."}]'::jsonb,
  '[{"order":1,"title":"Replica Violin","text":"Cheap modern instrument left in the case as a temporary decoy."},{"order":2,"title":"Amber Rosin","text":"Bow resin cake stamped J.V. dropped by the thief during the swap."},{"order":3,"title":"Double Violin Case","text":"Musician carrying case with two compartments used to smuggle the prize."},{"order":4,"title":"Green Room Key","text":"Duplicate backstage key found inside the violinist’s tuxedo."},{"order":5,"title":"Stradivarius Varnish","text":"300-year-old wood finish glowing under forensic blacklight."},{"order":6,"title":"Debt Demand Note","text":"Urgent debt collection letter demanding sixty thousand dollars."}]'::jsonb,
  'Soloist Ariana had twelve million dollars in insurance.: Standard coverage required by the museum foundation.; Stage manager Marco Rossi took horse bets on his headset.: A gambling hobby, but he stayed in the control booth all night.',
  'Blame the stage manager Marco or claim an autograph seeker snuck through the stage door.',
  'NORMAL',
  'Who swapped the antique Stradivarius for a cheap replica while the applause roared?',
  '[{"character":"Julian Vance","secret":"He owes sixty thousand dollars to loan sharks who threatened him yesterday."},{"character":"Ariana Bell","secret":"She was insured for twelve million dollars if the instrument was lost."},{"character":"Marco Rossi","secret":"He was taking bets on horse races from his backstage intercom desk."},{"character":"Inspector Chloe Bennett","secret":"Trained as a classical violinist in her youth."}]'::jsonb,
  '[{"lead":"Soloist Ariana had twelve million dollars in insurance.","explanation":"Standard coverage required by the museum foundation."},{"lead":"Stage manager Marco Rossi took horse bets on his headset.","explanation":"A gambling hobby, but he stayed in the control booth all night."}]'::jsonb,
  '{"wrongTheories":["Soloist Ariana staged the theft herself to claim twelve million in insurance.","An obsessed fan snuck backstage through the loading bay and stole the violin."],"correctTheory":"Second Violinist Julian Vance left the orchestra pit during the six-minute cello solo, used a duplicate key to swap the Stradivarius for a cheap replica, and hid the antique in his double violin case to pay his gambling debts."}'::jsonb,
  'Violinist Julian Vance swapped the Stradivarius during the cello solo!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Inspector Bennett discovered the genuine Stradivarius in Julian’s double case. The priceless instrument was returned to Ariana and Julian was arrested."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Stage manager Marco was arrested for holding master keys. Julian carried the Stradivarius out in his case and sold it to an underground fence."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The insurance company paid out, believing an international cat burglar pulled off the heist. Julian paid his debts and left the symphony."}]'::jsonb,
  '{"intros":["A 300-year-old violin valued at ten million dollars was taken from its locked velvet case during the encore.","Case file story_022: A 300-year-old violin valued at ten million dollars was taken from its locked velvet case during the encore. Look closely at every clue.","Trouble begins in The Symphony Hall, Backstage VIP Green Room, red velvet cushions and instrument cases. A 300-year-old violin valued at ten million dollars was taken from its locked velvet case during the encore.","The mystery starts now. A 300-year-old violin valued at ten million dollars was taken from its locked velvet case during the encore. Can you solve it?"],"reveals":["Violinist Julian Vance swapped the Stradivarius during the cello solo!","The mystery is unraveled! Violinist Julian Vance swapped the Stradivarius during the cello solo!","At last, the truth comes out: Violinist Julian Vance swapped the Stradivarius during the cello solo!","Case resolved! Here is what happened: Violinist Julian Vance swapped the Stradivarius during the cello solo!"],"hints":["Pay attention to where Second Violinist Julian Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_022';
DELETE FROM public.case_events WHERE case_id = 'story_022';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b21a3b92-c12a-56a7-9fb2-e60bbcb56800',
  'story_022',
  'Julian Vance',
  'Second Chair Violinist',
  'Envious, talented, polished veneer hiding desperate debts',
  'I was in the orchestra pit playing accompaniment until the final curtain call.',
  'He owes sixty thousand dollars to loan sharks who threatened him yesterday.',
  'In the orchestra pit (except during the cello solo)',
  'Colleague of the soloist who owned the Stradivarius',
  'The solo cellist played unaccompanied for six minutes in the third movement.',
  'Did not realize he dropped a packet of amber violin rosin with his monogram.',
  '🎻',
  '["I was in the orchestra pit playing accompaniment until the final curtain call.","\"I was in the orchestra pit playing accompaniment until the final curtain call.\"","Listen to me: I was in the orchestra pit playing accompaniment until the final curtain call.","I tell you the truth: I was in the orchestra pit playing accompaniment until the final curtain call."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8b95f863-c54a-531d-936d-bde172748b31',
  'story_022',
  'Ariana Bell',
  'Concert Soloist',
  'Passionate, dramatic, weeping over the empty velvet case',
  'I locked the violin in Case 1 before returning to the stage for the standing ovation.',
  'She was insured for twelve million dollars if the instrument was lost.',
  'On stage performing the encore pieces',
  'Owner and master performer of the 1714 Stradivarius',
  'The replica violin has modern synthetic varnish that smells like pine lacquer.',
  'Did not see Julian slip into the backstage corridor.',
  '🎼',
  '["I locked the violin in Case 1 before returning to the stage for the standing ovation.","\"I locked the violin in Case 1 before returning to the stage for the standing ovation.\"","Listen to me: I locked the violin in Case 1 before returning to the stage for the standing ovation.","I tell you the truth: I locked the violin in Case 1 before returning to the stage for the standing ovation."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '152e1017-5f6b-564f-81f1-372f083b363a',
  'story_022',
  'Marco Rossi',
  'Stage Manager',
  'Stressed, headset on, holding a clipboard and master keys',
  'I controlled the stage curtain and monitored the wings the entire evening.',
  'He was taking bets on horse races from his backstage intercom desk.',
  'Stage left control booth',
  'Holds master keys to all dressing rooms and green rooms',
  'Saw someone in a black tuxedo slip through the green room door at 9:15 PM.',
  'Assumed it was one of the twenty orchestra musicians taking a break.',
  '🎭',
  '["I controlled the stage curtain and monitored the wings the entire evening.","\"I controlled the stage curtain and monitored the wings the entire evening.\"","Listen to me: I controlled the stage curtain and monitored the wings the entire evening.","I tell you the truth: I controlled the stage curtain and monitored the wings the entire evening."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3fda8d31-1c06-5439-9b4f-73a00d6e1b41',
  'story_022',
  'Inspector Chloe Bennett',
  'Fine Arts Theft Specialist',
  'Cultured, observant, carries an ultraviolet gemological light',
  'This replica was built in 2020. The real 1714 wood varnish glows amber under blacklight.',
  'Trained as a classical violinist in her youth.',
  'Attending the symphony performance in row 4 of the grand tier',
  'First responder when the theft was announced backstage',
  'The thief needed a specialized case large enough to hide a full-size violin.',
  'Did not know Julian’s dual case had a hidden lower velvet compartment.',
  '🔍',
  '["This replica was built in 2020. The real 1714 wood varnish glows amber under blacklight.","\"This replica was built in 2020. The real 1714 wood varnish glows amber under blacklight.\"","Listen to me: This replica was built in 2020. The real 1714 wood varnish glows amber under blacklight.","I tell you the truth: This replica was built in 2020. The real 1714 wood varnish glows amber under blacklight."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4dff27d0-4550-57ce-874c-6b0901daf75b',
  'story_022',
  'ev_1',
  1,
  '09:15 PM',
  'A modern factory violin is left resting inside the red velvet plush case.',
  'A modern factory violin is left resting inside the red velvet plush case.',
  'The instrument in the case was a cheap Chinese replica worth three hundred dollars.',
  'Replica Violin',
  'Modern spruce violin with synthetic poly-varnish and fake 1714 label.',
  '["Wooden Toy","Broken Viola","Cello Case"]'::jsonb,
  'Replica Violin',
  '["replica violin","violin","fake violin","instrument"]'::jsonb,
  'A stringed wooden musical instrument played with a horsehair bow.',
  'ev_2',
  true,
  '{"descriptions":["A modern factory violin is left resting inside the red velvet plush case.","At 09:15 PM: A modern factory violin is left resting inside the red velvet plush case.","Notice this clue: A modern factory violin is left resting inside the red velvet plush case."],"hints":["A stringed wooden musical instrument played with a horsehair bow.","Clue hint: Think about replica violin.","Search for: the instrument in the case was a cheap chinese replica worth three hundred dollars."],"clues":["Replica Violin","Item: Replica Violin","Clue Word: Replica Violin"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '00c3bf6f-c157-55d1-a123-a3f9795d2dd6',
  'story_022',
  'ev_2',
  2,
  '09:16 PM',
  'A cake of amber tree rosin with monogram "J.V." is dropped on the rug.',
  'A cake of amber tree rosin with monogram "J.V." is dropped on the rug.',
  'Julian dropped his personal violin bow rosin in the green room.',
  'Amber Rosin',
  'Translucent yellow resin block in a velvet cloth stamped J.V.',
  '["Soap Cake","Wax Cube","Amber Gem"]'::jsonb,
  'Amber Rosin',
  '["amber rosin","rosin","violin rosin","resin"]'::jsonb,
  'A hard amber cake of tree resin rubbed onto violin bows for grip.',
  'ev_3',
  false,
  '{"descriptions":["A cake of amber tree rosin with monogram \"J.V.\" is dropped on the rug.","At 09:16 PM: A cake of amber tree rosin with monogram \"J.V.\" is dropped on the rug.","Notice this clue: A cake of amber tree rosin with monogram \"J.V.\" is dropped on the rug."],"hints":["A hard amber cake of tree resin rubbed onto violin bows for grip.","Clue hint: Think about amber rosin.","Search for: julian dropped his personal violin bow rosin in the green room."],"clues":["Amber Rosin","Item: Amber Rosin","Clue Word: Amber Rosin"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8e139fe0-961c-5c35-b9aa-626f9b40c647',
  'story_022',
  'ev_3',
  3,
  '09:18 PM',
  'An oversized double-decker violin case is carried into the musician locker room.',
  'An oversized double-decker violin case is carried into the musician locker room.',
  'Julian carried a specialized dual case that holds two violins.',
  'Double Violin Case',
  'Black carbon-fiber case with two molded instrument cavities.',
  '["Guitar Case","Suitcase","Duffel Bag"]'::jsonb,
  'Double Violin Case',
  '["double violin case","case","violin case","double case","instrument case"]'::jsonb,
  'A hard protective carrying box shaped to hold musical instruments.',
  'ev_4',
  false,
  '{"descriptions":["An oversized double-decker violin case is carried into the musician locker room.","At 09:18 PM: An oversized double-decker violin case is carried into the musician locker room.","Notice this clue: An oversized double-decker violin case is carried into the musician locker room."],"hints":["A hard protective carrying box shaped to hold musical instruments.","Clue hint: Think about double violin case.","Search for: julian carried a specialized dual case that holds two violins."],"clues":["Double Violin Case","Item: Double Violin Case","Clue Word: Double Violin Case"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '967b1ffa-db55-585b-8d9a-9dcd7d00b587',
  'story_022',
  'ev_4',
  4,
  '09:20 PM',
  'A brass green room key is found hidden inside Julian’s tuxedo vest pocket.',
  'A brass green room key is found hidden inside Julian’s tuxedo vest pocket.',
  'Julian had borrowed and copied the stage manager’s key last week.',
  'Green Room Key',
  'Brass mortise key stamped "ROOM 1 - VIP".',
  '["Locker Key","Car Key","Padlock Key"]'::jsonb,
  'Green Room Key',
  '["green room key","key","brass key","room key"]'::jsonb,
  'A metal tool used to turn the lock of a backstage dressing room.',
  'ev_5',
  false,
  '{"descriptions":["A brass green room key is found hidden inside Julian’s tuxedo vest pocket.","At 09:20 PM: A brass green room key is found hidden inside Julian’s tuxedo vest pocket.","Notice this clue: A brass green room key is found hidden inside Julian’s tuxedo vest pocket."],"hints":["A metal tool used to turn the lock of a backstage dressing room.","Clue hint: Think about green room key.","Search for: julian had borrowed and copied the stage manager’s key last week."],"clues":["Green Room Key","Item: Green Room Key","Clue Word: Green Room Key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f608f0f5-6198-570d-8dba-4894f0303bbf',
  'story_022',
  'ev_5',
  5,
  '09:45 PM',
  'An ultraviolet blacklight shines on the real 1714 Stradivarius varnish.',
  'An ultraviolet blacklight shines on the real 1714 Stradivarius varnish.',
  'The genuine antique violin glows with a distinctive golden-amber fluorescence.',
  'Stradivarius Varnish',
  'Luminescent microscopic wood varnish fibers dating back three centuries.',
  '["Clear Paint","Glue Residue","Gold Dust"]'::jsonb,
  'Stradivarius Varnish',
  '["stradivarius varnish","varnish","varnish glow","antique varnish","lacquer"]'::jsonb,
  'A clear protective liquid applied to wood that dries into a glossy finish.',
  'ev_6',
  true,
  '{"descriptions":["An ultraviolet blacklight shines on the real 1714 Stradivarius varnish.","At 09:45 PM: An ultraviolet blacklight shines on the real 1714 Stradivarius varnish.","Notice this clue: An ultraviolet blacklight shines on the real 1714 Stradivarius varnish."],"hints":["A clear protective liquid applied to wood that dries into a glossy finish.","Clue hint: Think about stradivarius varnish.","Search for: the genuine antique violin glows with a distinctive golden-amber fluorescence."],"clues":["Stradivarius Varnish","Item: Stradivarius Varnish","Clue Word: Stradivarius Varnish"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6ac7b87a-d124-5372-852b-6b2e4f5a13dc',
  'story_022',
  'ev_6',
  6,
  '10:00 PM',
  'A debt demand letter for sixty thousand dollars from loan sharks is found.',
  'A debt demand letter for sixty thousand dollars from loan sharks is found.',
  'Julian faced severe physical harm if he did not pay before midnight.',
  'Debt Demand Note',
  'Threatening handwritten letter on casino stationery.',
  '["Music Sheet","Concert Ticket","Postcard"]'::jsonb,
  'Debt Demand Note',
  '["debt demand note","note","demand note","debt note","letter"]'::jsonb,
  'A written paper message demanding money under threat of violence.',
  'ev_7',
  false,
  '{"descriptions":["A debt demand letter for sixty thousand dollars from loan sharks is found.","At 10:00 PM: A debt demand letter for sixty thousand dollars from loan sharks is found.","Notice this clue: A debt demand letter for sixty thousand dollars from loan sharks is found."],"hints":["A written paper message demanding money under threat of violence.","Clue hint: Think about debt demand note.","Search for: julian faced severe physical harm if he did not pay before midnight."],"clues":["Debt Demand Note","Item: Debt Demand Note","Clue Word: Debt Demand Note"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f665689d-b266-553b-9fc2-221127a306b1',
  'story_022',
  'ev_7',
  7,
  '10:15 PM',
  'A white silk violin cover cloth embroidered with Ariana’s initials is discovered.',
  'A white silk violin cover cloth embroidered with Ariana’s initials is discovered.',
  'Julian wrapped the stolen instrument in Ariana’s protective cloth.',
  'Silk Violin Blanket',
  'Padded crimson and white silk cloth designed to cover instruments.',
  '["Cotton Towel","Handkerchief","Scarf"]'::jsonb,
  'Silk Violin Blanket',
  '["silk violin blanket","blanket","violin blanket","silk cloth","cover"]'::jsonb,
  'A soft padded fabric sheet placed over a violin inside its case.',
  'ev_8',
  false,
  '{"descriptions":["A white silk violin cover cloth embroidered with Ariana’s initials is discovered.","At 10:15 PM: A white silk violin cover cloth embroidered with Ariana’s initials is discovered.","Notice this clue: A white silk violin cover cloth embroidered with Ariana’s initials is discovered."],"hints":["A soft padded fabric sheet placed over a violin inside its case.","Clue hint: Think about silk violin blanket.","Search for: julian wrapped the stolen instrument in ariana’s protective cloth."],"clues":["Silk Violin Blanket","Item: Silk Violin Blanket","Clue Word: Silk Violin Blanket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0d97e1f8-0c08-5989-9909-2fe4f2859612',
  'story_022',
  'ev_8',
  8,
  '10:30 PM',
  'The orchestra pit stage doors show Julian’s tuxedo brushed against chalk.',
  'The orchestra pit stage doors show Julian’s tuxedo brushed against chalk.',
  'Julian slipped out during the cello solo through the narrow backstage stairs.',
  'Chalk Smudge',
  'White drywall chalk marks on the left shoulder of Julian’s tuxedo.',
  '["Paint Stain","Powder","Flour"]'::jsonb,
  'Chalk Smudge',
  '["chalk smudge","chalk","white chalk","smudge"]'::jsonb,
  'White powdery rock dust used for writing on blackboards or marking walls.',
  NULL,
  true,
  '{"descriptions":["The orchestra pit stage doors show Julian’s tuxedo brushed against chalk.","At 10:30 PM: The orchestra pit stage doors show Julian’s tuxedo brushed against chalk.","Notice this clue: The orchestra pit stage doors show Julian’s tuxedo brushed against chalk."],"hints":["White powdery rock dust used for writing on blackboards or marking walls.","Clue hint: Think about chalk smudge.","Search for: julian slipped out during the cello solo through the narrow backstage stairs."],"clues":["Chalk Smudge","Item: Chalk Smudge","Clue Word: Chalk Smudge"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_023 — THE MARATHON RUNNER'S WATER BOTTLE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_023',
  'The Marathon Runner''s Water Bottle',
  'Investigation',
  'City Marathon Mile 24 Aid Station, bustling street filled with paper cups and running bibs',
  'Olympic champion David Kross collapsed two miles from the finish line after drinking from his personal aid bottle.',
  '[{"name":"Tyler Vance","role":"David’s Head Coach","alibi":"At the coach observation stand near Mile 20","avatar":"🏃"},{"name":"David Kross","role":"Marathon Champion","alibi":"Leading the race from Mile 1 until his collapse at Mile 24","avatar":"🥇"},{"name":"Marcus Brody","role":"Rival Marathoner","alibi":"Running thirty seconds behind David along the race course","avatar":"👟"},{"name":"Dr. Natalie Perez","role":"Race Medical Director","alibi":"Operating the emergency medical tent at the finish line","avatar":"🩺"}]'::jsonb,
  'Coach Tyler Vance injected the heart-slowing drug Propranolol through the rubber nozzle of David’s numbered bottle using a hypodermic needle. When David drank at Mile 24, his heart rate plunged, causing him to collapse on live television.',
  'Coach Tyler Vance',
  'Tyler bet half a million dollars against David and had signed a lucrative contract with his rival.',
  '[{"time":"07:00 AM","event":"Coaches deliver elite personal water bottles to Aid Station 8."},{"time":"07:30 AM","event":"Tyler Vance injects Propranolol through the rubber nozzle of Bottle 4."},{"time":"08:00 AM","event":"The marathon begins in cool morning weather."},{"time":"09:12 AM","event":"David reaches Mile 24 in the lead and grabs his numbered bottle."},{"time":"09:15 AM","event":"David drinks, clutches his chest, and collapses onto the road."}]'::jsonb,
  '[{"id":"ev1","title":"Punctured Bottle Spout","detail":"Shows the poison was injected through the rubber nozzle with a syringe."},{"id":"ev2","title":"Syringe Cap with Tyler’s Fingerprints","detail":"Found in the dirt by Aid Station 8 table."},{"id":"ev3","title":"Propranolol Prescription for Tyler","detail":"Proves Tyler purchased the exact beta-blocker drug the previous morning."},{"id":"ev4","title":"Half-Million-Dollar Bet Slip","detail":"Shows Tyler stood to gain $500,000 from David losing the race."}]'::jsonb,
  '[{"order":1,"title":"Punctured Nozzle","text":"Microscopic needle hole in David’s water bottle rubber spout."},{"order":2,"title":"Syringe Cap","text":"Orange needle cover dropped beside the elite drink table."},{"order":3,"title":"Sports Bottle","text":"David’s numbered hydration bottle containing spiked electrolytes."},{"order":4,"title":"Propranolol Ampoule","text":"Glass medical ampoule of the heart-slowing drug Propranolol."},{"order":5,"title":"Betting Ticket","text":"Offshore ticket showing a half-million-dollar bet on David losing."},{"order":6,"title":"Prescription Slip","text":"Pharmacy receipt proving Tyler bought the drug yesterday."}]'::jsonb,
  'Rival Marcus drank from a neon green bottle aggressively.: Marcus ran on his own hydration plan and took no part in tampering.; The race temperature rose to 78 degrees.: Warm weather caused fatigue, but not a sudden heart-rate collapse to 30 BPM.',
  'Blame rival runner Marcus or claim David suffered heat exhaustion from the sun.',
  'NORMAL',
  'Who tampered with David’s sealed electrolyte bottle at Aid Station 8?',
  '[{"character":"Tyler Vance","secret":"Bet five hundred thousand dollars on rival runner Marcus to win the marathon."},{"character":"David Kross","secret":"He was planning to fire Tyler as his coach after this race."},{"character":"Marcus Brody","secret":"He signed a sponsorship deal with Tyler’s athletic agency last week."},{"character":"Dr. Natalie Perez","secret":"Found beta-blocker traces in David’s bloodstream within twenty minutes."}]'::jsonb,
  '[{"lead":"Rival Marcus drank from a neon green bottle aggressively.","explanation":"Marcus ran on his own hydration plan and took no part in tampering."},{"lead":"The race temperature rose to 78 degrees.","explanation":"Warm weather caused fatigue, but not a sudden heart-rate collapse to 30 BPM."}]'::jsonb,
  '{"wrongTheories":["David suffered severe heat exhaustion and dehydration on the Mile 24 incline.","Rival runner Marcus Brody bumped David and spiked his drink during the race."],"correctTheory":"Coach Tyler Vance injected the beta-blocker drug Propranolol through the rubber nozzle of David’s water bottle to trigger his collapse and win a half-million-dollar bet."}'::jsonb,
  'Coach Tyler Vance poisoned David’s bottle to win a half-million-dollar bet!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Police matched the syringe in Tyler’s car to the puncture hole in the bottle. Tyler was arrested for aggravated assault and fraud, while David made a full recovery."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The race committee ruled David collapsed from heat stroke. Tyler collected his half-million-dollar payout and signed Marcus as his star athlete."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The sports federation banned David for using unauthorized performance blockers. Tyler vanished with his winnings, leaving his athlete disgraced."}]'::jsonb,
  '{"intros":["Olympic champion David Kross collapsed two miles from the finish line after drinking from his personal aid bottle.","Case file story_023: Olympic champion David Kross collapsed two miles from the finish line after drinking from his personal aid bottle. Look closely at every clue.","Trouble begins in City Marathon Mile 24 Aid Station, bustling street filled with paper cups and running bibs. Olympic champion David Kross collapsed two miles from the finish line after drinking from his personal aid bottle.","The mystery starts now. Olympic champion David Kross collapsed two miles from the finish line after drinking from his personal aid bottle. Can you solve it?"],"reveals":["Coach Tyler Vance poisoned David’s bottle to win a half-million-dollar bet!","The mystery is unraveled! Coach Tyler Vance poisoned David’s bottle to win a half-million-dollar bet!","At last, the truth comes out: Coach Tyler Vance poisoned David’s bottle to win a half-million-dollar bet!","Case resolved! Here is what happened: Coach Tyler Vance poisoned David’s bottle to win a half-million-dollar bet!"],"hints":["Pay attention to where Coach Tyler Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_023';
DELETE FROM public.case_events WHERE case_id = 'story_023';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7df386b2-1f53-5bf1-946f-33b909400ebf',
  'story_023',
  'Tyler Vance',
  'David’s Head Coach',
  'Intense, clipboard-clutching, wearing athletic windbreaker and sunglasses',
  'I personally mixed David’s electrolytes and handed the bottle to the race marshals.',
  'Bet five hundred thousand dollars on rival runner Marcus to win the marathon.',
  'At the coach observation stand near Mile 20',
  'Trainer and nutritionist for David Kross',
  'David always drinks the full contents of Bottle 4 at the Mile 24 hill.',
  'Did not notice he dropped the plastic syringe cap near the water table.',
  '🏃',
  '["I personally mixed David’s electrolytes and handed the bottle to the race marshals.","\"I personally mixed David’s electrolytes and handed the bottle to the race marshals.\"","Listen to me: I personally mixed David’s electrolytes and handed the bottle to the race marshals.","I tell you the truth: I personally mixed David’s electrolytes and handed the bottle to the race marshals."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4896b286-5d5a-5ece-a8ae-769bdf000cf1',
  'story_023',
  'David Kross',
  'Marathon Champion',
  'Disciplined, quiet, elite athlete in peak physical condition',
  'Victim in hospital; stated: "My chest tightened immediately after drinking Bottle 4."',
  'He was planning to fire Tyler as his coach after this race.',
  'Leading the race from Mile 1 until his collapse at Mile 24',
  'Target of the poisoning',
  'The drink tasted unusually bitter and chalky instead of citrus.',
  'Did not suspect his own coach would sabotage his Olympic trial.',
  '🥇',
  '["Victim in hospital; stated: \"My chest tightened immediately after drinking Bottle 4.\"","\"Victim in hospital; stated: \"My chest tightened immediately after drinking Bottle 4.\"\"","Listen to me: Victim in hospital; stated: \"My chest tightened immediately after drinking Bottle 4.\"","I tell you the truth: Victim in hospital; stated: \"My chest tightened immediately after drinking Bottle 4.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '96c460c4-7014-52b3-9019-43bdd7e10dc3',
  'story_023',
  'Marcus Brody',
  'Rival Marathoner',
  'Aggressive, loud, wearing neon green running gear',
  'I ran a clean race. When David went down, I took the lead and crossed the line.',
  'He signed a sponsorship deal with Tyler’s athletic agency last week.',
  'Running thirty seconds behind David along the race course',
  'Runner who won the marathon following David’s collapse',
  'Saw Coach Tyler lingering near the elite table before the runners arrived.',
  'Did not know Tyler had spiked David’s hydration bottle.',
  '👟',
  '["I ran a clean race. When David went down, I took the lead and crossed the line.","\"I ran a clean race. When David went down, I took the lead and crossed the line.\"","Listen to me: I ran a clean race. When David went down, I took the lead and crossed the line.","I tell you the truth: I ran a clean race. When David went down, I took the lead and crossed the line."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'daa9744e-c77c-5230-a418-8b2311998d25',
  'story_023',
  'Dr. Natalie Perez',
  'Race Medical Director',
  'Clinical, sharp, holding toxicology blood draw tubes',
  'This was not heat stroke. David’s pulse crashed to thirty beats per minute from a beta-blocker.',
  'Found beta-blocker traces in David’s bloodstream within twenty minutes.',
  'Operating the emergency medical tent at the finish line',
  'Treated David Kross following his collapse',
  'Propranolol overdoses cause sudden bradycardia and collapse under exertion.',
  'Did not know where the tampering took place along the course.',
  '🩺',
  '["This was not heat stroke. David’s pulse crashed to thirty beats per minute from a beta-blocker.","\"This was not heat stroke. David’s pulse crashed to thirty beats per minute from a beta-blocker.\"","Listen to me: This was not heat stroke. David’s pulse crashed to thirty beats per minute from a beta-blocker.","I tell you the truth: This was not heat stroke. David’s pulse crashed to thirty beats per minute from a beta-blocker."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f0ea256d-50cc-5e4e-a542-7da75143b297',
  'story_023',
  'ev_1',
  1,
  '07:30 AM',
  'A tiny puncture hole is pierced through the silicone bite valve of Bottle 4.',
  'A tiny puncture hole is pierced through the silicone bite valve of Bottle 4.',
  'The bottle was injected from the outside without breaking the screw cap seal.',
  'Punctured Nozzle',
  'Silicone drinking spout with a microscopic needle puncture mark.',
  '["Cracked Bottle","Loose Cap","Torn Label"]'::jsonb,
  'Punctured Nozzle',
  '["punctured nozzle","nozzle","puncture","hole","spout"]'::jsonb,
  'A tiny hole pierced into the flexible rubber top of a sports drink bottle.',
  'ev_2',
  true,
  '{"descriptions":["A tiny puncture hole is pierced through the silicone bite valve of Bottle 4.","At 07:30 AM: A tiny puncture hole is pierced through the silicone bite valve of Bottle 4.","Notice this clue: A tiny puncture hole is pierced through the silicone bite valve of Bottle 4."],"hints":["A tiny hole pierced into the flexible rubber top of a sports drink bottle.","Clue hint: Think about punctured nozzle.","Search for: the bottle was injected from the outside without breaking the screw cap seal."],"clues":["Punctured Nozzle","Item: Punctured Nozzle","Clue Word: Punctured Nozzle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2dc48796-5e2d-585e-b1ee-6f67ec000635',
  'story_023',
  'ev_2',
  2,
  '07:35 AM',
  'A transparent plastic syringe needle cap is stepped into the curb mud.',
  'A transparent plastic syringe needle cap is stepped into the curb mud.',
  'The tamperer used a hypodermic needle to inject liquid medication.',
  'Syringe Cap',
  'Orange plastic protective sheath for an ultra-fine medical needle.',
  '["Bottle Cap","Pen Cap","Whistle"]'::jsonb,
  'Syringe Cap',
  '["syringe cap","needle cap","cap","plastic cap"]'::jsonb,
  'A small colored plastic cap that covers a sharp medical injection needle.',
  'ev_3',
  false,
  '{"descriptions":["A transparent plastic syringe needle cap is stepped into the curb mud.","At 07:35 AM: A transparent plastic syringe needle cap is stepped into the curb mud.","Notice this clue: A transparent plastic syringe needle cap is stepped into the curb mud."],"hints":["A small colored plastic cap that covers a sharp medical injection needle.","Clue hint: Think about syringe cap.","Search for: the tamperer used a hypodermic needle to inject liquid medication."],"clues":["Syringe Cap","Item: Syringe Cap","Clue Word: Syringe Cap"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0b66f431-4983-506c-9573-d7003716b1ee',
  'story_023',
  'ev_3',
  3,
  '09:12 AM',
  'A blue insulated sports bottle marked "#1 - KROSS" lies dropped on the asphalt.',
  'A blue insulated sports bottle marked "#1 - KROSS" lies dropped on the asphalt.',
  'The remaining liquid in the bottle contained 100mg of dissolved Propranolol.',
  'Sports Bottle',
  'Blue plastic cycling bottle with half-drunk milky electrolyte liquid.',
  '["Paper Cup","Soda Can","Glass Bottle"]'::jsonb,
  'Sports Bottle',
  '["sports bottle","bottle","water bottle","drink bottle"]'::jsonb,
  'A plastic squeeze bottle athletes carry to drink water during races.',
  'ev_4',
  false,
  '{"descriptions":["A blue insulated sports bottle marked \"#1 - KROSS\" lies dropped on the asphalt.","At 09:12 AM: A blue insulated sports bottle marked \"#1 - KROSS\" lies dropped on the asphalt.","Notice this clue: A blue insulated sports bottle marked \"#1 - KROSS\" lies dropped on the asphalt."],"hints":["A plastic squeeze bottle athletes carry to drink water during races.","Clue hint: Think about sports bottle.","Search for: the remaining liquid in the bottle contained 100mg of dissolved propranolol."],"clues":["Sports Bottle","Item: Sports Bottle","Clue Word: Sports Bottle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c5f1ee8a-851a-50cf-bee8-679ea8cc6f79',
  'story_023',
  'ev_4',
  4,
  '09:16 AM',
  'An empty glass ampoule of Propranolol 50mg is found in the station bin.',
  'An empty glass ampoule of Propranolol 50mg is found in the station bin.',
  'The specific beta-blocker drug used to crash David’s heart rate.',
  'Propranolol Ampoule',
  'Amber glass medical vial with snapped neck labeled "Propranolol HCl".',
  '["Insulin Bottle","Painkiller Box","Energy Gel"]'::jsonb,
  'Propranolol Ampoule',
  '["propranolol ampoule","ampoule","propranolol","vial","medicine ampoule"]'::jsonb,
  'A small sealed glass capsule holding liquid medication for injection.',
  'ev_5',
  false,
  '{"descriptions":["An empty glass ampoule of Propranolol 50mg is found in the station bin.","At 09:16 AM: An empty glass ampoule of Propranolol 50mg is found in the station bin.","Notice this clue: An empty glass ampoule of Propranolol 50mg is found in the station bin."],"hints":["A small sealed glass capsule holding liquid medication for injection.","Clue hint: Think about propranolol ampoule.","Search for: the specific beta-blocker drug used to crash david’s heart rate."],"clues":["Propranolol Ampoule","Item: Propranolol Ampoule","Clue Word: Propranolol Ampoule"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'da831b20-bff4-5e8e-bbb5-129362627245',
  'story_023',
  'ev_5',
  5,
  '09:30 AM',
  'A sports betting betting slip shows a 50-to-1 payout on Marcus Brody winning.',
  'A sports betting betting slip shows a 50-to-1 payout on Marcus Brody winning.',
  'Tyler wagered heavily against his own athlete through an offshore bookmaker.',
  'Betting Ticket',
  'Mobile betting printout showing a five-hundred-thousand-dollar payout slip.',
  '["Race Bib","Scorecard","Receipt"]'::jsonb,
  'Betting Ticket',
  '["betting ticket","ticket","slip","betting slip"]'::jsonb,
  'A printed paper slip showing a bet placed on a sporting event outcome.',
  'ev_6',
  true,
  '{"descriptions":["A sports betting betting slip shows a 50-to-1 payout on Marcus Brody winning.","At 09:30 AM: A sports betting betting slip shows a 50-to-1 payout on Marcus Brody winning.","Notice this clue: A sports betting betting slip shows a 50-to-1 payout on Marcus Brody winning."],"hints":["A printed paper slip showing a bet placed on a sporting event outcome.","Clue hint: Think about betting ticket.","Search for: tyler wagered heavily against his own athlete through an offshore bookmaker."],"clues":["Betting Ticket","Item: Betting Ticket","Clue Word: Betting Ticket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c20d6f28-4fa5-5b74-8d80-00c30a00072f',
  'story_023',
  'ev_6',
  6,
  '09:45 AM',
  'A doctor’s prescription for heart medication made out to Tyler Vance is discovered.',
  'A doctor’s prescription for heart medication made out to Tyler Vance is discovered.',
  'Tyler had legal access to the exact beta-blocker injected into the bottle.',
  'Prescription Slip',
  'Pharmacy receipt showing Tyler filled a 60-count Propranolol script yesterday.',
  '["Gym Pass","Trainer License","Nutrition Guide"]'::jsonb,
  'Prescription Slip',
  '["prescription slip","prescription","rx","script"]'::jsonb,
  'An official doctor’s paper ordering a pharmacy to give medicine to a patient.',
  'ev_7',
  false,
  '{"descriptions":["A doctor’s prescription for heart medication made out to Tyler Vance is discovered.","At 09:45 AM: A doctor’s prescription for heart medication made out to Tyler Vance is discovered.","Notice this clue: A doctor’s prescription for heart medication made out to Tyler Vance is discovered."],"hints":["An official doctor’s paper ordering a pharmacy to give medicine to a patient.","Clue hint: Think about prescription slip.","Search for: tyler had legal access to the exact beta-blocker injected into the bottle."],"clues":["Prescription Slip","Item: Prescription Slip","Clue Word: Prescription Slip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'db67b65e-75df-50bb-b5b2-baab5bd18af3',
  'story_023',
  'ev_7',
  7,
  '10:00 AM',
  'Toxicology report confirms massive concentrations of beta-blockers in blood.',
  'Toxicology report confirms massive concentrations of beta-blockers in blood.',
  'David’s collapse was a direct pharmacological poisoning, not dehydration.',
  'Toxicology Report',
  'Hospital lab sheet showing fatal-range levels of Propranolol.',
  '["ECG Chart","Blood Pressure Log","X-Ray"]'::jsonb,
  'Toxicology Report',
  '["toxicology report","report","lab report","blood test"]'::jsonb,
  'A medical laboratory document listing chemicals and poisons in a body.',
  'ev_8',
  false,
  '{"descriptions":["Toxicology report confirms massive concentrations of beta-blockers in blood.","At 10:00 AM: Toxicology report confirms massive concentrations of beta-blockers in blood.","Notice this clue: Toxicology report confirms massive concentrations of beta-blockers in blood."],"hints":["A medical laboratory document listing chemicals and poisons in a body.","Clue hint: Think about toxicology report.","Search for: david’s collapse was a direct pharmacological poisoning, not dehydration."],"clues":["Toxicology Report","Item: Toxicology Report","Clue Word: Toxicology Report"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2c254a9d-ab27-5590-a402-4ad98d17890b',
  'story_023',
  'ev_8',
  8,
  '10:20 AM',
  'A running jacket with a medical syringe in the inner pocket is found in Tyler’s car.',
  'A running jacket with a medical syringe in the inner pocket is found in Tyler’s car.',
  'Tyler kept the syringe in his vehicle after the morning injection.',
  'Hypodermic Syringe',
  '3ml plastic syringe with liquid residue matching David’s drink.',
  '["Thermometer","Dropper","Pen"]'::jsonb,
  'Hypodermic Syringe',
  '["hypodermic syringe","syringe","needle"]'::jsonb,
  'A plastic cylinder with a plunger and sharp needle used to inject medicine.',
  NULL,
  true,
  '{"descriptions":["A running jacket with a medical syringe in the inner pocket is found in Tyler’s car.","At 10:20 AM: A running jacket with a medical syringe in the inner pocket is found in Tyler’s car.","Notice this clue: A running jacket with a medical syringe in the inner pocket is found in Tyler’s car."],"hints":["A plastic cylinder with a plunger and sharp needle used to inject medicine.","Clue hint: Think about hypodermic syringe.","Search for: tyler kept the syringe in his vehicle after the morning injection."],"clues":["Hypodermic Syringe","Item: Hypodermic Syringe","Clue Word: Hypodermic Syringe"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_024 — THE ART AUCTION SWITCH
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_024',
  'The Art Auction Switch',
  'Investigation',
  'The Sotheby Grand Auction Hall, crystal chandeliers, velvet ropes, and crowded paddle bidders',
  'A master Rembrandt portrait was swapped with a painted forgery during a two-minute lighting flicker.',
  '[{"name":"Gerald Vance","role":"Chief Auctioneer & Vice President","alibi":"Standing at the wooden auction podium","avatar":"🔨"},{"name":"Claudia Moreau","role":"Master Art Restorer","alibi":"Standing in the catalog verification room backstage","avatar":"🎨"},{"name":"Lord Henry Sterling","role":"Billionaire Art Collector","alibi":"Front row center seat waving paddle #12","avatar":"🎩"},{"name":"Detective Thomas Cole","role":"Interpol Cultural Property Investigator","alibi":"Seated in the back row monitoring known art dealers","avatar":"🔍"}]'::jsonb,
  'Auctioneer Gerald Vance orchestrated a power flicker by shorting the spotlight dimmer switch. During the two minutes of dim panic, his accomplice behind the velvet rotating stage easel swapped the authentic Rembrandt for an oil replica.',
  'Auctioneer Gerald Vance',
  'Gerald arranged a private buyer in Hong Kong who paid him five million dollars for the original.',
  '[{"time":"07:30 PM","event":"The Rembrandt masterpiece is placed on the revolving stage easel."},{"time":"08:15 PM","event":"Bidding reaches eighteen million dollars between two rival collectors."},{"time":"08:17 PM","event":"Gerald clicks the hidden dimmer short; main chandelier and spotlights die."},{"time":"08:18 PM","event":"The rotating easel turns 180 degrees, bringing the forgery to the front."},{"time":"08:20 PM","event":"Lights return; Gerald slams the gavel shouting \"Sold to Paddle 12!\""}]'::jsonb,
  '[{"id":"ev1","title":"Tampered Dimmer Under Podium","detail":"Shows copper bridging used by Gerald to kill the spotlights."},{"id":"ev2","title":"Cufflink G.V. in Easel Gears","detail":"Proves Gerald personally operated the secret easel rotation crank."},{"id":"ev3","title":"Swiss Bank Deposit Slip","detail":"Five million dollars transferred from an underground Hong Kong collector."},{"id":"ev4","title":"Titanium White Pigment Analysis","detail":"Proves the painting on display was painted in the 21st century."}]'::jsonb,
  '[{"order":1,"title":"Tampered Dimmer","text":"Podium light control shorted to create an intentional two-minute blackout."},{"order":2,"title":"Rotating Easel","text":"Dual-sided stage easel rotated to swap the real painting for a fake."},{"order":3,"title":"Oil Painting Forgery","text":"Modern replica smelling of fresh clove oil and titanium white paint."},{"order":4,"title":"Titanium White Tube","text":"Modern paint tube hidden backstage confirming recent forgery creation."},{"order":5,"title":"Velvet Art Pouch","text":"Padded museum bag used to smuggle the genuine Rembrandt to the garage."},{"order":6,"title":"Monogrammed Cufflink","text":"Gerald’s personal cufflink caught in the revolving easel mechanism."}]'::jsonb,
  'Lord Henry had armed private bodyguards in the hall.: Hired to protect his bid money, not commit art theft.; Restorer Claudia carried varnish bottles in her purse.: Standard solvents used for verifying canvas authenticity.',
  'Blame art restorer Claudia or claim an eccentric billionaire bidder used smoke pellets.',
  'NORMAL',
  'Who swapped the master painting while the auctioneer was calling bids?',
  '[{"character":"Gerald Vance","secret":"Received a two-million-dollar down payment in a Swiss account from a Hong Kong collector."},{"character":"Claudia Moreau","secret":"She pointed out that the frame brackets were loosened earlier."},{"character":"Lord Henry Sterling","secret":"He brought private armed security guards into the showroom."},{"character":"Detective Thomas Cole","secret":"Tracking a master forger operating in the city for three months."}]'::jsonb,
  '[{"lead":"Lord Henry had armed private bodyguards in the hall.","explanation":"Hired to protect his bid money, not commit art theft."},{"lead":"Restorer Claudia carried varnish bottles in her purse.","explanation":"Standard solvents used for verifying canvas authenticity."}]'::jsonb,
  '{"wrongTheories":["An eccentric billionaire set off a smoke bomb to confuse the crowd.","Restorer Claudia swapped the canvas earlier during her afternoon inspection."],"correctTheory":"Auctioneer Gerald Vance intentionally shorted the dimmer switch to cause a blackout, rotated the dual-sided easel to present a modern forgery, and smuggled the genuine Rembrandt down to his car for a five-million-dollar payout."}'::jsonb,
  'Auctioneer Gerald Vance swapped the Rembrandt for a five-million-dollar payout!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Interpol intercepted Gerald’s car in the underground garage with the genuine Rembrandt in the trunk. Gerald was arrested for art theft and international fraud."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Restorer Claudia was arrested for painting the forgery. Gerald Vance delivered the masterpiece to Hong Kong and retired to the French Riviera."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The auction house declared the painting authentic and suppressed the controversy. Gerald collected his commission and the fake hung in a museum."}]'::jsonb,
  '{"intros":["A master Rembrandt portrait was swapped with a painted forgery during a two-minute lighting flicker.","Case file story_024: A master Rembrandt portrait was swapped with a painted forgery during a two-minute lighting flicker. Look closely at every clue.","Trouble begins in The Sotheby Grand Auction Hall, crystal chandeliers, velvet ropes, and crowded paddle bidders. A master Rembrandt portrait was swapped with a painted forgery during a two-minute lighting flicker.","The mystery starts now. A master Rembrandt portrait was swapped with a painted forgery during a two-minute lighting flicker. Can you solve it?"],"reveals":["Auctioneer Gerald Vance swapped the Rembrandt for a five-million-dollar payout!","The mystery is unraveled! Auctioneer Gerald Vance swapped the Rembrandt for a five-million-dollar payout!","At last, the truth comes out: Auctioneer Gerald Vance swapped the Rembrandt for a five-million-dollar payout!","Case resolved! Here is what happened: Auctioneer Gerald Vance swapped the Rembrandt for a five-million-dollar payout!"],"hints":["Pay attention to where Auctioneer Gerald Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_024';
DELETE FROM public.case_events WHERE case_id = 'story_024';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3a9818f8-9fa4-5a6d-bbd9-51ca7e4d35d6',
  'story_024',
  'Gerald Vance',
  'Chief Auctioneer & Vice President',
  'Charismatic, silver-haired, booming voice, impeccably tailored tuxedo',
  'The lights blinked for a brief moment due to an electrical surge. I never left the podium.',
  'Received a two-million-dollar down payment in a Swiss account from a Hong Kong collector.',
  'Standing at the wooden auction podium',
  'Presiding over the historic Old Masters auction',
  'The motorized revolving easel can be turned manually from behind the curtain.',
  'Did not notice his gold cufflinks left a scratch on the wooden frame.',
  '🔨',
  '["The lights blinked for a brief moment due to an electrical surge. I never left the podium.","\"The lights blinked for a brief moment due to an electrical surge. I never left the podium.\"","Listen to me: The lights blinked for a brief moment due to an electrical surge. I never left the podium.","I tell you the truth: The lights blinked for a brief moment due to an electrical surge. I never left the podium."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7fd5eefb-85b9-542e-871f-44bb44711d48',
  'story_024',
  'Claudia Moreau',
  'Master Art Restorer',
  'Detail-oriented, quiet, carries a linen loupe and varnish solvents',
  'I verified the Rembrandt’s canvas weave at 6:00 PM before it was hung on the easel.',
  'She pointed out that the frame brackets were loosened earlier.',
  'Standing in the catalog verification room backstage',
  'Authenticated the original painting for the auction house',
  'The paint on the forgery smells of fresh clove oil used to slow drying.',
  'Did not know Gerald had engineered the electrical short.',
  '🎨',
  '["I verified the Rembrandt’s canvas weave at 6:00 PM before it was hung on the easel.","\"I verified the Rembrandt’s canvas weave at 6:00 PM before it was hung on the easel.\"","Listen to me: I verified the Rembrandt’s canvas weave at 6:00 PM before it was hung on the easel.","I tell you the truth: I verified the Rembrandt’s canvas weave at 6:00 PM before it was hung on the easel."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c698db4d-f231-55f5-aca1-8e8e5cf30758',
  'story_024',
  'Lord Henry Sterling',
  'Billionaire Art Collector',
  'Eccentric, impatient, waving Paddle #12 with an ivory walking cane',
  'I bid eighteen million dollars for a masterwork, not a piece of dried tourist canvas!',
  'He brought private armed security guards into the showroom.',
  'Front row center seat waving paddle #12',
  'Winning bidder for the Rembrandt painting',
  'Noticed the rotating display easel jerked violently when the lights went out.',
  'Did not see who was behind the dark velvet backdrop curtain.',
  '🎩',
  '["I bid eighteen million dollars for a masterwork, not a piece of dried tourist canvas!","\"I bid eighteen million dollars for a masterwork, not a piece of dried tourist canvas!\"","Listen to me: I bid eighteen million dollars for a masterwork, not a piece of dried tourist canvas!","I tell you the truth: I bid eighteen million dollars for a masterwork, not a piece of dried tourist canvas!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6a3b260a-7b2c-56f0-96b2-ac2001ae7b53',
  'story_024',
  'Detective Thomas Cole',
  'Interpol Cultural Property Investigator',
  'Cynical, sharp, carries an optical spectrometer in his briefcase',
  'The pigment in this canvas contains titanium white, which was not invented until 1921.',
  'Tracking a master forger operating in the city for three months.',
  'Seated in the back row monitoring known art dealers',
  'Investigating high-value international art fraud',
  'The original Rembrandt was transported out through the private executive garage.',
  'Did not immediately know the auctioneer was the mastermind.',
  '🔍',
  '["The pigment in this canvas contains titanium white, which was not invented until 1921.","\"The pigment in this canvas contains titanium white, which was not invented until 1921.\"","Listen to me: The pigment in this canvas contains titanium white, which was not invented until 1921.","I tell you the truth: The pigment in this canvas contains titanium white, which was not invented until 1921."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '33480ee5-e7b5-58bb-85da-5becbc0e2718',
  'story_024',
  'ev_1',
  1,
  '08:17 PM',
  'A modified dimmer switch under the podium shows intentional copper wire bridging.',
  'A modified dimmer switch under the podium shows intentional copper wire bridging.',
  'The auctioneer manually shorted the chandelier to create the blackout.',
  'Tampered Dimmer',
  'Rotary light switch with copper wire clipped across the terminals.',
  '["Fuse Box","Power Cord","Light Bulb"]'::jsonb,
  'Tampered Dimmer',
  '["tampered dimmer","dimmer","switch","light switch"]'::jsonb,
  'A round wall dial used to turn electric lights brighter or dimmer.',
  'ev_2',
  true,
  '{"descriptions":["A modified dimmer switch under the podium shows intentional copper wire bridging.","At 08:17 PM: A modified dimmer switch under the podium shows intentional copper wire bridging.","Notice this clue: A modified dimmer switch under the podium shows intentional copper wire bridging."],"hints":["A round wall dial used to turn electric lights brighter or dimmer.","Clue hint: Think about tampered dimmer.","Search for: the auctioneer manually shorted the chandelier to create the blackout."],"clues":["Tampered Dimmer","Item: Tampered Dimmer","Clue Word: Tampered Dimmer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f22cf2f8-276e-593b-aaaf-697c71982a17',
  'story_024',
  'ev_2',
  2,
  '08:18 PM',
  'A motorized revolving stage easel was spun manually using a hand crank.',
  'A motorized revolving stage easel was spun manually using a hand crank.',
  'The easel held the forgery on its back side and was rotated during the darkness.',
  'Rotating Easel',
  'Dual-sided mahogany easel with a manual rear turn handle.',
  '["Wall Mount","Picture Frame","Display Table"]'::jsonb,
  'Rotating Easel',
  '["rotating easel","easel","display easel","stage easel"]'::jsonb,
  'A wooden three-legged stand used by artists to hold a canvas upright.',
  'ev_3',
  false,
  '{"descriptions":["A motorized revolving stage easel was spun manually using a hand crank.","At 08:18 PM: A motorized revolving stage easel was spun manually using a hand crank.","Notice this clue: A motorized revolving stage easel was spun manually using a hand crank."],"hints":["A wooden three-legged stand used by artists to hold a canvas upright.","Clue hint: Think about rotating easel.","Search for: the easel held the forgery on its back side and was rotated during the darkness."],"clues":["Rotating Easel","Item: Rotating Easel","Clue Word: Rotating Easel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e05a5b5c-1b70-54f8-9398-44585ebdd77a',
  'story_024',
  'ev_3',
  3,
  '08:19 PM',
  'A canvas painting depicting an Old Man in an Armchair smells of fresh clove oil.',
  'A canvas painting depicting an Old Man in an Armchair smells of fresh clove oil.',
  'The painting was completed recently and contains modern pigment binding oil.',
  'Oil Painting Forgery',
  'Framed oil canvas with modern titanium white paint layers.',
  '["Watercolor","Sketch","Print"]'::jsonb,
  'Oil Painting Forgery',
  '["oil painting forgery","painting","forgery","oil painting","fake painting"]'::jsonb,
  'A picture made with oil paints on stretched linen fabric.',
  'ev_4',
  false,
  '{"descriptions":["A canvas painting depicting an Old Man in an Armchair smells of fresh clove oil.","At 08:19 PM: A canvas painting depicting an Old Man in an Armchair smells of fresh clove oil.","Notice this clue: A canvas painting depicting an Old Man in an Armchair smells of fresh clove oil."],"hints":["A picture made with oil paints on stretched linen fabric.","Clue hint: Think about oil painting forgery.","Search for: the painting was completed recently and contains modern pigment binding oil."],"clues":["Oil Painting Forgery","Item: Oil Painting Forgery","Clue Word: Oil Painting Forgery"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9a8b8a40-bc8b-50c3-9954-e5cf30c88805',
  'story_024',
  'ev_4',
  4,
  '08:21 PM',
  'A tube of Windsor & Newton titanium white paint is hidden in the green room.',
  'A tube of Windsor & Newton titanium white paint is hidden in the green room.',
  'The modern paint tube proves the canvas could not be from the 1600s.',
  'Titanium White Tube',
  'Metal artist paint tube with white pigment residue on the screw cap.',
  '["Ink Bottle","Glue Tube","Varnish Bottle"]'::jsonb,
  'Titanium White Tube',
  '["titanium white tube","paint tube","paint","titanium white","tube"]'::jsonb,
  'A squeeze tube filled with thick white artist oil paint.',
  'ev_5',
  false,
  '{"descriptions":["A tube of Windsor & Newton titanium white paint is hidden in the green room.","At 08:21 PM: A tube of Windsor & Newton titanium white paint is hidden in the green room.","Notice this clue: A tube of Windsor & Newton titanium white paint is hidden in the green room."],"hints":["A squeeze tube filled with thick white artist oil paint.","Clue hint: Think about titanium white tube.","Search for: the modern paint tube proves the canvas could not be from the 1600s."],"clues":["Titanium White Tube","Item: Titanium White Tube","Clue Word: Titanium White Tube"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '440328e9-7251-598c-a572-a5048831c915',
  'story_024',
  'ev_5',
  5,
  '08:25 PM',
  'A velvet shipping bag large enough for the real Rembrandt is loaded into an elevator.',
  'A velvet shipping bag large enough for the real Rembrandt is loaded into an elevator.',
  'The original masterwork was sent directly down to the underground garage.',
  'Velvet Art Pouch',
  'Padded black velvet envelope designed for museum canvas transport.',
  '["Cardboard Box","Luggage Bag","Plastic Wrap"]'::jsonb,
  'Velvet Art Pouch',
  '["velvet art pouch","pouch","art pouch","velvet bag","case"]'::jsonb,
  'A soft padded fabric envelope used to protect expensive paintings in transit.',
  'ev_6',
  true,
  '{"descriptions":["A velvet shipping bag large enough for the real Rembrandt is loaded into an elevator.","At 08:25 PM: A velvet shipping bag large enough for the real Rembrandt is loaded into an elevator.","Notice this clue: A velvet shipping bag large enough for the real Rembrandt is loaded into an elevator."],"hints":["A soft padded fabric envelope used to protect expensive paintings in transit.","Clue hint: Think about velvet art pouch.","Search for: the original masterwork was sent directly down to the underground garage."],"clues":["Velvet Art Pouch","Item: Velvet Art Pouch","Clue Word: Velvet Art Pouch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5a47a7a4-e72d-584d-893e-91b105e0073b',
  'story_024',
  'ev_6',
  6,
  '08:35 PM',
  'A Swiss bank account deposit slip for five million dollars is in Gerald’s briefcase.',
  'A Swiss bank account deposit slip for five million dollars is in Gerald’s briefcase.',
  'Gerald was paid a multi-million-dollar advance from the buyer in Hong Kong.',
  'Swiss Bank Deposit',
  'Printed banking receipt showing account transfer to "Zurich Vault 90".',
  '["Checkbook","Credit Card","Cash Stack"]'::jsonb,
  'Swiss Bank Deposit',
  '["swiss bank deposit","deposit","deposit slip","bank slip","receipt"]'::jsonb,
  'A paper slip confirming a large sum of money placed into a Swiss bank account.',
  'ev_7',
  false,
  '{"descriptions":["A Swiss bank account deposit slip for five million dollars is in Gerald’s briefcase.","At 08:35 PM: A Swiss bank account deposit slip for five million dollars is in Gerald’s briefcase.","Notice this clue: A Swiss bank account deposit slip for five million dollars is in Gerald’s briefcase."],"hints":["A paper slip confirming a large sum of money placed into a Swiss bank account.","Clue hint: Think about swiss bank deposit.","Search for: gerald was paid a multi-million-dollar advance from the buyer in hong kong."],"clues":["Swiss Bank Deposit","Item: Swiss Bank Deposit","Clue Word: Swiss Bank Deposit"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b7cc627a-eaa2-5ff6-9efa-a8516a052af9',
  'story_024',
  'ev_7',
  7,
  '08:45 PM',
  'A distinctive gold monogrammed cufflink is found wedged behind the easel crank.',
  'A distinctive gold monogrammed cufflink is found wedged behind the easel crank.',
  'Gerald lost his cufflink while turning the manual easel handle.',
  'Monogrammed Cufflink',
  'Gold cufflink engraved with initials G.V. matching Gerald’s shirt.',
  '["Button","Tie Clip","Ring"]'::jsonb,
  'Monogrammed Cufflink',
  '["monogrammed cufflink","cufflink","gold cufflink","button","jewelry"]'::jsonb,
  'A small decorative metal clasp for fastening fancy shirt sleeves.',
  'ev_8',
  false,
  '{"descriptions":["A distinctive gold monogrammed cufflink is found wedged behind the easel crank.","At 08:45 PM: A distinctive gold monogrammed cufflink is found wedged behind the easel crank.","Notice this clue: A distinctive gold monogrammed cufflink is found wedged behind the easel crank."],"hints":["A small decorative metal clasp for fastening fancy shirt sleeves.","Clue hint: Think about monogrammed cufflink.","Search for: gerald lost his cufflink while turning the manual easel handle."],"clues":["Monogrammed Cufflink","Item: Monogrammed Cufflink","Clue Word: Monogrammed Cufflink"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9e2a2a03-f0a7-50d5-b760-d369264b7a53',
  'story_024',
  'ev_8',
  8,
  '09:00 PM',
  'An ivory auction gavel slammed on the podium cracked the wooden block.',
  'An ivory auction gavel slammed on the podium cracked the wooden block.',
  'Gerald rushed the sale through to end the auction before the fake was noticed.',
  'Auction Gavel',
  'Carved ivory hammer with dented striking face and silver band.',
  '["Judge Mallet","Wooden Hammer","Savel"]'::jsonb,
  'Auction Gavel',
  '["auction gavel","gavel","hammer","mallet"]'::jsonb,
  'A small wooden or ivory hammer used by an auctioneer or judge.',
  NULL,
  true,
  '{"descriptions":["An ivory auction gavel slammed on the podium cracked the wooden block.","At 09:00 PM: An ivory auction gavel slammed on the podium cracked the wooden block.","Notice this clue: An ivory auction gavel slammed on the podium cracked the wooden block."],"hints":["A small wooden or ivory hammer used by an auctioneer or judge.","Clue hint: Think about auction gavel.","Search for: gerald rushed the sale through to end the auction before the fake was noticed."],"clues":["Auction Gavel","Item: Auction Gavel","Clue Word: Auction Gavel"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_025 — THE MIRROR IN ROOM 14
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_025',
  'The Mirror in Room 14',
  'Psychological',
  'St. Dymphna Psychiatric Clinic, Room 14, padded walls and a full-length gilded mirror',
  'Patient Arthur claimed his reflection moved before he did; at midnight, the mirror cracked and Arthur vanished.',
  '[{"name":"Dr. Warren Vance","role":"Chief Psychiatrist","alibi":"In his executive office reviewing patient charts","avatar":"👨‍⚕️"},{"name":"Nurse Clara Diaz","role":"Night Shift Nurse","alibi":"At the nursing station preparing midnight IV bags","avatar":"👩‍⚕️"},{"name":"Julian Cole","role":"Hired Stage Actor","alibi":"Hiding in the observation booth behind Room 14","avatar":"🎭"},{"name":"Detective Frank Miller","role":"Missing Persons Detective","alibi":"Arrived at the clinic at 6:00 AM after Arthur was reported missing","avatar":"🔍"}]'::jsonb,
  'Dr. Warren Vance installed two-way surveillance glass in Room 14. He placed an actor dressed identically to Arthur on the other side to manipulate his sanity, then abducted the sedated patient through the hidden observation passage.',
  'Dr. Warren Vance',
  'Dr. Vance conducted unauthorized psychological sleep-deprivation tests to steal Arthur’s inheritance.',
  '[{"time":"09:00 PM","event":"Clara gives Arthur his nightly water and locks Room 14."},{"time":"11:30 PM","event":"Julian takes his position behind the two-way mirror in the dark booth."},{"time":"11:55 PM","event":"Arthur watches his \"reflection\" step forward independently and screams."},{"time":"12:05 AM","event":"Vance enters through the mirror panel, sedates Arthur, and wheels him out."},{"time":"06:00 AM","event":"Clara opens the door and finds only shattered glass and an empty bed."}]'::jsonb,
  '[{"id":"ev1","title":"Two-Way Mirror Door Frame","detail":"Concealed entrance on pneumatic hinges opening into an observation booth."},{"id":"ev2","title":"Chloral Hydrate Syringe","detail":"Used to knock Arthur out before abducting him from Room 14."},{"id":"ev3","title":"Actor’s Theater Ticket and Pajamas","detail":"Proves a live impersonator was paid to mimic Arthur through the glass."},{"id":"ev4","title":"Forged Power of Attorney","detail":"Grants Dr. Vance legal control over Arthur’s three-million-dollar fortune."}]'::jsonb,
  '[{"order":1,"title":"Two-Way Mirror","text":"Special glass panel that allowed an actor to stand on the other side."},{"order":2,"title":"Sedative Syringe","text":"Medical injection tool used to drug the patient into unconsciousness."},{"order":3,"title":"Theater Ticket","text":"Ticket stub belonging to the stage actor hired to mimic Arthur."},{"order":4,"title":"Duplicate Pajamas","text":"Matching hospital clothing worn to create the illusion of a moving reflection."},{"order":5,"title":"Concealed Passage","text":"Hidden corridor behind the wall leading to the clinic basement."},{"order":6,"title":"Power of Attorney","text":"Forged legal document transferring Arthur’s estate to Dr. Vance."}]'::jsonb,
  'Nurse Clara gave Arthur red sleep pills.: Prescribed sedatives, but she had no knowledge of the mirror door.; The window glass in Room 14 was cracked.: Damaged weeks ago during a window-cleaning accident.',
  'Claim Arthur hallucinated his reflection or blame the night nurse Clara.',
  'NORMAL',
  'Did Arthur lose his mind and escape through a window, or was someone hiding behind the mirror?',
  '[{"character":"Dr. Warren Vance","secret":"He forged Arthur’s power of attorney to seize his estate."},{"character":"Nurse Clara Diaz","secret":"She suspected Dr. Vance was giving Arthur unapproved red sedatives."},{"character":"Julian Cole","secret":"He mimicked Arthur’s movements through the two-way glass for ten days."},{"character":"Detective Frank Miller","secret":"Investigated a similar disappearance at Vance’s old clinic five years ago."}]'::jsonb,
  '[{"lead":"Nurse Clara gave Arthur red sleep pills.","explanation":"Prescribed sedatives, but she had no knowledge of the mirror door."},{"lead":"The window glass in Room 14 was cracked.","explanation":"Damaged weeks ago during a window-cleaning accident."}]'::jsonb,
  '{"wrongTheories":["Arthur suffered a psychotic break and escaped through the clinic roof.","Nurse Clara helped Arthur escape out of pity for his strict confinement."],"correctTheory":"Dr. Warren Vance installed a two-way mirror and hired an actor to drive Arthur into madness, then drugged Arthur and smuggled him out through a hidden passage to steal his three-million-dollar inheritance."}'::jsonb,
  'Dr. Warren Vance used a two-way mirror and an actor to steal Arthur’s estate!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Miller discovered the observation booth and intercepted Dr. Vance’s private ambulance. Arthur was rescued and Vance was sentenced to twenty years in prison."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The clinic board ruled Arthur escaped into the woods. Dr. Vance assumed control of Arthur’s estate and sold his properties."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The case was documented as a medical anomaly of self-induced hysteria. Dr. Vance published a best-selling psychiatric paper on the case."}]'::jsonb,
  '{"intros":["Patient Arthur claimed his reflection moved before he did; at midnight, the mirror cracked and Arthur vanished.","Case file story_025: Patient Arthur claimed his reflection moved before he did; at midnight, the mirror cracked and Arthur vanished. Look closely at every clue.","Trouble begins in St. Dymphna Psychiatric Clinic, Room 14, padded walls and a full-length gilded mirror. Patient Arthur claimed his reflection moved before he did; at midnight, the mirror cracked and Arthur vanished.","The mystery starts now. Patient Arthur claimed his reflection moved before he did; at midnight, the mirror cracked and Arthur vanished. Can you solve it?"],"reveals":["Dr. Warren Vance used a two-way mirror and an actor to steal Arthur’s estate!","The mystery is unraveled! Dr. Warren Vance used a two-way mirror and an actor to steal Arthur’s estate!","At last, the truth comes out: Dr. Warren Vance used a two-way mirror and an actor to steal Arthur’s estate!","Case resolved! Here is what happened: Dr. Warren Vance used a two-way mirror and an actor to steal Arthur’s estate!"],"hints":["Pay attention to where Dr. Warren Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_025';
DELETE FROM public.case_events WHERE case_id = 'story_025';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e306e0e9-bc19-5f4d-b2af-415bf5f43624',
  'story_025',
  'Dr. Warren Vance',
  'Chief Psychiatrist',
  'Cold, calculating, speaks in a gentle soothing whisper',
  'Arthur suffered severe paranoid delusions. His mind broke under stress.',
  'He forged Arthur’s power of attorney to seize his estate.',
  'In his executive office reviewing patient charts',
  'Arthur’s attending physician and legal guardian',
  'Room 14 connects to a concealed observation corridor.',
  'Did not notice the actor dropped a silver theater ticket behind the false mirror.',
  '👨‍⚕️',
  '["Arthur suffered severe paranoid delusions. His mind broke under stress.","\"Arthur suffered severe paranoid delusions. His mind broke under stress.\"","Listen to me: Arthur suffered severe paranoid delusions. His mind broke under stress.","I tell you the truth: Arthur suffered severe paranoid delusions. His mind broke under stress."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7a49e316-6d51-5333-9c45-e2559431fa3f',
  'story_025',
  'Nurse Clara Diaz',
  'Night Shift Nurse',
  'Compassionate, tired, carrying a metal medication tray',
  'Arthur screamed at 11:55 PM that his reflection smiled while he was crying.',
  'She suspected Dr. Vance was giving Arthur unapproved red sedatives.',
  'At the nursing station preparing midnight IV bags',
  'Administered nightly medication to Room 14',
  'The wall behind Room 14 sounded hollow when tapped.',
  'Did not know an observation booth existed behind the mirror.',
  '👩‍⚕️',
  '["Arthur screamed at 11:55 PM that his reflection smiled while he was crying.","\"Arthur screamed at 11:55 PM that his reflection smiled while he was crying.\"","Listen to me: Arthur screamed at 11:55 PM that his reflection smiled while he was crying.","I tell you the truth: Arthur screamed at 11:55 PM that his reflection smiled while he was crying."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3cb978a4-536e-56e2-aa24-d3997d7aed05',
  'story_025',
  'Julian Cole',
  'Hired Stage Actor',
  'Nervous, thin, uncanny physical resemblance to Arthur',
  'I was just taking an acting job. The doctor told me it was an experimental therapy role.',
  'He mimicked Arthur’s movements through the two-way glass for ten days.',
  'Hiding in the observation booth behind Room 14',
  'Impersonator used to break Arthur’s perception of reality',
  'Dr. Vance carried Arthur out on a stretcher through the basement tunnel.',
  'Did not know the doctor planned to lock him up next.',
  '🎭',
  '["I was just taking an acting job. The doctor told me it was an experimental therapy role.","\"I was just taking an acting job. The doctor told me it was an experimental therapy role.\"","Listen to me: I was just taking an acting job. The doctor told me it was an experimental therapy role.","I tell you the truth: I was just taking an acting job. The doctor told me it was an experimental therapy role."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f45063b2-3dae-5c83-af12-355529c0a015',
  'story_025',
  'Detective Frank Miller',
  'Missing Persons Detective',
  'Skeptical, hardboiled, inspects walls with a heavy flashlight',
  'Mirrors don’t move on their own. Someone built an optical trick into this room.',
  'Investigated a similar disappearance at Vance’s old clinic five years ago.',
  'Arrived at the clinic at 6:00 AM after Arthur was reported missing',
  'Investigating patient disappearances at St. Dymphna',
  'Found electromagnetic latches behind the mirror frame.',
  'Did not immediately know the location of Vance’s private sanitarium.',
  '🔍',
  '["Mirrors don’t move on their own. Someone built an optical trick into this room.","\"Mirrors don’t move on their own. Someone built an optical trick into this room.\"","Listen to me: Mirrors don’t move on their own. Someone built an optical trick into this room.","I tell you the truth: Mirrors don’t move on their own. Someone built an optical trick into this room."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '943bd027-bcd8-5ede-a7fb-9247953863a4',
  'story_025',
  'ev_1',
  1,
  '11:55 PM',
  'A full-length two-way surveillance mirror swings open on silent pneumatic hinges.',
  'A full-length two-way surveillance mirror swings open on silent pneumatic hinges.',
  'The mirror was not mounted to a wall; it was a concealed doorway.',
  'Two-Way Mirror',
  'Gilded mirror with optical tint reflecting one side and transparent on the other.',
  '["Window Pane","Picture Frame","Wardrobe Door"]'::jsonb,
  'Two-Way Mirror',
  '["two-way mirror","mirror","glass","surveillance mirror"]'::jsonb,
  'A special glass sheet that acts as a mirror on one side and a window on the other.',
  'ev_2',
  true,
  '{"descriptions":["A full-length two-way surveillance mirror swings open on silent pneumatic hinges.","At 11:55 PM: A full-length two-way surveillance mirror swings open on silent pneumatic hinges.","Notice this clue: A full-length two-way surveillance mirror swings open on silent pneumatic hinges."],"hints":["A special glass sheet that acts as a mirror on one side and a window on the other.","Clue hint: Think about two-way mirror.","Search for: the mirror was not mounted to a wall; it was a concealed doorway."],"clues":["Two-Way Mirror","Item: Two-Way Mirror","Clue Word: Two-Way Mirror"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '41e553c7-995d-5824-8fd5-4f498c120253',
  'story_025',
  'ev_2',
  2,
  '12:05 AM',
  'An empty 5ml syringe of liquid chloral hydrate sedative is dropped on the rug.',
  'An empty 5ml syringe of liquid chloral hydrate sedative is dropped on the rug.',
  'Arthur was injected with a knockout drug before being moved.',
  'Sedative Syringe',
  'Medical syringe with traces of colorless chloral hydrate liquid.',
  '["Insulin Pen","Thermometer","Eyedropper"]'::jsonb,
  'Sedative Syringe',
  '["sedative syringe","syringe","needle","sedative"]'::jsonb,
  'A medical tool with a plunger used to inject sleep medicine into blood.',
  'ev_3',
  false,
  '{"descriptions":["An empty 5ml syringe of liquid chloral hydrate sedative is dropped on the rug.","At 12:05 AM: An empty 5ml syringe of liquid chloral hydrate sedative is dropped on the rug.","Notice this clue: An empty 5ml syringe of liquid chloral hydrate sedative is dropped on the rug."],"hints":["A medical tool with a plunger used to inject sleep medicine into blood.","Clue hint: Think about sedative syringe.","Search for: arthur was injected with a knockout drug before being moved."],"clues":["Sedative Syringe","Item: Sedative Syringe","Clue Word: Sedative Syringe"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2b81e108-934c-5a00-b9cf-6b91112366d7',
  'story_025',
  'ev_3',
  3,
  '12:10 AM',
  'A silver theater ticket stub for the Royal Playhouse is found in the dark booth.',
  'A silver theater ticket stub for the Royal Playhouse is found in the dark booth.',
  'The person behind the glass was a professional stage actor.',
  'Theater Ticket',
  'Silver cardstock ticket stub for the play "The Double".',
  '["Bus Pass","Movie Ticket","Receipt"]'::jsonb,
  'Theater Ticket',
  '["theater ticket","ticket","ticket stub","stub"]'::jsonb,
  'A small paper pass showing entry to a live stage play.',
  'ev_4',
  false,
  '{"descriptions":["A silver theater ticket stub for the Royal Playhouse is found in the dark booth.","At 12:10 AM: A silver theater ticket stub for the Royal Playhouse is found in the dark booth.","Notice this clue: A silver theater ticket stub for the Royal Playhouse is found in the dark booth."],"hints":["A small paper pass showing entry to a live stage play.","Clue hint: Think about theater ticket.","Search for: the person behind the glass was a professional stage actor."],"clues":["Theater Ticket","Item: Theater Ticket","Clue Word: Theater Ticket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '82e46e50-14d8-5d7d-81db-ccce194144e4',
  'story_025',
  'ev_4',
  4,
  '12:15 AM',
  'An identical pair of blue striped patient pajamas hangs on the actor’s chair.',
  'An identical pair of blue striped patient pajamas hangs on the actor’s chair.',
  'Julian wore identical clothing to mirror Arthur’s appearance perfectly.',
  'Duplicate Pajamas',
  'Cotton striped hospital gown matching Arthur’s exact size and pattern.',
  '["Doctor Coat","Nurse Uniform","Overcoat"]'::jsonb,
  'Duplicate Pajamas',
  '["duplicate pajamas","pajamas","gown","hospital gown"]'::jsonb,
  'Soft cotton clothing worn by patients sleeping in hospital beds.',
  'ev_5',
  false,
  '{"descriptions":["An identical pair of blue striped patient pajamas hangs on the actor’s chair.","At 12:15 AM: An identical pair of blue striped patient pajamas hangs on the actor’s chair.","Notice this clue: An identical pair of blue striped patient pajamas hangs on the actor’s chair."],"hints":["Soft cotton clothing worn by patients sleeping in hospital beds.","Clue hint: Think about duplicate pajamas.","Search for: julian wore identical clothing to mirror arthur’s appearance perfectly."],"clues":["Duplicate Pajamas","Item: Duplicate Pajamas","Clue Word: Duplicate Pajamas"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9c49b9bf-6a2d-5c40-88f7-037d1e97347b',
  'story_025',
  'ev_5',
  5,
  '12:30 AM',
  'A concealed service passage with rubber floor tiles leads to the basement.',
  'A concealed service passage with rubber floor tiles leads to the basement.',
  'The observation booth connected directly to the underground ambulance bay.',
  'Concealed Passage',
  'Narrow subterranean hallway behind the wall of Room 14.',
  '["Ventilation Duct","Elevator Shaft","Sewer Pipe"]'::jsonb,
  'Concealed Passage',
  '["concealed passage","passage","tunnel","secret door","hallway"]'::jsonb,
  'A hidden corridor built behind walls to move people without being seen.',
  'ev_6',
  true,
  '{"descriptions":["A concealed service passage with rubber floor tiles leads to the basement.","At 12:30 AM: A concealed service passage with rubber floor tiles leads to the basement.","Notice this clue: A concealed service passage with rubber floor tiles leads to the basement."],"hints":["A hidden corridor built behind walls to move people without being seen.","Clue hint: Think about concealed passage.","Search for: the observation booth connected directly to the underground ambulance bay."],"clues":["Concealed Passage","Item: Concealed Passage","Clue Word: Concealed Passage"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8c19de8b-96c2-50ee-8f5f-dff257d3057d',
  'story_025',
  'ev_6',
  6,
  '01:00 AM',
  'A forged power of attorney document naming Dr. Vance as sole heir is found.',
  'A forged power of attorney document naming Dr. Vance as sole heir is found.',
  'Vance stood to inherit Arthur’s three-million-dollar real estate estate.',
  'Power of Attorney',
  'Legal document signed with Arthur’s shaky, drugged signature.',
  '["Medical Chart","Bank Book","Diary"]'::jsonb,
  'Power of Attorney',
  '["power of attorney","document","legal paper","will"]'::jsonb,
  'A legal paper giving someone power to manage another person’s money and land.',
  'ev_7',
  false,
  '{"descriptions":["A forged power of attorney document naming Dr. Vance as sole heir is found.","At 01:00 AM: A forged power of attorney document naming Dr. Vance as sole heir is found.","Notice this clue: A forged power of attorney document naming Dr. Vance as sole heir is found."],"hints":["A legal paper giving someone power to manage another person’s money and land.","Clue hint: Think about power of attorney.","Search for: vance stood to inherit arthur’s three-million-dollar real estate estate."],"clues":["Power of Attorney","Item: Power of Attorney","Clue Word: Power of Attorney"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '712f046d-265b-553f-8bbf-a124a10bee0e',
  'story_025',
  'ev_7',
  7,
  '01:30 AM',
  'A red notebook detailing psychological gaslighting instructions is recovered.',
  'A red notebook detailing psychological gaslighting instructions is recovered.',
  'Vance wrote daily scripts for the actor to break Arthur’s sense of time.',
  'Gaslighting Journal',
  'Leather notebook with handwritten steps: "Step 4: Smile when he weeps."',
  '["Medical Textbook","Phone Directory","Novel"]'::jsonb,
  'Gaslighting Journal',
  '["gaslighting journal","journal","notebook","notes"]'::jsonb,
  'A book where secret psychological plans and manipulations were recorded.',
  'ev_8',
  false,
  '{"descriptions":["A red notebook detailing psychological gaslighting instructions is recovered.","At 01:30 AM: A red notebook detailing psychological gaslighting instructions is recovered.","Notice this clue: A red notebook detailing psychological gaslighting instructions is recovered."],"hints":["A book where secret psychological plans and manipulations were recorded.","Clue hint: Think about gaslighting journal.","Search for: vance wrote daily scripts for the actor to break arthur’s sense of time."],"clues":["Gaslighting Journal","Item: Gaslighting Journal","Clue Word: Gaslighting Journal"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f2e0d211-f4df-5a20-8e11-4c257db2ff80',
  'story_025',
  'ev_8',
  8,
  '02:00 AM',
  'Wheel marks from a hospital stretcher lead toward the rear loading bay.',
  'Wheel marks from a hospital stretcher lead toward the rear loading bay.',
  'Arthur was wheeled out unconscious into an unmarked private ambulance.',
  'Stretcher Tracks',
  'Twin rubber wheel marks on the dusty concrete tunnel floor.',
  '["Boot Prints","Shoe Marks","Cart Scrapes"]'::jsonb,
  'Stretcher Tracks',
  '["stretcher tracks","tracks","wheel marks","tire marks"]'::jsonb,
  'Lines pressed into floor dust by the small wheels of a hospital bed.',
  NULL,
  true,
  '{"descriptions":["Wheel marks from a hospital stretcher lead toward the rear loading bay.","At 02:00 AM: Wheel marks from a hospital stretcher lead toward the rear loading bay.","Notice this clue: Wheel marks from a hospital stretcher lead toward the rear loading bay."],"hints":["Lines pressed into floor dust by the small wheels of a hospital bed.","Clue hint: Think about stretcher tracks.","Search for: arthur was wheeled out unconscious into an unmarked private ambulance."],"clues":["Stretcher Tracks","Item: Stretcher Tracks","Clue Word: Stretcher Tracks"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_026 — THE DIARY WITH BLANK PAGES
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_026',
  'The Diary with Blank Pages',
  'Psychological',
  'Blackwood Hall, Attic Study, dusty grandfather clocks and rain pattering on the skylight',
  'Heiress Clara was found in a coma; beside her lay a leather diary whose two hundred pages were completely blank.',
  '[{"name":"Julian Sterling","role":"Wealthy Cousin","alibi":"In the garden greenhouse pruning roses","avatar":"🧥"},{"name":"Clara Sterling","role":"Comatose Heiress","alibi":"Found slumped over the attic desk","avatar":"🪞"},{"name":"Martha Higgins","role":"Old Housekeeper","alibi":"In the kitchen baking bread when Clara collapsed","avatar":"👵"},{"name":"Inspector James Vance","role":"Toxicology Investigator","alibi":"Arrived at Blackwood Hall with the ambulance team","avatar":"🔍"}]'::jsonb,
  'Julian Sterling wrote secret invisible ink messages that only appeared under heat, but laced the blank pages with a potent contact sedative. When Clara repeatedly flipped the pages trying to read the secrets, the toxin absorbed into her skin.',
  'Her Cousin Julian Sterling',
  'Julian wanted Clara declared legally incompetent so he could take control of the family shipping trust.',
  '[{"time":"09:00 AM","event":"Julian presents the antique blank diary to Clara as an heirloom."},{"time":"02:00 PM","event":"Clara spends four hours in the attic turning every page."},{"time":"04:15 PM","event":"Clara feels tingling numbness in her fingers and collapses."},{"time":"05:00 PM","event":"Martha finds Clara unconscious with the blank book open."},{"time":"06:30 PM","event":"Inspector Vance arrives with forensic ultraviolet equipment."}]'::jsonb,
  '[{"id":"ev1","title":"Aconite on Diary Pages","detail":"Chemical analysis confirms lethal plant alkaloid absorbed through fingertips."},{"id":"ev2","title":"Antidote Vial in Fountain Pen","detail":"Julian carried atropine antidote inside his brass pen."},{"id":"ev3","title":"Apothecary Monkshood Receipt","detail":"Proves Julian purchased concentrated aconite three days ago."},{"id":"ev4","title":"Incompetence Court Petition","detail":"Shows Julian planned to take legal control of Clara’s shipping trust."}]'::jsonb,
  '[{"order":1,"title":"Blank Diary","text":"Antique book with blank pages saturated with deadly contact poison."},{"order":2,"title":"Aconite Crystals","text":"Microscopic plant toxin that enters the bloodstream through skin."},{"order":3,"title":"Finger Rash","text":"Chemical irritation marks on Clara’s fingertips from turning the pages."},{"order":4,"title":"Invisible Ink","text":"Glowing writing revealed by blacklight designed to lure Clara to touch the book."},{"order":5,"title":"Antidote Pen","text":"Hollow writing pen containing the lifesaving counter-agent."},{"order":6,"title":"Incompetence Petition","text":"Court document prepared to seize control of the family fortune."}]'::jsonb,
  'Housekeeper Martha baked bread with poppy seeds.: Harmless baking ingredients unrelated to aconite poisoning.; Clara’s window was open during the rain.: She liked fresh air; no airborne toxins entered the room.',
  'Claim Clara poisoned herself out of grief or blame her housekeeper Martha.',
  'NORMAL',
  'Why were the diary pages blank and what caused Clara’s sudden deep coma?',
  '[{"character":"Julian Sterling","secret":"He coated the diary paper with concentrated aconite poison."},{"character":"Clara Sterling","secret":"She was investigating Julian’s embezzlement of shipping trust dividends."},{"character":"Martha Higgins","secret":"She heard Julian whispering on the garden telephone about trust funds."},{"character":"Inspector James Vance","secret":"Studied botanical poisons at the medical university."}]'::jsonb,
  '[{"lead":"Housekeeper Martha baked bread with poppy seeds.","explanation":"Harmless baking ingredients unrelated to aconite poisoning."},{"lead":"Clara’s window was open during the rain.","explanation":"She liked fresh air; no airborne toxins entered the room."}]'::jsonb,
  '{"wrongTheories":["Clara attempted suicide due to depression and loneliness.","Housekeeper Martha poisoned Clara’s evening tea out of resentment."],"correctTheory":"Cousin Julian Sterling coated the blank pages of an antique diary with aconite poison, luring Clara to touch the pages so the toxin would absorb through her skin and allow him to seize her shipping trust."}'::jsonb,
  'Cousin Julian Sterling poisoned the diary pages with aconite to steal the trust!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Inspector Vance administered the antidote found in Julian’s pen, saving Clara’s life. Julian was arrested for attempted murder and fraud."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Clara remained in a permanent coma. Julian filed the court petition, assumed control of the shipping trust, and lived in luxury."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Doctors diagnosed an unexplained rare autoimmune disorder. Julian was praised as a caring relative while secretly controlling her wealth."}]'::jsonb,
  '{"intros":["Heiress Clara was found in a coma; beside her lay a leather diary whose two hundred pages were completely blank.","Case file story_026: Heiress Clara was found in a coma; beside her lay a leather diary whose two hundred pages were completely blank. Look closely at every clue.","Trouble begins in Blackwood Hall, Attic Study, dusty grandfather clocks and rain pattering on the skylight. Heiress Clara was found in a coma; beside her lay a leather diary whose two hundred pages were completely blank.","The mystery starts now. Heiress Clara was found in a coma; beside her lay a leather diary whose two hundred pages were completely blank. Can you solve it?"],"reveals":["Cousin Julian Sterling poisoned the diary pages with aconite to steal the trust!","The mystery is unraveled! Cousin Julian Sterling poisoned the diary pages with aconite to steal the trust!","At last, the truth comes out: Cousin Julian Sterling poisoned the diary pages with aconite to steal the trust!","Case resolved! Here is what happened: Cousin Julian Sterling poisoned the diary pages with aconite to steal the trust!"],"hints":["Pay attention to where Her Cousin Julian Sterling was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_026';
DELETE FROM public.case_events WHERE case_id = 'story_026';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7135cdfb-38c1-5348-ba73-cd369fd1e408',
  'story_026',
  'Julian Sterling',
  'Wealthy Cousin',
  'Refined, soft-spoken, wearing cashmere sweaters and a false smile',
  'Clara became obsessed with family secrets and refused to eat or sleep.',
  'He coated the diary paper with concentrated aconite poison.',
  'In the garden greenhouse pruning roses',
  'Next in line to inherit the family shipping trust if Clara is incapacitated',
  'The invisible ink letters were written with lemon juice and salt.',
  'Did not know the ultraviolet forensic lamp reveals aconite crystal deposits.',
  '🧥',
  '["Clara became obsessed with family secrets and refused to eat or sleep.","\"Clara became obsessed with family secrets and refused to eat or sleep.\"","Listen to me: Clara became obsessed with family secrets and refused to eat or sleep.","I tell you the truth: Clara became obsessed with family secrets and refused to eat or sleep."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b5b7e3d1-7a46-51ea-8a02-4326958e5db5',
  'story_026',
  'Clara Sterling',
  'Comatose Heiress',
  'Curious, scholarly, devoted to family history',
  'Victim in deep coma; medical reports indicate transdermal toxin absorption.',
  'She was investigating Julian’s embezzlement of shipping trust dividends.',
  'Found slumped over the attic desk',
  'Sole heiress to the Sterling shipping empire',
  'Julian had visited an underground chemical apothecary last Tuesday.',
  'Did not realize turning the dry pages was poisoning her fingertips.',
  '🪞',
  '["Victim in deep coma; medical reports indicate transdermal toxin absorption.","\"Victim in deep coma; medical reports indicate transdermal toxin absorption.\"","Listen to me: Victim in deep coma; medical reports indicate transdermal toxin absorption.","I tell you the truth: Victim in deep coma; medical reports indicate transdermal toxin absorption."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '39437691-a368-523e-af5c-1ff8c9a74643',
  'story_026',
  'Martha Higgins',
  'Old Housekeeper',
  'Maternal, suspicious, constantly clutching her apron',
  'Mr. Julian gave Miss Clara that old leather book yesterday morning as a family gift.',
  'She heard Julian whispering on the garden telephone about trust funds.',
  'In the kitchen baking bread when Clara collapsed',
  'Cared for Clara since childhood',
  'Clara complained her fingertips felt numb and tingling after reading.',
  'Did not know how invisible contact poisons operate.',
  '👵',
  '["Mr. Julian gave Miss Clara that old leather book yesterday morning as a family gift.","\"Mr. Julian gave Miss Clara that old leather book yesterday morning as a family gift.\"","Listen to me: Mr. Julian gave Miss Clara that old leather book yesterday morning as a family gift.","I tell you the truth: Mr. Julian gave Miss Clara that old leather book yesterday morning as a family gift."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '063e593d-099f-5298-9190-5a9384dc17e9',
  'story_026',
  'Inspector James Vance',
  'Toxicology Investigator',
  'Methodical, bespectacled, carries reagent droppers and magnifying glass',
  'Paper can be a weapon if treated with volatile plant alkaloids.',
  'Studied botanical poisons at the medical university.',
  'Arrived at Blackwood Hall with the ambulance team',
  'Leading the poisoning inquiry',
  'Aconite leaves a microscopic crystalline residue on parchment.',
  'Did not know Julian kept the antidote vial in his fountain pen.',
  '🔍',
  '["Paper can be a weapon if treated with volatile plant alkaloids.","\"Paper can be a weapon if treated with volatile plant alkaloids.\"","Listen to me: Paper can be a weapon if treated with volatile plant alkaloids.","I tell you the truth: Paper can be a weapon if treated with volatile plant alkaloids."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dc0df66b-fe44-5484-a2d1-46c3594e321c',
  'story_026',
  'ev_1',
  1,
  '02:00 PM',
  'A heavy leather-bound journal with gold clasps lies open with empty pages.',
  'A heavy leather-bound journal with gold clasps lies open with empty pages.',
  'The blank pages were saturated with a colorless, odorless poison.',
  'Blank Diary',
  'Calfskin journal containing two hundred blank linen pages.',
  '["Photo Album","Dictionary","Bible"]'::jsonb,
  'Blank Diary',
  '["blank diary","diary","journal","book"]'::jsonb,
  'A bound book with empty white pages used to write personal thoughts.',
  'ev_2',
  true,
  '{"descriptions":["A heavy leather-bound journal with gold clasps lies open with empty pages.","At 02:00 PM: A heavy leather-bound journal with gold clasps lies open with empty pages.","Notice this clue: A heavy leather-bound journal with gold clasps lies open with empty pages."],"hints":["A bound book with empty white pages used to write personal thoughts.","Clue hint: Think about blank diary.","Search for: the blank pages were saturated with a colorless, odorless poison."],"clues":["Blank Diary","Item: Blank Diary","Clue Word: Blank Diary"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ed64b2ed-4bcf-5aab-bde2-c832e3cd0293',
  'story_026',
  'ev_2',
  2,
  '04:15 PM',
  'Microscopic crystalline powder is scraped from the edges of the pages.',
  'Microscopic crystalline powder is scraped from the edges of the pages.',
  'The paper was treated with aconite, a lethal transdermal plant alkaloid.',
  'Aconite Crystals',
  'Fine white plant alkaloid crystals identified by chemical reagents.',
  '["Chalk Dust","Sugar Grains","Talcum Powder"]'::jsonb,
  'Aconite Crystals',
  '["aconite crystals","crystals","aconite","poison","powder"]'::jsonb,
  'Tiny shiny mineral specks of deadly plant poison that enter skin through touch.',
  'ev_3',
  false,
  '{"descriptions":["Microscopic crystalline powder is scraped from the edges of the pages.","At 04:15 PM: Microscopic crystalline powder is scraped from the edges of the pages.","Notice this clue: Microscopic crystalline powder is scraped from the edges of the pages."],"hints":["Tiny shiny mineral specks of deadly plant poison that enter skin through touch.","Clue hint: Think about aconite crystals.","Search for: the paper was treated with aconite, a lethal transdermal plant alkaloid."],"clues":["Aconite Crystals","Item: Aconite Crystals","Clue Word: Aconite Crystals"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5060ac58-1c80-5f2a-b4f2-af6c3d76165e',
  'story_026',
  'ev_3',
  3,
  '04:30 PM',
  'Clara’s index fingertips show microscopic red chemical rash lines.',
  'Clara’s index fingertips show microscopic red chemical rash lines.',
  'The poison absorbed directly through her skin as she turned the pages.',
  'Finger Rash',
  'Forensic photos of contact dermatitis on Clara’s right thumb and forefinger.',
  '["Burn Blister","Paper Cut","Ink Stain"]'::jsonb,
  'Finger Rash',
  '["finger rash","rash","burn","skin irritation"]'::jsonb,
  'Red swollen irritation on human skin caused by poisonous contact.',
  'ev_4',
  false,
  '{"descriptions":["Clara’s index fingertips show microscopic red chemical rash lines.","At 04:30 PM: Clara’s index fingertips show microscopic red chemical rash lines.","Notice this clue: Clara’s index fingertips show microscopic red chemical rash lines."],"hints":["Red swollen irritation on human skin caused by poisonous contact.","Clue hint: Think about finger rash.","Search for: the poison absorbed directly through her skin as she turned the pages."],"clues":["Finger Rash","Item: Finger Rash","Clue Word: Finger Rash"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '474dcff8-6045-5e42-a7be-31fe338e1602',
  'story_026',
  'ev_4',
  4,
  '05:15 PM',
  'An ultraviolet blacklight reveals hidden glowing text beneath the paper.',
  'An ultraviolet blacklight reveals hidden glowing text beneath the paper.',
  'Julian wrote fake instructions in lemon juice to make her touch every page.',
  'Invisible Ink',
  'Fluorescent yellow writing visible only under 365nm UV light.',
  '["Watermark","Pencil Sketch","Charcoal Rubbing"]'::jsonb,
  'Invisible Ink',
  '["invisible ink","ink","hidden writing","uv ink"]'::jsonb,
  'Special clear writing that can only be seen under special blacklight or heat.',
  'ev_5',
  false,
  '{"descriptions":["An ultraviolet blacklight reveals hidden glowing text beneath the paper.","At 05:15 PM: An ultraviolet blacklight reveals hidden glowing text beneath the paper.","Notice this clue: An ultraviolet blacklight reveals hidden glowing text beneath the paper."],"hints":["Special clear writing that can only be seen under special blacklight or heat.","Clue hint: Think about invisible ink.","Search for: julian wrote fake instructions in lemon juice to make her touch every page."],"clues":["Invisible Ink","Item: Invisible Ink","Clue Word: Invisible Ink"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a894fcc5-b65b-5e21-a164-40564b2c3f91',
  'story_026',
  'ev_5',
  5,
  '05:40 PM',
  'A hollow brass fountain pen containing an antidote vial is found in Julian’s pocket.',
  'A hollow brass fountain pen containing an antidote vial is found in Julian’s pocket.',
  'Julian carried the antidote in case he accidentally touched the pages.',
  'Antidote Pen',
  'Fountain pen barrel concealing a 2ml glass vial of atropine antidote.',
  '["Pocket Knife","Cigarette Lighter","Lipstick"]'::jsonb,
  'Antidote Pen',
  '["antidote pen","pen","fountain pen","vial"]'::jsonb,
  'A metal writing pen that hides a tiny bottle of medicine inside its handle.',
  'ev_6',
  true,
  '{"descriptions":["A hollow brass fountain pen containing an antidote vial is found in Julian’s pocket.","At 05:40 PM: A hollow brass fountain pen containing an antidote vial is found in Julian’s pocket.","Notice this clue: A hollow brass fountain pen containing an antidote vial is found in Julian’s pocket."],"hints":["A metal writing pen that hides a tiny bottle of medicine inside its handle.","Clue hint: Think about antidote pen.","Search for: julian carried the antidote in case he accidentally touched the pages."],"clues":["Antidote Pen","Item: Antidote Pen","Clue Word: Antidote Pen"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '07dcaca5-7e10-5787-ae43-111a77a25545',
  'story_026',
  'ev_6',
  6,
  '06:00 PM',
  'A legal petition to declare Clara Sterling mentally incompetent is in Julian’s car.',
  'A legal petition to declare Clara Sterling mentally incompetent is in Julian’s car.',
  'Julian prepared court papers to take control of the family trust.',
  'Incompetence Petition',
  'Legal document prepared by trust lawyers ready for filing on Monday.',
  '["Will Copy","Stock Share","Tax Return"]'::jsonb,
  'Incompetence Petition',
  '["incompetence petition","petition","legal petition","document","court papers"]'::jsonb,
  'A formal legal paper asking a judge to rule that someone cannot make decisions.',
  'ev_7',
  false,
  '{"descriptions":["A legal petition to declare Clara Sterling mentally incompetent is in Julian’s car.","At 06:00 PM: A legal petition to declare Clara Sterling mentally incompetent is in Julian’s car.","Notice this clue: A legal petition to declare Clara Sterling mentally incompetent is in Julian’s car."],"hints":["A formal legal paper asking a judge to rule that someone cannot make decisions.","Clue hint: Think about incompetence petition.","Search for: julian prepared court papers to take control of the family trust."],"clues":["Incompetence Petition","Item: Incompetence Petition","Clue Word: Incompetence Petition"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '81e6f5e3-5843-5ff5-ac45-f81bfca9bac7',
  'story_026',
  'ev_7',
  7,
  '06:30 PM',
  'An apothecary sales receipt for monkshood plant extract is discovered.',
  'An apothecary sales receipt for monkshood plant extract is discovered.',
  'Julian bought concentrated aconite extract from an herbal shop.',
  'Apothecary Receipt',
  'Paper receipt from "Old Wharf Botanicals" stamped with Julian’s name.',
  '["Grocery Bill","Gas Receipt","Train Ticket"]'::jsonb,
  'Apothecary Receipt',
  '["apothecary receipt","receipt","botanical receipt","paper"]'::jsonb,
  'A paper slip proving the purchase of rare herbs and chemicals.',
  'ev_8',
  false,
  '{"descriptions":["An apothecary sales receipt for monkshood plant extract is discovered.","At 06:30 PM: An apothecary sales receipt for monkshood plant extract is discovered.","Notice this clue: An apothecary sales receipt for monkshood plant extract is discovered."],"hints":["A paper slip proving the purchase of rare herbs and chemicals.","Clue hint: Think about apothecary receipt.","Search for: julian bought concentrated aconite extract from an herbal shop."],"clues":["Apothecary Receipt","Item: Apothecary Receipt","Clue Word: Apothecary Receipt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c3772bc3-f06d-53a2-b4db-41871d8f4ffe',
  'story_026',
  'ev_8',
  8,
  '07:00 PM',
  'A pair of thin latex examination gloves is found in Julian’s dresser drawer.',
  'A pair of thin latex examination gloves is found in Julian’s dresser drawer.',
  'Julian wore protective gloves while brushing the poison onto the paper.',
  'Latex Gloves',
  'Clear surgical gloves with aconite residue on the fingertips.',
  '["Wool Mittens","Gardening Gloves","Leather Gloves"]'::jsonb,
  'Latex Gloves',
  '["latex gloves","gloves","surgical gloves","rubber gloves"]'::jsonb,
  'Thin stretchy rubber coverings worn by doctors to keep hands clean and safe.',
  NULL,
  true,
  '{"descriptions":["A pair of thin latex examination gloves is found in Julian’s dresser drawer.","At 07:00 PM: A pair of thin latex examination gloves is found in Julian’s dresser drawer.","Notice this clue: A pair of thin latex examination gloves is found in Julian’s dresser drawer."],"hints":["Thin stretchy rubber coverings worn by doctors to keep hands clean and safe.","Clue hint: Think about latex gloves.","Search for: julian wore protective gloves while brushing the poison onto the paper."],"clues":["Latex Gloves","Item: Latex Gloves","Clue Word: Latex Gloves"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_027 — THE TAPE RECORDER IN THE ATTIC
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_027',
  'The Tape Recorder in the Attic',
  'Psychological',
  'The Hawthorne Family Manor, dusty wood-beamed attic filled with vintage furniture',
  'A reel-to-reel tape recorder played nightly in the attic, broadcasting therapy sessions of a murder that never happened.',
  '[{"name":"Dr. Raymond Cross","role":"Family Psychiatrist","alibi":"At his private clinical office in the medical district","avatar":"🎙️"},{"name":"David Hawthorne","role":"Traumatized Heir","alibi":"Asleep in his bedroom directly beneath the attic","avatar":"👤"},{"name":"Evelyn Hawthorne","role":"Stepmother","alibi":"Downstairs parlor reading by the fireplace","avatar":"🪞"},{"name":"Detective Marcus Bell","role":"Sound & Forensic Investigator","alibi":"Dispatched after David called police to report hearing phantom voices","avatar":"🎧"}]'::jsonb,
  'Psychiatrist Dr. Raymond Cross spliced recordings of David’s voice from routine therapy sessions into a fake murder confession. He hidden a timer-operated reel-to-reel tape player in the attic to play the voices above David’s bedroom every night, driving him to confess to a fabricated patricide.',
  'Dr. Raymond Cross',
  'Raymond wanted to convince patient David that David had killed his father, to extort hush money.',
  '[{"time":"02:00 AM","event":"David falls into a deep, exhausted sleep in his bedroom."},{"time":"03:00 AM","event":"A mechanical clockwork timer triggers the attic tape recorder."},{"time":"03:02 AM","event":"Spliced audio of David sobbing and admitting to murder plays through floorboards."},{"time":"03:15 AM","event":"David wakes up in terror, convinced he committed patricide."},{"time":"08:00 AM","event":"Detective Bell inspects the attic and finds the hidden audio setup."}]'::jsonb,
  '[{"id":"ev1","title":"Spliced Magnetic Tape on Recorder","detail":"Audio analysis shows 42 distinct razor splices fabricating a fake confession."},{"id":"ev2","title":"Aluminum Splicing Block","detail":"Found behind the attic beam with Dr. Raymond Cross’s fingerprints."},{"id":"ev3","title":"Father’s Hospital Death Certificate","detail":"Proves David’s father died of natural heart disease, not murder."},{"id":"ev4","title":"Half-Million-Dollar Hush Agreement","detail":"Discovered in Dr. Cross’s briefcase, proving the extortion scheme."}]'::jsonb,
  '[{"order":1,"title":"Reel-to-Reel Recorder","text":"Machine hidden in the attic broadcasting audio through the floor."},{"order":2,"title":"Spliced Audio Tape","text":"Voice tape cut with razor blades to manufacture a false murder confession."},{"order":3,"title":"Mechanical Timer","text":"Electric switch set to trigger the eerie voices during deep sleep."},{"order":4,"title":"Attic Speaker","text":"Speaker cone aimed down into David’s bedroom ceiling."},{"order":5,"title":"Death Certificate","text":"Document proving the father died of natural heart failure."},{"order":6,"title":"Blackmail Contract","text":"Extortion agreement demanding half a million dollars for silence."}]'::jsonb,
  'Stepmother Evelyn stood by the stairs looking nervous.: She was anxious about the inheritance, but knew nothing of the tapes.; David had childhood diaries about arguing with his father.: Normal family squabbles from ten years prior.',
  'Claim David had a genuine repressed memory or blame his stepmother Evelyn.',
  'NORMAL',
  'Who planted the voice recordings and who was being manipulated by the false memories?',
  '[{"character":"Dr. Raymond Cross","secret":"He forged the audio tapes to extort David out of five hundred thousand dollars."},{"character":"David Hawthorne","secret":"He was considering turning himself in to police for a crime he did not commit."},{"character":"Evelyn Hawthorne","secret":"She hired Dr. Cross without verifying his suspended medical license."},{"character":"Detective Marcus Bell","secret":"Operated audio surveillance in military intelligence."}]'::jsonb,
  '[{"lead":"Stepmother Evelyn stood by the stairs looking nervous.","explanation":"She was anxious about the inheritance, but knew nothing of the tapes."},{"lead":"David had childhood diaries about arguing with his father.","explanation":"Normal family squabbles from ten years prior."}]'::jsonb,
  '{"wrongTheories":["David suffered from genuine sleepwalking and committed an unrecorded assault.","The house was haunted by the restless ghost of David’s late father."],"correctTheory":"Dr. Raymond Cross spliced recordings of David’s therapy sessions into a fake confession, playing it through an attic timer to make David believe he killed his father so Cross could extort five hundred thousand dollars."}'::jsonb,
  'Dr. Raymond Cross spliced David’s voice to extort five hundred thousand dollars!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Bell played the unedited master tapes for David, freeing him from his psychological nightmare. Dr. Cross was arrested for extortion and psychological torture."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"David signed the half-million-dollar settlement and admitted himself to a permanent asylum. Dr. Cross collected the money and took control of the family estate."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The case was dismissed as a ghost story rumor. David lived in permanent terror while Dr. Cross continued exploiting wealthy patients."}]'::jsonb,
  '{"intros":["A reel-to-reel tape recorder played nightly in the attic, broadcasting therapy sessions of a murder that never happened.","Case file story_027: A reel-to-reel tape recorder played nightly in the attic, broadcasting therapy sessions of a murder that never happened. Look closely at every clue.","Trouble begins in The Hawthorne Family Manor, dusty wood-beamed attic filled with vintage furniture. A reel-to-reel tape recorder played nightly in the attic, broadcasting therapy sessions of a murder that never happened.","The mystery starts now. A reel-to-reel tape recorder played nightly in the attic, broadcasting therapy sessions of a murder that never happened. Can you solve it?"],"reveals":["Dr. Raymond Cross spliced David’s voice to extort five hundred thousand dollars!","The mystery is unraveled! Dr. Raymond Cross spliced David’s voice to extort five hundred thousand dollars!","At last, the truth comes out: Dr. Raymond Cross spliced David’s voice to extort five hundred thousand dollars!","Case resolved! Here is what happened: Dr. Raymond Cross spliced David’s voice to extort five hundred thousand dollars!"],"hints":["Pay attention to where Dr. Raymond Cross was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_027';
DELETE FROM public.case_events WHERE case_id = 'story_027';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '42264128-a42d-50c1-8b95-6fa2c7ed0d63',
  'story_027',
  'Dr. Raymond Cross',
  'Family Psychiatrist',
  'Smooth, intellectual, wears rimless glasses and a wool vest',
  'David has finally unlocked the repressed memory of pushing his father down the stairs.',
  'He forged the audio tapes to extort David out of five hundred thousand dollars.',
  'At his private clinical office in the medical district',
  'David’s personal therapist for three years',
  'David’s father died of natural heart failure in a hospital bed.',
  'Did not notice he left splicing tape and magnetic leader tape in the attic beam.',
  '🎙️',
  '["David has finally unlocked the repressed memory of pushing his father down the stairs.","\"David has finally unlocked the repressed memory of pushing his father down the stairs.\"","Listen to me: David has finally unlocked the repressed memory of pushing his father down the stairs.","I tell you the truth: David has finally unlocked the repressed memory of pushing his father down the stairs."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fe03f541-32aa-54c4-9b91-441780015699',
  'story_027',
  'David Hawthorne',
  'Traumatized Heir',
  'Distraught, sleep-deprived, dark circles under bloodshot eyes',
  'I hear my own voice every night crying that I pushed father. But I loved him!',
  'He was considering turning himself in to police for a crime he did not commit.',
  'Asleep in his bedroom directly beneath the attic',
  'Sole heir to the Hawthorne industrial fortune',
  'The voice on the tape sounds slightly mechanical and disjointed.',
  'Did not realize his mind was being conditioned by nightly acoustic suggestion.',
  '👤',
  '["I hear my own voice every night crying that I pushed father. But I loved him!","\"I hear my own voice every night crying that I pushed father. But I loved him!\"","Listen to me: I hear my own voice every night crying that I pushed father. But I loved him!","I tell you the truth: I hear my own voice every night crying that I pushed father. But I loved him!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '58d06114-648a-5aef-82b0-bab33dbec15f',
  'story_027',
  'Evelyn Hawthorne',
  'Stepmother',
  'Elegant, sharp, suspicious of David’s mental stability',
  'David has been having nightmares ever since his father’s funeral last month.',
  'She hired Dr. Cross without verifying his suspended medical license.',
  'Downstairs parlor reading by the fireplace',
  'Widow of David’s late father',
  'Heard mechanical clicking sounds coming from the attic ceiling at 3:00 AM.',
  'Did not know Dr. Cross was fabricating audio tapes.',
  '🪞',
  '["David has been having nightmares ever since his father’s funeral last month.","\"David has been having nightmares ever since his father’s funeral last month.\"","Listen to me: David has been having nightmares ever since his father’s funeral last month.","I tell you the truth: David has been having nightmares ever since his father’s funeral last month."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd15bdefc-9006-5868-a948-e1d3d1fe73b2',
  'story_027',
  'Detective Marcus Bell',
  'Sound & Forensic Investigator',
  'Analytical, quiet, carries an acoustic audio analyzer',
  'Human speech has natural breathing rhythms. This audio tape was spliced together from forty different sentences.',
  'Operated audio surveillance in military intelligence.',
  'Dispatched after David called police to report hearing phantom voices',
  'Investigating psychological harassment and extortion',
  'Found microscopic razor blade cuts across the magnetic tape strip.',
  'Did not immediately have the master studio recordings.',
  '🎧',
  '["Human speech has natural breathing rhythms. This audio tape was spliced together from forty different sentences.","\"Human speech has natural breathing rhythms. This audio tape was spliced together from forty different sentences.\"","Listen to me: Human speech has natural breathing rhythms. This audio tape was spliced together from forty different sentences.","I tell you the truth: Human speech has natural breathing rhythms. This audio tape was spliced together from forty different sentences."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c760076a-9f11-55c4-bc12-ccac7b66d327',
  'story_027',
  'ev_1',
  1,
  '03:00 AM',
  'A vintage reel-to-reel magnetic tape recorder starts spinning on a timer.',
  'A vintage reel-to-reel magnetic tape recorder starts spinning on a timer.',
  'The voices were produced by physical equipment hidden behind old trunks.',
  'Reel-to-Reel Recorder',
  'Akai professional dual-spool audio player connected to an electric wall timer.',
  '["Phonograph","Radio","Cassette Deck"]'::jsonb,
  'Reel-to-Reel Recorder',
  '["reel-to-reel recorder","recorder","tape recorder","reel to reel","audio player"]'::jsonb,
  'A vintage machine that plays sound recorded on large spools of magnetic tape.',
  'ev_2',
  true,
  '{"descriptions":["A vintage reel-to-reel magnetic tape recorder starts spinning on a timer.","At 03:00 AM: A vintage reel-to-reel magnetic tape recorder starts spinning on a timer.","Notice this clue: A vintage reel-to-reel magnetic tape recorder starts spinning on a timer."],"hints":["A vintage machine that plays sound recorded on large spools of magnetic tape.","Clue hint: Think about reel-to-reel recorder.","Search for: the voices were produced by physical equipment hidden behind old trunks."],"clues":["Reel-to-Reel Recorder","Item: Reel-to-Reel Recorder","Clue Word: Reel-to-Reel Recorder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ddd08d1d-d13d-51a4-99bb-34a006566dd0',
  'story_027',
  'ev_2',
  2,
  '03:05 AM',
  'Microscopic razor blade slices join individual audio tape segments.',
  'Microscopic razor blade slices join individual audio tape segments.',
  'Words were cut from different conversations and reassembled with adhesive.',
  'Spliced Audio Tape',
  'Quarter-inch brown magnetic tape with clear splicing tape joins every two inches.',
  '["Intact Ribbon","Punched Paper","Wire Spool"]'::jsonb,
  'Spliced Audio Tape',
  '["spliced audio tape","tape","spliced tape","audio tape","magnetic tape"]'::jsonb,
  'A strip of magnetic recording tape cut and glued together to fake a speech.',
  'ev_3',
  false,
  '{"descriptions":["Microscopic razor blade slices join individual audio tape segments.","At 03:05 AM: Microscopic razor blade slices join individual audio tape segments.","Notice this clue: Microscopic razor blade slices join individual audio tape segments."],"hints":["A strip of magnetic recording tape cut and glued together to fake a speech.","Clue hint: Think about spliced audio tape.","Search for: words were cut from different conversations and reassembled with adhesive."],"clues":["Spliced Audio Tape","Item: Spliced Audio Tape","Clue Word: Spliced Audio Tape"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b9f33a53-47bb-5cc5-af2d-e72fc8f12864',
  'story_027',
  'ev_3',
  3,
  '03:10 AM',
  'An electric wall timer dial set to turn on at exactly 3:00 AM every night.',
  'An electric wall timer dial set to turn on at exactly 3:00 AM every night.',
  'The playback was scheduled to target David during his deepest REM sleep.',
  'Mechanical Timer',
  '24-hour rotary timer socket plugged into the attic baseboard.',
  '["Alarm Clock","Stopwatch","Thermostat"]'::jsonb,
  'Mechanical Timer',
  '["mechanical timer","timer","electric timer","socket timer"]'::jsonb,
  'A plug-in device that automatically turns electricity on and off at set hours.',
  'ev_4',
  false,
  '{"descriptions":["An electric wall timer dial set to turn on at exactly 3:00 AM every night.","At 03:10 AM: An electric wall timer dial set to turn on at exactly 3:00 AM every night.","Notice this clue: An electric wall timer dial set to turn on at exactly 3:00 AM every night."],"hints":["A plug-in device that automatically turns electricity on and off at set hours.","Clue hint: Think about mechanical timer.","Search for: the playback was scheduled to target david during his deepest rem sleep."],"clues":["Mechanical Timer","Item: Mechanical Timer","Clue Word: Mechanical Timer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '01768e0f-44c2-5ad9-a268-683725e926ab',
  'story_027',
  'ev_4',
  4,
  '03:12 AM',
  'A downward-facing speaker sits directly over the bedroom ceiling joist.',
  'A downward-facing speaker sits directly over the bedroom ceiling joist.',
  'The sound was channeled through the floorboards into David’s ears.',
  'Attic Speaker',
  'Small high-fidelity speaker cone pressed face-down against the floor lath.',
  '["Microphone","Megaphone","Headphones"]'::jsonb,
  'Attic Speaker',
  '["attic speaker","speaker","sound box","amplifier"]'::jsonb,
  'An electronic device that turns electrical signals into audible sound.',
  'ev_5',
  false,
  '{"descriptions":["A downward-facing speaker sits directly over the bedroom ceiling joist.","At 03:12 AM: A downward-facing speaker sits directly over the bedroom ceiling joist.","Notice this clue: A downward-facing speaker sits directly over the bedroom ceiling joist."],"hints":["An electronic device that turns electrical signals into audible sound.","Clue hint: Think about attic speaker.","Search for: the sound was channeled through the floorboards into david’s ears."],"clues":["Attic Speaker","Item: Attic Speaker","Clue Word: Attic Speaker"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '84eb61df-059d-51cd-91cb-c3dead0a0ab7',
  'story_027',
  'ev_5',
  5,
  '03:20 AM',
  'A professional sound-editing razor block and blue splicing tape are found.',
  'A professional sound-editing razor block and blue splicing tape are found.',
  'The doctor assembled the tapes inside the attic workshop.',
  'Splicing Block',
  'Aluminum guide block with 45-degree angle cutting slots.',
  '["Hole Punch","Stapler","Paper Trimmer"]'::jsonb,
  'Splicing Block',
  '["splicing block","block","tape cutter","audio tool"]'::jsonb,
  'A grooved metal block used by sound engineers to cut and splice recording tape.',
  'ev_6',
  true,
  '{"descriptions":["A professional sound-editing razor block and blue splicing tape are found.","At 03:20 AM: A professional sound-editing razor block and blue splicing tape are found.","Notice this clue: A professional sound-editing razor block and blue splicing tape are found."],"hints":["A grooved metal block used by sound engineers to cut and splice recording tape.","Clue hint: Think about splicing block.","Search for: the doctor assembled the tapes inside the attic workshop."],"clues":["Splicing Block","Item: Splicing Block","Clue Word: Splicing Block"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '44937e9d-c047-5e55-890c-5399570e1639',
  'story_027',
  'ev_6',
  6,
  '04:00 AM',
  'A certified hospital death certificate shows David’s father died of coronary failure.',
  'A certified hospital death certificate shows David’s father died of coronary failure.',
  'The murder David was confessing to never actually happened.',
  'Death Certificate',
  'Official hospital record confirming natural death from heart attack.',
  '["Autopsy Report","Will","Insurance Policy"]'::jsonb,
  'Death Certificate',
  '["death certificate","certificate","medical record","hospital record"]'::jsonb,
  'An official government paper certifying when and how a person died.',
  'ev_7',
  false,
  '{"descriptions":["A certified hospital death certificate shows David’s father died of coronary failure.","At 04:00 AM: A certified hospital death certificate shows David’s father died of coronary failure.","Notice this clue: A certified hospital death certificate shows David’s father died of coronary failure."],"hints":["An official government paper certifying when and how a person died.","Clue hint: Think about death certificate.","Search for: the murder david was confessing to never actually happened."],"clues":["Death Certificate","Item: Death Certificate","Clue Word: Death Certificate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a2920ce7-9c21-58ef-9de8-4966e7375946',
  'story_027',
  'ev_7',
  7,
  '04:30 AM',
  'A draft blackmail agreement demanding five hundred thousand dollars is found in Cross’s car.',
  'A draft blackmail agreement demanding five hundred thousand dollars is found in Cross’s car.',
  'Cross planned to offer "confidential psychiatric protection" for half a million.',
  'Blackmail Contract',
  'Typed agreement disguised as a private mental health settlement.',
  '["Lease","Check","Receipt"]'::jsonb,
  'Blackmail Contract',
  '["blackmail contract","contract","agreement","settlement"]'::jsonb,
  'A legal-looking paper demanding money in exchange for keeping secrets.',
  'ev_8',
  false,
  '{"descriptions":["A draft blackmail agreement demanding five hundred thousand dollars is found in Cross’s car.","At 04:30 AM: A draft blackmail agreement demanding five hundred thousand dollars is found in Cross’s car.","Notice this clue: A draft blackmail agreement demanding five hundred thousand dollars is found in Cross’s car."],"hints":["A legal-looking paper demanding money in exchange for keeping secrets.","Clue hint: Think about blackmail contract.","Search for: cross planned to offer \"confidential psychiatric protection\" for half a million."],"clues":["Blackmail Contract","Item: Blackmail Contract","Clue Word: Blackmail Contract"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7460f199-cb5e-54f3-a6ce-d6462d44575a',
  'story_027',
  'ev_8',
  8,
  '05:00 AM',
  'The original unedited therapy session tapes are recovered from Dr. Cross’s clinic.',
  'The original unedited therapy session tapes are recovered from Dr. Cross’s clinic.',
  'Cross took innocent words from therapy and spliced them into a confession.',
  'Master Therapy Tapes',
  'Labeled audio reels showing the original sentences David spoke.',
  '["Medical Notes","Prescription Log","Appointment Book"]'::jsonb,
  'Master Therapy Tapes',
  '["master therapy tapes","tapes","therapy tapes","master tapes","reels"]'::jsonb,
  'Spools of original unedited voice recordings from doctor appointments.',
  NULL,
  true,
  '{"descriptions":["The original unedited therapy session tapes are recovered from Dr. Cross’s clinic.","At 05:00 AM: The original unedited therapy session tapes are recovered from Dr. Cross’s clinic.","Notice this clue: The original unedited therapy session tapes are recovered from Dr. Cross’s clinic."],"hints":["Spools of original unedited voice recordings from doctor appointments.","Clue hint: Think about master therapy tapes.","Search for: cross took innocent words from therapy and spliced them into a confession."],"clues":["Master Therapy Tapes","Item: Master Therapy Tapes","Clue Word: Master Therapy Tapes"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_028 — THE CLOCK THAT TICKED BACKWARD
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_028',
  'The Clock that Ticked Backward',
  'Psychological',
  'The Blackwood Clockwork Sanctuary, workshop filled with ticking pendulums and brass cogs',
  'Horologist Silas Vance was found trapped in his workshop; his master clock was running in reverse and his memory of the last three days was completely wiped.',
  '[{"name":"Peter Ross","role":"Apprentice Horologist","alibi":"In the basement brass foundry casting pendulum weights","avatar":"⚙️"},{"name":"Silas Vance","role":"Master Clockmaker","alibi":"Trapped inside the locked workshop","avatar":"🕰️"},{"name":"Lord Henry Sterling","role":"Antique Collector","alibi":"At his club reading morning auction gazettes","avatar":"🎩"},{"name":"Inspector Thomas Vance","role":"Forensic Investigator","alibi":"Dispatched to the workshop after a neighbor reported a gas smell","avatar":"🔍"}]'::jsonb,
  'Apprentice Peter Ross reversed the gears on the master vault clock to roll back its electronic lock timer. He introduced mild carbon monoxide fumes through the chimney flue, inducing hypoxia-driven retrograde amnesia in Silas before stealing the million-dollar clockwork patent.',
  'Apprentice Peter Ross',
  'Peter reversed the clock to alter the vault timer and steal the prototype perpetual escapement.',
  '[{"time":"07:00 PM","event":"Silas locks the workshop and tests the perpetual escapement."},{"time":"09:30 PM","event":"Peter introduces carbon monoxide fumes into the workshop chimney flue."},{"time":"10:15 PM","event":"Silas becomes confused and collapses into an amnesic stupor."},{"time":"10:30 PM","event":"Peter reverses the clock gears, cycling the vault door open."},{"time":"11:00 PM","event":"Peter removes the brass escapement prototype and flees."}]'::jsonb,
  '[{"id":"ev1","title":"Reverse Idler Gear","detail":"Machined by Peter Ross to force the clock and vault timer to cycle backward."},{"id":"ev2","title":"Gas Hose in Chimney Flue","detail":"Delivered carbon monoxide into the workshop to induce amnesia in Silas."},{"id":"ev3","title":"Brass Wrench P.R.","detail":"Peter’s personal tool dropped in the chimney damper while fixing the gas pipe."},{"id":"ev4","title":"Stolen Escapement Blueprints","detail":"Discovered in Peter’s locker alongside foreign buyer contracts."}]'::jsonb,
  '[{"order":1,"title":"Reversed Clock Hands","text":"Clock hands sweeping backward to manipulate the vault lock cycle."},{"order":2,"title":"Reverse Idler Gear","text":"Toothed brass cog inserted into the mechanism to reverse movement."},{"order":3,"title":"Perpetual Escapement","text":"Priceless prototype mechanism stolen from the locked glass case."},{"order":4,"title":"Gas Detector Alarm","text":"Meter reading high levels of toxic memory-wiping carbon monoxide."},{"order":5,"title":"Rubber Gas Hose","text":"Hose used to pump odorless gas down the chimney from the roof."},{"order":6,"title":"Brass Wrench","text":"Watchmaker tool stamped P.R. dropped in the ventilation flue."}]'::jsonb,
  'Lord Henry threatened Silas over delivery delays.: A frustrated buyer, but he was attending his club dinner.; The workshop had several ancient clocks ticking out of sync.: Normal background acoustical variance in a repair shop.',
  'Claim the backward clock created a supernatural time rift or blame the clock collector Lord Henry.',
  'NORMAL',
  'Why did the clock tick backward and what caused Silas’s sudden amnesia?',
  '[{"character":"Peter Ross","secret":"He sold Silas’s perpetual motion escapement design to a Swiss firm."},{"character":"Silas Vance","secret":"He planned to pass the clockwork patent to Peter in his upcoming will."},{"character":"Lord Henry Sterling","secret":"He hired private investigators to monitor the workshop for patent leaks."},{"character":"Inspector Thomas Vance","secret":"Fascinated by mechanical automata and antique clocks."}]'::jsonb,
  '[{"lead":"Lord Henry threatened Silas over delivery delays.","explanation":"A frustrated buyer, but he was attending his club dinner."},{"lead":"The workshop had several ancient clocks ticking out of sync.","explanation":"Normal background acoustical variance in a repair shop."}]'::jsonb,
  '{"wrongTheories":["The reverse clock opened a temporal displacement anomaly that erased Silas’s memories.","Silas suffered an ordinary stroke due to old age and smashed his own invention."],"correctTheory":"Apprentice Peter Ross pumped carbon monoxide down the chimney to induce amnesia in Silas, reversed the clock gears to open the vault timer, and stole the perpetual escapement prototype to sell abroad."}'::jsonb,
  'Apprentice Peter Ross reversed the clock and gassed Silas to steal the patent!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The wrench in the flue and the blueprints in Peter’s locker trapped the apprentice. Peter was arrested, the prototype was recovered, and Silas’s memory slowly returned."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Silas was declared medically incompetent due to dementia. Peter took over the workshop and sold the patent to the Swiss firm for millions."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The legend of the \"Clock That Traps Time\" spread through folklore, obscuring the industrial theft completely."}]'::jsonb,
  '{"intros":["Horologist Silas Vance was found trapped in his workshop; his master clock was running in reverse and his memory of the last three days was completely wiped.","Case file story_028: Horologist Silas Vance was found trapped in his workshop; his master clock was running in reverse and his memory of the last three days was completely wiped. Look closely at every clue.","Trouble begins in The Blackwood Clockwork Sanctuary, workshop filled with ticking pendulums and brass cogs. Horologist Silas Vance was found trapped in his workshop; his master clock was running in reverse and his memory of the last three days was completely wiped.","The mystery starts now. Horologist Silas Vance was found trapped in his workshop; his master clock was running in reverse and his memory of the last three days was completely wiped. Can you solve it?"],"reveals":["Apprentice Peter Ross reversed the clock and gassed Silas to steal the patent!","The mystery is unraveled! Apprentice Peter Ross reversed the clock and gassed Silas to steal the patent!","At last, the truth comes out: Apprentice Peter Ross reversed the clock and gassed Silas to steal the patent!","Case resolved! Here is what happened: Apprentice Peter Ross reversed the clock and gassed Silas to steal the patent!"],"hints":["Pay attention to where Apprentice Peter Ross was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_028';
DELETE FROM public.case_events WHERE case_id = 'story_028';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8adb22c9-73cf-5080-82b5-877623be8fac',
  'story_028',
  'Peter Ross',
  'Apprentice Horologist',
  'Quiet, brilliant with gear mechanisms, concealing intense resentment',
  'I arrived at 8:00 AM and found master Silas slumped over the reverse gear bench.',
  'He sold Silas’s perpetual motion escapement design to a Swiss firm.',
  'In the basement brass foundry casting pendulum weights',
  'Silas’s chief apprentice for five years',
  'The vault lock mechanism is tied directly to the master clock gear train.',
  'Did not know he dropped his brass gear wrench inside the exhaust flue.',
  '⚙️',
  '["I arrived at 8:00 AM and found master Silas slumped over the reverse gear bench.","\"I arrived at 8:00 AM and found master Silas slumped over the reverse gear bench.\"","Listen to me: I arrived at 8:00 AM and found master Silas slumped over the reverse gear bench.","I tell you the truth: I arrived at 8:00 AM and found master Silas slumped over the reverse gear bench."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e9046d87-5094-5f90-b6f4-ee80effdd800',
  'story_028',
  'Silas Vance',
  'Master Clockmaker',
  'Elderly, disoriented, clutching his temples, repeating "What year is it?"',
  'Victim suffering severe short-term retrograde amnesia; remembers nothing past Tuesday.',
  'He planned to pass the clockwork patent to Peter in his upcoming will.',
  'Trapped inside the locked workshop',
  'Inventor of the frictionless perpetual clock escapement',
  'Reversing the escapement wheel forces the magnetic vault door to cycle open.',
  'Did not smell the odorless gas leaking from the heating pipe.',
  '🕰️',
  '["Victim suffering severe short-term retrograde amnesia; remembers nothing past Tuesday.","\"Victim suffering severe short-term retrograde amnesia; remembers nothing past Tuesday.\"","Listen to me: Victim suffering severe short-term retrograde amnesia; remembers nothing past Tuesday.","I tell you the truth: Victim suffering severe short-term retrograde amnesia; remembers nothing past Tuesday."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e076dc96-a1a8-58a8-b0b4-2ca2a2a5f0c7',
  'story_028',
  'Lord Henry Sterling',
  'Antique Collector',
  'Wealthy, impatient, checking his pocket watch every minute',
  'I commissioned the master clock for half a million dollars. I expect it delivered today.',
  'He hired private investigators to monitor the workshop for patent leaks.',
  'At his club reading morning auction gazettes',
  'Financier of the perpetual escapement project',
  'The escapement design was worth five million dollars on the international market.',
  'Did not know Peter had already made architectural blueprint copies.',
  '🎩',
  '["I commissioned the master clock for half a million dollars. I expect it delivered today.","\"I commissioned the master clock for half a million dollars. I expect it delivered today.\"","Listen to me: I commissioned the master clock for half a million dollars. I expect it delivered today.","I tell you the truth: I commissioned the master clock for half a million dollars. I expect it delivered today."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e7920636-b36a-56c5-9b72-1d466438fcd1',
  'story_028',
  'Inspector Thomas Vance',
  'Forensic Investigator',
  'Sharp, methodical, carries gas detectors and magnifying loupes',
  'Amnesia combined with a reversed gear train suggests deliberate hypoxia gas tampering.',
  'Fascinated by mechanical automata and antique clocks.',
  'Dispatched to the workshop after a neighbor reported a gas smell',
  'Leading the industrial sabotage probe',
  'Carbon monoxide poisoning causes confusion, headache, and sudden memory loss.',
  'Did not immediately locate where the stolen blueprints were stashed.',
  '🔍',
  '["Amnesia combined with a reversed gear train suggests deliberate hypoxia gas tampering.","\"Amnesia combined with a reversed gear train suggests deliberate hypoxia gas tampering.\"","Listen to me: Amnesia combined with a reversed gear train suggests deliberate hypoxia gas tampering.","I tell you the truth: Amnesia combined with a reversed gear train suggests deliberate hypoxia gas tampering."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '00056a38-610e-5584-866e-9293567e4e9a',
  'story_028',
  'ev_1',
  1,
  '10:30 PM',
  'The hands on the six-foot standing grandfather clock sweep rapidly counter-clockwise.',
  'The hands on the six-foot standing grandfather clock sweep rapidly counter-clockwise.',
  'The gears were flipped into reverse to cycle the electronic vault lock backward.',
  'Reversed Clock Hands',
  'Brass clock face with hour and minute hands spinning backward.',
  '["Broken Clock","Stopped Pendulum","Fallen Weight"]'::jsonb,
  'Reversed Clock Hands',
  '["reversed clock hands","clock","reversed clock","clock hands","hands"]'::jsonb,
  'The metal arrows on a clock face that point to hours and minutes.',
  'ev_2',
  true,
  '{"descriptions":["The hands on the six-foot standing grandfather clock sweep rapidly counter-clockwise.","At 10:30 PM: The hands on the six-foot standing grandfather clock sweep rapidly counter-clockwise.","Notice this clue: The hands on the six-foot standing grandfather clock sweep rapidly counter-clockwise."],"hints":["The metal arrows on a clock face that point to hours and minutes.","Clue hint: Think about reversed clock hands.","Search for: the gears were flipped into reverse to cycle the electronic vault lock backward."],"clues":["Reversed Clock Hands","Item: Reversed Clock Hands","Clue Word: Reversed Clock Hands"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a1a866d3-61aa-508d-8f5a-c2039d1b2430',
  'story_028',
  'ev_2',
  2,
  '10:32 PM',
  'A brass reverse idler gear is inserted into the main mechanical train.',
  'A brass reverse idler gear is inserted into the main mechanical train.',
  'An extra gear was added to make the escapement wheel spin in the opposite direction.',
  'Reverse Idler Gear',
  'Precision-toothed brass cog with machine marks from Peter’s lathe.',
  '["Spring","Screw","Pendulum Bob"]'::jsonb,
  'Reverse Idler Gear',
  '["reverse idler gear","gear","idler gear","cog","brass gear"]'::jsonb,
  'A toothed metal wheel that meshes with others to turn clock hands.',
  'ev_3',
  false,
  '{"descriptions":["A brass reverse idler gear is inserted into the main mechanical train.","At 10:32 PM: A brass reverse idler gear is inserted into the main mechanical train.","Notice this clue: A brass reverse idler gear is inserted into the main mechanical train."],"hints":["A toothed metal wheel that meshes with others to turn clock hands.","Clue hint: Think about reverse idler gear.","Search for: an extra gear was added to make the escapement wheel spin in the opposite direction."],"clues":["Reverse Idler Gear","Item: Reverse Idler Gear","Clue Word: Reverse Idler Gear"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b26a3cc5-7a10-5cff-ab69-0f27f785bcd1',
  'story_028',
  'ev_3',
  3,
  '10:35 PM',
  'An empty velvet pedestal inside the glass vault sits under cold LED lights.',
  'An empty velvet pedestal inside the glass vault sits under cold LED lights.',
  'The frictionless perpetual escapement prototype was stolen.',
  'Perpetual Escapement',
  'Empty mahogany pedestal with indentations of jewel bearings.',
  '["Gold Watch","Silver Bell","Brass Compass"]'::jsonb,
  'Perpetual Escapement',
  '["perpetual escapement","escapement","prototype","mechanism"]'::jsonb,
  'A delicate clockwork mechanism that controls the speed of gear turning.',
  'ev_4',
  false,
  '{"descriptions":["An empty velvet pedestal inside the glass vault sits under cold LED lights.","At 10:35 PM: An empty velvet pedestal inside the glass vault sits under cold LED lights.","Notice this clue: An empty velvet pedestal inside the glass vault sits under cold LED lights."],"hints":["A delicate clockwork mechanism that controls the speed of gear turning.","Clue hint: Think about perpetual escapement.","Search for: the frictionless perpetual escapement prototype was stolen."],"clues":["Perpetual Escapement","Item: Perpetual Escapement","Clue Word: Perpetual Escapement"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'aa7999b9-d54c-5258-b5f4-0d865c40d1d9',
  'story_028',
  'ev_4',
  4,
  '10:40 PM',
  'A portable carbon monoxide detector sounds a high-pitched alarm near the flue.',
  'A portable carbon monoxide detector sounds a high-pitched alarm near the flue.',
  'Toxic odorless gas was fed into the room to induce confusion and memory loss.',
  'Gas Detector Alarm',
  'Digital forensic meter reading 250 parts per million of carbon monoxide.',
  '["Smoke Alarm","Fire Bell","Siren"]'::jsonb,
  'Gas Detector Alarm',
  '["gas detector alarm","detector","gas detector","alarm","meter"]'::jsonb,
  'An electronic device that beeps loudly when dangerous invisible gas is in the air.',
  'ev_5',
  false,
  '{"descriptions":["A portable carbon monoxide detector sounds a high-pitched alarm near the flue.","At 10:40 PM: A portable carbon monoxide detector sounds a high-pitched alarm near the flue.","Notice this clue: A portable carbon monoxide detector sounds a high-pitched alarm near the flue."],"hints":["An electronic device that beeps loudly when dangerous invisible gas is in the air.","Clue hint: Think about gas detector alarm.","Search for: toxic odorless gas was fed into the room to induce confusion and memory loss."],"clues":["Gas Detector Alarm","Item: Gas Detector Alarm","Clue Word: Gas Detector Alarm"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '07486053-970c-5162-8f3d-985adc83f464',
  'story_028',
  'ev_5',
  5,
  '10:45 PM',
  'A flexible rubber hose attached to a gas cylinder is found in the chimney duct.',
  'A flexible rubber hose attached to a gas cylinder is found in the chimney duct.',
  'Peter piped toxic exhaust gas down the chimney from the roof.',
  'Rubber Gas Hose',
  'Black reinforced hose clamped to the chimney damper.',
  '["Water Pipe","Electric Cable","Rope"]'::jsonb,
  'Rubber Gas Hose',
  '["rubber gas hose","hose","gas hose","rubber hose","pipe"]'::jsonb,
  'A flexible hollow tube used to carry liquids or gases.',
  'ev_6',
  true,
  '{"descriptions":["A flexible rubber hose attached to a gas cylinder is found in the chimney duct.","At 10:45 PM: A flexible rubber hose attached to a gas cylinder is found in the chimney duct.","Notice this clue: A flexible rubber hose attached to a gas cylinder is found in the chimney duct."],"hints":["A flexible hollow tube used to carry liquids or gases.","Clue hint: Think about rubber gas hose.","Search for: peter piped toxic exhaust gas down the chimney from the roof."],"clues":["Rubber Gas Hose","Item: Rubber Gas Hose","Clue Word: Rubber Gas Hose"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a7b23c0a-953e-5224-bed9-a1ff9872c5e6',
  'story_028',
  'ev_6',
  6,
  '11:15 PM',
  'Blueprints of the perpetual escapement are found in Peter’s tool locker.',
  'Blueprints of the perpetual escapement are found in Peter’s tool locker.',
  'Peter copied every schematic measurement to sell to a foreign firm.',
  'Clock Blueprints',
  'Technical engineering drawings stamped with Silas Vance’s copyright.',
  '["Newspaper","Catalog","Receipt"]'::jsonb,
  'Clock Blueprints',
  '["clock blueprints","blueprints","schematics","drawings","plans"]'::jsonb,
  'Technical architectural drawings printed with white lines on blue paper.',
  'ev_7',
  false,
  '{"descriptions":["Blueprints of the perpetual escapement are found in Peter’s tool locker.","At 11:15 PM: Blueprints of the perpetual escapement are found in Peter’s tool locker.","Notice this clue: Blueprints of the perpetual escapement are found in Peter’s tool locker."],"hints":["Technical architectural drawings printed with white lines on blue paper.","Clue hint: Think about clock blueprints.","Search for: peter copied every schematic measurement to sell to a foreign firm."],"clues":["Clock Blueprints","Item: Clock Blueprints","Clue Word: Clock Blueprints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f49f81f7-2a33-5757-92d4-77fa9f7c1153',
  'story_028',
  'ev_7',
  7,
  '11:30 PM',
  'A brass gear adjustment wrench with Peter’s initials is recovered from the flue.',
  'A brass gear adjustment wrench with Peter’s initials is recovered from the flue.',
  'Peter accidentally dropped his personal tool when securing the gas pipe.',
  'Brass Wrench',
  'Specialized watchmaker wrench stamped "P.R. 2022".',
  '["Hammer","Pliers","Screwdriver"]'::jsonb,
  'Brass Wrench',
  '["brass wrench","wrench","tool","gear wrench"]'::jsonb,
  'A small metal tool used by clockmakers to tighten tiny bolts and gears.',
  'ev_8',
  false,
  '{"descriptions":["A brass gear adjustment wrench with Peter’s initials is recovered from the flue.","At 11:30 PM: A brass gear adjustment wrench with Peter’s initials is recovered from the flue.","Notice this clue: A brass gear adjustment wrench with Peter’s initials is recovered from the flue."],"hints":["A small metal tool used by clockmakers to tighten tiny bolts and gears.","Clue hint: Think about brass wrench.","Search for: peter accidentally dropped his personal tool when securing the gas pipe."],"clues":["Brass Wrench","Item: Brass Wrench","Clue Word: Brass Wrench"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3cbd5f32-4fb9-5b97-abab-acfcb3efe818',
  'story_028',
  'ev_8',
  8,
  '11:45 PM',
  'Medical blood tests on Silas show high carboxyhemoglobin saturation.',
  'Medical blood tests on Silas show high carboxyhemoglobin saturation.',
  'Proves Silas’s sudden amnesia was directly caused by carbon monoxide poisoning.',
  'Blood Gas Test',
  'Hospital laboratory report confirming acute hypoxia-induced amnesia.',
  '["X-Ray","Brain Scan","Pulse Log"]'::jsonb,
  'Blood Gas Test',
  '["blood gas test","blood test","test","lab report","gas test"]'::jsonb,
  'A medical paper showing the amount of poison gas carried in human blood.',
  NULL,
  true,
  '{"descriptions":["Medical blood tests on Silas show high carboxyhemoglobin saturation.","At 11:45 PM: Medical blood tests on Silas show high carboxyhemoglobin saturation.","Notice this clue: Medical blood tests on Silas show high carboxyhemoglobin saturation."],"hints":["A medical paper showing the amount of poison gas carried in human blood.","Clue hint: Think about blood gas test.","Search for: proves silas’s sudden amnesia was directly caused by carbon monoxide poisoning."],"clues":["Blood Gas Test","Item: Blood Gas Test","Clue Word: Blood Gas Test"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_029 — THE UNFINISHED PORTRAIT
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_029',
  'The Unfinished Portrait',
  'Psychological',
  'The Highcrest Art Loft, north-facing skylights, easel smelling of linseed oil and turpentine',
  'Eccentric painter Julian Vance was found missing; on his easel was an unfinished portrait of a woman who vanished ten years ago.',
  '[{"name":"Gregory Cole","role":"Distinguished Art Critic","alibi":"Attending an evening gallery vernissage downtown","avatar":"🎨"},{"name":"Julian Vance","role":"Visionary Painter","alibi":"Last seen painting in his loft at 11:00 PM","avatar":"🖌️"},{"name":"Elena Rostova","role":"Gallery Owner","alibi":"In the gallery office cataloging exhibition brochures","avatar":"🖼️"},{"name":"Detective Raymond Cross","role":"Cold Case Investigator","alibi":"Arrived at the loft after Elena reported Julian missing","avatar":"🔍"}]'::jsonb,
  'Art critic Gregory Cole murdered model Sarah ten years ago. When painter Julian Vance began painting Sarah’s final portrait from a recovered photograph, Gregory realized the portrait showed his own face reflected in Sarah’s locket. Gregory abducted Julian and hid him in his country cellar.',
  'Art Critic Gregory Cole',
  'Gregory had murdered the woman ten years ago, and Julian’s portrait was about to expose him.',
  '[{"time":"09:00 PM","event":"Julian calls Elena stating his masterpiece will reveal the truth."},{"time":"10:30 PM","event":"Gregory arrives at the loft after hearing about the painting."},{"time":"11:15 PM","event":"Gregory sees his own face reflected in the painted locket and panics."},{"time":"11:20 PM","event":"Gregory strikes Julian with his cane and subdues him with chloroform."},{"time":"11:45 PM","event":"Julian is packed into a large canvas delivery crate and wheeled out."}]'::jsonb,
  '[{"id":"ev1","title":"Miniature Locket Reflection","detail":"Shows Gregory Cole standing in the doorway holding his cane in 2014."},{"id":"ev2","title":"Ebony Wood Chips at Easel","detail":"Matches the fractured shaft of Gregory’s walking cane."},{"id":"ev3","title":"Chloroform Chemical Rag","detail":"Used by Gregory to incapacitate Julian before loading him into the crate."},{"id":"ev4","title":"Cane Tip with Easel Paint","detail":"Confirms Gregory’s presence in the loft at the exact moment of the struggle."}]'::jsonb,
  '[{"order":1,"title":"Painted Locket","text":"Microscopic portrait detail revealing the reflection of Sarah’s murderer."},{"order":2,"title":"Chloroform Rag","text":"Solvent cloth used to render Julian unconscious in his studio."},{"order":3,"title":"Ebony Wood Chips","text":"Splinters from Gregory’s heavy walking cane found beside the easel."},{"order":4,"title":"Art Shipping Crate","text":"Padded wooden box used to smuggle Julian out through the loading bay."},{"order":5,"title":"Photo Negative","text":"Vintage film strip proving the locket reflection was a factual record."},{"order":6,"title":"Silver Cane Tip","text":"Metal walking stick ferrule with paint transfer from Julian’s easel."}]'::jsonb,
  'Gallery owner Elena had debt notices in her briefcase.: Financial worries, but she wanted Julian alive to paint for her show.; Julian left a cryptic note saying "The dead do not stay silent.": A poetic description of his portrait discovery, not a suicide note.',
  'Claim Julian was driven mad by ghosts or blame his art gallery dealer.',
  'NORMAL',
  'Did Julian disappear into thin air, or did someone from his past enter the locked studio?',
  '[{"character":"Gregory Cole","secret":"He murdered Sarah ten years ago when she threatened to expose his forgery ring."},{"character":"Julian Vance","secret":"He had enlarged a high-resolution negative of Sarah’s last photograph."},{"character":"Elena Rostova","secret":"She was preparing to auction Julian’s collection to pay gallery debts."},{"character":"Detective Raymond Cross","secret":"Kept Sarah’s missing person file on his desk for a decade."}]'::jsonb,
  '[{"lead":"Gallery owner Elena had debt notices in her briefcase.","explanation":"Financial worries, but she wanted Julian alive to paint for her show."},{"lead":"Julian left a cryptic note saying \"The dead do not stay silent.\"","explanation":"A poetic description of his portrait discovery, not a suicide note."}]'::jsonb,
  '{"wrongTheories":["Julian had a nervous breakdown and burned his unfinished masterpiece.","A jealous rival artist broke in to steal Julian’s painting techniques."],"correctTheory":"Art critic Gregory Cole realized Julian’s portrait revealed his reflection in Sarah’s locket from a ten-year-old murder; Gregory attacked Julian with his cane, drugged him with chloroform, and smuggled him out in an art crate to bury the truth."}'::jsonb,
  'Critic Gregory Cole abducted Julian because the painted locket revealed him as a killer!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Cross traced Gregory’s sedan to his country cottage, freeing Julian and uncovering Sarah’s remains. Gregory was charged with two counts of murder and kidnapping."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The case was filed as a mysterious artist disappearance. Gregory destroyed the painting and continued his career as the city’s premier art authority."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Urban legends claimed Julian was swallowed into his own canvas. Gregory wrote a bestselling critique praising the \"tragic phantom master.\""}]'::jsonb,
  '{"intros":["Eccentric painter Julian Vance was found missing; on his easel was an unfinished portrait of a woman who vanished ten years ago.","Case file story_029: Eccentric painter Julian Vance was found missing; on his easel was an unfinished portrait of a woman who vanished ten years ago. Look closely at every clue.","Trouble begins in The Highcrest Art Loft, north-facing skylights, easel smelling of linseed oil and turpentine. Eccentric painter Julian Vance was found missing; on his easel was an unfinished portrait of a woman who vanished ten years ago.","The mystery starts now. Eccentric painter Julian Vance was found missing; on his easel was an unfinished portrait of a woman who vanished ten years ago. Can you solve it?"],"reveals":["Critic Gregory Cole abducted Julian because the painted locket revealed him as a killer!","The mystery is unraveled! Critic Gregory Cole abducted Julian because the painted locket revealed him as a killer!","At last, the truth comes out: Critic Gregory Cole abducted Julian because the painted locket revealed him as a killer!","Case resolved! Here is what happened: Critic Gregory Cole abducted Julian because the painted locket revealed him as a killer!"],"hints":["Pay attention to where Art Critic Gregory Cole was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_029';
DELETE FROM public.case_events WHERE case_id = 'story_029';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ef6a89f4-0f20-510e-821e-ff315f30f583',
  'story_029',
  'Gregory Cole',
  'Distinguished Art Critic',
  'Cultured, silver-tongued, carrying an ebony walking cane',
  'Julian was tortured by the past. He must have walked away to start a new life.',
  'He murdered Sarah ten years ago when she threatened to expose his forgery ring.',
  'Attending an evening gallery vernissage downtown',
  'Julian’s primary patron and chief reviewer',
  'The portrait of Sarah contained a microscopic reflection of his face in her locket.',
  'Left black ebony wood chips on the loft floor where his cane struck Julian.',
  '🎨',
  '["Julian was tortured by the past. He must have walked away to start a new life.","\"Julian was tortured by the past. He must have walked away to start a new life.\"","Listen to me: Julian was tortured by the past. He must have walked away to start a new life.","I tell you the truth: Julian was tortured by the past. He must have walked away to start a new life."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a4e20c56-c792-5804-9312-0b058ac3fde0',
  'story_029',
  'Julian Vance',
  'Visionary Painter',
  'Obsessive, reclusive, painting feverishly day and night',
  'Missing person; left his palette knife and wet oil brushes on the easel.',
  'He had enlarged a high-resolution negative of Sarah’s last photograph.',
  'Last seen painting in his loft at 11:00 PM',
  'Beloved fiancé of the missing model Sarah',
  'Sarah’s golden locket reflected her killer standing in the doorway.',
  'Did not expect Gregory to visit the loft in the dead of night.',
  '🖌️',
  '["Missing person; left his palette knife and wet oil brushes on the easel.","\"Missing person; left his palette knife and wet oil brushes on the easel.\"","Listen to me: Missing person; left his palette knife and wet oil brushes on the easel.","I tell you the truth: Missing person; left his palette knife and wet oil brushes on the easel."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '84d0949d-c89d-5433-ab90-ff91e2b1ce96',
  'story_029',
  'Elena Rostova',
  'Gallery Owner',
  'Sophisticated, ambitious, worried about exhibition deadlines',
  'Julian called me at 9:00 PM saying he had finished the most important canvas of his career.',
  'She was preparing to auction Julian’s collection to pay gallery debts.',
  'In the gallery office cataloging exhibition brochures',
  'Manages Julian’s artistic contracts and shows',
  'Saw Gregory Cole leaving the artist loft building around midnight.',
  'Assumed Gregory was just giving Julian an evening critique.',
  '🖼️',
  '["Julian called me at 9:00 PM saying he had finished the most important canvas of his career.","\"Julian called me at 9:00 PM saying he had finished the most important canvas of his career.\"","Listen to me: Julian called me at 9:00 PM saying he had finished the most important canvas of his career.","I tell you the truth: Julian called me at 9:00 PM saying he had finished the most important canvas of his career."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '895d2bf8-62b7-539c-ab2f-7a13869f15f3',
  'story_029',
  'Detective Raymond Cross',
  'Cold Case Investigator',
  'Quiet, observant, never forgets an unsolved murder file',
  'Ten-year-old cold cases don’t solve themselves without a sudden catalyst.',
  'Kept Sarah’s missing person file on his desk for a decade.',
  'Arrived at the loft after Elena reported Julian missing',
  'Original investigator on the disappearance of Sarah in 2014',
  'Found chloroform chemical residue on a painting rag by the easel.',
  'Did not immediately know Gregory owned an abandoned country cottage.',
  '🔍',
  '["Ten-year-old cold cases don’t solve themselves without a sudden catalyst.","\"Ten-year-old cold cases don’t solve themselves without a sudden catalyst.\"","Listen to me: Ten-year-old cold cases don’t solve themselves without a sudden catalyst.","I tell you the truth: Ten-year-old cold cases don’t solve themselves without a sudden catalyst."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0d32115b-00c3-5dc2-96ac-cbe21b8dccca',
  'story_029',
  'ev_1',
  1,
  '11:15 PM',
  'An unfinished oil painting displays a woman wearing a tiny gold heart locket.',
  'An unfinished oil painting displays a woman wearing a tiny gold heart locket.',
  'Under magnification, the locket shows a miniature reflection of Gregory Cole.',
  'Painted Locket',
  'Oil canvas with micro-detailed reflection of a man with an ebony cane.',
  '["Painted Window","Mirror in Painting","Ring"]'::jsonb,
  'Painted Locket',
  '["painted locket","locket","painting","heart locket"]'::jsonb,
  'A tiny painted gold pendant hanging on a necklace in a portrait.',
  'ev_2',
  true,
  '{"descriptions":["An unfinished oil painting displays a woman wearing a tiny gold heart locket.","At 11:15 PM: An unfinished oil painting displays a woman wearing a tiny gold heart locket.","Notice this clue: An unfinished oil painting displays a woman wearing a tiny gold heart locket."],"hints":["A tiny painted gold pendant hanging on a necklace in a portrait.","Clue hint: Think about painted locket.","Search for: under magnification, the locket shows a miniature reflection of gregory cole."],"clues":["Painted Locket","Item: Painted Locket","Clue Word: Painted Locket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '469785b8-f85a-5b41-80ed-cacfc33729fd',
  'story_029',
  'ev_2',
  2,
  '11:20 PM',
  'A cotton painting rag smelling of sweet chemical chloroform lies on the floor.',
  'A cotton painting rag smelling of sweet chemical chloroform lies on the floor.',
  'Julian was rendered unconscious using chloroform solvent.',
  'Chloroform Rag',
  'Stained linen rag with high chemical readings of trichloromethane.',
  '["Turpentine Cloth","Paint Thinner","Water Towel"]'::jsonb,
  'Chloroform Rag',
  '["chloroform rag","rag","cloth","chemical rag"]'::jsonb,
  'A piece of cloth soaked in a sweet-smelling chemical that puts people to sleep.',
  'ev_3',
  false,
  '{"descriptions":["A cotton painting rag smelling of sweet chemical chloroform lies on the floor.","At 11:20 PM: A cotton painting rag smelling of sweet chemical chloroform lies on the floor.","Notice this clue: A cotton painting rag smelling of sweet chemical chloroform lies on the floor."],"hints":["A piece of cloth soaked in a sweet-smelling chemical that puts people to sleep.","Clue hint: Think about chloroform rag.","Search for: julian was rendered unconscious using chloroform solvent."],"clues":["Chloroform Rag","Item: Chloroform Rag","Clue Word: Chloroform Rag"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '79b5896a-1395-5e13-83d7-3abbdbca3a82',
  'story_029',
  'ev_3',
  3,
  '11:22 PM',
  'Black wood splinters from an ebony walking stick are scattered near the easel.',
  'Black wood splinters from an ebony walking stick are scattered near the easel.',
  'Gregory struck Julian across the shoulder with his heavy cane.',
  'Ebony Wood Chips',
  'Dense African ebony wood fragments with polished silver lacquer.',
  '["Pine Shavings","Oak Splinters","Charcoal Pieces"]'::jsonb,
  'Ebony Wood Chips',
  '["ebony wood chips","wood chips","ebony chips","splinters","cane wood"]'::jsonb,
  'Tiny broken pieces of dark, heavy African black wood.',
  'ev_4',
  false,
  '{"descriptions":["Black wood splinters from an ebony walking stick are scattered near the easel.","At 11:22 PM: Black wood splinters from an ebony walking stick are scattered near the easel.","Notice this clue: Black wood splinters from an ebony walking stick are scattered near the easel."],"hints":["Tiny broken pieces of dark, heavy African black wood.","Clue hint: Think about ebony wood chips.","Search for: gregory struck julian across the shoulder with his heavy cane."],"clues":["Ebony Wood Chips","Item: Ebony Wood Chips","Clue Word: Ebony Wood Chips"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '640fccc4-cd6e-5ab1-b3db-5644f82f9faa',
  'story_029',
  'ev_4',
  4,
  '11:30 PM',
  'A wooden art transport crate measuring six feet long is wheeled past the service bay.',
  'A wooden art transport crate measuring six feet long is wheeled past the service bay.',
  'The unconscious artist was packed inside a padded wooden canvas crate.',
  'Art Shipping Crate',
  'Pine wooden box lined with bubble wrap and labeled "Fragile Canvas".',
  '["Cardboard Box","Metal Trunk","Suitcase"]'::jsonb,
  'Art Shipping Crate',
  '["art shipping crate","crate","shipping crate","art crate","box"]'::jsonb,
  'A large wooden box built to ship fragile paintings between galleries.',
  'ev_5',
  false,
  '{"descriptions":["A wooden art transport crate measuring six feet long is wheeled past the service bay.","At 11:30 PM: A wooden art transport crate measuring six feet long is wheeled past the service bay.","Notice this clue: A wooden art transport crate measuring six feet long is wheeled past the service bay."],"hints":["A large wooden box built to ship fragile paintings between galleries.","Clue hint: Think about art shipping crate.","Search for: the unconscious artist was packed inside a padded wooden canvas crate."],"clues":["Art Shipping Crate","Item: Art Shipping Crate","Clue Word: Art Shipping Crate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e7b8b6e1-93a9-596a-b93e-7c4859f70365',
  'story_029',
  'ev_5',
  5,
  '11:50 PM',
  'A vintage black-and-white photograph negative of Sarah is in the enlarger.',
  'A vintage black-and-white photograph negative of Sarah is in the enlarger.',
  'The negative provided the original photographic proof of Gregory’s presence.',
  'Photo Negative',
  '35mm photographic negative showing the 2014 crime scene reflection.',
  '["Postcard","Newspaper","Diary"]'::jsonb,
  'Photo Negative',
  '["photo negative","negative","film","photograph"]'::jsonb,
  'A dark plastic strip used in darkrooms where light and dark colors are reversed.',
  'ev_6',
  true,
  '{"descriptions":["A vintage black-and-white photograph negative of Sarah is in the enlarger.","At 11:50 PM: A vintage black-and-white photograph negative of Sarah is in the enlarger.","Notice this clue: A vintage black-and-white photograph negative of Sarah is in the enlarger."],"hints":["A dark plastic strip used in darkrooms where light and dark colors are reversed.","Clue hint: Think about photo negative.","Search for: the negative provided the original photographic proof of gregory’s presence."],"clues":["Photo Negative","Item: Photo Negative","Clue Word: Photo Negative"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7544f85a-92e8-5f67-b3f6-487dd52871d6',
  'story_029',
  'ev_6',
  6,
  '12:15 AM',
  'A damp oil palette with colors matching the portrait sits on the worktable.',
  'A damp oil palette with colors matching the portrait sits on the worktable.',
  'Julian was interrupted mid-brushstroke while painting the locket highlights.',
  'Artist Palette',
  'Oval wooden board holding wet blobs of cadmium yellow and titanium white.',
  '["Paint Bucket","Brush Jar","Easel Stand"]'::jsonb,
  'Artist Palette',
  '["artist palette","palette","paint board","wooden palette"]'::jsonb,
  'A flat wooden board artists hold in their hand to mix oil paints.',
  'ev_7',
  false,
  '{"descriptions":["A damp oil palette with colors matching the portrait sits on the worktable.","At 12:15 AM: A damp oil palette with colors matching the portrait sits on the worktable.","Notice this clue: A damp oil palette with colors matching the portrait sits on the worktable."],"hints":["A flat wooden board artists hold in their hand to mix oil paints.","Clue hint: Think about artist palette.","Search for: julian was interrupted mid-brushstroke while painting the locket highlights."],"clues":["Artist Palette","Item: Artist Palette","Clue Word: Artist Palette"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3a062098-ea28-5373-8fce-e4ed83053f97',
  'story_029',
  'ev_7',
  7,
  '12:30 AM',
  'Tire tracks from Gregory’s luxury sedan are pressed into the alley rain mud.',
  'Tire tracks from Gregory’s luxury sedan are pressed into the alley rain mud.',
  'Gregory’s car was backed up to the freight elevator loading doors.',
  'Luxury Tire Tracks',
  'Radial tire tread matching Gregory Cole’s imported silver sedan.',
  '["Van Tracks","Truck Marks","Bicycle Skid"]'::jsonb,
  'Luxury Tire Tracks',
  '["luxury tire tracks","tire tracks","tracks","tread marks","tires"]'::jsonb,
  'Grooves left in wet mud by the wheels of an expensive car.',
  'ev_8',
  false,
  '{"descriptions":["Tire tracks from Gregory’s luxury sedan are pressed into the alley rain mud.","At 12:30 AM: Tire tracks from Gregory’s luxury sedan are pressed into the alley rain mud.","Notice this clue: Tire tracks from Gregory’s luxury sedan are pressed into the alley rain mud."],"hints":["Grooves left in wet mud by the wheels of an expensive car.","Clue hint: Think about luxury tire tracks.","Search for: gregory’s car was backed up to the freight elevator loading doors."],"clues":["Luxury Tire Tracks","Item: Luxury Tire Tracks","Clue Word: Luxury Tire Tracks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bce70aba-d4e4-512c-85cb-f8a4dca35bdf',
  'story_029',
  'ev_8',
  8,
  '01:00 AM',
  'A silver cane tip with paint scrapes matching Julian’s easel is recovered.',
  'A silver cane tip with paint scrapes matching Julian’s easel is recovered.',
  'Gregory’s walking stick made direct physical impact with the artist easel.',
  'Silver Cane Tip',
  'Engraved sterling silver ferrule with yellow oil paint transfer.',
  '["Button","Watch Face","Ring"]'::jsonb,
  'Silver Cane Tip',
  '["silver cane tip","cane tip","silver tip","ferrule","tip"]'::jsonb,
  'A metal cap placed on the bottom of a walking stick to protect the wood.',
  NULL,
  true,
  '{"descriptions":["A silver cane tip with paint scrapes matching Julian’s easel is recovered.","At 01:00 AM: A silver cane tip with paint scrapes matching Julian’s easel is recovered.","Notice this clue: A silver cane tip with paint scrapes matching Julian’s easel is recovered."],"hints":["A metal cap placed on the bottom of a walking stick to protect the wood.","Clue hint: Think about silver cane tip.","Search for: gregory’s walking stick made direct physical impact with the artist easel."],"clues":["Silver Cane Tip","Item: Silver Cane Tip","Clue Word: Silver Cane Tip"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_030 — THE TWIN'S ALIBI
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_030',
  'The Twin''s Alibi',
  'Psychological',
  'The Sterling Clock Tower & Twin Luxury Penthouses, mirrored architectural layouts',
  'A multi-million-dollar bearer bond safe was cracked while suspect Leo Sterling was seen live on television across the country.',
  '[{"name":"Leo Sterling","role":"Twin Brother A (The Safe Breaker)","alibi":"Claims his television broadcast proves total innocence","avatar":"🎭"},{"name":"Julian Sterling","role":"Twin Brother B (The Television Double)","alibi":"Claims he stayed home all night","avatar":"📺"},{"name":"Victoria Vance","role":"Trust Estate Attorney","alibi":"In her downtown legal office reviewing vault access timestamps","avatar":"📜"},{"name":"Detective Frank Hansen","role":"Forensic Video Specialist","alibi":"Reviewing 4K broadcast footage and vault security logs","avatar":"🔍"}]'::jsonb,
  'Identical twins Leo and Julian Sterling coordinated an alibi swap. Julian appeared on a live charity broadcast posing as Leo, while Leo cracked the family bearer bond safe using Julian’s security biometric codes, creating an impossible paradox for investigators.',
  'Leo Sterling & Julian Sterling',
  'The identical twins conspired to crack the family trust vault while maintaining a flawless public alibi.',
  '[{"time":"07:30 PM","event":"Julian puts on stage makeup to cover his chin scar and wears Leo’s tuxedo."},{"time":"08:00 PM","event":"Julian appears on live television at the charity gala posing as Leo."},{"time":"08:45 PM","event":"Leo enters the vault using duplicate keycards and cracks the safe."},{"time":"09:30 PM","event":"Julian finishes the broadcast speech to thunderous applause."},{"time":"10:15 PM","event":"The empty bearer bond safe is discovered by estate security."}]'::jsonb,
  '[{"id":"ev1","title":"4K Broadcast Video Analysis","detail":"Magnification shows foundation makeup concealing Julian’s chin scar on live TV."},{"id":"ev2","title":"Graphite on Leo’s Watch","detail":"Matches the safecracking lubricant on the broken vault dial."},{"id":"ev3","title":"Foundation-Stained Tuxedo Collar","detail":"Proves the twin who wore the tuxedo had applied heavy facial makeup."},{"id":"ev4","title":"Signed 50/50 Heist Pact","detail":"Proves the twins conspired together to create the television alibi."}]'::jsonb,
  '[{"order":1,"title":"Broadcast Video","text":"Live charity broadcast showing an identical twin double on camera."},{"order":2,"title":"Dual Vault Keycards","text":"Cards logged at 8:45 PM while the televised speech was underway."},{"order":3,"title":"Graphite Powder","text":"Lock lubricant found on the vault dial and the thief’s wristwatch."},{"order":4,"title":"Bearer Bonds","text":"Fifty million dollars in untraceable certificates taken from the safe."},{"order":5,"title":"Theatrical Makeup","text":"Concealer cream used to hide the twin brother’s identifying scar."},{"order":6,"title":"Titanium Watch","text":"Watch containing microscopic traces of vault dust in the links."}]'::jsonb,
  'Attorney Victoria was auditing missing trust funds.: She uncovered earlier irregularities, but had no role in the safe breach.; The television broadcast had a 3-second transmission delay.: Normal satellite delay, not an intentional video loop.',
  'Claim a professional safecracker was hired or blame the television broadcasting crew.',
  'NORMAL',
  'How could Leo Sterling be in two places at once, or was someone exploiting identical biology?',
  '[{"character":"Leo Sterling","secret":"He was physically inside the vault cracking the digital tumbler."},{"character":"Julian Sterling","secret":"He was the one on television smiling and accepting the charity award for Leo."},{"character":"Victoria Vance","secret":"She was auditing the trust accounts and found five million missing already."},{"character":"Detective Frank Hansen","secret":"Cracked a twin identity swap case ten years ago in Chicago."}]'::jsonb,
  '[{"lead":"Attorney Victoria was auditing missing trust funds.","explanation":"She uncovered earlier irregularities, but had no role in the safe breach."},{"lead":"The television broadcast had a 3-second transmission delay.","explanation":"Normal satellite delay, not an intentional video loop."}]'::jsonb,
  '{"wrongTheories":["An outside safecracking crew cloned Leo’s identity and hacked the vault.","Julian acted completely alone while Leo was an innocent public figure."],"correctTheory":"Identical twins Leo and Julian Sterling conspired to rob the family safe; Julian posed as Leo on live television using makeup to hide his scar, while Leo used both keycards to crack the fifty-million-dollar bond vault."}'::jsonb,
  'The twins pulled an identity swap: Julian took the TV stage while Leo cracked the vault!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Hansen exposed the makeup on the 4K broadcast and matched the graphite on Leo’s watch. Both brothers were arrested and the bearer bonds were recovered."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The police accepted the live television alibi as absolute proof of innocence. The twins fled to a non-extradition island with fifty million dollars."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The board accused the security firm of systemic failure. The twins collected insurance settlements and lived as eccentric aristocrats."}]'::jsonb,
  '{"intros":["A multi-million-dollar bearer bond safe was cracked while suspect Leo Sterling was seen live on television across the country.","Case file story_030: A multi-million-dollar bearer bond safe was cracked while suspect Leo Sterling was seen live on television across the country. Look closely at every clue.","Trouble begins in The Sterling Clock Tower & Twin Luxury Penthouses, mirrored architectural layouts. A multi-million-dollar bearer bond safe was cracked while suspect Leo Sterling was seen live on television across the country.","The mystery starts now. A multi-million-dollar bearer bond safe was cracked while suspect Leo Sterling was seen live on television across the country. Can you solve it?"],"reveals":["The twins pulled an identity swap: Julian took the TV stage while Leo cracked the vault!","The mystery is unraveled! The twins pulled an identity swap: Julian took the TV stage while Leo cracked the vault!","At last, the truth comes out: The twins pulled an identity swap: Julian took the TV stage while Leo cracked the vault!","Case resolved! Here is what happened: The twins pulled an identity swap: Julian took the TV stage while Leo cracked the vault!"],"hints":["Pay attention to where Leo Sterling & Julian Sterling was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_030';
DELETE FROM public.case_events WHERE case_id = 'story_030';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd1eee12d-1178-5a94-aad5-19a23a8bebed',
  'story_030',
  'Leo Sterling',
  'Twin Brother A (The Safe Breaker)',
  'Charismatic, cold, wearing a custom navy suit and titanium watch',
  'You saw me on live television at the St. Jude Charity Gala from 8:00 PM to 10:00 PM.',
  'He was physically inside the vault cracking the digital tumbler.',
  'Claims his television broadcast proves total innocence',
  'Co-trustee of the fifty-million-dollar Sterling Family Trust',
  'The broadcast had a three-second satellite delay.',
  'Did not notice a speck of vault graphite dust on his titanium watch strap.',
  '🎭',
  '["You saw me on live television at the St. Jude Charity Gala from 8:00 PM to 10:00 PM.","\"You saw me on live television at the St. Jude Charity Gala from 8:00 PM to 10:00 PM.\"","Listen to me: You saw me on live television at the St. Jude Charity Gala from 8:00 PM to 10:00 PM.","I tell you the truth: You saw me on live television at the St. Jude Charity Gala from 8:00 PM to 10:00 PM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '25e91b3a-0e20-5263-8150-7f10dbe0023e',
  'story_030',
  'Julian Sterling',
  'Twin Brother B (The Television Double)',
  'Quiet, reclusive, identical face and voice to his twin brother Leo',
  'I was sleeping in my penthouse with the phone off all evening.',
  'He was the one on television smiling and accepting the charity award for Leo.',
  'Claims he stayed home all night',
  'Equal partner in the bond heist conspiracy',
  'He wore makeup to cover a scar on his chin that Leo does not have.',
  'Did not realize stage makeup transferred onto his tuxedo collar.',
  '📺',
  '["I was sleeping in my penthouse with the phone off all evening.","\"I was sleeping in my penthouse with the phone off all evening.\"","Listen to me: I was sleeping in my penthouse with the phone off all evening.","I tell you the truth: I was sleeping in my penthouse with the phone off all evening."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ee3338c9-901e-512b-a356-a98fd351b0fa',
  'story_030',
  'Victoria Vance',
  'Trust Estate Attorney',
  'Sharp, suspicious, holding the signed trust indenture',
  'Only Leo and Julian hold the dual keys to the subterranean bearer bond vault.',
  'She was auditing the trust accounts and found five million missing already.',
  'In her downtown legal office reviewing vault access timestamps',
  'Legal custodian of the Sterling family wealth',
  'The safe was opened at exactly 8:45 PM using dual-key authentication.',
  'Could not fathom that both brothers were working together.',
  '📜',
  '["Only Leo and Julian hold the dual keys to the subterranean bearer bond vault.","\"Only Leo and Julian hold the dual keys to the subterranean bearer bond vault.\"","Listen to me: Only Leo and Julian hold the dual keys to the subterranean bearer bond vault.","I tell you the truth: Only Leo and Julian hold the dual keys to the subterranean bearer bond vault."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2e7f8cc3-3acc-5043-a95b-37fd2222828d',
  'story_030',
  'Detective Frank Hansen',
  'Forensic Video Specialist',
  'Analytical, calm, examines high-definition broadcast frames',
  'Two men with identical DNA can create an alibi that looks bulletproof on camera.',
  'Cracked a twin identity swap case ten years ago in Chicago.',
  'Reviewing 4K broadcast footage and vault security logs',
  'Assigned to investigate the fifty-million-dollar bond theft',
  'Found foundation makeup residue covering a chin scar on the broadcast tape.',
  'Did not know where the bearer bonds were stashed.',
  '🔍',
  '["Two men with identical DNA can create an alibi that looks bulletproof on camera.","\"Two men with identical DNA can create an alibi that looks bulletproof on camera.\"","Listen to me: Two men with identical DNA can create an alibi that looks bulletproof on camera.","I tell you the truth: Two men with identical DNA can create an alibi that looks bulletproof on camera."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '04f77999-f890-5df4-8cd8-19a181807a61',
  'story_030',
  'ev_1',
  1,
  '08:00 PM',
  'A live television feed shows "Leo Sterling" delivering a keynote address on stage.',
  'A live television feed shows "Leo Sterling" delivering a keynote address on stage.',
  'The man on stage was actually identical twin Julian wearing stage makeup.',
  'Broadcast Video',
  '4K television recording showing foundation makeup hiding a chin scar.',
  '["Security Photo","Newspaper Picture","Portrait"]'::jsonb,
  'Broadcast Video',
  '["broadcast video","broadcast","video","recording","tape"]'::jsonb,
  'A video recording of a live television show viewed on screens.',
  'ev_2',
  true,
  '{"descriptions":["A live television feed shows \"Leo Sterling\" delivering a keynote address on stage.","At 08:00 PM: A live television feed shows \"Leo Sterling\" delivering a keynote address on stage.","Notice this clue: A live television feed shows \"Leo Sterling\" delivering a keynote address on stage."],"hints":["A video recording of a live television show viewed on screens.","Clue hint: Think about broadcast video.","Search for: the man on stage was actually identical twin julian wearing stage makeup."],"clues":["Broadcast Video","Item: Broadcast Video","Clue Word: Broadcast Video"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cdea39f8-f9d1-5de5-8086-d3e50830f0cc',
  'story_030',
  'ev_2',
  2,
  '08:45 PM',
  'The heavy steel vault door clicks open using two simultaneous keycards.',
  'The heavy steel vault door clicks open using two simultaneous keycards.',
  'The real Leo was in the basement vault using both brothers’ credentials.',
  'Dual Vault Keycards',
  'Two magnetic keycards logged simultaneously at 8:45 PM.',
  '["Combination Lock","Master Key","Retina Scan"]'::jsonb,
  'Dual Vault Keycards',
  '["dual vault keycards","keycards","cards","vault cards","dual keycards"]'::jsonb,
  'Plastic magnetic cards swiped into card readers to unlock secure doors.',
  'ev_3',
  false,
  '{"descriptions":["The heavy steel vault door clicks open using two simultaneous keycards.","At 08:45 PM: The heavy steel vault door clicks open using two simultaneous keycards.","Notice this clue: The heavy steel vault door clicks open using two simultaneous keycards."],"hints":["Plastic magnetic cards swiped into card readers to unlock secure doors.","Clue hint: Think about dual vault keycards.","Search for: the real leo was in the basement vault using both brothers’ credentials."],"clues":["Dual Vault Keycards","Item: Dual Vault Keycards","Clue Word: Dual Vault Keycards"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3688911c-e838-5794-b5e1-724b84ab42a8',
  'story_030',
  'ev_3',
  3,
  '08:48 PM',
  'Black graphite safecracking powder coats the dial mechanism of the safe.',
  'Black graphite safecracking powder coats the dial mechanism of the safe.',
  'Fine graphite lubricant was used to feel the tumbler gates fall.',
  'Graphite Powder',
  'Fine grey carbon lubricant lifted from the safe dial and Leo’s watch.',
  '["Chalk Dust","Gunpowder","Coal Dust"]'::jsonb,
  'Graphite Powder',
  '["graphite powder","graphite","powder","carbon"]'::jsonb,
  'Slick grey powdered carbon used to lubricate mechanical locks.',
  'ev_4',
  false,
  '{"descriptions":["Black graphite safecracking powder coats the dial mechanism of the safe.","At 08:48 PM: Black graphite safecracking powder coats the dial mechanism of the safe.","Notice this clue: Black graphite safecracking powder coats the dial mechanism of the safe."],"hints":["Slick grey powdered carbon used to lubricate mechanical locks.","Clue hint: Think about graphite powder.","Search for: fine graphite lubricant was used to feel the tumbler gates fall."],"clues":["Graphite Powder","Item: Graphite Powder","Clue Word: Graphite Powder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '97525f13-c139-5c56-b465-a83a55f2f09a',
  'story_030',
  'ev_4',
  4,
  '08:50 PM',
  'Bundles of fifty million dollars in paper bearer bonds are packed into duffel bags.',
  'Bundles of fifty million dollars in paper bearer bonds are packed into duffel bags.',
  'The stolen bonds are completely untraceable and payable to whoever holds them.',
  'Bearer Bonds',
  'Engraved certificate bonds stamped "Payable to Bearer on Demand".',
  '["Cash Stacks","Gold Coins","Stock Shares"]'::jsonb,
  'Bearer Bonds',
  '["bearer bonds","bonds","certificates","papers"]'::jsonb,
  'Official paper securities that belong to whoever physically holds them in hand.',
  'ev_5',
  false,
  '{"descriptions":["Bundles of fifty million dollars in paper bearer bonds are packed into duffel bags.","At 08:50 PM: Bundles of fifty million dollars in paper bearer bonds are packed into duffel bags.","Notice this clue: Bundles of fifty million dollars in paper bearer bonds are packed into duffel bags."],"hints":["Official paper securities that belong to whoever physically holds them in hand.","Clue hint: Think about bearer bonds.","Search for: the stolen bonds are completely untraceable and payable to whoever holds them."],"clues":["Bearer Bonds","Item: Bearer Bonds","Clue Word: Bearer Bonds"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ab8f57a7-48e3-5176-b20f-f1151c67728f',
  'story_030',
  'ev_5',
  5,
  '09:00 PM',
  'A tube of theatrical skin-toned camouflage foundation is in Julian’s vanity.',
  'A tube of theatrical skin-toned camouflage foundation is in Julian’s vanity.',
  'Julian used heavy theatrical makeup to conceal his distinguishing chin scar.',
  'Theatrical Makeup',
  'Tube of waterproof Dermablend concealer matching Julian’s skin tone.',
  '["Toothpaste","Shaving Cream","Sunscreen"]'::jsonb,
  'Theatrical Makeup',
  '["theatrical makeup","makeup","foundation","concealer"]'::jsonb,
  'Cosmetic cream applied to human skin to hide blemishes or scars.',
  'ev_6',
  true,
  '{"descriptions":["A tube of theatrical skin-toned camouflage foundation is in Julian’s vanity.","At 09:00 PM: A tube of theatrical skin-toned camouflage foundation is in Julian’s vanity.","Notice this clue: A tube of theatrical skin-toned camouflage foundation is in Julian’s vanity."],"hints":["Cosmetic cream applied to human skin to hide blemishes or scars.","Clue hint: Think about theatrical makeup.","Search for: julian used heavy theatrical makeup to conceal his distinguishing chin scar."],"clues":["Theatrical Makeup","Item: Theatrical Makeup","Clue Word: Theatrical Makeup"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b4fe8234-dd2c-59e3-afca-86c43821d686',
  'story_030',
  'ev_6',
  6,
  '09:40 PM',
  'A tuxedo collar stained with beige cosmetic foundation is tossed into the laundry bin.',
  'A tuxedo collar stained with beige cosmetic foundation is tossed into the laundry bin.',
  'The makeup from Julian’s neck rubbed off onto Leo’s borrowed collar.',
  'Stained Tuxedo Collar',
  'Silk-lined collar showing beige liquid foundation rub marks.',
  '["Lipstick Smudge","Wine Stain","Ink Spot"]'::jsonb,
  'Stained Tuxedo Collar',
  '["stained tuxedo collar","collar","stained collar","tuxedo collar","shirt"]'::jsonb,
  'The neck part of a formal dress shirt that touches the chin and throat.',
  'ev_7',
  false,
  '{"descriptions":["A tuxedo collar stained with beige cosmetic foundation is tossed into the laundry bin.","At 09:40 PM: A tuxedo collar stained with beige cosmetic foundation is tossed into the laundry bin.","Notice this clue: A tuxedo collar stained with beige cosmetic foundation is tossed into the laundry bin."],"hints":["The neck part of a formal dress shirt that touches the chin and throat.","Clue hint: Think about stained tuxedo collar.","Search for: the makeup from julian’s neck rubbed off onto leo’s borrowed collar."],"clues":["Stained Tuxedo Collar","Item: Stained Tuxedo Collar","Clue Word: Stained Tuxedo Collar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a0332be6-0543-54d8-9a99-67fee30b3cf0',
  'story_030',
  'ev_7',
  7,
  '10:00 PM',
  'A titanium wristwatch with graphite powder trapped in the link pins is seized.',
  'A titanium wristwatch with graphite powder trapped in the link pins is seized.',
  'Leo wore this watch while spinning the safe dial in the vault.',
  'Titanium Watch',
  'Luxury dive watch with microscopic lock lubricant between the metal links.',
  '["Pocket Watch","Gold Ring","Bracelet"]'::jsonb,
  'Titanium Watch',
  '["titanium watch","watch","wristwatch"]'::jsonb,
  'A timepiece worn on a wrist made of lightweight grey metal.',
  'ev_8',
  false,
  '{"descriptions":["A titanium wristwatch with graphite powder trapped in the link pins is seized.","At 10:00 PM: A titanium wristwatch with graphite powder trapped in the link pins is seized.","Notice this clue: A titanium wristwatch with graphite powder trapped in the link pins is seized."],"hints":["A timepiece worn on a wrist made of lightweight grey metal.","Clue hint: Think about titanium watch.","Search for: leo wore this watch while spinning the safe dial in the vault."],"clues":["Titanium Watch","Item: Titanium Watch","Clue Word: Titanium Watch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '57857392-7719-50ea-8a17-59c07d2c977b',
  'story_030',
  'ev_8',
  8,
  '10:30 PM',
  'A secret twin agreement dividing fifty million dollars 50/50 is uncovered.',
  'A secret twin agreement dividing fifty million dollars 50/50 is uncovered.',
  'The brothers had a signed pact detailing their coordinated alibi heist.',
  'Twin Heist Agreement',
  'Handwritten contract signed by both Leo and Julian Sterling.',
  '["Will","Bank Statement","Lease"]'::jsonb,
  'Twin Heist Agreement',
  '["twin heist agreement","agreement","contract","twin agreement","pact"]'::jsonb,
  'A written document where two people promise to split stolen money.',
  NULL,
  true,
  '{"descriptions":["A secret twin agreement dividing fifty million dollars 50/50 is uncovered.","At 10:30 PM: A secret twin agreement dividing fifty million dollars 50/50 is uncovered.","Notice this clue: A secret twin agreement dividing fifty million dollars 50/50 is uncovered."],"hints":["A written document where two people promise to split stolen money.","Clue hint: Think about twin heist agreement.","Search for: the brothers had a signed pact detailing their coordinated alibi heist."],"clues":["Twin Heist Agreement","Item: Twin Heist Agreement","Clue Word: Twin Heist Agreement"]}'::jsonb
);
