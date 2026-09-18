-- ============================================================================
-- INKBOUND — SEED STORIES 031 TO 060
-- Part of the 120 Complete Connected Story Database with Dynamic Wording
-- ============================================================================

-- ----------------------------------------------------------------------------
-- CASE: STORY_031 — THE ECHO IN THE WELL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_031',
  'The Echo in the Well',
  'Psychological',
  'Blackwood Farmstead, overgrown stone courtyard and deep limestone well covered with wooden planks',
  'A mysterious voice echoed from the bottom of an abandoned 60-foot farm well calling farmer Thomas by name every midnight.',
  '[{"name":"Caleb Vance","role":"Aggressive Real Estate Developer","alibi":"Staying at the Blackwood Motel three miles away","avatar":"💼"},{"name":"Thomas Miller","role":"Elderly Farmer","alibi":"Inside his farmhouse clutching a double-barreled shotgun","avatar":"🌾"},{"name":"Nora Miller","role":"Thomas’s Daughter","alibi":"Sleeping in the upstairs farmhouse bedroom","avatar":"🚜"},{"name":"Detective Sam Ross","role":"Rural Crimes Investigator","alibi":"Arrived at the farm at 11:30 PM to stake out the courtyard","avatar":"🔦"}]'::jsonb,
  'Land developer Caleb Vance lowered an insulated battery speaker down the 60-foot stone well shaft. He played audio recordings of Thomas’s deceased brother calling for help at midnight, intending to drive the superstitious farmer to sell his valuable land.',
  'Land Developer Caleb Vance',
  'Caleb wanted to buy the fertile farm property cheap by convincing Thomas the land was cursed.',
  '[{"time":"11:00 PM","event":"Caleb parks his dark pickup truck behind the old hay barn."},{"time":"11:45 PM","event":"Caleb connects his smartphone to the remote well speaker."},{"time":"12:00 AM","event":"The haunting looped voice begins echoing from the deep water."},{"time":"12:30 AM","event":"Thomas rushes outside in terror with his shotgun."},{"time":"01:00 AM","event":"Detective Ross rappels a searchlight down the shaft and discovers the speaker."}]'::jsonb,
  '[{"id":"ev1","title":"Waterproof Speaker in Well Shaft","detail":"Found dangling 55 feet down the shaft on black braided fishing line."},{"id":"ev2","title":"William Voice Loop on Caleb’s Phone","detail":"Audio matches the exact words echoing from the well shaft."},{"id":"ev3","title":"Cowboy Boot Mud Prints at Well Rim","detail":"Matches the distinctive tread of Caleb Vance’s leather boots."},{"id":"ev4","title":"Highway Development Option Contract","detail":"Shows Caleb stood to gain half a million dollars by forcing the sale."}]'::jsonb,
  '[{"order":1,"title":"Echoing Voice","text":"Haunting voice calling Thomas’s name from the deep stone well."},{"order":2,"title":"Waterproof Speaker","text":"Submersible audio unit lowered sixty feet down into the shaft."},{"order":3,"title":"Braided Fishing Line","text":"High-strength wire used to suspend the speaker above the water."},{"order":4,"title":"Voice Audio File","text":"Digital loop on Caleb’s phone containing the brother’s voice."},{"order":5,"title":"Signal Booster","text":"Antenna used to beam audio from the barn to the bottom of the well."},{"order":6,"title":"Land Sale Contract","text":"Contract offering pennies for Thomas’s valuable farm acreage."}]'::jsonb,
  'Thomas’s old shotgun smelled of gun oil.: He held it for protection, but never fired a shot.; The well had a natural wind draft.: A cool breeze blew through the stones, but carried no words.',
  'Claim a wandering drifter fell down the well or claim Thomas suffered auditory schizophrenia.',
  'NORMAL',
  'Was someone trapped alive at the bottom of the well, or was an acoustical trap driving Thomas to panic?',
  '[{"character":"Caleb Vance","secret":"He hid a radio receiver in his pickup truck to broadcast the well audio."},{"character":"Thomas Miller","secret":"He felt intense guilt because he argued with William the night William died."},{"character":"Nora Miller","secret":"She secretly hired a private investigator to check Caleb Vance’s background."},{"character":"Detective Sam Ross","secret":"Enjoys debunking local supernatural legends."}]'::jsonb,
  '[{"lead":"Thomas’s old shotgun smelled of gun oil.","explanation":"He held it for protection, but never fired a shot."},{"lead":"The well had a natural wind draft.","explanation":"A cool breeze blew through the stones, but carried no words."}]'::jsonb,
  '{"wrongTheories":["A wandering drifter had fallen down the well and was calling for rescue.","Farmer Thomas was suffering from late-stage grief-induced auditory hallucinations."],"correctTheory":"Land developer Caleb Vance lowered a waterproof Bluetooth speaker into the farm well and broadcast recordings of Thomas’s dead brother to terrify him into selling his valuable land for a fraction of its value."}'::jsonb,
  'Caleb Vance lowered a speaker into the well to scare Thomas into selling his farm!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Ross hauled up the speaker and seized Caleb’s phone. Caleb was arrested for criminal harassment and extortion, while Thomas kept his beloved farm."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Thomas surrendered to panic, believed the farm was cursed, and sold the land to Caleb for twenty thousand dollars."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Local folklore claimed the well was a portal to the spirit world. Caleb demolished the well, built a shopping plaza, and made a fortune."}]'::jsonb,
  '{"intros":["A mysterious voice echoed from the bottom of an abandoned 60-foot farm well calling farmer Thomas by name every midnight.","Case file story_031: A mysterious voice echoed from the bottom of an abandoned 60-foot farm well calling farmer Thomas by name every midnight. Look closely at every clue.","Trouble begins in Blackwood Farmstead, overgrown stone courtyard and deep limestone well covered with wooden planks. A mysterious voice echoed from the bottom of an abandoned 60-foot farm well calling farmer Thomas by name every midnight.","The mystery starts now. A mysterious voice echoed from the bottom of an abandoned 60-foot farm well calling farmer Thomas by name every midnight. Can you solve it?"],"reveals":["Caleb Vance lowered a speaker into the well to scare Thomas into selling his farm!","The mystery is unraveled! Caleb Vance lowered a speaker into the well to scare Thomas into selling his farm!","At last, the truth comes out: Caleb Vance lowered a speaker into the well to scare Thomas into selling his farm!","Case resolved! Here is what happened: Caleb Vance lowered a speaker into the well to scare Thomas into selling his farm!"],"hints":["Pay attention to where Land Developer Caleb Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_031';
DELETE FROM public.case_events WHERE case_id = 'story_031';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ee259d04-414f-55ea-8ca8-6ac692c396c6',
  'story_031',
  'Caleb Vance',
  'Aggressive Real Estate Developer',
  'Smooth, pushy, wearing polished leather cowboy boots and a gold watch',
  'This farm has bad history, Thomas. Sell it to my company and start fresh in the city.',
  'He hid a radio receiver in his pickup truck to broadcast the well audio.',
  'Staying at the Blackwood Motel three miles away',
  'Offered twenty thousand dollars for land worth half a million',
  'The stone well shaft acts as a natural megaphone that amplifies low frequencies.',
  'Left nylon fishing line tied to the rusty well winch.',
  '💼',
  '["This farm has bad history, Thomas. Sell it to my company and start fresh in the city.","\"This farm has bad history, Thomas. Sell it to my company and start fresh in the city.\"","Listen to me: This farm has bad history, Thomas. Sell it to my company and start fresh in the city.","I tell you the truth: This farm has bad history, Thomas. Sell it to my company and start fresh in the city."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '78d2028b-ce62-545d-8706-2b0da1a1335e',
  'story_031',
  'Thomas Miller',
  'Elderly Farmer',
  'Weathered, superstitious, trembling from weeks of sleeplessness',
  'My brother William drowned twenty years ago, but his voice is screaming up from the dark water.',
  'He felt intense guilt because he argued with William the night William died.',
  'Inside his farmhouse clutching a double-barreled shotgun',
  'Owner of the 200-acre historic farmstead',
  'The voice only calls out between midnight and 1:00 AM.',
  'Did not know modern wireless speakers can operate 60 feet underground.',
  '🌾',
  '["My brother William drowned twenty years ago, but his voice is screaming up from the dark water.","\"My brother William drowned twenty years ago, but his voice is screaming up from the dark water.\"","Listen to me: My brother William drowned twenty years ago, but his voice is screaming up from the dark water.","I tell you the truth: My brother William drowned twenty years ago, but his voice is screaming up from the dark water."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c6d1f927-cdb3-5eca-a671-4e55c11055e3',
  'story_031',
  'Nora Miller',
  'Thomas’s Daughter',
  'Pragmatic, protective, deeply concerned for her father’s sanity',
  'I heard the voice too, but it sounds metallic and repeats the exact same words.',
  'She secretly hired a private investigator to check Caleb Vance’s background.',
  'Sleeping in the upstairs farmhouse bedroom',
  'Co-signer on the family property deed',
  'Caleb’s pickup truck was seen parked on the gravel road at midnight.',
  'Did not know how Caleb was transmitting the sound down the shaft.',
  '🚜',
  '["I heard the voice too, but it sounds metallic and repeats the exact same words.","\"I heard the voice too, but it sounds metallic and repeats the exact same words.\"","Listen to me: I heard the voice too, but it sounds metallic and repeats the exact same words.","I tell you the truth: I heard the voice too, but it sounds metallic and repeats the exact same words."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '949df813-6efb-5c59-a64a-3a9136724757',
  'story_031',
  'Detective Sam Ross',
  'Rural Crimes Investigator',
  'Grounded, patient, brings climbing ropes and powerful searchlights',
  'Ghosts don’t leave battery casings and high-tensile fishing line on stone rims.',
  'Enjoys debunking local supernatural legends.',
  'Arrived at the farm at 11:30 PM to stake out the courtyard',
  'Investigating harassment reports filed by Nora Miller',
  'Found black braided fishing wire leading down into the dark water.',
  'Did not immediately have the remote transmitter device in custody.',
  '🔦',
  '["Ghosts don’t leave battery casings and high-tensile fishing line on stone rims.","\"Ghosts don’t leave battery casings and high-tensile fishing line on stone rims.\"","Listen to me: Ghosts don’t leave battery casings and high-tensile fishing line on stone rims.","I tell you the truth: Ghosts don’t leave battery casings and high-tensile fishing line on stone rims."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '61b4f6e0-6141-51c3-9959-4cdc04dc89a6',
  'story_031',
  'ev_1',
  1,
  '12:00 AM',
  'A hollow, metallic voice echoes up the limestone well: "Thomas... help me... cold..."',
  'A hollow, metallic voice echoes up the limestone well: "Thomas... help me... cold..."',
  'The sound was amplified by the natural acoustics of the stone cylinder.',
  'Echoing Voice',
  'Acoustic audio recording captured by Detective Ross on the well rim.',
  '["Animal Howl","Wind Whistle","Water Splash"]'::jsonb,
  'Echoing Voice',
  '["echoing voice","voice","echo","sound","whisper"]'::jsonb,
  'Spoken human words bouncing off stone walls and repeating loudly.',
  'ev_2',
  true,
  '{"descriptions":["A hollow, metallic voice echoes up the limestone well: \"Thomas... help me... cold...\"","At 12:00 AM: A hollow, metallic voice echoes up the limestone well: \"Thomas... help me... cold...\"","Notice this clue: A hollow, metallic voice echoes up the limestone well: \"Thomas... help me... cold...\""],"hints":["Spoken human words bouncing off stone walls and repeating loudly.","Clue hint: Think about echoing voice.","Search for: the sound was amplified by the natural acoustics of the stone cylinder."],"clues":["Echoing Voice","Item: Echoing Voice","Clue Word: Echoing Voice"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8005f26c-4cfa-53f3-b55c-9c683862ed6b',
  'story_031',
  'ev_2',
  2,
  '12:15 AM',
  'A waterproof rugged Bluetooth speaker is submerged four inches above the water.',
  'A waterproof rugged Bluetooth speaker is submerged four inches above the water.',
  'The voice was broadcast from an electronic speaker suspended on fishing line.',
  'Waterproof Speaker',
  'Black rubberized cylinder speaker with blinking blue Bluetooth light.',
  '["Flashlight","Radio","Microphone"]'::jsonb,
  'Waterproof Speaker',
  '["waterproof speaker","speaker","bluetooth speaker","sound box"]'::jsonb,
  'A portable battery-powered box that plays music or voices from phones.',
  'ev_3',
  false,
  '{"descriptions":["A waterproof rugged Bluetooth speaker is submerged four inches above the water.","At 12:15 AM: A waterproof rugged Bluetooth speaker is submerged four inches above the water.","Notice this clue: A waterproof rugged Bluetooth speaker is submerged four inches above the water."],"hints":["A portable battery-powered box that plays music or voices from phones.","Clue hint: Think about waterproof speaker.","Search for: the voice was broadcast from an electronic speaker suspended on fishing line."],"clues":["Waterproof Speaker","Item: Waterproof Speaker","Clue Word: Waterproof Speaker"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '76804ca4-9e66-5bd0-b523-47d892489a30',
  'story_031',
  'ev_3',
  3,
  '12:20 AM',
  'A spool of 80-pound black braided fishing line is tied to the well winch.',
  'A spool of 80-pound black braided fishing line is tied to the well winch.',
  'The speaker was lowered sixty feet down into the dark shaft.',
  'Braided Fishing Line',
  'Heavy synthetic fishing wire attached to the wooden crossbeam.',
  '["Hemp Rope","Steel Chain","Copper Wire"]'::jsonb,
  'Braided Fishing Line',
  '["braided fishing line","fishing line","line","wire","braided line"]'::jsonb,
  'Thin, incredibly strong synthetic string used to catch deep-sea fish.',
  'ev_4',
  false,
  '{"descriptions":["A spool of 80-pound black braided fishing line is tied to the well winch.","At 12:20 AM: A spool of 80-pound black braided fishing line is tied to the well winch.","Notice this clue: A spool of 80-pound black braided fishing line is tied to the well winch."],"hints":["Thin, incredibly strong synthetic string used to catch deep-sea fish.","Clue hint: Think about braided fishing line.","Search for: the speaker was lowered sixty feet down into the dark shaft."],"clues":["Braided Fishing Line","Item: Braided Fishing Line","Clue Word: Braided Fishing Line"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a9331fe9-a503-5229-a4ee-101da84944a2',
  'story_031',
  'ev_4',
  4,
  '12:35 AM',
  'A smartphone audio file named "William_Voice_Loop.mp3" is found in Caleb’s truck.',
  'A smartphone audio file named "William_Voice_Loop.mp3" is found in Caleb’s truck.',
  'Caleb used an old family home-video recording to extract William’s voice.',
  'Voice Audio File',
  'Smartphone MP3 file with digital loop playback tags.',
  '["Text Message","Photo","Contact List"]'::jsonb,
  'Voice Audio File',
  '["voice audio file","audio file","mp3","file","sound file","recording"]'::jsonb,
  'A digital computer sound track saved on a mobile phone.',
  'ev_5',
  false,
  '{"descriptions":["A smartphone audio file named \"William_Voice_Loop.mp3\" is found in Caleb’s truck.","At 12:35 AM: A smartphone audio file named \"William_Voice_Loop.mp3\" is found in Caleb’s truck.","Notice this clue: A smartphone audio file named \"William_Voice_Loop.mp3\" is found in Caleb’s truck."],"hints":["A digital computer sound track saved on a mobile phone.","Clue hint: Think about voice audio file.","Search for: caleb used an old family home-video recording to extract william’s voice."],"clues":["Voice Audio File","Item: Voice Audio File","Clue Word: Voice Audio File"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '68426fe6-bbf6-57f5-84b6-84a40f5ebcbc',
  'story_031',
  'ev_5',
  5,
  '12:45 AM',
  'A high-powered long-range Bluetooth antenna booster is clamped to Caleb’s dashboard.',
  'A high-powered long-range Bluetooth antenna booster is clamped to Caleb’s dashboard.',
  'Caleb transmitted the signal from three hundred yards away behind the barn.',
  'Signal Booster',
  'Electronic signal amplifier with magnetic roof antenna.',
  '["Car Radio","Radar Detector","GPS Unit"]'::jsonb,
  'Signal Booster',
  '["signal booster","booster","antenna","amplifier"]'::jsonb,
  'An electronic device that extends the range of wireless signals.',
  'ev_6',
  true,
  '{"descriptions":["A high-powered long-range Bluetooth antenna booster is clamped to Caleb’s dashboard.","At 12:45 AM: A high-powered long-range Bluetooth antenna booster is clamped to Caleb’s dashboard.","Notice this clue: A high-powered long-range Bluetooth antenna booster is clamped to Caleb’s dashboard."],"hints":["An electronic device that extends the range of wireless signals.","Clue hint: Think about signal booster.","Search for: caleb transmitted the signal from three hundred yards away behind the barn."],"clues":["Signal Booster","Item: Signal Booster","Clue Word: Signal Booster"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a55114de-d7ce-5ae1-b404-f0e930453e14',
  'story_031',
  'ev_6',
  6,
  '01:10 AM',
  'A commercial land development contract offering twenty thousand dollars is recovered.',
  'A commercial land development contract offering twenty thousand dollars is recovered.',
  'Caleb stood to sell the farm to a highway retail corporation for six hundred thousand.',
  'Land Sale Contract',
  'Legal land deed option offering pennies on the dollar to Thomas Miller.',
  '["Lease","Receipt","Tax Bill"]'::jsonb,
  'Land Sale Contract',
  '["land sale contract","contract","land contract","sale contract","deed"]'::jsonb,
  'A legal document proposing the purchase of real estate and farmland.',
  'ev_7',
  false,
  '{"descriptions":["A commercial land development contract offering twenty thousand dollars is recovered.","At 01:10 AM: A commercial land development contract offering twenty thousand dollars is recovered.","Notice this clue: A commercial land development contract offering twenty thousand dollars is recovered."],"hints":["A legal document proposing the purchase of real estate and farmland.","Clue hint: Think about land sale contract.","Search for: caleb stood to sell the farm to a highway retail corporation for six hundred thousand."],"clues":["Land Sale Contract","Item: Land Sale Contract","Clue Word: Land Sale Contract"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6110e838-1fce-5be4-a92d-267bfb1625a9',
  'story_031',
  'ev_7',
  7,
  '01:30 AM',
  'A pair of muddy leather cowboy boots in Caleb’s truck matches well-rim prints.',
  'A pair of muddy leather cowboy boots in Caleb’s truck matches well-rim prints.',
  'Caleb stood directly on the stone coping to tie the speaker line.',
  'Cowboy Boot Prints',
  'Ornate pointed-toe boot tread impressions in the courtyard mud.',
  '["Work Boot","Sneaker","Shoe Mark"]'::jsonb,
  'Cowboy Boot Prints',
  '["cowboy boot prints","boot prints","boots","tracks","cowboy boots"]'::jsonb,
  'Decorative high-topped leather boots with pointed toes and tall heels.',
  'ev_8',
  false,
  '{"descriptions":["A pair of muddy leather cowboy boots in Caleb’s truck matches well-rim prints.","At 01:30 AM: A pair of muddy leather cowboy boots in Caleb’s truck matches well-rim prints.","Notice this clue: A pair of muddy leather cowboy boots in Caleb’s truck matches well-rim prints."],"hints":["Decorative high-topped leather boots with pointed toes and tall heels.","Clue hint: Think about cowboy boot prints.","Search for: caleb stood directly on the stone coping to tie the speaker line."],"clues":["Cowboy Boot Prints","Item: Cowboy Boot Prints","Clue Word: Cowboy Boot Prints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '45673a4a-a9e0-5a32-a9e4-f64feb33ea71',
  'story_031',
  'ev_8',
  8,
  '02:00 AM',
  'Lithium rechargeable battery packs are found in the bottom of the speaker housing.',
  'Lithium rechargeable battery packs are found in the bottom of the speaker housing.',
  'The speaker had enough battery power to broadcast for two weeks straight.',
  'Lithium Battery',
  'Dual 18650 rechargeable battery cells wrapped in heat-shrink tubing.',
  '["Car Battery","AA Battery","Solar Cell"]'::jsonb,
  'Lithium Battery',
  '["lithium battery","battery","power pack","cell"]'::jsonb,
  'A modern lightweight rechargeable battery used in electronic gadgets.',
  NULL,
  true,
  '{"descriptions":["Lithium rechargeable battery packs are found in the bottom of the speaker housing.","At 02:00 AM: Lithium rechargeable battery packs are found in the bottom of the speaker housing.","Notice this clue: Lithium rechargeable battery packs are found in the bottom of the speaker housing."],"hints":["A modern lightweight rechargeable battery used in electronic gadgets.","Clue hint: Think about lithium battery.","Search for: the speaker had enough battery power to broadcast for two weeks straight."],"clues":["Lithium Battery","Item: Lithium Battery","Clue Word: Lithium Battery"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_032 — THE HALLWAY OF LOCKED DOORS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_032',
  'The Hallway of Locked Doors',
  'Psychological',
  'The Ravenswood Sanitarium, 3rd Floor Residential Wing, long corridor of numbered wooden doors',
  'Sleepwalker Martin woke up in the hallway at 4:00 AM holding an antique emerald ring, with every door locked from the outside.',
  '[{"name":"Agnes Vance","role":"Head Residential Nurse","alibi":"At the nursing station reviewing medication inventories","avatar":"👵"},{"name":"Martin Cole","role":"Somnambulic Patient","alibi":"Asleep in Room 304 until he woke up in the corridor","avatar":"🛏️"},{"name":"Eleanor Sterling","role":"Elderly Patient (Room 308)","alibi":"Asleep in bed in Room 308","avatar":"💍"},{"name":"Detective Clara Ross","role":"Internal Affairs Investigator","alibi":"Arrived at the facility at 5:00 AM after security reported the incident","avatar":"🔍"}]'::jsonb,
  'Head Nurse Agnes Vance stole a priceless emerald ring from an elderly patient in Room 308. Knowing Martin suffered from severe somnambulism, she unlocked his door, placed him in the hallway under mild sedatives, and slipped the ring into his hand to frame him for the serial thefts.',
  'Head Nurse Agnes Vance',
  'Agnes stole heirlooms from elderly patients and used Martin’s sleepwalking as a scapegoat.',
  '[{"time":"09:00 PM","event":"Martin takes his prescribed sleep sedative and locks his room."},{"time":"03:15 AM","event":"Agnes enters Room 308 using her master key and takes the emerald ring."},{"time":"03:40 AM","event":"Agnes unlocks Martin’s door and leads the dazed sleepwalker into the hall."},{"time":"03:45 AM","event":"Agnes presses the emerald ring into Martin’s sleeping hand and locks his door behind him."},{"time":"04:00 AM","event":"Martin wakes up on the corridor floor holding the stolen emerald."}]'::jsonb,
  '[{"id":"ev1","title":"Engaged Outside Deadbolt","detail":"Proves Martin could not have locked himself out from the inside while asleep."},{"id":"ev2","title":"Lavender Lotion on Martin’s Knob","detail":"Matches Head Nurse Agnes Vance’s personal scented hand lotion."},{"id":"ev3","title":"Pawn Ticket in Agnes’s Bible","detail":"Shows five previously stolen patient rings sold at Downtown Gold Exchange."},{"id":"ev4","title":"Nurse Clog Tread Marks","detail":"Hexagonal shoe prints prove Agnes walked from Room 308 to Martin’s door."}]'::jsonb,
  '[{"order":1,"title":"Emerald Ring","text":"Stolen three-carat heirloom placed into the sleepwalker’s hand."},{"order":2,"title":"Outside Deadbolt","text":"Heavy lock turned from the hallway side, proving an outside accomplice."},{"order":3,"title":"Master Key Ring","text":"Brass keys held by Nurse Agnes capable of operating all residential doors."},{"order":4,"title":"Lavender Lotion","text":"Distinctive scented skin cream found on the locked door latch."},{"order":5,"title":"Sleep Journal","text":"Martin’s medical notes exploited by Agnes to frame him for the thefts."},{"order":6,"title":"Pawn Ticket","text":"Receipt proving Agnes was systematically fencing stolen patient jewelry."}]'::jsonb,
  'Martin had a history of walking in his sleep.: A genuine medical condition, but he could not bypass locked deadbolts.; Orderly Toby was seen in the hall at 2:00 AM.: He was merely restocking the clean towel cart.',
  'Claim Martin picked the locks in his sleep or blame the night orderly Toby.',
  'NORMAL',
  'How did Martin get out of his locked room and whose ring was in his closed fist?',
  '[{"character":"Agnes Vance","secret":"She has pawned six antique rings over the past four months."},{"character":"Martin Cole","secret":"He keeps a sleep journal tracking his midnight walking episodes."},{"character":"Eleanor Sterling","secret":"She suspected the nursing staff was skimming jewelry for weeks."},{"character":"Detective Clara Ross","secret":"Investigated three unexplained jewel thefts at other care homes."}]'::jsonb,
  '[{"lead":"Martin had a history of walking in his sleep.","explanation":"A genuine medical condition, but he could not bypass locked deadbolts."},{"lead":"Orderly Toby was seen in the hall at 2:00 AM.","explanation":"He was merely restocking the clean towel cart."}]'::jsonb,
  '{"wrongTheories":["Martin picked the deadbolt locks in an unconscious trance state.","Eleanor gave the ring to Martin willingly and forgot due to dementia."],"correctTheory":"Head Nurse Agnes Vance stole Eleanor’s emerald ring, used her master key to bring the sedated sleepwalker Martin into the hallway, locked his door from the outside, and placed the ring in his hand to frame him for her serial jewel thefts."}'::jsonb,
  'Nurse Agnes Vance stole the ring and framed sleepwalking Martin!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Ross found the pawn tickets in Agnes’s Bible and exonerated Martin. Agnes was arrested for felony grand larceny and elder abuse."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Martin was transferred to a maximum-security psychiatric ward as a dangerous thief. Agnes continued stealing from vulnerable patients."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The administration blamed supernatural somnambulism and installed iron bars on all doors. Agnes pawned the emerald ring for thirty thousand dollars."}]'::jsonb,
  '{"intros":["Sleepwalker Martin woke up in the hallway at 4:00 AM holding an antique emerald ring, with every door locked from the outside.","Case file story_032: Sleepwalker Martin woke up in the hallway at 4:00 AM holding an antique emerald ring, with every door locked from the outside. Look closely at every clue.","Trouble begins in The Ravenswood Sanitarium, 3rd Floor Residential Wing, long corridor of numbered wooden doors. Sleepwalker Martin woke up in the hallway at 4:00 AM holding an antique emerald ring, with every door locked from the outside.","The mystery starts now. Sleepwalker Martin woke up in the hallway at 4:00 AM holding an antique emerald ring, with every door locked from the outside. Can you solve it?"],"reveals":["Nurse Agnes Vance stole the ring and framed sleepwalking Martin!","The mystery is unraveled! Nurse Agnes Vance stole the ring and framed sleepwalking Martin!","At last, the truth comes out: Nurse Agnes Vance stole the ring and framed sleepwalking Martin!","Case resolved! Here is what happened: Nurse Agnes Vance stole the ring and framed sleepwalking Martin!"],"hints":["Pay attention to where Head Nurse Agnes Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_032';
DELETE FROM public.case_events WHERE case_id = 'story_032';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6d200048-578c-5f8c-b745-3bc4669c4141',
  'story_032',
  'Agnes Vance',
  'Head Residential Nurse',
  'Strict, motherly facade, sharp greedy eyes, jingling ring of master brass keys',
  'Martin has wandered the halls before. He must have broken into Room 308 in his sleep.',
  'She has pawned six antique rings over the past four months.',
  'At the nursing station reviewing medication inventories',
  'Holds master skeleton keys to every patient door on Floor 3',
  'Martin takes strong sleep medication that leaves him compliant and dazed.',
  'Left lavender hand lotion residue on Martin’s doorknob.',
  '👵',
  '["Martin has wandered the halls before. He must have broken into Room 308 in his sleep.","\"Martin has wandered the halls before. He must have broken into Room 308 in his sleep.\"","Listen to me: Martin has wandered the halls before. He must have broken into Room 308 in his sleep.","I tell you the truth: Martin has wandered the halls before. He must have broken into Room 308 in his sleep."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7f6a56a0-a4f3-5695-a784-91177fabdd52',
  'story_032',
  'Martin Cole',
  'Somnambulic Patient',
  'Gentle, terrified, confused, wearing flannel pajamas',
  'I went to sleep in my bed. I woke up on the cold floor holding this green ring.',
  'He keeps a sleep journal tracking his midnight walking episodes.',
  'Asleep in Room 304 until he woke up in the corridor',
  'Accused of being a midnight thief',
  'His bedroom door was bolted with a deadbolt that requires an outside key.',
  'Did not remember Agnes guiding him into the corridor.',
  '🛏️',
  '["I went to sleep in my bed. I woke up on the cold floor holding this green ring.","\"I went to sleep in my bed. I woke up on the cold floor holding this green ring.\"","Listen to me: I went to sleep in my bed. I woke up on the cold floor holding this green ring.","I tell you the truth: I went to sleep in my bed. I woke up on the cold floor holding this green ring."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b00120fb-f6f5-5c66-a035-399e68add437',
  'story_032',
  'Eleanor Sterling',
  'Elderly Patient (Room 308)',
  'Frail, aristocratic, deeply attached to family jewelry',
  'My grandmother’s emerald ring was in my jewelry box when I fell asleep at 9:00 PM.',
  'She suspected the nursing staff was skimming jewelry for weeks.',
  'Asleep in bed in Room 308',
  'Owner of the stolen emerald ring',
  'She heard soft rubber-soled nursing shoes outside her door at 3:30 AM.',
  'Could not see who entered her room in the dark.',
  '💍',
  '["My grandmother’s emerald ring was in my jewelry box when I fell asleep at 9:00 PM.","\"My grandmother’s emerald ring was in my jewelry box when I fell asleep at 9:00 PM.\"","Listen to me: My grandmother’s emerald ring was in my jewelry box when I fell asleep at 9:00 PM.","I tell you the truth: My grandmother’s emerald ring was in my jewelry box when I fell asleep at 9:00 PM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'bdbaebc5-231f-5184-9da1-e195a5edd520',
  'story_032',
  'Detective Clara Ross',
  'Internal Affairs Investigator',
  'Sharp, observant, measures lock mechanisms with calipers',
  'Sleepwalkers do not pick complex 5-pin tumbler mortise deadbolts with bare hands.',
  'Investigated three unexplained jewel thefts at other care homes.',
  'Arrived at the facility at 5:00 AM after security reported the incident',
  'Investigating systemic theft from elderly residents',
  'The lock on Martin’s door shows zero scratch or bypass marks.',
  'Did not know Agnes had a pawn ticket hidden in her Bible.',
  '🔍',
  '["Sleepwalkers do not pick complex 5-pin tumbler mortise deadbolts with bare hands.","\"Sleepwalkers do not pick complex 5-pin tumbler mortise deadbolts with bare hands.\"","Listen to me: Sleepwalkers do not pick complex 5-pin tumbler mortise deadbolts with bare hands.","I tell you the truth: Sleepwalkers do not pick complex 5-pin tumbler mortise deadbolts with bare hands."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f2d25d67-bc70-5d7f-87f7-d599dc746708',
  'story_032',
  'ev_1',
  1,
  '04:00 AM',
  'A gold filigree ring set with a vibrant square-cut Colombian emerald is in Martin’s fist.',
  'A gold filigree ring set with a vibrant square-cut Colombian emerald is in Martin’s fist.',
  'The ring belonged to Eleanor in Room 308, three doors down the hallway.',
  'Emerald Ring',
  '18-carat gold ring with a three-carat natural emerald.',
  '["Diamond Brooch","Gold Watch","Silver Locket"]'::jsonb,
  'Emerald Ring',
  '["emerald ring","ring","emerald","gold ring"]'::jsonb,
  'A circular band of gold worn on a finger set with a green precious gem.',
  'ev_2',
  true,
  '{"descriptions":["A gold filigree ring set with a vibrant square-cut Colombian emerald is in Martin’s fist.","At 04:00 AM: A gold filigree ring set with a vibrant square-cut Colombian emerald is in Martin’s fist.","Notice this clue: A gold filigree ring set with a vibrant square-cut Colombian emerald is in Martin’s fist."],"hints":["A circular band of gold worn on a finger set with a green precious gem.","Clue hint: Think about emerald ring.","Search for: the ring belonged to eleanor in room 308, three doors down the hallway."],"clues":["Emerald Ring","Item: Emerald Ring","Clue Word: Emerald Ring"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '818b89b5-5a92-5ca8-b3d7-5f195d3e3f72',
  'story_032',
  'ev_2',
  2,
  '04:05 AM',
  'The deadbolt lock on Martin’s door is locked tight from the outside.',
  'The deadbolt lock on Martin’s door is locked tight from the outside.',
  'Martin could not have locked his own door from the outside without a key.',
  'Outside Deadbolt',
  'Heavy brass deadbolt engaged from the hallway side with zero lockpick scratches.',
  '["Padlock","Chain Latch","Hook"]'::jsonb,
  'Outside Deadbolt',
  '["outside deadbolt","deadbolt","lock","brass lock"]'::jsonb,
  'A heavy metal bolt lock turned with a key from the hallway side.',
  'ev_3',
  false,
  '{"descriptions":["The deadbolt lock on Martin’s door is locked tight from the outside.","At 04:05 AM: The deadbolt lock on Martin’s door is locked tight from the outside.","Notice this clue: The deadbolt lock on Martin’s door is locked tight from the outside."],"hints":["A heavy metal bolt lock turned with a key from the hallway side.","Clue hint: Think about outside deadbolt.","Search for: martin could not have locked his own door from the outside without a key."],"clues":["Outside Deadbolt","Item: Outside Deadbolt","Clue Word: Outside Deadbolt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c3806b1b-15f8-5993-b03c-c423db9f261a',
  'story_032',
  'ev_3',
  3,
  '04:10 AM',
  'A master skeleton key on a brass ring jingles in Agnes’s uniform pocket.',
  'A master skeleton key on a brass ring jingles in Agnes’s uniform pocket.',
  'Only Agnes had the master key capable of deadbolting Martin’s room from outside.',
  'Master Key Ring',
  'Ring of brass skeleton keys opening every patient room on Floor 3.',
  '["Car Key","Locker Key","Desk Key"]'::jsonb,
  'Master Key Ring',
  '["master key ring","master key","keys","key ring","brass key"]'::jsonb,
  'A ring of metal keys that can open all doors in an entire building.',
  'ev_4',
  false,
  '{"descriptions":["A master skeleton key on a brass ring jingles in Agnes’s uniform pocket.","At 04:10 AM: A master skeleton key on a brass ring jingles in Agnes’s uniform pocket.","Notice this clue: A master skeleton key on a brass ring jingles in Agnes’s uniform pocket."],"hints":["A ring of metal keys that can open all doors in an entire building.","Clue hint: Think about master key ring.","Search for: only agnes had the master key capable of deadbolting martin’s room from outside."],"clues":["Master Key Ring","Item: Master Key Ring","Clue Word: Master Key Ring"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4263deac-e6b6-51b9-b589-8abb09851ea5',
  'story_032',
  'ev_4',
  4,
  '04:15 AM',
  'A faint scent of lavender hand lotion is lifted from Martin’s brass doorknob.',
  'A faint scent of lavender hand lotion is lifted from Martin’s brass doorknob.',
  'The doorknob was turned by someone using Agnes’s signature lavender cream.',
  'Lavender Lotion',
  'Chemical swab showing English lavender scented lanolin lotion.',
  '["Soap Suds","Perfume","Alcohol Rub"]'::jsonb,
  'Lavender Lotion',
  '["lavender lotion","lotion","cream","lavender scent"]'::jsonb,
  'Scented moisturizing skin cream that smells like purple flowers.',
  'ev_5',
  false,
  '{"descriptions":["A faint scent of lavender hand lotion is lifted from Martin’s brass doorknob.","At 04:15 AM: A faint scent of lavender hand lotion is lifted from Martin’s brass doorknob.","Notice this clue: A faint scent of lavender hand lotion is lifted from Martin’s brass doorknob."],"hints":["Scented moisturizing skin cream that smells like purple flowers.","Clue hint: Think about lavender lotion.","Search for: the doorknob was turned by someone using agnes’s signature lavender cream."],"clues":["Lavender Lotion","Item: Lavender Lotion","Clue Word: Lavender Lotion"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a8f0e1c7-3363-5c1d-b551-81a4304cd099',
  'story_032',
  'ev_5',
  5,
  '04:30 AM',
  'Martin’s sleep journal on his bedside table documents ten years of sleepwalking.',
  'Martin’s sleep journal on his bedside table documents ten years of sleepwalking.',
  'Agnes studied Martin’s journal to know he would make a perfect scapegoat.',
  'Sleep Journal',
  'Notebook detailing sleepwalking episodes and medication reactions.',
  '["Medical Chart","Diary","Novel"]'::jsonb,
  'Sleep Journal',
  '["sleep journal","journal","notebook","notes"]'::jsonb,
  'A written personal record tracking how well or strangely someone sleeps.',
  'ev_6',
  true,
  '{"descriptions":["Martin’s sleep journal on his bedside table documents ten years of sleepwalking.","At 04:30 AM: Martin’s sleep journal on his bedside table documents ten years of sleepwalking.","Notice this clue: Martin’s sleep journal on his bedside table documents ten years of sleepwalking."],"hints":["A written personal record tracking how well or strangely someone sleeps.","Clue hint: Think about sleep journal.","Search for: agnes studied martin’s journal to know he would make a perfect scapegoat."],"clues":["Sleep Journal","Item: Sleep Journal","Clue Word: Sleep Journal"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '56e944f4-cb1a-57e2-96b6-768d1ba44b60',
  'story_032',
  'ev_6',
  6,
  '04:45 AM',
  'A pawnshop ticket tucked inside Agnes’s personal Bible shows five rings sold.',
  'A pawnshop ticket tucked inside Agnes’s personal Bible shows five rings sold.',
  'Agnes had been systematically stealing and pawning residents’ jewelry for months.',
  'Pawn Ticket',
  'Printed ticket from "Downtown Gold Exchange" listing five estate rings.',
  '["Church Bulletin","Bookmark","Receipt"]'::jsonb,
  'Pawn Ticket',
  '["pawn ticket","ticket","receipt","pawn slip"]'::jsonb,
  'A paper slip given when you leave jewelry at a pawnshop in exchange for cash.',
  'ev_7',
  false,
  '{"descriptions":["A pawnshop ticket tucked inside Agnes’s personal Bible shows five rings sold.","At 04:45 AM: A pawnshop ticket tucked inside Agnes’s personal Bible shows five rings sold.","Notice this clue: A pawnshop ticket tucked inside Agnes’s personal Bible shows five rings sold."],"hints":["A paper slip given when you leave jewelry at a pawnshop in exchange for cash.","Clue hint: Think about pawn ticket.","Search for: agnes had been systematically stealing and pawning residents’ jewelry for months."],"clues":["Pawn Ticket","Item: Pawn Ticket","Clue Word: Pawn Ticket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f865c8be-54dc-5cf9-9461-ab55e35bdd80',
  'story_032',
  'ev_7',
  7,
  '05:00 AM',
  'Eleanor’s velvet jewelry box in Room 308 has its brass lock pried open.',
  'Eleanor’s velvet jewelry box in Room 308 has its brass lock pried open.',
  'The box was opened quietly while Eleanor was sleeping under sedation.',
  'Jewelry Box',
  'Padded velvet box with empty ring slot and minor tool scratch.',
  '["Dresser Drawer","Handbag","Safe"]'::jsonb,
  'Jewelry Box',
  '["jewelry box","box","velvet box"]'::jsonb,
  'A small padded container used to store rings, earrings, and necklaces.',
  'ev_8',
  false,
  '{"descriptions":["Eleanor’s velvet jewelry box in Room 308 has its brass lock pried open.","At 05:00 AM: Eleanor’s velvet jewelry box in Room 308 has its brass lock pried open.","Notice this clue: Eleanor’s velvet jewelry box in Room 308 has its brass lock pried open."],"hints":["A small padded container used to store rings, earrings, and necklaces.","Clue hint: Think about jewelry box.","Search for: the box was opened quietly while eleanor was sleeping under sedation."],"clues":["Jewelry Box","Item: Jewelry Box","Clue Word: Jewelry Box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '83e7ba40-80f3-5fbf-9162-922c44a5896c',
  'story_032',
  'ev_8',
  8,
  '05:30 AM',
  'Soft rubber-soled nurse clogs match clean wax impressions on the hall linoleum.',
  'Soft rubber-soled nurse clogs match clean wax impressions on the hall linoleum.',
  'The footsteps between Room 308 and Martin’s room were nursing clogs.',
  'Nurse Clogs',
  'White orthotic hospital shoes with distinctive hexagonal tread.',
  '["Slippers","Boots","Sneakers"]'::jsonb,
  'Nurse Clogs',
  '["nurse clogs","clogs","shoes","footprints"]'::jsonb,
  'White rubber-soled supportive shoes worn by hospital nurses.',
  NULL,
  true,
  '{"descriptions":["Soft rubber-soled nurse clogs match clean wax impressions on the hall linoleum.","At 05:30 AM: Soft rubber-soled nurse clogs match clean wax impressions on the hall linoleum.","Notice this clue: Soft rubber-soled nurse clogs match clean wax impressions on the hall linoleum."],"hints":["White rubber-soled supportive shoes worn by hospital nurses.","Clue hint: Think about nurse clogs.","Search for: the footsteps between room 308 and martin’s room were nursing clogs."],"clues":["Nurse Clogs","Item: Nurse Clogs","Clue Word: Nurse Clogs"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_033 — THE FORGOTTEN PHONE CALL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_033',
  'The Forgotten Phone Call',
  'Psychological',
  'The Hawthorne Victorian Estate, dark oak library, antique rotary telephone on a marble table',
  'A voicemail was recorded on the library tape machine from a phone number disconnected ten years ago, warning of a murder at midnight.',
  '[{"name":"Victor Cross","role":"Telecom Wire Technician","alibi":"In his repair truck parked by the telephone pole down the road","avatar":"🧰"},{"name":"Beatrice Hawthorne","role":"Elderly Widow","alibi":"In the library sitting beside the rotary telephone","avatar":"👵"},{"name":"Maria Santos","role":"Live-in Housekeeper","alibi":"In the kitchen preparing chamomile tea","avatar":"🧹"},{"name":"Detective Marcus Bell","role":"Telecom Fraud Investigator","alibi":"Arrived at the estate after Beatrice called emergency services in tears","avatar":"🔍"}]'::jsonb,
  'Telecom technician Victor Cross tapped into the old copper telephone junction box behind the garden wall. Using a signal generator, he spoofed the caller-ID of the owner’s deceased husband and played old cassette recordings to make her believe ghosts were calling her.',
  'Telecommunications Technician Victor Cross',
  'Victor was hired to fake phantom phone calls to terrify the elderly homeowner into selling her estate.',
  '[{"time":"10:30 PM","event":"Victor climbs the garden telephone pole and splices into Line 4."},{"time":"11:45 PM","event":"Victor uses an analog generator to send a 90V ring pulse to the house."},{"time":"11:58 PM","event":"The rotary phone rings; Beatrice answers and hears Arthur’s voice."},{"time":"12:00 AM","event":"The recorded voice warns: \"Sell the house Beatrice, before the fire...\""},{"time":"12:30 AM","event":"Detective Bell inspects the junction box and discovers the tap."}]'::jsonb,
  '[{"id":"ev1","title":"Garden Junction Box Tap","detail":"Alligator clips and fresh solder spliced directly into Beatrice’s private phone line."},{"id":"ev2","title":"90V Ring Generator in Ivy","detail":"Generated the mechanical telephone ring without central exchange routing."},{"id":"ev3","title":"Yellow Wire Strippers #12","detail":"Registered to Telecom Technician Victor Cross’s company tool inventory."},{"id":"ev4","title":"Apex Properties Bribe Receipt","detail":"Proves a ten-thousand-dollar contract to intimidate the widow into selling."}]'::jsonb,
  '[{"order":1,"title":"Rotary Telephone","text":"Vintage phone forced to ring by an injected electrical pulse."},{"order":2,"title":"Voicemail Recording","text":"Audio of the deceased husband spliced from old family home movies."},{"order":3,"title":"Tapped Junction Box","text":"Exterior telephone box spliced to feed unauthorized audio into the house."},{"order":4,"title":"Ring Generator","text":"Portable battery tool used to generate the high-voltage phone ring."},{"order":5,"title":"Wire Strippers","text":"Lineman tool with company serial numbers dropped in the garden."},{"order":6,"title":"Bribe Receipt","text":"Financial proof linking the telephone harassment to a real estate developer."}]'::jsonb,
  'Housekeeper Maria burned sage in the hallway.: She was trying to cleanse the house of what she believed were ghosts.; A sudden thunderstorm struck the area.: Thunder shook the windows, but did not cause the spliced telephone rings.',
  'Claim a genuine supernatural ghost called or blame the housekeeper Maria.',
  'NORMAL',
  'How could a call originate from a dead phone line, and who was the intended victim?',
  '[{"character":"Victor Cross","secret":"He was paid ten thousand dollars by a corrupt property developer to spoof the calls."},{"character":"Beatrice Hawthorne","secret":"She was refusing all offers to sell her historic manor."},{"character":"Maria Santos","secret":"She unplugged the phone yesterday, yet it rang anyway."},{"character":"Detective Marcus Bell","secret":"Former military signals intelligence technician."}]'::jsonb,
  '[{"lead":"Housekeeper Maria burned sage in the hallway.","explanation":"She was trying to cleanse the house of what she believed were ghosts."},{"lead":"A sudden thunderstorm struck the area.","explanation":"Thunder shook the windows, but did not cause the spliced telephone rings."}]'::jsonb,
  '{"wrongTheories":["The spirit of Beatrice’s late husband was warning her from beyond the grave.","Housekeeper Maria faked the calls to scare Beatrice into moving to a smaller house."],"correctTheory":"Telecom technician Victor Cross spliced into the garden junction box, used a ring generator to trigger the rotary phone, and played taped recordings of her dead husband to terrorize Beatrice into selling her manor for Apex Properties."}'::jsonb,
  'Technician Victor Cross tapped the phone box for a real estate bribe!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Bell arrested Victor Cross at his utility truck. Victor confessed and implicated Apex Properties, securing Beatrice’s home and peace of mind."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Beatrice suffered a nervous collapse and signed her estate over to Apex Properties for a pittance. Victor collected his bonus."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The telephone company claimed atmospheric interference caused phantom line signals. Beatrice moved into a retirement home in fear."}]'::jsonb,
  '{"intros":["A voicemail was recorded on the library tape machine from a phone number disconnected ten years ago, warning of a murder at midnight.","Case file story_033: A voicemail was recorded on the library tape machine from a phone number disconnected ten years ago, warning of a murder at midnight. Look closely at every clue.","Trouble begins in The Hawthorne Victorian Estate, dark oak library, antique rotary telephone on a marble table. A voicemail was recorded on the library tape machine from a phone number disconnected ten years ago, warning of a murder at midnight.","The mystery starts now. A voicemail was recorded on the library tape machine from a phone number disconnected ten years ago, warning of a murder at midnight. Can you solve it?"],"reveals":["Technician Victor Cross tapped the phone box for a real estate bribe!","The mystery is unraveled! Technician Victor Cross tapped the phone box for a real estate bribe!","At last, the truth comes out: Technician Victor Cross tapped the phone box for a real estate bribe!","Case resolved! Here is what happened: Technician Victor Cross tapped the phone box for a real estate bribe!"],"hints":["Pay attention to where Telecommunications Technician Victor Cross was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_033';
DELETE FROM public.case_events WHERE case_id = 'story_033';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '31474352-fa84-5e8e-91ac-dbf6fb32718a',
  'story_033',
  'Victor Cross',
  'Telecom Wire Technician',
  'Cynical, tech-savvy, wearing climbing belt and lineman telephone headset',
  'Old copper phone lines sometimes suffer crosstalk when rain floods the underground conduits.',
  'He was paid ten thousand dollars by a corrupt property developer to spoof the calls.',
  'In his repair truck parked by the telephone pole down the road',
  'Service technician assigned to inspect the neighborhood telephone lines',
  'The garden junction box had an unmonitored analog test line.',
  'Did not know he dropped a yellow wire-stripper tool in the garden ivy.',
  '🧰',
  '["Old copper phone lines sometimes suffer crosstalk when rain floods the underground conduits.","\"Old copper phone lines sometimes suffer crosstalk when rain floods the underground conduits.\"","Listen to me: Old copper phone lines sometimes suffer crosstalk when rain floods the underground conduits.","I tell you the truth: Old copper phone lines sometimes suffer crosstalk when rain floods the underground conduits."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c5faa0ec-8aa8-532b-b6d2-5c1669329d0d',
  'story_033',
  'Beatrice Hawthorne',
  'Elderly Widow',
  'Frail, elegant, terrified, clutching a silver rosary',
  'The voice was my husband Arthur. He died in 2014, but he told me someone is in the basement.',
  'She was refusing all offers to sell her historic manor.',
  'In the library sitting beside the rotary telephone',
  'Target of the psychological harassment campaign',
  'Arthur’s favorite phrase: "Check the grandfather clock, Beatrice."',
  'Did not realize someone had spliced into her garden telephone terminal.',
  '👵',
  '["The voice was my husband Arthur. He died in 2014, but he told me someone is in the basement.","\"The voice was my husband Arthur. He died in 2014, but he told me someone is in the basement.\"","Listen to me: The voice was my husband Arthur. He died in 2014, but he told me someone is in the basement.","I tell you the truth: The voice was my husband Arthur. He died in 2014, but he told me someone is in the basement."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0c6e04a2-a057-59cc-a0bf-58f6b93d04fb',
  'story_033',
  'Maria Santos',
  'Live-in Housekeeper',
  'Loyal, protective, carrying a wooden cross and salt shaker',
  'The telephone rang three times at midnight with a strange double chirp.',
  'She unplugged the phone yesterday, yet it rang anyway.',
  'In the kitchen preparing chamomile tea',
  'Cared for Beatrice for fifteen years',
  'Saw a utility technician climbing the telephone pole at 11:00 PM.',
  'Did not know how telephone line spoofing operates.',
  '🧹',
  '["The telephone rang three times at midnight with a strange double chirp.","\"The telephone rang three times at midnight with a strange double chirp.\"","Listen to me: The telephone rang three times at midnight with a strange double chirp.","I tell you the truth: The telephone rang three times at midnight with a strange double chirp."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f45099b8-bb05-547a-af13-13727cef4df5',
  'story_033',
  'Detective Marcus Bell',
  'Telecom Fraud Investigator',
  'Sharp, dry, carries a butt-set lineman telephone tester',
  'Dead phone lines do not ring unless someone injects a 90-volt alternating ring current.',
  'Former military signals intelligence technician.',
  'Arrived at the estate after Beatrice called emergency services in tears',
  'Investigating high-tech stalking and property intimidation',
  'Found fresh solder splices in the garden junction box.',
  'Did not immediately identify the developer paying Victor’s bills.',
  '🔍',
  '["Dead phone lines do not ring unless someone injects a 90-volt alternating ring current.","\"Dead phone lines do not ring unless someone injects a 90-volt alternating ring current.\"","Listen to me: Dead phone lines do not ring unless someone injects a 90-volt alternating ring current.","I tell you the truth: Dead phone lines do not ring unless someone injects a 90-volt alternating ring current."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '27e63b28-66ea-5dbc-b853-5a56288367e8',
  'story_033',
  'ev_1',
  1,
  '11:45 PM',
  'An antique brass rotary telephone rings with a sharp, double-pulse mechanical chirp.',
  'An antique brass rotary telephone rings with a sharp, double-pulse mechanical chirp.',
  'The ring current was generated from an external portable signal box, not the exchange.',
  'Rotary Telephone',
  'Black bakelite telephone connected to a two-wire copper terminal.',
  '["Modern Smartphone","Intercom","Doorbell"]'::jsonb,
  'Rotary Telephone',
  '["rotary telephone","telephone","rotary phone","phone"]'::jsonb,
  'A vintage telephone with a round numbered wheel you spin with a finger.',
  'ev_2',
  true,
  '{"descriptions":["An antique brass rotary telephone rings with a sharp, double-pulse mechanical chirp.","At 11:45 PM: An antique brass rotary telephone rings with a sharp, double-pulse mechanical chirp.","Notice this clue: An antique brass rotary telephone rings with a sharp, double-pulse mechanical chirp."],"hints":["A vintage telephone with a round numbered wheel you spin with a finger.","Clue hint: Think about rotary telephone.","Search for: the ring current was generated from an external portable signal box, not the exchange."],"clues":["Rotary Telephone","Item: Rotary Telephone","Clue Word: Rotary Telephone"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ccfab300-4476-5b9f-8205-790d9ed03080',
  'story_033',
  'ev_2',
  2,
  '11:58 PM',
  'An analog magnetic tape answering machine records Arthur’s voice warning of fire.',
  'An analog magnetic tape answering machine records Arthur’s voice warning of fire.',
  'The voice was an audio clip taken from an old VHS camcorder tape.',
  'Voicemail Recording',
  'Microcassette tape recording containing Arthur Hawthorne’s synthesized voice.',
  '["CD Disc","Memory Card","Paper Note"]'::jsonb,
  'Voicemail Recording',
  '["voicemail recording","recording","voicemail","tape"]'::jsonb,
  'A recorded audio message left on a telephone answering device.',
  'ev_3',
  false,
  '{"descriptions":["An analog magnetic tape answering machine records Arthur’s voice warning of fire.","At 11:58 PM: An analog magnetic tape answering machine records Arthur’s voice warning of fire.","Notice this clue: An analog magnetic tape answering machine records Arthur’s voice warning of fire."],"hints":["A recorded audio message left on a telephone answering device.","Clue hint: Think about voicemail recording.","Search for: the voice was an audio clip taken from an old vhs camcorder tape."],"clues":["Voicemail Recording","Item: Voicemail Recording","Clue Word: Voicemail Recording"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fd5cc901-29ff-5824-aeeb-c54fd46e4ddd',
  'story_033',
  'ev_3',
  3,
  '12:05 AM',
  'A garden junction box behind the rose trellis has fresh copper wire splices.',
  'A garden junction box behind the rose trellis has fresh copper wire splices.',
  'An intruder tapped into the physical phone wires leading into the house.',
  'Tapped Junction Box',
  'Weatherproof grey terminal box with spliced alligator clip jumper cables.',
  '["Fuse Box","Water Meter","Electric Panel"]'::jsonb,
  'Tapped Junction Box',
  '["tapped junction box","junction box","box","terminal","phone box"]'::jsonb,
  'An outdoor metal or plastic box where telephone wires connect to a building.',
  'ev_4',
  false,
  '{"descriptions":["A garden junction box behind the rose trellis has fresh copper wire splices.","At 12:05 AM: A garden junction box behind the rose trellis has fresh copper wire splices.","Notice this clue: A garden junction box behind the rose trellis has fresh copper wire splices."],"hints":["An outdoor metal or plastic box where telephone wires connect to a building.","Clue hint: Think about tapped junction box.","Search for: an intruder tapped into the physical phone wires leading into the house."],"clues":["Tapped Junction Box","Item: Tapped Junction Box","Clue Word: Tapped Junction Box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '66494a10-a7b0-5fc8-9bcb-19ec990b5f92',
  'story_033',
  'ev_4',
  4,
  '12:10 AM',
  'A portable 90-volt ring generator box is hidden in the garden ivy.',
  'A portable 90-volt ring generator box is hidden in the garden ivy.',
  'Used to force the house telephone to ring without calling from the phone company.',
  'Ring Generator',
  'Handheld battery box with a toggle switch labeled "90V AC RING".',
  '["Battery Charger","Stun Gun","Power Bank"]'::jsonb,
  'Ring Generator',
  '["ring generator","generator","ring box","signal generator"]'::jsonb,
  'An electronic device that generates electrical pulses to make telephones ring.',
  'ev_5',
  false,
  '{"descriptions":["A portable 90-volt ring generator box is hidden in the garden ivy.","At 12:10 AM: A portable 90-volt ring generator box is hidden in the garden ivy.","Notice this clue: A portable 90-volt ring generator box is hidden in the garden ivy."],"hints":["An electronic device that generates electrical pulses to make telephones ring.","Clue hint: Think about ring generator.","Search for: used to force the house telephone to ring without calling from the phone company."],"clues":["Ring Generator","Item: Ring Generator","Clue Word: Ring Generator"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '488a6bf6-981b-54f9-a2b0-83a2a9729b76',
  'story_033',
  'ev_5',
  5,
  '12:15 AM',
  'A pair of yellow insulated lineman wire strippers is dropped under the rose bush.',
  'A pair of yellow insulated lineman wire strippers is dropped under the rose bush.',
  'The tool has the engraved serial number of Telecom Utility Truck #12.',
  'Wire Strippers',
  'Yellow rubber-handled wire stripping pliers with cut copper insulation.',
  '["Pliers","Scissors","Wrench"]'::jsonb,
  'Wire Strippers',
  '["wire strippers","strippers","tool","pliers"]'::jsonb,
  'A metal handheld tool used by electricians to cut the plastic coating off wires.',
  'ev_6',
  true,
  '{"descriptions":["A pair of yellow insulated lineman wire strippers is dropped under the rose bush.","At 12:15 AM: A pair of yellow insulated lineman wire strippers is dropped under the rose bush.","Notice this clue: A pair of yellow insulated lineman wire strippers is dropped under the rose bush."],"hints":["A metal handheld tool used by electricians to cut the plastic coating off wires.","Clue hint: Think about wire strippers.","Search for: the tool has the engraved serial number of telecom utility truck #12."],"clues":["Wire Strippers","Item: Wire Strippers","Clue Word: Wire Strippers"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ad60f32a-901e-526c-b117-3c3cd796c938',
  'story_033',
  'ev_6',
  6,
  '12:35 AM',
  'A cassette player connected to an analog audio jack sits in the repair van.',
  'A cassette player connected to an analog audio jack sits in the repair van.',
  'Victor played the audio directly into the spliced telephone wire.',
  'Cassette Player',
  'Portable tape deck with an output wire hooked to telephone clips.',
  '["Radio","CD Player","Dictaphone"]'::jsonb,
  'Cassette Player',
  '["cassette player","tape player","player","tape deck"]'::jsonb,
  'A small portable electronic device that plays audio from cassette tapes.',
  'ev_7',
  false,
  '{"descriptions":["A cassette player connected to an analog audio jack sits in the repair van.","At 12:35 AM: A cassette player connected to an analog audio jack sits in the repair van.","Notice this clue: A cassette player connected to an analog audio jack sits in the repair van."],"hints":["A small portable electronic device that plays audio from cassette tapes.","Clue hint: Think about cassette player.","Search for: victor played the audio directly into the spliced telephone wire."],"clues":["Cassette Player","Item: Cassette Player","Clue Word: Cassette Player"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6be7e78a-53be-5dd3-9189-10dd1ead654b',
  'story_033',
  'ev_7',
  7,
  '01:00 AM',
  'A cash payment receipt for ten thousand dollars from Apex Properties is found.',
  'A cash payment receipt for ten thousand dollars from Apex Properties is found.',
  'The developer paid Victor to psychologically terrorize Beatrice into selling.',
  'Bribe Receipt',
  'Deposit confirmation signed by Apex Land Holdings for "Consulting".',
  '["Hotel Bill","Gas Slip","Parking Ticket"]'::jsonb,
  'Bribe Receipt',
  '["bribe receipt","receipt","deposit slip","paper"]'::jsonb,
  'A paper slip showing payment for services rendered.',
  'ev_8',
  false,
  '{"descriptions":["A cash payment receipt for ten thousand dollars from Apex Properties is found.","At 01:00 AM: A cash payment receipt for ten thousand dollars from Apex Properties is found.","Notice this clue: A cash payment receipt for ten thousand dollars from Apex Properties is found."],"hints":["A paper slip showing payment for services rendered.","Clue hint: Think about bribe receipt.","Search for: the developer paid victor to psychologically terrorize beatrice into selling."],"clues":["Bribe Receipt","Item: Bribe Receipt","Clue Word: Bribe Receipt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'da86a23c-0f00-54d0-bcd0-8d43084f472c',
  'story_033',
  'ev_8',
  8,
  '01:20 AM',
  'The disconnected telephone line log from the telecom exchange shows zero activity.',
  'The disconnected telephone line log from the telecom exchange shows zero activity.',
  'The central switchboard confirmed the deceased husband’s number had no routing.',
  'Exchange Log',
  'Official telecommunications report proving the line was completely dead.',
  '["Phone Bill","Caller ID Screen","Directory"]'::jsonb,
  'Exchange Log',
  '["exchange log","log","phone report","telecom log"]'::jsonb,
  'An official report from a telephone company tracking active phone numbers.',
  NULL,
  true,
  '{"descriptions":["The disconnected telephone line log from the telecom exchange shows zero activity.","At 01:20 AM: The disconnected telephone line log from the telecom exchange shows zero activity.","Notice this clue: The disconnected telephone line log from the telecom exchange shows zero activity."],"hints":["An official report from a telephone company tracking active phone numbers.","Clue hint: Think about exchange log.","Search for: the central switchboard confirmed the deceased husband’s number had no routing."],"clues":["Exchange Log","Item: Exchange Log","Clue Word: Exchange Log"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_034 — THE MAZE OF GLASS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_034',
  'The Maze of Glass',
  'Psychological',
  'The Boardwalk Funhouse, Carnival Hall of Mirrors, disorienting reflections and colored neon',
  'A wealthy tourist entered the Maze of Glass alone, but three identical men exited from different doors.',
  '[{"name":"Felix Vance","role":"Master Identity Thief","alibi":"Exited through Turnstile B carrying Arthur’s stolen passport","avatar":"🎭"},{"name":"Arthur Cole","role":"Real Tourist Victim","alibi":"Trapped in the mirror maze maintenance closet","avatar":"👤"},{"name":"Barnaby \"Carny\" Finch","role":"Funhouse Ride Operator","alibi":"In the control booth operating the ticket turnstiles","avatar":"🎪"},{"name":"Detective Rachel Sterling","role":"Boardwalk Precinct Detective","alibi":"Patrolling the boardwalk pier outside the funhouse","avatar":"🔍"}]'::jsonb,
  'Con artist Felix Vance and his two identical brothers ambushed tourist Arthur Cole inside the mirror funhouse. They stole Arthur’s wallet, passport, and clothes, dressing in identical suits and exiting through three separate turnstiles to scatter and confuse security.',
  'Con Artist Felix Vance',
  'Felix wanted to steal Arthur’s identity and international passport to flee a federal warrant.',
  '[{"time":"03:30 PM","event":"Two identical Vance brothers sneak through the funhouse maintenance door."},{"time":"03:45 PM","event":"Tourist Arthur Cole buys a single ticket and enters the mirror maze."},{"time":"03:52 PM","event":"The three brothers corner Arthur in a dead-end alcove and rob him."},{"time":"03:58 PM","event":"Three identical men wearing grey suits exit simultaneously from Doors A, B, and C."},{"time":"04:05 PM","event":"Carnival security detains all three identical men as Arthur screams from the closet."}]'::jsonb,
  '[{"id":"ev1","title":"Stolen Biometric Passport","detail":"Found in Felix Vance’s pocket at Turnstile B; registered to victim Arthur Cole."},{"id":"ev2","title":"Scorpion Wrist Tattoo","detail":"Identifies Felix as the primary assailant who physically choked Arthur in the alcove."},{"id":"ev3","title":"Stolen Money Belt with $20,000","detail":"Recovered from the third brother inside Turnstile C."},{"id":"ev4","title":"Federal Fugitive Arrest Warrant","detail":"Proves Felix Vance orchestrated the identity theft to escape the country."}]'::jsonb,
  '[{"order":1,"title":"Distorted Mirrors","text":"Curved funhouse glass used to disorient the victim and create confusion."},{"order":2,"title":"Stolen Passport","text":"Arthur Cole’s official travel document carried by the impersonator."},{"order":3,"title":"Identical Jackets","text":"Matching gray wool coats worn by three triplet con artists."},{"order":4,"title":"Scorpion Tattoo","text":"Identifying ink on the wrist of the main assailant."},{"order":5,"title":"Money Belt","text":"Elastic cash pouch holding twenty thousand dollars taken from Arthur."},{"order":6,"title":"Fugitive Warrant","text":"Wanted poster proving the leader was fleeing federal prosecution."}]'::jsonb,
  'Ride operator Barnaby took bribes to let people use the back door.: Greedy carnival worker, but not involved in the robbery conspiracy.; The carnival mirrors produced hundreds of optical reflections.: Confusing to human eyes, but optical reflections leave no fingerprints.',
  'Claim the mirrors duplicated the man through quantum optical reflections or blame the ride operator.',
  'NORMAL',
  'Which man was the real Arthur Cole and what happened to his identity inside the mirror maze?',
  '[{"character":"Felix Vance","secret":"He is wanted by federal marshals for bank fraud in three states."},{"character":"Arthur Cole","secret":"He was carrying twenty thousand dollars in cash in a hidden money belt."},{"character":"Barnaby \"Carny\" Finch","secret":"He charges extra cash to let people use the maintenance backdoor."},{"character":"Detective Rachel Sterling","secret":"Tracked the Vance triplets across two coastal carnivals."}]'::jsonb,
  '[{"lead":"Ride operator Barnaby took bribes to let people use the back door.","explanation":"Greedy carnival worker, but not involved in the robbery conspiracy."},{"lead":"The carnival mirrors produced hundreds of optical reflections.","explanation":"Confusing to human eyes, but optical reflections leave no fingerprints."}]'::jsonb,
  '{"wrongTheories":["The carnival mirrors utilized experimental quantum lasers to clone a human being.","Arthur Cole suffered from multiple personality disorder and bought three suits."],"correctTheory":"Con artist Felix Vance and his identical triplet brothers ambushed Arthur Cole inside the mirror maze, stole his passport, cash, and clothes, and exited simultaneously through three turnstiles to create an alibi puzzle and escape federal arrest."}'::jsonb,
  'The Vance triplets orchestrated an identity heist in the mirror maze!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Sterling used biometric fingerprint scanners to unmask the triplets. Felix and his brothers were arrested and Arthur’s passport and money were returned."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Police released all three suspects due to lack of distinct visual identification. Felix boarded the international ferry with Arthur’s passport."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The boardwalk tabloid sensationalized the \"Miracle of the Cloned Man,\" making the funhouse a tourist hotspot while the thieves vanished."}]'::jsonb,
  '{"intros":["A wealthy tourist entered the Maze of Glass alone, but three identical men exited from different doors.","Case file story_034: A wealthy tourist entered the Maze of Glass alone, but three identical men exited from different doors. Look closely at every clue.","Trouble begins in The Boardwalk Funhouse, Carnival Hall of Mirrors, disorienting reflections and colored neon. A wealthy tourist entered the Maze of Glass alone, but three identical men exited from different doors.","The mystery starts now. A wealthy tourist entered the Maze of Glass alone, but three identical men exited from different doors. Can you solve it?"],"reveals":["The Vance triplets orchestrated an identity heist in the mirror maze!","The mystery is unraveled! The Vance triplets orchestrated an identity heist in the mirror maze!","At last, the truth comes out: The Vance triplets orchestrated an identity heist in the mirror maze!","Case resolved! Here is what happened: The Vance triplets orchestrated an identity heist in the mirror maze!"],"hints":["Pay attention to where Con Artist Felix Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_034';
DELETE FROM public.case_events WHERE case_id = 'story_034';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '022ab579-71d7-51d6-b18b-cf88c033f710',
  'story_034',
  'Felix Vance',
  'Master Identity Thief',
  'Charming, calculating, identical triplet, sharp gray suit',
  'I am Arthur Cole. I have my passport and boarding pass right here in my coat.',
  'He is wanted by federal marshals for bank fraud in three states.',
  'Exited through Turnstile B carrying Arthur’s stolen passport',
  'Impersonator who staged the mirror maze trap',
  'The Hall of Mirrors has a maintenance blindspot with no mirror reflections.',
  'Did not know the genuine passport had an embedded digital RFID chip.',
  '🎭',
  '["I am Arthur Cole. I have my passport and boarding pass right here in my coat.","\"I am Arthur Cole. I have my passport and boarding pass right here in my coat.\"","Listen to me: I am Arthur Cole. I have my passport and boarding pass right here in my coat.","I tell you the truth: I am Arthur Cole. I have my passport and boarding pass right here in my coat."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6caf5742-b77c-52f2-89a5-a3e89d5493c7',
  'story_034',
  'Arthur Cole',
  'Real Tourist Victim',
  'Panicked, disheveled, stripped down to an undershirt and slacks',
  'They surrounded me in the mirrors! Three identical men took my coat and papers!',
  'He was carrying twenty thousand dollars in cash in a hidden money belt.',
  'Trapped in the mirror maze maintenance closet',
  'Victim of the identity robbery',
  'The attacker had a tattoo of a black scorpion on his left wrist.',
  'Did not realize the attackers were biological identical triplets.',
  '👤',
  '["They surrounded me in the mirrors! Three identical men took my coat and papers!","\"They surrounded me in the mirrors! Three identical men took my coat and papers!\"","Listen to me: They surrounded me in the mirrors! Three identical men took my coat and papers!","I tell you the truth: They surrounded me in the mirrors! Three identical men took my coat and papers!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ebd1e224-4b4d-5a48-90df-80fb5f7bc113',
  'story_034',
  'Barnaby "Carny" Finch',
  'Funhouse Ride Operator',
  'Grumpy, chewing licorice, pulling levers with greasy hands',
  'One guy bought a ticket. Ten minutes later, three identical guys in gray suits walk out.',
  'He charges extra cash to let people use the maintenance backdoor.',
  'In the control booth operating the ticket turnstiles',
  'Operator of the Maze of Glass attraction',
  'Saw two men sneak into the maintenance door twenty minutes before Arthur entered.',
  'Did not realize a robbery was planned inside.',
  '🎪',
  '["One guy bought a ticket. Ten minutes later, three identical guys in gray suits walk out.","\"One guy bought a ticket. Ten minutes later, three identical guys in gray suits walk out.\"","Listen to me: One guy bought a ticket. Ten minutes later, three identical guys in gray suits walk out.","I tell you the truth: One guy bought a ticket. Ten minutes later, three identical guys in gray suits walk out."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '63ed7343-339c-5412-bf6e-dbe255656069',
  'story_034',
  'Detective Rachel Sterling',
  'Boardwalk Precinct Detective',
  'Sharp, relentless, armed with fingerprint scanner and flashlight',
  'Mirrors don’t clone human beings. We are dealing with triplets executing an identity heist.',
  'Tracked the Vance triplets across two coastal carnivals.',
  'Patrolling the boardwalk pier outside the funhouse',
  'Leading the apprehension of the mirror maze suspects',
  'Only one suspect possesses the genuine biometric passport signature.',
  'Did not know which turnstile Felix used to escape.',
  '🔍',
  '["Mirrors don’t clone human beings. We are dealing with triplets executing an identity heist.","\"Mirrors don’t clone human beings. We are dealing with triplets executing an identity heist.\"","Listen to me: Mirrors don’t clone human beings. We are dealing with triplets executing an identity heist.","I tell you the truth: Mirrors don’t clone human beings. We are dealing with triplets executing an identity heist."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '40ab2a56-857a-52a8-9fea-1aff4ea520b6',
  'story_034',
  'ev_1',
  1,
  '03:52 PM',
  'A dead-end mirror alcove with distorted funhouse reflections smells of ether.',
  'A dead-end mirror alcove with distorted funhouse reflections smells of ether.',
  'Arthur was pinned against the mirrors and stripped of his jacket and wallet.',
  'Distorted Mirrors',
  'Curved silvered glass panels with smudge marks from a physical struggle.',
  '["Carnival Tent","Tunnel of Love","Ferris Wheel"]'::jsonb,
  'Distorted Mirrors',
  '["distorted mirrors","mirrors","funhouse mirrors","glass"]'::jsonb,
  'Wavy reflective glass panels that stretch and bend human reflections.',
  'ev_2',
  true,
  '{"descriptions":["A dead-end mirror alcove with distorted funhouse reflections smells of ether.","At 03:52 PM: A dead-end mirror alcove with distorted funhouse reflections smells of ether.","Notice this clue: A dead-end mirror alcove with distorted funhouse reflections smells of ether."],"hints":["Wavy reflective glass panels that stretch and bend human reflections.","Clue hint: Think about distorted mirrors.","Search for: arthur was pinned against the mirrors and stripped of his jacket and wallet."],"clues":["Distorted Mirrors","Item: Distorted Mirrors","Clue Word: Distorted Mirrors"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '14e0bce2-d432-5acd-9f6a-4ac62d62948b',
  'story_034',
  'ev_2',
  2,
  '03:55 PM',
  'An authentic US passport belonging to Arthur Cole is seized from Turnstile B.',
  'An authentic US passport belonging to Arthur Cole is seized from Turnstile B.',
  'The bearer was using the stolen identity to board an international ferry.',
  'Stolen Passport',
  'Blue biometric passport booklet issued to Arthur Cole.',
  '["Driver License","Library Card","Bus Pass"]'::jsonb,
  'Stolen Passport',
  '["stolen passport","passport","id","booklet"]'::jsonb,
  'An official government booklet required to travel between different countries.',
  'ev_3',
  false,
  '{"descriptions":["An authentic US passport belonging to Arthur Cole is seized from Turnstile B.","At 03:55 PM: An authentic US passport belonging to Arthur Cole is seized from Turnstile B.","Notice this clue: An authentic US passport belonging to Arthur Cole is seized from Turnstile B."],"hints":["An official government booklet required to travel between different countries.","Clue hint: Think about stolen passport.","Search for: the bearer was using the stolen identity to board an international ferry."],"clues":["Stolen Passport","Item: Stolen Passport","Clue Word: Stolen Passport"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e47598c0-3e30-52b9-97f2-d32f3cc7b2e1',
  'story_034',
  'ev_3',
  3,
  '03:58 PM',
  'Three identical gray wool tailored jackets are worn by three identical suspects.',
  'Three identical gray wool tailored jackets are worn by three identical suspects.',
  'The triplets wore identical clothing to make visual identification impossible.',
  'Identical Jackets',
  'Three size-40 gray tailored wool jackets purchased from the same department store.',
  '["Raincoats","Leather Jackets","Overcoats"]'::jsonb,
  'Identical Jackets',
  '["identical jackets","jackets","suits","gray jackets"]'::jsonb,
  'Three identical tailored outer garments worn over dress shirts.',
  'ev_4',
  false,
  '{"descriptions":["Three identical gray wool tailored jackets are worn by three identical suspects.","At 03:58 PM: Three identical gray wool tailored jackets are worn by three identical suspects.","Notice this clue: Three identical gray wool tailored jackets are worn by three identical suspects."],"hints":["Three identical tailored outer garments worn over dress shirts.","Clue hint: Think about identical jackets.","Search for: the triplets wore identical clothing to make visual identification impossible."],"clues":["Identical Jackets","Item: Identical Jackets","Clue Word: Identical Jackets"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '66cac853-caaf-5b87-accd-c17aa3c08d81',
  'story_034',
  'ev_4',
  4,
  '04:02 PM',
  'A black scorpion tattoo is visible on the left wrist of Suspect #2.',
  'A black scorpion tattoo is visible on the left wrist of Suspect #2.',
  'Arthur identified the attacker who grabbed his throat by this tattoo.',
  'Scorpion Tattoo',
  'Black ink tattoo of an arachnid on the inner left wrist tendon.',
  '["Snake Tattoo","Eagle Tattoo","Anchor Tattoo"]'::jsonb,
  'Scorpion Tattoo',
  '["scorpion tattoo","tattoo","wrist tattoo","ink"]'::jsonb,
  'A permanent ink drawing of a stinging desert creature on human skin.',
  'ev_5',
  false,
  '{"descriptions":["A black scorpion tattoo is visible on the left wrist of Suspect #2.","At 04:02 PM: A black scorpion tattoo is visible on the left wrist of Suspect #2.","Notice this clue: A black scorpion tattoo is visible on the left wrist of Suspect #2."],"hints":["A permanent ink drawing of a stinging desert creature on human skin.","Clue hint: Think about scorpion tattoo.","Search for: arthur identified the attacker who grabbed his throat by this tattoo."],"clues":["Scorpion Tattoo","Item: Scorpion Tattoo","Clue Word: Scorpion Tattoo"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7f55fe19-17b7-5f5b-b2ce-4c221e8a5c8f',
  'story_034',
  'ev_5',
  5,
  '04:10 PM',
  'A hidden zippered fabric money belt containing twenty thousand dollars is found.',
  'A hidden zippered fabric money belt containing twenty thousand dollars is found.',
  'The primary cash target taken from Arthur Cole’s waist.',
  'Money Belt',
  'Tan elastic travel belt packed with hundred-dollar bills.',
  '["Leather Wallet","Coin Purse","Fanny Pack"]'::jsonb,
  'Money Belt',
  '["money belt","belt","travel belt","cash belt"]'::jsonb,
  'A discreet cloth pouch worn around the waist under clothes to hide money.',
  'ev_6',
  true,
  '{"descriptions":["A hidden zippered fabric money belt containing twenty thousand dollars is found.","At 04:10 PM: A hidden zippered fabric money belt containing twenty thousand dollars is found.","Notice this clue: A hidden zippered fabric money belt containing twenty thousand dollars is found."],"hints":["A discreet cloth pouch worn around the waist under clothes to hide money.","Clue hint: Think about money belt.","Search for: the primary cash target taken from arthur cole’s waist."],"clues":["Money Belt","Item: Money Belt","Clue Word: Money Belt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7435e5f2-8558-5696-abd0-66208ec33be3',
  'story_034',
  'ev_6',
  6,
  '04:20 PM',
  'Three turnstiles labeled A, B, and C register simultaneous exits at 3:58 PM.',
  'Three turnstiles labeled A, B, and C register simultaneous exits at 3:58 PM.',
  'The triplets coordinated their exit to scatter police and carnival guards.',
  'Turnstile Log',
  'Mechanical counter register showing simultaneous clicks on exits A, B, and C.',
  '["Ticket Stub","Receipt","Gate Pass"]'::jsonb,
  'Turnstile Log',
  '["turnstile log","turnstile","gate log","register"]'::jsonb,
  'A revolving mechanical gate that allows one person to pass through at a time.',
  'ev_7',
  false,
  '{"descriptions":["Three turnstiles labeled A, B, and C register simultaneous exits at 3:58 PM.","At 04:20 PM: Three turnstiles labeled A, B, and C register simultaneous exits at 3:58 PM.","Notice this clue: Three turnstiles labeled A, B, and C register simultaneous exits at 3:58 PM."],"hints":["A revolving mechanical gate that allows one person to pass through at a time.","Clue hint: Think about turnstile log.","Search for: the triplets coordinated their exit to scatter police and carnival guards."],"clues":["Turnstile Log","Item: Turnstile Log","Clue Word: Turnstile Log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd23d030d-d211-52a7-b9cb-67b5fb34260a',
  'story_034',
  'ev_7',
  7,
  '04:35 PM',
  'A federal fugitive arrest warrant for Felix Vance is matched to fingerprint scans.',
  'A federal fugitive arrest warrant for Felix Vance is matched to fingerprint scans.',
  'Felix was fleeing a ten-year prison sentence for multi-state bank fraud.',
  'Fugitive Warrant',
  'Federal Marshals alert bulletin displaying Felix Vance’s fingerprint card.',
  '["Speeding Ticket","Tax Notice","Subpoena"]'::jsonb,
  'Fugitive Warrant',
  '["fugitive warrant","warrant","arrest warrant","bulletin"]'::jsonb,
  'An official court order directing police to arrest a wanted criminal.',
  'ev_8',
  false,
  '{"descriptions":["A federal fugitive arrest warrant for Felix Vance is matched to fingerprint scans.","At 04:35 PM: A federal fugitive arrest warrant for Felix Vance is matched to fingerprint scans.","Notice this clue: A federal fugitive arrest warrant for Felix Vance is matched to fingerprint scans."],"hints":["An official court order directing police to arrest a wanted criminal.","Clue hint: Think about fugitive warrant.","Search for: felix was fleeing a ten-year prison sentence for multi-state bank fraud."],"clues":["Fugitive Warrant","Item: Fugitive Warrant","Clue Word: Fugitive Warrant"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '03b7d32f-44c2-5327-ac2a-f90bdf608bd2',
  'story_034',
  'ev_8',
  8,
  '04:50 PM',
  'A hand-held digital fingerprint scanner tests all three suspects.',
  'A hand-held digital fingerprint scanner tests all three suspects.',
  'Only the real Arthur Cole in the closet matches the official tourist identity.',
  'Biometric Scanner',
  'Handheld scanner revealing the three suspects share identical triplet DNA.',
  '["Magnifying Glass","Camera","Barcode Reader"]'::jsonb,
  'Biometric Scanner',
  '["biometric scanner","scanner","fingerprint scanner"]'::jsonb,
  'An electronic handheld device used by police to instantly verify fingerprints.',
  NULL,
  true,
  '{"descriptions":["A hand-held digital fingerprint scanner tests all three suspects.","At 04:50 PM: A hand-held digital fingerprint scanner tests all three suspects.","Notice this clue: A hand-held digital fingerprint scanner tests all three suspects."],"hints":["An electronic handheld device used by police to instantly verify fingerprints.","Clue hint: Think about biometric scanner.","Search for: only the real arthur cole in the closet matches the official tourist identity."],"clues":["Biometric Scanner","Item: Biometric Scanner","Clue Word: Biometric Scanner"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_035 — THE HYPNOTIST'S POCKET WATCH
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_035',
  'The Hypnotist''s Pocket Watch',
  'Psychological',
  'The First Continental Bank, Private Executive Vault, mahogany desks and brass counting cages',
  'Bank manager Harold Vance transferred two million dollars to an offshore account with zero memory of ever typing the wire transfer.',
  '[{"name":"Dr. Dorian Gray","role":"Celebrity Hypnotherapist","alibi":"In his therapy parlor across the street conducting an afternoon consultation","avatar":"🌀"},{"name":"Harold Vance","role":"Bank Branch Manager","alibi":"At his executive desk inside the private bank suite","avatar":"💼"},{"name":"Linda Chen","role":"Head Wire Cashier","alibi":"At the central wire transfer console","avatar":"🖥️"},{"name":"Detective Frank Murphy","role":"Financial Crimes Investigator","alibi":"Arrived at the bank immediately following the fraud division alert","avatar":"🔍"}]'::jsonb,
  'Dr. Dorian Gray treated bank manager Harold Vance for insomnia. During clinical trance sessions, Dorian conditioned Harold to respond to the trigger phrase "Golden Hours" by entering the wire transfer authorization codes into his terminal without conscious awareness.',
  'Hypnotherapist Dr. Dorian Gray',
  'Dorian extracted Harold’s bank authorization codes during hypnotherapy sessions to steal two million dollars.',
  '[{"time":"01:50 PM","event":"Dr. Dorian Gray enters Harold’s private office for a \"brief check-in\"."},{"time":"01:55 PM","event":"Dorian swings his gold pocket watch, whispers the trigger phrase \"Golden Hours\"."},{"time":"02:00 PM","event":"Harold walks in a trance state to the terminal and types his master wire code."},{"time":"02:05 PM","event":"Two million dollars is wired to an offshore account in Grand Cayman."},{"time":"02:15 PM","event":"Harold snaps out of the trance as the terminal alarm bells chime."}]'::jsonb,
  '[{"id":"ev1","title":"Audio Recording of Trigger Phrase","detail":"Captures Dorian whispering \"Golden Hours\" right before Harold walked to the terminal."},{"id":"ev2","title":"Sandalwood Oil on Harold’s Lapel","detail":"Matches the olfactory anchor oil found in Dorian Gray’s coat pocket."},{"id":"ev3","title":"Dorian’s Clinical Conditioning Notes","detail":"Documents step-by-step programming of Harold’s banking passwords."},{"id":"ev4","title":"Offshore Receiving Account in Cayman","detail":"Proves the two million dollars was routed directly into Dorian Gray’s private trust."}]'::jsonb,
  '[{"order":1,"title":"Swinging Pocket Watch","text":"Gold watch used as an optical metronome to induce immediate trance."},{"order":2,"title":"Trigger Phrase","text":"Spoken command \"Golden Hours\" that activated Harold’s automated typing."},{"order":3,"title":"Wire Transfer Screen","text":"Terminal log showing two million dollars sent to an offshore account."},{"order":4,"title":"Sandalwood Oil","text":"Aromatic sensory anchor used to reinforce hypnotic compliance."},{"order":5,"title":"Hypnosis Case File","text":"Doctor’s notes detailing the extraction of banking credentials."},{"order":6,"title":"Security Camera Video","text":"Video showing the bank manager operating in an unblinking trance state."}]'::jsonb,
  'Linda the cashier flagged the transfer quickly.: She was doing her job vigilantly and had no ties to Dorian.; Harold had recent stock market losses.: Mild financial stress, but not motive for an offshore wire.',
  'Claim Harold faked amnesia to cover his theft or blame the head cashier Linda.',
  'NORMAL',
  'Did Harold embezzle the funds himself, or was he hypnotically conditioned by a visitor?',
  '[{"character":"Dr. Dorian Gray","secret":"He programmed Harold over four sessions to obey a post-hypnotic financial trigger."},{"character":"Harold Vance","secret":"He was terrified that he was losing his mind due to recurring blackouts."},{"character":"Linda Chen","secret":"She flagged the wire transfer to the fraud squad within three minutes."},{"character":"Detective Frank Murphy","secret":"Investigated Dorian Gray for a suspicious will alteration two years prior."}]'::jsonb,
  '[{"lead":"Linda the cashier flagged the transfer quickly.","explanation":"She was doing her job vigilantly and had no ties to Dorian."},{"lead":"Harold had recent stock market losses.","explanation":"Mild financial stress, but not motive for an offshore wire."}]'::jsonb,
  '{"wrongTheories":["Harold Vance embezzled the funds himself and faked amnesia to escape prison.","A cyber-hacking syndicate breached the bank terminal from an overseas IP address."],"correctTheory":"Dr. Dorian Gray conditioned bank manager Harold Vance through hypnotherapy to respond to the verbal trigger \"Golden Hours\" and the scent of sandalwood, forcing Harold to wire two million dollars to Dorian’s offshore account while in a trance."}'::jsonb,
  'Hypnotherapist Dr. Dorian Gray programmed Harold to wire the money via hypnosis!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Murphy seized the offshore accounts and matched the audio trigger on bank microphones. Dr. Dorian Gray was arrested and Harold was fully exonerated."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Harold was prosecuted for grand larceny and sentenced to ten years. Dr. Dorian Gray withdrew the funds in Switzerland and vanished."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The bank dismissed the hypnosis claim as absurd fiction. Harold’s career was ruined while Dorian opened an upscale clinic in London."}]'::jsonb,
  '{"intros":["Bank manager Harold Vance transferred two million dollars to an offshore account with zero memory of ever typing the wire transfer.","Case file story_035: Bank manager Harold Vance transferred two million dollars to an offshore account with zero memory of ever typing the wire transfer. Look closely at every clue.","Trouble begins in The First Continental Bank, Private Executive Vault, mahogany desks and brass counting cages. Bank manager Harold Vance transferred two million dollars to an offshore account with zero memory of ever typing the wire transfer.","The mystery starts now. Bank manager Harold Vance transferred two million dollars to an offshore account with zero memory of ever typing the wire transfer. Can you solve it?"],"reveals":["Hypnotherapist Dr. Dorian Gray programmed Harold to wire the money via hypnosis!","The mystery is unraveled! Hypnotherapist Dr. Dorian Gray programmed Harold to wire the money via hypnosis!","At last, the truth comes out: Hypnotherapist Dr. Dorian Gray programmed Harold to wire the money via hypnosis!","Case resolved! Here is what happened: Hypnotherapist Dr. Dorian Gray programmed Harold to wire the money via hypnosis!"],"hints":["Pay attention to where Hypnotherapist Dr. Dorian Gray was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_035';
DELETE FROM public.case_events WHERE case_id = 'story_035';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c9057b81-b66c-500f-a067-4ab3251bbbdf',
  'story_035',
  'Dr. Dorian Gray',
  'Celebrity Hypnotherapist',
  'Mesmerizing, calm, piercing blue eyes, speaks with rhythmic cadence',
  'Harold came to me for mild sleep anxiety. Hypnosis cannot force anyone to commit a crime.',
  'He programmed Harold over four sessions to obey a post-hypnotic financial trigger.',
  'In his therapy parlor across the street conducting an afternoon consultation',
  'Harold’s attending therapist for six weeks',
  'The phrase "Golden Hours" triggers Harold’s automated code entry protocol.',
  'Did not realize his metronomic pocket watch had a distinct audio frequency recorded on bank security audio.',
  '🌀',
  '["Harold came to me for mild sleep anxiety. Hypnosis cannot force anyone to commit a crime.","\"Harold came to me for mild sleep anxiety. Hypnosis cannot force anyone to commit a crime.\"","Listen to me: Harold came to me for mild sleep anxiety. Hypnosis cannot force anyone to commit a crime.","I tell you the truth: Harold came to me for mild sleep anxiety. Hypnosis cannot force anyone to commit a crime."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '18783d58-e353-5999-b7f5-27a885274fd1',
  'story_035',
  'Harold Vance',
  'Bank Branch Manager',
  'Dignified, nervous, sweating through his stiff collar, clutching his head',
  'I sat at my terminal at 2:00 PM. The next thing I knew, the audit alarm was ringing at 2:15 PM.',
  'He was terrified that he was losing his mind due to recurring blackouts.',
  'At his executive desk inside the private bank suite',
  'Authorized the two-million-dollar wire transfer',
  'He remembers hearing a rhythmic ticking sound and the scent of sandalwood.',
  'Did not know his subconscious mind had been conditioned to enter his password.',
  '💼',
  '["I sat at my terminal at 2:00 PM. The next thing I knew, the audit alarm was ringing at 2:15 PM.","\"I sat at my terminal at 2:00 PM. The next thing I knew, the audit alarm was ringing at 2:15 PM.\"","Listen to me: I sat at my terminal at 2:00 PM. The next thing I knew, the audit alarm was ringing at 2:15 PM.","I tell you the truth: I sat at my terminal at 2:00 PM. The next thing I knew, the audit alarm was ringing at 2:15 PM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '812f0bb7-2396-5ad1-bd28-9155e117aec7',
  'story_035',
  'Linda Chen',
  'Head Wire Cashier',
  'Sharp, suspicious, monitoring terminal transactions behind security glass',
  'Mr. Vance walked to the terminal with glassy eyes, entered his keycard, and did not blink once.',
  'She flagged the wire transfer to the fraud squad within three minutes.',
  'At the central wire transfer console',
  'Witnessed Harold’s trance-like behavior during the transfer',
  'A well-dressed gentleman in an overcoat stopped by Harold’s office at 1:55 PM.',
  'Did not hear the verbal trigger whispered in the doorway.',
  '🖥️',
  '["Mr. Vance walked to the terminal with glassy eyes, entered his keycard, and did not blink once.","\"Mr. Vance walked to the terminal with glassy eyes, entered his keycard, and did not blink once.\"","Listen to me: Mr. Vance walked to the terminal with glassy eyes, entered his keycard, and did not blink once.","I tell you the truth: Mr. Vance walked to the terminal with glassy eyes, entered his keycard, and did not blink once."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '19fba875-bfd6-57d5-9be2-f060168b2b1a',
  'story_035',
  'Detective Frank Murphy',
  'Financial Crimes Investigator',
  'Skeptical, experienced, carries psychological forensic handbooks',
  'People don’t accidentally wire two million dollars to the Cayman Islands in their sleep.',
  'Investigated Dorian Gray for a suspicious will alteration two years prior.',
  'Arrived at the bank immediately following the fraud division alert',
  'Leading the investigation into the missing two million dollars',
  'Bank audio recordings captured a 120-BPM rhythmic ticking right before the transfer.',
  'Did not immediately have the offshore receiving account details.',
  '🔍',
  '["People don’t accidentally wire two million dollars to the Cayman Islands in their sleep.","\"People don’t accidentally wire two million dollars to the Cayman Islands in their sleep.\"","Listen to me: People don’t accidentally wire two million dollars to the Cayman Islands in their sleep.","I tell you the truth: People don’t accidentally wire two million dollars to the Cayman Islands in their sleep."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7842ab24-7cd6-586f-a192-da4df4a77c00',
  'story_035',
  'ev_1',
  1,
  '01:55 PM',
  'An antique 18-carat gold pocket watch swings on a chain with a steady 120-BPM tick.',
  'An antique 18-carat gold pocket watch swings on a chain with a steady 120-BPM tick.',
  'The watch was used as a visual focus tool to induce instant hypnotic trance.',
  'Swinging Pocket Watch',
  'Gold open-face pocket watch with visible mechanical balance wheel.',
  '["Wristwatch","Metronome","Pendant"]'::jsonb,
  'Swinging Pocket Watch',
  '["swinging pocket watch","watch","pocket watch","gold watch","swinging watch"]'::jsonb,
  'A timepiece on a chain swung back and forth by hypnotists.',
  'ev_2',
  true,
  '{"descriptions":["An antique 18-carat gold pocket watch swings on a chain with a steady 120-BPM tick.","At 01:55 PM: An antique 18-carat gold pocket watch swings on a chain with a steady 120-BPM tick.","Notice this clue: An antique 18-carat gold pocket watch swings on a chain with a steady 120-BPM tick."],"hints":["A timepiece on a chain swung back and forth by hypnotists.","Clue hint: Think about swinging pocket watch.","Search for: the watch was used as a visual focus tool to induce instant hypnotic trance."],"clues":["Swinging Pocket Watch","Item: Swinging Pocket Watch","Clue Word: Swinging Pocket Watch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c9d2cedd-e210-5747-887c-d13073900bc6',
  'story_035',
  'ev_2',
  2,
  '01:56 PM',
  'The verbal trigger phrase "Golden Hours" is recorded on the bank intercom microphone.',
  'The verbal trigger phrase "Golden Hours" is recorded on the bank intercom microphone.',
  'The conditioned post-hypnotic phrase that commanded Harold to execute the wire.',
  'Trigger Phrase',
  'Audio recording from the office ceiling microphone capturing Dorian’s whisper.',
  '["Password","Alarm Code","Safe Combination"]'::jsonb,
  'Trigger Phrase',
  '["trigger phrase","phrase","golden hours","words","whisper"]'::jsonb,
  'A secret spoken command that activates a programmed action in a hypnotic trance.',
  'ev_3',
  false,
  '{"descriptions":["The verbal trigger phrase \"Golden Hours\" is recorded on the bank intercom microphone.","At 01:56 PM: The verbal trigger phrase \"Golden Hours\" is recorded on the bank intercom microphone.","Notice this clue: The verbal trigger phrase \"Golden Hours\" is recorded on the bank intercom microphone."],"hints":["A secret spoken command that activates a programmed action in a hypnotic trance.","Clue hint: Think about trigger phrase.","Search for: the conditioned post-hypnotic phrase that commanded harold to execute the wire."],"clues":["Trigger Phrase","Item: Trigger Phrase","Clue Word: Trigger Phrase"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '56132d60-c4e3-5519-89a0-2395b74c6da9',
  'story_035',
  'ev_3',
  3,
  '02:00 PM',
  'A computer terminal screen shows: "WIRE TRANSFER: $2,000,000 - APPROVED".',
  'A computer terminal screen shows: "WIRE TRANSFER: $2,000,000 - APPROVED".',
  'The money was sent directly to an account held by "D.G. Holdings".',
  'Wire Transfer Screen',
  'Digital banking terminal transaction log signed with Harold’s credentials.',
  '["ATM Screen","Receipt","Checkbook"]'::jsonb,
  'Wire Transfer Screen',
  '["wire transfer screen","transfer","wire transfer","screen","terminal","transaction"]'::jsonb,
  'A computer monitor showing the electronic movement of money between banks.',
  'ev_4',
  false,
  '{"descriptions":["A computer terminal screen shows: \"WIRE TRANSFER: $2,000,000 - APPROVED\".","At 02:00 PM: A computer terminal screen shows: \"WIRE TRANSFER: $2,000,000 - APPROVED\".","Notice this clue: A computer terminal screen shows: \"WIRE TRANSFER: $2,000,000 - APPROVED\"."],"hints":["A computer monitor showing the electronic movement of money between banks.","Clue hint: Think about wire transfer screen.","Search for: the money was sent directly to an account held by \"d.g. holdings\"."],"clues":["Wire Transfer Screen","Item: Wire Transfer Screen","Clue Word: Wire Transfer Screen"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '23d8f59c-86ed-5c99-a3fc-1949f168945c',
  'story_035',
  'ev_4',
  4,
  '02:02 PM',
  'A bottle of rare sandalwood essential oil sits in Dr. Dorian’s pocket.',
  'A bottle of rare sandalwood essential oil sits in Dr. Dorian’s pocket.',
  'Dorian paired the scent of sandalwood with the trance state to reinforce obedience.',
  'Sandalwood Oil',
  'Glass dropper bottle with concentrated Mysore sandalwood extract.',
  '["Cologne","Medicine Bottle","Ink Flask"]'::jsonb,
  'Sandalwood Oil',
  '["sandalwood oil","oil","sandalwood","essential oil"]'::jsonb,
  'A fragrant natural oil with a rich woody scent used in aromatherapy.',
  'ev_5',
  false,
  '{"descriptions":["A bottle of rare sandalwood essential oil sits in Dr. Dorian’s pocket.","At 02:02 PM: A bottle of rare sandalwood essential oil sits in Dr. Dorian’s pocket.","Notice this clue: A bottle of rare sandalwood essential oil sits in Dr. Dorian’s pocket."],"hints":["A fragrant natural oil with a rich woody scent used in aromatherapy.","Clue hint: Think about sandalwood oil.","Search for: dorian paired the scent of sandalwood with the trance state to reinforce obedience."],"clues":["Sandalwood Oil","Item: Sandalwood Oil","Clue Word: Sandalwood Oil"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c5915c85-fa11-5773-a83a-50318dc51a90',
  'story_035',
  'ev_5',
  5,
  '02:10 PM',
  'A medical hypnotherapy case file marked "Harold Vance - Conditioning" is seized.',
  'A medical hypnotherapy case file marked "Harold Vance - Conditioning" is seized.',
  'Dorian recorded detailed notes on how he mapped Harold’s banking passwords.',
  'Hypnosis Case File',
  'Confidential clinical notes documenting four weeks of hypnotic programming.',
  '["Bank Ledger","Phone Directory","Diary"]'::jsonb,
  'Hypnosis Case File',
  '["hypnosis case file","file","case file","hypnosis file","notes","medical file"]'::jsonb,
  'A folder of documents containing a doctor’s private notes about a patient.',
  'ev_6',
  true,
  '{"descriptions":["A medical hypnotherapy case file marked \"Harold Vance - Conditioning\" is seized.","At 02:10 PM: A medical hypnotherapy case file marked \"Harold Vance - Conditioning\" is seized.","Notice this clue: A medical hypnotherapy case file marked \"Harold Vance - Conditioning\" is seized."],"hints":["A folder of documents containing a doctor’s private notes about a patient.","Clue hint: Think about hypnosis case file.","Search for: dorian recorded detailed notes on how he mapped harold’s banking passwords."],"clues":["Hypnosis Case File","Item: Hypnosis Case File","Clue Word: Hypnosis Case File"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '453a6cca-5eee-5c4d-b2c8-90fd1b978ae5',
  'story_035',
  'ev_6',
  6,
  '02:30 PM',
  'Bank security cameras show Harold walking with unblinking eyes and fixed posture.',
  'Bank security cameras show Harold walking with unblinking eyes and fixed posture.',
  'Harold displayed all clinical indicators of deep somnambulic hypnosis.',
  'Security Camera Video',
  'High-definition digital video showing Harold’s glassy stare and automatic gait.',
  '["Photograph","Audio Tape","Witness Sketch"]'::jsonb,
  'Security Camera Video',
  '["security camera video","video","camera video","security video","footage"]'::jsonb,
  'Moving visual images recorded by overhead surveillance cameras.',
  'ev_7',
  false,
  '{"descriptions":["Bank security cameras show Harold walking with unblinking eyes and fixed posture.","At 02:30 PM: Bank security cameras show Harold walking with unblinking eyes and fixed posture.","Notice this clue: Bank security cameras show Harold walking with unblinking eyes and fixed posture."],"hints":["Moving visual images recorded by overhead surveillance cameras.","Clue hint: Think about security camera video.","Search for: harold displayed all clinical indicators of deep somnambulic hypnosis."],"clues":["Security Camera Video","Item: Security Camera Video","Clue Word: Security Camera Video"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3131e5a3-3c82-5df7-b964-6d3ea90fd62a',
  'story_035',
  'ev_7',
  7,
  '02:45 PM',
  'An offshore Cayman Islands account registration under "Dorian Gray" is uncovered.',
  'An offshore Cayman Islands account registration under "Dorian Gray" is uncovered.',
  'The destination account for the two-million-dollar wire belonged to the therapist.',
  'Offshore Account Slip',
  'Banking document confirming routing to First Caribbean Trust in Grand Cayman.',
  '["Stock Certificate","Tax Form","Check"]'::jsonb,
  'Offshore Account Slip',
  '["offshore account slip","account slip","offshore slip","banking slip","receipt"]'::jsonb,
  'A paper slip confirming a bank account opened in a foreign island tax haven.',
  'ev_8',
  false,
  '{"descriptions":["An offshore Cayman Islands account registration under \"Dorian Gray\" is uncovered.","At 02:45 PM: An offshore Cayman Islands account registration under \"Dorian Gray\" is uncovered.","Notice this clue: An offshore Cayman Islands account registration under \"Dorian Gray\" is uncovered."],"hints":["A paper slip confirming a bank account opened in a foreign island tax haven.","Clue hint: Think about offshore account slip.","Search for: the destination account for the two-million-dollar wire belonged to the therapist."],"clues":["Offshore Account Slip","Item: Offshore Account Slip","Clue Word: Offshore Account Slip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a3af1bc4-c434-5f66-8773-d6085849500d',
  'story_035',
  'ev_8',
  8,
  '03:15 PM',
  'A clinical EEG brainwave printout demonstrates Harold’s susceptibility to hypnosis.',
  'A clinical EEG brainwave printout demonstrates Harold’s susceptibility to hypnosis.',
  'Medical proof that Harold has high suggestibility and dissociative amnesia.',
  'EEG Brainwave Chart',
  'Electroencephalogram recording showing dominant alpha waves under suggestion.',
  '["ECG Chart","Blood Test","X-Ray"]'::jsonb,
  'EEG Brainwave Chart',
  '["eeg brainwave chart","eeg","brainwave chart","chart","eeg chart"]'::jsonb,
  'A paper printout with wavy lines measuring electrical activity in the brain.',
  NULL,
  true,
  '{"descriptions":["A clinical EEG brainwave printout demonstrates Harold’s susceptibility to hypnosis.","At 03:15 PM: A clinical EEG brainwave printout demonstrates Harold’s susceptibility to hypnosis.","Notice this clue: A clinical EEG brainwave printout demonstrates Harold’s susceptibility to hypnosis."],"hints":["A paper printout with wavy lines measuring electrical activity in the brain.","Clue hint: Think about eeg brainwave chart.","Search for: medical proof that harold has high suggestibility and dissociative amnesia."],"clues":["EEG Brainwave Chart","Item: EEG Brainwave Chart","Clue Word: EEG Brainwave Chart"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_036 — THE SHADOW ON THE WALL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_036',
  'The Shadow on the Wall',
  'Psychological',
  'The Highcrest Manor Drawing Room, high ceilings, oak wainscoting, and a roaring marble fireplace',
  'When Lord Arthur stepped away from the fireplace, his dark silhouette remained permanently imprinted on the wallpaper.',
  '[{"name":"Philip Vance","role":"Eccentric Chemist & Nephew","alibi":"In the drawing room having after-dinner drinks with guests","avatar":"🧪"},{"name":"Lord Arthur Sterling","role":"Late Aristocrat","alibi":"Sitting in his leather wingback chair by the fireplace","avatar":"🎩"},{"name":"James Higgins","role":"Head Butler","alibi":"Serving drinks in the drawing room doorway","avatar":"🤵"},{"name":"Detective Marcus Cross","role":"Forensic Chemistry Specialist","alibi":"Arrived at the manor at 2:00 AM after the household reported the disappearance","avatar":"🔍"}]'::jsonb,
  'Chemist Philip Vance poisoned Lord Arthur’s brandy with cyanide. To create the illusion that Arthur had dematerialized into a ghost, Philip treated the wall behind Arthur with photosensitive silver nitrate chemicals and triggered a magnesium flashbulb, burning Arthur’s silhouette into the wall before carrying his body out.',
  'Chemist Philip Vance',
  'Philip murdered Lord Arthur with poison and used a photographic flash trick to simulate a ghost vanishing.',
  '[{"time":"08:00 PM","event":"Philip brushes photosensitive silver nitrate onto the wallpaper behind the chair."},{"time":"11:00 PM","event":"Arthur drinks cyanide-laced brandy and collapses lifeless in his chair."},{"time":"11:30 PM","event":"Philip triggers a concealed magnesium flashbulb in the chandelier."},{"time":"11:31 PM","event":"A blinding white flash exposes the wall; Arthur’s silhouette is permanently fixed."},{"time":"12:30 AM","event":"Philip wheels Arthur’s body out wrapped in a Persian rug to the crypt."}]'::jsonb,
  '[{"id":"ev1","title":"Silver Nitrate Wallpaper Emulsion","detail":"Photographic chemistry residue proving the shadow was an optical exposure."},{"id":"ev2","title":"Burnt Magnesium Flashbulb Filament","detail":"Found in the ceiling chandelier; triggered the blinding flash of light."},{"id":"ev3","title":"Cyanide in Arthur’s Brandy Snifter","detail":"Confirms murder by poison prior to the staged disappearance."},{"id":"ev4","title":"Crypt Key in Philip’s Pocket","detail":"Leads directly to Arthur’s body hidden inside the rolled Persian rug."}]'::jsonb,
  '[{"order":1,"title":"Wallpaper Shadow","text":"Permanent silhouette created by exposing chemical emulsion to intense light."},{"order":2,"title":"Magnesium Flashbulb","text":"Photographic bulb used to blind witnesses and burn the shadow onto the wall."},{"order":3,"title":"Cyanide Snifter","text":"Brandy glass containing bitter almond poison that killed Lord Arthur."},{"order":4,"title":"Silver Nitrate Bottle","text":"Chemical solution used to prepare the wall for photographic exposure."},{"order":5,"title":"Missing Persian Rug","text":"Carpet used to wrap and transport the victim’s body out of the room."},{"order":6,"title":"Crypt Key","text":"Iron key leading to the hidden burial vault where Arthur’s body was stashed."}]'::jsonb,
  'Butler James was shaking and holding a silver cross.: He was deeply terrified by what he thought was a demonic vanishing.; The fireplace was roaring with green flame.: Caused by copper shavings thrown in earlier for decorative coloring.',
  'Claim a supernatural vortex vaporized Lord Arthur or blame the butler James.',
  'NORMAL',
  'What caused a human shadow to be burned into the wallpaper, and what happened to Lord Arthur?',
  '[{"character":"Philip Vance","secret":"He murdered Arthur to inherit the historic manor and ancestral lands."},{"character":"Lord Arthur Sterling","secret":"He was planning to cut Philip out of his will tomorrow morning."},{"character":"James Higgins","secret":"He saw Philip carrying a heavy carpet roll out to the gardens at 1:00 AM."},{"character":"Detective Marcus Cross","secret":"Amateur photography enthusiast who develops his own glass plates."}]'::jsonb,
  '[{"lead":"Butler James was shaking and holding a silver cross.","explanation":"He was deeply terrified by what he thought was a demonic vanishing."},{"lead":"The fireplace was roaring with green flame.","explanation":"Caused by copper shavings thrown in earlier for decorative coloring."}]'::jsonb,
  '{"wrongTheories":["Lord Arthur was vaporized into pure energy by a supernatural dimensional vortex.","Butler James used a secret trapdoor beneath the chair to drop Arthur into the basement."],"correctTheory":"Philip Vance poisoned Lord Arthur’s brandy with cyanide, painted the wall with silver nitrate, triggered a magnesium flashbulb to burn Arthur’s shadow into the wallpaper, and hid Arthur’s body in the crypt to inherit the family estate."}'::jsonb,
  'Philip Vance poisoned Arthur and burned his shadow with silver nitrate and flash!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Cross followed the crypt key to recover Arthur’s body and exposed the silver stains on Philip’s hands. Philip Vance was arrested and sentenced to life imprisonment."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The coroner ruled the death a supernatural phenomenon. Philip inherited the manor and sold the property to an occult research society."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Shadow of Highcrest\" became an international ghost tourism sensation. Philip charged admission fees while keeping the murder secret."}]'::jsonb,
  '{"intros":["When Lord Arthur stepped away from the fireplace, his dark silhouette remained permanently imprinted on the wallpaper.","Case file story_036: When Lord Arthur stepped away from the fireplace, his dark silhouette remained permanently imprinted on the wallpaper. Look closely at every clue.","Trouble begins in The Highcrest Manor Drawing Room, high ceilings, oak wainscoting, and a roaring marble fireplace. When Lord Arthur stepped away from the fireplace, his dark silhouette remained permanently imprinted on the wallpaper.","The mystery starts now. When Lord Arthur stepped away from the fireplace, his dark silhouette remained permanently imprinted on the wallpaper. Can you solve it?"],"reveals":["Philip Vance poisoned Arthur and burned his shadow with silver nitrate and flash!","The mystery is unraveled! Philip Vance poisoned Arthur and burned his shadow with silver nitrate and flash!","At last, the truth comes out: Philip Vance poisoned Arthur and burned his shadow with silver nitrate and flash!","Case resolved! Here is what happened: Philip Vance poisoned Arthur and burned his shadow with silver nitrate and flash!"],"hints":["Pay attention to where Chemist Philip Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_036';
DELETE FROM public.case_events WHERE case_id = 'story_036';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ce699eb7-ff9b-5123-a378-2772b11db40f',
  'story_036',
  'Philip Vance',
  'Eccentric Chemist & Nephew',
  'Nervous, brilliant, ink-stained fingers, adjusting gold spectacles',
  'Uncle Arthur vanished into thin air before our eyes. The occult forces in this house are real.',
  'He murdered Arthur to inherit the historic manor and ancestral lands.',
  'In the drawing room having after-dinner drinks with guests',
  'Arthur’s nephew and next of kin',
  'Silver nitrate exposed to intense light darkens instantly, leaving a shadow where an object stood.',
  'Left burnt magnesium ribbon ash inside the fireplace grate.',
  '🧪',
  '["Uncle Arthur vanished into thin air before our eyes. The occult forces in this house are real.","\"Uncle Arthur vanished into thin air before our eyes. The occult forces in this house are real.\"","Listen to me: Uncle Arthur vanished into thin air before our eyes. The occult forces in this house are real.","I tell you the truth: Uncle Arthur vanished into thin air before our eyes. The occult forces in this house are real."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '21ebec8f-eb6a-58b6-9f5f-dc6353cc17ad',
  'story_036',
  'Lord Arthur Sterling',
  'Late Aristocrat',
  'Proud, domineering, traditional landowner',
  'Victim deceased; body was removed and hidden in the family crypt.',
  'He was planning to cut Philip out of his will tomorrow morning.',
  'Sitting in his leather wingback chair by the fireplace',
  'Victim of the murder and optical trickery',
  'His brandy had a strange bitter almond chemical aroma.',
  'Did not know the wall behind his chair had been treated with photo chemicals.',
  '🎩',
  '["Victim deceased; body was removed and hidden in the family crypt.","\"Victim deceased; body was removed and hidden in the family crypt.\"","Listen to me: Victim deceased; body was removed and hidden in the family crypt.","I tell you the truth: Victim deceased; body was removed and hidden in the family crypt."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0fbae04a-d95a-556e-be86-63fd922d9a08',
  'story_036',
  'James Higgins',
  'Head Butler',
  'Stately, terrified, holding an empty silver drink tray with shaking hands',
  'There was a blinding white flash of light, and when my vision cleared, his lordship was gone, but his shadow was on the wall.',
  'He saw Philip carrying a heavy carpet roll out to the gardens at 1:00 AM.',
  'Serving drinks in the drawing room doorway',
  'Butler who witnessed the blinding flash of light',
  'Smelled burning magnesium and bitter almonds in the air.',
  'Did not understand the photographic chemistry behind the illusion.',
  '🤵',
  '["There was a blinding white flash of light, and when my vision cleared, his lordship was gone, but his shadow was on the wall.","\"There was a blinding white flash of light, and when my vision cleared, his lordship was gone, but his shadow was on the wall.\"","Listen to me: There was a blinding white flash of light, and when my vision cleared, his lordship was gone, but his shadow was on the wall.","I tell you the truth: There was a blinding white flash of light, and when my vision cleared, his lordship was gone, but his shadow was on the wall."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'cc00891e-2da4-59fc-bc33-074727dc2dc6',
  'story_036',
  'Detective Marcus Cross',
  'Forensic Chemistry Specialist',
  'Sharp, skeptical, carries ultraviolet lamps and chemical swab kits',
  'Human beings do not vaporize into shadows. What we have here is early photographic chemistry.',
  'Amateur photography enthusiast who develops his own glass plates.',
  'Arrived at the manor at 2:00 AM after the household reported the disappearance',
  'Leading the homicide and optical fraud investigation',
  'Silver nitrate wallpaper darkens under UV light when exposed to intense flash.',
  'Did not know Arthur’s body was stashed in the underground family crypt.',
  '🔍',
  '["Human beings do not vaporize into shadows. What we have here is early photographic chemistry.","\"Human beings do not vaporize into shadows. What we have here is early photographic chemistry.\"","Listen to me: Human beings do not vaporize into shadows. What we have here is early photographic chemistry.","I tell you the truth: Human beings do not vaporize into shadows. What we have here is early photographic chemistry."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3a5003cb-2ce7-5710-acdf-700b372ccac9',
  'story_036',
  'ev_1',
  1,
  '11:31 PM',
  'A dark, permanent human silhouette is burned into the floral wallpaper behind the chair.',
  'A dark, permanent human silhouette is burned into the floral wallpaper behind the chair.',
  'The wall was treated with photographic chemicals that darkened when exposed to light.',
  'Wallpaper Shadow',
  'Silver nitrate chemical emulsion on Victorian wallpaper showing human outline.',
  '["Painted Mural","Soot Mark","Burnt Cloth"]'::jsonb,
  'Wallpaper Shadow',
  '["wallpaper shadow","shadow","silhouette","outline"]'::jsonb,
  'A dark outline of a person fixed permanently onto a wall like a photograph.',
  'ev_2',
  true,
  '{"descriptions":["A dark, permanent human silhouette is burned into the floral wallpaper behind the chair.","At 11:31 PM: A dark, permanent human silhouette is burned into the floral wallpaper behind the chair.","Notice this clue: A dark, permanent human silhouette is burned into the floral wallpaper behind the chair."],"hints":["A dark outline of a person fixed permanently onto a wall like a photograph.","Clue hint: Think about wallpaper shadow.","Search for: the wall was treated with photographic chemicals that darkened when exposed to light."],"clues":["Wallpaper Shadow","Item: Wallpaper Shadow","Clue Word: Wallpaper Shadow"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bd6ee315-ce1b-54cb-ac9d-7c429bcb327f',
  'story_036',
  'ev_2',
  2,
  '11:32 PM',
  'A shattered glass flashbulb containing burnt magnesium wire lies in the chandelier.',
  'A shattered glass flashbulb containing burnt magnesium wire lies in the chandelier.',
  'The blinding flash of light was created by an industrial photographic bulb.',
  'Magnesium Flashbulb',
  'Blown glass bulb with white magnesium oxide powder on the filament.',
  '["Candle Stub","Light Bulb","Torch"]'::jsonb,
  'Magnesium Flashbulb',
  '["magnesium flashbulb","flashbulb","flash","bulb"]'::jsonb,
  'A glass bulb filled with metal wire that creates an intense white flash of light.',
  'ev_3',
  false,
  '{"descriptions":["A shattered glass flashbulb containing burnt magnesium wire lies in the chandelier.","At 11:32 PM: A shattered glass flashbulb containing burnt magnesium wire lies in the chandelier.","Notice this clue: A shattered glass flashbulb containing burnt magnesium wire lies in the chandelier."],"hints":["A glass bulb filled with metal wire that creates an intense white flash of light.","Clue hint: Think about magnesium flashbulb.","Search for: the blinding flash of light was created by an industrial photographic bulb."],"clues":["Magnesium Flashbulb","Item: Magnesium Flashbulb","Clue Word: Magnesium Flashbulb"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5b520d07-e8a0-56cc-bdaa-6101d325e730',
  'story_036',
  'ev_3',
  3,
  '11:35 PM',
  'A crystal brandy snifter on the side table smells strongly of bitter almonds.',
  'A crystal brandy snifter on the side table smells strongly of bitter almonds.',
  'Lord Arthur was poisoned with cyanide before the flash trick was executed.',
  'Cyanide Snifter',
  'Crystal drinking glass with dried drops of potassium cyanide and French brandy.',
  '["Wine Glass","Coffee Cup","Water Goblet"]'::jsonb,
  'Cyanide Snifter',
  '["cyanide snifter","snifter","glass","brandy glass"]'::jsonb,
  'A round stemmed glass used for drinking brandy.',
  'ev_4',
  false,
  '{"descriptions":["A crystal brandy snifter on the side table smells strongly of bitter almonds.","At 11:35 PM: A crystal brandy snifter on the side table smells strongly of bitter almonds.","Notice this clue: A crystal brandy snifter on the side table smells strongly of bitter almonds."],"hints":["A round stemmed glass used for drinking brandy.","Clue hint: Think about cyanide snifter.","Search for: lord arthur was poisoned with cyanide before the flash trick was executed."],"clues":["Cyanide Snifter","Item: Cyanide Snifter","Clue Word: Cyanide Snifter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'aae2c766-5fc8-50f7-b5b4-94cb1969a82f',
  'story_036',
  'ev_4',
  4,
  '11:45 PM',
  'A bottle of silver nitrate liquid with an application brush is found in Philip’s lab.',
  'A bottle of silver nitrate liquid with an application brush is found in Philip’s lab.',
  'Philip painted the chemical solution directly onto the wall before dinner.',
  'Silver Nitrate Bottle',
  'Amber glass chemical reagent bottle labeled "AgNO3 - Silver Nitrate".',
  '["Varnish Can","Paint Thinner","Glue Bottle"]'::jsonb,
  'Silver Nitrate Bottle',
  '["silver nitrate bottle","silver nitrate","bottle","chemical bottle","nitrate"]'::jsonb,
  'A chemical liquid used in traditional photography that turns black when hit by light.',
  'ev_5',
  false,
  '{"descriptions":["A bottle of silver nitrate liquid with an application brush is found in Philip’s lab.","At 11:45 PM: A bottle of silver nitrate liquid with an application brush is found in Philip’s lab.","Notice this clue: A bottle of silver nitrate liquid with an application brush is found in Philip’s lab."],"hints":["A chemical liquid used in traditional photography that turns black when hit by light.","Clue hint: Think about silver nitrate bottle.","Search for: philip painted the chemical solution directly onto the wall before dinner."],"clues":["Silver Nitrate Bottle","Item: Silver Nitrate Bottle","Clue Word: Silver Nitrate Bottle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '60790d77-d4ca-5fbc-a7ab-5f7f23ba5da3',
  'story_036',
  'ev_5',
  5,
  '12:00 AM',
  'A Persian floor rug is missing from the center of the drawing room.',
  'A Persian floor rug is missing from the center of the drawing room.',
  'The rug was used to roll up Arthur’s poisoned body and carry him outside.',
  'Missing Persian Rug',
  'Clean rectangular depression on the floorboards where the rug lay.',
  '["Missing Chair","Missing Painting","Missing Clock"]'::jsonb,
  'Missing Persian Rug',
  '["missing persian rug","rug","persian rug","carpet","missing rug"]'::jsonb,
  'A heavy woven decorative floor covering made of wool or silk.',
  'ev_6',
  true,
  '{"descriptions":["A Persian floor rug is missing from the center of the drawing room.","At 12:00 AM: A Persian floor rug is missing from the center of the drawing room.","Notice this clue: A Persian floor rug is missing from the center of the drawing room."],"hints":["A heavy woven decorative floor covering made of wool or silk.","Clue hint: Think about missing persian rug.","Search for: the rug was used to roll up arthur’s poisoned body and carry him outside."],"clues":["Missing Persian Rug","Item: Missing Persian Rug","Clue Word: Missing Persian Rug"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c896147e-df0e-5b49-ab3a-7888acb26918',
  'story_036',
  'ev_6',
  6,
  '12:40 AM',
  'A heavy iron crypt key with fresh subterranean mold is in Philip’s pocket.',
  'A heavy iron crypt key with fresh subterranean mold is in Philip’s pocket.',
  'Arthur’s body was placed inside the ancestral stone crypt in the cemetery.',
  'Crypt Key',
  'Large rusted iron skeleton key marked "FAMILY CRYPT - 1888".',
  '["Front Door Key","Safe Key","Car Key"]'::jsonb,
  'Crypt Key',
  '["crypt key","key","iron key","skeleton key"]'::jsonb,
  'A heavy old metal key used to unlock underground burial vaults.',
  'ev_7',
  false,
  '{"descriptions":["A heavy iron crypt key with fresh subterranean mold is in Philip’s pocket.","At 12:40 AM: A heavy iron crypt key with fresh subterranean mold is in Philip’s pocket.","Notice this clue: A heavy iron crypt key with fresh subterranean mold is in Philip’s pocket."],"hints":["A heavy old metal key used to unlock underground burial vaults.","Clue hint: Think about crypt key.","Search for: arthur’s body was placed inside the ancestral stone crypt in the cemetery."],"clues":["Crypt Key","Item: Crypt Key","Clue Word: Crypt Key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '84f62343-355e-53b0-8f08-bb6752baea10',
  'story_036',
  'ev_7',
  7,
  '01:15 AM',
  'A will revision document cutting Philip out of the family estate is in the desk.',
  'A will revision document cutting Philip out of the family estate is in the desk.',
  'Arthur was meeting his lawyer tomorrow to disinherit Philip completely.',
  'Will Revision',
  'Legal draft transferring the estate to the Royal Botanical Society.',
  '["Bank Statement","Diary","Letter"]'::jsonb,
  'Will Revision',
  '["will revision","will","document","draft"]'::jsonb,
  'A written legal paper altering who gets an inheritance after death.',
  'ev_8',
  false,
  '{"descriptions":["A will revision document cutting Philip out of the family estate is in the desk.","At 01:15 AM: A will revision document cutting Philip out of the family estate is in the desk.","Notice this clue: A will revision document cutting Philip out of the family estate is in the desk."],"hints":["A written legal paper altering who gets an inheritance after death.","Clue hint: Think about will revision.","Search for: arthur was meeting his lawyer tomorrow to disinherit philip completely."],"clues":["Will Revision","Item: Will Revision","Clue Word: Will Revision"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '287d4e58-912c-52bf-be44-7804f6e8079a',
  'story_036',
  'ev_8',
  8,
  '01:45 AM',
  'Silver chemical stain marks are visible on the tips of Philip’s fingers.',
  'Silver chemical stain marks are visible on the tips of Philip’s fingers.',
  'Silver nitrate leaves indelible black stains on human skin upon contact.',
  'Chemical Finger Stains',
  'Black-brown silver oxide stains on Philip’s thumb and index finger.',
  '["Ink Stains","Burn Marks","Blood Drops"]'::jsonb,
  'Chemical Finger Stains',
  '["chemical finger stains","stains","finger stains","chemical stains","silver stains"]'::jsonb,
  'Dark stubborn marks left on skin by photographic or laboratory chemicals.',
  NULL,
  true,
  '{"descriptions":["Silver chemical stain marks are visible on the tips of Philip’s fingers.","At 01:45 AM: Silver chemical stain marks are visible on the tips of Philip’s fingers.","Notice this clue: Silver chemical stain marks are visible on the tips of Philip’s fingers."],"hints":["Dark stubborn marks left on skin by photographic or laboratory chemicals.","Clue hint: Think about chemical finger stains.","Search for: silver nitrate leaves indelible black stains on human skin upon contact."],"clues":["Chemical Finger Stains","Item: Chemical Finger Stains","Clue Word: Chemical Finger Stains"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_037 — THE BOMB ON THE HIGH-SPEED RAIL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_037',
  'The Bomb on the High-Speed Rail',
  'Thriller',
  'The Apex Bullet Train, Carriage 3, hurtling at 200 mph toward the capital',
  'A digital pressure-sensitive bomb was discovered armed beneath passenger seat 12B.',
  '[{"name":"Frank Vance","role":"On-Board Security Marshal","alibi":"Patrolling Carriage 3","avatar":"👮"},{"name":"David Cole","role":"Passenger in Seat 12B","alibi":"Trapped on seat 12B","avatar":"💺"},{"name":"Elena Rostova","role":"Off-Duty Bomb Technician","alibi":"In Carriage 2 drinking black coffee","avatar":"🔧"},{"name":"Conductor Marcus Bell","role":"Train Conductor","alibi":"In the driver cabin coordinating with dispatch","avatar":"🚆"}]'::jsonb,
  'Air Marshal Frank Vance planted a C-4 explosive device with a pressure trigger beneath seat 12B. If the passenger stands up or if the train drops below 80 mph, the circuit closes. Frank intended to parachute out before the bridge crossing.',
  'Security Marshal Frank Vance',
  'Frank was paid two million dollars by an arms syndicate to stage a terror incident and short railway stocks.',
  '[{"time":"02:00 PM","event":"Frank Vance plants the explosive under Seat 12B during boarding."},{"time":"02:30 PM","event":"David Cole sits down, arming the mechanical pressure switch with an audible click."},{"time":"03:05 PM","event":"The digital countdown timer activates: 15:00 minutes remaining."},{"time":"03:10 PM","event":"Elena inspects the device and begins surgical defusal with a pocket mirror."},{"time":"03:18 PM","event":"Frank attempts to slip to the rear vestibule to jump with a parachute."}]'::jsonb,
  '[{"id":"ev1","title":"Pressure-Plate Trigger Circuit","detail":"Shows the bomb was designed to detonate if seat 12B became vacant."},{"id":"ev2","title":"Remote Detonator in Frank’s Pocket","detail":"Transmitter paired directly to the C-4 receiver on 144.250 MHz."},{"id":"ev3","title":"Parachute Rig Stamped VANCE","detail":"Found in the linen locker, proving Frank planned a solo mid-transit escape."},{"id":"ev4","title":"Railway Stock Short Position","detail":"Financial documentation proving Frank stood to profit two million dollars."}]'::jsonb,
  '[{"order":1,"title":"Digital Timer","text":"Red LED display counting down the seconds to total detonation."},{"order":2,"title":"C-4 Explosive","text":"Military-grade plastic explosive block strapped under the passenger seat."},{"order":3,"title":"Pressure Plate","text":"Deadly leaf switch kept open only by the passenger’s continuous weight."},{"order":4,"title":"Emergency Parachute","text":"Skydiving rig prepared by the marshal to leap from the train."},{"order":5,"title":"Remote Detonator","text":"Handheld radio box capable of triggering the explosive from a distance."},{"order":6,"title":"Short Stock Slip","text":"Financial proof of a multi-million-dollar bet on a rail catastrophe."}]'::jsonb,
  'Passenger David carried a whistleblower flash drive.: The documents were leaked corporate emails, unrelated to the bomb.; The train speed fluctuated on curves.: Automated speed regulation by the locomotive computer.',
  'Blame passenger Leo or claim an outside drone dropped the explosive onto the roof.',
  'NORMAL',
  'Who placed the explosive device under seat 12B and how can the train be safely stopped?',
  '[{"character":"Frank Vance","secret":"He has an emergency parachute pack stashed in the luggage compartment."},{"character":"David Cole","secret":"He was carrying a flash drive containing military whistleblower documents."},{"character":"Elena Rostova","secret":"She was traveling under a private vacation booking without official tools."},{"character":"Conductor Marcus Bell","secret":"He ignored a security maintenance warning at the terminal to stay on schedule."}]'::jsonb,
  '[{"lead":"Passenger David carried a whistleblower flash drive.","explanation":"The documents were leaked corporate emails, unrelated to the bomb."},{"lead":"The train speed fluctuated on curves.","explanation":"Automated speed regulation by the locomotive computer."}]'::jsonb,
  '{"wrongTheories":["An aerial combat drone dropped the explosive onto the train roof.","Passenger David Cole built the bomb himself to commit suicide."],"correctTheory":"Air Marshal Frank Vance planted a C-4 pressure-plate explosive under Seat 12B to stage a deadly rail disaster and profit from two million dollars in shorted stock options, intending to parachute out before the river bridge."}'::jsonb,
  'Air Marshal Frank Vance planted the bomb for a two-million-dollar stock profit!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Elena defused the pressure circuit with seconds to spare while passengers subdued Frank Vance. Frank was arrested for domestic terrorism and grand treason."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Frank leaped from the rear door with his parachute. The train crossed the bridge, but the bomb exploded, killing twenty passengers."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The bomb was written off as a foreign insurgent attack. Frank collected his stock payout and retired in South America."}]'::jsonb,
  '{"intros":["A digital pressure-sensitive bomb was discovered armed beneath passenger seat 12B.","Case file story_037: A digital pressure-sensitive bomb was discovered armed beneath passenger seat 12B. Look closely at every clue.","Trouble begins in The Apex Bullet Train, Carriage 3, hurtling at 200 mph toward the capital. A digital pressure-sensitive bomb was discovered armed beneath passenger seat 12B.","The mystery starts now. A digital pressure-sensitive bomb was discovered armed beneath passenger seat 12B. Can you solve it?"],"reveals":["Air Marshal Frank Vance planted the bomb for a two-million-dollar stock profit!","The mystery is unraveled! Air Marshal Frank Vance planted the bomb for a two-million-dollar stock profit!","At last, the truth comes out: Air Marshal Frank Vance planted the bomb for a two-million-dollar stock profit!","Case resolved! Here is what happened: Air Marshal Frank Vance planted the bomb for a two-million-dollar stock profit!"],"hints":["Pay attention to where Security Marshal Frank Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_037';
DELETE FROM public.case_events WHERE case_id = 'story_037';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4ae879e1-e2a2-596c-80ec-7ea7f67bc1d2',
  'story_037',
  'Frank Vance',
  'On-Board Security Marshal',
  'Stern, authoritarian, tactical vest, checking emergency exit latches',
  'Everyone remain seated! The device is armed and wired to the train’s speedometer.',
  'He has an emergency parachute pack stashed in the luggage compartment.',
  'Patrolling Carriage 3',
  'Armed officer with security clearance for the entire train',
  'The bomb has a secondary remote radio trigger tuned to 144 MHz.',
  'Did not know an off-duty bomb technician was seated in Carriage 2.',
  '👮',
  '["Everyone remain seated! The device is armed and wired to the train’s speedometer.","\"Everyone remain seated! The device is armed and wired to the train’s speedometer.\"","Listen to me: Everyone remain seated! The device is armed and wired to the train’s speedometer.","I tell you the truth: Everyone remain seated! The device is armed and wired to the train’s speedometer."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '37f066c5-2984-5700-92c8-5088ea375164',
  'story_037',
  'David Cole',
  'Passenger in Seat 12B',
  'Terrified, frozen in place, sweating, afraid to shift his weight',
  'I felt a click under my cushion twenty minutes ago. If I stand up, it blows!',
  'He was carrying a flash drive containing military whistleblower documents.',
  'Trapped on seat 12B',
  'Direct hostage sitting atop the pressure plate',
  'He saw the security marshal kneeling near his seat before departure.',
  'Did not know the marshal had a remote detonator in his holster.',
  '💺',
  '["I felt a click under my cushion twenty minutes ago. If I stand up, it blows!","\"I felt a click under my cushion twenty minutes ago. If I stand up, it blows!\"","Listen to me: I felt a click under my cushion twenty minutes ago. If I stand up, it blows!","I tell you the truth: I felt a click under my cushion twenty minutes ago. If I stand up, it blows!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '72c7f20b-9c50-5118-a878-6a20fb93b1fc',
  'story_037',
  'Elena Rostova',
  'Off-Duty Bomb Technician',
  'Calm, ice-cold under pressure, carrying wire cutters and a pocket mirror',
  'Keep your weight steady, David. The circuit uses twin copper leaf contacts.',
  'She was traveling under a private vacation booking without official tools.',
  'In Carriage 2 drinking black coffee',
  'Expert dismantling the explosive mechanism',
  'The wire leading to the red timer is a decoy booby-trap.',
  'Did not know the marshal was the one who armed the weapon.',
  '🔧',
  '["Keep your weight steady, David. The circuit uses twin copper leaf contacts.","\"Keep your weight steady, David. The circuit uses twin copper leaf contacts.\"","Listen to me: Keep your weight steady, David. The circuit uses twin copper leaf contacts.","I tell you the truth: Keep your weight steady, David. The circuit uses twin copper leaf contacts."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7a51de09-e935-5e14-9d05-771929476ed0',
  'story_037',
  'Conductor Marcus Bell',
  'Train Conductor',
  'Frantic, talking to dispatch on his radio handset',
  'Dispatch cannot halt the train! The brake line is linked to the bomb sensor.',
  'He ignored a security maintenance warning at the terminal to stay on schedule.',
  'In the driver cabin coordinating with dispatch',
  'Controls the train speed and track switches',
  'The train will reach the river suspension bridge in twelve minutes.',
  'Did not know Frank had tampered with the emergency brake valve.',
  '🚆',
  '["Dispatch cannot halt the train! The brake line is linked to the bomb sensor.","\"Dispatch cannot halt the train! The brake line is linked to the bomb sensor.\"","Listen to me: Dispatch cannot halt the train! The brake line is linked to the bomb sensor.","I tell you the truth: Dispatch cannot halt the train! The brake line is linked to the bomb sensor."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '601e7ae0-a016-5ead-abbd-b7d089ad4d5d',
  'story_037',
  'ev_1',
  1,
  '03:05 PM',
  'A digital red LED display counts down: "14:59... 14:58... 14:57..."',
  'A digital red LED display counts down: "14:59... 14:58... 14:57..."',
  'The bomb is armed with both a timed countdown and a pressure plate.',
  'Digital Timer',
  'Red 7-segment LED display connected to a military circuit board.',
  '["Wristwatch","Speedometer","Alarm Clock"]'::jsonb,
  'Digital Timer',
  '["digital timer","timer","clock","countdown timer"]'::jsonb,
  'A glowing red electronic screen showing minutes and seconds ticking down.',
  'ev_2',
  true,
  '{"descriptions":["A digital red LED display counts down: \"14:59... 14:58... 14:57...\"","At 03:05 PM: A digital red LED display counts down: \"14:59... 14:58... 14:57...\"","Notice this clue: A digital red LED display counts down: \"14:59... 14:58... 14:57...\""],"hints":["A glowing red electronic screen showing minutes and seconds ticking down.","Clue hint: Think about digital timer.","Search for: the bomb is armed with both a timed countdown and a pressure plate."],"clues":["Digital Timer","Item: Digital Timer","Clue Word: Digital Timer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '08a6f873-e807-5947-98b3-918d6af5ec3c',
  'story_037',
  'ev_2',
  2,
  '03:08 PM',
  'A military C-4 plastic explosive block wrapped in olive drab plastic is strapped to the frame.',
  'A military C-4 plastic explosive block wrapped in olive drab plastic is strapped to the frame.',
  'Military-grade high explosive capable of tearing the carriage in two.',
  'C-4 Explosive',
  'Two-pound block of malleable plastic explosive stamped "COMP-C4".',
  '["Dynamite Stick","Gunpowder Can","Gasoline Can"]'::jsonb,
  'C-4 Explosive',
  '["c-4 explosive","c-4","explosive","c4","bomb","plastic explosive"]'::jsonb,
  'A grey or olive block of dough-like military explosive material.',
  'ev_3',
  false,
  '{"descriptions":["A military C-4 plastic explosive block wrapped in olive drab plastic is strapped to the frame.","At 03:08 PM: A military C-4 plastic explosive block wrapped in olive drab plastic is strapped to the frame.","Notice this clue: A military C-4 plastic explosive block wrapped in olive drab plastic is strapped to the frame."],"hints":["A grey or olive block of dough-like military explosive material.","Clue hint: Think about c-4 explosive.","Search for: military-grade high explosive capable of tearing the carriage in two."],"clues":["C-4 Explosive","Item: C-4 Explosive","Clue Word: C-4 Explosive"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3e77af10-14a5-55a6-bdbe-d33a53b03457',
  'story_037',
  'ev_3',
  3,
  '03:10 PM',
  'A sensitive spring-loaded brass pressure plate rests directly beneath the seat cushion.',
  'A sensitive spring-loaded brass pressure plate rests directly beneath the seat cushion.',
  'If the passenger lifts his weight, two copper contacts touch and detonate the block.',
  'Pressure Plate',
  'Dual copper contact leaf switch held open by body weight.',
  '["Tripwire","Motion Sensor","Magnet Switch"]'::jsonb,
  'Pressure Plate',
  '["pressure plate","plate","switch","pressure switch"]'::jsonb,
  'A flat metal trigger that activates when weight is lifted or pressed.',
  'ev_4',
  false,
  '{"descriptions":["A sensitive spring-loaded brass pressure plate rests directly beneath the seat cushion.","At 03:10 PM: A sensitive spring-loaded brass pressure plate rests directly beneath the seat cushion.","Notice this clue: A sensitive spring-loaded brass pressure plate rests directly beneath the seat cushion."],"hints":["A flat metal trigger that activates when weight is lifted or pressed.","Clue hint: Think about pressure plate.","Search for: if the passenger lifts his weight, two copper contacts touch and detonate the block."],"clues":["Pressure Plate","Item: Pressure Plate","Clue Word: Pressure Plate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9257f092-2596-59c6-971d-fb0a12d9bbc1',
  'story_037',
  'ev_4',
  4,
  '03:12 PM',
  'A compact black rip-stop nylon parachute pack is hidden in the linen locker.',
  'A compact black rip-stop nylon parachute pack is hidden in the linen locker.',
  'The bomber prepared an escape method before the train reached the bridge.',
  'Emergency Parachute',
  'Military skydiving rig with quick-release harness stamped "VANCE".',
  '["Life Jacket","Backpack","Sleeping Bag"]'::jsonb,
  'Emergency Parachute',
  '["emergency parachute","parachute","chute","skydiving pack"]'::jsonb,
  'A fabric canopy folded in a backpack used to jump safely from moving vehicles.',
  'ev_5',
  false,
  '{"descriptions":["A compact black rip-stop nylon parachute pack is hidden in the linen locker.","At 03:12 PM: A compact black rip-stop nylon parachute pack is hidden in the linen locker.","Notice this clue: A compact black rip-stop nylon parachute pack is hidden in the linen locker."],"hints":["A fabric canopy folded in a backpack used to jump safely from moving vehicles.","Clue hint: Think about emergency parachute.","Search for: the bomber prepared an escape method before the train reached the bridge."],"clues":["Emergency Parachute","Item: Emergency Parachute","Clue Word: Emergency Parachute"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f82dc837-b809-5264-a82d-f0999c9ea180',
  'story_037',
  'ev_5',
  5,
  '03:15 PM',
  'A pair of blue surgical wire cutters carefully clips the yellow ground wire.',
  'A pair of blue surgical wire cutters carefully clips the yellow ground wire.',
  'Elena neutralized the primary trigger without closing the secondary loop.',
  'Wire Cutters',
  'Insulated stainless steel electronics cutters with rubber grips.',
  '["Scissors","Pliers","Knife"]'::jsonb,
  'Wire Cutters',
  '["wire cutters","cutters","pliers","snippers"]'::jsonb,
  'A small sharp hand tool used to snip electrical cables cleanly.',
  'ev_6',
  true,
  '{"descriptions":["A pair of blue surgical wire cutters carefully clips the yellow ground wire.","At 03:15 PM: A pair of blue surgical wire cutters carefully clips the yellow ground wire.","Notice this clue: A pair of blue surgical wire cutters carefully clips the yellow ground wire."],"hints":["A small sharp hand tool used to snip electrical cables cleanly.","Clue hint: Think about wire cutters.","Search for: elena neutralized the primary trigger without closing the secondary loop."],"clues":["Wire Cutters","Item: Wire Cutters","Clue Word: Wire Cutters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'be8471e6-de77-5c5b-9153-8e9e55a67bc0',
  'story_037',
  'ev_6',
  6,
  '03:17 PM',
  'A handheld radio transmitter tuned to 144.250 MHz is in Frank’s inner pocket.',
  'A handheld radio transmitter tuned to 144.250 MHz is in Frank’s inner pocket.',
  'Frank possessed a manual backup detonator to blow the train from the ground.',
  'Remote Detonator',
  'Walkie-talkie sized black radio unit with an armed red toggle switch.',
  '["Mobile Phone","GPS Unit","Flashlight"]'::jsonb,
  'Remote Detonator',
  '["remote detonator","detonator","transmitter","remote"]'::jsonb,
  'A handheld electronic box with a button used to explode bombs from a distance.',
  'ev_7',
  false,
  '{"descriptions":["A handheld radio transmitter tuned to 144.250 MHz is in Frank’s inner pocket.","At 03:17 PM: A handheld radio transmitter tuned to 144.250 MHz is in Frank’s inner pocket.","Notice this clue: A handheld radio transmitter tuned to 144.250 MHz is in Frank’s inner pocket."],"hints":["A handheld electronic box with a button used to explode bombs from a distance.","Clue hint: Think about remote detonator.","Search for: frank possessed a manual backup detonator to blow the train from the ground."],"clues":["Remote Detonator","Item: Remote Detonator","Clue Word: Remote Detonator"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '99c7397f-2c6a-5036-b13d-3f091671a2b3',
  'story_037',
  'ev_7',
  7,
  '03:19 PM',
  'A shorted stock portfolio receipt betting on railway company bankruptcy is seized.',
  'A shorted stock portfolio receipt betting on railway company bankruptcy is seized.',
  'Frank had two million dollars riding on the railway crash.',
  'Short Stock Slip',
  'Offshore brokerage confirmation showing high-stakes short options.',
  '["Train Ticket","Receipt","Checkbook"]'::jsonb,
  'Short Stock Slip',
  '["short stock slip","slip","stock slip","trading slip","receipt"]'::jsonb,
  'A paper slip showing financial bets placed on a company losing value.',
  'ev_8',
  false,
  '{"descriptions":["A shorted stock portfolio receipt betting on railway company bankruptcy is seized.","At 03:19 PM: A shorted stock portfolio receipt betting on railway company bankruptcy is seized.","Notice this clue: A shorted stock portfolio receipt betting on railway company bankruptcy is seized."],"hints":["A paper slip showing financial bets placed on a company losing value.","Clue hint: Think about short stock slip.","Search for: frank had two million dollars riding on the railway crash."],"clues":["Short Stock Slip","Item: Short Stock Slip","Clue Word: Short Stock Slip"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1689c742-7f22-53b1-93d9-d715a9154b55',
  'story_037',
  'ev_8',
  8,
  '03:20 PM',
  'A dented pocket inspection mirror is held beneath the seat by Elena.',
  'A dented pocket inspection mirror is held beneath the seat by Elena.',
  'Allowed Elena to trace the colored booby-trap wires without disturbing the plate.',
  'Inspection Mirror',
  'Angled dental mirror on a telescoping metal rod.',
  '["Magnifying Glass","Flashlight","Ruler"]'::jsonb,
  'Inspection Mirror',
  '["inspection mirror","mirror","pocket mirror"]'::jsonb,
  'A small round mirror on a long handle used by mechanics to see tight spaces.',
  NULL,
  true,
  '{"descriptions":["A dented pocket inspection mirror is held beneath the seat by Elena.","At 03:20 PM: A dented pocket inspection mirror is held beneath the seat by Elena.","Notice this clue: A dented pocket inspection mirror is held beneath the seat by Elena."],"hints":["A small round mirror on a long handle used by mechanics to see tight spaces.","Clue hint: Think about inspection mirror.","Search for: allowed elena to trace the colored booby-trap wires without disturbing the plate."],"clues":["Inspection Mirror","Item: Inspection Mirror","Clue Word: Inspection Mirror"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_038 — COUNTDOWN IN THE SUB-BASEMENT
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_038',
  'Countdown in the Sub-Basement',
  'Thriller',
  'Global Bank Data Center, Sub-Basement 4, deafening roar of server cooling racks and freezing halon pipes',
  'The master liquid cooling valves were sealed shut, initiating a 30-minute thermal meltdown of the global banking ledger.',
  '[{"name":"Alan Vance","role":"Director of IT Operations","alibi":"In the ground floor executive command room","avatar":"💻"},{"name":"Samir \"Sam\" Chen","role":"Senior Server Technician","alibi":"Trapped inside Sub-Basement 4","avatar":"🔧"},{"name":"Agent Kelly Sterling","role":"Cyber Infrastructure Federal Agent","alibi":"Outside the blast doors on Sub-Basement 3","avatar":"🛡️"},{"name":"Dr. Rebecca Moore","role":"Facility Fire Safety Engineer","alibi":"In the security control office monitoring ventilation dampers","avatar":"⚠️"}]'::jsonb,
  'IT Director Alan Vance locked the emergency cooling valves on Sub-Basement 4 using industrial thermite powder. He triggered the halon fire doors to trap the technician team inside, intending to melt the server hard drives and permanently destroy all financial audit logs.',
  'IT Operations Director Alan Vance',
  'Alan wanted to erase all records of his multi-million-dollar corporate embezzlement.',
  '[{"time":"01:00 AM","event":"Alan Vance enters Sub-Basement 4 with a thermal welding canister."},{"time":"01:15 AM","event":"Alan welds the cooling return valves shut and activates the lock solenoids."},{"time":"01:20 AM","event":"Server rack alarms begin screeching as ambient temperature passes 60°C."},{"time":"01:35 AM","event":"Halon fire suppression pre-discharge sirens sound inside the trapped room."},{"time":"01:45 AM","event":"Agent Sterling breaches the blast door with hydraulic jaws."}]'::jsonb,
  '[{"id":"ev1","title":"Thermite Slag on Cooling Wheel","detail":"Shows intentional chemical sabotage designed to cause server thermal runaway."},{"id":"ev2","title":"Remotely Bridged Door Solenoids","detail":"Door lock signals originated directly from Alan Vance’s executive terminal."},{"id":"ev3","title":"Charred Thermite Canister","detail":"Found in the server corridor with Alan Vance’s fingerprints."},{"id":"ev4","title":"Twelve-Million-Dollar Embezzlement File","detail":"Found on Alan’s private tablet, confirming the motive to incinerate the servers."}]'::jsonb,
  '[{"order":1,"title":"Welded Cooling Valve","text":"Brass pipe wheel melted shut with chemical thermite."},{"order":2,"title":"Thermal Thermometer","text":"Handheld meter showing temperatures soaring toward hardware destruction."},{"order":3,"title":"Blast Doors","text":"Sealed airtight fire doors trapping the technical crew inside."},{"order":4,"title":"Halon Gas Tank","text":"Extinguishing gas cylinder armed to vent and suffocate the occupants."},{"order":5,"title":"Thermite Stick","text":"High-temperature incendiary tool used to weld the mechanical parts."},{"order":6,"title":"Embezzlement Records","text":"Financial files detailing twelve million dollars in stolen bank funds."}]'::jsonb,
  'Technician Sam had an infrared thermometer.: He was monitoring temperature spikes to save the servers.; The building exterior had an electrical lightning arrester.: Intact and completely unrelated to the sub-basement fire.',
  'Blame the night technician Sam or claim an external ransomware virus caused the heat spike.',
  'NORMAL',
  'Who locked the emergency cooling valves and trapped the technicians inside the server room?',
  '[{"character":"Alan Vance","secret":"He embezzled twelve million dollars through offshore transaction logs."},{"character":"Samir \"Sam\" Chen","secret":"He was planning to blow the whistle on Alan’s fake server invoices."},{"character":"Agent Kelly Sterling","secret":"Had an open subpoena ready to seize the bank’s central ledger servers."},{"character":"Dr. Rebecca Moore","secret":"She was pressured by Alan to sign off on disabled safety bypasses yesterday."}]'::jsonb,
  '[{"lead":"Technician Sam had an infrared thermometer.","explanation":"He was monitoring temperature spikes to save the servers."},{"lead":"The building exterior had an electrical lightning arrester.","explanation":"Intact and completely unrelated to the sub-basement fire."}]'::jsonb,
  '{"wrongTheories":["An external ransomware virus overheated the processors through crypto-mining code.","A faulty water cooling pump naturally exploded and started an electrical fire."],"correctTheory":"IT Director Alan Vance welded the cooling valves with thermite and sealed the blast doors to incinerate the central banking servers and erase evidence of his twelve-million-dollar embezzlement, leaving the technicians trapped inside."}'::jsonb,
  'IT Director Alan Vance welded the cooling valves to burn his fraud records!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Agent Sterling breached the blast doors with hydraulic jaws, venting the heat and rescuing the technicians. Alan Vance was arrested for attempted murder and fraud."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The halon gas discharged and the servers melted into scrap. The technicians suffocated and Alan Vance walked away with twelve million dollars."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The bank reported an accidental cooling pump explosion and collected insurance payouts. Alan retired as a respected tech director."}]'::jsonb,
  '{"intros":["The master liquid cooling valves were sealed shut, initiating a 30-minute thermal meltdown of the global banking ledger.","Case file story_038: The master liquid cooling valves were sealed shut, initiating a 30-minute thermal meltdown of the global banking ledger. Look closely at every clue.","Trouble begins in Global Bank Data Center, Sub-Basement 4, deafening roar of server cooling racks and freezing halon pipes. The master liquid cooling valves were sealed shut, initiating a 30-minute thermal meltdown of the global banking ledger.","The mystery starts now. The master liquid cooling valves were sealed shut, initiating a 30-minute thermal meltdown of the global banking ledger. Can you solve it?"],"reveals":["IT Director Alan Vance welded the cooling valves to burn his fraud records!","The mystery is unraveled! IT Director Alan Vance welded the cooling valves to burn his fraud records!","At last, the truth comes out: IT Director Alan Vance welded the cooling valves to burn his fraud records!","Case resolved! Here is what happened: IT Director Alan Vance welded the cooling valves to burn his fraud records!"],"hints":["Pay attention to where IT Operations Director Alan Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_038';
DELETE FROM public.case_events WHERE case_id = 'story_038';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c3d36f4f-0349-5bad-8f20-ea248c63aaef',
  'story_038',
  'Alan Vance',
  'Director of IT Operations',
  'Cold, hyper-intelligent, impeccably groomed, checking his digital watch',
  'The cooling system suffered a catastrophic pump seizure. The floor must be evacuated immediately.',
  'He embezzled twelve million dollars through offshore transaction logs.',
  'In the ground floor executive command room',
  'Has administrative master access over all server infrastructure',
  'When server temperatures hit 95 degrees Celsius, magnetic drives melt permanently.',
  'Did not know an old technician had an analog emergency radio in his tool chest.',
  '💻',
  '["The cooling system suffered a catastrophic pump seizure. The floor must be evacuated immediately.","\"The cooling system suffered a catastrophic pump seizure. The floor must be evacuated immediately.\"","Listen to me: The cooling system suffered a catastrophic pump seizure. The floor must be evacuated immediately.","I tell you the truth: The cooling system suffered a catastrophic pump seizure. The floor must be evacuated immediately."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7c06c854-75f2-5203-920e-697f7c91ba45',
  'story_038',
  'Samir "Sam" Chen',
  'Senior Server Technician',
  'Hardworking, sweating in the rising heat, holding an infrared thermometer',
  'Someone physically welded the shut-off wheel with magnesium thermite!',
  'He was planning to blow the whistle on Alan’s fake server invoices.',
  'Trapped inside Sub-Basement 4',
  'Lead engineer trying to restore the cooling line',
  'The temperature is rising by three degrees every two minutes.',
  'Did not know the halon gas was set to vent in eight minutes.',
  '🔧',
  '["Someone physically welded the shut-off wheel with magnesium thermite!","\"Someone physically welded the shut-off wheel with magnesium thermite!\"","Listen to me: Someone physically welded the shut-off wheel with magnesium thermite!","I tell you the truth: Someone physically welded the shut-off wheel with magnesium thermite!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '40dcc089-e910-570d-8491-ebd5b217e625',
  'story_038',
  'Agent Kelly Sterling',
  'Cyber Infrastructure Federal Agent',
  'Relentless, tactical gear, carrying pneumatic door-breaching tools',
  'This is not a software crash. Someone is physically burning down the evidence.',
  'Had an open subpoena ready to seize the bank’s central ledger servers.',
  'Outside the blast doors on Sub-Basement 3',
  'Investigating financial fraud and cyber-terrorism',
  'The server rack backup power can be severed from the external breaker box.',
  'Did not immediately know Alan had rigged the electronic door solenoids.',
  '🛡️',
  '["This is not a software crash. Someone is physically burning down the evidence.","\"This is not a software crash. Someone is physically burning down the evidence.\"","Listen to me: This is not a software crash. Someone is physically burning down the evidence.","I tell you the truth: This is not a software crash. Someone is physically burning down the evidence."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2b82441e-9fd9-5941-a530-2511afa4012b',
  'story_038',
  'Dr. Rebecca Moore',
  'Facility Fire Safety Engineer',
  'Precise, urgent, checking gas pressure dials on the wall',
  'If the halon gas triggers while the technicians are inside, they will suffocate in ninety seconds.',
  'She was pressured by Alan to sign off on disabled safety bypasses yesterday.',
  'In the security control office monitoring ventilation dampers',
  'In charge of the emergency fire suppression gas system',
  'The emergency manual override handle is located on Column 12.',
  'Did not realize Alan had jammed Column 12 with steel wedge shims.',
  '⚠️',
  '["If the halon gas triggers while the technicians are inside, they will suffocate in ninety seconds.","\"If the halon gas triggers while the technicians are inside, they will suffocate in ninety seconds.\"","Listen to me: If the halon gas triggers while the technicians are inside, they will suffocate in ninety seconds.","I tell you the truth: If the halon gas triggers while the technicians are inside, they will suffocate in ninety seconds."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ada327de-7fe9-5666-9aa1-1c476d249fce',
  'story_038',
  'ev_1',
  1,
  '01:15 AM',
  'A heavy brass cooling pipe valve wheel is fused solid with white thermite slag.',
  'A heavy brass cooling pipe valve wheel is fused solid with white thermite slag.',
  'The cooling line was physically welded to prevent emergency manual reopening.',
  'Welded Cooling Valve',
  'High-temperature iron-aluminum oxide slag melting the valve stem.',
  '["Rusted Bolt","Broken Chain","Padlock"]'::jsonb,
  'Welded Cooling Valve',
  '["welded cooling valve","valve","cooling valve","welded valve","wheel"]'::jsonb,
  'A large round metal wheel on a water pipe melted shut with extreme heat.',
  'ev_2',
  true,
  '{"descriptions":["A heavy brass cooling pipe valve wheel is fused solid with white thermite slag.","At 01:15 AM: A heavy brass cooling pipe valve wheel is fused solid with white thermite slag.","Notice this clue: A heavy brass cooling pipe valve wheel is fused solid with white thermite slag."],"hints":["A large round metal wheel on a water pipe melted shut with extreme heat.","Clue hint: Think about welded cooling valve.","Search for: the cooling line was physically welded to prevent emergency manual reopening."],"clues":["Welded Cooling Valve","Item: Welded Cooling Valve","Clue Word: Welded Cooling Valve"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e52d8afc-de9c-5ac3-9bb4-cb0f693cb69e',
  'story_038',
  'ev_2',
  2,
  '01:20 AM',
  'An infrared thermal thermometer reads 88.4 degrees Celsius on the central processor rack.',
  'An infrared thermal thermometer reads 88.4 degrees Celsius on the central processor rack.',
  'The server bank is minutes away from thermal destruction and memory loss.',
  'Thermal Thermometer',
  'Handheld yellow laser thermometer showing dangerously soaring temperatures.',
  '["Barcode Scanner","Flashlight","Voltage Meter"]'::jsonb,
  'Thermal Thermometer',
  '["thermal thermometer","thermometer","laser thermometer","meter"]'::jsonb,
  'A handheld device with a red laser that measures temperature from a distance.',
  'ev_3',
  false,
  '{"descriptions":["An infrared thermal thermometer reads 88.4 degrees Celsius on the central processor rack.","At 01:20 AM: An infrared thermal thermometer reads 88.4 degrees Celsius on the central processor rack.","Notice this clue: An infrared thermal thermometer reads 88.4 degrees Celsius on the central processor rack."],"hints":["A handheld device with a red laser that measures temperature from a distance.","Clue hint: Think about thermal thermometer.","Search for: the server bank is minutes away from thermal destruction and memory loss."],"clues":["Thermal Thermometer","Item: Thermal Thermometer","Clue Word: Thermal Thermometer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cbb655a5-66e6-5913-8a2a-2d36f9885e3f',
  'story_038',
  'ev_3',
  3,
  '01:25 AM',
  'The heavy steel halon gas blast doors are magnetically sealed shut from outside.',
  'The heavy steel halon gas blast doors are magnetically sealed shut from outside.',
  'The electronic solenoids were bridged to prevent escape or ventilation.',
  'Blast Doors',
  'Reinforced two-ton steel security doors with red lock warning lights active.',
  '["Wooden Door","Glass Panel","Iron Gate"]'::jsonb,
  'Blast Doors',
  '["blast doors","doors","steel doors","fire doors"]'::jsonb,
  'Massive heavy metal airtight doors built to contain fires and explosions.',
  'ev_4',
  false,
  '{"descriptions":["The heavy steel halon gas blast doors are magnetically sealed shut from outside.","At 01:25 AM: The heavy steel halon gas blast doors are magnetically sealed shut from outside.","Notice this clue: The heavy steel halon gas blast doors are magnetically sealed shut from outside."],"hints":["Massive heavy metal airtight doors built to contain fires and explosions.","Clue hint: Think about blast doors.","Search for: the electronic solenoids were bridged to prevent escape or ventilation."],"clues":["Blast Doors","Item: Blast Doors","Clue Word: Blast Doors"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '91acca89-41dd-5059-9720-b9a928869188',
  'story_038',
  'ev_4',
  4,
  '01:28 AM',
  'A green canister of high-pressure halon extinguishing gas is armed to vent.',
  'A green canister of high-pressure halon extinguishing gas is armed to vent.',
  'The gas will displace all oxygen in the room to extinguish electrical heat.',
  'Halon Gas Tank',
  'Pressurized steel gas cylinder with solenoid valve ticking toward release.',
  '["Oxygen Tank","Fire Extinguisher","Water Tank"]'::jsonb,
  'Halon Gas Tank',
  '["halon gas tank","halon tank","gas tank","tank","halon","cylinder"]'::jsonb,
  'A large green compressed gas tank used to smother fires in electronics rooms.',
  'ev_5',
  false,
  '{"descriptions":["A green canister of high-pressure halon extinguishing gas is armed to vent.","At 01:28 AM: A green canister of high-pressure halon extinguishing gas is armed to vent.","Notice this clue: A green canister of high-pressure halon extinguishing gas is armed to vent."],"hints":["A large green compressed gas tank used to smother fires in electronics rooms.","Clue hint: Think about halon gas tank.","Search for: the gas will displace all oxygen in the room to extinguish electrical heat."],"clues":["Halon Gas Tank","Item: Halon Gas Tank","Clue Word: Halon Gas Tank"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '258d0361-d36a-5862-9e66-a29cd15316ec',
  'story_038',
  'ev_5',
  5,
  '01:32 AM',
  'A discarded thermite ignition stick with magnesium fuse wire is on the floor.',
  'A discarded thermite ignition stick with magnesium fuse wire is on the floor.',
  'The chemical incendiary used to weld the brass valve was military thermite.',
  'Thermite Stick',
  'Charred aluminum flare tube with white magnesium oxide coating.',
  '["Road Flare","Dynamite","Matchbook"]'::jsonb,
  'Thermite Stick',
  '["thermite stick","thermite","fuse","igniter"]'::jsonb,
  'A chemical incendiary rod that burns at thousands of degrees to melt metal.',
  'ev_6',
  true,
  '{"descriptions":["A discarded thermite ignition stick with magnesium fuse wire is on the floor.","At 01:32 AM: A discarded thermite ignition stick with magnesium fuse wire is on the floor.","Notice this clue: A discarded thermite ignition stick with magnesium fuse wire is on the floor."],"hints":["A chemical incendiary rod that burns at thousands of degrees to melt metal.","Clue hint: Think about thermite stick.","Search for: the chemical incendiary used to weld the brass valve was military thermite."],"clues":["Thermite Stick","Item: Thermite Stick","Clue Word: Thermite Stick"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '06a223b2-ceb0-50bd-9adf-4dd808d762f0',
  'story_038',
  'ev_6',
  6,
  '01:36 AM',
  'A pair of heavy hydraulic rescue spreaders cracks open the steel door frame.',
  'A pair of heavy hydraulic rescue spreaders cracks open the steel door frame.',
  'Federal rescue teams forced an air gap into the sealed chamber.',
  'Hydraulic Jaws',
  'Pneumatic rescue cutter tool with hydraulic hoses attached.',
  '["Sledgehammer","Crowbar","Axe"]'::jsonb,
  'Hydraulic Jaws',
  '["hydraulic jaws","jaws","spreaders","rescue tool"]'::jsonb,
  'A powerful machine tool used by firefighters to pry open smashed metal doors.',
  'ev_7',
  false,
  '{"descriptions":["A pair of heavy hydraulic rescue spreaders cracks open the steel door frame.","At 01:36 AM: A pair of heavy hydraulic rescue spreaders cracks open the steel door frame.","Notice this clue: A pair of heavy hydraulic rescue spreaders cracks open the steel door frame."],"hints":["A powerful machine tool used by firefighters to pry open smashed metal doors.","Clue hint: Think about hydraulic jaws.","Search for: federal rescue teams forced an air gap into the sealed chamber."],"clues":["Hydraulic Jaws","Item: Hydraulic Jaws","Clue Word: Hydraulic Jaws"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd37bd37f-0e7a-5c3d-8177-30374caa4d24',
  'story_038',
  'ev_7',
  7,
  '01:40 AM',
  'An encrypted hard drive array marked "MASTER TRANSACTION LEDGER" is smoking.',
  'An encrypted hard drive array marked "MASTER TRANSACTION LEDGER" is smoking.',
  'The target of the sabotage was the ledger containing Alan’s embezzlement.',
  'Server Hard Drive',
  'Solid-state drive enclosure glowing hot with scorched aluminum casing.',
  '["Motherboard","Power Supply","Cooling Fan"]'::jsonb,
  'Server Hard Drive',
  '["server hard drive","hard drive","drive","server drive","ssd","ledger drive"]'::jsonb,
  'An electronic metal box inside computers that stores permanent digital files.',
  'ev_8',
  false,
  '{"descriptions":["An encrypted hard drive array marked \"MASTER TRANSACTION LEDGER\" is smoking.","At 01:40 AM: An encrypted hard drive array marked \"MASTER TRANSACTION LEDGER\" is smoking.","Notice this clue: An encrypted hard drive array marked \"MASTER TRANSACTION LEDGER\" is smoking."],"hints":["An electronic metal box inside computers that stores permanent digital files.","Clue hint: Think about server hard drive.","Search for: the target of the sabotage was the ledger containing alan’s embezzlement."],"clues":["Server Hard Drive","Item: Server Hard Drive","Clue Word: Server Hard Drive"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '443b39b7-b7eb-5233-9519-2be34c67515a',
  'story_038',
  'ev_8',
  8,
  '01:50 AM',
  'An offshore banking wire log for twelve million dollars is recovered from Alan’s tablet.',
  'An offshore banking wire log for twelve million dollars is recovered from Alan’s tablet.',
  'Concrete financial proof of the massive theft Alan tried to burn.',
  'Embezzlement Records',
  'Exported spreadsheet showing twelve million dollars rerouted to Zurich.',
  '["Employee List","Tax File","Password Sheet"]'::jsonb,
  'Embezzlement Records',
  '["embezzlement records","records","financial logs","spreadsheet"]'::jsonb,
  'Digital or printed accounting documents showing stolen corporate money.',
  NULL,
  true,
  '{"descriptions":["An offshore banking wire log for twelve million dollars is recovered from Alan’s tablet.","At 01:50 AM: An offshore banking wire log for twelve million dollars is recovered from Alan’s tablet.","Notice this clue: An offshore banking wire log for twelve million dollars is recovered from Alan’s tablet."],"hints":["Digital or printed accounting documents showing stolen corporate money.","Clue hint: Think about embezzlement records.","Search for: concrete financial proof of the massive theft alan tried to burn."],"clues":["Embezzlement Records","Item: Embezzlement Records","Clue Word: Embezzlement Records"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_039 — THE HOSTAGE IN THE PENTHOUSE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_039',
  'The Hostage in the Penthouse',
  'Thriller',
  'The Grand Zenith Penthouse, 50th floor, floor-to-ceiling glass overlooking city lights, gala party underway',
  'A silent panic alarm was triggered from the private safe-room while the billionaire host gave a champagne toast.',
  '[{"name":"Viktor Vance","role":"Chief of Executive Protection","alibi":"Standing at stage left monitoring the crowd","avatar":"🛡️"},{"name":"Marcus Sterling (The Real Host)","role":"Billionaire Industrialist","alibi":"Trapped inside the sealed private safe-room","avatar":"👤"},{"name":"The Impostor (\"Fake Marcus\")","role":"Trained Actor & Impersonator","alibi":"At the gala podium speaking to three hundred guests","avatar":"🎭"},{"name":"Agent Sarah Cole","role":"Hostage Rescue Team Commander","alibi":"On the terrace perimeter monitoring the gala through glass windows","avatar":"🔍"}]'::jsonb,
  'Head of Security Viktor Vance abducted billionaire Marcus Sterling two hours before the gala. He locked Marcus inside the reinforced penthouse vault and introduced an impostor on stage to authorize a transfer of company voting shares before escaping via helicopter.',
  'Bodyguard Captain Viktor Vance',
  'Viktor kidnapped the real billionaire and replaced him with a trained plastic-surgery body double.',
  '[{"time":"06:00 PM","event":"Viktor overpowers Marcus in his private study and drags him into the safe-room."},{"time":"06:45 PM","event":"The prosthetic makeup team completes the transformation of the impostor."},{"time":"07:30 PM","event":"The gala begins; the impostor takes the stage with champagne."},{"time":"07:55 PM","event":"Marcus taps his shoe transmitter, triggering the covert distress signal."},{"time":"08:15 PM","event":"Agent Cole’s tactical team breaches the penthouse service entrance."}]'::jsonb,
  '[{"id":"ev1","title":"Medical Radio Distress Beacon","detail":"Transmitted from inside the titanium safe-room wall using Marcus’s shoe transmitter."},{"id":"ev2","title":"Discarded Silicone Face Mask","detail":"Found in the penthouse dressing room with adhesive matching the impostor’s skin."},{"id":"ev3","title":"Micro-Earpiece Frequency Link","detail":"Audio link directly paired to Viktor Vance’s tactical radio transmitter."},{"id":"ev4","title":"Rooftop Helicopter Escape Route","detail":"Proves Viktor planned to flee with twenty million dollars in corporate bonds."}]'::jsonb,
  '[{"order":1,"title":"Emergency Beacon","text":"Distress frequency beaming Marcus Sterling’s ID from inside the vault."},{"order":2,"title":"Titanium Safe-Room Door","text":"Impenetrable vault door locking the real billionaire away from his guests."},{"order":3,"title":"Silicone Mask","text":"Hyper-realistic prosthetic used by an actor to pose as the billionaire."},{"order":4,"title":"Micro-Earpiece","text":"Covert receiver used to feed lines to the impostor on stage."},{"order":5,"title":"Share Transfer Document","text":"Corporate contract designed to surrender control of the company."},{"order":6,"title":"Helicopter Flight Plan","text":"Charter flight booked by Viktor to flee from the rooftop."}]'::jsonb,
  'The catering bartender dropped a tray of champagne.: A clumsy accident caused by the loud party noise.; The safe-room had an automatic air filtration cycle.: Standard air circulation, not an attempt to gas the occupant.',
  'Claim the safe-room alarm was a false electrical test or blame the catering bartender.',
  'NORMAL',
  'If the host was laughing on stage, who was trapped inside the fortified safe-room?',
  '[{"character":"Viktor Vance","secret":"He negotiated a twenty-million-dollar buyout with corporate rivals."},{"character":"Marcus Sterling (The Real Host)","secret":"He was planning to fire Viktor for financial irregularities this morning."},{"character":"The Impostor (\"Fake Marcus\")","secret":"He is wearing a hyper-realistic silicone prosthetic mask and listening to ear prompts."},{"character":"Agent Sarah Cole","secret":"Her tactical squad had snipers positioned on the adjacent skyscraper roof."}]'::jsonb,
  '[{"lead":"The catering bartender dropped a tray of champagne.","explanation":"A clumsy accident caused by the loud party noise."},{"lead":"The safe-room had an automatic air filtration cycle.","explanation":"Standard air circulation, not an attempt to gas the occupant."}]'::jsonb,
  '{"wrongTheories":["The real Marcus Sterling suffered a nervous breakdown and locked himself away.","A rival business competitor launched an armed drone strike on the penthouse."],"correctTheory":"Chief of Protection Viktor Vance abducted billionaire Marcus Sterling into his own safe-room and replaced him with a prosthetic body double to sign away company shares before fleeing on a helicopter."}'::jsonb,
  'Bodyguard Viktor Vance swapped Marcus for an impostor to steal the company!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Agent Cole’s tactical team arrested the impostor at the podium and captured Viktor on the helipad. The safe-room was breached and Marcus was freed unharmed."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The impostor signed the share transfer documents. Viktor boarded the helicopter with twenty million dollars while the real Marcus remained trapped."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The board believed the fake Marcus had willingly retired. The company fell under cartel control while the real billionaire vanished."}]'::jsonb,
  '{"intros":["A silent panic alarm was triggered from the private safe-room while the billionaire host gave a champagne toast.","Case file story_039: A silent panic alarm was triggered from the private safe-room while the billionaire host gave a champagne toast. Look closely at every clue.","Trouble begins in The Grand Zenith Penthouse, 50th floor, floor-to-ceiling glass overlooking city lights, gala party underway. A silent panic alarm was triggered from the private safe-room while the billionaire host gave a champagne toast.","The mystery starts now. A silent panic alarm was triggered from the private safe-room while the billionaire host gave a champagne toast. Can you solve it?"],"reveals":["Bodyguard Viktor Vance swapped Marcus for an impostor to steal the company!","The mystery is unraveled! Bodyguard Viktor Vance swapped Marcus for an impostor to steal the company!","At last, the truth comes out: Bodyguard Viktor Vance swapped Marcus for an impostor to steal the company!","Case resolved! Here is what happened: Bodyguard Viktor Vance swapped Marcus for an impostor to steal the company!"],"hints":["Pay attention to where Bodyguard Captain Viktor Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_039';
DELETE FROM public.case_events WHERE case_id = 'story_039';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '249a749a-56ec-519b-ba75-31761de4419e',
  'story_039',
  'Viktor Vance',
  'Chief of Executive Protection',
  'Muscular, cold-eyed, tactical earpiece, bespoke tuxedo concealing a suppressed weapon',
  'The safe-room sensor was a scheduled system diagnostic. Mr. Sterling is fine on the stage.',
  'He negotiated a twenty-million-dollar buyout with corporate rivals.',
  'Standing at stage left monitoring the crowd',
  'Controls the security access codes and penthouse safe-room',
  'The safe-room walls are reinforced with six-inch armored titanium plates.',
  'Did not know the real Marcus had a medical alert distress transmitter in his shoe.',
  '🛡️',
  '["The safe-room sensor was a scheduled system diagnostic. Mr. Sterling is fine on the stage.","\"The safe-room sensor was a scheduled system diagnostic. Mr. Sterling is fine on the stage.\"","Listen to me: The safe-room sensor was a scheduled system diagnostic. Mr. Sterling is fine on the stage.","I tell you the truth: The safe-room sensor was a scheduled system diagnostic. Mr. Sterling is fine on the stage."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7030c60f-b02f-5746-acdc-e9969bcaad35',
  'story_039',
  'Marcus Sterling (The Real Host)',
  'Billionaire Industrialist',
  'Elderly, aristocratic, wounded, gasping for air in the dark safe-room',
  'Hostage trapped inside; tapping on the titanium door with his silver signet ring.',
  'He was planning to fire Viktor for financial irregularities this morning.',
  'Trapped inside the sealed private safe-room',
  'Victim of the kidnapping and identity replacement',
  'The man on stage is wearing a latex prosthetic mask modeled on his face.',
  'Did not know if his silent radio beacon reached external police frequencies.',
  '👤',
  '["Hostage trapped inside; tapping on the titanium door with his silver signet ring.","\"Hostage trapped inside; tapping on the titanium door with his silver signet ring.\"","Listen to me: Hostage trapped inside; tapping on the titanium door with his silver signet ring.","I tell you the truth: Hostage trapped inside; tapping on the titanium door with his silver signet ring."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fb4ed670-f077-5865-a4d6-0ffe77d7678f',
  'story_039',
  'The Impostor ("Fake Marcus")',
  'Trained Actor & Impersonator',
  'Charming, confident, glass of champagne in hand, speaking at the podium',
  'Welcome friends! Tonight I announce the transfer of our voting shares to European partners.',
  'He is wearing a hyper-realistic silicone prosthetic mask and listening to ear prompts.',
  'At the gala podium speaking to three hundred guests',
  'Hired by Viktor to deliver the fraudulent share-transfer speech',
  'Viktor is feeding him vocal cadence lines through a micro-earpiece.',
  'Did not know the signet ring on his finger was a brass replica.',
  '🎭',
  '["Welcome friends! Tonight I announce the transfer of our voting shares to European partners.","\"Welcome friends! Tonight I announce the transfer of our voting shares to European partners.\"","Listen to me: Welcome friends! Tonight I announce the transfer of our voting shares to European partners.","I tell you the truth: Welcome friends! Tonight I announce the transfer of our voting shares to European partners."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '541ee142-4454-5bb4-978f-ba7c209c04cf',
  'story_039',
  'Agent Sarah Cole',
  'Hostage Rescue Team Commander',
  'Tactical, sharp, watching the stage through high-powered binoculars',
  'The speech cadence is right, but the earlobes on that man don’t match Sterling’s passport photos.',
  'Her tactical squad had snipers positioned on the adjacent skyscraper roof.',
  'On the terrace perimeter monitoring the gala through glass windows',
  'Leading the covert tactical hostage intervention',
  'Found a medical distress frequency broadcasting from the penthouse wall.',
  'Did not have the 8-digit digital override to open the titanium safe-room.',
  '🔍',
  '["The speech cadence is right, but the earlobes on that man don’t match Sterling’s passport photos.","\"The speech cadence is right, but the earlobes on that man don’t match Sterling’s passport photos.\"","Listen to me: The speech cadence is right, but the earlobes on that man don’t match Sterling’s passport photos.","I tell you the truth: The speech cadence is right, but the earlobes on that man don’t match Sterling’s passport photos."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b48144a1-feab-5923-8a62-e7647f97e9f7',
  'story_039',
  'ev_1',
  1,
  '07:55 PM',
  'A covert 406 MHz emergency distress beacon broadcasts from inside the vault wall.',
  'A covert 406 MHz emergency distress beacon broadcasts from inside the vault wall.',
  'The real Marcus activated an encrypted medical distress signal from his shoe heel.',
  'Emergency Beacon',
  'Radio signal packet displaying Marcus Sterling’s personal medical ID.',
  '["Car Alarm","Cell Phone Ping","Smoke Alarm"]'::jsonb,
  'Emergency Beacon',
  '["emergency beacon","beacon","distress signal","signal"]'::jsonb,
  'A small electronic radio transmitter that broadcasts emergency location codes.',
  'ev_2',
  true,
  '{"descriptions":["A covert 406 MHz emergency distress beacon broadcasts from inside the vault wall.","At 07:55 PM: A covert 406 MHz emergency distress beacon broadcasts from inside the vault wall.","Notice this clue: A covert 406 MHz emergency distress beacon broadcasts from inside the vault wall."],"hints":["A small electronic radio transmitter that broadcasts emergency location codes.","Clue hint: Think about emergency beacon.","Search for: the real marcus activated an encrypted medical distress signal from his shoe heel."],"clues":["Emergency Beacon","Item: Emergency Beacon","Clue Word: Emergency Beacon"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2b34d636-ef04-5c7f-9314-a6b8b08b8f89',
  'story_039',
  'ev_2',
  2,
  '08:00 PM',
  'A six-inch thick solid titanium safe-room door is locked with dual biometric bolts.',
  'A six-inch thick solid titanium safe-room door is locked with dual biometric bolts.',
  'The real billionaire was locked inside his own fortified shelter.',
  'Titanium Safe-Room Door',
  'Vault door with digital keypad and retina scanner displaying RED LOCK.',
  '["Wooden Door","Steel Gate","Glass Window"]'::jsonb,
  'Titanium Safe-Room Door',
  '["titanium safe-room door","door","safe-room door","vault door","titanium door"]'::jsonb,
  'A massive metal door designed to protect people from armed attacks.',
  'ev_3',
  false,
  '{"descriptions":["A six-inch thick solid titanium safe-room door is locked with dual biometric bolts.","At 08:00 PM: A six-inch thick solid titanium safe-room door is locked with dual biometric bolts.","Notice this clue: A six-inch thick solid titanium safe-room door is locked with dual biometric bolts."],"hints":["A massive metal door designed to protect people from armed attacks.","Clue hint: Think about titanium safe-room door.","Search for: the real billionaire was locked inside his own fortified shelter."],"clues":["Titanium Safe-Room Door","Item: Titanium Safe-Room Door","Clue Word: Titanium Safe-Room Door"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ae5dd6c7-8505-5e20-8e6a-c82396eef419',
  'story_039',
  'ev_3',
  3,
  '08:05 PM',
  'A skin-toned silicone facial prosthetic mask is found in the makeup vanity bin.',
  'A skin-toned silicone facial prosthetic mask is found in the makeup vanity bin.',
  'The man on the podium is wearing hyper-realistic fake skin prosthetics.',
  'Silicone Mask',
  'Molded medical-grade silicone mask matching Marcus Sterling’s facial features.',
  '["Carnival Mask","Rubber Glove","Bandage"]'::jsonb,
  'Silicone Mask',
  '["silicone mask","mask","prosthetic","fake face"]'::jsonb,
  'A thin, flexible fake face made of silicone rubber worn over someone’s head.',
  'ev_4',
  false,
  '{"descriptions":["A skin-toned silicone facial prosthetic mask is found in the makeup vanity bin.","At 08:05 PM: A skin-toned silicone facial prosthetic mask is found in the makeup vanity bin.","Notice this clue: A skin-toned silicone facial prosthetic mask is found in the makeup vanity bin."],"hints":["A thin, flexible fake face made of silicone rubber worn over someone’s head.","Clue hint: Think about silicone mask.","Search for: the man on the podium is wearing hyper-realistic fake skin prosthetics."],"clues":["Silicone Mask","Item: Silicone Mask","Clue Word: Silicone Mask"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '24369ca5-6e57-5ed8-a9b2-d239e78f426f',
  'story_039',
  'ev_4',
  4,
  '08:08 PM',
  'A magnetic wireless micro-earpiece is extracted from the impostor’s ear canal.',
  'A magnetic wireless micro-earpiece is extracted from the impostor’s ear canal.',
  'Viktor was feeding answers and vocal inflections to the double on stage.',
  'Micro-Earpiece',
  'Flesh-colored magnetic ear receiver measuring three millimeters.',
  '["Hearing Aid","Earplug","Jewelry"]'::jsonb,
  'Micro-Earpiece',
  '["micro-earpiece","earpiece","receiver","radio earpiece"]'::jsonb,
  'A tiny electronic speaker hidden deep inside an ear to hear secret voices.',
  'ev_5',
  false,
  '{"descriptions":["A magnetic wireless micro-earpiece is extracted from the impostor’s ear canal.","At 08:08 PM: A magnetic wireless micro-earpiece is extracted from the impostor’s ear canal.","Notice this clue: A magnetic wireless micro-earpiece is extracted from the impostor’s ear canal."],"hints":["A tiny electronic speaker hidden deep inside an ear to hear secret voices.","Clue hint: Think about micro-earpiece.","Search for: viktor was feeding answers and vocal inflections to the double on stage."],"clues":["Micro-Earpiece","Item: Micro-Earpiece","Clue Word: Micro-Earpiece"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e04f529b-2be1-5d65-b8eb-f64195b8c803',
  'story_039',
  'ev_5',
  5,
  '08:12 PM',
  'A signed corporate resolution transferring sixty percent of shares to an offshore fund.',
  'A signed corporate resolution transferring sixty percent of shares to an offshore fund.',
  'The purpose of the impostor speech was to legally sign away control of the firm.',
  'Share Transfer Document',
  'Notarized legal parchment awaiting Marcus’s signature on the podium.',
  '["Speech Notes","Menu","Checkbook"]'::jsonb,
  'Share Transfer Document',
  '["share transfer document","document","share transfer","contract","resolution"]'::jsonb,
  'A formal legal paper that transfers ownership of multi-million-dollar companies.',
  'ev_6',
  true,
  '{"descriptions":["A signed corporate resolution transferring sixty percent of shares to an offshore fund.","At 08:12 PM: A signed corporate resolution transferring sixty percent of shares to an offshore fund.","Notice this clue: A signed corporate resolution transferring sixty percent of shares to an offshore fund."],"hints":["A formal legal paper that transfers ownership of multi-million-dollar companies.","Clue hint: Think about share transfer document.","Search for: the purpose of the impostor speech was to legally sign away control of the firm."],"clues":["Share Transfer Document","Item: Share Transfer Document","Clue Word: Share Transfer Document"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cc9c82ef-a4dc-5438-bada-85a4c16f6478',
  'story_039',
  'ev_6',
  6,
  '08:15 PM',
  'A rooftop helipad flight plan shows a charter helicopter arriving at 8:30 PM.',
  'A rooftop helipad flight plan shows a charter helicopter arriving at 8:30 PM.',
  'Viktor arranged an immediate escape route to an offshore cargo vessel.',
  'Helicopter Flight Plan',
  'Air traffic control flight authorization for an unregistered Bell 429 helicopter.',
  '["Train Schedule","Ticket","Road Map"]'::jsonb,
  'Helicopter Flight Plan',
  '["helicopter flight plan","flight plan","plan","helicopter plan","flight authorization"]'::jsonb,
  'An official document showing where an aircraft is flying and landing.',
  'ev_7',
  false,
  '{"descriptions":["A rooftop helipad flight plan shows a charter helicopter arriving at 8:30 PM.","At 08:15 PM: A rooftop helipad flight plan shows a charter helicopter arriving at 8:30 PM.","Notice this clue: A rooftop helipad flight plan shows a charter helicopter arriving at 8:30 PM."],"hints":["An official document showing where an aircraft is flying and landing.","Clue hint: Think about helicopter flight plan.","Search for: viktor arranged an immediate escape route to an offshore cargo vessel."],"clues":["Helicopter Flight Plan","Item: Helicopter Flight Plan","Clue Word: Helicopter Flight Plan"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ce2e7903-e1f8-52f8-960c-82df08234535',
  'story_039',
  'ev_7',
  7,
  '08:20 PM',
  'A silver signet ring with a missing emerald chip is worn by the real Marcus in the vault.',
  'A silver signet ring with a missing emerald chip is worn by the real Marcus in the vault.',
  'The impostor’s ring was a cheap brass duplicate lacking the chipped setting.',
  'Chipped Signet Ring',
  'Authentic heirloom ring with a chipped corner on the green family crest.',
  '["Gold Watch","Cufflink","Tie Clip"]'::jsonb,
  'Chipped Signet Ring',
  '["chipped signet ring","signet ring","ring","chipped ring","family ring"]'::jsonb,
  'A heavy metal ring engraved with a family crest or initials.',
  'ev_8',
  false,
  '{"descriptions":["A silver signet ring with a missing emerald chip is worn by the real Marcus in the vault.","At 08:20 PM: A silver signet ring with a missing emerald chip is worn by the real Marcus in the vault.","Notice this clue: A silver signet ring with a missing emerald chip is worn by the real Marcus in the vault."],"hints":["A heavy metal ring engraved with a family crest or initials.","Clue hint: Think about chipped signet ring.","Search for: the impostor’s ring was a cheap brass duplicate lacking the chipped setting."],"clues":["Chipped Signet Ring","Item: Chipped Signet Ring","Clue Word: Chipped Signet Ring"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2688e666-9531-5456-8e90-3ee57b2c919c',
  'story_039',
  'ev_8',
  8,
  '08:25 PM',
  'A suppressed 9mm tactical sidearm is found in Viktor’s shoulder holster.',
  'A suppressed 9mm tactical sidearm is found in Viktor’s shoulder holster.',
  'Viktor was armed to eliminate the real Marcus once the shares were signed.',
  'Suppressed Pistol',
  'Black automatic pistol fitted with a screw-on carbon-fiber silencer.',
  '["Taser","Combat Knife","Baton"]'::jsonb,
  'Suppressed Pistol',
  '["suppressed pistol","pistol","gun","silenced gun"]'::jsonb,
  'A handgun equipped with a metal tube that muffles the sound of gunshots.',
  NULL,
  true,
  '{"descriptions":["A suppressed 9mm tactical sidearm is found in Viktor’s shoulder holster.","At 08:25 PM: A suppressed 9mm tactical sidearm is found in Viktor’s shoulder holster.","Notice this clue: A suppressed 9mm tactical sidearm is found in Viktor’s shoulder holster."],"hints":["A handgun equipped with a metal tube that muffles the sound of gunshots.","Clue hint: Think about suppressed pistol.","Search for: viktor was armed to eliminate the real marcus once the shares were signed."],"clues":["Suppressed Pistol","Item: Suppressed Pistol","Clue Word: Suppressed Pistol"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_040 — FLIGHT 409 RADIO SILENCE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_040',
  'Flight 409 Radio Silence',
  'Thriller',
  'Gulfstream G650 Private Jet, cruising at 41,000 feet over the stormy North Atlantic',
  'Flight 409 turned off its transponder, locked its cockpit armored door, and diverted toward an unmonitored desert airstrip.',
  '[{"name":"Julian Drake","role":"First Officer (Co-Pilot)","alibi":"Locked alone inside the cockpit controls","avatar":"👨‍✈️"},{"name":"Captain Robert Harris","role":"Chief Flight Captain","alibi":"Unconscious in the captain’s seat","avatar":"✈️"},{"name":"Senator Thomas Miller","role":"VIP Whistleblower Passenger","alibi":"Pacing the main passenger cabin at 41,000 feet","avatar":"🏛️"},{"name":"Flight Attendant Maya Lin","role":"Lead Cabin Crew","alibi":"In the forward galley holding a fire axe","avatar":"👩‍✈️"}]'::jsonb,
  'First Officer Julian Drake poisoned Captain Harris’s coffee with liquid benzodiazepine. Once the captain slumped unconscious, Julian disconnected the flight transponder, engaged autopilot on an unauthorized course to North Africa, and deadbolted the armored cockpit door.',
  'Co-Pilot Julian Drake',
  'Julian was paid ten million dollars by a rogue intelligence cartel to deliver a VIP passenger into custody.',
  '[{"time":"09:00 PM","event":"Flight 409 departs London Heathrow for New York."},{"time":"10:15 PM","event":"Julian serves Captain Harris drugged coffee from the galley thermos."},{"time":"10:40 PM","event":"Captain Harris loses consciousness; Julian flips the transponder to 7600 (lost comms)."},{"time":"10:45 PM","event":"The transponder is shut off completely; jet banks south toward North Africa."},{"time":"11:15 PM","event":"Maya uses the emergency galley crash axe to bridge the door solenoid."}]'::jsonb,
  '[{"id":"ev1","title":"Transponder Disabled at 10:40 PM","detail":"Shows deliberate human action to hide the aircraft from international radar."},{"id":"ev2","title":"Midazolam Residue in Thermos","detail":"Toxicology confirms Captain Harris was poisoned with surgical sedatives."},{"id":"ev3","title":"FMS Desert Waypoint Coordinates","detail":"Proves the aircraft was rerouted to a rogue mercenary airstrip in the Sahara."},{"id":"ev4","title":"Satellite Phone Wire Confirmation","detail":"Confirms Julian Drake was paid ten million dollars to deliver Senator Miller."}]'::jsonb,
  '[{"order":1,"title":"Transponder Unit","text":"Avionics device switched off to disappear from military and civil radar."},{"order":2,"title":"Sedative Dropper Bottle","text":"Medicine vial used to spike the captain’s in-flight coffee."},{"order":3,"title":"Armored Cockpit Door","text":"Ballistic door deadbolted from the inside to lock the crew out."},{"order":4,"title":"Flight Computer Route","text":"Unauthorized navigation path heading toward an unmonitored desert strip."},{"order":5,"title":"Emergency Crash Axe","text":"Galley tool used to short the door solenoids and breach the cockpit."},{"order":6,"title":"Coffee Thermos","text":"Drugged beverage container that rendered the captain unconscious."}]'::jsonb,
  'Senator Miller carried whistleblowing files.: He was the target of the kidnapping, not the hijacker.; The jet flew through severe Atlantic turbulence.: Normal weather storm, but did not cause the course deviation.',
  'Claim an electrical failure caused total radio blackout or blame the VIP passenger.',
  'NORMAL',
  'Did the pilots lose consciousness from hypoxia, or did someone hijack the flight deck controls?',
  '[{"character":"Julian Drake","secret":"Received a ten-million-dollar offshore wire transfer from an international cartel."},{"character":"Captain Robert Harris","secret":"He noticed Julian checking strange navigational coordinates before takeoff."},{"character":"Senator Thomas Miller","secret":"Carried a military flash drive exposing illegal offshore arms sales."},{"character":"Flight Attendant Maya Lin","secret":"She has the emergency mechanical override key code in her flight manual."}]'::jsonb,
  '[{"lead":"Senator Miller carried whistleblowing files.","explanation":"He was the target of the kidnapping, not the hijacker."},{"lead":"The jet flew through severe Atlantic turbulence.","explanation":"Normal weather storm, but did not cause the course deviation."}]'::jsonb,
  '{"wrongTheories":["Both pilots suffered sudden cabin decompression hypoxia and passed out.","Senator Miller hijacked the jet using a concealed weapon in the cabin."],"correctTheory":"Co-Pilot Julian Drake drugged Captain Harris with Midazolam in his coffee, shut down the transponder, locked the armored cockpit door, and diverted the jet to a rogue desert airstrip for a ten-million-dollar cartel bounty."}'::jsonb,
  'Co-Pilot Julian Drake drugged the captain to deliver the Senator for ten million dollars!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Flight attendant Maya used the crash axe to short the door circuit, allowing passengers to overpower Julian. Captain Harris was revived and the jet landed safely at an allied naval base."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Julian landed on the desert airstrip. Mercenaries extracted Senator Miller, and Julian disappeared into the Sahara with ten million dollars."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Aviation authorities ruled the flight lost over the ocean due to catastrophic structural failure. Julian lived under an alias in Europe."}]'::jsonb,
  '{"intros":["Flight 409 turned off its transponder, locked its cockpit armored door, and diverted toward an unmonitored desert airstrip.","Case file story_040: Flight 409 turned off its transponder, locked its cockpit armored door, and diverted toward an unmonitored desert airstrip. Look closely at every clue.","Trouble begins in Gulfstream G650 Private Jet, cruising at 41,000 feet over the stormy North Atlantic. Flight 409 turned off its transponder, locked its cockpit armored door, and diverted toward an unmonitored desert airstrip.","The mystery starts now. Flight 409 turned off its transponder, locked its cockpit armored door, and diverted toward an unmonitored desert airstrip. Can you solve it?"],"reveals":["Co-Pilot Julian Drake drugged the captain to deliver the Senator for ten million dollars!","The mystery is unraveled! Co-Pilot Julian Drake drugged the captain to deliver the Senator for ten million dollars!","At last, the truth comes out: Co-Pilot Julian Drake drugged the captain to deliver the Senator for ten million dollars!","Case resolved! Here is what happened: Co-Pilot Julian Drake drugged the captain to deliver the Senator for ten million dollars!"],"hints":["Pay attention to where Co-Pilot Julian Drake was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_040';
DELETE FROM public.case_events WHERE case_id = 'story_040';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a4bcc793-2efe-5173-9d3c-ca3998c92f51',
  'story_040',
  'Julian Drake',
  'First Officer (Co-Pilot)',
  'Cold, precise, aviator sunglasses, checking fuel burn calculations calmly',
  'We had a total electrical generator trip. I am navigating manually through the storm.',
  'Received a ten-million-dollar offshore wire transfer from an international cartel.',
  'Locked alone inside the cockpit controls',
  'Flying the private jet carrying VIP whistleblower Senator Miller',
  'The armored cockpit door cannot be breached without military-grade explosives.',
  'Did not know the passenger cabin had a secondary analog emergency radio.',
  '👨‍✈️',
  '["We had a total electrical generator trip. I am navigating manually through the storm.","\"We had a total electrical generator trip. I am navigating manually through the storm.\"","Listen to me: We had a total electrical generator trip. I am navigating manually through the storm.","I tell you the truth: We had a total electrical generator trip. I am navigating manually through the storm."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f27d5c0f-0627-5c34-b2fa-4dbc28166b24',
  'story_040',
  'Captain Robert Harris',
  'Chief Flight Captain',
  'Veteran military aviator, unconscious in the left command seat',
  'Victim unconscious; snoring heavily with shallow breathing in his seat harness.',
  'He noticed Julian checking strange navigational coordinates before takeoff.',
  'Unconscious in the captain’s seat',
  'Commander of Flight 409',
  'His thermos coffee tasted unusually sweet and metallic.',
  'Did not react fast enough to Julian’s sedative poisoning.',
  '✈️',
  '["Victim unconscious; snoring heavily with shallow breathing in his seat harness.","\"Victim unconscious; snoring heavily with shallow breathing in his seat harness.\"","Listen to me: Victim unconscious; snoring heavily with shallow breathing in his seat harness.","I tell you the truth: Victim unconscious; snoring heavily with shallow breathing in his seat harness."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'cf343ebf-8ff8-5395-a2ec-74ca82cfb458',
  'story_040',
  'Senator Thomas Miller',
  'VIP Whistleblower Passenger',
  'High-profile, terrified, wearing a tailored suit and life vest',
  'The flight map screen switched off and the cabin altitude display stopped updating!',
  'Carried a military flash drive exposing illegal offshore arms sales.',
  'Pacing the main passenger cabin at 41,000 feet',
  'The high-value extraction target Julian was hired to deliver',
  'Saw Julian pour liquid from a brown dropper into the captain’s thermos.',
  'Could not break through the reinforced ballistic cockpit door.',
  '🏛️',
  '["The flight map screen switched off and the cabin altitude display stopped updating!","\"The flight map screen switched off and the cabin altitude display stopped updating!\"","Listen to me: The flight map screen switched off and the cabin altitude display stopped updating!","I tell you the truth: The flight map screen switched off and the cabin altitude display stopped updating!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '29de5826-674c-53d2-a3fd-4b8f7ea88bbf',
  'story_040',
  'Flight Attendant Maya Lin',
  'Lead Cabin Crew',
  'Resourceful, alert, trained in emergency aviation procedures',
  'The cockpit access chime won’t engage. The deadbolt toggle was switched to LOCK.',
  'She has the emergency mechanical override key code in her flight manual.',
  'In the forward galley holding a fire axe',
  'Managing the passenger cabin safety',
  'The forward emergency axe can bypass the cockpit electrical circuit.',
  'Did not know Julian had armed the flight deck escape hatch.',
  '👩‍✈️',
  '["The cockpit access chime won’t engage. The deadbolt toggle was switched to LOCK.","\"The cockpit access chime won’t engage. The deadbolt toggle was switched to LOCK.\"","Listen to me: The cockpit access chime won’t engage. The deadbolt toggle was switched to LOCK.","I tell you the truth: The cockpit access chime won’t engage. The deadbolt toggle was switched to LOCK."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '38424696-98f0-5b9e-a10b-12ea50bcabc3',
  'story_040',
  'ev_1',
  1,
  '10:40 PM',
  'The cockpit transponder switch is set to "OFF", disappearing from civilian radar.',
  'The cockpit transponder switch is set to "OFF", disappearing from civilian radar.',
  'The pilot deliberately went dark to evade international air traffic tracking.',
  'Transponder Unit',
  'Avionics transponder panel with Mode-C toggle switched to OFF.',
  '["GPS Screen","Altimeter","Radar Screen"]'::jsonb,
  'Transponder Unit',
  '["transponder unit","transponder","radio","avionics"]'::jsonb,
  'An airplane electronic device that broadcasts flight position and altitude to radar.',
  'ev_2',
  true,
  '{"descriptions":["The cockpit transponder switch is set to \"OFF\", disappearing from civilian radar.","At 10:40 PM: The cockpit transponder switch is set to \"OFF\", disappearing from civilian radar.","Notice this clue: The cockpit transponder switch is set to \"OFF\", disappearing from civilian radar."],"hints":["An airplane electronic device that broadcasts flight position and altitude to radar.","Clue hint: Think about transponder unit.","Search for: the pilot deliberately went dark to evade international air traffic tracking."],"clues":["Transponder Unit","Item: Transponder Unit","Clue Word: Transponder Unit"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a32e1618-0a5e-56cb-b3df-d563583f3911',
  'story_040',
  'ev_2',
  2,
  '10:42 PM',
  'An empty 10ml glass dropper bottle of liquid Midazolam is hidden in the chart pocket.',
  'An empty 10ml glass dropper bottle of liquid Midazolam is hidden in the chart pocket.',
  'The captain was knocked out with a fast-acting surgical sedative.',
  'Sedative Dropper Bottle',
  'Amber medicine vial labeled "Midazolam 5mg/ml - Sedative".',
  '["Eye Drops","Nose Spray","Insulin Pen"]'::jsonb,
  'Sedative Dropper Bottle',
  '["sedative dropper bottle","dropper","sedative bottle","bottle","medicine bottle"]'::jsonb,
  'A small glass bottle with a rubber dropper used to administer liquid medicine.',
  'ev_3',
  false,
  '{"descriptions":["An empty 10ml glass dropper bottle of liquid Midazolam is hidden in the chart pocket.","At 10:42 PM: An empty 10ml glass dropper bottle of liquid Midazolam is hidden in the chart pocket.","Notice this clue: An empty 10ml glass dropper bottle of liquid Midazolam is hidden in the chart pocket."],"hints":["A small glass bottle with a rubber dropper used to administer liquid medicine.","Clue hint: Think about sedative dropper bottle.","Search for: the captain was knocked out with a fast-acting surgical sedative."],"clues":["Sedative Dropper Bottle","Item: Sedative Dropper Bottle","Clue Word: Sedative Dropper Bottle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6749c566-72e9-54c5-b145-0b3f3aba7922',
  'story_040',
  'ev_3',
  3,
  '10:45 PM',
  'The reinforced Kevlar-and-steel cockpit door is deadbolted from the flight deck.',
  'The reinforced Kevlar-and-steel cockpit door is deadbolted from the flight deck.',
  'Cabin crew and passengers were physically locked out of the flight controls.',
  'Armored Cockpit Door',
  'Ballistic cockpit door with mechanical lock toggle engaged.',
  '["Cabin Door","Luggage Hatch","Restroom Door"]'::jsonb,
  'Armored Cockpit Door',
  '["armored cockpit door","door","cockpit door","armored door","cabin door"]'::jsonb,
  'A bulletproof security door that separates pilots from passengers on airplanes.',
  'ev_4',
  false,
  '{"descriptions":["The reinforced Kevlar-and-steel cockpit door is deadbolted from the flight deck.","At 10:45 PM: The reinforced Kevlar-and-steel cockpit door is deadbolted from the flight deck.","Notice this clue: The reinforced Kevlar-and-steel cockpit door is deadbolted from the flight deck."],"hints":["A bulletproof security door that separates pilots from passengers on airplanes.","Clue hint: Think about armored cockpit door.","Search for: cabin crew and passengers were physically locked out of the flight controls."],"clues":["Armored Cockpit Door","Item: Armored Cockpit Door","Clue Word: Armored Cockpit Door"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3f1382b3-033a-532f-8ffb-b52a6236c6b3',
  'story_040',
  'ev_4',
  4,
  '10:50 PM',
  'The flight management computer displays new waypoints leading to an abandoned desert runway.',
  'The flight management computer displays new waypoints leading to an abandoned desert runway.',
  'The jet was reprogrammed to land in an unmonitored Sahara landing strip.',
  'Flight Computer Route',
  'FMS screen showing coordinates for "Airstrip Alpha - Algeria".',
  '["Weather Map","Engine Log","Fuel Gauge"]'::jsonb,
  'Flight Computer Route',
  '["flight computer route","route","flight route","computer route","flight computer","fms"]'::jsonb,
  'An aviation computer screen that plots the automatic flying path of a jet.',
  'ev_5',
  false,
  '{"descriptions":["The flight management computer displays new waypoints leading to an abandoned desert runway.","At 10:50 PM: The flight management computer displays new waypoints leading to an abandoned desert runway.","Notice this clue: The flight management computer displays new waypoints leading to an abandoned desert runway."],"hints":["An aviation computer screen that plots the automatic flying path of a jet.","Clue hint: Think about flight computer route.","Search for: the jet was reprogrammed to land in an unmonitored sahara landing strip."],"clues":["Flight Computer Route","Item: Flight Computer Route","Clue Word: Flight Computer Route"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '627033ca-cbcb-5e40-b0a2-1ce6ac8faa2c',
  'story_040',
  'ev_5',
  5,
  '11:00 PM',
  'An emergency fire crash axe from the galley is used to pry open the electrical panel.',
  'An emergency fire crash axe from the galley is used to pry open the electrical panel.',
  'The crew attempted to cut the cockpit door lock power manually.',
  'Emergency Crash Axe',
  'Insulated red steel rescue axe with chipped fiberglass handle.',
  '["Crowbar","Wrench","Hammer"]'::jsonb,
  'Emergency Crash Axe',
  '["emergency crash axe","axe","crash axe","emergency axe","fire axe"]'::jsonb,
  'A heavy red-handled cutting tool kept on airplanes for emergency escapes.',
  'ev_6',
  true,
  '{"descriptions":["An emergency fire crash axe from the galley is used to pry open the electrical panel.","At 11:00 PM: An emergency fire crash axe from the galley is used to pry open the electrical panel.","Notice this clue: An emergency fire crash axe from the galley is used to pry open the electrical panel."],"hints":["A heavy red-handled cutting tool kept on airplanes for emergency escapes.","Clue hint: Think about emergency crash axe.","Search for: the crew attempted to cut the cockpit door lock power manually."],"clues":["Emergency Crash Axe","Item: Emergency Crash Axe","Clue Word: Emergency Crash Axe"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f41b048d-9b54-56f1-9025-b78d5b1fc4c6',
  'story_040',
  'ev_6',
  6,
  '11:10 PM',
  'A satellite phone receipt showing encrypted calls to a Geneva broker is in Julian’s bag.',
  'A satellite phone receipt showing encrypted calls to a Geneva broker is in Julian’s bag.',
  'Julian confirmed the delivery of Senator Miller for ten million dollars.',
  'Satellite Phone Log',
  'Iridium satellite communication printout confirming transfer payment.',
  '["Newspaper","Boarding Pass","Passport"]'::jsonb,
  'Satellite Phone Log',
  '["satellite phone log","phone log","satellite log","log","call log"]'::jsonb,
  'A printed paper record showing phone calls made via space satellites.',
  'ev_7',
  false,
  '{"descriptions":["A satellite phone receipt showing encrypted calls to a Geneva broker is in Julian’s bag.","At 11:10 PM: A satellite phone receipt showing encrypted calls to a Geneva broker is in Julian’s bag.","Notice this clue: A satellite phone receipt showing encrypted calls to a Geneva broker is in Julian’s bag."],"hints":["A printed paper record showing phone calls made via space satellites.","Clue hint: Think about satellite phone log.","Search for: julian confirmed the delivery of senator miller for ten million dollars."],"clues":["Satellite Phone Log","Item: Satellite Phone Log","Clue Word: Satellite Phone Log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '47f39812-6587-51e8-9c83-b53eda56292d',
  'story_040',
  'ev_7',
  7,
  '11:20 PM',
  'Captain Harris’s stainless steel coffee thermos smells of sweet chemical residue.',
  'Captain Harris’s stainless steel coffee thermos smells of sweet chemical residue.',
  'The sedative was mixed into the captain’s hot black coffee.',
  'Coffee Thermos',
  'Vacuum-insulated steel flask containing coffee laced with benzodiazepine.',
  '["Water Bottle","Coffee Cup","Soda Can"]'::jsonb,
  'Coffee Thermos',
  '["coffee thermos","thermos","flask","coffee flask"]'::jsonb,
  'A metal insulated bottle that keeps coffee or tea steaming hot.',
  'ev_8',
  false,
  '{"descriptions":["Captain Harris’s stainless steel coffee thermos smells of sweet chemical residue.","At 11:20 PM: Captain Harris’s stainless steel coffee thermos smells of sweet chemical residue.","Notice this clue: Captain Harris’s stainless steel coffee thermos smells of sweet chemical residue."],"hints":["A metal insulated bottle that keeps coffee or tea steaming hot.","Clue hint: Think about coffee thermos.","Search for: the sedative was mixed into the captain’s hot black coffee."],"clues":["Coffee Thermos","Item: Coffee Thermos","Clue Word: Coffee Thermos"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '728d9d52-3d61-5cfe-8469-0c4f2949bd11',
  'story_040',
  'ev_8',
  8,
  '11:30 PM',
  'Cabin altitude warning horn blares as the jet rapidly descends through cloud layers.',
  'Cabin altitude warning horn blares as the jet rapidly descends through cloud layers.',
  'Julian dropped altitude to evade military radar intercepts.',
  'Altitude Warning Horn',
  'Cockpit annunciator speaker sounding rapid intermittent warning chimes.',
  '["Fire Alarm","Radio Siren","Doorbell"]'::jsonb,
  'Altitude Warning Horn',
  '["altitude warning horn","horn","warning horn","altitude horn","alarm"]'::jsonb,
  'A loud buzzer or horn in an airplane cockpit warning that the plane is too low.',
  NULL,
  true,
  '{"descriptions":["Cabin altitude warning horn blares as the jet rapidly descends through cloud layers.","At 11:30 PM: Cabin altitude warning horn blares as the jet rapidly descends through cloud layers.","Notice this clue: Cabin altitude warning horn blares as the jet rapidly descends through cloud layers."],"hints":["A loud buzzer or horn in an airplane cockpit warning that the plane is too low.","Clue hint: Think about altitude warning horn.","Search for: julian dropped altitude to evade military radar intercepts."],"clues":["Altitude Warning Horn","Item: Altitude Warning Horn","Clue Word: Altitude Warning Horn"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_041 — THE SNIPER'S RED DOT
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_041',
  'The Sniper''s Red Dot',
  'Thriller',
  'The International Peace Summit, Grand Hotel Ballroom, bulletproof glass facade overlooking the city square',
  'A red laser dot danced across the diplomat’s chest three seconds before a high-caliber round cracked the armored window.',
  '[{"name":"Marcus Cole","role":"Disgraced Elite Marksman","alibi":"Claims he was in a noisy steakhouse booth","avatar":"🎯"},{"name":"Ambassador David Vance","role":"Peace Treaty Negotiator","alibi":"At the podium delivering the peace treaty address","avatar":"🏛️"},{"name":"Agent Rachel Reed","role":"Diplomatic Protection Commander","alibi":"Shielding the ambassador on stage with body armor","avatar":"🛡️"},{"name":"Inspector Thomas Bell","role":"Ballistics Specialist","alibi":"Dispatched to the ballroom floor within four minutes of the shot","avatar":"🔍"}]'::jsonb,
  'Former elite marksman Marcus Cole set up a customized sniper rifle in the belfry of Old St. Jude Clock Tower. Using an infrared laser scope and tungsten armor-piercing ammunition, he targeted the diplomat through the reinforced hotel glass to shatter the peace summit.',
  'Sniper Captain Marcus Cole',
  'Marcus was hired by a defense contractor to derail the peace treaty and keep arms sales flowing.',
  '[{"time":"07:30 PM","event":"Marcus Cole carries a cello hardcase into the abandoned clock tower."},{"time":"08:10 PM","event":"Marcus mounts a .338 sniper rifle on the bell tower window ledge."},{"time":"08:29 PM","event":"A red laser sight targets the diplomat’s chest through the ballroom glass."},{"time":"08:30 PM","event":"The heavy rifle fires; the bullet spiderwebs the reinforced hotel window."},{"time":"08:35 PM","event":"Marcus packs the rifle and descends through the clock tower fire escape."}]'::jsonb,
  '[{"id":"ev1","title":"Ballistic Trajectory Line","detail":"Proves the sniper shot originated from the Old St. Jude Clock Tower belfry."},{"id":"ev2","title":".338 Lapua Casing with Marcus’s DNA","detail":"Recovered from the belfry floorboards with primer residue."},{"id":"ev3","title":"Cello Case with Gun Cutouts","detail":"Carried by Marcus Cole into the clock tower thirty minutes before the shot."},{"id":"ev4","title":"Tungsten Armor-Piercing Slug","detail":"Exotic military munition matched to Marcus’s specialized rifle barrel."}]'::jsonb,
  '[{"order":1,"title":"Red Laser Dot","text":"Targeting beam seen on the diplomat’s chest seconds before the rifle fired."},{"order":2,"title":"Spiderwebbed Glass","text":"Reinforced ballistic window cracked by a heavy armor-piercing bullet."},{"order":3,"title":"Spent Brass Casing","text":"Large military rifle casing dropped on the clock tower floor."},{"order":4,"title":"Cello Case","text":"Musical instrument case hollowed out to conceal a sniper rifle."},{"order":5,"title":"Tungsten Bullet Slug","text":"High-density military metal core extracted from the glass crater."},{"order":6,"title":"Down Payment Slip","text":"Financial proof of a million-dollar contract to derail the peace summit."}]'::jsonb,
  'Street protestors were throwing red flare fireworks.: Loud noise, but no firearms were present in the plaza crowd.; Hotel guard had gun oil on his hands.: Routine maintenance of his sidearm earlier in the morning.',
  'Claim an angry protestor in the street fired the shot or blame the hotel security guard.',
  'NORMAL',
  'Who fired the sniper rifle from five hundred yards away and how did they bypass security checkpoints?',
  '[{"character":"Marcus Cole","secret":"He hid a disassembled precision rifle in his cello hardcase."},{"character":"Ambassador David Vance","secret":"He was warned by intelligence services of an imminent assassination attempt."},{"character":"Agent Rachel Reed","secret":"She personally ordered the reinforced ballistic glass installation yesterday."},{"character":"Inspector Thomas Bell","secret":"Studied Marcus Cole’s military shooting records years ago."}]'::jsonb,
  '[{"lead":"Street protestors were throwing red flare fireworks.","explanation":"Loud noise, but no firearms were present in the plaza crowd."},{"lead":"Hotel guard had gun oil on his hands.","explanation":"Routine maintenance of his sidearm earlier in the morning."}]'::jsonb,
  '{"wrongTheories":["An angry protestor in the plaza fired a handgun into the hotel window.","A ricochet from a police sidearm accidentally struck the presidential suite."],"correctTheory":"Sniper Marcus Cole set up a .338 rifle in the clock tower, targeted the diplomat with a red laser, and fired a tungsten armor-piercing round through the ballistic glass to disrupt the peace treaty for a million-dollar bounty."}'::jsonb,
  'Sniper Marcus Cole fired from the clock tower to derail the peace treaty!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Counter-sniper units intercepted Marcus Cole as he fled down the clock tower alley with the cello case. The rifle was seized and Marcus was convicted of attempted assassination."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Police blamed a chaotic protest in the square. Marcus collected his million-dollar fee, the peace treaty collapsed, and war resumed."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The incident was suppressed as a structural glass stress fracture. Marcus remained the world’s most elusive ghost mercenary."}]'::jsonb,
  '{"intros":["A red laser dot danced across the diplomat’s chest three seconds before a high-caliber round cracked the armored window.","Case file story_041: A red laser dot danced across the diplomat’s chest three seconds before a high-caliber round cracked the armored window. Look closely at every clue.","Trouble begins in The International Peace Summit, Grand Hotel Ballroom, bulletproof glass facade overlooking the city square. A red laser dot danced across the diplomat’s chest three seconds before a high-caliber round cracked the armored window.","The mystery starts now. A red laser dot danced across the diplomat’s chest three seconds before a high-caliber round cracked the armored window. Can you solve it?"],"reveals":["Sniper Marcus Cole fired from the clock tower to derail the peace treaty!","The mystery is unraveled! Sniper Marcus Cole fired from the clock tower to derail the peace treaty!","At last, the truth comes out: Sniper Marcus Cole fired from the clock tower to derail the peace treaty!","Case resolved! Here is what happened: Sniper Marcus Cole fired from the clock tower to derail the peace treaty!"],"hints":["Pay attention to where Sniper Captain Marcus Cole was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_041';
DELETE FROM public.case_events WHERE case_id = 'story_041';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0374ace9-df50-5b3a-889b-404b701e72f2',
  'story_041',
  'Marcus Cole',
  'Disgraced Elite Marksman',
  'Cold, steady hands, scarred jawline, wearing dark tactical windbreaker',
  'I was having dinner at the steakhouse four blocks north when the sirens went off.',
  'He hid a disassembled precision rifle in his cello hardcase.',
  'Claims he was in a noisy steakhouse booth',
  'Hired assassin contracted to assassinate Ambassador Vance',
  'The hotel glass is rated up to .308 caliber, but fails against heavy tungsten rounds.',
  'Did not know the thermal wind sensor in the clock tower recorded his rifle blast.',
  '🎯',
  '["I was having dinner at the steakhouse four blocks north when the sirens went off.","\"I was having dinner at the steakhouse four blocks north when the sirens went off.\"","Listen to me: I was having dinner at the steakhouse four blocks north when the sirens went off.","I tell you the truth: I was having dinner at the steakhouse four blocks north when the sirens went off."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'dc82b134-4f09-57f1-987b-349359b0b82c',
  'story_041',
  'Ambassador David Vance',
  'Peace Treaty Negotiator',
  'Dignified, courageous, wearing a formal suit with the treaty medal',
  'Victim survived behind cracked glass; stated: "The red dot touched my lapel medal."',
  'He was warned by intelligence services of an imminent assassination attempt.',
  'At the podium delivering the peace treaty address',
  'Target of the sniper round',
  'The red laser originated from the high clock tower across the plaza.',
  'Did not know his own defense minister had signed the hit contract.',
  '🏛️',
  '["Victim survived behind cracked glass; stated: \"The red dot touched my lapel medal.\"","\"Victim survived behind cracked glass; stated: \"The red dot touched my lapel medal.\"\"","Listen to me: Victim survived behind cracked glass; stated: \"The red dot touched my lapel medal.\"","I tell you the truth: Victim survived behind cracked glass; stated: \"The red dot touched my lapel medal.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8f6d3955-1b3e-52f2-8ce3-a05d249e19dc',
  'story_041',
  'Agent Rachel Reed',
  'Diplomatic Protection Commander',
  'Fierce, decisive, carrying a submachine gun and tactical radio',
  'Get down! Sniper fire from bearing two-eight-zero, high elevation!',
  'She personally ordered the reinforced ballistic glass installation yesterday.',
  'Shielding the ambassador on stage with body armor',
  'Leader of the diplomatic counter-sniper team',
  'The bullet shattered the outer laminate layer of the four-inch bulletproof glass.',
  'Did not expect the shooter to use heavy armor-piercing tungsten core ammunition.',
  '🛡️',
  '["Get down! Sniper fire from bearing two-eight-zero, high elevation!","\"Get down! Sniper fire from bearing two-eight-zero, high elevation!\"","Listen to me: Get down! Sniper fire from bearing two-eight-zero, high elevation!","I tell you the truth: Get down! Sniper fire from bearing two-eight-zero, high elevation!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9a58ba49-a206-52d9-96f4-6a23011aa4a8',
  'story_041',
  'Inspector Thomas Bell',
  'Ballistics Specialist',
  'Clinical, carries laser trajectory rods and magnifying calipers',
  'The angle of entry proves the shooter was perched 180 feet high in the clock tower belfry.',
  'Studied Marcus Cole’s military shooting records years ago.',
  'Dispatched to the ballroom floor within four minutes of the shot',
  'Leading the ballistic trajectory investigation',
  'Found gunpowder residue and a spent .338 Lapua cartridge in the belfry.',
  'Did not immediately intercept Marcus leaving the plaza perimeter.',
  '🔍',
  '["The angle of entry proves the shooter was perched 180 feet high in the clock tower belfry.","\"The angle of entry proves the shooter was perched 180 feet high in the clock tower belfry.\"","Listen to me: The angle of entry proves the shooter was perched 180 feet high in the clock tower belfry.","I tell you the truth: The angle of entry proves the shooter was perched 180 feet high in the clock tower belfry."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c3da45ec-fea5-582b-afc8-5e8bdcd49cb9',
  'story_041',
  'ev_1',
  1,
  '08:29 PM',
  'A bright red laser targeting dot paints a circle on the diplomat’s navy suit.',
  'A bright red laser targeting dot paints a circle on the diplomat’s navy suit.',
  'The assassin used a visible diode laser for rapid target acquisition in the dusk.',
  'Red Laser Dot',
  'Ballroom security footage showing a 650nm red laser point on the podium.',
  '["Camera Flash","Spotlight Beam","Reflected Sun"]'::jsonb,
  'Red Laser Dot',
  '["red laser dot","laser","red laser","laser dot","red dot","dot"]'::jsonb,
  'A tiny red glowing light beam used on weapon sights to aim bullets.',
  'ev_2',
  true,
  '{"descriptions":["A bright red laser targeting dot paints a circle on the diplomat’s navy suit.","At 08:29 PM: A bright red laser targeting dot paints a circle on the diplomat’s navy suit.","Notice this clue: A bright red laser targeting dot paints a circle on the diplomat’s navy suit."],"hints":["A tiny red glowing light beam used on weapon sights to aim bullets.","Clue hint: Think about red laser dot.","Search for: the assassin used a visible diode laser for rapid target acquisition in the dusk."],"clues":["Red Laser Dot","Item: Red Laser Dot","Clue Word: Red Laser Dot"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '33f3ba46-acf1-540a-b144-a3de892a51f7',
  'story_041',
  'ev_2',
  2,
  '08:30 PM',
  'A four-inch multi-layered bulletproof glass pane spiderwebs with deep impact fractures.',
  'A four-inch multi-layered bulletproof glass pane spiderwebs with deep impact fractures.',
  'The reinforced glass stopped the slug but was nearly penetrated by tungsten core.',
  'Spiderwebbed Glass',
  'Ballistic glass panel with heavy impact crater and copper jacket residue.',
  '["Shattered Window","Clean Hole","Mirror Crack"]'::jsonb,
  'Spiderwebbed Glass',
  '["spiderwebbed glass","glass","bulletproof glass","cracked glass","window"]'::jsonb,
  'Thick clear protective window glass cracked into white spiderweb patterns by a bullet.',
  'ev_3',
  false,
  '{"descriptions":["A four-inch multi-layered bulletproof glass pane spiderwebs with deep impact fractures.","At 08:30 PM: A four-inch multi-layered bulletproof glass pane spiderwebs with deep impact fractures.","Notice this clue: A four-inch multi-layered bulletproof glass pane spiderwebs with deep impact fractures."],"hints":["Thick clear protective window glass cracked into white spiderweb patterns by a bullet.","Clue hint: Think about spiderwebbed glass.","Search for: the reinforced glass stopped the slug but was nearly penetrated by tungsten core."],"clues":["Spiderwebbed Glass","Item: Spiderwebbed Glass","Clue Word: Spiderwebbed Glass"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '755a2b68-3bff-505e-8a78-a9a7bbe9566e',
  'story_041',
  'ev_3',
  3,
  '08:32 PM',
  'A spent .338 Lapua Magnum brass cartridge case sits on the belfry floorboards.',
  'A spent .338 Lapua Magnum brass cartridge case sits on the belfry floorboards.',
  'The rifle used was an elite long-range military sniper system.',
  'Spent Brass Casing',
  'Heavy bottleneck rifle cartridge stamped with military defense lot numbers.',
  '["Pistol Casing","Shotgun Shell","Bullet Slug"]'::jsonb,
  'Spent Brass Casing',
  '["spent brass casing","casing","cartridge","brass casing","spent casing","shell"]'::jsonb,
  'An empty metal cylinder left behind after a bullet is fired from a gun.',
  'ev_4',
  false,
  '{"descriptions":["A spent .338 Lapua Magnum brass cartridge case sits on the belfry floorboards.","At 08:32 PM: A spent .338 Lapua Magnum brass cartridge case sits on the belfry floorboards.","Notice this clue: A spent .338 Lapua Magnum brass cartridge case sits on the belfry floorboards."],"hints":["An empty metal cylinder left behind after a bullet is fired from a gun.","Clue hint: Think about spent brass casing.","Search for: the rifle used was an elite long-range military sniper system."],"clues":["Spent Brass Casing","Item: Spent Brass Casing","Clue Word: Spent Brass Casing"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5ec30a56-409f-5974-ae6f-e0aab4914ec1',
  'story_041',
  'ev_4',
  4,
  '08:35 PM',
  'A black carbon-fiber cello hardcase with molded foam interior is found in an alley.',
  'A black carbon-fiber cello hardcase with molded foam interior is found in an alley.',
  'Marcus carried the disassembled precision rifle inside a musical instrument case.',
  'Cello Case',
  'Carbon-fiber musical case with custom cutouts for a barrel, scope, and bipod.',
  '["Guitar Bag","Suitcase","Golf Bag"]'::jsonb,
  'Cello Case',
  '["cello case","case","instrument case","hardcase"]'::jsonb,
  'A large, hard, hourglass-shaped box used to carry a heavy string instrument.',
  'ev_5',
  false,
  '{"descriptions":["A black carbon-fiber cello hardcase with molded foam interior is found in an alley.","At 08:35 PM: A black carbon-fiber cello hardcase with molded foam interior is found in an alley.","Notice this clue: A black carbon-fiber cello hardcase with molded foam interior is found in an alley."],"hints":["A large, hard, hourglass-shaped box used to carry a heavy string instrument.","Clue hint: Think about cello case.","Search for: marcus carried the disassembled precision rifle inside a musical instrument case."],"clues":["Cello Case","Item: Cello Case","Clue Word: Cello Case"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fa581598-5e5e-5fe0-846a-07b47d9adc96',
  'story_041',
  'ev_5',
  5,
  '08:45 PM',
  'An armor-piercing tungsten core bullet slug is dug out from the laminate glass.',
  'An armor-piercing tungsten core bullet slug is dug out from the laminate glass.',
  'The high-density bullet was designed to penetrate armored vehicles and bunkers.',
  'Tungsten Bullet Slug',
  'Sharp tungsten-carbide core bullet measuring 250 grains.',
  '["Lead Bullet","Steel Pellet","Copper Shrapnel"]'::jsonb,
  'Tungsten Bullet Slug',
  '["tungsten bullet slug","bullet","slug","tungsten bullet","bullet slug"]'::jsonb,
  'The metal projectile fired from a rifle that strikes a target.',
  'ev_6',
  true,
  '{"descriptions":["An armor-piercing tungsten core bullet slug is dug out from the laminate glass.","At 08:45 PM: An armor-piercing tungsten core bullet slug is dug out from the laminate glass.","Notice this clue: An armor-piercing tungsten core bullet slug is dug out from the laminate glass."],"hints":["The metal projectile fired from a rifle that strikes a target.","Clue hint: Think about tungsten bullet slug.","Search for: the high-density bullet was designed to penetrate armored vehicles and bunkers."],"clues":["Tungsten Bullet Slug","Item: Tungsten Bullet Slug","Clue Word: Tungsten Bullet Slug"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3e4c55ee-9563-5945-96da-ee20fdf6e8e7',
  'story_041',
  'ev_6',
  6,
  '09:00 PM',
  'Ballistic trajectory laser rods project a direct line back to the clock tower belfry.',
  'Ballistic trajectory laser rods project a direct line back to the clock tower belfry.',
  'The exact firing position was confirmed at 182 feet elevation across the plaza.',
  'Trajectory Rod',
  'Fluorescent green laser trajectory line connecting window crater to the tower.',
  '["Ruler","Plumb Line","Measuring Tape"]'::jsonb,
  'Trajectory Rod',
  '["trajectory rod","trajectory","laser line","line"]'::jsonb,
  'A straight rod or laser beam used by detectives to show where a bullet flew from.',
  'ev_7',
  false,
  '{"descriptions":["Ballistic trajectory laser rods project a direct line back to the clock tower belfry.","At 09:00 PM: Ballistic trajectory laser rods project a direct line back to the clock tower belfry.","Notice this clue: Ballistic trajectory laser rods project a direct line back to the clock tower belfry."],"hints":["A straight rod or laser beam used by detectives to show where a bullet flew from.","Clue hint: Think about trajectory rod.","Search for: the exact firing position was confirmed at 182 feet elevation across the plaza."],"clues":["Trajectory Rod","Item: Trajectory Rod","Clue Word: Trajectory Rod"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd0face12-7bbd-592f-ae8f-b42b72ce30e2',
  'story_041',
  'ev_7',
  7,
  '09:15 PM',
  'A sniper bipod with rubber feet left black friction scuffs on the belfry sill.',
  'A sniper bipod with rubber feet left black friction scuffs on the belfry sill.',
  'The shooter rested the heavy rifle on the stone window ledge for stability.',
  'Bipod Scuff Marks',
  'Twin black rubber foot impressions on the historic stone sill.',
  '["Shoe Marks","Tool Scratches","Paint Drops"]'::jsonb,
  'Bipod Scuff Marks',
  '["bipod scuff marks","scuff marks","bipod marks","rubber marks","scuffs"]'::jsonb,
  'Black rubber skid marks left by the two metal legs of a rifle stand.',
  'ev_8',
  false,
  '{"descriptions":["A sniper bipod with rubber feet left black friction scuffs on the belfry sill.","At 09:15 PM: A sniper bipod with rubber feet left black friction scuffs on the belfry sill.","Notice this clue: A sniper bipod with rubber feet left black friction scuffs on the belfry sill."],"hints":["Black rubber skid marks left by the two metal legs of a rifle stand.","Clue hint: Think about bipod scuff marks.","Search for: the shooter rested the heavy rifle on the stone window ledge for stability."],"clues":["Bipod Scuff Marks","Item: Bipod Scuff Marks","Clue Word: Bipod Scuff Marks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dcca6fb1-cbcf-5e22-9c10-3529b105292f',
  'story_041',
  'ev_8',
  8,
  '09:30 PM',
  'An encrypted bank wire slip showing a one-million-dollar down payment is found in Marcus’s locker.',
  'An encrypted bank wire slip showing a one-million-dollar down payment is found in Marcus’s locker.',
  'Marcus was hired by an international arms conglomerate to keep border tensions high.',
  'Down Payment Slip',
  'Foreign banking receipt showing funds transferred to an offshore bearer account.',
  '["Receipt","Dinner Bill","Ticket"]'::jsonb,
  'Down Payment Slip',
  '["down payment slip","slip","payment slip","bank slip","wire slip"]'::jsonb,
  'A paper slip confirming a large cash deposit into a bank account.',
  NULL,
  true,
  '{"descriptions":["An encrypted bank wire slip showing a one-million-dollar down payment is found in Marcus’s locker.","At 09:30 PM: An encrypted bank wire slip showing a one-million-dollar down payment is found in Marcus’s locker.","Notice this clue: An encrypted bank wire slip showing a one-million-dollar down payment is found in Marcus’s locker."],"hints":["A paper slip confirming a large cash deposit into a bank account.","Clue hint: Think about down payment slip.","Search for: marcus was hired by an international arms conglomerate to keep border tensions high."],"clues":["Down Payment Slip","Item: Down Payment Slip","Clue Word: Down Payment Slip"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_042 — THE MIDNIGHT DAM BREAK
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_042',
  'The Midnight Dam Break',
  'Thriller',
  'Blackwood Hydroelectric Dam, towering concrete spillway over a misty river canyon, heavy rainstorm',
  'The massive emergency floodgate motor was remotely triggered at 2:00 AM, threatening to drown the valley town below.',
  '[{"name":"Greg Vance","role":"Dam Operations Supervisor","alibi":"In his pickup truck parked at the crest overlook","avatar":"🌊"},{"name":"David Ortiz","role":"Night Turbine Mechanic","alibi":"In the turbine room battling the rising water surge","avatar":"🔧"},{"name":"Mayor Thomas Sterling","role":"Valley Town Mayor","alibi":"At the town hall coordinating emergency fire trucks","avatar":"🏛️"},{"name":"Agent Kelly Vance","role":"Infrastructure Sabotage Investigator","alibi":"Arrived at the dam control crest during the torrential downpour","avatar":"🔍"}]'::jsonb,
  'Supervisor Greg Vance bypassed the dam safety interlocks using a mechanical bridge pin. Sitting in his truck with a laptop, he sent a remote command to open Spillway Gate 4, intending to flood the valley town so developers could buy the evacuated land for a luxury resort.',
  'Dam Operations Supervisor Greg Vance',
  'Greg was paid three million dollars by an industrial development firm that wanted the valley town evacuated permanently.',
  '[{"time":"01:15 AM","event":"Greg enters the turbine room and pulls the mechanical safety interlock pin."},{"time":"01:30 AM","event":"Greg mounts a Wi-Fi relay module onto the hydraulic winch motor."},{"time":"01:58 AM","event":"From his truck, Greg sends the digital trigger command: \"SPILLWAY 4 - FULL OPEN\"."},{"time":"02:00 AM","event":"Massive steel floodgates lift; roaring water pours into the canyon."},{"time":"02:15 AM","event":"Mechanic Ortiz and Agent Vance manually drop the emergency gate stop."}]'::jsonb,
  '[{"id":"ev1","title":"Removed Brass Bypass Pin","detail":"Found in the turbine pit with Greg Vance’s employee identification tag."},{"id":"ev2","title":"Remote Wi-Fi Relay on Motor","detail":"Paired directly to the laptop open on the dashboard of Greg’s truck."},{"id":"ev3","title":"Sliced Hydraulic Pressure Line","detail":"Proves intentional sabotage to prevent emergency manual gate closure."},{"id":"ev4","title":"Alpine Resort Development Contract","detail":"Confirms a three-million-dollar bounty for flooding the valley community."}]'::jsonb,
  '[{"order":1,"title":"Bypass Jumper Pin","text":"Brass security rod pulled from the winch drum to bypass safety interlocks."},{"order":2,"title":"Wi-Fi Relay Box","text":"Receiver mounted onto the winch motor to trigger the gate from afar."},{"order":3,"title":"Steel Floodgate","text":"50-ton barrier raised to unleash catastrophic river flooding."},{"order":4,"title":"Laptop Command Screen","text":"Computer log showing the open command was sent from Greg’s truck."},{"order":5,"title":"Cut Hydraulic Line","text":"Severed oil pressure hose disabling the manual release system."},{"order":6,"title":"Resort Development Contract","text":"Corporate agreement offering millions if the valley was evacuated."}]'::jsonb,
  'Lightning struck a transmission tower near the dam.: Caused electrical static, but the floodgate motor had isolated power.; Mechanic Ortiz had grease and oil on his hands.: He was desperately fighting to drop the emergency gate with a pry bar.',
  'Claim lightning struck the electrical motor or blame the environmental activist groups.',
  'NORMAL',
  'Who breached the dam control server and triggered the floodgates to open during the storm?',
  '[{"character":"Greg Vance","secret":"He negotiated a three-million-dollar offshore payout from resort developers."},{"character":"David Ortiz","secret":"He was fighting to shut the manual release valve before the water crested."},{"character":"Mayor Thomas Sterling","secret":"He rejected the resort developer’s buyout offer three times last month."},{"character":"Agent Kelly Vance","secret":"Investigated Greg Vance for corporate kickbacks two years prior."}]'::jsonb,
  '[{"lead":"Lightning struck a transmission tower near the dam.","explanation":"Caused electrical static, but the floodgate motor had isolated power."},{"lead":"Mechanic Ortiz had grease and oil on his hands.","explanation":"He was desperately fighting to drop the emergency gate with a pry bar."}]'::jsonb,
  '{"wrongTheories":["A massive lightning strike fried the dam computer and opened the gate automatically.","Radical environmentalists used explosives to breach the dam structure."],"correctTheory":"Dam Operations Supervisor Greg Vance pulled the safety pin, installed a Wi-Fi relay, and opened Spillway Gate 4 from his laptop to flood the valley town for a three-million-dollar resort developer payout."}'::jsonb,
  'Supervisor Greg Vance opened the floodgates for a three-million-dollar resort buyout!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Mechanic Ortiz dropped the gate with an emergency pry bar, averting the flood disaster. Agent Vance arrested Greg and exposed the corrupt resort developer."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The floodgate remained open. Water submerged the valley town, displacing five thousand residents. Greg collected his three-million-dollar payoff."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The disaster was blamed on extreme global climate weather. Greg resigned as an honorable hero who tried to help during a storm."}]'::jsonb,
  '{"intros":["The massive emergency floodgate motor was remotely triggered at 2:00 AM, threatening to drown the valley town below.","Case file story_042: The massive emergency floodgate motor was remotely triggered at 2:00 AM, threatening to drown the valley town below. Look closely at every clue.","Trouble begins in Blackwood Hydroelectric Dam, towering concrete spillway over a misty river canyon, heavy rainstorm. The massive emergency floodgate motor was remotely triggered at 2:00 AM, threatening to drown the valley town below.","The mystery starts now. The massive emergency floodgate motor was remotely triggered at 2:00 AM, threatening to drown the valley town below. Can you solve it?"],"reveals":["Supervisor Greg Vance opened the floodgates for a three-million-dollar resort buyout!","The mystery is unraveled! Supervisor Greg Vance opened the floodgates for a three-million-dollar resort buyout!","At last, the truth comes out: Supervisor Greg Vance opened the floodgates for a three-million-dollar resort buyout!","Case resolved! Here is what happened: Supervisor Greg Vance opened the floodgates for a three-million-dollar resort buyout!"],"hints":["Pay attention to where Dam Operations Supervisor Greg Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_042';
DELETE FROM public.case_events WHERE case_id = 'story_042';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '290f40c8-abc5-5cd8-ad93-739393738a01',
  'story_042',
  'Greg Vance',
  'Dam Operations Supervisor',
  'Greedy, arrogant, yellow rain slicker, carrying heavy industrial schematics',
  'The lightning storm caused a power surge that tripped the automated floodgate solenoids.',
  'He negotiated a three-million-dollar offshore payout from resort developers.',
  'In his pickup truck parked at the crest overlook',
  'Has administrative access over all hydraulic winch controls',
  'Gate 4 releases fifty thousand gallons per second into the sleeping valley.',
  'Did not know he dropped his custom brass bypass jumper pin in the turbine pit.',
  '🌊',
  '["The lightning storm caused a power surge that tripped the automated floodgate solenoids.","\"The lightning storm caused a power surge that tripped the automated floodgate solenoids.\"","Listen to me: The lightning storm caused a power surge that tripped the automated floodgate solenoids.","I tell you the truth: The lightning storm caused a power surge that tripped the automated floodgate solenoids."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0bad242d-ee68-55da-a511-6a95ea7d87b1',
  'story_042',
  'David Ortiz',
  'Night Turbine Mechanic',
  'Hardworking, drenched in rain, holding a massive pipe wrench',
  'Someone physically pulled the mechanical safety pins on the winch drum!',
  'He was fighting to shut the manual release valve before the water crested.',
  'In the turbine room battling the rising water surge',
  'Chief mechanic trying to manually drop the gate',
  'The hydraulic pressure line was severed to prevent manual closure.',
  'Did not know Greg had planted a remote receiver on the motor housing.',
  '🔧',
  '["Someone physically pulled the mechanical safety pins on the winch drum!","\"Someone physically pulled the mechanical safety pins on the winch drum!\"","Listen to me: Someone physically pulled the mechanical safety pins on the winch drum!","I tell you the truth: Someone physically pulled the mechanical safety pins on the winch drum!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4614e7eb-bde7-5c95-beab-fc2b563dfece',
  'story_042',
  'Mayor Thomas Sterling',
  'Valley Town Mayor',
  'Frantic, on the radio demanding emergency sirens sound in the town',
  'We have twenty minutes before the river walls fail! Sound the valley evacuation sirens!',
  'He rejected the resort developer’s buyout offer three times last month.',
  'At the town hall coordinating emergency fire trucks',
  'Leader of the community threatened by the catastrophic flood',
  'The valley land would be condemned if the flood crest reached twelve feet.',
  'Did not know the dam supervisor was on the developer’s payroll.',
  '🏛️',
  '["We have twenty minutes before the river walls fail! Sound the valley evacuation sirens!","\"We have twenty minutes before the river walls fail! Sound the valley evacuation sirens!\"","Listen to me: We have twenty minutes before the river walls fail! Sound the valley evacuation sirens!","I tell you the truth: We have twenty minutes before the river walls fail! Sound the valley evacuation sirens!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7a1ef0cb-457b-5e56-88fc-795fb3aee40b',
  'story_042',
  'Agent Kelly Vance',
  'Infrastructure Sabotage Investigator',
  'Sharp, relentless, armed with signal analyzers and tactical boots',
  'Lightning strikes blow fuses; they do not neatly bypass mechanical interlock pins.',
  'Investigated Greg Vance for corporate kickbacks two years prior.',
  'Arrived at the dam control crest during the torrential downpour',
  'Investigating high-risk critical infrastructure sabotage',
  'Found a long-range Wi-Fi bridge broadcasting from Greg’s pickup truck.',
  'Did not immediately know the manual brake could be tripped with an emergency pry bar.',
  '🔍',
  '["Lightning strikes blow fuses; they do not neatly bypass mechanical interlock pins.","\"Lightning strikes blow fuses; they do not neatly bypass mechanical interlock pins.\"","Listen to me: Lightning strikes blow fuses; they do not neatly bypass mechanical interlock pins.","I tell you the truth: Lightning strikes blow fuses; they do not neatly bypass mechanical interlock pins."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0fe6c98e-1b12-583c-a00c-0e8ddb5977a4',
  'story_042',
  'ev_1',
  1,
  '01:15 AM',
  'A heavy brass mechanical bypass pin is removed from the winch drum.',
  'A heavy brass mechanical bypass pin is removed from the winch drum.',
  'The safety lock that prevents accidental gate opening was deliberately removed.',
  'Bypass Jumper Pin',
  'Hardened brass lock pin with Greg Vance’s employee identification number.',
  '["Bolt","Nail","Screw"]'::jsonb,
  'Bypass Jumper Pin',
  '["bypass jumper pin","pin","bypass pin","jumper pin","brass pin"]'::jsonb,
  'A thick metal rod used to lock industrial gears so they cannot move.',
  'ev_2',
  true,
  '{"descriptions":["A heavy brass mechanical bypass pin is removed from the winch drum.","At 01:15 AM: A heavy brass mechanical bypass pin is removed from the winch drum.","Notice this clue: A heavy brass mechanical bypass pin is removed from the winch drum."],"hints":["A thick metal rod used to lock industrial gears so they cannot move.","Clue hint: Think about bypass jumper pin.","Search for: the safety lock that prevents accidental gate opening was deliberately removed."],"clues":["Bypass Jumper Pin","Item: Bypass Jumper Pin","Clue Word: Bypass Jumper Pin"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2bb79c56-a570-5031-ab19-c5f728c5da1b',
  'story_042',
  'ev_2',
  2,
  '01:30 AM',
  'A black weatherproof Wi-Fi relay box is magnetic-mounted to the winch motor.',
  'A black weatherproof Wi-Fi relay box is magnetic-mounted to the winch motor.',
  'The gate was opened using wireless remote control signals from outside.',
  'Wi-Fi Relay Box',
  'Small black plastic electronic receiver wired to the hydraulic solenoid.',
  '["Radio","Battery Pack","Camera"]'::jsonb,
  'Wi-Fi Relay Box',
  '["wi-fi relay box","relay","wifi relay","relay box","receiver"]'::jsonb,
  'A small electronic box that receives internet signals to turn machines on and off.',
  'ev_3',
  false,
  '{"descriptions":["A black weatherproof Wi-Fi relay box is magnetic-mounted to the winch motor.","At 01:30 AM: A black weatherproof Wi-Fi relay box is magnetic-mounted to the winch motor.","Notice this clue: A black weatherproof Wi-Fi relay box is magnetic-mounted to the winch motor."],"hints":["A small electronic box that receives internet signals to turn machines on and off.","Clue hint: Think about wi-fi relay box.","Search for: the gate was opened using wireless remote control signals from outside."],"clues":["Wi-Fi Relay Box","Item: Wi-Fi Relay Box","Clue Word: Wi-Fi Relay Box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd0ed66bb-4684-58cc-89f3-09826e3bbdd5',
  'story_042',
  'ev_3',
  3,
  '02:00 AM',
  'The massive 50-ton steel floodgate lifts twelve feet, releasing roaring rapids.',
  'The massive 50-ton steel floodgate lifts twelve feet, releasing roaring rapids.',
  'Spillway Gate 4 was discharging enough water to submerge the valley town.',
  'Steel Floodgate',
  'Massive iron barrier dripping with churning foam and river debris.',
  '["Dam Wall","Turbine Pipe","Bridge Rail"]'::jsonb,
  'Steel Floodgate',
  '["steel floodgate","gate","floodgate","steel gate","spillway gate"]'::jsonb,
  'A giant heavy metal wall raised and lowered to hold back reservoir water.',
  'ev_4',
  false,
  '{"descriptions":["The massive 50-ton steel floodgate lifts twelve feet, releasing roaring rapids.","At 02:00 AM: The massive 50-ton steel floodgate lifts twelve feet, releasing roaring rapids.","Notice this clue: The massive 50-ton steel floodgate lifts twelve feet, releasing roaring rapids."],"hints":["A giant heavy metal wall raised and lowered to hold back reservoir water.","Clue hint: Think about steel floodgate.","Search for: spillway gate 4 was discharging enough water to submerge the valley town."],"clues":["Steel Floodgate","Item: Steel Floodgate","Clue Word: Steel Floodgate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3cf15520-ef7c-57b3-8591-f597ddeab575',
  'story_042',
  'ev_4',
  4,
  '02:05 AM',
  'A laptop in Greg’s pickup truck displays: "COMMAND SENT: GATE 4 - 100% OPEN".',
  'A laptop in Greg’s pickup truck displays: "COMMAND SENT: GATE 4 - 100% OPEN".',
  'The command was initiated from Greg’s personal computer dashboard.',
  'Laptop Command Screen',
  'Toughbook laptop displaying dam SCADA software logs.',
  '["Smartphone","Tablet","GPS Screen"]'::jsonb,
  'Laptop Command Screen',
  '["laptop command screen","laptop","screen","computer","command screen"]'::jsonb,
  'A portable clamshell computer showing software control screens.',
  'ev_5',
  false,
  '{"descriptions":["A laptop in Greg’s pickup truck displays: \"COMMAND SENT: GATE 4 - 100% OPEN\".","At 02:05 AM: A laptop in Greg’s pickup truck displays: \"COMMAND SENT: GATE 4 - 100% OPEN\".","Notice this clue: A laptop in Greg’s pickup truck displays: \"COMMAND SENT: GATE 4 - 100% OPEN\"."],"hints":["A portable clamshell computer showing software control screens.","Clue hint: Think about laptop command screen.","Search for: the command was initiated from greg’s personal computer dashboard."],"clues":["Laptop Command Screen","Item: Laptop Command Screen","Clue Word: Laptop Command Screen"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e8453217-e362-5552-9461-b3344492874e',
  'story_042',
  'ev_5',
  5,
  '02:10 AM',
  'A heavy hydraulic line was sliced with a hacksaw to prevent manual lowering.',
  'A heavy hydraulic line was sliced with a hacksaw to prevent manual lowering.',
  'The sabotage was designed to make it impossible to lower the gate by hand.',
  'Cut Hydraulic Line',
  'High-pressure reinforced rubber hose severed with clean saw cuts.',
  '["Electric Wire","Water Hose","Fuel Line"]'::jsonb,
  'Cut Hydraulic Line',
  '["cut hydraulic line","hydraulic line","line","hose","cut line"]'::jsonb,
  'A thick black rubber hose that carries oil under high pressure to move heavy machinery.',
  'ev_6',
  true,
  '{"descriptions":["A heavy hydraulic line was sliced with a hacksaw to prevent manual lowering.","At 02:10 AM: A heavy hydraulic line was sliced with a hacksaw to prevent manual lowering.","Notice this clue: A heavy hydraulic line was sliced with a hacksaw to prevent manual lowering."],"hints":["A thick black rubber hose that carries oil under high pressure to move heavy machinery.","Clue hint: Think about cut hydraulic line.","Search for: the sabotage was designed to make it impossible to lower the gate by hand."],"clues":["Cut Hydraulic Line","Item: Cut Hydraulic Line","Clue Word: Cut Hydraulic Line"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a167d220-cf99-55ad-88e2-1ee45a78fcd0',
  'story_042',
  'ev_6',
  6,
  '02:15 AM',
  'An emergency iron pry bar is wedged into the manual winch release dog by Ortiz.',
  'An emergency iron pry bar is wedged into the manual winch release dog by Ortiz.',
  'The mechanic jammed the gears to drop the 50-ton gate by gravity.',
  'Emergency Pry Bar',
  'Hexagonal steel crowbar bent under fifty tons of mechanical pressure.',
  '["Wrench","Hammer","Screwdriver"]'::jsonb,
  'Emergency Pry Bar',
  '["emergency pry bar","pry bar","crowbar","iron bar","bar"]'::jsonb,
  'A long heavy steel lever used to force machinery and gears.',
  'ev_7',
  false,
  '{"descriptions":["An emergency iron pry bar is wedged into the manual winch release dog by Ortiz.","At 02:15 AM: An emergency iron pry bar is wedged into the manual winch release dog by Ortiz.","Notice this clue: An emergency iron pry bar is wedged into the manual winch release dog by Ortiz."],"hints":["A long heavy steel lever used to force machinery and gears.","Clue hint: Think about emergency pry bar.","Search for: the mechanic jammed the gears to drop the 50-ton gate by gravity."],"clues":["Emergency Pry Bar","Item: Emergency Pry Bar","Clue Word: Emergency Pry Bar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2102affb-493c-5849-865e-6a80db5babce',
  'story_042',
  'ev_7',
  7,
  '02:30 AM',
  'A confidential contract from Alpine Resort Developers offering three million dollars is found.',
  'A confidential contract from Alpine Resort Developers offering three million dollars is found.',
  'Greg was promised millions once the town was evacuated and condemned.',
  'Resort Development Contract',
  'Legal document offering bonuses for valley land rezoning.',
  '["Dam Budget","Tax Form","Inspection Sheet"]'::jsonb,
  'Resort Development Contract',
  '["resort development contract","contract","resort contract","development contract","document"]'::jsonb,
  'A signed business agreement detailing multi-million-dollar land buyout terms.',
  'ev_8',
  false,
  '{"descriptions":["A confidential contract from Alpine Resort Developers offering three million dollars is found.","At 02:30 AM: A confidential contract from Alpine Resort Developers offering three million dollars is found.","Notice this clue: A confidential contract from Alpine Resort Developers offering three million dollars is found."],"hints":["A signed business agreement detailing multi-million-dollar land buyout terms.","Clue hint: Think about resort development contract.","Search for: greg was promised millions once the town was evacuated and condemned."],"clues":["Resort Development Contract","Item: Resort Development Contract","Clue Word: Resort Development Contract"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '81c746c6-5960-532e-a0cf-b5f1e248105d',
  'story_042',
  'ev_8',
  8,
  '02:45 AM',
  'Muddy work boots matching tracks on the winch catwalk are in Greg’s truck cab.',
  'Muddy work boots matching tracks on the winch catwalk are in Greg’s truck cab.',
  'Greg walked out onto the dangerous catwalk during the storm to plant the relay.',
  'Catwalk Boot Prints',
  'Heavy rubber lug-sole tread marks matching grease on the winch platform.',
  '["Shoe Marks","Bare Footprints","Tire Tracks"]'::jsonb,
  'Catwalk Boot Prints',
  '["catwalk boot prints","boot prints","boots","tracks","catwalk prints"]'::jsonb,
  'Marks left by heavy rubber work boots in wet grease and mud.',
  NULL,
  true,
  '{"descriptions":["Muddy work boots matching tracks on the winch catwalk are in Greg’s truck cab.","At 02:45 AM: Muddy work boots matching tracks on the winch catwalk are in Greg’s truck cab.","Notice this clue: Muddy work boots matching tracks on the winch catwalk are in Greg’s truck cab."],"hints":["Marks left by heavy rubber work boots in wet grease and mud.","Clue hint: Think about catwalk boot prints.","Search for: greg walked out onto the dangerous catwalk during the storm to plant the relay."],"clues":["Catwalk Boot Prints","Item: Catwalk Boot Prints","Clue Word: Catwalk Boot Prints"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_043 — ESCAPE FROM SECTOR 7
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_043',
  'Escape from Sector 7',
  'Thriller',
  'Blackwood Maximum Security Penitentiary, Sector 7 cellblock, iron catwalks and spotlight towers',
  'A high-profile cartel boss vanished from his solitary cell; the steel door was locked and a laundry chute grate was unscrewed from the inside.',
  '[{"name":"Silas Vance","role":"Prison Warden","alibi":"In his top-floor executive office reviewing security camera feeds","avatar":"🏛️"},{"name":"Hector \"El Toro\" Morales","role":"Cartel Boss (Escaped Inmate)","alibi":"Missing person","avatar":"👤"},{"name":"Toby Miller","role":"Perimeter Gate Guard","alibi":"At the outer vehicle sally port gate","avatar":"👮"},{"name":"Captain Rachel Reed","role":"State Tactical Fugitive Squad","alibi":"Arrived at the prison thirty minutes after the escape siren sounded","avatar":"🔍"}]'::jsonb,
  'Warden Silas Vance accepted a five-million-dollar bribe. He smuggled a specialized hexagonal wrench into Hector’s solitary cell inside a hollowed-out legal binder, allowing Hector to access the laundry chute where a delivery truck carried him out through the main gates.',
  'Warden Silas Vance',
  'Silas was paid five million dollars in offshore cryptocurrency to arrange Hector’s escape.',
  '[{"time":"09:00 PM","event":"Warden Vance delivers legal appeal papers to Hector’s solitary cell."},{"time":"10:45 PM","event":"Hector extracts the hidden wrench and unbolts the ventilation grate."},{"time":"11:15 PM","event":"Hector slides down the laundry chute into an industrial linen hamper."},{"time":"11:30 PM","event":"Laundry Truck 4 clears the main sally port with the Warden’s signed pass."},{"time":"11:45 PM","event":"Cell check reveals Hector is missing; prison sirens blare."}]'::jsonb,
  '[{"id":"ev1","title":"Hollow Legal Binder with Tool Cutout","detail":"Delivered directly to Hector by Warden Silas Vance during evening rounds."},{"id":"ev2","title":"Security Hex Wrench #18","detail":"Carries serial numbers matching the Warden’s executive maintenance inventory."},{"id":"ev3","title":"Warden’s Signed Gate Pass for Truck 4","detail":"Exempted the getaway vehicle from mandatory guard mirror inspections."},{"id":"ev4","title":"Five-Million-Dollar Crypto Wallet","detail":"Found in Silas’s private safe, linking him directly to the cartel payout."}]'::jsonb,
  '[{"order":1,"title":"Unbolted Air Grate","text":"Ceiling ventilation mesh unscrewed from the inside using an official tool."},{"order":2,"title":"Security Hex Wrench","text":"Prison maintenance tool smuggled into the cell to remove the grate."},{"order":3,"title":"Hollow Legal Binder","text":"Legal paperwork used to sneak the escape tools past cell guards."},{"order":4,"title":"Laundry Chute","text":"Metal slide used by the inmate to drop into the basement linen room."},{"order":5,"title":"Signed Gate Pass","text":"Warden’s signature clearing the laundry getaway truck through the gate."},{"order":6,"title":"Crypto Hardware Wallet","text":"Digital wallet holding five million dollars in cartel bribe tokens."}]'::jsonb,
  'Guard Toby failed to use the under-vehicle inspection mirror.: He was lazy in the rain, but had no idea the escape was happening.; A knotted bedsheet hung from the outer yard fence.: A decoy planted by accomplices to divert search dogs away from the road.',
  'Claim Hector escaped via a smuggled bedsheet rope or blame the night shift guard.',
  'NORMAL',
  'How did inmate Hector Morales escape a solitary cell surrounded by armed guards and razor wire?',
  '[{"character":"Silas Vance","secret":"Received five million dollars in cryptocurrency to clear the laundry truck."},{"character":"Hector \"El Toro\" Morales","secret":"Carried a GPS tracker sewn into his socks to rendezvous with a helicopter."},{"character":"Toby Miller","secret":"He failed to use the under-vehicle inspection mirror because it was raining."},{"character":"Captain Rachel Reed","secret":"Suspected corruption in the warden’s administration for over a year."}]'::jsonb,
  '[{"lead":"Guard Toby failed to use the under-vehicle inspection mirror.","explanation":"He was lazy in the rain, but had no idea the escape was happening."},{"lead":"A knotted bedsheet hung from the outer yard fence.","explanation":"A decoy planted by accomplices to divert search dogs away from the road."}]'::jsonb,
  '{"wrongTheories":["Hector scaled the fifty-foot outer wall using a knotted bedsheet grappling rope.","A drone blew a hole through the prison ceiling to airlift Hector away."],"correctTheory":"Warden Silas Vance accepted a five-million-dollar crypto bribe, smuggled a hex wrench inside a legal binder to Hector, and cleared the laundry truck through the gate so the cartel boss could escape."}'::jsonb,
  'Warden Silas Vance smuggled the escape wrench for a five-million-dollar bribe!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Captain Reed discovered the crypto wallet and the signed gate pass. Warden Silas Vance was arrested and Hector was intercepted at the airstrip."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Gate guard Toby was fired for negligence. Hector reached his private jet in Mexico, and Silas Vance retired to a tax haven with five million dollars."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The press reported a miraculous \"Houdini escape.\" Silas wrote a book on prison reform while spending his crypto fortune."}]'::jsonb,
  '{"intros":["A high-profile cartel boss vanished from his solitary cell; the steel door was locked and a laundry chute grate was unscrewed from the inside.","Case file story_043: A high-profile cartel boss vanished from his solitary cell; the steel door was locked and a laundry chute grate was unscrewed from the inside. Look closely at every clue.","Trouble begins in Blackwood Maximum Security Penitentiary, Sector 7 cellblock, iron catwalks and spotlight towers. A high-profile cartel boss vanished from his solitary cell; the steel door was locked and a laundry chute grate was unscrewed from the inside.","The mystery starts now. A high-profile cartel boss vanished from his solitary cell; the steel door was locked and a laundry chute grate was unscrewed from the inside. Can you solve it?"],"reveals":["Warden Silas Vance smuggled the escape wrench for a five-million-dollar bribe!","The mystery is unraveled! Warden Silas Vance smuggled the escape wrench for a five-million-dollar bribe!","At last, the truth comes out: Warden Silas Vance smuggled the escape wrench for a five-million-dollar bribe!","Case resolved! Here is what happened: Warden Silas Vance smuggled the escape wrench for a five-million-dollar bribe!"],"hints":["Pay attention to where Warden Silas Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_043';
DELETE FROM public.case_events WHERE case_id = 'story_043';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ab207897-3d75-5575-a66c-2251a6d6b7ec',
  'story_043',
  'Silas Vance',
  'Prison Warden',
  'Stern, authoritarian, crisp gray uniform, silver watch, unblinking eyes',
  'This facility has held for fifty years. Inmate Morales had outside terrorist assistance.',
  'Received five million dollars in cryptocurrency to clear the laundry truck.',
  'In his top-floor executive office reviewing security camera feeds',
  'Supreme authority over the entire prison facility',
  'The laundry chute leads directly into the basement linen sorting depot.',
  'Did not know Hector left the hollowed-out legal binder under his mattress.',
  '🏛️',
  '["This facility has held for fifty years. Inmate Morales had outside terrorist assistance.","\"This facility has held for fifty years. Inmate Morales had outside terrorist assistance.\"","Listen to me: This facility has held for fifty years. Inmate Morales had outside terrorist assistance.","I tell you the truth: This facility has held for fifty years. Inmate Morales had outside terrorist assistance."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'bcb297cf-7fbd-58b0-997a-f5ba12f9f032',
  'story_043',
  'Hector "El Toro" Morales',
  'Cartel Boss (Escaped Inmate)',
  'Ruthless, charismatic, tattooed arms, calculating intelligence',
  'Missing inmate; left his prison jumpsuit folded neatly on the concrete bench.',
  'Carried a GPS tracker sewn into his socks to rendezvous with a helicopter.',
  'Missing person',
  'Target of the prison break',
  'Warden Vance guaranteed the delivery truck would not be searched at the gate.',
  'Did not know guard Toby had spotted the laundry truck taillights speeding.',
  '👤',
  '["Missing inmate; left his prison jumpsuit folded neatly on the concrete bench.","\"Missing inmate; left his prison jumpsuit folded neatly on the concrete bench.\"","Listen to me: Missing inmate; left his prison jumpsuit folded neatly on the concrete bench.","I tell you the truth: Missing inmate; left his prison jumpsuit folded neatly on the concrete bench."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0a12c279-f1d0-54e1-b945-58a642d6710d',
  'story_043',
  'Toby Miller',
  'Perimeter Gate Guard',
  'Young, nervous, holding an M-16 rifle, standing at the gatehouse',
  'The Warden personally signed the gate pass for Laundry Truck 4 at 11:30 PM.',
  'He failed to use the under-vehicle inspection mirror because it was raining.',
  'At the outer vehicle sally port gate',
  'Guarding the final physical barrier out of the prison',
  'The laundry driver seemed nervous and did not turn off his engine.',
  'Did not know Hector was curled inside an industrial canvas hamper.',
  '👮',
  '["The Warden personally signed the gate pass for Laundry Truck 4 at 11:30 PM.","\"The Warden personally signed the gate pass for Laundry Truck 4 at 11:30 PM.\"","Listen to me: The Warden personally signed the gate pass for Laundry Truck 4 at 11:30 PM.","I tell you the truth: The Warden personally signed the gate pass for Laundry Truck 4 at 11:30 PM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '559fc2d8-a54d-567e-a412-a1f464583cf6',
  'story_043',
  'Captain Rachel Reed',
  'State Tactical Fugitive Squad',
  'Hardboiled, observant, examines cell walls with forensic lights',
  'Prisoners don’t unscrew titanium security grates with fingernails. Someone gave him the wrench.',
  'Suspected corruption in the warden’s administration for over a year.',
  'Arrived at the prison thirty minutes after the escape siren sounded',
  'Leading the manhunt for the escaped cartel kingpin',
  'Found prison tool-room inventory stamps on the discarded wrench.',
  'Did not immediately have access to Silas’s private crypto-hardware wallet.',
  '🔍',
  '["Prisoners don’t unscrew titanium security grates with fingernails. Someone gave him the wrench.","\"Prisoners don’t unscrew titanium security grates with fingernails. Someone gave him the wrench.\"","Listen to me: Prisoners don’t unscrew titanium security grates with fingernails. Someone gave him the wrench.","I tell you the truth: Prisoners don’t unscrew titanium security grates with fingernails. Someone gave him the wrench."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bcd87e6c-70bc-58a2-8fee-b0b5ac83ec18',
  'story_043',
  'ev_1',
  1,
  '10:45 PM',
  'A heavy steel ventilation grate is unbolted from the cell ceiling and tilted aside.',
  'A heavy steel ventilation grate is unbolted from the cell ceiling and tilted aside.',
  'The grate bolts were removed using an official maintenance hex wrench.',
  'Unbolted Air Grate',
  'Heavy security mesh grate with six stripped hexagonal machine bolts.',
  '["Broken Bars","Dug Tunnel","Smashed Window"]'::jsonb,
  'Unbolted Air Grate',
  '["unbolted air grate","grate","air grate","vent grate","ventilation grate"]'::jsonb,
  'A heavy metal grid covering an air pipe in the ceiling.',
  'ev_2',
  true,
  '{"descriptions":["A heavy steel ventilation grate is unbolted from the cell ceiling and tilted aside.","At 10:45 PM: A heavy steel ventilation grate is unbolted from the cell ceiling and tilted aside.","Notice this clue: A heavy steel ventilation grate is unbolted from the cell ceiling and tilted aside."],"hints":["A heavy metal grid covering an air pipe in the ceiling.","Clue hint: Think about unbolted air grate.","Search for: the grate bolts were removed using an official maintenance hex wrench."],"clues":["Unbolted Air Grate","Item: Unbolted Air Grate","Clue Word: Unbolted Air Grate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '797b22fc-2b92-502b-8cfa-a14ff8d83ca7',
  'story_043',
  'ev_2',
  2,
  '10:50 PM',
  'A specialized 8mm hexagonal security hex wrench is dropped inside the vent duct.',
  'A specialized 8mm hexagonal security hex wrench is dropped inside the vent duct.',
  'The tool carried the official Blackwood Prison Maintenance tool stamp #18.',
  'Security Hex Wrench',
  'Chrome-vanadium L-shaped key wrench engraved with prison serial #18.',
  '["Crowbar","Screwdriver","File"]'::jsonb,
  'Security Hex Wrench',
  '["security hex wrench","wrench","hex wrench","allen wrench","key wrench"]'::jsonb,
  'A small L-shaped metal tool used to turn bolts with hexagonal holes in the head.',
  'ev_3',
  false,
  '{"descriptions":["A specialized 8mm hexagonal security hex wrench is dropped inside the vent duct.","At 10:50 PM: A specialized 8mm hexagonal security hex wrench is dropped inside the vent duct.","Notice this clue: A specialized 8mm hexagonal security hex wrench is dropped inside the vent duct."],"hints":["A small L-shaped metal tool used to turn bolts with hexagonal holes in the head.","Clue hint: Think about security hex wrench.","Search for: the tool carried the official blackwood prison maintenance tool stamp #18."],"clues":["Security Hex Wrench","Item: Security Hex Wrench","Clue Word: Security Hex Wrench"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '75b0522c-585f-5035-ae87-f7c344cd6aef',
  'story_043',
  'ev_3',
  3,
  '11:00 PM',
  'A thick legal binder with hollowed-out cardboard pages lies on the metal bed.',
  'A thick legal binder with hollowed-out cardboard pages lies on the metal bed.',
  'The hex wrench was smuggled into the cell inside the legal paperwork.',
  'Hollow Legal Binder',
  'Black three-ring binder with center pages cut out to conceal tools.',
  '["Bible","Dictionary","Newspaper"]'::jsonb,
  'Hollow Legal Binder',
  '["hollow legal binder","binder","legal binder","book","hollow binder"]'::jsonb,
  'A hard cardboard cover holding papers that was cut out to hide objects.',
  'ev_4',
  false,
  '{"descriptions":["A thick legal binder with hollowed-out cardboard pages lies on the metal bed.","At 11:00 PM: A thick legal binder with hollowed-out cardboard pages lies on the metal bed.","Notice this clue: A thick legal binder with hollowed-out cardboard pages lies on the metal bed."],"hints":["A hard cardboard cover holding papers that was cut out to hide objects.","Clue hint: Think about hollow legal binder.","Search for: the hex wrench was smuggled into the cell inside the legal paperwork."],"clues":["Hollow Legal Binder","Item: Hollow Legal Binder","Clue Word: Hollow Legal Binder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bb6296b0-a998-54da-b257-8f9b6fe49c62',
  'story_043',
  'ev_4',
  4,
  '11:15 PM',
  'A vertical steel laundry chute dropping three stories is coated in grey fabric dust.',
  'A vertical steel laundry chute dropping three stories is coated in grey fabric dust.',
  'Hector used the laundry chute to drop directly into the basement sorting bay.',
  'Laundry Chute',
  'Smooth sheet-metal tube with slide friction marks leading to the basement.',
  '["Elevator Shaft","Stairwell","Trash Chute"]'::jsonb,
  'Laundry Chute',
  '["laundry chute","chute","pipe","slide"]'::jsonb,
  'A smooth metal tube down which dirty clothes slide from upper floors.',
  'ev_5',
  false,
  '{"descriptions":["A vertical steel laundry chute dropping three stories is coated in grey fabric dust.","At 11:15 PM: A vertical steel laundry chute dropping three stories is coated in grey fabric dust.","Notice this clue: A vertical steel laundry chute dropping three stories is coated in grey fabric dust."],"hints":["A smooth metal tube down which dirty clothes slide from upper floors.","Clue hint: Think about laundry chute.","Search for: hector used the laundry chute to drop directly into the basement sorting bay."],"clues":["Laundry Chute","Item: Laundry Chute","Clue Word: Laundry Chute"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2da5a5ee-8b60-5dde-b678-b5d7f0c4b053',
  'story_043',
  'ev_5',
  5,
  '11:30 PM',
  'A signed gate pass bearing Warden Silas Vance’s signature clears Laundry Truck 4.',
  'A signed gate pass bearing Warden Silas Vance’s signature clears Laundry Truck 4.',
  'The warden expedited the truck’s exit without mandatory vehicle inspection.',
  'Signed Gate Pass',
  'Official red vehicle manifest signed by Warden Silas Vance at 11:25 PM.',
  '["Driver License","Visitor Badge","Receipt"]'::jsonb,
  'Signed Gate Pass',
  '["signed gate pass","gate pass","pass","manifest","signed pass"]'::jsonb,
  'A signed paper slip that permits vehicles to drive out of a secured prison gate.',
  'ev_6',
  true,
  '{"descriptions":["A signed gate pass bearing Warden Silas Vance’s signature clears Laundry Truck 4.","At 11:30 PM: A signed gate pass bearing Warden Silas Vance’s signature clears Laundry Truck 4.","Notice this clue: A signed gate pass bearing Warden Silas Vance’s signature clears Laundry Truck 4."],"hints":["A signed paper slip that permits vehicles to drive out of a secured prison gate.","Clue hint: Think about signed gate pass.","Search for: the warden expedited the truck’s exit without mandatory vehicle inspection."],"clues":["Signed Gate Pass","Item: Signed Gate Pass","Clue Word: Signed Gate Pass"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '92468563-7c81-53e1-aee9-998a8376eb00',
  'story_043',
  'ev_6',
  6,
  '11:35 PM',
  'A large canvas rolling laundry hamper in the basement sits with a dented bottom.',
  'A large canvas rolling laundry hamper in the basement sits with a dented bottom.',
  'Hector was concealed beneath dirty prison sheets and towels inside the truck.',
  'Canvas Laundry Hamper',
  'Industrial wheeled canvas basket smelling of bleach and holding a civilian jacket.',
  '["Cardboard Box","Wooden Crate","Trash Can"]'::jsonb,
  'Canvas Laundry Hamper',
  '["canvas laundry hamper","hamper","laundry hamper","basket","canvas hamper"]'::jsonb,
  'A large fabric basket on wheels used in hospitals and prisons for bulk laundry.',
  'ev_7',
  false,
  '{"descriptions":["A large canvas rolling laundry hamper in the basement sits with a dented bottom.","At 11:35 PM: A large canvas rolling laundry hamper in the basement sits with a dented bottom.","Notice this clue: A large canvas rolling laundry hamper in the basement sits with a dented bottom."],"hints":["A large fabric basket on wheels used in hospitals and prisons for bulk laundry.","Clue hint: Think about canvas laundry hamper.","Search for: hector was concealed beneath dirty prison sheets and towels inside the truck."],"clues":["Canvas Laundry Hamper","Item: Canvas Laundry Hamper","Clue Word: Canvas Laundry Hamper"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '85f70003-6dd7-557d-b7ad-229a83adf66d',
  'story_043',
  'ev_7',
  7,
  '11:45 PM',
  'Orange prison jumpsuit #704 is found folded neatly on Hector’s metal bunk.',
  'Orange prison jumpsuit #704 is found folded neatly on Hector’s metal bunk.',
  'Hector changed into civilian clothes provided by his accomplices before escaping.',
  'Prison Jumpsuit',
  'Bright orange cotton uniform with inmate number #704 stenciled in black.',
  '["Civilian Shirt","Guard Uniform","Lab Coat"]'::jsonb,
  'Prison Jumpsuit',
  '["prison jumpsuit","jumpsuit","uniform","clothes"]'::jsonb,
  'A one-piece bright orange garment worn by inmates in maximum security jails.',
  'ev_8',
  false,
  '{"descriptions":["Orange prison jumpsuit #704 is found folded neatly on Hector’s metal bunk.","At 11:45 PM: Orange prison jumpsuit #704 is found folded neatly on Hector’s metal bunk.","Notice this clue: Orange prison jumpsuit #704 is found folded neatly on Hector’s metal bunk."],"hints":["A one-piece bright orange garment worn by inmates in maximum security jails.","Clue hint: Think about prison jumpsuit.","Search for: hector changed into civilian clothes provided by his accomplices before escaping."],"clues":["Prison Jumpsuit","Item: Prison Jumpsuit","Clue Word: Prison Jumpsuit"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f4348207-da69-542f-937a-ff17fd211304',
  'story_043',
  'ev_8',
  8,
  '12:15 AM',
  'A hardware cryptocurrency cold wallet is discovered inside the Warden’s private safe.',
  'A hardware cryptocurrency cold wallet is discovered inside the Warden’s private safe.',
  'Contains five million dollars in Bitcoin transferred from a cartel wallet.',
  'Crypto Hardware Wallet',
  'Ledger USB hardware key displaying five million dollars in crypto tokens.',
  '["Cash Stack","Gold Bar","Credit Card"]'::jsonb,
  'Crypto Hardware Wallet',
  '["crypto hardware wallet","wallet","crypto wallet","hardware wallet","usb key"]'::jsonb,
  'A small electronic USB device used to securely store digital cryptocurrency.',
  NULL,
  true,
  '{"descriptions":["A hardware cryptocurrency cold wallet is discovered inside the Warden’s private safe.","At 12:15 AM: A hardware cryptocurrency cold wallet is discovered inside the Warden’s private safe.","Notice this clue: A hardware cryptocurrency cold wallet is discovered inside the Warden’s private safe."],"hints":["A small electronic USB device used to securely store digital cryptocurrency.","Clue hint: Think about crypto hardware wallet.","Search for: contains five million dollars in bitcoin transferred from a cartel wallet."],"clues":["Crypto Hardware Wallet","Item: Crypto Hardware Wallet","Clue Word: Crypto Hardware Wallet"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_044 — THE POISONED WATER RESERVOIR
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_044',
  'The Poisoned Water Reservoir',
  'Thriller',
  'The City Municipal Water Treatment Facility, concrete settling basins and chlorination chemical tanks',
  'A fatal chemical contaminant was dumped into the main city water reservoir two hours before morning distribution.',
  '[{"name":"Dr. Adrian Vance","role":"Discredited Water Chemist","alibi":"Claims he was asleep at his suburban residence","avatar":"🧪"},{"name":"Frank Miller","role":"Facility Night Operator","alibi":"In the control room monitoring intake pumps","avatar":"🚰"},{"name":"Director Lisa Thorne","role":"Municipal Water Board Director","alibi":"Rushing to the facility in a city emergency vehicle","avatar":"📋"},{"name":"Agent Marcus Cole","role":"Hazardous Materials & CBRN Specialist","alibi":"Arrived on site with the emergency hazmat response truck","avatar":"☣️"}]'::jsonb,
  'Disgruntled former chemist Dr. Adrian Vance used an unrevoked security keycard to enter the filtration plant. He poured fifty liters of potassium cyanide into Basin 2 and disabled the automatic chlorine neutralizer alarms, intending to poison the city tap water and profit from bottled water stocks.',
  'Chemist Dr. Adrian Vance',
  'Adrian was fired by the city and wanted revenge, while holding stock in the bottled water supplier.',
  '[{"time":"02:30 AM","event":"Adrian Vance uses an unrevoked keycard to enter the chemical storage gate."},{"time":"03:15 AM","event":"Adrian pours fifty liters of industrial potassium cyanide into Basin 2."},{"time":"03:20 AM","event":"Adrian disconnects the automatic chlorine sensor alarm wire."},{"time":"03:45 AM","event":"Operator Frank notices the pale blue-green tint and calls emergency hazmat."},{"time":"04:15 AM","event":"Agent Cole initiates emergency basin neutralization with hydrogen peroxide."}]'::jsonb,
  '[{"id":"ev1","title":"50-Liter Potassium Cyanide Drum","detail":"Found submerged in Basin 2; carries industrial serial numbers traced to Adrian."},{"id":"ev2","title":"Electronic Access Log #042","detail":"Proves Dr. Adrian Vance used his unrevoked badge to enter at 2:30 AM."},{"id":"ev3","title":"Respirator Mask with Adrian’s DNA","detail":"Found discarded in the perimeter grass near the chemical gate."},{"id":"ev4","title":"PureWater Bottling Stock Portfolio","detail":"Confirms financial motive to induce a citywide tap water panic."}]'::jsonb,
  '[{"order":1,"title":"Cyanide Drum","text":"50-liter barrel of lethal chemical dumped directly into the drinking water basin."},{"order":2,"title":"Severed Sensor Wire","text":"Safety cable clipped to prevent automated chlorine alarms from ringing."},{"order":3,"title":"Discolored Basin Water","text":"Unnatural blue-green water caused by cyanide reacting with metal pipes."},{"order":4,"title":"Unrevoked Keycard","text":"Access card used by the fired chemist to enter the secure perimeter."},{"order":5,"title":"Respirator Mask","text":"Chemical gas mask worn by the saboteur to avoid inhaling fatal fumes."},{"order":6,"title":"Bottled Water Stocks","text":"Financial investment documents betting on a public water supply crisis."}]'::jsonb,
  'A chemical delivery tanker was parked in Bay 1.: Delivering routine alum coagulant, completely non-toxic.; Operator Frank’s hands had green grease stains.: Industrial lubricant from greasing the main pump gears.',
  'Claim a chemical delivery tanker leaked accidentally or blame the night security guard.',
  'NORMAL',
  'Who breached the perimeter and poured industrial cyanide into the municipal water supply?',
  '[{"character":"Dr. Adrian Vance","secret":"Invested fifty thousand dollars in the regional bottled water monopoly."},{"character":"Frank Miller","secret":"He forgot to log the weekly security badge audit yesterday."},{"character":"Director Lisa Thorne","secret":"She delayed updating the security keycard system to save department budget funds."},{"character":"Agent Marcus Cole","secret":"Trained in chemical warfare counter-measures."}]'::jsonb,
  '[{"lead":"A chemical delivery tanker was parked in Bay 1.","explanation":"Delivering routine alum coagulant, completely non-toxic."},{"lead":"Operator Frank’s hands had green grease stains.","explanation":"Industrial lubricant from greasing the main pump gears."}]'::jsonb,
  '{"wrongTheories":["An industrial tanker accidentally spilled cleaning detergent into the water basin.","A domestic eco-terrorist group launched a mortar attack on the chemical tanks."],"correctTheory":"Disgruntled former chemist Dr. Adrian Vance used his unrevoked keycard to pour fifty liters of potassium cyanide into Basin 2 and severed the alarm wire to poison the city water supply and profit from his bottled water stock holdings."}'::jsonb,
  'Chemist Dr. Adrian Vance dumped cyanide for revenge and bottled water stock profits!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Hazmat teams neutralized the chemical with peroxide before 5:00 AM distribution. Police arrested Adrian at his home with cyanide chemical residue on his boots."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The outflow valve was not closed in time. Thousands fell ill across the city, and Adrian sold his bottled water stocks for millions."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The municipal board claimed a natural blue-green algae outbreak occurred. Adrian’s sabotage went undetected while he profited from the crisis."}]'::jsonb,
  '{"intros":["A fatal chemical contaminant was dumped into the main city water reservoir two hours before morning distribution.","Case file story_044: A fatal chemical contaminant was dumped into the main city water reservoir two hours before morning distribution. Look closely at every clue.","Trouble begins in The City Municipal Water Treatment Facility, concrete settling basins and chlorination chemical tanks. A fatal chemical contaminant was dumped into the main city water reservoir two hours before morning distribution.","The mystery starts now. A fatal chemical contaminant was dumped into the main city water reservoir two hours before morning distribution. Can you solve it?"],"reveals":["Chemist Dr. Adrian Vance dumped cyanide for revenge and bottled water stock profits!","The mystery is unraveled! Chemist Dr. Adrian Vance dumped cyanide for revenge and bottled water stock profits!","At last, the truth comes out: Chemist Dr. Adrian Vance dumped cyanide for revenge and bottled water stock profits!","Case resolved! Here is what happened: Chemist Dr. Adrian Vance dumped cyanide for revenge and bottled water stock profits!"],"hints":["Pay attention to where Chemist Dr. Adrian Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_044';
DELETE FROM public.case_events WHERE case_id = 'story_044';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ad3c3fd7-3f1a-5655-bb68-823101c9759f',
  'story_044',
  'Dr. Adrian Vance',
  'Discredited Water Chemist',
  'Arrogant, vengeful, wearing a rubber chemical apron and respirator mask',
  'I was dismissed by the corrupt city council three months ago. I have not returned here.',
  'Invested fifty thousand dollars in the regional bottled water monopoly.',
  'Claims he was asleep at his suburban residence',
  'Designed the chemical dosing protocols for Basin 2',
  'Basin 2 pumps directly into the municipal drinking mains at 5:00 AM.',
  'Did not know an optical water sensor detected the chemical plume immediately.',
  '🧪',
  '["I was dismissed by the corrupt city council three months ago. I have not returned here.","\"I was dismissed by the corrupt city council three months ago. I have not returned here.\"","Listen to me: I was dismissed by the corrupt city council three months ago. I have not returned here.","I tell you the truth: I was dismissed by the corrupt city council three months ago. I have not returned here."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8ec9d112-a2ee-53e1-ad3a-435618d380d0',
  'story_044',
  'Frank Miller',
  'Facility Night Operator',
  'Diligent, stressed, holding a digital pH and chlorine testing kit',
  'The alarm was silenced, but the water color turned a strange pale bluish green.',
  'He forgot to log the weekly security badge audit yesterday.',
  'In the control room monitoring intake pumps',
  'Operator who discovered the chemical discoloration in Basin 2',
  'The main distribution valves can be manually locked down before 5:00 AM.',
  'Did not know Adrian’s old keycard was still active in the database.',
  '🚰',
  '["The alarm was silenced, but the water color turned a strange pale bluish green.","\"The alarm was silenced, but the water color turned a strange pale bluish green.\"","Listen to me: The alarm was silenced, but the water color turned a strange pale bluish green.","I tell you the truth: The alarm was silenced, but the water color turned a strange pale bluish green."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '07841b36-80f4-5ad0-94fc-973e07d00fd9',
  'story_044',
  'Director Lisa Thorne',
  'Municipal Water Board Director',
  'Panicked, demanding, on the phone with the Governor’s emergency office',
  'If that water reaches the morning taps, tens of thousands of citizens will be poisoned!',
  'She delayed updating the security keycard system to save department budget funds.',
  'Rushing to the facility in a city emergency vehicle',
  'Executive responsible for public water safety',
  'The city water grid serves two million people starting at dawn.',
  'Did not realize Adrian had kept his master physical keycard.',
  '📋',
  '["If that water reaches the morning taps, tens of thousands of citizens will be poisoned!","\"If that water reaches the morning taps, tens of thousands of citizens will be poisoned!\"","Listen to me: If that water reaches the morning taps, tens of thousands of citizens will be poisoned!","I tell you the truth: If that water reaches the morning taps, tens of thousands of citizens will be poisoned!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3e4dd6b9-51dd-5607-80e4-0b9cbea1dd9d',
  'story_044',
  'Agent Marcus Cole',
  'Hazardous Materials & CBRN Specialist',
  'Cool-headed, wearing a hazmat suit and chemical spectrometer',
  'This is high-concentration potassium cyanide. We have thirty minutes to purge the basin.',
  'Trained in chemical warfare counter-measures.',
  'Arrived on site with the emergency hazmat response truck',
  'Leading the chemical neutralization and containment team',
  'Found cyanide chemical drum packaging discarded in the drainage ditch.',
  'Did not immediately locate where Adrian was watching from outside the fence.',
  '☣️',
  '["This is high-concentration potassium cyanide. We have thirty minutes to purge the basin.","\"This is high-concentration potassium cyanide. We have thirty minutes to purge the basin.\"","Listen to me: This is high-concentration potassium cyanide. We have thirty minutes to purge the basin.","I tell you the truth: This is high-concentration potassium cyanide. We have thirty minutes to purge the basin."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a58959bd-c780-5f2f-bd7e-b076d29902b4',
  'story_044',
  'ev_1',
  1,
  '03:15 AM',
  'Fifty liters of liquid potassium cyanide are dumped into the filtration basin.',
  'Fifty liters of liquid potassium cyanide are dumped into the filtration basin.',
  'The reservoir was poisoned with a massive, lethal concentration of chemical toxins.',
  'Cyanide Drum',
  '50-liter industrial blue plastic drum with skull and crossbones label.',
  '["Chlorine Canister","Acid Tank","Water Jug"]'::jsonb,
  'Cyanide Drum',
  '["cyanide drum","drum","chemical drum","cyanide","barrel"]'::jsonb,
  'A large heavy plastic barrel used to store dangerous toxic chemicals.',
  'ev_2',
  true,
  '{"descriptions":["Fifty liters of liquid potassium cyanide are dumped into the filtration basin.","At 03:15 AM: Fifty liters of liquid potassium cyanide are dumped into the filtration basin.","Notice this clue: Fifty liters of liquid potassium cyanide are dumped into the filtration basin."],"hints":["A large heavy plastic barrel used to store dangerous toxic chemicals.","Clue hint: Think about cyanide drum.","Search for: the reservoir was poisoned with a massive, lethal concentration of chemical toxins."],"clues":["Cyanide Drum","Item: Cyanide Drum","Clue Word: Cyanide Drum"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c76e8104-291a-5268-8aa2-bd18cc15c873',
  'story_044',
  'ev_2',
  2,
  '03:20 AM',
  'A severed sensor wire dangles from the automatic chlorine oxidation monitor.',
  'A severed sensor wire dangles from the automatic chlorine oxidation monitor.',
  'The emergency alarm was physically disconnected to allow the poison to spread.',
  'Severed Sensor Wire',
  'Insulated green sensor cable cleanly snipped with wire cutters.',
  '["Burnt Fuse","Power Cable","Water Pipe"]'::jsonb,
  'Severed Sensor Wire',
  '["severed sensor wire","wire","sensor wire","cut wire","severed wire"]'::jsonb,
  'A thin electrical cable cut in two with scissors or pliers.',
  'ev_3',
  false,
  '{"descriptions":["A severed sensor wire dangles from the automatic chlorine oxidation monitor.","At 03:20 AM: A severed sensor wire dangles from the automatic chlorine oxidation monitor.","Notice this clue: A severed sensor wire dangles from the automatic chlorine oxidation monitor."],"hints":["A thin electrical cable cut in two with scissors or pliers.","Clue hint: Think about severed sensor wire.","Search for: the emergency alarm was physically disconnected to allow the poison to spread."],"clues":["Severed Sensor Wire","Item: Severed Sensor Wire","Clue Word: Severed Sensor Wire"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '245d350f-5cb0-5b1c-aeb6-7e1b23414281',
  'story_044',
  'ev_3',
  3,
  '03:45 AM',
  'The surface of Basin 2 exhibits a distinctive milky blue-green chemical discoloration.',
  'The surface of Basin 2 exhibits a distinctive milky blue-green chemical discoloration.',
  'Cyanide reacting with copper pipes produces a characteristic blue-green hue.',
  'Discolored Basin Water',
  'Water sample showing high chemical turbidity and bitter almond aroma.',
  '["Muddy Water","Oil Slick","Algae Bloom"]'::jsonb,
  'Discolored Basin Water',
  '["discolored basin water","water","discolored water","blue water","basin water"]'::jsonb,
  'Reservoir water that turned an unnatural milky blue-green color.',
  'ev_4',
  false,
  '{"descriptions":["The surface of Basin 2 exhibits a distinctive milky blue-green chemical discoloration.","At 03:45 AM: The surface of Basin 2 exhibits a distinctive milky blue-green chemical discoloration.","Notice this clue: The surface of Basin 2 exhibits a distinctive milky blue-green chemical discoloration."],"hints":["Reservoir water that turned an unnatural milky blue-green color.","Clue hint: Think about discolored basin water.","Search for: cyanide reacting with copper pipes produces a characteristic blue-green hue."],"clues":["Discolored Basin Water","Item: Discolored Basin Water","Clue Word: Discolored Basin Water"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a54ac0eb-bc57-58e0-97a1-5b2a43041cf5',
  'story_044',
  'ev_4',
  4,
  '03:50 AM',
  'An unrevoked employee RFID keycard registered to "DR. A. VANCE" opened the gate.',
  'An unrevoked employee RFID keycard registered to "DR. A. VANCE" opened the gate.',
  'The intruder entered using official credentials that the city forgot to cancel.',
  'Unrevoked Keycard',
  'Electronic access reader log showing Badge #042 entry at 2:30 AM.',
  '["Master Key","Visitor Badge","Parking Ticket"]'::jsonb,
  'Unrevoked Keycard',
  '["unrevoked keycard","keycard","card","badge"]'::jsonb,
  'A plastic magnetic card that should have been canceled when an employee was fired.',
  'ev_5',
  false,
  '{"descriptions":["An unrevoked employee RFID keycard registered to \"DR. A. VANCE\" opened the gate.","At 03:50 AM: An unrevoked employee RFID keycard registered to \"DR. A. VANCE\" opened the gate.","Notice this clue: An unrevoked employee RFID keycard registered to \"DR. A. VANCE\" opened the gate."],"hints":["A plastic magnetic card that should have been canceled when an employee was fired.","Clue hint: Think about unrevoked keycard.","Search for: the intruder entered using official credentials that the city forgot to cancel."],"clues":["Unrevoked Keycard","Item: Unrevoked Keycard","Clue Word: Unrevoked Keycard"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '786629de-64de-5704-8a1e-e3ea542a45cd',
  'story_044',
  'ev_5',
  5,
  '04:00 AM',
  'An industrial full-face chemical respirator mask is dropped in the grass.',
  'An industrial full-face chemical respirator mask is dropped in the grass.',
  'The poisoner wore breathing protection against toxic cyanide vapor.',
  'Respirator Mask',
  'Black rubber gas mask with twin chemical filtration cartridges.',
  '["Dust Mask","Scuba Mask","Surgical Mask"]'::jsonb,
  'Respirator Mask',
  '["respirator mask","mask","respirator","gas mask"]'::jsonb,
  'A heavy rubber mask covering the mouth and eyes with twin air filters.',
  'ev_6',
  true,
  '{"descriptions":["An industrial full-face chemical respirator mask is dropped in the grass.","At 04:00 AM: An industrial full-face chemical respirator mask is dropped in the grass.","Notice this clue: An industrial full-face chemical respirator mask is dropped in the grass."],"hints":["A heavy rubber mask covering the mouth and eyes with twin air filters.","Clue hint: Think about respirator mask.","Search for: the poisoner wore breathing protection against toxic cyanide vapor."],"clues":["Respirator Mask","Item: Respirator Mask","Clue Word: Respirator Mask"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '78db0d22-f431-5e2b-bc1e-a6dc692f103d',
  'story_044',
  'ev_6',
  6,
  '04:15 AM',
  'Emergency drums of liquid hydrogen peroxide are pumped in to neutralize the poison.',
  'Emergency drums of liquid hydrogen peroxide are pumped in to neutralize the poison.',
  'Hazmat teams dumped oxidizer into the basin, converting cyanide into harmless cyanate.',
  'Neutralizing Chemical',
  'High-concentration hydrogen peroxide drums pumped via emergency hoses.',
  '["Chlorine Powder","Bleach","Baking Soda"]'::jsonb,
  'Neutralizing Chemical',
  '["neutralizing chemical","neutralizer","chemical","hydrogen peroxide","peroxide"]'::jsonb,
  'A chemical liquid used to counteract and destroy deadly poisons in water.',
  'ev_7',
  false,
  '{"descriptions":["Emergency drums of liquid hydrogen peroxide are pumped in to neutralize the poison.","At 04:15 AM: Emergency drums of liquid hydrogen peroxide are pumped in to neutralize the poison.","Notice this clue: Emergency drums of liquid hydrogen peroxide are pumped in to neutralize the poison."],"hints":["A chemical liquid used to counteract and destroy deadly poisons in water.","Clue hint: Think about neutralizing chemical.","Search for: hazmat teams dumped oxidizer into the basin, converting cyanide into harmless cyanate."],"clues":["Neutralizing Chemical","Item: Neutralizing Chemical","Clue Word: Neutralizing Chemical"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f08b8596-5e69-5a56-816b-71c2f738005c',
  'story_044',
  'ev_7',
  7,
  '04:30 AM',
  'Stock brokerage account slips showing fifty thousand dollars in PureWater Bottling.',
  'Stock brokerage account slips showing fifty thousand dollars in PureWater Bottling.',
  'Adrian planned to make a fortune when citizens were forced to buy bottled water.',
  'Bottled Water Stocks',
  'Financial trading portfolio showing massive shares in bottled water companies.',
  '["Bank Statement","Checkbook","Tax Form"]'::jsonb,
  'Bottled Water Stocks',
  '["bottled water stocks","stocks","stock slip","shares","water stocks"]'::jsonb,
  'Paper investment documents proving ownership in a commercial bottled water company.',
  'ev_8',
  false,
  '{"descriptions":["Stock brokerage account slips showing fifty thousand dollars in PureWater Bottling.","At 04:30 AM: Stock brokerage account slips showing fifty thousand dollars in PureWater Bottling.","Notice this clue: Stock brokerage account slips showing fifty thousand dollars in PureWater Bottling."],"hints":["Paper investment documents proving ownership in a commercial bottled water company.","Clue hint: Think about bottled water stocks.","Search for: adrian planned to make a fortune when citizens were forced to buy bottled water."],"clues":["Bottled Water Stocks","Item: Bottled Water Stocks","Clue Word: Bottled Water Stocks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '14602adb-afff-52bc-979f-a3efed2c7c04',
  'story_044',
  'ev_8',
  8,
  '04:45 AM',
  'A main emergency shut-off wheel is turned with a heavy steel wrench.',
  'A main emergency shut-off wheel is turned with a heavy steel wrench.',
  'Operator Frank manually locked the outflow valves before water hit city pipes.',
  'Outflow Shut-off Valve',
  'Six-foot cast-iron wheel locked with emergency chain and padlock.',
  '["Drain Plug","Sewer Gate","Pump Switch"]'::jsonb,
  'Outflow Shut-off Valve',
  '["outflow shut-off valve","valve","shut-off valve","outflow valve","wheel"]'::jsonb,
  'A huge circular metal wheel turned to stop water flowing out of a dam or reservoir.',
  NULL,
  true,
  '{"descriptions":["A main emergency shut-off wheel is turned with a heavy steel wrench.","At 04:45 AM: A main emergency shut-off wheel is turned with a heavy steel wrench.","Notice this clue: A main emergency shut-off wheel is turned with a heavy steel wrench."],"hints":["A huge circular metal wheel turned to stop water flowing out of a dam or reservoir.","Clue hint: Think about outflow shut-off valve.","Search for: operator frank manually locked the outflow valves before water hit city pipes."],"clues":["Outflow Shut-off Valve","Item: Outflow Shut-off Valve","Clue Word: Outflow Shut-off Valve"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_045 — THE BLACKOUT IN THE TUNNEL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_045',
  'The Blackout in the Tunnel',
  'Thriller',
  'The Meridian Underwater Highway Tunnel, two miles beneath the bay, gridlocked traffic under orange sodium lights',
  'Both ends of the two-mile underwater tunnel were sealed by blast gates during rush hour, and the ventilation fans were shut down.',
  '[{"name":"Vincent Cole","role":"Lead Armored Truck Guard","alibi":"Inside the armored bullion truck cab in Lane 2","avatar":"🚚"},{"name":"Leo Marquez","role":"Commuter & Undercover Detective","alibi":"Stuck in traffic three vehicles behind the bullion truck","avatar":"🚗"},{"name":"Nora Higgins","role":"Tunnel Traffic Controller","alibi":"In the surface control tower overlooking the tunnel entrance","avatar":"🖥️"},{"name":"Agent Marcus Vance","role":"Tactical Rescue Commander","alibi":"At the east tunnel portal with the tactical breaching convoy","avatar":"🛡️"}]'::jsonb,
  'Armored transport guard Vincent Cole collaborated with an armed heist crew. He triggered the tunnel’s emergency fire floodgates to trap all traffic inside, killed the ventilation to create panic, and cut through the bullion truck safe while smoke obscured the security cameras.',
  'Armored Truck Guard Vincent Cole',
  'Vincent orchestrated the tunnel gridlock to hijack a Federal Reserve gold bullion transport.',
  '[{"time":"05:15 PM","event":"The Federal Reserve bullion truck enters the Meridian Tunnel in heavy traffic."},{"time":"05:30 PM","event":"Vincent transmits the emergency marine gate override code."},{"time":"05:31 PM","event":"Two-ton hydraulic blast doors slam shut at both tunnel entrances."},{"time":"05:35 PM","event":"Smoke grenades are deployed; heist crew cuts the truck roof with a thermal lance."},{"time":"05:50 PM","event":"Detective Marquez confronts Vincent as the gold bars are transferred to the escape shaft."}]'::jsonb,
  '[{"id":"ev1","title":"Radio Override Box on Intercom Line","detail":"Sent the signal that dropped the two-ton hydraulic blast doors."},{"id":"ev2","title":"Thermal Cutting Lance Slag","detail":"Used to slice through the armored bullion truck roof in Lane 2."},{"id":"ev3","title":"Tactical Gas Mask with Vincent’s DNA","detail":"Found near the breached bullion truck with smoke soot on the filters."},{"id":"ev4","title":"Gold Bullion in Dive Bags","detail":"Recovered at the bottom of the ventilation shaft ladder before it reached the boat."}]'::jsonb,
  '[{"order":1,"title":"Hydraulic Blast Gates","text":"Two-ton flood barriers dropped to trap hundreds of cars beneath the bay."},{"order":2,"title":"Smoke Grenades","text":"Military canisters deployed to blind CCTV and cause mass commuter panic."},{"order":3,"title":"Thermal Cutting Lance","text":"Ultra-hot cutting pipe used to melt through the armored truck roof."},{"order":4,"title":"Gold Bullion Bars","text":"Forty million dollars in federal gold targeted by the inside heist."},{"order":5,"title":"Radio Override Box","text":"Hacking device used to hijack tunnel controls from the inside."},{"order":6,"title":"Ventilation Shaft Ladder","text":"Escape route leading from the roadway up to a boat waiting on the bay."}]'::jsonb,
  'A car radiator exploded in Lane 4.: Overheated in the traffic jam, creating steam but no criminal damage.; Controller Nora was distracted on the phone.: Poor workplace discipline, but she had no ties to the heist crew.',
  'Claim a car battery caught fire accidentally or blame the tunnel traffic controller.',
  'NORMAL',
  'Who sealed hundreds of cars inside the underwater tunnel and what was the target?',
  '[{"character":"Vincent Cole","secret":"He provided the tunnel override radio frequency to his heist crew."},{"character":"Leo Marquez","secret":"He was carrying his off-duty police sidearm and a tactical flashlight."},{"character":"Nora Higgins","secret":"She was distracted by a phone call when the override was entered."},{"character":"Agent Marcus Vance","secret":"His tactical squad had heavy diamond-tipped cutting torches."}]'::jsonb,
  '[{"lead":"A car radiator exploded in Lane 4.","explanation":"Overheated in the traffic jam, creating steam but no criminal damage."},{"lead":"Controller Nora was distracted on the phone.","explanation":"Poor workplace discipline, but she had no ties to the heist crew."}]'::jsonb,
  '{"wrongTheories":["An accidental vehicle fire triggered automated safety floodgates and suffocated the tunnel.","A foreign terrorist organization sealed the tunnel to blow up the bay foundation."],"correctTheory":"Armored truck guard Vincent Cole conspired with a heist crew to drop the tunnel blast gates, shut down ventilation, and use smoke grenades to steal forty million dollars in gold bullion through a ventilation shaft."}'::jsonb,
  'Guard Vincent Cole sealed the tunnel to heist forty million in gold bullion!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Marquez held the crew at gunpoint while Agent Vance breached the blast doors with cutting torches. Vincent Cole was arrested and the gold was recovered."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The heist crew climbed the ventilation ladder with forty million in gold and escaped on a speedboat. Vincent disappeared into the smoke."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The government declared the incident a catastrophic infrastructure computer glitch. Vincent laundered his share of the gold in Europe."}]'::jsonb,
  '{"intros":["Both ends of the two-mile underwater tunnel were sealed by blast gates during rush hour, and the ventilation fans were shut down.","Case file story_045: Both ends of the two-mile underwater tunnel were sealed by blast gates during rush hour, and the ventilation fans were shut down. Look closely at every clue.","Trouble begins in The Meridian Underwater Highway Tunnel, two miles beneath the bay, gridlocked traffic under orange sodium lights. Both ends of the two-mile underwater tunnel were sealed by blast gates during rush hour, and the ventilation fans were shut down.","The mystery starts now. Both ends of the two-mile underwater tunnel were sealed by blast gates during rush hour, and the ventilation fans were shut down. Can you solve it?"],"reveals":["Guard Vincent Cole sealed the tunnel to heist forty million in gold bullion!","The mystery is unraveled! Guard Vincent Cole sealed the tunnel to heist forty million in gold bullion!","At last, the truth comes out: Guard Vincent Cole sealed the tunnel to heist forty million in gold bullion!","Case resolved! Here is what happened: Guard Vincent Cole sealed the tunnel to heist forty million in gold bullion!"],"hints":["Pay attention to where Armored Truck Guard Vincent Cole was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_045';
DELETE FROM public.case_events WHERE case_id = 'story_045';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ec1358a3-a6a7-542e-9d6d-022204995fb9',
  'story_045',
  'Vincent Cole',
  'Lead Armored Truck Guard',
  'Tactical, stone-faced, wearing body armor and carrying an assault shotgun',
  'The tunnel floodgates tripped automatically! We must remain inside the armored cab for safety.',
  'He provided the tunnel override radio frequency to his heist crew.',
  'Inside the armored bullion truck cab in Lane 2',
  'In charge of the Federal Reserve gold shipment',
  'The ventilation shutdown will cause carbon monoxide to build up within thirty minutes.',
  'Did not know an undercover agent was seated two cars behind him.',
  '🚚',
  '["The tunnel floodgates tripped automatically! We must remain inside the armored cab for safety.","\"The tunnel floodgates tripped automatically! We must remain inside the armored cab for safety.\"","Listen to me: The tunnel floodgates tripped automatically! We must remain inside the armored cab for safety.","I tell you the truth: The tunnel floodgates tripped automatically! We must remain inside the armored cab for safety."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0428e7a2-b620-5522-9ea1-85963ecfcea9',
  'story_045',
  'Leo Marquez',
  'Commuter & Undercover Detective',
  'Resourceful, observant, driving an unmarked sedan caught in the traffic',
  'The blast doors did not drop because of smoke. Someone hit the emergency marine flood gates.',
  'He was carrying his off-duty police sidearm and a tactical flashlight.',
  'Stuck in traffic three vehicles behind the bullion truck',
  'First officer to challenge the armored truck crew',
  'Saw armed men in gas masks climbing onto the bullion truck roof.',
  'Did not have tools to cut through the hardened steel blast doors.',
  '🚗',
  '["The blast doors did not drop because of smoke. Someone hit the emergency marine flood gates.","\"The blast doors did not drop because of smoke. Someone hit the emergency marine flood gates.\"","Listen to me: The blast doors did not drop because of smoke. Someone hit the emergency marine flood gates.","I tell you the truth: The blast doors did not drop because of smoke. Someone hit the emergency marine flood gates."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '76fdc11e-9a46-5304-92e9-d1e3ad9952b1',
  'story_045',
  'Nora Higgins',
  'Tunnel Traffic Controller',
  'Frantic, staring at red warning screens in the surface control tower',
  'Our computer system was locked out by an external override code. The blast doors won’t raise!',
  'She was distracted by a phone call when the override was entered.',
  'In the surface control tower overlooking the tunnel entrance',
  'Controls ventilation fans and emergency flood gates',
  'The override came from a transmitter broadcasting inside the tunnel itself.',
  'Could not see through the dense white smoke filling the cameras.',
  '🖥️',
  '["Our computer system was locked out by an external override code. The blast doors won’t raise!","\"Our computer system was locked out by an external override code. The blast doors won’t raise!\"","Listen to me: Our computer system was locked out by an external override code. The blast doors won’t raise!","I tell you the truth: Our computer system was locked out by an external override code. The blast doors won’t raise!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '00107602-d818-5414-8344-0b8d196f5f63',
  'story_045',
  'Agent Marcus Vance',
  'Tactical Rescue Commander',
  'Decisive, authoritative, organizing emergency oxygen teams outside',
  'We have two hundred civilians trapped beneath the bay. We breach the east gate in five minutes.',
  'His tactical squad had heavy diamond-tipped cutting torches.',
  'At the east tunnel portal with the tactical breaching convoy',
  'Leading the rescue and counter-assault operation',
  'The bullion truck was carrying forty million dollars in gold bars.',
  'Did not know the heist crew had an escape jet-boat docked at the ventilation shaft.',
  '🛡️',
  '["We have two hundred civilians trapped beneath the bay. We breach the east gate in five minutes.","\"We have two hundred civilians trapped beneath the bay. We breach the east gate in five minutes.\"","Listen to me: We have two hundred civilians trapped beneath the bay. We breach the east gate in five minutes.","I tell you the truth: We have two hundred civilians trapped beneath the bay. We breach the east gate in five minutes."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8105ed0f-13ff-512c-b6d7-3a48b27c0c38',
  'story_045',
  'ev_1',
  1,
  '05:31 PM',
  'Massive two-ton hydraulic steel blast gates drop, sealing both ends of the tunnel.',
  'Massive two-ton hydraulic steel blast gates drop, sealing both ends of the tunnel.',
  'The gates were designed for marine flooding and locked hundreds of vehicles inside.',
  'Hydraulic Blast Gates',
  'Steel floodgate barriers locked with fifty thousand pounds of hydraulic force.',
  '["Iron Grate","Wooden Barrier","Toll Arm"]'::jsonb,
  'Hydraulic Blast Gates',
  '["hydraulic blast gates","gates","blast gates","flood gates","steel doors","doors"]'::jsonb,
  'Enormous heavy steel doors that seal a tunnel to keep seawater out.',
  'ev_2',
  true,
  '{"descriptions":["Massive two-ton hydraulic steel blast gates drop, sealing both ends of the tunnel.","At 05:31 PM: Massive two-ton hydraulic steel blast gates drop, sealing both ends of the tunnel.","Notice this clue: Massive two-ton hydraulic steel blast gates drop, sealing both ends of the tunnel."],"hints":["Enormous heavy steel doors that seal a tunnel to keep seawater out.","Clue hint: Think about hydraulic blast gates.","Search for: the gates were designed for marine flooding and locked hundreds of vehicles inside."],"clues":["Hydraulic Blast Gates","Item: Hydraulic Blast Gates","Clue Word: Hydraulic Blast Gates"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9bcb9843-5a6d-5e0d-8c91-7d9a7fc202a7',
  'story_045',
  'ev_2',
  2,
  '05:33 PM',
  'Dense white chemical smoke from military smoke canisters fills the narrow tunnel.',
  'Dense white chemical smoke from military smoke canisters fills the narrow tunnel.',
  'Smoke was deployed to blind CCTV cameras and cause civilian panic.',
  'Smoke Grenades',
  'M18 military smoke grenade canisters rolling along the concrete roadway.',
  '["Tear Gas","Flares","Firework"]'::jsonb,
  'Smoke Grenades',
  '["smoke grenades","grenades","canisters","smoke"]'::jsonb,
  'Metal canisters that spew thick clouds of white or colored smoke when pulled.',
  'ev_3',
  false,
  '{"descriptions":["Dense white chemical smoke from military smoke canisters fills the narrow tunnel.","At 05:33 PM: Dense white chemical smoke from military smoke canisters fills the narrow tunnel.","Notice this clue: Dense white chemical smoke from military smoke canisters fills the narrow tunnel."],"hints":["Metal canisters that spew thick clouds of white or colored smoke when pulled.","Clue hint: Think about smoke grenades.","Search for: smoke was deployed to blind cctv cameras and cause civilian panic."],"clues":["Smoke Grenades","Item: Smoke Grenades","Clue Word: Smoke Grenades"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b9063b92-b39a-58c0-8e22-e22f8f887c54',
  'story_045',
  'ev_3',
  3,
  '05:35 PM',
  'A thermal cutting lance burns through the armored truck roof at 5,000 degrees.',
  'A thermal cutting lance burns through the armored truck roof at 5,000 degrees.',
  'The heist crew used a magnesium-oxygen lance to melt through bulletproof armor.',
  'Thermal Cutting Lance',
  'Steel burning pipe with molten slag dripping onto the bullion truck floor.',
  '["Blowtorch","Plasma Cutter","Laser"]'::jsonb,
  'Thermal Cutting Lance',
  '["thermal cutting lance","lance","thermal lance","cutting torch","burner"]'::jsonb,
  'A long metal pipe that burns with white-hot heat to melt through heavy bank safes.',
  'ev_4',
  false,
  '{"descriptions":["A thermal cutting lance burns through the armored truck roof at 5,000 degrees.","At 05:35 PM: A thermal cutting lance burns through the armored truck roof at 5,000 degrees.","Notice this clue: A thermal cutting lance burns through the armored truck roof at 5,000 degrees."],"hints":["A long metal pipe that burns with white-hot heat to melt through heavy bank safes.","Clue hint: Think about thermal cutting lance.","Search for: the heist crew used a magnesium-oxygen lance to melt through bulletproof armor."],"clues":["Thermal Cutting Lance","Item: Thermal Cutting Lance","Clue Word: Thermal Cutting Lance"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2d988094-84c8-5dc4-a7a2-b823493db546',
  'story_045',
  'ev_4',
  4,
  '05:40 PM',
  'Heavy bars of pure 24-carat gold bullion are packed into waterproof dive bags.',
  'Heavy bars of pure 24-carat gold bullion are packed into waterproof dive bags.',
  'Forty million dollars in federal gold was the true target of the blackout.',
  'Gold Bullion Bars',
  'Stamped 400-ounce gold bars carrying Federal Reserve serial marks.',
  '["Cash Bundles","Diamonds","Silver Coins"]'::jsonb,
  'Gold Bullion Bars',
  '["gold bullion bars","gold","gold bars","bullion","gold bullion"]'::jsonb,
  'Heavy rectangular yellow metal bricks stored in bank vaults.',
  'ev_5',
  false,
  '{"descriptions":["Heavy bars of pure 24-carat gold bullion are packed into waterproof dive bags.","At 05:40 PM: Heavy bars of pure 24-carat gold bullion are packed into waterproof dive bags.","Notice this clue: Heavy bars of pure 24-carat gold bullion are packed into waterproof dive bags."],"hints":["Heavy rectangular yellow metal bricks stored in bank vaults.","Clue hint: Think about gold bullion bars.","Search for: forty million dollars in federal gold was the true target of the blackout."],"clues":["Gold Bullion Bars","Item: Gold Bullion Bars","Clue Word: Gold Bullion Bars"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '556685a9-82c9-5a85-bd9a-445f694c1d3f',
  'story_045',
  'ev_5',
  5,
  '05:45 PM',
  'An electronic radio override transmitter is plugged into the tunnel emergency phone socket.',
  'An electronic radio override transmitter is plugged into the tunnel emergency phone socket.',
  'The device sent the command that locked the blast gates from the inside.',
  'Radio Override Box',
  'Aluminum hacking console wired to the tunnel emergency intercom line.',
  '["Cell Phone","Car Battery","Radio Receiver"]'::jsonb,
  'Radio Override Box',
  '["radio override box","override","radio override","hacking box","transmitter"]'::jsonb,
  'An electronic box used to broadcast unauthorized commands into control networks.',
  'ev_6',
  true,
  '{"descriptions":["An electronic radio override transmitter is plugged into the tunnel emergency phone socket.","At 05:45 PM: An electronic radio override transmitter is plugged into the tunnel emergency phone socket.","Notice this clue: An electronic radio override transmitter is plugged into the tunnel emergency phone socket."],"hints":["An electronic box used to broadcast unauthorized commands into control networks.","Clue hint: Think about radio override box.","Search for: the device sent the command that locked the blast gates from the inside."],"clues":["Radio Override Box","Item: Radio Override Box","Clue Word: Radio Override Box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1e377b9e-084a-51f2-aef7-a09ab18453a9',
  'story_045',
  'ev_6',
  6,
  '05:48 PM',
  'An iron service ladder leads upward into an emergency water-drainage ventilation shaft.',
  'An iron service ladder leads upward into an emergency water-drainage ventilation shaft.',
  'The heist crew planned to escape by climbing up to an ocean bay slipway.',
  'Ventilation Shaft Ladder',
  'Vertical iron ladder with wet glove smudges leading up to the bay surface.',
  '["Elevator","Fire Escape","Rope"]'::jsonb,
  'Ventilation Shaft Ladder',
  '["ventilation shaft ladder","ladder","shaft ladder","vent ladder","service ladder"]'::jsonb,
  'Metal rungs attached to a vertical tunnel wall used to climb up or down.',
  'ev_7',
  false,
  '{"descriptions":["An iron service ladder leads upward into an emergency water-drainage ventilation shaft.","At 05:48 PM: An iron service ladder leads upward into an emergency water-drainage ventilation shaft.","Notice this clue: An iron service ladder leads upward into an emergency water-drainage ventilation shaft."],"hints":["Metal rungs attached to a vertical tunnel wall used to climb up or down.","Clue hint: Think about ventilation shaft ladder.","Search for: the heist crew planned to escape by climbing up to an ocean bay slipway."],"clues":["Ventilation Shaft Ladder","Item: Ventilation Shaft Ladder","Clue Word: Ventilation Shaft Ladder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7d68fdd5-7b35-5211-ace3-189f29da52e9',
  'story_045',
  'ev_7',
  7,
  '05:52 PM',
  'A tactical gas mask with tinted goggles is discarded by Vincent Cole.',
  'A tactical gas mask with tinted goggles is discarded by Vincent Cole.',
  'The lead guard was equipped to operate comfortably in the dense smoke.',
  'Tactical Gas Mask',
  'Military M50 gas mask with twin chemical particulate filters.',
  '["Dust Mask","Oxygen Mask","Scuba Mask"]'::jsonb,
  'Tactical Gas Mask',
  '["tactical gas mask","mask","gas mask","tactical mask","respirator"]'::jsonb,
  'A protective rubber face covering that filters out smoke and poisonous gases.',
  'ev_8',
  false,
  '{"descriptions":["A tactical gas mask with tinted goggles is discarded by Vincent Cole.","At 05:52 PM: A tactical gas mask with tinted goggles is discarded by Vincent Cole.","Notice this clue: A tactical gas mask with tinted goggles is discarded by Vincent Cole."],"hints":["A protective rubber face covering that filters out smoke and poisonous gases.","Clue hint: Think about tactical gas mask.","Search for: the lead guard was equipped to operate comfortably in the dense smoke."],"clues":["Tactical Gas Mask","Item: Tactical Gas Mask","Clue Word: Tactical Gas Mask"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7e7a251e-7cfe-5c6a-a593-1be2c406b0d2',
  'story_045',
  'ev_8',
  8,
  '06:05 PM',
  'Carbon monoxide meters in the tunnel sound loud warning chimes at 200 PPM.',
  'Carbon monoxide meters in the tunnel sound loud warning chimes at 200 PPM.',
  'Idling car engines were poisoning the trapped motorists with toxic exhaust fumes.',
  'Carbon Monoxide Meter',
  'Tunnel air quality monitor flashing RED EMERGENCY CO WARNING.',
  '["Smoke Detector","Fire Alarm","Speed Gun"]'::jsonb,
  'Carbon Monoxide Meter',
  '["carbon monoxide meter","meter","co meter","gas meter"]'::jsonb,
  'A safety sensor that beeps when car exhaust builds up dangerously in enclosed spaces.',
  NULL,
  true,
  '{"descriptions":["Carbon monoxide meters in the tunnel sound loud warning chimes at 200 PPM.","At 06:05 PM: Carbon monoxide meters in the tunnel sound loud warning chimes at 200 PPM.","Notice this clue: Carbon monoxide meters in the tunnel sound loud warning chimes at 200 PPM."],"hints":["A safety sensor that beeps when car exhaust builds up dangerously in enclosed spaces.","Clue hint: Think about carbon monoxide meter.","Search for: idling car engines were poisoning the trapped motorists with toxic exhaust fumes."],"clues":["Carbon Monoxide Meter","Item: Carbon Monoxide Meter","Clue Word: Carbon Monoxide Meter"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_046 — THE SAFEHOUSE BREACH
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_046',
  'The Safehouse Breach',
  'Thriller',
  'FBI Fortified Safehouse, rural wooded cabin with reinforced steel shutters and hidden cameras',
  'An undercover federal agent was found tied to a chair inside a locked safehouse; the star witness was gone.',
  '[{"name":"David Vance","role":"FBI Supervisory Case Agent","alibi":"Found tied up inside the safehouse living room","avatar":"👮"},{"name":"Tommy \"The Canary\" Rossi","role":"Protected Mob Witness","alibi":"Missing person abducted from the safehouse","avatar":"🐦"},{"name":"Agent Kelly Sterling","role":"Tactical Extraction Specialist","alibi":"Arrived with the relief team at 6:00 AM","avatar":"🔍"},{"name":"Carlos \"El Martillo\" Vega","role":"Syndicate Enforcer","alibi":"Fleeing in a black SUV convoy toward the state quarry","avatar":"🪓"}]'::jsonb,
  'Case Agent David Vance was forced by the syndicate to betray his post. He used his official codes to let the hit squad into the safehouse to abduct the star witness, then had the cartel tie him up to simulate a violent surprise breach.',
  'Case Agent David Vance',
  'David was blackmailed by the syndicate because they held his kidnapped daughter hostage.',
  '[{"time":"01:00 AM","event":"David receives a proof-of-life photo of his kidnapped daughter."},{"time":"02:14 AM","event":"David enters his master biometric code to disable the safehouse alarm."},{"time":"02:16 AM","event":"The cartel hit squad enters through the front door and captures Tommy."},{"time":"02:25 AM","event":"Carlos zip-ties David loosely to the wooden chair at David’s request."},{"time":"06:00 AM","event":"The morning relief team arrives and finds the staged crime scene."}]'::jsonb,
  '[{"id":"ev1","title":"Keypad Log Signed Agent D. Vance","detail":"Proves the safehouse alarm was disabled using David’s personal biometric code."},{"id":"ev2","title":"Zip-Tie Plastic Wrapper in David’s Pocket","detail":"Shows David supplied the cable ties used to stage his own restraint."},{"id":"ev3","title":"Kidnap Threat Photo on Burner Phone","detail":"Confirms the cartel extorted David by abducting his young daughter."},{"id":"ev4","title":"Shoe Heel GPS Transmission","detail":"Live coordinates pinpointing the cartel convoy at the abandoned limestone quarry."}]'::jsonb,
  '[{"order":1,"title":"Keypad Entry Log","text":"Digital record showing the alarm was disabled by the supervising agent."},{"order":2,"title":"White Zip-Ties","text":"Loose plastic restraints used to simulate a violent ambush."},{"order":3,"title":"Asthma Inhaler","text":"Medical device left behind by the abducted star witness."},{"order":4,"title":"Kidnap Photo Message","text":"Extortion message revealing why the federal agent betrayed his safehouse."},{"order":5,"title":"Undamaged Steel Shutters","text":"Ballistic window covers proving no physical breach occurred from outside."},{"order":6,"title":"Shoe Heel GPS Tracker","text":"Hidden radio beacon transmitting the location of the escaping cartel convoy."}]'::jsonb,
  'David had bruises on his arms.: Self-inflicted by banging his forearms against the wooden chair to look beaten.; The cabin back door was left ajar.: Opened from the inside by David to let the cold wind blow through.',
  'Claim the witness escaped on his own or blame the perimeter patrol squad.',
  'NORMAL',
  'Who breached the fortified safehouse without triggering the laser perimeter or door alarms?',
  '[{"character":"David Vance","secret":"He surrendered the witness to save his daughter from cartel kidnappers."},{"character":"Tommy \"The Canary\" Rossi","secret":"He kept a duplicate set of financial syndicate ledgers hidden in his shoe heel."},{"character":"Agent Kelly Sterling","secret":"She suspected an internal leak was compromising witness protection locations."},{"character":"Carlos \"El Martillo\" Vega","secret":"He called David three hours earlier to confirm the exchange."}]'::jsonb,
  '[{"lead":"David had bruises on his arms.","explanation":"Self-inflicted by banging his forearms against the wooden chair to look beaten."},{"lead":"The cabin back door was left ajar.","explanation":"Opened from the inside by David to let the cold wind blow through."}]'::jsonb,
  '{"wrongTheories":["An elite cartel assault squad breached the safehouse using military flashbang grenades.","Protected witness Tommy staged his own escape to flee the country."],"correctTheory":"Supervisory Agent David Vance disarmed the safehouse with his own biometric codes and staged his own restraint using zip-ties because the cartel held his daughter hostage, allowing the hit squad to abduct witness Tommy."}'::jsonb,
  'Agent David Vance opened the door because the cartel kidnapped his daughter!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Agent Sterling tracked the shoe GPS beacon to the quarry, rescuing both Tommy and David’s daughter in a simultaneous tactical assault. David was relieved of duty but spared treason charges."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The cartel eliminated witness Tommy at the quarry. David was framed as a corrupt rogue agent and spent the rest of his life in federal prison."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The bureau classified the breach as an unprecedented tactical failure. The mafia boss walked free and the safehouse was abandoned."}]'::jsonb,
  '{"intros":["An undercover federal agent was found tied to a chair inside a locked safehouse; the star witness was gone.","Case file story_046: An undercover federal agent was found tied to a chair inside a locked safehouse; the star witness was gone. Look closely at every clue.","Trouble begins in FBI Fortified Safehouse, rural wooded cabin with reinforced steel shutters and hidden cameras. An undercover federal agent was found tied to a chair inside a locked safehouse; the star witness was gone.","The mystery starts now. An undercover federal agent was found tied to a chair inside a locked safehouse; the star witness was gone. Can you solve it?"],"reveals":["Agent David Vance opened the door because the cartel kidnapped his daughter!","The mystery is unraveled! Agent David Vance opened the door because the cartel kidnapped his daughter!","At last, the truth comes out: Agent David Vance opened the door because the cartel kidnapped his daughter!","Case resolved! Here is what happened: Agent David Vance opened the door because the cartel kidnapped his daughter!"],"hints":["Pay attention to where Case Agent David Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_046';
DELETE FROM public.case_events WHERE case_id = 'story_046';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5c1e528c-e869-51c1-86df-a57d0cc22d4c',
  'story_046',
  'David Vance',
  'FBI Supervisory Case Agent',
  'Exhausted, bruised, sweating, tied with zip-ties to a wooden chair',
  'They came through the back window with flashbangs! I was overpowered before I could draw my gun.',
  'He surrendered the witness to save his daughter from cartel kidnappers.',
  'Found tied up inside the safehouse living room',
  'Sole agent possessing the master biometric disarm codes',
  'The cartel convoy took witness Tommy to an abandoned quarry.',
  'Did not notice he still had the zip-tie plastic pull-tab in his own pocket.',
  '👮',
  '["They came through the back window with flashbangs! I was overpowered before I could draw my gun.","\"They came through the back window with flashbangs! I was overpowered before I could draw my gun.\"","Listen to me: They came through the back window with flashbangs! I was overpowered before I could draw my gun.","I tell you the truth: They came through the back window with flashbangs! I was overpowered before I could draw my gun."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '482bda57-ca1a-5fc8-b9d6-b2a1aa6a2f84',
  'story_046',
  'Tommy "The Canary" Rossi',
  'Protected Mob Witness',
  'Nervous, chain-smoker, wearing civilian clothes',
  'Missing person; left his asthma inhaler and coffee cup on the kitchen counter.',
  'He kept a duplicate set of financial syndicate ledgers hidden in his shoe heel.',
  'Missing person abducted from the safehouse',
  'Star witness scheduled to testify against the mafia boss tomorrow',
  'Saw David open the front door with his keycard and smile at the hit squad.',
  'Did not know where the cartel was taking him.',
  '🐦',
  '["Missing person; left his asthma inhaler and coffee cup on the kitchen counter.","\"Missing person; left his asthma inhaler and coffee cup on the kitchen counter.\"","Listen to me: Missing person; left his asthma inhaler and coffee cup on the kitchen counter.","I tell you the truth: Missing person; left his asthma inhaler and coffee cup on the kitchen counter."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '450f9d2f-c6d2-5c94-9563-318dc958f26b',
  'story_046',
  'Agent Kelly Sterling',
  'Tactical Extraction Specialist',
  'Sharp, suspicious, inspecting the undamaged steel window shutters',
  'The steel shutters are bolted from the inside. There is zero evidence of a flashbang breach.',
  'She suspected an internal leak was compromising witness protection locations.',
  'Arrived with the relief team at 6:00 AM',
  'Investigating the compromised safehouse',
  'The alarm disarm code was entered at 2:14 AM using David’s primary keycard.',
  'Did not immediately know David’s daughter was being held hostage.',
  '🔍',
  '["The steel shutters are bolted from the inside. There is zero evidence of a flashbang breach.","\"The steel shutters are bolted from the inside. There is zero evidence of a flashbang breach.\"","Listen to me: The steel shutters are bolted from the inside. There is zero evidence of a flashbang breach.","I tell you the truth: The steel shutters are bolted from the inside. There is zero evidence of a flashbang breach."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '31f8f8e8-bfbf-54ef-96a1-8d485843e592',
  'story_046',
  'Carlos "El Martillo" Vega',
  'Syndicate Enforcer',
  'Ruthless, heavy leather trenchcoat, armed with suppressed automatic rifle',
  'The federals are soft. We take what we want whenever we want.',
  'He called David three hours earlier to confirm the exchange.',
  'Fleeing in a black SUV convoy toward the state quarry',
  'Leader of the abduction hit squad',
  'David followed their instructions perfectly down to the zip-tie staging.',
  'Did not realize Tommy’s shoe had an active GPS tracking transmitter.',
  '🪓',
  '["The federals are soft. We take what we want whenever we want.","\"The federals are soft. We take what we want whenever we want.\"","Listen to me: The federals are soft. We take what we want whenever we want.","I tell you the truth: The federals are soft. We take what we want whenever we want."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '85c39ec5-e668-51ac-86c6-b58fc9e1590d',
  'story_046',
  'ev_1',
  1,
  '02:14 AM',
  'The digital keypad log records: "ALARM DISARMED - AGENT D. VANCE".',
  'The digital keypad log records: "ALARM DISARMED - AGENT D. VANCE".',
  'The safehouse security grid was disarmed using authorized supervisor credentials.',
  'Keypad Entry Log',
  'Digital audit log showing David’s biometric fingerprint and PIN disarm.',
  '["Wiring Short","Burnt Fuse","Keyhole Scrape"]'::jsonb,
  'Keypad Entry Log',
  '["keypad entry log","log","keypad log","entry log","audit log"]'::jsonb,
  'A digital record on a security keypad showing who turned off the alarm.',
  'ev_2',
  true,
  '{"descriptions":["The digital keypad log records: \"ALARM DISARMED - AGENT D. VANCE\".","At 02:14 AM: The digital keypad log records: \"ALARM DISARMED - AGENT D. VANCE\".","Notice this clue: The digital keypad log records: \"ALARM DISARMED - AGENT D. VANCE\"."],"hints":["A digital record on a security keypad showing who turned off the alarm.","Clue hint: Think about keypad entry log.","Search for: the safehouse security grid was disarmed using authorized supervisor credentials."],"clues":["Keypad Entry Log","Item: Keypad Entry Log","Clue Word: Keypad Entry Log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7a3ec501-3a88-5555-b837-34f68924e96d',
  'story_046',
  'ev_2',
  2,
  '02:25 AM',
  'Heavy white nylon zip-ties bind David’s wrists loosely behind the chair.',
  'Heavy white nylon zip-ties bind David’s wrists loosely behind the chair.',
  'The ties were loose enough for a trained agent to slip out of in thirty seconds.',
  'White Zip-Ties',
  'Industrial plastic cable ties with excess tail tabs cut cleanly with scissors.',
  '["Hemp Rope","Steel Handcuffs","Duct Tape"]'::jsonb,
  'White Zip-Ties',
  '["white zip-ties","zip ties","zip-ties","ties","plastic ties"]'::jsonb,
  'Plastic ratchet straps used to bundle cables or bind wrists.',
  'ev_3',
  false,
  '{"descriptions":["Heavy white nylon zip-ties bind David’s wrists loosely behind the chair.","At 02:25 AM: Heavy white nylon zip-ties bind David’s wrists loosely behind the chair.","Notice this clue: Heavy white nylon zip-ties bind David’s wrists loosely behind the chair."],"hints":["Plastic ratchet straps used to bundle cables or bind wrists.","Clue hint: Think about white zip-ties.","Search for: the ties were loose enough for a trained agent to slip out of in thirty seconds."],"clues":["White Zip-Ties","Item: White Zip-Ties","Clue Word: White Zip-Ties"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4d9ec44c-ac21-59fe-8345-72b2f02ab45d',
  'story_046',
  'ev_3',
  3,
  '02:30 AM',
  'A plastic zip-tie packaging tear-off tab is found inside David’s trousers pocket.',
  'A plastic zip-tie packaging tear-off tab is found inside David’s trousers pocket.',
  'David provided the zip-ties from his own tactical field bag.',
  'Zip-Tie Packaging Tab',
  'Clear plastic packaging corner matching the zip-ties on David’s wrists.',
  '["Gum Wrapper","Receipt","Ticket"]'::jsonb,
  'Zip-Tie Packaging Tab',
  '["zip-tie packaging tab","packaging","zip-tie tab","tab","plastic tab"]'::jsonb,
  'A torn corner of a plastic bag used to package commercial hardware items.',
  'ev_4',
  false,
  '{"descriptions":["A plastic zip-tie packaging tear-off tab is found inside David’s trousers pocket.","At 02:30 AM: A plastic zip-tie packaging tear-off tab is found inside David’s trousers pocket.","Notice this clue: A plastic zip-tie packaging tear-off tab is found inside David’s trousers pocket."],"hints":["A torn corner of a plastic bag used to package commercial hardware items.","Clue hint: Think about zip-tie packaging tab.","Search for: david provided the zip-ties from his own tactical field bag."],"clues":["Zip-Tie Packaging Tab","Item: Zip-Tie Packaging Tab","Clue Word: Zip-Tie Packaging Tab"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8211c947-f1a4-5a2e-a1a9-dc41afeabb7b',
  'story_046',
  'ev_4',
  4,
  '02:40 AM',
  'A medical asthma inhaler belonging to witness Tommy sits on the kitchen counter.',
  'A medical asthma inhaler belonging to witness Tommy sits on the kitchen counter.',
  'Tommy was taken in a hurry without his essential daily prescription.',
  'Asthma Inhaler',
  'Blue plastic aerosol inhaler prescribed to Tommy Rossi.',
  '["Eyedrops","Pill Bottle","Lighter"]'::jsonb,
  'Asthma Inhaler',
  '["asthma inhaler","inhaler","medicine","blue inhaler"]'::jsonb,
  'A small plastic spray device used by people with asthma to breathe easily.',
  'ev_5',
  false,
  '{"descriptions":["A medical asthma inhaler belonging to witness Tommy sits on the kitchen counter.","At 02:40 AM: A medical asthma inhaler belonging to witness Tommy sits on the kitchen counter.","Notice this clue: A medical asthma inhaler belonging to witness Tommy sits on the kitchen counter."],"hints":["A small plastic spray device used by people with asthma to breathe easily.","Clue hint: Think about asthma inhaler.","Search for: tommy was taken in a hurry without his essential daily prescription."],"clues":["Asthma Inhaler","Item: Asthma Inhaler","Clue Word: Asthma Inhaler"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '488d0342-c2f2-5586-a965-61507218f276',
  'story_046',
  'ev_5',
  5,
  '03:00 AM',
  'A burner cell phone in the trash displays a photo of David’s bound daughter.',
  'A burner cell phone in the trash displays a photo of David’s bound daughter.',
  'The cartel forced David’s cooperation by holding his child hostage.',
  'Kidnap Photo Message',
  'Burner flip-phone displaying an MMS image: "Open the door or she dies."',
  '["Threat Letter","Map","Audio Tape"]'::jsonb,
  'Kidnap Photo Message',
  '["kidnap photo message","photo","kidnap photo","message","phone photo"]'::jsonb,
  'A picture sent to a phone showing a captive person held under threat.',
  'ev_6',
  true,
  '{"descriptions":["A burner cell phone in the trash displays a photo of David’s bound daughter.","At 03:00 AM: A burner cell phone in the trash displays a photo of David’s bound daughter.","Notice this clue: A burner cell phone in the trash displays a photo of David’s bound daughter."],"hints":["A picture sent to a phone showing a captive person held under threat.","Clue hint: Think about kidnap photo message.","Search for: the cartel forced david’s cooperation by holding his child hostage."],"clues":["Kidnap Photo Message","Item: Kidnap Photo Message","Clue Word: Kidnap Photo Message"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e790b086-5898-5afa-b411-a73aaa279b44',
  'story_046',
  'ev_6',
  6,
  '03:30 AM',
  'Reinforced ballistic steel window shutters are inspected and found completely intact.',
  'Reinforced ballistic steel window shutters are inspected and found completely intact.',
  'There was zero forced entry; the flashbang story was a complete fabrication.',
  'Undamaged Steel Shutters',
  'Heavy steel window plates bolted firmly into the cabin log frames.',
  '["Shattered Glass","Bent Bars","Broken Lock"]'::jsonb,
  'Undamaged Steel Shutters',
  '["undamaged steel shutters","shutters","steel shutters","window shutters"]'::jsonb,
  'Heavy metal plates covering windows from the inside for ballistic protection.',
  'ev_7',
  false,
  '{"descriptions":["Reinforced ballistic steel window shutters are inspected and found completely intact.","At 03:30 AM: Reinforced ballistic steel window shutters are inspected and found completely intact.","Notice this clue: Reinforced ballistic steel window shutters are inspected and found completely intact."],"hints":["Heavy metal plates covering windows from the inside for ballistic protection.","Clue hint: Think about undamaged steel shutters.","Search for: there was zero forced entry; the flashbang story was a complete fabrication."],"clues":["Undamaged Steel Shutters","Item: Undamaged Steel Shutters","Clue Word: Undamaged Steel Shutters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4f46777e-d856-5702-a1d8-1a71c651b0b0',
  'story_046',
  'ev_7',
  7,
  '04:00 AM',
  'Tire impressions from a black Suburban convoy head toward the abandoned limestone quarry.',
  'Tire impressions from a black Suburban convoy head toward the abandoned limestone quarry.',
  'The cartel vehicles left identifiable mud tread patterns on the gravel lane.',
  'SUV Tire Tracks',
  'Deep mud impressions matching heavy all-terrain 4x4 tires.',
  '["Car Tracks","Motorcycle Marks","Bicycle Skid"]'::jsonb,
  'SUV Tire Tracks',
  '["suv tire tracks","tire tracks","tracks","tread marks","suv tracks"]'::jsonb,
  'Wheel grooves left in wet gravel by heavy four-wheel-drive vehicles.',
  'ev_8',
  false,
  '{"descriptions":["Tire impressions from a black Suburban convoy head toward the abandoned limestone quarry.","At 04:00 AM: Tire impressions from a black Suburban convoy head toward the abandoned limestone quarry.","Notice this clue: Tire impressions from a black Suburban convoy head toward the abandoned limestone quarry."],"hints":["Wheel grooves left in wet gravel by heavy four-wheel-drive vehicles.","Clue hint: Think about suv tire tracks.","Search for: the cartel vehicles left identifiable mud tread patterns on the gravel lane."],"clues":["SUV Tire Tracks","Item: SUV Tire Tracks","Clue Word: SUV Tire Tracks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cdb90b9c-f2d3-5532-aab6-dfd2023ff939',
  'story_046',
  'ev_8',
  8,
  '04:30 AM',
  'A miniature GPS satellite transmitter is embedded in the rubber heel of Tommy’s shoe.',
  'A miniature GPS satellite transmitter is embedded in the rubber heel of Tommy’s shoe.',
  'The witness secretly carried an active tracker leading straight to the quarry.',
  'Shoe Heel GPS Tracker',
  'Microscopic lithium-powered radio beacon hidden under the rubber sole.',
  '["Compass","Flashlight","Pocket Knife"]'::jsonb,
  'Shoe Heel GPS Tracker',
  '["shoe heel gps tracker","tracker","gps tracker","gps","beacon","shoe tracker"]'::jsonb,
  'A tiny electronic chip hidden inside footwear that broadcasts location coordinates.',
  NULL,
  true,
  '{"descriptions":["A miniature GPS satellite transmitter is embedded in the rubber heel of Tommy’s shoe.","At 04:30 AM: A miniature GPS satellite transmitter is embedded in the rubber heel of Tommy’s shoe.","Notice this clue: A miniature GPS satellite transmitter is embedded in the rubber heel of Tommy’s shoe."],"hints":["A tiny electronic chip hidden inside footwear that broadcasts location coordinates.","Clue hint: Think about shoe heel gps tracker.","Search for: the witness secretly carried an active tracker leading straight to the quarry."],"clues":["Shoe Heel GPS Tracker","Item: Shoe Heel GPS Tracker","Clue Word: Shoe Heel GPS Tracker"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_047 — THE RANSOM AT CENTRAL STATION
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_047',
  'The Ransom at Central Station',
  'Thriller',
  'Grand Central Station Main Concourse, crowded marble terminal under starry ceiling, echoing footsteps',
  'A ransom drop of one million dollars in Locker 412 was triggered by a red key dropped into a crowded cafe cup.',
  '[{"name":"Carl Vance","role":"Night Shift Station Janitor","alibi":"Mopping the floor outside the locker alcove","avatar":"🧹"},{"name":"Agent David Cole","role":"Lead FBI Kidnapping Investigator","alibi":"Seated at the concourse cafe pretending to read a newspaper","avatar":"🕵️"},{"name":"Nora Higgins","role":"Station Cafe Barista","alibi":"Behind the espresso counter","avatar":"☕"},{"name":"Marcus \"Ghost\" Reed","role":"Kidnapper & Mastermind","alibi":"Standing on the upper taxi overpass monitoring police movements","avatar":"🕶️"}]'::jsonb,
  'Station janitor Carl Vance was hired by the kidnappers. While federal agents watched the front doors of Locker 412, Carl opened the hidden maintenance access hatch behind the lockers in the service tunnel, emptied the cash duffel, and walked out wearing his janitor jumpsuit.',
  'Station Janitor Carl Vance',
  'Carl was paid fifty thousand dollars by the kidnapper to swap the locker contents through the rear maintenance wall.',
  '[{"time":"03:00 PM","event":"FBI agents place the one-million-dollar cash duffel into Locker 412."},{"time":"03:15 PM","event":"A decoy runner drops a red key into the cafe tip jar, triggering FBI pursuit."},{"time":"03:16 PM","event":"While agents watch the front, Carl enters the rear maintenance tunnel."},{"time":"03:18 PM","event":"Carl removes the rear steel panel of Locker 412 and pulls the cash duffel out."},{"time":"03:30 PM","event":"FBI opens Locker 412 from the front and finds it completely empty."}]'::jsonb,
  '[{"id":"ev1","title":"Unscrewed Rear Locker Panel","detail":"Shows the cash was taken from inside the private maintenance tunnel, not the front door."},{"id":"ev2","title":"Glowing Orange UV Dye on Janitor Gloves","detail":"Directly links Carl Vance to handling the dusted ransom duffel bag."},{"id":"ev3","title":"Ransom Duffel in Yellow Janitor Cart","detail":"One million dollars in marked bills recovered beneath dirty cleaning rags."},{"id":"ev4","title":"Fifty-Thousand-Dollar Bribe Stash","detail":"Found in Carl’s basement locker alongside the station architectural schematics."}]'::jsonb,
  '[{"order":1,"title":"Red Locker Key","text":"Decoy key dropped into the cafe tip jar to distract surveillance agents."},{"order":2,"title":"Removable Locker Panel","text":"Steel plate unbolted from the rear tunnel to empty Locker 412."},{"order":3,"title":"Ransom Duffel Bag","text":"Black bag containing one million dollars in marked bills."},{"order":4,"title":"Fluorescent Dye Powder","text":"Invisible tracking dust that transferred onto the thief’s hands."},{"order":5,"title":"Yellow Janitor Cart","text":"Cleaning cart used to wheel the million dollars out of the terminal."},{"order":6,"title":"Station Blueprints","text":"Historic schematics revealing the secret passage behind the luggage lockers."}]'::jsonb,
  'Nora the barista dropped the key in panic.: An innocent worker terrified by the sudden commotion.; A passenger in a trenchcoat ran toward the subway.: A paid decoy hired for twenty dollars to sprint away.',
  'Claim an invisible drone flew into the locker or blame the cafe barista.',
  'NORMAL',
  'Who took the ransom money from Locker 412 in plain sight of twenty federal surveillance agents?',
  '[{"character":"Carl Vance","secret":"He hid the one million dollars in cash inside his dirty laundry barrel."},{"character":"Agent David Cole","secret":"He authorized the ransom drop without informing his field director."},{"character":"Nora Higgins","secret":"She panicked and accidentally kicked the key under the pastry counter."},{"character":"Marcus \"Ghost\" Reed","secret":"He planned the heist using the 1920 blueprints of Grand Central Station."}]'::jsonb,
  '[{"lead":"Nora the barista dropped the key in panic.","explanation":"An innocent worker terrified by the sudden commotion."},{"lead":"A passenger in a trenchcoat ran toward the subway.","explanation":"A paid decoy hired for twenty dollars to sprint away."}]'::jsonb,
  '{"wrongTheories":["The kidnapper used an invisible drone to fly inside Locker 412 and extract the cash.","The FBI agents accidentally placed the money in the wrong locker number."],"correctTheory":"Station janitor Carl Vance was bribed fifty thousand dollars by the kidnapper to access Locker 412 from the hidden maintenance tunnel behind the wall, emptying the duffel bag into his janitor cart while the FBI watched the front door."}'::jsonb,
  'Janitor Carl Vance emptied the locker from the secret rear maintenance tunnel!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"FBI blacklights exposed the glowing orange dye on Carl’s gloves. Carl confessed, the million dollars was recovered, and the hostage was located safely in an upstate cabin."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The FBI pursued the decoy runner through the subway. Carl wheeled the million dollars to a waiting getaway car, leaving the bureau humiliated."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The theft was written off as a legendary \"phantom con\" by urban folklore. Carl retired to a Florida beachfront condo with his bribe."}]'::jsonb,
  '{"intros":["A ransom drop of one million dollars in Locker 412 was triggered by a red key dropped into a crowded cafe cup.","Case file story_047: A ransom drop of one million dollars in Locker 412 was triggered by a red key dropped into a crowded cafe cup. Look closely at every clue.","Trouble begins in Grand Central Station Main Concourse, crowded marble terminal under starry ceiling, echoing footsteps. A ransom drop of one million dollars in Locker 412 was triggered by a red key dropped into a crowded cafe cup.","The mystery starts now. A ransom drop of one million dollars in Locker 412 was triggered by a red key dropped into a crowded cafe cup. Can you solve it?"],"reveals":["Janitor Carl Vance emptied the locker from the secret rear maintenance tunnel!","The mystery is unraveled! Janitor Carl Vance emptied the locker from the secret rear maintenance tunnel!","At last, the truth comes out: Janitor Carl Vance emptied the locker from the secret rear maintenance tunnel!","Case resolved! Here is what happened: Janitor Carl Vance emptied the locker from the secret rear maintenance tunnel!"],"hints":["Pay attention to where Station Janitor Carl Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_047';
DELETE FROM public.case_events WHERE case_id = 'story_047';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ebc60d16-2165-53da-80e6-48b916d5c8a0',
  'story_047',
  'Carl Vance',
  'Night Shift Station Janitor',
  'Quiet, invisible in his blue uniform, pushing a large yellow trash bin',
  'I was just mopping the north terminal floor near the luggage lockers.',
  'He hid the one million dollars in cash inside his dirty laundry barrel.',
  'Mopping the floor outside the locker alcove',
  'Has maintenance keys to the private rear service tunnels',
  'The lockers have removable rear steel plates for emergency maintenance.',
  'Did not know the money was dusted with fluorescent orange ultraviolet powder.',
  '🧹',
  '["I was just mopping the north terminal floor near the luggage lockers.","\"I was just mopping the north terminal floor near the luggage lockers.\"","Listen to me: I was just mopping the north terminal floor near the luggage lockers.","I tell you the truth: I was just mopping the north terminal floor near the luggage lockers."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'cb288d6f-3972-5a38-b156-6dc1cc55d72e',
  'story_047',
  'Agent David Cole',
  'Lead FBI Kidnapping Investigator',
  'Intense, wired on coffee, whispering into his collar microphone',
  'We had eyes on Locker 412 from four different angles. Nobody opened that front door!',
  'He authorized the ransom drop without informing his field director.',
  'Seated at the concourse cafe pretending to read a newspaper',
  'In charge of the sting operation to catch the kidnapper',
  'The ransom bag contained marked hundred-dollar bills dusted with UV powder.',
  'Did not consider that the lockers could be accessed from behind the wall.',
  '🕵️',
  '["We had eyes on Locker 412 from four different angles. Nobody opened that front door!","\"We had eyes on Locker 412 from four different angles. Nobody opened that front door!\"","Listen to me: We had eyes on Locker 412 from four different angles. Nobody opened that front door!","I tell you the truth: We had eyes on Locker 412 from four different angles. Nobody opened that front door!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fbff879c-08d9-5bd6-8d40-d5f402657782',
  'story_047',
  'Nora Higgins',
  'Station Cafe Barista',
  'Terrified, fast-moving, holding a dropped ceramic coffee mug',
  'A man in a trenchcoat dropped a red locker key into my tip jar and ran into the crowd!',
  'She panicked and accidentally kicked the key under the pastry counter.',
  'Behind the espresso counter',
  'Received the drop key from the anonymous runner',
  'The red key was stamped with number 412.',
  'Did not know the key was just a decoy to distract the surveillance team.',
  '☕',
  '["A man in a trenchcoat dropped a red locker key into my tip jar and ran into the crowd!","\"A man in a trenchcoat dropped a red locker key into my tip jar and ran into the crowd!\"","Listen to me: A man in a trenchcoat dropped a red locker key into my tip jar and ran into the crowd!","I tell you the truth: A man in a trenchcoat dropped a red locker key into my tip jar and ran into the crowd!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '09780a62-4265-51ce-8953-2488eda51b38',
  'story_047',
  'Marcus "Ghost" Reed',
  'Kidnapper & Mastermind',
  'Ruthless, distant, watching from the concourse balcony with binoculars',
  'Follow my instructions to the letter or the hostage never comes home.',
  'He planned the heist using the 1920 blueprints of Grand Central Station.',
  'Standing on the upper taxi overpass monitoring police movements',
  'Mastermind holding the wealthy executive’s son for ransom',
  'The FBI would focus all attention on the front locker doors.',
  'Did not know Carl’s gloves were contaminated with chemical tracking dye.',
  '🕶️',
  '["Follow my instructions to the letter or the hostage never comes home.","\"Follow my instructions to the letter or the hostage never comes home.\"","Listen to me: Follow my instructions to the letter or the hostage never comes home.","I tell you the truth: Follow my instructions to the letter or the hostage never comes home."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fd340f5c-62fc-5633-9b4a-bdd27a9bfabb',
  'story_047',
  'ev_1',
  1,
  '03:15 PM',
  'A bright red locker key stamped "#412" is dropped into the cafe tip jar.',
  'A bright red locker key stamped "#412" is dropped into the cafe tip jar.',
  'The key drop was a deliberate diversion to draw surveillance agents away.',
  'Red Locker Key',
  'Heavy brass key with red plastic fob stamped "CENTRAL STORAGE 412".',
  '["Car Key","House Key","Safe Key"]'::jsonb,
  'Red Locker Key',
  '["red locker key","key","red key","locker key","brass key"]'::jsonb,
  'A metal key with a bright red plastic tag used to unlock a station storage locker.',
  'ev_2',
  true,
  '{"descriptions":["A bright red locker key stamped \"#412\" is dropped into the cafe tip jar.","At 03:15 PM: A bright red locker key stamped \"#412\" is dropped into the cafe tip jar.","Notice this clue: A bright red locker key stamped \"#412\" is dropped into the cafe tip jar."],"hints":["A metal key with a bright red plastic tag used to unlock a station storage locker.","Clue hint: Think about red locker key.","Search for: the key drop was a deliberate diversion to draw surveillance agents away."],"clues":["Red Locker Key","Item: Red Locker Key","Clue Word: Red Locker Key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '68309c18-e018-57bd-bf28-8431b294f8f9',
  'story_047',
  'ev_2',
  2,
  '03:18 PM',
  'A removable rear steel plate on Locker 412 is unscrewed from inside the service shaft.',
  'A removable rear steel plate on Locker 412 is unscrewed from inside the service shaft.',
  'The locker was accessed from behind the wall through a maintenance tunnel.',
  'Removable Locker Panel',
  'Steel backing sheet with quick-release thumb screws removed.',
  '["Front Door","Side Wall","Floor Plate"]'::jsonb,
  'Removable Locker Panel',
  '["removable locker panel","panel","rear panel","locker panel","steel panel"]'::jsonb,
  'A metal sheet covering the back of a locker that unscrews from the maintenance side.',
  'ev_3',
  false,
  '{"descriptions":["A removable rear steel plate on Locker 412 is unscrewed from inside the service shaft.","At 03:18 PM: A removable rear steel plate on Locker 412 is unscrewed from inside the service shaft.","Notice this clue: A removable rear steel plate on Locker 412 is unscrewed from inside the service shaft."],"hints":["A metal sheet covering the back of a locker that unscrews from the maintenance side.","Clue hint: Think about removable locker panel.","Search for: the locker was accessed from behind the wall through a maintenance tunnel."],"clues":["Removable Locker Panel","Item: Removable Locker Panel","Clue Word: Removable Locker Panel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '370d4be8-3ede-5b02-a370-2bf36ee67dae',
  'story_047',
  'ev_3',
  3,
  '03:20 PM',
  'A large black canvas duffel bag containing one million dollars in marked bills is moved.',
  'A large black canvas duffel bag containing one million dollars in marked bills is moved.',
  'The ransom cash was transferred directly into Carl’s rolling janitor cart.',
  'Ransom Duffel Bag',
  'Heavy black nylon duffel bag packed with banded ten-thousand-dollar stacks.',
  '["Suitcase","Backpack","Briefcase"]'::jsonb,
  'Ransom Duffel Bag',
  '["ransom duffel bag","duffel bag","bag","ransom bag","duffel"]'::jsonb,
  'A large cylindrical canvas sports bag with zipper and carrying handles.',
  'ev_4',
  false,
  '{"descriptions":["A large black canvas duffel bag containing one million dollars in marked bills is moved.","At 03:20 PM: A large black canvas duffel bag containing one million dollars in marked bills is moved.","Notice this clue: A large black canvas duffel bag containing one million dollars in marked bills is moved."],"hints":["A large cylindrical canvas sports bag with zipper and carrying handles.","Clue hint: Think about ransom duffel bag.","Search for: the ransom cash was transferred directly into carl’s rolling janitor cart."],"clues":["Ransom Duffel Bag","Item: Ransom Duffel Bag","Clue Word: Ransom Duffel Bag"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7dd1dfe5-c4d8-516e-a8d9-8e1258c7b773',
  'story_047',
  'ev_4',
  4,
  '03:22 PM',
  'Bright orange fluorescent chemical powder glows under an ultraviolet blacklight.',
  'Bright orange fluorescent chemical powder glows under an ultraviolet blacklight.',
  'The money was dusted with invisible dye that transfers to skin and fabric.',
  'Fluorescent Dye Powder',
  'Forensic chemical powder glowing brilliant orange under 365nm UV light.',
  '["Chalk Dust","Gunpowder","Pollen"]'::jsonb,
  'Fluorescent Dye Powder',
  '["fluorescent dye powder","dye","powder","fluorescent dye","uv powder","orange powder"]'::jsonb,
  'Invisible chemical dust that glows brightly under blacklight to catch thieves.',
  'ev_5',
  false,
  '{"descriptions":["Bright orange fluorescent chemical powder glows under an ultraviolet blacklight.","At 03:22 PM: Bright orange fluorescent chemical powder glows under an ultraviolet blacklight.","Notice this clue: Bright orange fluorescent chemical powder glows under an ultraviolet blacklight."],"hints":["Invisible chemical dust that glows brightly under blacklight to catch thieves.","Clue hint: Think about fluorescent dye powder.","Search for: the money was dusted with invisible dye that transfers to skin and fabric."],"clues":["Fluorescent Dye Powder","Item: Fluorescent Dye Powder","Clue Word: Fluorescent Dye Powder"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '46effc3e-3dd6-547f-8c2b-faa8d8b29e5d',
  'story_047',
  'ev_5',
  5,
  '03:25 PM',
  'A yellow industrial rolling janitor mop bucket holds the cash duffel under dirty rags.',
  'A yellow industrial rolling janitor mop bucket holds the cash duffel under dirty rags.',
  'Carl hid the million-dollar bag inside his cleaning cart in plain sight.',
  'Yellow Janitor Cart',
  'Heavy plastic mobile cleaning cart with mop wringer and dirty linen compartment.',
  '["Trash Can","Luggage Cart","Wheelbarrow"]'::jsonb,
  'Yellow Janitor Cart',
  '["yellow janitor cart","cart","janitor cart","mop cart","bucket"]'::jsonb,
  'A large yellow plastic cart on wheels used by cleaners to carry mops and trash.',
  'ev_6',
  true,
  '{"descriptions":["A yellow industrial rolling janitor mop bucket holds the cash duffel under dirty rags.","At 03:25 PM: A yellow industrial rolling janitor mop bucket holds the cash duffel under dirty rags.","Notice this clue: A yellow industrial rolling janitor mop bucket holds the cash duffel under dirty rags."],"hints":["A large yellow plastic cart on wheels used by cleaners to carry mops and trash.","Clue hint: Think about yellow janitor cart.","Search for: carl hid the million-dollar bag inside his cleaning cart in plain sight."],"clues":["Yellow Janitor Cart","Item: Yellow Janitor Cart","Clue Word: Yellow Janitor Cart"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '988c32d7-a280-5254-8b1f-9664850e2352',
  'story_047',
  'ev_6',
  6,
  '03:35 PM',
  'A pair of heavy rubber cleaning gloves is covered in orange glowing dye under blacklight.',
  'A pair of heavy rubber cleaning gloves is covered in orange glowing dye under blacklight.',
  'Carl’s gloves were contaminated when he grabbed the ransom duffel bag.',
  'Glowing Rubber Gloves',
  'Yellow latex gloves shining bright orange under ultraviolet illumination.',
  '["Leather Gloves","Wool Mittens","Work Gloves"]'::jsonb,
  'Glowing Rubber Gloves',
  '["glowing rubber gloves","gloves","rubber gloves","glowing gloves","latex gloves"]'::jsonb,
  'Yellow rubber hand coverings that shine with bright glowing powder.',
  'ev_7',
  false,
  '{"descriptions":["A pair of heavy rubber cleaning gloves is covered in orange glowing dye under blacklight.","At 03:35 PM: A pair of heavy rubber cleaning gloves is covered in orange glowing dye under blacklight.","Notice this clue: A pair of heavy rubber cleaning gloves is covered in orange glowing dye under blacklight."],"hints":["Yellow rubber hand coverings that shine with bright glowing powder.","Clue hint: Think about glowing rubber gloves.","Search for: carl’s gloves were contaminated when he grabbed the ransom duffel bag."],"clues":["Glowing Rubber Gloves","Item: Glowing Rubber Gloves","Clue Word: Glowing Rubber Gloves"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd2b391d9-90cd-591d-b67e-3b7696878c83',
  'story_047',
  'ev_7',
  7,
  '03:45 PM',
  'A 1920 architectural blueprint of Grand Central showing the maintenance tunnel is seized.',
  'A 1920 architectural blueprint of Grand Central showing the maintenance tunnel is seized.',
  'The kidnapper used vintage station schematics to plan the rear locker breach.',
  'Station Blueprints',
  'Faded blue architectural drawing showing service passages behind Track 12.',
  '["Train Map","Subway Guide","Tourist Brochure"]'::jsonb,
  'Station Blueprints',
  '["station blueprints","blueprints","schematic","map"]'::jsonb,
  'Technical drawings showing the secret underground rooms and tunnels of a building.',
  'ev_8',
  false,
  '{"descriptions":["A 1920 architectural blueprint of Grand Central showing the maintenance tunnel is seized.","At 03:45 PM: A 1920 architectural blueprint of Grand Central showing the maintenance tunnel is seized.","Notice this clue: A 1920 architectural blueprint of Grand Central showing the maintenance tunnel is seized."],"hints":["Technical drawings showing the secret underground rooms and tunnels of a building.","Clue hint: Think about station blueprints.","Search for: the kidnapper used vintage station schematics to plan the rear locker breach."],"clues":["Station Blueprints","Item: Station Blueprints","Clue Word: Station Blueprints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd0d16e15-40b5-5066-b7d5-e71d1e074578',
  'story_047',
  'ev_8',
  8,
  '04:00 PM',
  'A fifty-thousand-dollar cash down-payment is found inside Carl’s basement locker.',
  'A fifty-thousand-dollar cash down-payment is found inside Carl’s basement locker.',
  'The janitor was paid upfront to extract the bag and leave it in a service van.',
  'Janitor Bribe Cash',
  'Stack of hundred-dollar bills wrapped in a maintenance supply invoice.',
  '["Checkbook","Paycheck","Credit Card"]'::jsonb,
  'Janitor Bribe Cash',
  '["janitor bribe cash","bribe","cash","bribe cash","money"]'::jsonb,
  'A bundle of cash paid to someone in secret to commit a crime.',
  NULL,
  true,
  '{"descriptions":["A fifty-thousand-dollar cash down-payment is found inside Carl’s basement locker.","At 04:00 PM: A fifty-thousand-dollar cash down-payment is found inside Carl’s basement locker.","Notice this clue: A fifty-thousand-dollar cash down-payment is found inside Carl’s basement locker."],"hints":["A bundle of cash paid to someone in secret to commit a crime.","Clue hint: Think about janitor bribe cash.","Search for: the janitor was paid upfront to extract the bag and leave it in a service van."],"clues":["Janitor Bribe Cash","Item: Janitor Bribe Cash","Clue Word: Janitor Bribe Cash"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_048 — THE STOLEN PROTOTYPE DRONE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_048',
  'The Stolen Prototype Drone',
  'Thriller',
  'Apex Aerospace Defense Hangar, top-secret airfield surrounded by electrified razor wire',
  'A classified military stealth drone flew out of a locked high-security hangar in the middle of a storm with zero human pilots on base.',
  '[{"name":"Leo Vance","role":"Chief Avionics Software Engineer","alibi":"At the airport highway motel sleeping","avatar":"💻"},{"name":"Colonel Frank Miller","role":"Air Base Commander","alibi":"In the base command center coordinating radar sweeps","avatar":"🪖"},{"name":"Sergeant Toby Cole","role":"Hangar Security Guard","alibi":"Standing guard at Hangar Gate 3","avatar":"🛡️"},{"name":"Agent Rachel Sterling","role":"Defense Counter-Intelligence Special Agent","alibi":"Arrived at the base at 4:00 AM following the Pentagon alert","avatar":"🔍"}]'::jsonb,
  'Software engineer Leo Vance programmed an autonomous rogue takeoff routine into the drone’s flight computer. Sitting at an off-base motel, he remotely opened the hangar skylight bay doors, launched the drone silently on electric battery power, and routed it to an offshore freighter.',
  'Flight Software Engineer Leo Vance',
  'Leo sold the stealth drone’s flight software and prototype to an adversarial foreign military for ten million dollars.',
  '[{"time":"11:42 PM","event":"Leo injects an autonomous rogue takeoff routine into the drone’s firmware."},{"time":"02:45 AM","event":"Leo logs into the base HVAC system to open the hydraulic hangar roof bay."},{"time":"03:00 AM","event":"The stealth drone lifts off silently and exits through the open roof."},{"time":"03:15 AM","event":"The drone drops to 30 feet above the ocean to evade military radar."},{"time":"04:00 AM","event":"Agent Sterling traces the SSH key to Leo’s motel room across the highway."}]'::jsonb,
  '[{"id":"ev1","title":"SSH Access Log with Leo’s Cryptographic Key","detail":"Proves the roof hatch and autonomous launch were triggered by Leo Vance."},{"id":"ev2","title":"Rogue Firmware Backdoor Code","detail":"Found in the drone’s flight computer compiler, authored exclusively by Leo."},{"id":"ev3","title":"Satellite Antenna at Motel Room 14","detail":"Linked directly to the real-time telemetry stream of the airborne stealth drone."},{"id":"ev4","title":"Ten Million Dollars in Bearer Bonds","detail":"Seized from Leo’s travel suitcase, proving high treason and espionage."}]'::jsonb,
  '[{"order":1,"title":"Hydraulic Roof Hatch","text":"Hangar roof bay opened remotely to allow the drone to take off into the rain."},{"order":2,"title":"Launch Cradle","text":"Pneumatic stand emptied when the silent autonomous aircraft departed."},{"order":3,"title":"Rogue Firmware Patch","text":"Hacked flight software code that bypassed all safety protocols."},{"order":4,"title":"Radar Tracking Log","text":"Radar plot showing the stealth drone flying low over the Atlantic."},{"order":5,"title":"SSH Terminal Log","text":"Digital forensic trail linking the remote commands to Leo’s motel IP."},{"order":6,"title":"Bearer Bond Certificates","text":"Ten million dollars in foreign payoff documents for the stolen military tech."}]'::jsonb,
  'Guard Toby was checking his phone during the launch.: Unprofessional, but he had no technical skill to hack flight firmware.; The drone’s onboard AI had minor navigation warnings.: Routine test logs, completely unrelated to the malicious backdoor code.',
  'Claim an artificial intelligence malfunctioned and flew away or blame the base security guard.',
  'NORMAL',
  'Who hijacked the drone from inside a locked hangar and where was it flown?',
  '[{"character":"Leo Vance","secret":"Received ten million dollars in foreign bearer bonds to deliver the drone."},{"character":"Colonel Frank Miller","secret":"He authorized Leo to work remotely on the software over the weekend."},{"character":"Sergeant Toby Cole","secret":"He was checking his smartphone when the hydraulic roof doors began sliding."},{"character":"Agent Rachel Sterling","secret":"Investigating unauthorized satellite communications from Leo’s IP address for a week."}]'::jsonb,
  '[{"lead":"Guard Toby was checking his phone during the launch.","explanation":"Unprofessional, but he had no technical skill to hack flight firmware."},{"lead":"The drone’s onboard AI had minor navigation warnings.","explanation":"Routine test logs, completely unrelated to the malicious backdoor code."}]'::jsonb,
  '{"wrongTheories":["The experimental AI achieved autonomous consciousness and escaped human control.","An enemy special forces team infiltrated the base and physically pushed the drone out."],"correctTheory":"Chief Software Engineer Leo Vance programmed a rogue autonomous flight backdoor, opened the hangar roof remotely from a motel room, and launched the stealth drone to deliver it to a foreign freighter for ten million dollars in bearer bonds."}'::jsonb,
  'Engineer Leo Vance hacked the flight software to sell the drone for ten million!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Agent Sterling raided the motel room and forced Leo to transmit the abort signal. The drone returned to base and Leo was charged with federal espionage and treason."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The drone landed safely on the foreign freighter. Leo slipped away with ten million dollars in bearer bonds and took asylum in an adversarial nation."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The Pentagon classified the event as an experimental crash in deep ocean waters. Leo retired in luxury while the military mourned a lost prototype."}]'::jsonb,
  '{"intros":["A classified military stealth drone flew out of a locked high-security hangar in the middle of a storm with zero human pilots on base.","Case file story_048: A classified military stealth drone flew out of a locked high-security hangar in the middle of a storm with zero human pilots on base. Look closely at every clue.","Trouble begins in Apex Aerospace Defense Hangar, top-secret airfield surrounded by electrified razor wire. A classified military stealth drone flew out of a locked high-security hangar in the middle of a storm with zero human pilots on base.","The mystery starts now. A classified military stealth drone flew out of a locked high-security hangar in the middle of a storm with zero human pilots on base. Can you solve it?"],"reveals":["Engineer Leo Vance hacked the flight software to sell the drone for ten million!","The mystery is unraveled! Engineer Leo Vance hacked the flight software to sell the drone for ten million!","At last, the truth comes out: Engineer Leo Vance hacked the flight software to sell the drone for ten million!","Case resolved! Here is what happened: Engineer Leo Vance hacked the flight software to sell the drone for ten million!"],"hints":["Pay attention to where Flight Software Engineer Leo Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_048';
DELETE FROM public.case_events WHERE case_id = 'story_048';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'dbd1264e-dace-5720-935f-ffdca62d1d00',
  'story_048',
  'Leo Vance',
  'Chief Avionics Software Engineer',
  'Arrogant, brilliant, wears designer glasses and carries an encrypted laptop',
  'The drone’s autonomous neural network suffered a logic glitch and initiated an emergency flight pattern.',
  'Received ten million dollars in foreign bearer bonds to deliver the drone.',
  'At the airport highway motel sleeping',
  'Sole author of the drone’s autonomous flight controller firmware',
  'The drone was programmed to fly thirty feet above sea level to stay under radar.',
  'Did not know the hangar roof hatch logged his private cryptographic SSH key.',
  '💻',
  '["The drone’s autonomous neural network suffered a logic glitch and initiated an emergency flight pattern.","\"The drone’s autonomous neural network suffered a logic glitch and initiated an emergency flight pattern.\"","Listen to me: The drone’s autonomous neural network suffered a logic glitch and initiated an emergency flight pattern.","I tell you the truth: The drone’s autonomous neural network suffered a logic glitch and initiated an emergency flight pattern."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9fff4729-3d35-57b3-a384-4cfa3947efdb',
  'story_048',
  'Colonel Frank Miller',
  'Air Base Commander',
  'Stern, furious, military uniform with ribbons, demanding answers',
  'That aircraft contains stealth coatings worth fifty million dollars of taxpayer research!',
  'He authorized Leo to work remotely on the software over the weekend.',
  'In the base command center coordinating radar sweeps',
  'Commander of the top-secret testing facility',
  'Military radar lost the drone three miles off the Atlantic coast.',
  'Did not suspect his chief programmer of treason.',
  '🪖',
  '["That aircraft contains stealth coatings worth fifty million dollars of taxpayer research!","\"That aircraft contains stealth coatings worth fifty million dollars of taxpayer research!\"","Listen to me: That aircraft contains stealth coatings worth fifty million dollars of taxpayer research!","I tell you the truth: That aircraft contains stealth coatings worth fifty million dollars of taxpayer research!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b4c989db-7e83-54ef-a129-d6984fd1a3db',
  'story_048',
  'Sergeant Toby Cole',
  'Hangar Security Guard',
  'Honest, bewildered, holding a heavy rifle by the open roof bay',
  'The roof bay opened automatically at 3:00 AM and the drone lifted straight up like a phantom.',
  'He was checking his smartphone when the hydraulic roof doors began sliding.',
  'Standing guard at Hangar Gate 3',
  'First witness to the unmanned stealth takeoff',
  'The drone’s electric ducted fans were completely silent in the rain.',
  'Could not stop the automated takeoff sequence from the ground floor.',
  '🛡️',
  '["The roof bay opened automatically at 3:00 AM and the drone lifted straight up like a phantom.","\"The roof bay opened automatically at 3:00 AM and the drone lifted straight up like a phantom.\"","Listen to me: The roof bay opened automatically at 3:00 AM and the drone lifted straight up like a phantom.","I tell you the truth: The roof bay opened automatically at 3:00 AM and the drone lifted straight up like a phantom."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ede77352-cca2-5a20-96fb-d01f5d59304d',
  'story_048',
  'Agent Rachel Sterling',
  'Defense Counter-Intelligence Special Agent',
  'Sharp, relentless, armed with cyber forensic flash drives',
  'Drones do not spontaneously develop free will and fly to foreign cargo ships.',
  'Investigating unauthorized satellite communications from Leo’s IP address for a week.',
  'Arrived at the base at 4:00 AM following the Pentagon alert',
  'Leading the treason and espionage investigation',
  'The flight firmware was modified at 11:42 PM using an encrypted backdoor.',
  'Did not immediately know the coordinates of the receiving cargo vessel.',
  '🔍',
  '["Drones do not spontaneously develop free will and fly to foreign cargo ships.","\"Drones do not spontaneously develop free will and fly to foreign cargo ships.\"","Listen to me: Drones do not spontaneously develop free will and fly to foreign cargo ships.","I tell you the truth: Drones do not spontaneously develop free will and fly to foreign cargo ships."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0690ead3-2ede-5105-ae5f-d18533b1335d',
  'story_048',
  'ev_1',
  1,
  '02:45 AM',
  'The massive hydraulic hangar roof bay doors slide open silently in the rain.',
  'The massive hydraulic hangar roof bay doors slide open silently in the rain.',
  'The roof was opened using an administrative HVAC override code from an external IP.',
  'Hydraulic Roof Hatch',
  'Two-ton reinforced roof doors locked in full open position.',
  '["Hangar Gate","Glass Window","Side Door"]'::jsonb,
  'Hydraulic Roof Hatch',
  '["hydraulic roof hatch","roof hatch","hatch","roof doors","hangar roof","doors"]'::jsonb,
  'Enormous metal doors on top of a building that open to the sky.',
  'ev_2',
  true,
  '{"descriptions":["The massive hydraulic hangar roof bay doors slide open silently in the rain.","At 02:45 AM: The massive hydraulic hangar roof bay doors slide open silently in the rain.","Notice this clue: The massive hydraulic hangar roof bay doors slide open silently in the rain."],"hints":["Enormous metal doors on top of a building that open to the sky.","Clue hint: Think about hydraulic roof hatch.","Search for: the roof was opened using an administrative hvac override code from an external ip."],"clues":["Hydraulic Roof Hatch","Item: Hydraulic Roof Hatch","Clue Word: Hydraulic Roof Hatch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ee9a172e-42e6-52e3-9d8d-4d1de7d0954c',
  'story_048',
  'ev_2',
  2,
  '03:00 AM',
  'An empty carbon-fiber launch cradle sits under the open roof bay.',
  'An empty carbon-fiber launch cradle sits under the open roof bay.',
  'The experimental RQ-99 "Shadow-X" stealth drone was cleanly launched.',
  'Launch Cradle',
  'Pneumatic launch stand with disconnected electrical umbilical cables.',
  '["Runway Strip","Helipad","Towing Cart"]'::jsonb,
  'Launch Cradle',
  '["launch cradle","cradle","stand","launch stand"]'::jsonb,
  'A specialized metal frame that holds an aircraft securely before launch.',
  'ev_3',
  false,
  '{"descriptions":["An empty carbon-fiber launch cradle sits under the open roof bay.","At 03:00 AM: An empty carbon-fiber launch cradle sits under the open roof bay.","Notice this clue: An empty carbon-fiber launch cradle sits under the open roof bay."],"hints":["A specialized metal frame that holds an aircraft securely before launch.","Clue hint: Think about launch cradle.","Search for: the experimental rq-99 \"shadow-x\" stealth drone was cleanly launched."],"clues":["Launch Cradle","Item: Launch Cradle","Clue Word: Launch Cradle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e10ce3b5-f7ef-5c11-aeda-1540b672c2c8',
  'story_048',
  'ev_3',
  3,
  '03:05 AM',
  'A modified firmware hex code file named "PATRIOT_FAILSAFE.bin" is found on the server.',
  'A modified firmware hex code file named "PATRIOT_FAILSAFE.bin" is found on the server.',
  'The software contained an encrypted backdoor routine bypassing human controls.',
  'Rogue Firmware Patch',
  'Compiled binary flight code with unauthorized autonomous navigation algorithms.',
  '["Text Document","Flight Manual","System Log"]'::jsonb,
  'Rogue Firmware Patch',
  '["rogue firmware patch","firmware","firmware patch","code","file","patch"]'::jsonb,
  'A computer program permanently installed into hardware that controls its operation.',
  'ev_4',
  false,
  '{"descriptions":["A modified firmware hex code file named \"PATRIOT_FAILSAFE.bin\" is found on the server.","At 03:05 AM: A modified firmware hex code file named \"PATRIOT_FAILSAFE.bin\" is found on the server.","Notice this clue: A modified firmware hex code file named \"PATRIOT_FAILSAFE.bin\" is found on the server."],"hints":["A computer program permanently installed into hardware that controls its operation.","Clue hint: Think about rogue firmware patch.","Search for: the software contained an encrypted backdoor routine bypassing human controls."],"clues":["Rogue Firmware Patch","Item: Rogue Firmware Patch","Clue Word: Rogue Firmware Patch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ca0f119a-7d19-5a38-8af9-8a3b32e6572e',
  'story_048',
  'ev_4',
  4,
  '03:20 AM',
  'A military radar tracking plot shows a radar-cross-section vanishing off the coast.',
  'A military radar tracking plot shows a radar-cross-section vanishing off the coast.',
  'The drone skimmed thirty feet above ocean waves to hide in radar clutter.',
  'Radar Tracking Log',
  'Digital radar screen printout showing flight vector 110 heading out to sea.',
  '["Weather Map","GPS Screen","Flight Plan"]'::jsonb,
  'Radar Tracking Log',
  '["radar tracking log","radar log","radar","tracking log","screen"]'::jsonb,
  'A computer screen displaying green dots and lines tracking aircraft in the sky.',
  'ev_5',
  false,
  '{"descriptions":["A military radar tracking plot shows a radar-cross-section vanishing off the coast.","At 03:20 AM: A military radar tracking plot shows a radar-cross-section vanishing off the coast.","Notice this clue: A military radar tracking plot shows a radar-cross-section vanishing off the coast."],"hints":["A computer screen displaying green dots and lines tracking aircraft in the sky.","Clue hint: Think about radar tracking log.","Search for: the drone skimmed thirty feet above ocean waves to hide in radar clutter."],"clues":["Radar Tracking Log","Item: Radar Tracking Log","Clue Word: Radar Tracking Log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '575016cd-f911-5a53-bdf8-12c599db9498',
  'story_048',
  'ev_5',
  5,
  '03:40 AM',
  'An encrypted SSH terminal log links the roof opening to an IP at the Highway Motel.',
  'An encrypted SSH terminal log links the roof opening to an IP at the Highway Motel.',
  'Leo executed the launch command from a cheap motel room across the road.',
  'SSH Terminal Log',
  'Server access record showing cryptographic key matching Leo Vance’s laptop.',
  '["Phone Bill","Visitor Badge","Receipt"]'::jsonb,
  'SSH Terminal Log',
  '["ssh terminal log","log","ssh log","terminal log","server log"]'::jsonb,
  'A digital text record of remote commands typed into a secure server.',
  'ev_6',
  true,
  '{"descriptions":["An encrypted SSH terminal log links the roof opening to an IP at the Highway Motel.","At 03:40 AM: An encrypted SSH terminal log links the roof opening to an IP at the Highway Motel.","Notice this clue: An encrypted SSH terminal log links the roof opening to an IP at the Highway Motel."],"hints":["A digital text record of remote commands typed into a secure server.","Clue hint: Think about ssh terminal log.","Search for: leo executed the launch command from a cheap motel room across the road."],"clues":["SSH Terminal Log","Item: SSH Terminal Log","Clue Word: SSH Terminal Log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'efdbc2ed-c81c-53d2-b072-e25bf71a24d6',
  'story_048',
  'ev_6',
  6,
  '04:10 AM',
  'A satellite transmitter antenna is suction-cupped to the window of Motel Room 14.',
  'A satellite transmitter antenna is suction-cupped to the window of Motel Room 14.',
  'Leo maintained high-bandwidth satellite contact with the drone during flight.',
  'Satellite Antenna',
  'Flat-panel portable satellite dish linked to a hardened laptop.',
  '["TV Antenna","Radio Aerial","Router"]'::jsonb,
  'Satellite Antenna',
  '["satellite antenna","antenna","dish","satellite dish"]'::jsonb,
  'A flat electronic panel pointed toward space satellites to send and receive data.',
  'ev_7',
  false,
  '{"descriptions":["A satellite transmitter antenna is suction-cupped to the window of Motel Room 14.","At 04:10 AM: A satellite transmitter antenna is suction-cupped to the window of Motel Room 14.","Notice this clue: A satellite transmitter antenna is suction-cupped to the window of Motel Room 14."],"hints":["A flat electronic panel pointed toward space satellites to send and receive data.","Clue hint: Think about satellite antenna.","Search for: leo maintained high-bandwidth satellite contact with the drone during flight."],"clues":["Satellite Antenna","Item: Satellite Antenna","Clue Word: Satellite Antenna"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cf02cabd-bb58-5918-bb6c-78c53a3f93e3',
  'story_048',
  'ev_7',
  7,
  '04:25 AM',
  'Ten million dollars in bearer bond certificates are found in Leo’s suitcase.',
  'Ten million dollars in bearer bond certificates are found in Leo’s suitcase.',
  'The treasonous payment promised by a foreign defense consortium.',
  'Bearer Bond Certificates',
  'Engraved bond certificates payable to bearer on foreign bank accounts.',
  '["Cash Stacks","Checkbook","Credit Cards"]'::jsonb,
  'Bearer Bond Certificates',
  '["bearer bond certificates","bonds","bearer bonds","certificates","bond certificates"]'::jsonb,
  'Expensive paper investment documents that can be cashed in by whoever holds them.',
  'ev_8',
  false,
  '{"descriptions":["Ten million dollars in bearer bond certificates are found in Leo’s suitcase.","At 04:25 AM: Ten million dollars in bearer bond certificates are found in Leo’s suitcase.","Notice this clue: Ten million dollars in bearer bond certificates are found in Leo’s suitcase."],"hints":["Expensive paper investment documents that can be cashed in by whoever holds them.","Clue hint: Think about bearer bond certificates.","Search for: the treasonous payment promised by a foreign defense consortium."],"clues":["Bearer Bond Certificates","Item: Bearer Bond Certificates","Clue Word: Bearer Bond Certificates"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd10ffc82-310b-5ea7-98d1-39eed5535c85',
  'story_048',
  'ev_8',
  8,
  '04:45 AM',
  'The destination coordinates for a foreign freighter named "Sea Phoenix" are on the laptop screen.',
  'The destination coordinates for a foreign freighter named "Sea Phoenix" are on the laptop screen.',
  'The drone was programmed to land on a modified helicopter deck at sea.',
  'Freighter Coordinates',
  'GPS waypoint markers: Lat 36.12 N, Long 72.40 W.',
  '["Airfield Map","Road Guide","Port Address"]'::jsonb,
  'Freighter Coordinates',
  '["freighter coordinates","coordinates","gps coordinates","waypoints"]'::jsonb,
  'Numbers representing latitude and longitude that pinpoint an exact spot on Earth.',
  NULL,
  true,
  '{"descriptions":["The destination coordinates for a foreign freighter named \"Sea Phoenix\" are on the laptop screen.","At 04:45 AM: The destination coordinates for a foreign freighter named \"Sea Phoenix\" are on the laptop screen.","Notice this clue: The destination coordinates for a foreign freighter named \"Sea Phoenix\" are on the laptop screen."],"hints":["Numbers representing latitude and longitude that pinpoint an exact spot on Earth.","Clue hint: Think about freighter coordinates.","Search for: the drone was programmed to land on a modified helicopter deck at sea."],"clues":["Freighter Coordinates","Item: Freighter Coordinates","Clue Word: Freighter Coordinates"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_049 — THE ABANDONED ASYLUM WARD
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_049',
  'The Abandoned Asylum Ward',
  'Horror',
  'Blackwood Hollow Insane Asylum, decaying Ward C, peeling green paint and barred windows',
  'Deep fingernail scratch marks were found on the inside of a sealed isolation cell padded door.',
  '[{"name":"Silas Vance","role":"Asylum Grounds Caretaker","alibi":"In the gatekeeper cottage drinking tea","avatar":"🔦"},{"name":"Leo Cole","role":"Urban Explorer (Victim)","alibi":"Trapped inside padded Cell 8","avatar":"📷"},{"name":"Maya Lin","role":"Explorer Partner","alibi":"Hiding in the overgrown courtyard bushes","avatar":"🎒"},{"name":"Sheriff Frank Miller","role":"County Sheriff","alibi":"Arrived at the asylum gates following Maya’s 911 call","avatar":"👮"}]'::jsonb,
  'Caretaker Silas Vance used the abandoned asylum as a cover for his illegal underground silver mining. When urban explorer Leo entered Ward C, Silas padlocked him inside padded Cell 8 and made eerie noises through the pipes to simulate a haunting, leaving Leo to starve.',
  'Caretaker Silas Vance',
  'Silas was mining illegal silver ore beneath the asylum foundation and trapped intruders to protect his hoard.',
  '[{"time":"09:00 PM","event":"Leo and Maya sneak through the broken iron gates of the asylum."},{"time":"10:15 PM","event":"Leo discovers sacks of raw silver ore in the electro-shock basement."},{"time":"10:45 PM","event":"Silas corners Leo in Ward C and slams the padded door of Cell 8 shut."},{"time":"10:48 PM","event":"Silas wraps heavy iron chains around the door bar and snaps a padlock."},{"time":"11:30 PM","event":"Maya returns with Sheriff Miller armed with bolt cutters."}]'::jsonb,
  '[{"id":"ev1","title":"Brand-New Hardware Padlock","detail":"Purchased by Silas Vance; receipt found in his cottage matches the key in his pocket."},{"id":"ev2","title":"Carbide Miner’s Lamp at Cell Door","detail":"Carries Silas’s fingerprints and residue of subterranean silver mine dust."},{"id":"ev3","title":"Burlap Sacks of Raw Silver Ore","detail":"Hidden in Ward C, proving the motive to keep trespassers away at all costs."},{"id":"ev4","title":"Voice-Acoustic Vent Pipe","detail":"Demonstrates how Silas manufactured phantom voices to terrify his captive."}]'::jsonb,
  '[{"order":1,"title":"Scratched Padded Door","text":"Isolation cell door bearing desperate claw marks from the trapped explorer."},{"order":2,"title":"Steel Padlock","text":"Hardware lock used to chain the victim inside the padded room."},{"order":3,"title":"Carbide Mining Lamp","text":"Brass light source used by the caretaker in his illegal underground tunnels."},{"order":4,"title":"Silver Ore Sacks","text":"Piles of valuable stolen raw minerals hidden beneath the floorboards."},{"order":5,"title":"Mine Tunnel Map","text":"Sketch revealing the extensive labyrinth dug beneath the asylum."},{"order":6,"title":"Ventilation Pipe","text":"Metal duct used to funnel spooky whispers into the victim’s cell."}]'::jsonb,
  'Maya Lin ran into the woods in a panic.: She was terrified of the noises, not guilty of the trapping.; The asylum had old patient records scattered about.: Decaying medical history, completely unrelated to the mining operation.',
  'Claim the ghost of a deceased patient locked the door or blame explorer partner Maya.',
  'NORMAL',
  'Who locked the explorer inside Cell 8 and what was lurking in the dark corridors?',
  '[{"character":"Silas Vance","secret":"He has fifty bags of raw silver ore stashed in the old electro-shock room."},{"character":"Leo Cole","secret":"He found Silas’s mining tunnel map behind a loose brick."},{"character":"Maya Lin","secret":"She dropped her camera and fled into the woods before calling police."},{"character":"Sheriff Frank Miller","secret":"He suspected Silas was selling stolen ore across the county line."}]'::jsonb,
  '[{"lead":"Maya Lin ran into the woods in a panic.","explanation":"She was terrified of the noises, not guilty of the trapping."},{"lead":"The asylum had old patient records scattered about.","explanation":"Decaying medical history, completely unrelated to the mining operation."}]'::jsonb,
  '{"wrongTheories":["The vengeful spirit of an insane patient manifested and sealed the door.","Explorer Leo locked himself inside accidentally while exploring the ruins."],"correctTheory":"Caretaker Silas Vance locked explorer Leo in the padded cell with a heavy chain and padlock, using the ventilation pipes to fake a haunting, all to protect his secret multi-thousand-dollar illegal silver mine."}'::jsonb,
  'Caretaker Silas Vance locked Leo away to hide his secret silver mine!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Sheriff Miller cut the chains and rescued Leo just in time. Silas Vance was arrested for unlawful imprisonment and illegal mining, and the asylum was permanently demolished."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The sheriff dismissed Maya’s report as a ghost prank. Leo was trapped in the dark cell while Silas sealed the entrance forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The local newspaper declared Ward C a verified haunted hot-spot. Silas charged ghost hunters admission tickets while continuing to mine silver."}]'::jsonb,
  '{"intros":["Deep fingernail scratch marks were found on the inside of a sealed isolation cell padded door.","Case file story_049: Deep fingernail scratch marks were found on the inside of a sealed isolation cell padded door. Look closely at every clue.","Trouble begins in Blackwood Hollow Insane Asylum, decaying Ward C, peeling green paint and barred windows. Deep fingernail scratch marks were found on the inside of a sealed isolation cell padded door.","The mystery starts now. Deep fingernail scratch marks were found on the inside of a sealed isolation cell padded door. Can you solve it?"],"reveals":["Caretaker Silas Vance locked Leo away to hide his secret silver mine!","The mystery is unraveled! Caretaker Silas Vance locked Leo away to hide his secret silver mine!","At last, the truth comes out: Caretaker Silas Vance locked Leo away to hide his secret silver mine!","Case resolved! Here is what happened: Caretaker Silas Vance locked Leo away to hide his secret silver mine!"],"hints":["Pay attention to where Caretaker Silas Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_049';
DELETE FROM public.case_events WHERE case_id = 'story_049';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fd1a78ca-7d55-56f7-93bc-1bd76148af80',
  'story_049',
  'Silas Vance',
  'Asylum Grounds Caretaker',
  'Grumpy, weathered face, stained canvas overalls, carrying a heavy rusted iron crowbar',
  'This asylum is cursed. Anyone who enters Ward C is taken by the ghosts of 1920.',
  'He has fifty bags of raw silver ore stashed in the old electro-shock room.',
  'In the gatekeeper cottage drinking tea',
  'Sole keyholder for the asylum grounds',
  'The ventilation ducts amplify whispers into loud wailing throughout Ward C.',
  'Did not know he dropped his vintage brass mining lamp by the cell door.',
  '🔦',
  '["This asylum is cursed. Anyone who enters Ward C is taken by the ghosts of 1920.","\"This asylum is cursed. Anyone who enters Ward C is taken by the ghosts of 1920.\"","Listen to me: This asylum is cursed. Anyone who enters Ward C is taken by the ghosts of 1920.","I tell you the truth: This asylum is cursed. Anyone who enters Ward C is taken by the ghosts of 1920."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1ddd5088-f392-5290-967e-851a43f30765',
  'story_049',
  'Leo Cole',
  'Urban Explorer (Victim)',
  'Adventurous, curious, carrying a digital camera and flashlight',
  'Victim trapped inside; scratched on the padded door shouting: "The caretaker is outside!"',
  'He found Silas’s mining tunnel map behind a loose brick.',
  'Trapped inside padded Cell 8',
  'Explorer who discovered the illegal mining operation',
  'Saw a man with heavy work boots padlock the heavy iron door latch.',
  'Did not have tools to pry through the steel security plate.',
  '📷',
  '["Victim trapped inside; scratched on the padded door shouting: \"The caretaker is outside!\"","\"Victim trapped inside; scratched on the padded door shouting: \"The caretaker is outside!\"\"","Listen to me: Victim trapped inside; scratched on the padded door shouting: \"The caretaker is outside!\"","I tell you the truth: Victim trapped inside; scratched on the padded door shouting: \"The caretaker is outside!\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a7bc2a9f-3768-5344-af11-73e61ae3248c',
  'story_049',
  'Maya Lin',
  'Explorer Partner',
  'Terrified, crying, holding a flashlight with shaking hands',
  'Leo walked into Ward C to take photos. The door slammed shut and chains rattled!',
  'She dropped her camera and fled into the woods before calling police.',
  'Hiding in the overgrown courtyard bushes',
  'Leo’s exploration partner who witnessed the door being sealed',
  'Heard the clinking of heavy iron chains and a man coughing.',
  'Could not see the caretaker’s face in the dark fog.',
  '🎒',
  '["Leo walked into Ward C to take photos. The door slammed shut and chains rattled!","\"Leo walked into Ward C to take photos. The door slammed shut and chains rattled!\"","Listen to me: Leo walked into Ward C to take photos. The door slammed shut and chains rattled!","I tell you the truth: Leo walked into Ward C to take photos. The door slammed shut and chains rattled!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6ddc3fbf-7635-5b1a-a34c-5f105239b1cd',
  'story_049',
  'Sheriff Frank Miller',
  'County Sheriff',
  'Tough, skeptical, carrying bolt cutters and a heavy service revolver',
  'Ghosts don’t buy heavy industrial steel padlocks from the local hardware store.',
  'He suspected Silas was selling stolen ore across the county line.',
  'Arrived at the asylum gates following Maya’s 911 call',
  'Leading the rescue and criminal investigation',
  'Found fresh tire tracks from Silas’s flatbed truck by the morgue ramp.',
  'Did not know where the keys to the heavy padlock were hidden.',
  '👮',
  '["Ghosts don’t buy heavy industrial steel padlocks from the local hardware store.","\"Ghosts don’t buy heavy industrial steel padlocks from the local hardware store.\"","Listen to me: Ghosts don’t buy heavy industrial steel padlocks from the local hardware store.","I tell you the truth: Ghosts don’t buy heavy industrial steel padlocks from the local hardware store."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '78d4948d-e031-5b29-aa51-ba3e479cdb64',
  'story_049',
  'ev_1',
  1,
  '10:45 PM',
  'Deep fingernail gouges tear through the cracked white leather of the padded cell door.',
  'Deep fingernail gouges tear through the cracked white leather of the padded cell door.',
  'The victim scratched the door in total darkness trying to escape.',
  'Scratched Padded Door',
  'Torn horsehair insulation and leather padding showing bloodied nail marks.',
  '["Wooden Door","Glass Window","Iron Bars"]'::jsonb,
  'Scratched Padded Door',
  '["scratched padded door","door","padded door","scratches","cell door"]'::jsonb,
  'A thick insulated soft door inside a psychiatric hospital cell.',
  'ev_2',
  true,
  '{"descriptions":["Deep fingernail gouges tear through the cracked white leather of the padded cell door.","At 10:45 PM: Deep fingernail gouges tear through the cracked white leather of the padded cell door.","Notice this clue: Deep fingernail gouges tear through the cracked white leather of the padded cell door."],"hints":["A thick insulated soft door inside a psychiatric hospital cell.","Clue hint: Think about scratched padded door.","Search for: the victim scratched the door in total darkness trying to escape."],"clues":["Scratched Padded Door","Item: Scratched Padded Door","Clue Word: Scratched Padded Door"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f979f325-4f15-5063-851e-05dcb0cc65a7',
  'story_049',
  'ev_2',
  2,
  '10:48 PM',
  'A heavy hardened steel padlock stamped "MASTER-HEAVY" locks the outside chains.',
  'A heavy hardened steel padlock stamped "MASTER-HEAVY" locks the outside chains.',
  'The lock was brand new and bought recently from a hardware store.',
  'Steel Padlock',
  'Shining chrome padlock securing two loops of rusted logging chain.',
  '["Deadbolt","Combination Dial","Electronic Fob"]'::jsonb,
  'Steel Padlock',
  '["steel padlock","padlock","lock","chains"]'::jsonb,
  'A portable U-shaped metal lock that snaps closed with a key.',
  'ev_3',
  false,
  '{"descriptions":["A heavy hardened steel padlock stamped \"MASTER-HEAVY\" locks the outside chains.","At 10:48 PM: A heavy hardened steel padlock stamped \"MASTER-HEAVY\" locks the outside chains.","Notice this clue: A heavy hardened steel padlock stamped \"MASTER-HEAVY\" locks the outside chains."],"hints":["A portable U-shaped metal lock that snaps closed with a key.","Clue hint: Think about steel padlock.","Search for: the lock was brand new and bought recently from a hardware store."],"clues":["Steel Padlock","Item: Steel Padlock","Clue Word: Steel Padlock"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '343ff4b9-e012-5f96-a7b8-df2bca06d84a',
  'story_049',
  'ev_3',
  3,
  '10:50 PM',
  'A brass carbide miner’s lamp with an open flame burner is left by the door.',
  'A brass carbide miner’s lamp with an open flame burner is left by the door.',
  'The caretaker used old-fashioned mining lamps to work underground without electric wires.',
  'Carbide Mining Lamp',
  'Vintage brass lamp smelling of calcium carbide gas and soot.',
  '["Flashlight","Candle","Electric Lantern"]'::jsonb,
  'Carbide Mining Lamp',
  '["carbide mining lamp","lamp","mining lamp","carbide lamp","lantern"]'::jsonb,
  'An antique brass light used by underground coal and silver miners.',
  'ev_4',
  false,
  '{"descriptions":["A brass carbide miner’s lamp with an open flame burner is left by the door.","At 10:50 PM: A brass carbide miner’s lamp with an open flame burner is left by the door.","Notice this clue: A brass carbide miner’s lamp with an open flame burner is left by the door."],"hints":["An antique brass light used by underground coal and silver miners.","Clue hint: Think about carbide mining lamp.","Search for: the caretaker used old-fashioned mining lamps to work underground without electric wires."],"clues":["Carbide Mining Lamp","Item: Carbide Mining Lamp","Clue Word: Carbide Mining Lamp"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e8330a46-297e-56de-af1b-f71f697abed4',
  'story_049',
  'ev_4',
  4,
  '11:00 PM',
  'Heavy burlap sacks filled with raw sparkling silver ore are hidden under floorboards.',
  'Heavy burlap sacks filled with raw sparkling silver ore are hidden under floorboards.',
  'The motive for trapping intruders was to hide an illegal multi-thousand-dollar mining hoard.',
  'Silver Ore Sacks',
  'Coarse burlap bags holding heavy metallic rocks with raw silver veins.',
  '["Coal Sacks","Grain Bags","Sandbags"]'::jsonb,
  'Silver Ore Sacks',
  '["silver ore sacks","ore","silver ore","sacks","silver","rocks"]'::jsonb,
  'Rough cloth bags filled with heavy sparkling grey metal stones dug from the earth.',
  'ev_5',
  false,
  '{"descriptions":["Heavy burlap sacks filled with raw sparkling silver ore are hidden under floorboards.","At 11:00 PM: Heavy burlap sacks filled with raw sparkling silver ore are hidden under floorboards.","Notice this clue: Heavy burlap sacks filled with raw sparkling silver ore are hidden under floorboards."],"hints":["Rough cloth bags filled with heavy sparkling grey metal stones dug from the earth.","Clue hint: Think about silver ore sacks.","Search for: the motive for trapping intruders was to hide an illegal multi-thousand-dollar mining hoard."],"clues":["Silver Ore Sacks","Item: Silver Ore Sacks","Clue Word: Silver Ore Sacks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4016dad3-4e48-5dfc-8ed3-28110c4d406a',
  'story_049',
  'ev_5',
  5,
  '11:15 PM',
  'A hand-drawn map showing mining tunnels under Ward C is found in Silas’s pocket.',
  'A hand-drawn map showing mining tunnels under Ward C is found in Silas’s pocket.',
  'Silas spent five years digging secret tunnels beneath the asylum foundation.',
  'Mine Tunnel Map',
  'Pencil sketch on yellow parchment detailing secret basement shafts.',
  '["Asylum Blueprint","Road Map","Newspaper"]'::jsonb,
  'Mine Tunnel Map',
  '["mine tunnel map","map","tunnel map","mine map","sketch"]'::jsonb,
  'A paper drawing showing paths and rooms carved deep underground.',
  'ev_6',
  true,
  '{"descriptions":["A hand-drawn map showing mining tunnels under Ward C is found in Silas’s pocket.","At 11:15 PM: A hand-drawn map showing mining tunnels under Ward C is found in Silas’s pocket.","Notice this clue: A hand-drawn map showing mining tunnels under Ward C is found in Silas’s pocket."],"hints":["A paper drawing showing paths and rooms carved deep underground.","Clue hint: Think about mine tunnel map.","Search for: silas spent five years digging secret tunnels beneath the asylum foundation."],"clues":["Mine Tunnel Map","Item: Mine Tunnel Map","Clue Word: Mine Tunnel Map"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a8d639ac-02e8-5483-9f42-878fa57238d3',
  'story_049',
  'ev_6',
  6,
  '11:35 PM',
  'A 36-inch industrial bolt cutter with hardened jaws is used to snap the chain.',
  'A 36-inch industrial bolt cutter with hardened jaws is used to snap the chain.',
  'Sheriff Miller severed the padlock chain to free the trapped explorer.',
  'Bolt Cutters',
  'Red steel rescue tool with sharp bypass cutting jaws.',
  '["Hacksaw","Crowbar","Axe"]'::jsonb,
  'Bolt Cutters',
  '["bolt cutters","cutters","tool","rescue tool"]'::jsonb,
  'A large long-handled tool used to snip through heavy steel locks and chains.',
  'ev_7',
  false,
  '{"descriptions":["A 36-inch industrial bolt cutter with hardened jaws is used to snap the chain.","At 11:35 PM: A 36-inch industrial bolt cutter with hardened jaws is used to snap the chain.","Notice this clue: A 36-inch industrial bolt cutter with hardened jaws is used to snap the chain."],"hints":["A large long-handled tool used to snip through heavy steel locks and chains.","Clue hint: Think about bolt cutters.","Search for: sheriff miller severed the padlock chain to free the trapped explorer."],"clues":["Bolt Cutters","Item: Bolt Cutters","Clue Word: Bolt Cutters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '18fbc772-878f-58cf-a4c8-8712cf95841d',
  'story_049',
  'ev_7',
  7,
  '11:50 PM',
  'A hollow iron ventilation pipe was used to whisper spooky voices into the cell.',
  'A hollow iron ventilation pipe was used to whisper spooky voices into the cell.',
  'Silas spoke into the air ducts to make captives believe ghosts were haunting them.',
  'Ventilation Pipe',
  'Six-inch galvanized iron duct connecting the caretaker shack to Cell 8.',
  '["Chimney","Water Pipe","Drain"]'::jsonb,
  'Ventilation Pipe',
  '["ventilation pipe","pipe","vent pipe","duct"]'::jsonb,
  'A hollow metal tube that carries air between rooms in a building.',
  'ev_8',
  false,
  '{"descriptions":["A hollow iron ventilation pipe was used to whisper spooky voices into the cell.","At 11:50 PM: A hollow iron ventilation pipe was used to whisper spooky voices into the cell.","Notice this clue: A hollow iron ventilation pipe was used to whisper spooky voices into the cell."],"hints":["A hollow metal tube that carries air between rooms in a building.","Clue hint: Think about ventilation pipe.","Search for: silas spoke into the air ducts to make captives believe ghosts were haunting them."],"clues":["Ventilation Pipe","Item: Ventilation Pipe","Clue Word: Ventilation Pipe"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cc572eef-3cf1-5889-a832-0adb83c24e03',
  'story_049',
  'ev_8',
  8,
  '12:15 AM',
  'A cash ledger showing twenty thousand dollars in illicit silver sales is seized.',
  'A cash ledger showing twenty thousand dollars in illicit silver sales is seized.',
  'Silas had been selling smelted silver bars to an underground foundry.',
  'Silver Sales Ledger',
  'Black notebook detailing payments for refined bullion.',
  '["Phone Book","Diary","Bible"]'::jsonb,
  'Silver Sales Ledger',
  '["silver sales ledger","ledger","sales ledger","notebook","records"]'::jsonb,
  'A bound book where financial earnings and sales are written down.',
  NULL,
  true,
  '{"descriptions":["A cash ledger showing twenty thousand dollars in illicit silver sales is seized.","At 12:15 AM: A cash ledger showing twenty thousand dollars in illicit silver sales is seized.","Notice this clue: A cash ledger showing twenty thousand dollars in illicit silver sales is seized."],"hints":["A bound book where financial earnings and sales are written down.","Clue hint: Think about silver sales ledger.","Search for: silas had been selling smelted silver bars to an underground foundry."],"clues":["Silver Sales Ledger","Item: Silver Sales Ledger","Clue Word: Silver Sales Ledger"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_050 — WHISPERS IN THE CELLAR
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_050',
  'Whispers in the Cellar',
  'Horror',
  'The Blackwood Cellar, damp fieldstone foundation, cold drafts, and rows of dusty wine casks',
  'Chilling whispers echoed from behind a newly bricked-up wine alcove, accompanied by wet footprints.',
  '[{"name":"Julian Blackwood","role":"Younger Brother","alibi":"In the library reading legal estate papers","avatar":"🍷"},{"name":"Arthur Blackwood","role":"Elder Brother (Trapped Victim)","alibi":"Sealed inside the dark wine vault","avatar":"🧱"},{"name":"Thomas Higgins","role":"Head House Servant","alibi":"Polishing silver in the basement pantry","avatar":"🕯️"},{"name":"Inspector James Sterling","role":"Homicide & Missing Persons Detective","alibi":"Dispatched to the manor after Arthur’s lawyer reported his sudden absence","avatar":"🔍"}]'::jsonb,
  'Julian Blackwood drugged his elder brother Arthur with heavy port wine. While Arthur was unconscious, Julian laid wet bricks and mortar across the cellar archway, sealing him alive inside the catacombs to seize the ancestral estate.',
  'Brother Julian Blackwood',
  'Julian bricked his brother Arthur into the wine vault alive to claim the family inheritance alone.',
  '[{"time":"07:00 PM","event":"Julian serves Arthur heavy port wine laced with sleeping chloral."},{"time":"08:30 PM","event":"Arthur collapses unconscious on the dirt floor of the wine vault."},{"time":"09:00 PM","event":"Julian mixes Portland mortar and lays rows of red brick across the doorway."},{"time":"11:45 PM","event":"The final brick is tapped into place; Julian seals Arthur in darkness."},{"time":"06:00 AM","event":"Inspector Sterling taps the wall with an iron mallet and hears faint knocking."}]'::jsonb,
  '[{"id":"ev1","title":"Wet Mortar on Newly Built Wall","detail":"Proves the brick barrier was erected hours earlier while Arthur was in the house."},{"id":"ev2","title":"Masonry Trowel with Julian’s Fingerprints","detail":"Discovered in the coal bin with wet cement matching the wall joints."},{"id":"ev3","title":"Chloral Sedative in Port Decanter","detail":"Explains how the elder brother was immobilized without a violent struggle."},{"id":"ev4","title":"Forged Estate Transfer Deed","detail":"Establishes Julian’s financial motive to permanently bury his brother alive."}]'::jsonb,
  '[{"order":1,"title":"Fresh Brick Wall","text":"Newly mortared red clay barrier sealing the ancient wine vault."},{"order":2,"title":"Masonry Trowel","text":"Pointed steel tool used to lay the bricks across the doorway."},{"order":3,"title":"Portland Cement Bag","text":"Fast-drying mortar compound used to build the prison wall."},{"order":4,"title":"Drugged Wine Decanter","text":"Glass pitcher of port wine laced with heavy sleeping drugs."},{"order":5,"title":"Muffled Tapping","text":"Rhythmic knocking sound coming from the living brother trapped in the wall."},{"order":6,"title":"Mortar Shoe Prints","text":"Grey cement footprints leading between the brick pile and the sealed arch."}]'::jsonb,
  'House servant Thomas had dirt on his hands.: He was shoveling coal for the furnace early this morning.; The cellar had centuries-old spiderwebs.: Natural decay in an ancient basement, unrelated to the fresh masonry.',
  'Claim an ancient family ghost was weeping in the wall or blame the servant Thomas.',
  'NORMAL',
  'What was sealed behind the fresh cellar bricks and whose footprints led into the stone wall?',
  '[{"character":"Julian Blackwood","secret":"He mixed fresh gray masonry mortar in the coal cellar yesterday evening."},{"character":"Arthur Blackwood","secret":"He had signed a will leaving half the estate to the local orphanage."},{"character":"Thomas Higgins","secret":"He saw Julian carrying twenty red bricks down the cellar stairs yesterday."},{"character":"Inspector James Sterling","secret":"Investigated a similar walled-in murder case in London."}]'::jsonb,
  '[{"lead":"House servant Thomas had dirt on his hands.","explanation":"He was shoveling coal for the furnace early this morning."},{"lead":"The cellar had centuries-old spiderwebs.","explanation":"Natural decay in an ancient basement, unrelated to the fresh masonry."}]'::jsonb,
  '{"wrongTheories":["An ancient ghost from the Blackwood bloodline was manifesting in the stone walls.","Arthur Blackwood willingly bricked himself inside to perform an occult ritual."],"correctTheory":"Julian Blackwood drugged his elder brother Arthur with laced port wine and bricked him into the cellar wine vault alive using cement and a trowel to steal the family estate with a forged property deed."}'::jsonb,
  'Brother Julian Blackwood bricked Arthur into the wall to steal the estate!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Inspector Sterling smashed through the fresh bricks with a sledgehammer, pulling Arthur out alive. Julian was arrested for attempted murder and forgery."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The knocking went unheard. Arthur suffocated in the dark vault, and Julian inherited Blackwood Manor under the forged deed."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The manor was declared cursed by urban legend. Julian sold the property to a spooky tourist hotel and lived on the proceeds."}]'::jsonb,
  '{"intros":["Chilling whispers echoed from behind a newly bricked-up wine alcove, accompanied by wet footprints.","Case file story_050: Chilling whispers echoed from behind a newly bricked-up wine alcove, accompanied by wet footprints. Look closely at every clue.","Trouble begins in The Blackwood Cellar, damp fieldstone foundation, cold drafts, and rows of dusty wine casks. Chilling whispers echoed from behind a newly bricked-up wine alcove, accompanied by wet footprints.","The mystery starts now. Chilling whispers echoed from behind a newly bricked-up wine alcove, accompanied by wet footprints. Can you solve it?"],"reveals":["Brother Julian Blackwood bricked Arthur into the wall to steal the estate!","The mystery is unraveled! Brother Julian Blackwood bricked Arthur into the wall to steal the estate!","At last, the truth comes out: Brother Julian Blackwood bricked Arthur into the wall to steal the estate!","Case resolved! Here is what happened: Brother Julian Blackwood bricked Arthur into the wall to steal the estate!"],"hints":["Pay attention to where Brother Julian Blackwood was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_050';
DELETE FROM public.case_events WHERE case_id = 'story_050';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e57212ca-ec8c-5db4-978b-5081b80914d1',
  'story_050',
  'Julian Blackwood',
  'Younger Brother',
  'Jealous, cold, elegant velvet smoking jacket, smelling of mortar dust',
  'Arthur left for Paris on the midnight train. He abandoned the family estate to me.',
  'He mixed fresh gray masonry mortar in the coal cellar yesterday evening.',
  'In the library reading legal estate papers',
  'Brother and rival heir to the Blackwood fortune',
  'The air inside the bricked vault will run out within twenty-four hours.',
  'Did not notice wet mortar smeared on the cuffs of his velvet jacket.',
  '🍷',
  '["Arthur left for Paris on the midnight train. He abandoned the family estate to me.","\"Arthur left for Paris on the midnight train. He abandoned the family estate to me.\"","Listen to me: Arthur left for Paris on the midnight train. He abandoned the family estate to me.","I tell you the truth: Arthur left for Paris on the midnight train. He abandoned the family estate to me."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a39bcad7-4363-5b4a-afe9-d3ba233177fa',
  'story_050',
  'Arthur Blackwood',
  'Elder Brother (Trapped Victim)',
  'Scholar, trusting, trapped in the darkness behind six inches of brick',
  'Victim trapped alive; tapping weakly on the stone with a broken wine bottle.',
  'He had signed a will leaving half the estate to the local orphanage.',
  'Sealed inside the dark wine vault',
  'Sole legal owner of Blackwood Manor',
  'He saw his brother Julian holding the brick trowel as the last stone was laid.',
  'Did not know if anyone in the house could hear his muffled tapping.',
  '🧱',
  '["Victim trapped alive; tapping weakly on the stone with a broken wine bottle.","\"Victim trapped alive; tapping weakly on the stone with a broken wine bottle.\"","Listen to me: Victim trapped alive; tapping weakly on the stone with a broken wine bottle.","I tell you the truth: Victim trapped alive; tapping weakly on the stone with a broken wine bottle."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '321001a0-af18-5926-bb31-9d64e388a1ce',
  'story_050',
  'Thomas Higgins',
  'Head House Servant',
  'Loyal, elderly, hard of hearing, carrying a brass candelabra',
  'I heard soft scraping and thumping beneath the floorboards all night long.',
  'He saw Julian carrying twenty red bricks down the cellar stairs yesterday.',
  'Polishing silver in the basement pantry',
  'Servant who tended the Blackwood cellar for forty years',
  'The wine alcove was an open doorway three days ago.',
  'Assumed Julian was merely repairing damp masonry.',
  '🕯️',
  '["I heard soft scraping and thumping beneath the floorboards all night long.","\"I heard soft scraping and thumping beneath the floorboards all night long.\"","Listen to me: I heard soft scraping and thumping beneath the floorboards all night long.","I tell you the truth: I heard soft scraping and thumping beneath the floorboards all night long."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b13a9bf0-7cdb-510a-a775-512abaa485c3',
  'story_050',
  'Inspector James Sterling',
  'Homicide & Missing Persons Detective',
  'Grim, observant, testing wall surfaces with an iron mallet',
  'Mortar takes forty-eight hours to cure. This wall was built less than twelve hours ago.',
  'Investigated a similar walled-in murder case in London.',
  'Dispatched to the manor after Arthur’s lawyer reported his sudden absence',
  'Leading the investigation into Arthur’s disappearance',
  'Found wet boot prints in gray mortar leading directly up to the fresh bricks.',
  'Did not immediately have a sledgehammer to breach the stone barrier.',
  '🔍',
  '["Mortar takes forty-eight hours to cure. This wall was built less than twelve hours ago.","\"Mortar takes forty-eight hours to cure. This wall was built less than twelve hours ago.\"","Listen to me: Mortar takes forty-eight hours to cure. This wall was built less than twelve hours ago.","I tell you the truth: Mortar takes forty-eight hours to cure. This wall was built less than twelve hours ago."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ef216a88-7d43-5c3d-bacb-5062feaf2619',
  'story_050',
  'ev_1',
  1,
  '09:00 PM',
  'A newly laid wall of damp red clay bricks seals an arched stone doorway.',
  'A newly laid wall of damp red clay bricks seals an arched stone doorway.',
  'The wall was constructed recently; the gray mortar between bricks is still soft and wet.',
  'Fresh Brick Wall',
  'Arched alcove sealed with thirty red bricks and damp gray cement.',
  '["Old Stone Wall","Iron Gate","Wooden Door"]'::jsonb,
  'Fresh Brick Wall',
  '["fresh brick wall","brick wall","wall","bricks","fresh wall","mortar wall"]'::jsonb,
  'A newly built barrier made of red clay blocks and wet grey cement.',
  'ev_2',
  true,
  '{"descriptions":["A newly laid wall of damp red clay bricks seals an arched stone doorway.","At 09:00 PM: A newly laid wall of damp red clay bricks seals an arched stone doorway.","Notice this clue: A newly laid wall of damp red clay bricks seals an arched stone doorway."],"hints":["A newly built barrier made of red clay blocks and wet grey cement.","Clue hint: Think about fresh brick wall.","Search for: the wall was constructed recently; the gray mortar between bricks is still soft and wet."],"clues":["Fresh Brick Wall","Item: Fresh Brick Wall","Clue Word: Fresh Brick Wall"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0c4270cd-14e6-5c79-951a-7abee67c5690',
  'story_050',
  'ev_2',
  2,
  '09:15 PM',
  'A triangular steel mason’s trowel with wet gray mortar is dropped in the coal bin.',
  'A triangular steel mason’s trowel with wet gray mortar is dropped in the coal bin.',
  'The tool used to apply the cement was hidden in the basement coal pile.',
  'Masonry Trowel',
  'Pointed steel trowel with hardened gray mortar on the blade.',
  '["Shovel","Hammer","Chisel"]'::jsonb,
  'Masonry Trowel',
  '["masonry trowel","trowel","tool","brick trowel"]'::jsonb,
  'A flat triangular metal hand tool used by bricklayers to spread wet cement.',
  'ev_3',
  false,
  '{"descriptions":["A triangular steel mason’s trowel with wet gray mortar is dropped in the coal bin.","At 09:15 PM: A triangular steel mason’s trowel with wet gray mortar is dropped in the coal bin.","Notice this clue: A triangular steel mason’s trowel with wet gray mortar is dropped in the coal bin."],"hints":["A flat triangular metal hand tool used by bricklayers to spread wet cement.","Clue hint: Think about masonry trowel.","Search for: the tool used to apply the cement was hidden in the basement coal pile."],"clues":["Masonry Trowel","Item: Masonry Trowel","Clue Word: Masonry Trowel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8c73d46e-8407-5a95-bc62-21dce302b5d4',
  'story_050',
  'ev_3',
  3,
  '09:30 PM',
  'A half-empty bag of quick-drying Portland cement sits beside the wine rack.',
  'A half-empty bag of quick-drying Portland cement sits beside the wine rack.',
  'Julian purchased industrial cement from the village builder yesterday.',
  'Portland Cement Bag',
  'Paper sack of gray hydraulic mortar stamped "QuickSet Portland".',
  '["Flour Sack","Lime Bag","Sand Sack"]'::jsonb,
  'Portland Cement Bag',
  '["portland cement bag","cement","portland cement","mortar bag","cement bag"]'::jsonb,
  'A heavy paper sack containing fine grey powder mixed with water to make mortar.',
  'ev_4',
  false,
  '{"descriptions":["A half-empty bag of quick-drying Portland cement sits beside the wine rack.","At 09:30 PM: A half-empty bag of quick-drying Portland cement sits beside the wine rack.","Notice this clue: A half-empty bag of quick-drying Portland cement sits beside the wine rack."],"hints":["A heavy paper sack containing fine grey powder mixed with water to make mortar.","Clue hint: Think about portland cement bag.","Search for: julian purchased industrial cement from the village builder yesterday."],"clues":["Portland Cement Bag","Item: Portland Cement Bag","Clue Word: Portland Cement Bag"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6e4af4a5-6915-5cce-924f-8916afa07808',
  'story_050',
  'ev_4',
  4,
  '10:00 PM',
  'A crystal wine decanter smelling of aged port and sweet sedative residue is on the table.',
  'A crystal wine decanter smelling of aged port and sweet sedative residue is on the table.',
  'Arthur was drugged into unconsciousness so he could not resist being walled up.',
  'Drugged Wine Decanter',
  'Cut-glass decanter containing port wine laced with chloral hydrate.',
  '["Water Pitcher","Tea Pot","Whiskey Bottle"]'::jsonb,
  'Drugged Wine Decanter',
  '["drugged wine decanter","decanter","wine decanter","wine","drugged wine"]'::jsonb,
  'An elegant glass bottle used for serving wine at a dinner table.',
  'ev_5',
  false,
  '{"descriptions":["A crystal wine decanter smelling of aged port and sweet sedative residue is on the table.","At 10:00 PM: A crystal wine decanter smelling of aged port and sweet sedative residue is on the table.","Notice this clue: A crystal wine decanter smelling of aged port and sweet sedative residue is on the table."],"hints":["An elegant glass bottle used for serving wine at a dinner table.","Clue hint: Think about drugged wine decanter.","Search for: arthur was drugged into unconsciousness so he could not resist being walled up."],"clues":["Drugged Wine Decanter","Item: Drugged Wine Decanter","Clue Word: Drugged Wine Decanter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2e7e53be-235b-56fb-84e2-34c5201da391',
  'story_050',
  'ev_5',
  5,
  '11:45 PM',
  'Faint, rhythmic knocking sounds echo through the soft mortar from inside the wall.',
  'Faint, rhythmic knocking sounds echo through the soft mortar from inside the wall.',
  'Arthur woke up in the dark and began tapping with a broken wine bottle.',
  'Muffled Tapping',
  'Acoustic audio of rhythmic three-beat strikes vibrating through the bricks.',
  '["Wind Whistle","Water Drip","Rat Scratch"]'::jsonb,
  'Muffled Tapping',
  '["muffled tapping","knocking","tapping","sound","echo"]'::jsonb,
  'A dull repeated striking sound coming from behind a solid stone barrier.',
  'ev_6',
  true,
  '{"descriptions":["Faint, rhythmic knocking sounds echo through the soft mortar from inside the wall.","At 11:45 PM: Faint, rhythmic knocking sounds echo through the soft mortar from inside the wall.","Notice this clue: Faint, rhythmic knocking sounds echo through the soft mortar from inside the wall."],"hints":["A dull repeated striking sound coming from behind a solid stone barrier.","Clue hint: Think about muffled tapping.","Search for: arthur woke up in the dark and began tapping with a broken wine bottle."],"clues":["Muffled Tapping","Item: Muffled Tapping","Clue Word: Muffled Tapping"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'da3befb3-30a2-5aa8-902c-0f55318b602d',
  'story_050',
  'ev_6',
  6,
  '12:15 AM',
  'Wet gray mortar footprints lead from the coal bin directly to the bricked arch.',
  'Wet gray mortar footprints lead from the coal bin directly to the bricked arch.',
  'The mason walked back and forth laying the bricks in leather dress shoes.',
  'Mortar Shoe Prints',
  'Gray cement impressions on the damp cellar dirt matching Julian’s loafers.',
  '["Bare Footprints","Boot Marks","Shoe Scuffs"]'::jsonb,
  'Mortar Shoe Prints',
  '["mortar shoe prints","footprints","shoe prints","mortar prints","prints"]'::jsonb,
  'Grey cement footprints left on the floor by someone walking with wet shoes.',
  'ev_7',
  false,
  '{"descriptions":["Wet gray mortar footprints lead from the coal bin directly to the bricked arch.","At 12:15 AM: Wet gray mortar footprints lead from the coal bin directly to the bricked arch.","Notice this clue: Wet gray mortar footprints lead from the coal bin directly to the bricked arch."],"hints":["Grey cement footprints left on the floor by someone walking with wet shoes.","Clue hint: Think about mortar shoe prints.","Search for: the mason walked back and forth laying the bricks in leather dress shoes."],"clues":["Mortar Shoe Prints","Item: Mortar Shoe Prints","Clue Word: Mortar Shoe Prints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9cd4c6fa-5af8-5976-bdf3-1fe4e96b3061',
  'story_050',
  'ev_7',
  7,
  '06:30 AM',
  'A 10-pound steel sledgehammer cracks through the soft mortar joints.',
  'A 10-pound steel sledgehammer cracks through the soft mortar joints.',
  'Detective Sterling breaches the fresh wall to rescue the gasping brother.',
  'Sledgehammer',
  'Heavy double-faced hammer used to knock down the brick barrier.',
  '["Axe","Crowbar","Pickaxe"]'::jsonb,
  'Sledgehammer',
  '["sledgehammer","hammer","heavy hammer","tool"]'::jsonb,
  'A heavy metal hammer with a long wooden handle used to smash through walls.',
  'ev_8',
  false,
  '{"descriptions":["A 10-pound steel sledgehammer cracks through the soft mortar joints.","At 06:30 AM: A 10-pound steel sledgehammer cracks through the soft mortar joints.","Notice this clue: A 10-pound steel sledgehammer cracks through the soft mortar joints."],"hints":["A heavy metal hammer with a long wooden handle used to smash through walls.","Clue hint: Think about sledgehammer.","Search for: detective sterling breaches the fresh wall to rescue the gasping brother."],"clues":["Sledgehammer","Item: Sledgehammer","Clue Word: Sledgehammer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '52059cfc-874f-55cc-8140-a96d66f3bd81',
  'story_050',
  'ev_8',
  8,
  '07:00 AM',
  'A forged deed transferring Blackwood Manor to Julian Blackwood is on the desk.',
  'A forged deed transferring Blackwood Manor to Julian Blackwood is on the desk.',
  'The legal motive: Julian intended to claim Arthur died abroad and take the house.',
  'Forged Property Deed',
  'Legal parchment signed with Arthur’s forged signature granting Julian the estate.',
  '["Will","Receipt","Letter"]'::jsonb,
  'Forged Property Deed',
  '["forged property deed","deed","property deed","forged deed","document"]'::jsonb,
  'A legal document that proves who owns a piece of land or a large house.',
  NULL,
  true,
  '{"descriptions":["A forged deed transferring Blackwood Manor to Julian Blackwood is on the desk.","At 07:00 AM: A forged deed transferring Blackwood Manor to Julian Blackwood is on the desk.","Notice this clue: A forged deed transferring Blackwood Manor to Julian Blackwood is on the desk."],"hints":["A legal document that proves who owns a piece of land or a large house.","Clue hint: Think about forged property deed.","Search for: the legal motive: julian intended to claim arthur died abroad and take the house."],"clues":["Forged Property Deed","Item: Forged Property Deed","Clue Word: Forged Property Deed"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_051 — THE DOLL IN THE CRADLE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_051',
  'The Doll in the Cradle',
  'Horror',
  'The Victorian Nursery, dusty floral wallpaper, antique wooden rocking cradle, rocking chair',
  'A vintage porcelain doll was found sitting at the breakfast table every morning with fresh scratches on its wooden cheeks.',
  '[{"name":"Evelyn Vance","role":"Live-in Governess","alibi":"In the third-floor servant bedroom reading scriptures","avatar":"🪡"},{"name":"Lily Sterling","role":"Nine-Year-Old Daughter","alibi":"Sleeping in her parents’ master bedroom","avatar":"👧"},{"name":"Lord Arthur Sterling","role":"Father & Estate Owner","alibi":"Patrolling the hallway with a flashlight","avatar":"🎩"},{"name":"Detective Frank Miller","role":"Occult Fraud Specialist","alibi":"Installed night-vision cameras in the nursery at 10:00 PM","avatar":"🔍"}]'::jsonb,
  'Governess Evelyn Vance used transparent fishing lines threaded through ceiling vents to rock the cradle and move the porcelain doll across rooms. She scratched the doll with pins to simulate a demon, aiming to drive the family away so she could search for hidden gold coins.',
  'Governess Evelyn Vance',
  'Evelyn wanted to terrify the wealthy family into abandoning the house so she could find hidden heirloom jewels.',
  '[{"time":"10:00 PM","event":"Detective Miller installs a hidden infrared night-vision camera."},{"time":"11:30 PM","event":"Evelyn pulls the nylon line from her bedroom above the nursery."},{"time":"11:35 PM","event":"The antique cradle rocks rhythmically on its wooden rockers."},{"time":"02:00 AM","event":"Evelyn creeps down, moves the doll to the breakfast table, and scratches its cheek with a pin."},{"time":"06:00 AM","event":"The family wakes up to find the scratched doll staring from the dining chair."}]'::jsonb,
  '[{"id":"ev1","title":"Infrared Video of Evelyn Moving Doll","detail":"Conclusive thermal camera evidence showing the governess staging the doll at 2:00 AM."},{"id":"ev2","title":"Monofilament String Rigging","detail":"Tied from the cradle through ceiling eyelet screws into Evelyn’s upstairs room."},{"id":"ev3","title":"Sewing Bodkin with Porcelain Scratches","detail":"Matches the fresh scratch patterns carved into the doll’s cheeks."},{"id":"ev4","title":"1880 Gold Hoard Blueprint","detail":"Proves Evelyn was trying to drive the family away to excavate the nursery wall safe."}]'::jsonb,
  '[{"order":1,"title":"Rocking Cradle","text":"Wooden baby cradle rigged to rock automatically via ceiling strings."},{"order":2,"title":"Porcelain Doll","text":"Antique ceramic toy placed at the breakfast table to simulate possession."},{"order":3,"title":"Monofilament String","text":"Invisible nylon line used to move the cradle and doll from afar."},{"order":4,"title":"Sewing Bodkin","text":"Sharp metal needle used to gouge demonic marks into the doll’s face."},{"order":5,"title":"Night-Vision Video","text":"Infrared recording capturing the governess staging the supernatural prank."},{"order":6,"title":"Hidden Safe Blueprint","text":"Historic drawing showing a fortune in gold coins hidden in the nursery."}]'::jsonb,
  'Daughter Lily hid her teddy bear.: She was frightened by the doll and wanted to keep her toy safe.; The nursery had a drafty chimney flue.: Caused cold air to blow, but had no role in moving the cradle.',
  'Claim the spirit of an angry Victorian child inhabited the doll or blame the young daughter Lily.',
  'NORMAL',
  'Was the doll animated by a malevolent curse, or was a living intruder moving it in the night?',
  '[{"character":"Evelyn Vance","secret":"She has a 19th-century builder’s blueprint showing hidden wall safes."},{"character":"Lily Sterling","secret":"She hid her favorite teddy bear inside the grandfather clock."},{"character":"Lord Arthur Sterling","secret":"He was considering selling the historic manor at a massive loss."},{"character":"Detective Frank Miller","secret":"Exposed a fake séance ring in the city two months ago."}]'::jsonb,
  '[{"lead":"Daughter Lily hid her teddy bear.","explanation":"She was frightened by the doll and wanted to keep her toy safe."},{"lead":"The nursery had a drafty chimney flue.","explanation":"Caused cold air to blow, but had no role in moving the cradle."}]'::jsonb,
  '{"wrongTheories":["The spirit of a deceased Victorian infant possessed the porcelain doll.","Nine-year-old Lily was sleepwalking and moving the doll unconsciously."],"correctTheory":"Governess Evelyn Vance used clear fishing line through ceiling eyelets to rock the cradle and moved the scratched doll at night to terrify the family into abandoning the manor so she could steal a gold coin hoard hidden in the nursery wall."}'::jsonb,
  'Governess Evelyn Vance rigged the doll to scare the family and steal hidden gold!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Miller confronted Evelyn with the infrared video and the fishing line. Evelyn was arrested for criminal harassment and burglary, and the family kept their historic home."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The terrified family sold the manor to an overseas developer for pennies. Evelyn bought the house cheaply, excavated the gold, and retired wealthy."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The house was featured in sensational paranormal magazines as \"The Nursery of Horrors.\" Evelyn continued working as a spiritualist tour guide."}]'::jsonb,
  '{"intros":["A vintage porcelain doll was found sitting at the breakfast table every morning with fresh scratches on its wooden cheeks.","Case file story_051: A vintage porcelain doll was found sitting at the breakfast table every morning with fresh scratches on its wooden cheeks. Look closely at every clue.","Trouble begins in The Victorian Nursery, dusty floral wallpaper, antique wooden rocking cradle, rocking chair. A vintage porcelain doll was found sitting at the breakfast table every morning with fresh scratches on its wooden cheeks.","The mystery starts now. A vintage porcelain doll was found sitting at the breakfast table every morning with fresh scratches on its wooden cheeks. Can you solve it?"],"reveals":["Governess Evelyn Vance rigged the doll to scare the family and steal hidden gold!","The mystery is unraveled! Governess Evelyn Vance rigged the doll to scare the family and steal hidden gold!","At last, the truth comes out: Governess Evelyn Vance rigged the doll to scare the family and steal hidden gold!","Case resolved! Here is what happened: Governess Evelyn Vance rigged the doll to scare the family and steal hidden gold!"],"hints":["Pay attention to where Governess Evelyn Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_051';
DELETE FROM public.case_events WHERE case_id = 'story_051';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '52f5a392-5e3d-56cf-9a1e-192b1fa159b5',
  'story_051',
  'Evelyn Vance',
  'Live-in Governess',
  'Quiet, pious, black high-collared dress, carrying a silver sewing kit',
  'The doll is possessed by evil spirits. We must leave this house before someone gets hurt.',
  'She has a 19th-century builder’s blueprint showing hidden wall safes.',
  'In the third-floor servant bedroom reading scriptures',
  'Tutor and caretaker for young Lily',
  'The nursery ceiling ventilation rosette has holes wide enough for nylon string.',
  'Did not know an infrared baby monitor was recording the nursery at night.',
  '🪡',
  '["The doll is possessed by evil spirits. We must leave this house before someone gets hurt.","\"The doll is possessed by evil spirits. We must leave this house before someone gets hurt.\"","Listen to me: The doll is possessed by evil spirits. We must leave this house before someone gets hurt.","I tell you the truth: The doll is possessed by evil spirits. We must leave this house before someone gets hurt."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'cf06c074-b3a3-5e3d-bdba-06dc6e91e86c',
  'story_051',
  'Lily Sterling',
  'Nine-Year-Old Daughter',
  'Terrified, clutching her blanket, refusing to enter the nursery',
  'The doll whispers when the lights go out. It said: "Get out of my room."',
  'She hid her favorite teddy bear inside the grandfather clock.',
  'Sleeping in her parents’ master bedroom',
  'Original owner of the antique porcelain doll',
  'The doll’s glass eyes seemed to look at the ceiling vent before it moved.',
  'Did not realize her governess was manipulating the strings.',
  '👧',
  '["The doll whispers when the lights go out. It said: \"Get out of my room.\"","\"The doll whispers when the lights go out. It said: \"Get out of my room.\"\"","Listen to me: The doll whispers when the lights go out. It said: \"Get out of my room.\"","I tell you the truth: The doll whispers when the lights go out. It said: \"Get out of my room.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4cf6a60d-318f-523f-9dbd-3264666e4370',
  'story_051',
  'Lord Arthur Sterling',
  'Father & Estate Owner',
  'Frustrated, sleep-deprived, clutching a heavy iron poker',
  'Someone is playing sick psychological games with my daughter, and I will find them.',
  'He was considering selling the historic manor at a massive loss.',
  'Patrolling the hallway with a flashlight',
  'Master of the estate targeted by the haunting scam',
  'Found fine clear nylon threads snagged in the nursery chandelier.',
  'Did not know Evelyn had found his grandfather’s gold hoard blueprint.',
  '🎩',
  '["Someone is playing sick psychological games with my daughter, and I will find them.","\"Someone is playing sick psychological games with my daughter, and I will find them.\"","Listen to me: Someone is playing sick psychological games with my daughter, and I will find them.","I tell you the truth: Someone is playing sick psychological games with my daughter, and I will find them."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '29e3df5a-1251-5340-bd18-d844ab43a400',
  'story_051',
  'Detective Frank Miller',
  'Occult Fraud Specialist',
  'Skeptical, dry, carries night-vision cameras and forensic string-tracers',
  'In twenty years of investigating "haunted" houses, I have only ever found human greed.',
  'Exposed a fake séance ring in the city two months ago.',
  'Installed night-vision cameras in the nursery at 10:00 PM',
  'Leading the investigation into the nursery disturbances',
  'Found spool holes and eyelet screws painted white inside the ceiling cornice.',
  'Did not immediately locate Evelyn’s hidden blueprint.',
  '🔍',
  '["In twenty years of investigating \"haunted\" houses, I have only ever found human greed.","\"In twenty years of investigating \"haunted\" houses, I have only ever found human greed.\"","Listen to me: In twenty years of investigating \"haunted\" houses, I have only ever found human greed.","I tell you the truth: In twenty years of investigating \"haunted\" houses, I have only ever found human greed."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c46baa18-c17b-59a1-b561-c0562983aee9',
  'story_051',
  'ev_1',
  1,
  '11:35 PM',
  'A wooden rocking cradle begins rocking with a loud, rhythmic wooden squeak.',
  'A wooden rocking cradle begins rocking with a loud, rhythmic wooden squeak.',
  'The cradle was pulled by an invisible clear monofilament string from above.',
  'Rocking Cradle',
  'Carved pine cradle with eyelet screw hidden beneath the rocker runner.',
  '["Baby Bed","High Chair","Rocking Horse"]'::jsonb,
  'Rocking Cradle',
  '["rocking cradle","cradle","bed","wooden cradle"]'::jsonb,
  'A small wooden baby bed on curved runners that swings side to side.',
  'ev_2',
  true,
  '{"descriptions":["A wooden rocking cradle begins rocking with a loud, rhythmic wooden squeak.","At 11:35 PM: A wooden rocking cradle begins rocking with a loud, rhythmic wooden squeak.","Notice this clue: A wooden rocking cradle begins rocking with a loud, rhythmic wooden squeak."],"hints":["A small wooden baby bed on curved runners that swings side to side.","Clue hint: Think about rocking cradle.","Search for: the cradle was pulled by an invisible clear monofilament string from above."],"clues":["Rocking Cradle","Item: Rocking Cradle","Clue Word: Rocking Cradle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8e891ddf-5acd-5b75-a920-1d90d22be743',
  'story_051',
  'ev_2',
  2,
  '02:00 AM',
  'An antique 19th-century porcelain doll with blue glass eyes sits at the breakfast table.',
  'An antique 19th-century porcelain doll with blue glass eyes sits at the breakfast table.',
  'The doll was moved by human hands and staged on the dining chair.',
  'Porcelain Doll',
  'Bisque porcelain doll in a Victorian lace dress with freshly scratched cheeks.',
  '["Teddy Bear","Wooden Puppet","Rag Doll"]'::jsonb,
  'Porcelain Doll',
  '["porcelain doll","doll","antique doll","bisque doll"]'::jsonb,
  'A vintage toy baby with a fragile ceramic face and glass eyes.',
  'ev_3',
  false,
  '{"descriptions":["An antique 19th-century porcelain doll with blue glass eyes sits at the breakfast table.","At 02:00 AM: An antique 19th-century porcelain doll with blue glass eyes sits at the breakfast table.","Notice this clue: An antique 19th-century porcelain doll with blue glass eyes sits at the breakfast table."],"hints":["A vintage toy baby with a fragile ceramic face and glass eyes.","Clue hint: Think about porcelain doll.","Search for: the doll was moved by human hands and staged on the dining chair."],"clues":["Porcelain Doll","Item: Porcelain Doll","Clue Word: Porcelain Doll"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4cf0c105-1e81-577e-9b2d-9e7e9b945386',
  'story_051',
  'ev_3',
  3,
  '02:05 AM',
  'A spool of transparent 10-pound nylon fishing line is hidden in Evelyn’s sewing box.',
  'A spool of transparent 10-pound nylon fishing line is hidden in Evelyn’s sewing box.',
  'The thin plastic line was invisible in the dark nursery shadows.',
  'Monofilament String',
  'Clear nylon fishing line threaded through small eyelet screws in the ceiling.',
  '["Hemp Thread","Silk Ribbon","Copper Wire"]'::jsonb,
  'Monofilament String',
  '["monofilament string","string","fishing line","monofilament","nylon line"]'::jsonb,
  'A clear plastic thread used for fishing that cannot be seen in the dark.',
  'ev_4',
  false,
  '{"descriptions":["A spool of transparent 10-pound nylon fishing line is hidden in Evelyn’s sewing box.","At 02:05 AM: A spool of transparent 10-pound nylon fishing line is hidden in Evelyn’s sewing box.","Notice this clue: A spool of transparent 10-pound nylon fishing line is hidden in Evelyn’s sewing box."],"hints":["A clear plastic thread used for fishing that cannot be seen in the dark.","Clue hint: Think about monofilament string.","Search for: the thin plastic line was invisible in the dark nursery shadows."],"clues":["Monofilament String","Item: Monofilament String","Clue Word: Monofilament String"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6ce2714d-ea4d-55f7-9049-dce19a6c1f3a',
  'story_051',
  'ev_4',
  4,
  '02:10 AM',
  'A sharp steel sewing bodkin needle with porcelain dust on the point is seized.',
  'A sharp steel sewing bodkin needle with porcelain dust on the point is seized.',
  'Evelyn used the steel needle to scratch fresh "demon marks" into the doll’s face.',
  'Sewing Bodkin',
  'Heavy steel needle with white porcelain powder on its sharp tip.',
  '["Scissors","Safety Pin","Pocket Knife"]'::jsonb,
  'Sewing Bodkin',
  '["sewing bodkin","needle","bodkin","sewing needle","pin"]'::jsonb,
  'A thick, sharp pointed metal tool used in sewing and leather crafting.',
  'ev_5',
  false,
  '{"descriptions":["A sharp steel sewing bodkin needle with porcelain dust on the point is seized.","At 02:10 AM: A sharp steel sewing bodkin needle with porcelain dust on the point is seized.","Notice this clue: A sharp steel sewing bodkin needle with porcelain dust on the point is seized."],"hints":["A thick, sharp pointed metal tool used in sewing and leather crafting.","Clue hint: Think about sewing bodkin.","Search for: evelyn used the steel needle to scratch fresh \"demon marks\" into the doll’s face."],"clues":["Sewing Bodkin","Item: Sewing Bodkin","Clue Word: Sewing Bodkin"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5bcdef72-bb50-54b5-ba9d-0e370211206d',
  'story_051',
  'ev_5',
  5,
  '03:00 AM',
  'An infrared night-vision video recording captures a figure in black moving the doll.',
  'An infrared night-vision video recording captures a figure in black moving the doll.',
  'Camera footage shows Evelyn Vance carrying the doll down the back stairs.',
  'Night-Vision Video',
  'High-definition thermal footage clearly showing Evelyn’s face at 2:00 AM.',
  '["Photograph","Audio Tape","Shadow"]'::jsonb,
  'Night-Vision Video',
  '["night-vision video","video","night vision","recording","footage","camera video"]'::jsonb,
  'A black-and-green video recording made in total darkness using invisible infrared light.',
  'ev_6',
  true,
  '{"descriptions":["An infrared night-vision video recording captures a figure in black moving the doll.","At 03:00 AM: An infrared night-vision video recording captures a figure in black moving the doll.","Notice this clue: An infrared night-vision video recording captures a figure in black moving the doll."],"hints":["A black-and-green video recording made in total darkness using invisible infrared light.","Clue hint: Think about night-vision video.","Search for: camera footage shows evelyn vance carrying the doll down the back stairs."],"clues":["Night-Vision Video","Item: Night-Vision Video","Clue Word: Night-Vision Video"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '23a7d057-07c1-57ae-84ad-7ee59305b52a',
  'story_051',
  'ev_6',
  6,
  '04:00 AM',
  'An antique architectural floor plan showing a hidden wall safe in the nursery is found.',
  'An antique architectural floor plan showing a hidden wall safe in the nursery is found.',
  'The safe contained five hundred double-eagle gold coins hidden by the grandfather.',
  'Hidden Safe Blueprint',
  'Yellowed 1880 blueprint marked "NURSERY CHIMNEY - GOLD HOARD".',
  '["Newspaper","Diary","Letter"]'::jsonb,
  'Hidden Safe Blueprint',
  '["hidden safe blueprint","blueprint","safe blueprint","map","floor plan"]'::jsonb,
  'An old building plan showing secret hiding spots inside house walls.',
  'ev_7',
  false,
  '{"descriptions":["An antique architectural floor plan showing a hidden wall safe in the nursery is found.","At 04:00 AM: An antique architectural floor plan showing a hidden wall safe in the nursery is found.","Notice this clue: An antique architectural floor plan showing a hidden wall safe in the nursery is found."],"hints":["An old building plan showing secret hiding spots inside house walls.","Clue hint: Think about hidden safe blueprint.","Search for: the safe contained five hundred double-eagle gold coins hidden by the grandfather."],"clues":["Hidden Safe Blueprint","Item: Hidden Safe Blueprint","Clue Word: Hidden Safe Blueprint"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6584ee0d-2af0-5eb6-bf9c-6308fc285aac',
  'story_051',
  'ev_7',
  7,
  '04:30 AM',
  'Tiny white eyelet screws are found painted over with white ceiling paint.',
  'Tiny white eyelet screws are found painted over with white ceiling paint.',
  'Evelyn created an elaborate ceiling pulley system to pull strings from her bedroom.',
  'Ceiling Eyelet Screws',
  'Miniature brass loop screws screwed into the nursery ceiling plaster.',
  '["Nail","Hook","Staple"]'::jsonb,
  'Ceiling Eyelet Screws',
  '["ceiling eyelet screws","screws","eyelet screws","ceiling screws","hooks"]'::jsonb,
  'Small metal screws with a loop on the end used to thread strings and wires.',
  'ev_8',
  false,
  '{"descriptions":["Tiny white eyelet screws are found painted over with white ceiling paint.","At 04:30 AM: Tiny white eyelet screws are found painted over with white ceiling paint.","Notice this clue: Tiny white eyelet screws are found painted over with white ceiling paint."],"hints":["Small metal screws with a loop on the end used to thread strings and wires.","Clue hint: Think about ceiling eyelet screws.","Search for: evelyn created an elaborate ceiling pulley system to pull strings from her bedroom."],"clues":["Ceiling Eyelet Screws","Item: Ceiling Eyelet Screws","Clue Word: Ceiling Eyelet Screws"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b33ac040-d533-522c-be04-499cad815cb3',
  'story_051',
  'ev_8',
  8,
  '05:00 AM',
  'A small pry bar with plaster dust from the nursery fireplace is in Evelyn’s closet.',
  'A small pry bar with plaster dust from the nursery fireplace is in Evelyn’s closet.',
  'Evelyn was secretly chipping away at the fireplace wall to reach the gold coins.',
  'Small Pry Bar',
  'Six-inch flat pry tool with old lime mortar and white plaster dust.',
  '["Hammer","Chisel","Screwdriver"]'::jsonb,
  'Small Pry Bar',
  '["small pry bar","pry bar","tool","bar","crowbar"]'::jsonb,
  'A small flat metal lever used to pry open floorboards or bricks.',
  NULL,
  true,
  '{"descriptions":["A small pry bar with plaster dust from the nursery fireplace is in Evelyn’s closet.","At 05:00 AM: A small pry bar with plaster dust from the nursery fireplace is in Evelyn’s closet.","Notice this clue: A small pry bar with plaster dust from the nursery fireplace is in Evelyn’s closet."],"hints":["A small flat metal lever used to pry open floorboards or bricks.","Clue hint: Think about small pry bar.","Search for: evelyn was secretly chipping away at the fireplace wall to reach the gold coins."],"clues":["Small Pry Bar","Item: Small Pry Bar","Clue Word: Small Pry Bar"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_052 — THE BLACKWOOD FOREST CABIN
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_052',
  'The Blackwood Forest Cabin',
  'Horror',
  'Deep Blackwood Pines, rustic wooden hunting cabin surrounded by dense fog and towering fir trees',
  'Four vacationers woke at dawn to find every window and door boarded up with heavy timber planks from the outside.',
  '[{"name":"Caleb Vance","role":"Local Woodsman & Hunter","alibi":"In his log cabin two miles deeper in the woods","avatar":"🪓"},{"name":"David Sterling","role":"Lead Timber Developer","alibi":"Asleep in the main cabin bedroom","avatar":"💼"},{"name":"Nora Higgins","role":"Environmental Surveyor","alibi":"Sleeping in the loft bedroom","avatar":"🌲"},{"name":"Sheriff Thomas Cole","role":"County Sheriff","alibi":"Dispatched to the cabin after David managed a crackly emergency satellite call","avatar":"👮"}]'::jsonb,
  'Local woodsman Caleb Vance opposed the city developers who bought the forest. While the four guests slept, Caleb used an industrial battery-powered framing nailgun to board up all doors and windows with pine planks, trapping them inside while he burned their survey equipment.',
  'Local Woodsman Caleb Vance',
  'Caleb wanted to trap the city developers inside while he burned their timber acquisition contracts.',
  '[{"time":"08:00 PM","event":"The four developers arrive at the remote cabin in heavy fog."},{"time":"11:00 PM","event":"The developers go to sleep after an evening drinking whiskey."},{"time":"02:45 AM","event":"Caleb Vance arrives on foot carrying pine planks and a cordless nailgun."},{"time":"03:15 AM","event":"Caleb nails heavy timber planks across all six windows and two doors."},{"time":"06:30 AM","event":"The guests wake up in pitch blackness and discover they are trapped."}]'::jsonb,
  '[{"id":"ev1","title":"DeWalt 20V Battery Pack Serial #904","detail":"Found on the cabin porch; registered to Caleb Vance’s workshop account."},{"id":"ev2","title":"Ring-Shank Framing Nails","detail":"Identical to the industrial nails loaded in Caleb’s cordless framing gun."},{"id":"ev3","title":"Burnt Surveying Tripods in Pit","detail":"Proves the saboteur’s objective was to destroy the development mapping project."},{"id":"ev4","title":"Calk Logging Boot Impressions","detail":"Circling all six cabin windows, matching Caleb’s unique forestry footwear."}]'::jsonb,
  '[{"order":1,"title":"Pine Timber Planks","text":"Heavy lumber nailed across every door and window to trap the guests."},{"order":2,"title":"Framing Nails","text":"Industrial ring-shank nails driven silently by a cordless power tool."},{"order":3,"title":"Nailgun Battery Pack","text":"Yellow tool battery dropped in the mud by the intruder."},{"order":4,"title":"Burnt Survey Equipment","text":"Melted optical tools destroyed to halt the land development."},{"order":5,"title":"Boarded Windows","text":"Complete blackout created by sealing the cabin from the outside."},{"order":6,"title":"Eviction Notice","text":"Court order establishing Caleb’s motive to retaliate against developers."}]'::jsonb,
  'Surveyor Nora agreed with forest conservation.: She had ideological sympathy, but was trapped inside with the others.; Wolves howled in the distant mountains.: Natural wildlife that caused fear, but had no role in the carpentry.',
  'Claim a feral woodland creature trapped them or blame the local hunting guide.',
  'NORMAL',
  'Who boarded the cabin windows while the guests slept and what was prowling outside in the woods?',
  '[{"character":"Caleb Vance","secret":"He hid a cordless industrial nailgun and boxes of framing nails in his tool shed."},{"character":"David Sterling","secret":"He carried an eviction notice to condemn Caleb’s ancestral cabin on Monday."},{"character":"Nora Higgins","secret":"She agreed with the locals that the ancient pines should not be logged."},{"character":"Sheriff Thomas Cole","secret":"Knew Caleb’s family had logged these woods for three generations."}]'::jsonb,
  '[{"lead":"Surveyor Nora agreed with forest conservation.","explanation":"She had ideological sympathy, but was trapped inside with the others."},{"lead":"Wolves howled in the distant mountains.","explanation":"Natural wildlife that caused fear, but had no role in the carpentry."}]'::jsonb,
  '{"wrongTheories":["A mythical woodland beast trapped the developers to consume them in the dark.","The vacationers became drunk and boarded themselves in as a psychological dare."],"correctTheory":"Local woodsman Caleb Vance used a cordless framing nailgun and pine timber planks to board up all doors and windows of the cabin while the developers slept, burning their survey tools in retaliation for an impending eviction notice."}'::jsonb,
  'Woodsman Caleb Vance nailed the cabin shut to fight against his eviction!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Sheriff Cole matched the battery pack to Caleb’s nailgun in his shed. Caleb was arrested for false imprisonment and arson, while the logging plan was suspended."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The terrified developers fled the forest, abandoning the project. Caleb remained in his ancestral woods undisturbed."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Local folklore proclaimed the cabin \"The Tomb of the Blackwood Hag.\" Caleb charged tourists to see the mysterious boards."}]'::jsonb,
  '{"intros":["Four vacationers woke at dawn to find every window and door boarded up with heavy timber planks from the outside.","Case file story_052: Four vacationers woke at dawn to find every window and door boarded up with heavy timber planks from the outside. Look closely at every clue.","Trouble begins in Deep Blackwood Pines, rustic wooden hunting cabin surrounded by dense fog and towering fir trees. Four vacationers woke at dawn to find every window and door boarded up with heavy timber planks from the outside.","The mystery starts now. Four vacationers woke at dawn to find every window and door boarded up with heavy timber planks from the outside. Can you solve it?"],"reveals":["Woodsman Caleb Vance nailed the cabin shut to fight against his eviction!","The mystery is unraveled! Woodsman Caleb Vance nailed the cabin shut to fight against his eviction!","At last, the truth comes out: Woodsman Caleb Vance nailed the cabin shut to fight against his eviction!","Case resolved! Here is what happened: Woodsman Caleb Vance nailed the cabin shut to fight against his eviction!"],"hints":["Pay attention to where Local Woodsman Caleb Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_052';
DELETE FROM public.case_events WHERE case_id = 'story_052';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6244f1dc-dcbe-59b5-b2c5-d8b9a4449643',
  'story_052',
  'Caleb Vance',
  'Local Woodsman & Hunter',
  'Weathered, silent, wearing oilskin jacket and heavy logging boots, smelling of pine pitch',
  'The Blackwood Pines don’t take kindly to city developers. The forest has its own ways of keeping people out.',
  'He hid a cordless industrial nailgun and boxes of framing nails in his tool shed.',
  'In his log cabin two miles deeper in the woods',
  'Opposed the commercial timber development of Blackwood Pines',
  'The cabin has thick pine logs that muffle sound from the outside.',
  'Did not know he dropped a yellow nailgun battery pack on the front porch.',
  '🪓',
  '["The Blackwood Pines don’t take kindly to city developers. The forest has its own ways of keeping people out.","\"The Blackwood Pines don’t take kindly to city developers. The forest has its own ways of keeping people out.\"","Listen to me: The Blackwood Pines don’t take kindly to city developers. The forest has its own ways of keeping people out.","I tell you the truth: The Blackwood Pines don’t take kindly to city developers. The forest has its own ways of keeping people out."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2befdae8-2ba2-5483-b755-6e7acae5a8e9',
  'story_052',
  'David Sterling',
  'Lead Timber Developer',
  'Arrogant, tailored outdoor vest, holding a satellite phone with no signal',
  'We were trapped in total darkness! Someone nailed heavy two-by-fours across every single window!',
  'He carried an eviction notice to condemn Caleb’s ancestral cabin on Monday.',
  'Asleep in the main cabin bedroom',
  'Leader of the development team targeted by the trap',
  'The front door was secured with six three-inch steel nails.',
  'Did not expect local resistance to take such an extreme physical form.',
  '💼',
  '["We were trapped in total darkness! Someone nailed heavy two-by-fours across every single window!","\"We were trapped in total darkness! Someone nailed heavy two-by-fours across every single window!\"","Listen to me: We were trapped in total darkness! Someone nailed heavy two-by-fours across every single window!","I tell you the truth: We were trapped in total darkness! Someone nailed heavy two-by-fours across every single window!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'aa46c41f-1aa8-53ea-b08f-db3608df24f9',
  'story_052',
  'Nora Higgins',
  'Environmental Surveyor',
  'Observant, nervous, holding a camera and forestry map',
  'I heard a rhythmic thudding sound around 3:00 AM, like a machine hammer.',
  'She agreed with the locals that the ancient pines should not be logged.',
  'Sleeping in the loft bedroom',
  'Surveying the forest for environmental impact',
  'Saw fresh logging truck tire tracks in the muddy driveway.',
  'Did not know Caleb had already burned their survey instruments.',
  '🌲',
  '["I heard a rhythmic thudding sound around 3:00 AM, like a machine hammer.","\"I heard a rhythmic thudding sound around 3:00 AM, like a machine hammer.\"","Listen to me: I heard a rhythmic thudding sound around 3:00 AM, like a machine hammer.","I tell you the truth: I heard a rhythmic thudding sound around 3:00 AM, like a machine hammer."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '992f0016-167e-51c3-a8a9-371e45502395',
  'story_052',
  'Sheriff Thomas Cole',
  'County Sheriff',
  'Gruff, practical, carrying a crowbar and heavy flashlight',
  'Feral beasts don’t use DeWalt framing nailers and two-by-four kiln-dried lumber.',
  'Knew Caleb’s family had logged these woods for three generations.',
  'Dispatched to the cabin after David managed a crackly emergency satellite call',
  'Investigating unlawful imprisonment and property sabotage',
  'Found three-inch galvanized ring-shank nails driven into the doorframe.',
  'Did not immediately have Caleb’s tool shed search warrant.',
  '👮',
  '["Feral beasts don’t use DeWalt framing nailers and two-by-four kiln-dried lumber.","\"Feral beasts don’t use DeWalt framing nailers and two-by-four kiln-dried lumber.\"","Listen to me: Feral beasts don’t use DeWalt framing nailers and two-by-four kiln-dried lumber.","I tell you the truth: Feral beasts don’t use DeWalt framing nailers and two-by-four kiln-dried lumber."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f70d5e4c-dfe3-5985-ba6b-7fcf73bffea8',
  'story_052',
  'ev_1',
  1,
  '03:15 AM',
  'Heavy two-by-six pine timber planks are nailed across the front cabin door.',
  'Heavy two-by-six pine timber planks are nailed across the front cabin door.',
  'The door was sealed with six heavy industrial nails driven into the solid log jamb.',
  'Pine Timber Planks',
  'Rough-sawn kiln-dried pine lumber stamped "Blackwood Mill".',
  '["Iron Bars","Plywood Sheet","Chain Link"]'::jsonb,
  'Pine Timber Planks',
  '["pine timber planks","planks","pine planks","timber","boards","wood planks"]'::jsonb,
  'Thick wooden boards nailed across a doorway to prevent people from opening it.',
  'ev_2',
  true,
  '{"descriptions":["Heavy two-by-six pine timber planks are nailed across the front cabin door.","At 03:15 AM: Heavy two-by-six pine timber planks are nailed across the front cabin door.","Notice this clue: Heavy two-by-six pine timber planks are nailed across the front cabin door."],"hints":["Thick wooden boards nailed across a doorway to prevent people from opening it.","Clue hint: Think about pine timber planks.","Search for: the door was sealed with six heavy industrial nails driven into the solid log jamb."],"clues":["Pine Timber Planks","Item: Pine Timber Planks","Clue Word: Pine Timber Planks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0aa6bfdc-6f7c-5158-96ab-28f43c3269e6',
  'story_052',
  'ev_2',
  2,
  '03:18 AM',
  'A pneumatic/battery framing nailgun fires three-inch ring-shank nails with a dull thud.',
  'A pneumatic/battery framing nailgun fires three-inch ring-shank nails with a dull thud.',
  'The nails were driven silently using an electric cordless tool instead of a loud hammer.',
  'Framing Nails',
  'Collated paper-tape galvanized steel nails with diamond points.',
  '["Screws","Spikes","Tacks"]'::jsonb,
  'Framing Nails',
  '["framing nails","nails","steel nails","ring-shank nails"]'::jsonb,
  'Sharp pointed metal pins fired by power tools into wood to hold it tight.',
  'ev_3',
  false,
  '{"descriptions":["A pneumatic/battery framing nailgun fires three-inch ring-shank nails with a dull thud.","At 03:18 AM: A pneumatic/battery framing nailgun fires three-inch ring-shank nails with a dull thud.","Notice this clue: A pneumatic/battery framing nailgun fires three-inch ring-shank nails with a dull thud."],"hints":["Sharp pointed metal pins fired by power tools into wood to hold it tight.","Clue hint: Think about framing nails.","Search for: the nails were driven silently using an electric cordless tool instead of a loud hammer."],"clues":["Framing Nails","Item: Framing Nails","Clue Word: Framing Nails"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2039273e-b2e2-59e2-9eb5-68bc9248dd02',
  'story_052',
  'ev_3',
  3,
  '03:25 AM',
  'A yellow DeWalt 20V rechargeable lithium tool battery pack is dropped in the mud.',
  'A yellow DeWalt 20V rechargeable lithium tool battery pack is dropped in the mud.',
  'Caleb accidentally dislodged his spare battery pack while boarding the side window.',
  'Nailgun Battery Pack',
  'Yellow and black plastic power tool battery stamped with serial #904.',
  '["Car Battery","Flashlight","Cell Phone"]'::jsonb,
  'Nailgun Battery Pack',
  '["nailgun battery pack","battery","battery pack","dewalt battery","tool battery"]'::jsonb,
  'A rectangular rechargeable plastic battery used to power modern cordless tools.',
  'ev_4',
  false,
  '{"descriptions":["A yellow DeWalt 20V rechargeable lithium tool battery pack is dropped in the mud.","At 03:25 AM: A yellow DeWalt 20V rechargeable lithium tool battery pack is dropped in the mud.","Notice this clue: A yellow DeWalt 20V rechargeable lithium tool battery pack is dropped in the mud."],"hints":["A rectangular rechargeable plastic battery used to power modern cordless tools.","Clue hint: Think about nailgun battery pack.","Search for: caleb accidentally dislodged his spare battery pack while boarding the side window."],"clues":["Nailgun Battery Pack","Item: Nailgun Battery Pack","Clue Word: Nailgun Battery Pack"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1b0cb0ef-ad5f-5509-b9ae-31ea7d0fc0c6',
  'story_052',
  'ev_4',
  4,
  '03:40 AM',
  'A charred pile of melted laser survey tripods and GPS gear smolders in a fire pit.',
  'A charred pile of melted laser survey tripods and GPS gear smolders in a fire pit.',
  'Caleb burned the developers’ expensive mapping tools while they were trapped.',
  'Burnt Survey Equipment',
  'Melted aluminum tripod legs and scorched optical surveying lenses.',
  '["Campfire Wood","Trash Heap","Burnt Clothes"]'::jsonb,
  'Burnt Survey Equipment',
  '["burnt survey equipment","equipment","survey equipment","tripod","burnt equipment"]'::jsonb,
  'Technical measuring tools and tripods used by land surveyors burned by fire.',
  'ev_5',
  false,
  '{"descriptions":["A charred pile of melted laser survey tripods and GPS gear smolders in a fire pit.","At 03:40 AM: A charred pile of melted laser survey tripods and GPS gear smolders in a fire pit.","Notice this clue: A charred pile of melted laser survey tripods and GPS gear smolders in a fire pit."],"hints":["Technical measuring tools and tripods used by land surveyors burned by fire.","Clue hint: Think about burnt survey equipment.","Search for: caleb burned the developers’ expensive mapping tools while they were trapped."],"clues":["Burnt Survey Equipment","Item: Burnt Survey Equipment","Clue Word: Burnt Survey Equipment"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '61768480-a296-5a91-b3ae-f3ba392ea293',
  'story_052',
  'ev_5',
  5,
  '06:30 AM',
  'Pitch-black darkness fills the cabin interior even though morning sun has risen.',
  'Pitch-black darkness fills the cabin interior even though morning sun has risen.',
  'Every window was completely covered, creating total sensory disorientation.',
  'Boarded Windows',
  'Six exterior window frames covered with criss-crossed timber beams.',
  '["Drawn Curtains","Shuttered Blinds","Muddy Glass"]'::jsonb,
  'Boarded Windows',
  '["boarded windows","windows","shutters","covered windows"]'::jsonb,
  'Glass window frames blocked completely from the outside with wooden boards.',
  'ev_6',
  true,
  '{"descriptions":["Pitch-black darkness fills the cabin interior even though morning sun has risen.","At 06:30 AM: Pitch-black darkness fills the cabin interior even though morning sun has risen.","Notice this clue: Pitch-black darkness fills the cabin interior even though morning sun has risen."],"hints":["Glass window frames blocked completely from the outside with wooden boards.","Clue hint: Think about boarded windows.","Search for: every window was completely covered, creating total sensory disorientation."],"clues":["Boarded Windows","Item: Boarded Windows","Clue Word: Boarded Windows"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '76fbd76e-5470-5c78-9205-d2e15419407a',
  'story_052',
  'ev_6',
  6,
  '07:00 AM',
  'A 30-inch drop-forged steel wrecking crowbar is used by Sheriff Cole to pry the door.',
  'A 30-inch drop-forged steel wrecking crowbar is used by Sheriff Cole to pry the door.',
  'Required twenty minutes of heavy prying to pop the ring-shank nails free.',
  'Wrecking Crowbar',
  'Heavy steel pry bar with scarred red paint used to force the planks off.',
  '["Axe","Sledgehammer","Chisel"]'::jsonb,
  'Wrecking Crowbar',
  '["wrecking crowbar","crowbar","wrecking bar","pry bar","iron bar"]'::jsonb,
  'A heavy metal lever tool used to pry off boards and pull out stubborn nails.',
  'ev_7',
  false,
  '{"descriptions":["A 30-inch drop-forged steel wrecking crowbar is used by Sheriff Cole to pry the door.","At 07:00 AM: A 30-inch drop-forged steel wrecking crowbar is used by Sheriff Cole to pry the door.","Notice this clue: A 30-inch drop-forged steel wrecking crowbar is used by Sheriff Cole to pry the door."],"hints":["A heavy metal lever tool used to pry off boards and pull out stubborn nails.","Clue hint: Think about wrecking crowbar.","Search for: required twenty minutes of heavy prying to pop the ring-shank nails free."],"clues":["Wrecking Crowbar","Item: Wrecking Crowbar","Clue Word: Wrecking Crowbar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '97a5b025-a338-5108-8e75-99d41a4d353b',
  'story_052',
  'ev_7',
  7,
  '07:30 AM',
  'Muddy logging boot footprints with deep chevron lugs circle the entire cabin perimeter.',
  'Muddy logging boot footprints with deep chevron lugs circle the entire cabin perimeter.',
  'One individual walked deliberately from window to window boarding them up.',
  'Logging Boot Prints',
  'Heavy spiked calk-boot impressions matching Caleb Vance’s forestry footwear.',
  '["Bare Footprints","Shoe Marks","Animal Tracks"]'::jsonb,
  'Logging Boot Prints',
  '["logging boot prints","boot prints","footprints","tracks","logging prints"]'::jsonb,
  'Heavy tread marks in mud left by spiked boots worn by tree loggers.',
  'ev_8',
  false,
  '{"descriptions":["Muddy logging boot footprints with deep chevron lugs circle the entire cabin perimeter.","At 07:30 AM: Muddy logging boot footprints with deep chevron lugs circle the entire cabin perimeter.","Notice this clue: Muddy logging boot footprints with deep chevron lugs circle the entire cabin perimeter."],"hints":["Heavy tread marks in mud left by spiked boots worn by tree loggers.","Clue hint: Think about logging boot prints.","Search for: one individual walked deliberately from window to window boarding them up."],"clues":["Logging Boot Prints","Item: Logging Boot Prints","Clue Word: Logging Boot Prints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '09c9dd3e-a0b8-5516-b5fa-111a9e1706bf',
  'story_052',
  'ev_8',
  8,
  '08:00 AM',
  'A legal eviction notice naming Caleb Vance is found in David’s briefcase.',
  'A legal eviction notice naming Caleb Vance is found in David’s briefcase.',
  'Caleb knew he was about to lose his ancestral land to the development project.',
  'Eviction Notice',
  'Court document ordering Caleb Vance to vacate his forest cabin within seven days.',
  '["Tax Bill","Lease","Receipt"]'::jsonb,
  'Eviction Notice',
  '["eviction notice","notice","court document","legal paper"]'::jsonb,
  'A formal legal paper ordering someone to leave their home or land.',
  NULL,
  true,
  '{"descriptions":["A legal eviction notice naming Caleb Vance is found in David’s briefcase.","At 08:00 AM: A legal eviction notice naming Caleb Vance is found in David’s briefcase.","Notice this clue: A legal eviction notice naming Caleb Vance is found in David’s briefcase."],"hints":["A formal legal paper ordering someone to leave their home or land.","Clue hint: Think about eviction notice.","Search for: caleb knew he was about to lose his ancestral land to the development project."],"clues":["Eviction Notice","Item: Eviction Notice","Clue Word: Eviction Notice"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_053 — THE LIGHTHOUSE FOG SIGNAL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_053',
  'The Lighthouse Fog Signal',
  'Horror',
  'Gallows Point Lighthouse, jagged black sea rocks, crashing waves, and thick blinding sea fog',
  'The giant pneumatic foghorn blew its low death-moan every five minutes on an island where the keeper died three days ago.',
  '[{"name":"Silas Thorne","role":"Coastal Smuggler & Fisherman","alibi":"In his dory boat pulling crab pots near the reef","avatar":"⚓"},{"name":"Keeper Caleb Vance (Deceased)","role":"Late Lighthouse Keeper","alibi":"In the keeper’s quarters bed","avatar":"🕯️"},{"name":"Nora Reed","role":"Harbor Board Auditor","alibi":"Aboard the Coast Guard cutter approaching the island rocks","avatar":"📋"},{"name":"Chief Petty Officer Frank Miller","role":"Coast Guard Tactical Commander","alibi":"Commanding the 47-foot motor lifeboat approaching Gallows Point","avatar":"🛥️"}]'::jsonb,
  'Smuggler Silas Thorne concealed the death of the old lighthouse keeper. He rigged an automated pneumatic valve on the giant air horns to sound every five minutes, using the sound to guide his illegal liquor schooner through the razor reef in the dense fog.',
  'Smuggler Silas Thorne',
  'Silas used the foghorn as an acoustic guide to guide his contraband ship through the rocky reef.',
  '[{"time":"03:00 PM","event":"Keeper Caleb Vance passes away peacefully in his sleep from heart failure."},{"time":"06:00 PM","event":"Silas arrives at the island, discovers Caleb dead, and sees an opportunity."},{"time":"08:30 PM","event":"Silas rigs a mechanical brass cam on the compressor air valve to blow every five minutes."},{"time":"11:00 PM","event":"The deafening horn sounds across the bay through the blinding sea fog."},{"time":"04:00 AM","event":"The Coast Guard cutter arrives at the island and boards the tower."}]'::jsonb,
  '[{"id":"ev1","title":"Automated Brass Cam on Horn Valve","detail":"Mechanically depressed the foghorn lever every 300 seconds without human aid."},{"id":"ev2","title":"Marine Battery Stamped THORNE","detail":"Connected to the timing motor; registered to Silas Thorne’s commercial skiff."},{"id":"ev3","title":"Acoustic Navigation Chart","detail":"Shows the precise sound-ranging calculations Silas used to pilot his rum schooner."},{"id":"ev4","title":"Caleb’s Natural Death Log","detail":"Proves the keeper died of natural causes and did not operate the automated horn."}]'::jsonb,
  '[{"order":1,"title":"Pneumatic Foghorn","text":"Giant bronze horn sounding across the fog from an abandoned light tower."},{"order":2,"title":"Rotating Cam Wheel","text":"Motorized brass wheel rigged to trigger the horn lever automatically."},{"order":3,"title":"Compressed Air Tank","text":"Pressure reservoir kept charged by the running diesel generator."},{"order":4,"title":"Marine Battery","text":"Power source stamped with Silas Thorne’s name powering the timing device."},{"order":5,"title":"Contraband Schooner","text":"Smuggling vessel waiting offshore using the sound to navigate the reef."},{"order":6,"title":"Nautical Sound Chart","text":"Map calculating the acoustic timing of the horn blasts in the fog."}]'::jsonb,
  'Auditor Nora delayed sending the relief keeper.: Administrative incompetence, but she had no smuggling ties.; The lighthouse had old ghost tales dating back 100 years.: Local folklore that provided convenient cover for the smugglers.',
  'Claim the ghost of the deceased keeper was sounding his final watch or blame the harbor master.',
  'NORMAL',
  'What was triggering the massive foghorn and who was inside the locked granite tower?',
  '[{"character":"Silas Thorne","secret":"He has fifty crates of contraband liquor waiting on the schooner offshore."},{"character":"Keeper Caleb Vance (Deceased)","secret":"He had kept meticulous daily weather logs for forty-five years."},{"character":"Nora Reed","secret":"She forgot to dispatch the relief keeper two days ago due to coastal paperwork."},{"character":"Chief Petty Officer Frank Miller","secret":"Tracking a contraband liquor smuggling ring operating out of the shoals."}]'::jsonb,
  '[{"lead":"Auditor Nora delayed sending the relief keeper.","explanation":"Administrative incompetence, but she had no smuggling ties."},{"lead":"The lighthouse had old ghost tales dating back 100 years.","explanation":"Local folklore that provided convenient cover for the smugglers."}]'::jsonb,
  '{"wrongTheories":["The ghost of Keeper Caleb rose from his deathbed to sound the horn one last time.","A freak short circuit in the horn solenoid caused random automatic discharges."],"correctTheory":"Smuggler Silas Thorne found Keeper Caleb dead, rigged a motorized brass cam to the pneumatic foghorn lever, and used the timed blasts to guide his contraband rum schooner safely through the razor reef in the dense fog."}'::jsonb,
  'Smuggler Silas Thorne rigged the foghorn to guide his contraband rum ship!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The Coast Guard disabled the cam mechanism and intercepted the rum schooner in the fog. Silas Thorne was arrested for maritime smuggling and reckless endangerment."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The schooner cleared the reef under cover of the horn. Silas unloaded fifty crates of rum and disappeared before the Coast Guard arrived."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The maritime historical society officially declared Gallows Point \"The Ghost Light of the Shoals.\" Silas continued smuggling under the legend."}]'::jsonb,
  '{"intros":["The giant pneumatic foghorn blew its low death-moan every five minutes on an island where the keeper died three days ago.","Case file story_053: The giant pneumatic foghorn blew its low death-moan every five minutes on an island where the keeper died three days ago. Look closely at every clue.","Trouble begins in Gallows Point Lighthouse, jagged black sea rocks, crashing waves, and thick blinding sea fog. The giant pneumatic foghorn blew its low death-moan every five minutes on an island where the keeper died three days ago.","The mystery starts now. The giant pneumatic foghorn blew its low death-moan every five minutes on an island where the keeper died three days ago. Can you solve it?"],"reveals":["Smuggler Silas Thorne rigged the foghorn to guide his contraband rum ship!","The mystery is unraveled! Smuggler Silas Thorne rigged the foghorn to guide his contraband rum ship!","At last, the truth comes out: Smuggler Silas Thorne rigged the foghorn to guide his contraband rum ship!","Case resolved! Here is what happened: Smuggler Silas Thorne rigged the foghorn to guide his contraband rum ship!"],"hints":["Pay attention to where Smuggler Silas Thorne was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_053';
DELETE FROM public.case_events WHERE case_id = 'story_053';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fd065e44-d8fa-5a73-bece-4a0ab4b4bcc3',
  'story_053',
  'Silas Thorne',
  'Coastal Smuggler & Fisherman',
  'Weathered, yellow oilskins, sou’wester hat, smelling of saltwater and rum',
  'Old keeper Caleb loved that horn. His ghost is blowing it to warn ships off the reef.',
  'He has fifty crates of contraband liquor waiting on the schooner offshore.',
  'In his dory boat pulling crab pots near the reef',
  'Friend of the late keeper who had access to the island boat slip',
  'The compressed air tank has enough pressure to run the horn for twenty hours.',
  'Did not notice he left his brass timing cam screwed into the air valve.',
  '⚓',
  '["Old keeper Caleb loved that horn. His ghost is blowing it to warn ships off the reef.","\"Old keeper Caleb loved that horn. His ghost is blowing it to warn ships off the reef.\"","Listen to me: Old keeper Caleb loved that horn. His ghost is blowing it to warn ships off the reef.","I tell you the truth: Old keeper Caleb loved that horn. His ghost is blowing it to warn ships off the reef."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1b91bcec-317d-5658-b73b-e552bc5aeaf1',
  'story_053',
  'Keeper Caleb Vance (Deceased)',
  'Late Lighthouse Keeper',
  'Legendary hermit keeper, found deceased of natural causes in his cot',
  'Deceased victim; found peacefully asleep in his bed with his watch on the table.',
  'He had kept meticulous daily weather logs for forty-five years.',
  'In the keeper’s quarters bed',
  'Former keeper of Gallows Point Light',
  'The foghorn requires 100 PSI of pneumatic pressure to produce its blast.',
  'Did not know Silas would use his death as a smuggling opportunity.',
  '🕯️',
  '["Deceased victim; found peacefully asleep in his bed with his watch on the table.","\"Deceased victim; found peacefully asleep in his bed with his watch on the table.\"","Listen to me: Deceased victim; found peacefully asleep in his bed with his watch on the table.","I tell you the truth: Deceased victim; found peacefully asleep in his bed with his watch on the table."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7ad4d125-b36d-58b0-bb16-aea50f014065',
  'story_053',
  'Nora Reed',
  'Harbor Board Auditor',
  'Sharp, brisk, carrying official clipboards and a marine radio',
  'Gallows Point light was reported dark, but the foghorn is deafening across the bay.',
  'She forgot to dispatch the relief keeper two days ago due to coastal paperwork.',
  'Aboard the Coast Guard cutter approaching the island rocks',
  'Responsible for lighthouse personnel assignments',
  'The horn mechanism was supposed to be shut down during maintenance.',
  'Did not know an unauthorized schooner was navigating the reef.',
  '📋',
  '["Gallows Point light was reported dark, but the foghorn is deafening across the bay.","\"Gallows Point light was reported dark, but the foghorn is deafening across the bay.\"","Listen to me: Gallows Point light was reported dark, but the foghorn is deafening across the bay.","I tell you the truth: Gallows Point light was reported dark, but the foghorn is deafening across the bay."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '06ed8c9d-2a7e-58c8-86cc-aecdb5a010c6',
  'story_053',
  'Chief Petty Officer Frank Miller',
  'Coast Guard Tactical Commander',
  'Experienced mariner, carrying an M-16 rifle and tactical binoculars',
  'Someone with professional mechanical skill modified the air compressor valve.',
  'Tracking a contraband liquor smuggling ring operating out of the shoals.',
  'Commanding the 47-foot motor lifeboat approaching Gallows Point',
  'Leading the maritime boarding inspection',
  'Found fresh brass shavings on the pneumatic valve cam.',
  'Did not immediately locate Silas’s schooner in the dense fog bank.',
  '🛥️',
  '["Someone with professional mechanical skill modified the air compressor valve.","\"Someone with professional mechanical skill modified the air compressor valve.\"","Listen to me: Someone with professional mechanical skill modified the air compressor valve.","I tell you the truth: Someone with professional mechanical skill modified the air compressor valve."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b304834c-7ef5-5cd7-931b-e0a772cfa08b',
  'story_053',
  'ev_1',
  1,
  '11:00 PM',
  'A massive two-tone brass pneumatic foghorn sounds its deafening low drone: "HROOOOO-AAAH".',
  'A massive two-tone brass pneumatic foghorn sounds its deafening low drone: "HROOOOO-AAAH".',
  'The horn was operating automatically despite zero living personnel in the lantern room.',
  'Pneumatic Foghorn',
  'Twin cast-bronze foghorn bells mounted on the granite tower parapet.',
  '["Bell","Siren","Whistle"]'::jsonb,
  'Pneumatic Foghorn',
  '["pneumatic foghorn","foghorn","horn","pneumatic horn","fog signal"]'::jsonb,
  'A giant metal horn on a lighthouse that makes a deep loud blast during fog.',
  'ev_2',
  true,
  '{"descriptions":["A massive two-tone brass pneumatic foghorn sounds its deafening low drone: \"HROOOOO-AAAH\".","At 11:00 PM: A massive two-tone brass pneumatic foghorn sounds its deafening low drone: \"HROOOOO-AAAH\".","Notice this clue: A massive two-tone brass pneumatic foghorn sounds its deafening low drone: \"HROOOOO-AAAH\"."],"hints":["A giant metal horn on a lighthouse that makes a deep loud blast during fog.","Clue hint: Think about pneumatic foghorn.","Search for: the horn was operating automatically despite zero living personnel in the lantern room."],"clues":["Pneumatic Foghorn","Item: Pneumatic Foghorn","Clue Word: Pneumatic Foghorn"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b424b171-5899-5803-a6b2-e12d2cf0d647',
  'story_053',
  'ev_2',
  2,
  '11:05 PM',
  'A specialized brass rotating cam wheel is clamped to the pneumatic air lever.',
  'A specialized brass rotating cam wheel is clamped to the pneumatic air lever.',
  'The valve was depressed automatically every five minutes by an electric motor cam.',
  'Rotating Cam Wheel',
  'Lobed brass timing wheel geared to a 12-volt battery motor.',
  '["Pulley","Propeller","Clock Hand"]'::jsonb,
  'Rotating Cam Wheel',
  '["rotating cam wheel","cam","cam wheel","timing wheel","wheel","valve cam"]'::jsonb,
  'An egg-shaped metal wheel that pushes a lever up and down as it spins.',
  'ev_3',
  false,
  '{"descriptions":["A specialized brass rotating cam wheel is clamped to the pneumatic air lever.","At 11:05 PM: A specialized brass rotating cam wheel is clamped to the pneumatic air lever.","Notice this clue: A specialized brass rotating cam wheel is clamped to the pneumatic air lever."],"hints":["An egg-shaped metal wheel that pushes a lever up and down as it spins.","Clue hint: Think about rotating cam wheel.","Search for: the valve was depressed automatically every five minutes by an electric motor cam."],"clues":["Rotating Cam Wheel","Item: Rotating Cam Wheel","Clue Word: Rotating Cam Wheel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fdbe3a53-f68d-5473-88da-e5ca4cee395f',
  'story_053',
  'ev_3',
  3,
  '11:10 PM',
  'A compressed air reservoir tank reads 120 PSI on its round brass dial.',
  'A compressed air reservoir tank reads 120 PSI on its round brass dial.',
  'The diesel air compressor was running continuously to maintain pressure.',
  'Compressed Air Tank',
  'Riveted steel pressure vessel humming with compressed pneumatic air.',
  '["Water Boiler","Fuel Tank","Steam Engine"]'::jsonb,
  'Compressed Air Tank',
  '["compressed air tank","tank","air tank","pressure tank"]'::jsonb,
  'A heavy metal cylinder holding air squeezed under high pressure.',
  'ev_4',
  false,
  '{"descriptions":["A compressed air reservoir tank reads 120 PSI on its round brass dial.","At 11:10 PM: A compressed air reservoir tank reads 120 PSI on its round brass dial.","Notice this clue: A compressed air reservoir tank reads 120 PSI on its round brass dial."],"hints":["A heavy metal cylinder holding air squeezed under high pressure.","Clue hint: Think about compressed air tank.","Search for: the diesel air compressor was running continuously to maintain pressure."],"clues":["Compressed Air Tank","Item: Compressed Air Tank","Clue Word: Compressed Air Tank"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7a889922-bf95-5d3b-9d5d-a4f34585b12d',
  'story_053',
  'ev_4',
  4,
  '11:25 PM',
  'A 12-volt lead-acid marine battery powers the timing motor on the compressor.',
  'A 12-volt lead-acid marine battery powers the timing motor on the compressor.',
  'The battery was taken from Silas’s own motorized fishing dory.',
  'Marine Battery',
  'Heavy black battery stamped "THORNE MARINE - T-12".',
  '["Car Battery","Flashlight Battery","Generator"]'::jsonb,
  'Marine Battery',
  '["marine battery","battery","boat battery"]'::jsonb,
  'A heavy rechargeable plastic battery used to start boat engines.',
  'ev_5',
  false,
  '{"descriptions":["A 12-volt lead-acid marine battery powers the timing motor on the compressor.","At 11:25 PM: A 12-volt lead-acid marine battery powers the timing motor on the compressor.","Notice this clue: A 12-volt lead-acid marine battery powers the timing motor on the compressor."],"hints":["A heavy rechargeable plastic battery used to start boat engines.","Clue hint: Think about marine battery.","Search for: the battery was taken from silas’s own motorized fishing dory."],"clues":["Marine Battery","Item: Marine Battery","Clue Word: Marine Battery"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b99425d4-639f-5c37-8517-db8394101c88',
  'story_053',
  'ev_5',
  5,
  '12:00 AM',
  'The official lighthouse logbook ends with Caleb’s shaky handwriting at 2:00 PM.',
  'The official lighthouse logbook ends with Caleb’s shaky handwriting at 2:00 PM.',
  'Confirms the keeper died of natural causes before the horn began sounding.',
  'Lighthouse Logbook',
  'Leather-bound journal recording weather, barometer readings, and final sign-off.',
  '["Bible","Receipt Book","Newspaper"]'::jsonb,
  'Lighthouse Logbook',
  '["lighthouse logbook","logbook","log","lighthouse log","journal"]'::jsonb,
  'A large bound book where ship captains and lighthouse keepers write daily records.',
  'ev_6',
  true,
  '{"descriptions":["The official lighthouse logbook ends with Caleb’s shaky handwriting at 2:00 PM.","At 12:00 AM: The official lighthouse logbook ends with Caleb’s shaky handwriting at 2:00 PM.","Notice this clue: The official lighthouse logbook ends with Caleb’s shaky handwriting at 2:00 PM."],"hints":["A large bound book where ship captains and lighthouse keepers write daily records.","Clue hint: Think about lighthouse logbook.","Search for: confirms the keeper died of natural causes before the horn began sounding."],"clues":["Lighthouse Logbook","Item: Lighthouse Logbook","Clue Word: Lighthouse Logbook"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f49fdfdd-6cc3-5da5-80dd-6eea5c727c13',
  'story_053',
  'ev_6',
  6,
  '01:30 AM',
  'A two-masted wooden schooner loaded with fifty crates of rum idles in the fog offshore.',
  'A two-masted wooden schooner loaded with fifty crates of rum idles in the fog offshore.',
  'The ship was using the timed acoustic blasts to steer between razor rocks.',
  'Contraband Schooner',
  'Black-hulled sailing vessel anchored two hundred yards outside the reef.',
  '["Fishing Trawler","Speedboat","Cargo Freighter"]'::jsonb,
  'Contraband Schooner',
  '["contraband schooner","schooner","ship","boat","contraband ship"]'::jsonb,
  'A wooden sailing ship with two tall masts used for carrying cargo at sea.',
  'ev_7',
  false,
  '{"descriptions":["A two-masted wooden schooner loaded with fifty crates of rum idles in the fog offshore.","At 01:30 AM: A two-masted wooden schooner loaded with fifty crates of rum idles in the fog offshore.","Notice this clue: A two-masted wooden schooner loaded with fifty crates of rum idles in the fog offshore."],"hints":["A wooden sailing ship with two tall masts used for carrying cargo at sea.","Clue hint: Think about contraband schooner.","Search for: the ship was using the timed acoustic blasts to steer between razor rocks."],"clues":["Contraband Schooner","Item: Contraband Schooner","Clue Word: Contraband Schooner"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4cf250e4-e1f1-54d5-a129-9d3b1556a86f',
  'story_053',
  'ev_7',
  7,
  '02:00 AM',
  'A coastal marine chart with compass lines drawn between Gallows Point and the reef is seized.',
  'A coastal marine chart with compass lines drawn between Gallows Point and the reef is seized.',
  'Silas calculated the sound travel time to navigate blind in the thick mist.',
  'Nautical Sound Chart',
  'Paper navigation map showing acoustic radar rings around the lighthouse.',
  '["Road Map","Tourist Guide","Weather Map"]'::jsonb,
  'Nautical Sound Chart',
  '["nautical sound chart","chart","nautical chart","sound chart","map"]'::jsonb,
  'A sailor’s map of the sea showing water depth, rocks, and acoustic signals.',
  'ev_8',
  false,
  '{"descriptions":["A coastal marine chart with compass lines drawn between Gallows Point and the reef is seized.","At 02:00 AM: A coastal marine chart with compass lines drawn between Gallows Point and the reef is seized.","Notice this clue: A coastal marine chart with compass lines drawn between Gallows Point and the reef is seized."],"hints":["A sailor’s map of the sea showing water depth, rocks, and acoustic signals.","Clue hint: Think about nautical sound chart.","Search for: silas calculated the sound travel time to navigate blind in the thick mist."],"clues":["Nautical Sound Chart","Item: Nautical Sound Chart","Clue Word: Nautical Sound Chart"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7fbabdfe-686e-53b5-883d-a670dd37100e',
  'story_053',
  'ev_8',
  8,
  '04:15 AM',
  'A wrench used to mount the timing cam is found with yellow paint from Silas’s boat.',
  'A wrench used to mount the timing cam is found with yellow paint from Silas’s boat.',
  'Silas assembled the automated trigger using tools from his fishing kit.',
  'Adjustable Wrench',
  'Steel Crescent wrench with yellow marine enamel paint on the handle.',
  '["Hammer","Pliers","Screwdriver"]'::jsonb,
  'Adjustable Wrench',
  '["adjustable wrench","wrench","tool","crescent wrench"]'::jsonb,
  'A metal hand tool with movable jaws used to tighten nuts and bolts of different sizes.',
  NULL,
  true,
  '{"descriptions":["A wrench used to mount the timing cam is found with yellow paint from Silas’s boat.","At 04:15 AM: A wrench used to mount the timing cam is found with yellow paint from Silas’s boat.","Notice this clue: A wrench used to mount the timing cam is found with yellow paint from Silas’s boat."],"hints":["A metal hand tool with movable jaws used to tighten nuts and bolts of different sizes.","Clue hint: Think about adjustable wrench.","Search for: silas assembled the automated trigger using tools from his fishing kit."],"clues":["Adjustable Wrench","Item: Adjustable Wrench","Clue Word: Adjustable Wrench"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_054 — THE BLOODSTAINED ORGAN
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_054',
  'The Bloodstained Organ',
  'Horror',
  'St. Jude’s Gothic Cathedral, vaulted stone ceilings, towering stained glass, and cold marble tombs',
  'The massive pipe organ played five low dissonant notes at 3:00 AM every Tuesday, with fresh blood dripping from the bass pedals.',
  '[{"name":"Father Julian Vance","role":"Parish Organist & Priest","alibi":"In the rectory study praying his nightly breviary","avatar":"⛪"},{"name":"Thomas Drake (Deceased)","role":"Extortionist & Victim","alibi":"Inside the 32-foot Sub-Bass pipe above the altar","avatar":"💀"},{"name":"Clara Moreau","role":"Choir Director","alibi":"In the parish hall arranging Sunday choral scores","avatar":"🎼"},{"name":"Detective Frank Rossi","role":"Forensic Homicide Specialist","alibi":"Arrived at the cathedral at 4:00 AM after Clara reported the dripping stains","avatar":"🔍"}]'::jsonb,
  'Church organist Father Julian Vance murdered his blackmailer and stuffed the body inside the colossal 32-foot Sub-Bass organ pipe. He rigged an antique player-organ paper roll to sound five low notes at 3:00 AM, using the vibrations to loosen the pipe seams, causing body fluids to drip onto the pedalboard.',
  'Organist Father Julian Vance',
  'Julian murdered his blackmailer and hid the body inside the largest 32-foot wooden organ pipe.',
  '[{"time":"03 Weeks Ago","event":"Julian strikes blackmailer Thomas with a bronze crucifix and conceals his body in Pipe 1."},{"time":"02:50 AM","event":"A mechanical pneumatic paper music roll begins spinning on a hidden electric clock timer."},{"time":"03:00 AM","event":"The organ blower engages; five thunderous bass notes shake the stone floor."},{"time":"03:05 AM","event":"Deep acoustic vibrations force fluid to leak through the lower pipe seam onto the pedals."},{"time":"04:00 AM","event":"Detective Rossi sprays luminol on the pedalboard and lights up bright blue."}]'::jsonb,
  '[{"id":"ev1","title":"Body Inside 32-Foot Organ Pipe","detail":"Decomposing remains of blackmailer Thomas Drake discovered inside the Sub-Bass pipe."},{"id":"ev2","title":"Bronze Crucifix with Blood Traces","detail":"Matches the blunt skull trauma on the victim; hidden in Father Julian’s drawer."},{"id":"ev3","title":"Automated Pneumatic Paper Roll","detail":"Punched with the five specific bass notes to vibrate the pipe and release the fluids."},{"id":"ev4","title":"Victim’s Watch in Windchest","detail":"Engraved T.D., proving Thomas Drake was deposited inside the organ structure."}]'::jsonb,
  '[{"order":1,"title":"Five Bass Notes","text":"Subterranean 16-Hz vibrations played automatically every Tuesday at 3:00 AM."},{"order":2,"title":"Dripping Blood","text":"Human biological fluid leaking from the wooden pipe seams onto the pedals."},{"order":3,"title":"32-Foot Organ Pipe","text":"Massive acoustic tube concealing the victim’s body above the altar."},{"order":4,"title":"Perforated Paper Roll","text":"Punched musical roll used to automate the organ without a human player."},{"order":5,"title":"Bronze Crucifix","text":"Heavy church cross used as the blunt weapon to strike the blackmailer."},{"order":6,"title":"Victim Pocket Watch","text":"Silver timepiece dropped into the organ bellows during the body disposal."}]'::jsonb,
  'Choir director Clara had red ink on her fingers.: She was marking choral notes in red calligraphy ink.; The cathedral crypt had ancient bone vaults.: Centuries-old historic burials completely unrelated to the fresh murder.',
  'Claim an ancient demonic specter was playing a death requiem or blame the parish caretaker.',
  'NORMAL',
  'What was triggering the pipe organ to play in an empty locked church, and where did the blood come from?',
  '[{"character":"Father Julian Vance","secret":"He murdered his extortionist brother-in-law three weeks ago."},{"character":"Thomas Drake (Deceased)","secret":"He was blackmailing Julian over a secret child born twenty years ago."},{"character":"Clara Moreau","secret":"She suspected the organ sounded muffled and off-pitch in the lowest octave."},{"character":"Detective Frank Rossi","secret":"Raised in a strict Catholic seminary before joining the police force."}]'::jsonb,
  '[{"lead":"Choir director Clara had red ink on her fingers.","explanation":"She was marking choral notes in red calligraphy ink."},{"lead":"The cathedral crypt had ancient bone vaults.","explanation":"Centuries-old historic burials completely unrelated to the fresh murder."}]'::jsonb,
  '{"wrongTheories":["A medieval demon possessed the church pipe organ to sound the \"Devil’s Chord.\"","The blood was an intentional miraculous religious stigmata manifesting on the wood."],"correctTheory":"Father Julian Vance murdered his blackmailer Thomas Drake with a bronze crucifix and hid his body inside the 32-foot Sub-Bass organ pipe, using an automated paper roll to sound low notes so the vibrations would loosen the seams and cause fluids to drip onto the pedalboard."}'::jsonb,
  'Father Julian Vance murdered his blackmailer and hid the body in the organ pipe!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Rossi and firefighters lowered the 32-foot pipe and recovered Thomas’s body. Father Julian confessed to the murder and was stripped of his holy orders and imprisoned."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The diocese declared the cathedral demonically infested and sealed the building. Father Julian was transferred to a monastery with his secret safe."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Phantom Organ of St. Jude\" became an international supernatural sensation, with thousands visiting to hear the phantom Tuesday chord."}]'::jsonb,
  '{"intros":["The massive pipe organ played five low dissonant notes at 3:00 AM every Tuesday, with fresh blood dripping from the bass pedals.","Case file story_054: The massive pipe organ played five low dissonant notes at 3:00 AM every Tuesday, with fresh blood dripping from the bass pedals. Look closely at every clue.","Trouble begins in St. Jude’s Gothic Cathedral, vaulted stone ceilings, towering stained glass, and cold marble tombs. The massive pipe organ played five low dissonant notes at 3:00 AM every Tuesday, with fresh blood dripping from the bass pedals.","The mystery starts now. The massive pipe organ played five low dissonant notes at 3:00 AM every Tuesday, with fresh blood dripping from the bass pedals. Can you solve it?"],"reveals":["Father Julian Vance murdered his blackmailer and hid the body in the organ pipe!","The mystery is unraveled! Father Julian Vance murdered his blackmailer and hid the body in the organ pipe!","At last, the truth comes out: Father Julian Vance murdered his blackmailer and hid the body in the organ pipe!","Case resolved! Here is what happened: Father Julian Vance murdered his blackmailer and hid the body in the organ pipe!"],"hints":["Pay attention to where Organist Father Julian Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_054';
DELETE FROM public.case_events WHERE case_id = 'story_054';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e779d571-095a-596b-ba75-69d22952889f',
  'story_054',
  'Father Julian Vance',
  'Parish Organist & Priest',
  'Pale, ascetic, wearing black cassock, trembling fingers, smelling of church incense and iron',
  'The organ is haunted by a tortured soul. The church must be consecrated and closed to the public.',
  'He murdered his extortionist brother-in-law three weeks ago.',
  'In the rectory study praying his nightly breviary',
  'Sole master performer who operates the four-manual pipe organ',
  'The lowest C-pedal note vibrates the 32-foot wooden pipe at 16 Hertz.',
  'Did not know the choir director had placed an automatic humidity recorder in the organ loft.',
  '⛪',
  '["The organ is haunted by a tortured soul. The church must be consecrated and closed to the public.","\"The organ is haunted by a tortured soul. The church must be consecrated and closed to the public.\"","Listen to me: The organ is haunted by a tortured soul. The church must be consecrated and closed to the public.","I tell you the truth: The organ is haunted by a tortured soul. The church must be consecrated and closed to the public."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5b1be233-db89-5523-9656-12d9ecbec9d2',
  'story_054',
  'Thomas Drake (Deceased)',
  'Extortionist & Victim',
  'Corrupt, ruthless underworld collector, missing for three weeks',
  'Deceased victim; body stuffed headfirst inside the colossal wooden pipe.',
  'He was blackmailing Julian over a secret child born twenty years ago.',
  'Inside the 32-foot Sub-Bass pipe above the altar',
  'Julian’s blackmailer',
  'His silver watch was caught in the brass windchest valve.',
  'Did not expect the priest to strike him with a heavy bronze crucifix.',
  '💀',
  '["Deceased victim; body stuffed headfirst inside the colossal wooden pipe.","\"Deceased victim; body stuffed headfirst inside the colossal wooden pipe.\"","Listen to me: Deceased victim; body stuffed headfirst inside the colossal wooden pipe.","I tell you the truth: Deceased victim; body stuffed headfirst inside the colossal wooden pipe."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '47d6fb9f-7dfd-57cd-bcc1-5c1b9b1d7519',
  'story_054',
  'Clara Moreau',
  'Choir Director',
  'Observant, devout, sharp musical ear, holding sheet music',
  'The five notes are always C, D-sharp, F, F-sharp, and G. It is the medieval "Devil’s Chord".',
  'She suspected the organ sounded muffled and off-pitch in the lowest octave.',
  'In the parish hall arranging Sunday choral scores',
  'Directs the choir seated below the organ pipes',
  'The organ loft has a mechanical pneumatic player attachment.',
  'Did not know a human body was decomposing inside the bass rank.',
  '🎼',
  '["The five notes are always C, D-sharp, F, F-sharp, and G. It is the medieval \"Devil’s Chord\".","\"The five notes are always C, D-sharp, F, F-sharp, and G. It is the medieval \"Devil’s Chord\".\"","Listen to me: The five notes are always C, D-sharp, F, F-sharp, and G. It is the medieval \"Devil’s Chord\".","I tell you the truth: The five notes are always C, D-sharp, F, F-sharp, and G. It is the medieval \"Devil’s Chord\"."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1280c875-70ab-528d-a15e-2f2306969a2d',
  'story_054',
  'Detective Frank Rossi',
  'Forensic Homicide Specialist',
  'Skeptical, thorough, testing dark stains with luminol reagent',
  'Demons don’t bleed Type A positive blood. There is a decomposing body in these pipes.',
  'Raised in a strict Catholic seminary before joining the police force.',
  'Arrived at the cathedral at 4:00 AM after Clara reported the dripping stains',
  'Leading the forensic search of the cathedral',
  'Found blood pooling directly beneath the 32-foot Contra-Bourdon pipe.',
  'Did not immediately have scaffolding to inspect the top of the pipes.',
  '🔍',
  '["Demons don’t bleed Type A positive blood. There is a decomposing body in these pipes.","\"Demons don’t bleed Type A positive blood. There is a decomposing body in these pipes.\"","Listen to me: Demons don’t bleed Type A positive blood. There is a decomposing body in these pipes.","I tell you the truth: Demons don’t bleed Type A positive blood. There is a decomposing body in these pipes."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2a943115-fe2b-5cee-a426-b7d6b9651af7',
  'story_054',
  'ev_1',
  1,
  '03:00 AM',
  'Five subterranean 16-Hz notes rumble through the stone cathedral floor, shaking the stained glass.',
  'Five subterranean 16-Hz notes rumble through the stone cathedral floor, shaking the stained glass.',
  'The organ was sounding the specific notes that resonate with the 32-foot Sub-Bass pipe.',
  'Five Bass Notes',
  'Acoustic audio recording of low-frequency sound resonating at 16 Hertz.',
  '["Chime Chords","Trumpet Fanfare","Choir Chant"]'::jsonb,
  'Five Bass Notes',
  '["five bass notes","notes","bass notes","five notes","chord","sound"]'::jsonb,
  'Deep, rumbling musical sounds played on the lowest pedals of a church organ.',
  'ev_2',
  true,
  '{"descriptions":["Five subterranean 16-Hz notes rumble through the stone cathedral floor, shaking the stained glass.","At 03:00 AM: Five subterranean 16-Hz notes rumble through the stone cathedral floor, shaking the stained glass.","Notice this clue: Five subterranean 16-Hz notes rumble through the stone cathedral floor, shaking the stained glass."],"hints":["Deep, rumbling musical sounds played on the lowest pedals of a church organ.","Clue hint: Think about five bass notes.","Search for: the organ was sounding the specific notes that resonate with the 32-foot sub-bass pipe."],"clues":["Five Bass Notes","Item: Five Bass Notes","Clue Word: Five Bass Notes"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a33da5c7-9c29-55dc-8d7a-4348438bb92c',
  'story_054',
  'ev_2',
  2,
  '03:05 AM',
  'Dark crimson fluid drips from the seam of the wooden pipe onto the oak bass pedalboard.',
  'Dark crimson fluid drips from the seam of the wooden pipe onto the oak bass pedalboard.',
  'Forensic luminol confirms human blood and decomposition fluids.',
  'Dripping Blood',
  'Type A human blood pooled across the wooden foot pedals of the console.',
  '["Red Wine","Lamp Oil","Varnish"]'::jsonb,
  'Dripping Blood',
  '["dripping blood","blood","bloodstain","fluid"]'::jsonb,
  'Dark red fluid that leaks from a living or deceased human body.',
  'ev_3',
  false,
  '{"descriptions":["Dark crimson fluid drips from the seam of the wooden pipe onto the oak bass pedalboard.","At 03:05 AM: Dark crimson fluid drips from the seam of the wooden pipe onto the oak bass pedalboard.","Notice this clue: Dark crimson fluid drips from the seam of the wooden pipe onto the oak bass pedalboard."],"hints":["Dark red fluid that leaks from a living or deceased human body.","Clue hint: Think about dripping blood.","Search for: forensic luminol confirms human blood and decomposition fluids."],"clues":["Dripping Blood","Item: Dripping Blood","Clue Word: Dripping Blood"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1d1c6ad4-0978-5cc4-9be9-ce7ab36b81c9',
  'story_054',
  'ev_3',
  3,
  '03:10 AM',
  'A 32-foot square wooden pipe made of Douglas fir vibrates heavily above the choir loft.',
  'A 32-foot square wooden pipe made of Douglas fir vibrates heavily above the choir loft.',
  'The largest pipe in the cathedral held the concealed body of Thomas Drake.',
  '32-Foot Organ Pipe',
  'Massive wooden acoustic sound tube with loosened lower joinery seams.',
  '["Metal Trumpet","Belfry Bell","Stone Column"]'::jsonb,
  '32-Foot Organ Pipe',
  '["32-foot organ pipe","pipe","organ pipe","wooden pipe","bass pipe"]'::jsonb,
  'An enormous tall wooden tube inside a church organ that produces the lowest bass sounds.',
  'ev_4',
  false,
  '{"descriptions":["A 32-foot square wooden pipe made of Douglas fir vibrates heavily above the choir loft.","At 03:10 AM: A 32-foot square wooden pipe made of Douglas fir vibrates heavily above the choir loft.","Notice this clue: A 32-foot square wooden pipe made of Douglas fir vibrates heavily above the choir loft."],"hints":["An enormous tall wooden tube inside a church organ that produces the lowest bass sounds.","Clue hint: Think about 32-foot organ pipe.","Search for: the largest pipe in the cathedral held the concealed body of thomas drake."],"clues":["32-Foot Organ Pipe","Item: 32-Foot Organ Pipe","Clue Word: 32-Foot Organ Pipe"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '255c7563-84b9-57d0-ac86-561f4531dd90',
  'story_054',
  'ev_4',
  4,
  '03:15 AM',
  'A perforated paper music roll spins on a vintage pneumatic player-organ mechanism.',
  'A perforated paper music roll spins on a vintage pneumatic player-organ mechanism.',
  'The organ was played automatically by a mechanical paper roll on a timer.',
  'Perforated Paper Roll',
  'Antique paper roll with punched holes triggering the five specific bass notes.',
  '["Sheet Music","Cassette Tape","Computer Disc"]'::jsonb,
  'Perforated Paper Roll',
  '["perforated paper roll","paper roll","music roll","roll","perforated roll"]'::jsonb,
  'A long strip of paper with punched holes used to play automated pianos and organs.',
  'ev_5',
  false,
  '{"descriptions":["A perforated paper music roll spins on a vintage pneumatic player-organ mechanism.","At 03:15 AM: A perforated paper music roll spins on a vintage pneumatic player-organ mechanism.","Notice this clue: A perforated paper music roll spins on a vintage pneumatic player-organ mechanism."],"hints":["A long strip of paper with punched holes used to play automated pianos and organs.","Clue hint: Think about perforated paper roll.","Search for: the organ was played automatically by a mechanical paper roll on a timer."],"clues":["Perforated Paper Roll","Item: Perforated Paper Roll","Clue Word: Perforated Paper Roll"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2e9af9ea-5735-5c81-bcf2-85d48dad77c5',
  'story_054',
  'ev_5',
  5,
  '03:20 AM',
  'A heavy solid bronze altar crucifix with a dented base is in the vestry drawer.',
  'A heavy solid bronze altar crucifix with a dented base is in the vestry drawer.',
  'The blunt weapon used to murder the extortionist three weeks ago.',
  'Bronze Crucifix',
  'Solid cast-bronze religious cross with cleaned microscopic blood in the engraving.',
  '["Candlestick","Iron Poker","Censer"]'::jsonb,
  'Bronze Crucifix',
  '["bronze crucifix","crucifix","cross","bronze cross"]'::jsonb,
  'A heavy metal religious cross displaying the figure of Christ.',
  'ev_6',
  true,
  '{"descriptions":["A heavy solid bronze altar crucifix with a dented base is in the vestry drawer.","At 03:20 AM: A heavy solid bronze altar crucifix with a dented base is in the vestry drawer.","Notice this clue: A heavy solid bronze altar crucifix with a dented base is in the vestry drawer."],"hints":["A heavy metal religious cross displaying the figure of Christ.","Clue hint: Think about bronze crucifix.","Search for: the blunt weapon used to murder the extortionist three weeks ago."],"clues":["Bronze Crucifix","Item: Bronze Crucifix","Clue Word: Bronze Crucifix"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '253011c1-cc6a-5787-b0ef-3892a203b8df',
  'story_054',
  'ev_6',
  6,
  '03:45 AM',
  'A silver pocket watch belonging to Thomas Drake is found jammed in the windchest bellows.',
  'A silver pocket watch belonging to Thomas Drake is found jammed in the windchest bellows.',
  'The victim dropped his watch down the pipe as his body was stuffed inside.',
  'Victim Pocket Watch',
  'Engraved silver timepiece with initials T.D. stopped at 11:42.',
  '["Rosary","Ring","Key"]'::jsonb,
  'Victim Pocket Watch',
  '["victim pocket watch","pocket watch","watch","silver watch"]'::jsonb,
  'A small round clock carried in a vest pocket attached to a chain.',
  'ev_7',
  false,
  '{"descriptions":["A silver pocket watch belonging to Thomas Drake is found jammed in the windchest bellows.","At 03:45 AM: A silver pocket watch belonging to Thomas Drake is found jammed in the windchest bellows.","Notice this clue: A silver pocket watch belonging to Thomas Drake is found jammed in the windchest bellows."],"hints":["A small round clock carried in a vest pocket attached to a chain.","Clue hint: Think about victim pocket watch.","Search for: the victim dropped his watch down the pipe as his body was stuffed inside."],"clues":["Victim Pocket Watch","Item: Victim Pocket Watch","Clue Word: Victim Pocket Watch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b5d0607e-9fc5-58f9-85d7-5de33ecaa5b8',
  'story_054',
  'ev_7',
  7,
  '04:15 AM',
  'An extortion letter demanding twenty thousand dollars is tucked in Father Julian’s Bible.',
  'An extortion letter demanding twenty thousand dollars is tucked in Father Julian’s Bible.',
  'Thomas was blackmailing the priest over a confidential family secret.',
  'Blackmail Letter',
  'Threatening handwritten note signed by Thomas Drake demanding money.',
  '["Prayer Book","Receipt","Choir Schedule"]'::jsonb,
  'Blackmail Letter',
  '["blackmail letter","letter","note","threat letter"]'::jsonb,
  'A written paper message demanding money in exchange for not revealing a scandal.',
  'ev_8',
  false,
  '{"descriptions":["An extortion letter demanding twenty thousand dollars is tucked in Father Julian’s Bible.","At 04:15 AM: An extortion letter demanding twenty thousand dollars is tucked in Father Julian’s Bible.","Notice this clue: An extortion letter demanding twenty thousand dollars is tucked in Father Julian’s Bible."],"hints":["A written paper message demanding money in exchange for not revealing a scandal.","Clue hint: Think about blackmail letter.","Search for: thomas was blackmailing the priest over a confidential family secret."],"clues":["Blackmail Letter","Item: Blackmail Letter","Clue Word: Blackmail Letter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2b04c77c-34df-53a9-8736-c84887bc0c52',
  'story_054',
  'ev_8',
  8,
  '05:00 AM',
  'Luminol spray applied to the organ pedalboard illuminates in a brilliant neon-blue glow.',
  'Luminol spray applied to the organ pedalboard illuminates in a brilliant neon-blue glow.',
  'Proves extensive repeated blood contamination across the entire console.',
  'Luminol Reaction',
  'Chemiluminescent blue light showing footprints and drip trails on the pedals.',
  '["UV Fluorescence","Flashlight Beam","Paint Glow"]'::jsonb,
  'Luminol Reaction',
  '["luminol reaction","luminol","luminol glow","blue glow","reaction"]'::jsonb,
  'A chemical spray used by forensic scientists that glows bright blue when it touches blood.',
  NULL,
  true,
  '{"descriptions":["Luminol spray applied to the organ pedalboard illuminates in a brilliant neon-blue glow.","At 05:00 AM: Luminol spray applied to the organ pedalboard illuminates in a brilliant neon-blue glow.","Notice this clue: Luminol spray applied to the organ pedalboard illuminates in a brilliant neon-blue glow."],"hints":["A chemical spray used by forensic scientists that glows bright blue when it touches blood.","Clue hint: Think about luminol reaction.","Search for: proves extensive repeated blood contamination across the entire console."],"clues":["Luminol Reaction","Item: Luminol Reaction","Clue Word: Luminol Reaction"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_055 — THE OLD MEAT LOCKER
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_055',
  'The Old Meat Locker',
  'Horror',
  'The Abandoned Blackwood Abattoir, rusted meat hooks on overhead rails, freezing frost on stainless steel walls',
  'A meat locker was chained shut from the outside with frosted padlocks; frostbitten handprints smeared the interior window.',
  '[{"name":"Owen Vance","role":"Master Butcher & Co-Owner","alibi":"In the cutting room slicing pork loins all afternoon","avatar":"🥩"},{"name":"Frank Miller (Deceased)","role":"Business Partner & Accountant","alibi":"Trapped inside Meat Locker 3","avatar":"🧊"},{"name":"Toby Ross","role":"Apprentice Meat Packer","alibi":"In the loading bay packing sausage crates","avatar":"🔪"},{"name":"Detective Marcus Cole","role":"Homicide Investigator","alibi":"Arrived at the meat packing plant following an anonymous tip","avatar":"🔍"}]'::jsonb,
  'Butcher Owen Vance confronted his partner Frank over fifty thousand dollars stolen from the employee pension. Owen knocked Frank into the walk-in freezer, slammed the heavy insulated door, and locked it with heavy logging chains and padlocks, leaving Frank to freeze to death.',
  'Butcher Owen Vance',
  'Owen caught business partner Frank stealing thousands from the meat-packing pension fund.',
  '[{"time":"05:30 PM","event":"Owen confronts Frank in the meat locker over the missing pension funds."},{"time":"05:45 PM","event":"Owen shoves Frank onto the ice floor and slams the heavy insulated door."},{"time":"05:48 PM","event":"Owen wraps thirty pounds of logging chains around the exterior latch and snaps two locks."},{"time":"06:00 PM","event":"Frank pounds on the door in minus 20°C temperatures, but the noise is dismissed as pipes."},{"time":"08:00 AM","event":"Detective Cole arrives with bolt cutters and discovers Frank frozen behind the door."}]'::jsonb,
  '[{"id":"ev1","title":"Removed Safety Release Rod in Owen’s Toolbox","detail":"Proves premeditated sabotage to prevent the victim from opening the door from inside."},{"id":"ev2","title":"Victim’s Dying Frost Inscription \"OWEN\"","detail":"Frank Miller carved his partner’s name into the door frost with his gold signet ring."},{"id":"ev3","title":"Frosted Logging Chains on Door Latch","detail":"Thirty pounds of heavy logging chain locked with padlocks matched to Owen’s barn keys."},{"id":"ev4","title":"Thermostat Set to Maximum Cold","detail":"Shows the temperature was intentionally driven down to accelerate hypothermia."}]'::jsonb,
  '[{"order":1,"title":"Logging Chains","text":"Heavy steel chain links wrapped around the freezer door lever to lock it."},{"order":2,"title":"Missing Safety Knob","text":"Sabotaged emergency release hole that prevented escape from within."},{"order":3,"title":"Frosted Handprints","text":"Ice-smeared palm marks on the glass pane from the freezing victim."},{"order":4,"title":"Scratched Name","text":"Dying message carved into the frost naming Owen as the killer."},{"order":5,"title":"Freezer Thermostat","text":"Dial forced to minus 22 degrees Celsius to cause rapid hypothermia."},{"order":6,"title":"Removed Safety Rod","text":"The missing green glow-rod discovered hidden inside Owen’s tool chest."}]'::jsonb,
  'Apprentice Toby had a bloody apron.: Normal animal blood from morning butchering duties.; The plant cooling pipes clattered with ice buildup.: A common acoustic issue in ammonia refrigeration systems.',
  'Claim the heavy latch fell shut accidentally or blame the delivery truck driver.',
  'NORMAL',
  'Who was locked inside the sub-zero meat locker and who placed the heavy chains on the latch?',
  '[{"character":"Owen Vance","secret":"He locked Frank in the sub-zero freezer and dumped the keys in the meat grinder."},{"character":"Frank Miller (Deceased)","secret":"He had embezzled fifty thousand dollars from the pension fund."},{"character":"Toby Ross","secret":"He saw Owen carrying heavy rusty chains from the maintenance barn."},{"character":"Detective Marcus Cole","secret":"Investigated Owen for assault six years prior."}]'::jsonb,
  '[{"lead":"Apprentice Toby had a bloody apron.","explanation":"Normal animal blood from morning butchering duties."},{"lead":"The plant cooling pipes clattered with ice buildup.","explanation":"A common acoustic issue in ammonia refrigeration systems."}]'::jsonb,
  '{"wrongTheories":["The walk-in freezer door latch jammed shut accidentally due to frost expansion.","Frank locked himself inside to hide from loan shark enforcers and froze."],"correctTheory":"Butcher Owen Vance removed the internal emergency safety rod, pushed Frank into the walk-in freezer, dialed the temperature to minus 22°C, and locked the exterior latch with thirty pounds of logging chains to kill his partner over stolen pension funds."}'::jsonb,
  'Butcher Owen Vance removed the safety rod and chained the freezer shut!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Cole found the safety rod in Owen’s toolbox and read Frank’s dying inscription in the frost. Owen was arrested for first-degree murder."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The coroner ruled the death a workplace industrial accident. Owen claimed full ownership of the meat company and kept the pension money."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Urban legends claimed the meat locker was cursed by a phantom butcher. Owen turned the abandoned plant into a haunted attraction."}]'::jsonb,
  '{"intros":["A meat locker was chained shut from the outside with frosted padlocks; frostbitten handprints smeared the interior window.","Case file story_055: A meat locker was chained shut from the outside with frosted padlocks; frostbitten handprints smeared the interior window. Look closely at every clue.","Trouble begins in The Abandoned Blackwood Abattoir, rusted meat hooks on overhead rails, freezing frost on stainless steel walls. A meat locker was chained shut from the outside with frosted padlocks; frostbitten handprints smeared the interior window.","The mystery starts now. A meat locker was chained shut from the outside with frosted padlocks; frostbitten handprints smeared the interior window. Can you solve it?"],"reveals":["Butcher Owen Vance removed the safety rod and chained the freezer shut!","The mystery is unraveled! Butcher Owen Vance removed the safety rod and chained the freezer shut!","At last, the truth comes out: Butcher Owen Vance removed the safety rod and chained the freezer shut!","Case resolved! Here is what happened: Butcher Owen Vance removed the safety rod and chained the freezer shut!"],"hints":["Pay attention to where Butcher Owen Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_055';
DELETE FROM public.case_events WHERE case_id = 'story_055';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'dcd25769-dd9e-5e8c-b421-83776e958972',
  'story_055',
  'Owen Vance',
  'Master Butcher & Co-Owner',
  'Massive, scarred hands, wearing a heavy bloodstained leather apron and wool cap',
  'Frank took the cash box and fled to Canada yesterday morning. I haven’t seen him.',
  'He locked Frank in the sub-zero freezer and dumped the keys in the meat grinder.',
  'In the cutting room slicing pork loins all afternoon',
  'Co-owner of the Blackwood Meat Packing Company',
  'The freezer drops to minus 20 degrees Celsius within three hours.',
  'Did not know Frank had scratched Owen’s name into the frosted door glass.',
  '🥩',
  '["Frank took the cash box and fled to Canada yesterday morning. I haven’t seen him.","\"Frank took the cash box and fled to Canada yesterday morning. I haven’t seen him.\"","Listen to me: Frank took the cash box and fled to Canada yesterday morning. I haven’t seen him.","I tell you the truth: Frank took the cash box and fled to Canada yesterday morning. I haven’t seen him."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8cc49711-3330-58ef-84c6-ad6dbfecd626',
  'story_055',
  'Frank Miller (Deceased)',
  'Business Partner & Accountant',
  'Thin, nervous, wearing a woolen suit now covered in ice crystals',
  'Deceased victim; body discovered frozen solid against the interior insulated door.',
  'He had embezzled fifty thousand dollars from the pension fund.',
  'Trapped inside Meat Locker 3',
  'Victim of the freezing murder',
  'The interior emergency release knob had been unscrewed and removed.',
  'Did not expect Owen to use logging chains on the heavy exterior latch.',
  '🧊',
  '["Deceased victim; body discovered frozen solid against the interior insulated door.","\"Deceased victim; body discovered frozen solid against the interior insulated door.\"","Listen to me: Deceased victim; body discovered frozen solid against the interior insulated door.","I tell you the truth: Deceased victim; body discovered frozen solid against the interior insulated door."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '61b01148-2558-535b-a9fa-632cc8af7c51',
  'story_055',
  'Toby Ross',
  'Apprentice Meat Packer',
  'Timid, shivering, wiping down stainless steel cutting tables',
  'I heard heavy banging from Locker 3 around 6:00 PM, but Mr. Vance told me it was the cooling pipes.',
  'He saw Owen carrying heavy rusty chains from the maintenance barn.',
  'In the loading bay packing sausage crates',
  'Apprentice who heard the victim’s desperate pounding',
  'The emergency interior safety glow-in-the-dark knob was missing from the locker door.',
  'Was too intimidated by Owen’s temper to check the freezer.',
  '🔪',
  '["I heard heavy banging from Locker 3 around 6:00 PM, but Mr. Vance told me it was the cooling pipes.","\"I heard heavy banging from Locker 3 around 6:00 PM, but Mr. Vance told me it was the cooling pipes.\"","Listen to me: I heard heavy banging from Locker 3 around 6:00 PM, but Mr. Vance told me it was the cooling pipes.","I tell you the truth: I heard heavy banging from Locker 3 around 6:00 PM, but Mr. Vance told me it was the cooling pipes."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5a0ce744-3a70-542f-bf7f-700af8ffc6f7',
  'story_055',
  'Detective Marcus Cole',
  'Homicide Investigator',
  'Hardboiled, wearing an overcoat, examining ice crystals with a magnifying lens',
  'Freezer doors don’t lock themselves with thirty pounds of case-hardened steel logging chain.',
  'Investigated Owen for assault six years prior.',
  'Arrived at the meat packing plant following an anonymous tip',
  'Leading the homicide investigation into Frank’s frozen death',
  'Found the removed interior emergency glow-in-the-dark knob in Owen’s tool chest.',
  'Did not immediately locate the keys to the heavy padlocks.',
  '🔍',
  '["Freezer doors don’t lock themselves with thirty pounds of case-hardened steel logging chain.","\"Freezer doors don’t lock themselves with thirty pounds of case-hardened steel logging chain.\"","Listen to me: Freezer doors don’t lock themselves with thirty pounds of case-hardened steel logging chain.","I tell you the truth: Freezer doors don’t lock themselves with thirty pounds of case-hardened steel logging chain."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c30814e7-b5a2-52b2-b72c-37e48147c0af',
  'story_055',
  'ev_1',
  1,
  '05:48 PM',
  'Thirty pounds of heavy case-hardened steel logging chains are wrapped around the door lever.',
  'Thirty pounds of heavy case-hardened steel logging chains are wrapped around the door lever.',
  'The freezer was intentionally barricaded so no one could open it from either side.',
  'Logging Chains',
  'Rusted high-tensile steel chain loops secured with twin brass padlocks.',
  '["Hemp Rope","Wire Cable","Iron Bar"]'::jsonb,
  'Logging Chains',
  '["logging chains","chains","steel chains","chain"]'::jsonb,
  'Heavy interlocking metal links used by loggers to tie down enormous tree trunks.',
  'ev_2',
  true,
  '{"descriptions":["Thirty pounds of heavy case-hardened steel logging chains are wrapped around the door lever.","At 05:48 PM: Thirty pounds of heavy case-hardened steel logging chains are wrapped around the door lever.","Notice this clue: Thirty pounds of heavy case-hardened steel logging chains are wrapped around the door lever."],"hints":["Heavy interlocking metal links used by loggers to tie down enormous tree trunks.","Clue hint: Think about logging chains.","Search for: the freezer was intentionally barricaded so no one could open it from either side."],"clues":["Logging Chains","Item: Logging Chains","Clue Word: Logging Chains"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f934134b-aac0-56c0-82b3-6fe346a6b1ec',
  'story_055',
  'ev_2',
  2,
  '05:50 PM',
  'The green photoluminescent interior safety release push-rod has been unscrewed and removed.',
  'The green photoluminescent interior safety release push-rod has been unscrewed and removed.',
  'The safety mechanism designed to let trapped workers out was sabotaged.',
  'Missing Safety Knob',
  'Empty threaded hole in the door where the emergency glow-knob should be.',
  '["Broken Latch","Bent Hinge","Cracked Window"]'::jsonb,
  'Missing Safety Knob',
  '["missing safety knob","knob","safety knob","release knob","missing knob"]'::jsonb,
  'A glow-in-the-dark push button on the inside of a walk-in freezer to escape.',
  'ev_3',
  false,
  '{"descriptions":["The green photoluminescent interior safety release push-rod has been unscrewed and removed.","At 05:50 PM: The green photoluminescent interior safety release push-rod has been unscrewed and removed.","Notice this clue: The green photoluminescent interior safety release push-rod has been unscrewed and removed."],"hints":["A glow-in-the-dark push button on the inside of a walk-in freezer to escape.","Clue hint: Think about missing safety knob.","Search for: the safety mechanism designed to let trapped workers out was sabotaged."],"clues":["Missing Safety Knob","Item: Missing Safety Knob","Clue Word: Missing Safety Knob"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cfe42faa-f816-5193-9222-25b35d4cfdf3',
  'story_055',
  'ev_3',
  3,
  '06:00 PM',
  'Frosted palm smudges and fingernail scratches coat the double-pane viewing window.',
  'Frosted palm smudges and fingernail scratches coat the double-pane viewing window.',
  'Frank desperately beat on the interior glass as his body temperature dropped.',
  'Frosted Handprints',
  'Smears of ice crystals and skin oil on the interior glass pane.',
  '["Blood Drips","Paint Smear","Water Condensation"]'::jsonb,
  'Frosted Handprints',
  '["frosted handprints","handprints","ice prints","palm prints"]'::jsonb,
  'Marks left on cold glass by human hands covered in freezing frost.',
  'ev_4',
  false,
  '{"descriptions":["Frosted palm smudges and fingernail scratches coat the double-pane viewing window.","At 06:00 PM: Frosted palm smudges and fingernail scratches coat the double-pane viewing window.","Notice this clue: Frosted palm smudges and fingernail scratches coat the double-pane viewing window."],"hints":["Marks left on cold glass by human hands covered in freezing frost.","Clue hint: Think about frosted handprints.","Search for: frank desperately beat on the interior glass as his body temperature dropped."],"clues":["Frosted Handprints","Item: Frosted Handprints","Clue Word: Frosted Handprints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3b78b625-3a73-5ec0-8189-c18d1d6c35d1',
  'story_055',
  'ev_4',
  4,
  '06:15 PM',
  'The letter "O-W-E-N" is scratched into the white frost on the stainless steel door panel.',
  'The letter "O-W-E-N" is scratched into the white frost on the stainless steel door panel.',
  'In his dying moments, Frank used his signet ring to carve his killer’s name.',
  'Scratched Name',
  'Carved letters in the frost reading "OWEN" directly beside the latch.',
  '["Random Scratches","Tool Marks","Drip Lines"]'::jsonb,
  'Scratched Name',
  '["scratched name","name","letters","carving"]'::jsonb,
  'Letters scraped into white frost spelling out who committed a crime.',
  'ev_5',
  false,
  '{"descriptions":["The letter \"O-W-E-N\" is scratched into the white frost on the stainless steel door panel.","At 06:15 PM: The letter \"O-W-E-N\" is scratched into the white frost on the stainless steel door panel.","Notice this clue: The letter \"O-W-E-N\" is scratched into the white frost on the stainless steel door panel."],"hints":["Letters scraped into white frost spelling out who committed a crime.","Clue hint: Think about scratched name.","Search for: in his dying moments, frank used his signet ring to carve his killer’s name."],"clues":["Scratched Name","Item: Scratched Name","Clue Word: Scratched Name"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '12333b04-fcfc-513e-8ff5-f3d7f52dbdeb',
  'story_055',
  'ev_5',
  5,
  '06:30 PM',
  'The ammonia refrigeration compressor hums at maximum cooling, holding minus 22°C.',
  'The ammonia refrigeration compressor hums at maximum cooling, holding minus 22°C.',
  'The thermostat was dialed down to its absolute coldest sub-zero setting.',
  'Freezer Thermostat',
  'Industrial dial locked at minus 22 degrees Celsius with fresh greasy thumbprints.',
  '["Heater Control","Pressure Gauge","Clock"]'::jsonb,
  'Freezer Thermostat',
  '["freezer thermostat","thermostat","dial","temperature control"]'::jsonb,
  'A dial or control box that regulates how cold a refrigerator or freezer gets.',
  'ev_6',
  true,
  '{"descriptions":["The ammonia refrigeration compressor hums at maximum cooling, holding minus 22°C.","At 06:30 PM: The ammonia refrigeration compressor hums at maximum cooling, holding minus 22°C.","Notice this clue: The ammonia refrigeration compressor hums at maximum cooling, holding minus 22°C."],"hints":["A dial or control box that regulates how cold a refrigerator or freezer gets.","Clue hint: Think about freezer thermostat.","Search for: the thermostat was dialed down to its absolute coldest sub-zero setting."],"clues":["Freezer Thermostat","Item: Freezer Thermostat","Clue Word: Freezer Thermostat"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3b47ac98-c708-5f22-9fc1-938a3fd0403c',
  'story_055',
  'ev_6',
  6,
  '08:15 AM',
  'The unscrewed green glow-knob is found hidden in Owen’s personal wooden toolbox.',
  'The unscrewed green glow-knob is found hidden in Owen’s personal wooden toolbox.',
  'Owen kept the removed safety rod to ensure Frank could never escape.',
  'Removed Safety Rod',
  'Threaded steel rod with glowing green mushroom cap in Owen’s box.',
  '["Screwdriver","Wrench","Hammer"]'::jsonb,
  'Removed Safety Rod',
  '["removed safety rod","safety rod","rod","glow rod","emergency rod"]'::jsonb,
  'A metal bar with a green glowing cap that pushes open walk-in freezer doors.',
  'ev_7',
  false,
  '{"descriptions":["The unscrewed green glow-knob is found hidden in Owen’s personal wooden toolbox.","At 08:15 AM: The unscrewed green glow-knob is found hidden in Owen’s personal wooden toolbox.","Notice this clue: The unscrewed green glow-knob is found hidden in Owen’s personal wooden toolbox."],"hints":["A metal bar with a green glowing cap that pushes open walk-in freezer doors.","Clue hint: Think about removed safety rod.","Search for: owen kept the removed safety rod to ensure frank could never escape."],"clues":["Removed Safety Rod","Item: Removed Safety Rod","Clue Word: Removed Safety Rod"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '56ceb3ac-9792-5866-af97-69d5358674aa',
  'story_055',
  'ev_7',
  7,
  '08:30 AM',
  'An empty cash box from the employee pension fund is buried in the rendering pit.',
  'An empty cash box from the employee pension fund is buried in the rendering pit.',
  'The fifty-thousand-dollar theft that triggered the fatal confrontation.',
  'Stolen Pension Cashbox',
  'Dented green steel lockbox with prying marks on the brass lock.',
  '["Wallet","Briefcase","Bank Bag"]'::jsonb,
  'Stolen Pension Cashbox',
  '["stolen pension cashbox","cashbox","cash box","pension box","box"]'::jsonb,
  'A metal locked box used in offices to store paper money and coins.',
  'ev_8',
  false,
  '{"descriptions":["An empty cash box from the employee pension fund is buried in the rendering pit.","At 08:30 AM: An empty cash box from the employee pension fund is buried in the rendering pit.","Notice this clue: An empty cash box from the employee pension fund is buried in the rendering pit."],"hints":["A metal locked box used in offices to store paper money and coins.","Clue hint: Think about stolen pension cashbox.","Search for: the fifty-thousand-dollar theft that triggered the fatal confrontation."],"clues":["Stolen Pension Cashbox","Item: Stolen Pension Cashbox","Clue Word: Stolen Pension Cashbox"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8f2774d7-9481-5a1a-9488-3bd9c9aa4bc5',
  'story_055',
  'ev_8',
  8,
  '08:45 AM',
  'A heavy 48-inch hydraulic bolt cutter snaps the logging chains in half.',
  'A heavy 48-inch hydraulic bolt cutter snaps the logging chains in half.',
  'Detective Cole used rescue tools to breach the frozen tomb.',
  'Bolt Cutters',
  'Heavy steel cutters with snapped chain links dropped on the concrete.',
  '["Hacksaw","Crowbar","Axe"]'::jsonb,
  'Bolt Cutters',
  '["bolt cutters","cutters","tool"]'::jsonb,
  'A long-handled scissor-like tool used to cut through thick iron chains.',
  NULL,
  true,
  '{"descriptions":["A heavy 48-inch hydraulic bolt cutter snaps the logging chains in half.","At 08:45 AM: A heavy 48-inch hydraulic bolt cutter snaps the logging chains in half.","Notice this clue: A heavy 48-inch hydraulic bolt cutter snaps the logging chains in half."],"hints":["A long-handled scissor-like tool used to cut through thick iron chains.","Clue hint: Think about bolt cutters.","Search for: detective cole used rescue tools to breach the frozen tomb."],"clues":["Bolt Cutters","Item: Bolt Cutters","Clue Word: Bolt Cutters"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_056 — THE SCARECROW IN THE CORN
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_056',
  'The Scarecrow in the Corn',
  'Horror',
  'Blackwood Corn Maze, towering dry cornstalks rustling in autumn wind, crows circling overhead',
  'A scarecrow tied to a wooden cross in the center of the cornfield was discovered wearing the missing sheriff’s jacket and badge.',
  '[{"name":"Silas Vance","role":"Elderly Corn Farmer","alibi":"In the tractor barn repairing grain augers","avatar":"🌾"},{"name":"Sheriff Paul Miller (Deceased)","role":"County Sheriff","alibi":"Missing person","avatar":"⭐"},{"name":"Toby Ross","role":"Itinerant Farmhand","alibi":"Sleeping in the hayloft above the stables","avatar":"🚜"},{"name":"Deputy Clara Cole","role":"Acting Chief Deputy","alibi":"Searching the county roads since the sheriff went missing","avatar":"🔍"}]'::jsonb,
  'Farmer Silas Vance killed Sheriff Miller when the sheriff stumbled upon his underground moonshine still. Silas disguised the sheriff’s body as a burlap-stuffed scarecrow, dressing it in the sheriff’s uniform and tying it to a wooden cross in the center of the corn maze.',
  'Farmer Silas Vance',
  'Sheriff Miller discovered Silas’s illegal moonshine distillery hidden beneath the cornfield.',
  '[{"time":"07:30 PM","event":"Sheriff Miller enters the cornfield following the scent of fermenting mash."},{"time":"08:00 PM","event":"Silas ambushes the sheriff from behind with an iron-tined pitchfork."},{"time":"09:30 PM","event":"Silas ties the body to a cedar cross, covering the head in burlap sack."},{"time":"10:00 PM","event":"Silas pins the sheriff’s jacket and star badge onto the scarecrow as a warning."},{"time":"08:00 AM","event":"Deputy Cole enters the maze and discovers the horrific scarecrow."}]'::jsonb,
  '[{"id":"ev1","title":"Sheriff’s Body Bound to Cedar Cross","detail":"Concealed inside the burlap scarecrow with three fatal pitchfork puncture wounds."},{"id":"ev2","title":"Bloody Pitchfork in Silas’s Barn","detail":"Carries Sheriff Miller’s blood and Silas Vance’s fingerprint grease."},{"id":"ev3","title":"Burlap Sack Stamped Vance Farm","detail":"Used as the scarecrow mask; originated from Silas’s private grain inventory."},{"id":"ev4","title":"Hidden Underground Moonshine Still","detail":"Discovered forty yards away beneath Row 14, establishing the motive for murder."}]'::jsonb,
  '[{"order":1,"title":"Macabre Scarecrow","text":"Human body bound to a cedar cross and dressed in burlap in the corn maze."},{"order":2,"title":"Sheriff Badge & Jacket","text":"Official law enforcement uniform pinned to the horrific field effigy."},{"order":3,"title":"Bloody Pitchfork","text":"Three-tined farm tool used to impale the sheriff from behind."},{"order":4,"title":"Burlap Sack Mask","text":"Grain bag stamped with Silas’s farm name placed over the victim’s head."},{"order":5,"title":"Underground Moonshine Still","text":"Massive illegal distillery hidden beneath the cornfield rows."},{"order":6,"title":"Tarred Hemp Rope","text":"Heavy marine cord used to lash the sheriff’s limbs to the cedar wood."}]'::jsonb,
  'Farmhand Toby had blood on his garden shears.: He had slaughtered a chicken for the farmhouse stew.; Crows circled the maze in huge noisy flocks.: Attracted by the harvest grain and corn, not a supernatural omen.',
  'Claim a pagan corn demon took the sheriff’s soul or blame the wandering farmhand Toby.',
  'NORMAL',
  'Where was the missing sheriff and who dressed the scarecrow in his official uniform?',
  '[{"character":"Silas Vance","secret":"He operates an underground whiskey still producing five hundred gallons a week."},{"character":"Sheriff Paul Miller (Deceased)","secret":"He kept his moonshine investigation secret to avoid tipping off local deputies."},{"character":"Toby Ross","secret":"He saw Silas carrying a heavy wheelbarrow into the corn at midnight."},{"character":"Deputy Clara Cole","secret":"She was Sheriff Miller’s niece and swore to find him dead or alive."}]'::jsonb,
  '[{"lead":"Farmhand Toby had blood on his garden shears.","explanation":"He had slaughtered a chicken for the farmhouse stew."},{"lead":"Crows circled the maze in huge noisy flocks.","explanation":"Attracted by the harvest grain and corn, not a supernatural omen."}]'::jsonb,
  '{"wrongTheories":["A mythical pagan corn spirit manifested during the harvest moon to take a blood sacrifice.","A rival moonshine gang from the next county ambushed the sheriff in the corn."],"correctTheory":"Farmer Silas Vance ambushed Sheriff Miller with a pitchfork when the lawman uncovered his underground moonshine still, then disguised the sheriff’s corpse as a scarecrow on a wooden cross in the center of the maze to terrify anyone from investigating."}'::jsonb,
  'Farmer Silas Vance murdered the sheriff to protect his secret moonshine still!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Deputy Cole tracked the blood trail to the still and arrested Silas Vance with the bloody pitchfork. Silas was convicted of capital murder of a law officer."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Silas framed the wandering farmhand Toby, who was arrested and imprisoned. Silas continued operating his moonshine distillery in secret."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Blackwood Scarecrow Demon\" became a legendary rural myth. The cornfield was turned into a horror tourist attraction while the murder went unsolved."}]'::jsonb,
  '{"intros":["A scarecrow tied to a wooden cross in the center of the cornfield was discovered wearing the missing sheriff’s jacket and badge.","Case file story_056: A scarecrow tied to a wooden cross in the center of the cornfield was discovered wearing the missing sheriff’s jacket and badge. Look closely at every clue.","Trouble begins in Blackwood Corn Maze, towering dry cornstalks rustling in autumn wind, crows circling overhead. A scarecrow tied to a wooden cross in the center of the cornfield was discovered wearing the missing sheriff’s jacket and badge.","The mystery starts now. A scarecrow tied to a wooden cross in the center of the cornfield was discovered wearing the missing sheriff’s jacket and badge. Can you solve it?"],"reveals":["Farmer Silas Vance murdered the sheriff to protect his secret moonshine still!","The mystery is unraveled! Farmer Silas Vance murdered the sheriff to protect his secret moonshine still!","At last, the truth comes out: Farmer Silas Vance murdered the sheriff to protect his secret moonshine still!","Case resolved! Here is what happened: Farmer Silas Vance murdered the sheriff to protect his secret moonshine still!"],"hints":["Pay attention to where Farmer Silas Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_056';
DELETE FROM public.case_events WHERE case_id = 'story_056';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '50ea8325-d71d-507d-8a6a-f51dfdde880f',
  'story_056',
  'Silas Vance',
  'Elderly Corn Farmer',
  'Weathered, squinting eyes, chewing straw, carrying a sharp corn sickle',
  'The crows have been restless all week. The cornfield has a dark spirit in October.',
  'He operates an underground whiskey still producing five hundred gallons a week.',
  'In the tractor barn repairing grain augers',
  'Owner of the farm where the scarecrow was erected',
  'The scarecrow in the center field is not stuffed with straw, but with human flesh.',
  'Did not know the sheriff’s radio was still transmitting an emergency homing beacon.',
  '🌾',
  '["The crows have been restless all week. The cornfield has a dark spirit in October.","\"The crows have been restless all week. The cornfield has a dark spirit in October.\"","Listen to me: The crows have been restless all week. The cornfield has a dark spirit in October.","I tell you the truth: The crows have been restless all week. The cornfield has a dark spirit in October."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '61b319e2-b433-58b0-be0b-0fb40576752a',
  'story_056',
  'Sheriff Paul Miller (Deceased)',
  'County Sheriff',
  'Honest, brave, dedicated lawman missing for two days',
  'Deceased victim; body discovered bound inside the burlap scarecrow on the wooden cross.',
  'He kept his moonshine investigation secret to avoid tipping off local deputies.',
  'Missing person',
  'Victim of the murder in the cornfield',
  'His gold sheriff star badge was pinned upside down by the killer.',
  'Did not expect Silas to ambush him from the high corn rows.',
  '⭐',
  '["Deceased victim; body discovered bound inside the burlap scarecrow on the wooden cross.","\"Deceased victim; body discovered bound inside the burlap scarecrow on the wooden cross.\"","Listen to me: Deceased victim; body discovered bound inside the burlap scarecrow on the wooden cross.","I tell you the truth: Deceased victim; body discovered bound inside the burlap scarecrow on the wooden cross."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '07d69bf0-c152-55ab-8798-c3b9d2f106c8',
  'story_056',
  'Toby Ross',
  'Itinerant Farmhand',
  'Simple, nervous, carrying a burlap bag and garden shears',
  'I made the other scarecrows with straw and old flannel, but I never touched that one.',
  'He saw Silas carrying a heavy wheelbarrow into the corn at midnight.',
  'Sleeping in the hayloft above the stables',
  'Worker who built the ordinary scarecrows for the autumn maze',
  'The center scarecrow smelled of blood and copper, not dry hay.',
  'Was terrified that Silas would kill him if he spoke to police.',
  '🚜',
  '["I made the other scarecrows with straw and old flannel, but I never touched that one.","\"I made the other scarecrows with straw and old flannel, but I never touched that one.\"","Listen to me: I made the other scarecrows with straw and old flannel, but I never touched that one.","I tell you the truth: I made the other scarecrows with straw and old flannel, but I never touched that one."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4aee7854-ee78-58d2-97c8-346f9b3eab8f',
  'story_056',
  'Deputy Clara Cole',
  'Acting Chief Deputy',
  'Determined, sharp-eyed, holding a shotgun and tracking hound',
  'The sheriff’s patrol car was found idling by the cornfield gate with the radio mic keyed.',
  'She was Sheriff Miller’s niece and swore to find him dead or alive.',
  'Searching the county roads since the sheriff went missing',
  'Leading the search for her missing uncle',
  'Found blood drops on corn husks forty yards from the wooden cross.',
  'Did not immediately realize the scarecrow itself was her uncle’s corpse.',
  '🔍',
  '["The sheriff’s patrol car was found idling by the cornfield gate with the radio mic keyed.","\"The sheriff’s patrol car was found idling by the cornfield gate with the radio mic keyed.\"","Listen to me: The sheriff’s patrol car was found idling by the cornfield gate with the radio mic keyed.","I tell you the truth: The sheriff’s patrol car was found idling by the cornfield gate with the radio mic keyed."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd3955d69-3e51-52b2-8b26-cfccfc38b803',
  'story_056',
  'ev_1',
  1,
  '08:00 AM',
  'A terrifying scarecrow tied with hemp rope to a tall cedar cross stands in the maze center.',
  'A terrifying scarecrow tied with hemp rope to a tall cedar cross stands in the maze center.',
  'The scarecrow was not made of straw; it contained the dead body of the sheriff.',
  'Macabre Scarecrow',
  'Cedar cross supporting a human body wrapped in burlap and autumn corn husks.',
  '["Straw Dummy","Wooden Post","Hanging Effigy"]'::jsonb,
  'Macabre Scarecrow',
  '["macabre scarecrow","scarecrow","dummy","cross"]'::jsonb,
  'A figure set up in a field to frighten birds away from growing crops.',
  'ev_2',
  true,
  '{"descriptions":["A terrifying scarecrow tied with hemp rope to a tall cedar cross stands in the maze center.","At 08:00 AM: A terrifying scarecrow tied with hemp rope to a tall cedar cross stands in the maze center.","Notice this clue: A terrifying scarecrow tied with hemp rope to a tall cedar cross stands in the maze center."],"hints":["A figure set up in a field to frighten birds away from growing crops.","Clue hint: Think about macabre scarecrow.","Search for: the scarecrow was not made of straw; it contained the dead body of the sheriff."],"clues":["Macabre Scarecrow","Item: Macabre Scarecrow","Clue Word: Macabre Scarecrow"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'db994814-dd31-5536-82c1-4fd7239399ca',
  'story_056',
  'ev_2',
  2,
  '08:05 AM',
  'The official county sheriff’s tan wool jacket and gold star badge are pinned to the chest.',
  'The official county sheriff’s tan wool jacket and gold star badge are pinned to the chest.',
  'The victim was identified immediately as the missing Sheriff Paul Miller.',
  'Sheriff Badge & Jacket',
  'Uniform jacket with bullet tears and gold seven-point star badge #1.',
  '["Flannel Shirt","Raincoat","Leather Vest"]'::jsonb,
  'Sheriff Badge & Jacket',
  '["sheriff badge & jacket","badge","jacket","sheriff badge","uniform","star"]'::jsonb,
  'An official police officer’s wool uniform coat and shiny metal star pin.',
  'ev_3',
  false,
  '{"descriptions":["The official county sheriff’s tan wool jacket and gold star badge are pinned to the chest.","At 08:05 AM: The official county sheriff’s tan wool jacket and gold star badge are pinned to the chest.","Notice this clue: The official county sheriff’s tan wool jacket and gold star badge are pinned to the chest."],"hints":["An official police officer’s wool uniform coat and shiny metal star pin.","Clue hint: Think about sheriff badge & jacket.","Search for: the victim was identified immediately as the missing sheriff paul miller."],"clues":["Sheriff Badge & Jacket","Item: Sheriff Badge & Jacket","Clue Word: Sheriff Badge & Jacket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a6a5d981-48c5-5932-b68c-953649c02ba9',
  'story_056',
  'ev_3',
  3,
  '08:15 AM',
  'A heavy three-tined forged iron pitchfork with dried blood is found in the barn.',
  'A heavy three-tined forged iron pitchfork with dried blood is found in the barn.',
  'The murder weapon used to impale the sheriff from behind in the corn rows.',
  'Bloody Pitchfork',
  'Antique farm tool with sharp iron prongs stained with Type O blood.',
  '["Corn Sickle","Axe","Shovel"]'::jsonb,
  'Bloody Pitchfork',
  '["bloody pitchfork","pitchfork","fork","tool"]'::jsonb,
  'A long-handled farm tool with several sharp curved iron tines used to lift hay.',
  'ev_4',
  false,
  '{"descriptions":["A heavy three-tined forged iron pitchfork with dried blood is found in the barn.","At 08:15 AM: A heavy three-tined forged iron pitchfork with dried blood is found in the barn.","Notice this clue: A heavy three-tined forged iron pitchfork with dried blood is found in the barn."],"hints":["A long-handled farm tool with several sharp curved iron tines used to lift hay.","Clue hint: Think about bloody pitchfork.","Search for: the murder weapon used to impale the sheriff from behind in the corn rows."],"clues":["Bloody Pitchfork","Item: Bloody Pitchfork","Clue Word: Bloody Pitchfork"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '35d4d94a-d20d-5f4a-ba5c-33146275cfa3',
  'story_056',
  'ev_4',
  4,
  '08:30 AM',
  'A coarse burlap potato sack covers the scarecrow’s head with stitched eyeholes.',
  'A coarse burlap potato sack covers the scarecrow’s head with stitched eyeholes.',
  'The sack came from Silas’s personal grain storage bin in the barn.',
  'Burlap Sack Mask',
  'Jute cloth sack stamped "Vance Farm - Seed Corn 1980".',
  '["Cotton Mask","Bandana","Pillowcase"]'::jsonb,
  'Burlap Sack Mask',
  '["burlap sack mask","sack","burlap sack","mask","burlap mask"]'::jsonb,
  'A rough brown woven cloth bag used to store potatoes or grain.',
  'ev_5',
  false,
  '{"descriptions":["A coarse burlap potato sack covers the scarecrow’s head with stitched eyeholes.","At 08:30 AM: A coarse burlap potato sack covers the scarecrow’s head with stitched eyeholes.","Notice this clue: A coarse burlap potato sack covers the scarecrow’s head with stitched eyeholes."],"hints":["A rough brown woven cloth bag used to store potatoes or grain.","Clue hint: Think about burlap sack mask.","Search for: the sack came from silas’s personal grain storage bin in the barn."],"clues":["Burlap Sack Mask","Item: Burlap Sack Mask","Clue Word: Burlap Sack Mask"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '078f6c1d-e2aa-54a7-86cb-13132453d4d1',
  'story_056',
  'ev_5',
  5,
  '08:45 AM',
  'A hidden underground trapdoor beneath dry cornstalks conceals an illegal whiskey still.',
  'A hidden underground trapdoor beneath dry cornstalks conceals an illegal whiskey still.',
  'The moonshine operation was the secret the sheriff died trying to expose.',
  'Underground Moonshine Still',
  'Copper boiler, condenser coil, and hundred-gallon barrels of fermenting mash.',
  '["Bomb Shelter","Root Cellar","Mine Shaft"]'::jsonb,
  'Underground Moonshine Still',
  '["underground moonshine still","still","moonshine still","distillery","copper still"]'::jsonb,
  'Illegal homemade equipment used to boil and distill strong alcoholic liquor.',
  'ev_6',
  true,
  '{"descriptions":["A hidden underground trapdoor beneath dry cornstalks conceals an illegal whiskey still.","At 08:45 AM: A hidden underground trapdoor beneath dry cornstalks conceals an illegal whiskey still.","Notice this clue: A hidden underground trapdoor beneath dry cornstalks conceals an illegal whiskey still."],"hints":["Illegal homemade equipment used to boil and distill strong alcoholic liquor.","Clue hint: Think about underground moonshine still.","Search for: the moonshine operation was the secret the sheriff died trying to expose."],"clues":["Underground Moonshine Still","Item: Underground Moonshine Still","Clue Word: Underground Moonshine Still"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5d7d5e95-9685-55bb-91d2-ae5b7412c84c',
  'story_056',
  'ev_6',
  6,
  '09:00 AM',
  'The sheriff’s police cruiser radio continues chirping an emergency GPS beacon.',
  'The sheriff’s police cruiser radio continues chirping an emergency GPS beacon.',
  'The cruiser was parked at the gate with keys left in the ignition switch.',
  'Police Cruiser',
  'Marked police vehicle with idling engine and open driver-side door.',
  '["Farm Truck","Tractor","Motorcycle"]'::jsonb,
  'Police Cruiser',
  '["police cruiser","cruiser","police car","car","patrol car"]'::jsonb,
  'An official marked police sedan equipped with sirens and emergency radios.',
  'ev_7',
  false,
  '{"descriptions":["The sheriff’s police cruiser radio continues chirping an emergency GPS beacon.","At 09:00 AM: The sheriff’s police cruiser radio continues chirping an emergency GPS beacon.","Notice this clue: The sheriff’s police cruiser radio continues chirping an emergency GPS beacon."],"hints":["An official marked police sedan equipped with sirens and emergency radios.","Clue hint: Think about police cruiser.","Search for: the cruiser was parked at the gate with keys left in the ignition switch."],"clues":["Police Cruiser","Item: Police Cruiser","Clue Word: Police Cruiser"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '02937be1-a76b-58bf-9c6a-6372b0bb59b4',
  'story_056',
  'ev_7',
  7,
  '09:30 AM',
  'Heavy coils of tarred marine hemp rope are used to bind the limbs to the cedar cross.',
  'Heavy coils of tarred marine hemp rope are used to bind the limbs to the cedar cross.',
  'The rope was tied using distinctive square knots favored by farmer Silas.',
  'Tarred Hemp Rope',
  'Thick brown hemp cord smelling of pine tar and cedar resin.',
  '["Wire Cable","Zip Ties","Cotton String"]'::jsonb,
  'Tarred Hemp Rope',
  '["tarred hemp rope","rope","hemp rope","tarred rope","cord"]'::jsonb,
  'Thick twisted fibrous string coated in sticky dark tar for waterproofing.',
  'ev_8',
  false,
  '{"descriptions":["Heavy coils of tarred marine hemp rope are used to bind the limbs to the cedar cross.","At 09:30 AM: Heavy coils of tarred marine hemp rope are used to bind the limbs to the cedar cross.","Notice this clue: Heavy coils of tarred marine hemp rope are used to bind the limbs to the cedar cross."],"hints":["Thick twisted fibrous string coated in sticky dark tar for waterproofing.","Clue hint: Think about tarred hemp rope.","Search for: the rope was tied using distinctive square knots favored by farmer silas."],"clues":["Tarred Hemp Rope","Item: Tarred Hemp Rope","Clue Word: Tarred Hemp Rope"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4a89898a-c35a-5d46-88e8-56dad2e5c85f',
  'story_056',
  'ev_8',
  8,
  '10:00 AM',
  'Blood drops on dried corn leaves create a direct trail from the still to the cross.',
  'Blood drops on dried corn leaves create a direct trail from the still to the cross.',
  'The sheriff was murdered near the still and dragged fifty yards to the cross.',
  'Bloodstained Corn Leaves',
  'Dried crimson spatters on dry autumn corn leaves along Row 14.',
  '["Mud Drops","Sap Stains","Red Paint"]'::jsonb,
  'Bloodstained Corn Leaves',
  '["bloodstained corn leaves","blood trail","corn leaves","blood drops","leaves"]'::jsonb,
  'Dry plant leaves from tall corn stalks speckled with drops of red blood.',
  NULL,
  true,
  '{"descriptions":["Blood drops on dried corn leaves create a direct trail from the still to the cross.","At 10:00 AM: Blood drops on dried corn leaves create a direct trail from the still to the cross.","Notice this clue: Blood drops on dried corn leaves create a direct trail from the still to the cross."],"hints":["Dry plant leaves from tall corn stalks speckled with drops of red blood.","Clue hint: Think about bloodstained corn leaves.","Search for: the sheriff was murdered near the still and dragged fifty yards to the cross."],"clues":["Bloodstained Corn Leaves","Item: Bloodstained Corn Leaves","Clue Word: Bloodstained Corn Leaves"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_057 — THE SUBMERGED MORGUE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_057',
  'The Submerged Morgue',
  'Horror',
  'City Memorial Hospital Sub-Basement Morgue, flickering fluorescent tubes, cold stainless steel trays, rising floodwaters',
  'During a flash flood storm, morgue refrigerated drawers were found pulled open, and three bodies were floating in waist-deep water.',
  '[{"name":"Victor Vance","role":"Chief Hospital Mortician","alibi":"In the ground floor pathology office writing autopsy reports","avatar":"🥼"},{"name":"Frank Cole (Deceased)","role":"Courier Corpse #408","alibi":"In Morgue Vault Drawer 12","avatar":"💀"},{"name":"Nurse Elena Cruz","role":"Night Triage Nurse","alibi":"At the second floor triage emergency station","avatar":"👩‍⚕️"},{"name":"Detective Thomas Hansen","role":"Coroner’s Inquest Investigator","alibi":"Dispatched to the hospital after the flooding was reported","avatar":"🔍"}]'::jsonb,
  'Mortician Victor Vance learned that an international diamond courier had died in police custody with two million dollars in raw gems swallowed in his stomach. Victor opened the basement storm drains to flood the morgue, used surgical scalpels to extract the diamonds, and let the bodies float to cover his crime.',
  'Mortician Victor Vance',
  'Victor was harvesting smuggled diamonds swallowed by a deceased courier before the coroner arrived.',
  '[{"time":"11:00 PM","event":"Corpse #408 (diamond courier) is admitted to Morgue Vault Drawer 12."},{"time":"01:00 AM","event":"Victor turns the basement floodgate wheel, flooding the sub-basement with storm sewer water."},{"time":"01:45 AM","event":"Victor wades into the morgue, pulls Drawer 12, and cuts open the courier’s stomach."},{"time":"02:05 AM","event":"Nurse Cruz enters the flooded morgue and witnesses Victor holding bloody surgical tools."},{"time":"02:30 AM","event":"Detective Hansen arrives and discovers three corpses floating in waist-deep water."}]'::jsonb,
  '[{"id":"ev1","title":"Post-Mortem Abdominal Incision","detail":"Surgically executed while the morgue was flooded to extract swallowed contraband."},{"id":"ev2","title":"Specimen Jar with 60 Carats of Diamonds","detail":"Discovered in Victor’s private pathology cabinet labeled \"Liver Tissue\"."},{"id":"ev3","title":"Rubber Waders Smelling of Sewer Water","detail":"Found wet in Victor’s office, contradicting his claim that he stayed upstairs."},{"id":"ev4","title":"Manually Opened Flood Drainage Valve","detail":"Proves the sub-basement flood was an intentional act of infrastructure sabotage."}]'::jsonb,
  '[{"order":1,"title":"Submerged Morgue Drawer","text":"Stainless steel refrigerated compartment opened during the flood."},{"order":2,"title":"Surgical Incision","text":"Clean post-mortem cut made to retrieve swallowed diamond packets."},{"order":3,"title":"Diamond Specimen Jar","text":"Formaldehyde container filled with two million dollars in raw gems."},{"order":4,"title":"Rubber Chest Waders","text":"Waterproof gear worn by the mortician to wade through the flooded basement."},{"order":5,"title":"Autopsy Scalpel","text":"Surgical knife used to cut open the corpse under the murky water."},{"order":6,"title":"Flood Drainage Valve","text":"Iron wheel cranked open to intentionally submerge the morgue."}]'::jsonb,
  'The storm caused widespread city flooding.: The river crested high, but the hospital sub-basement had floodgates.; Nurse Cruz dropped her flashlight in panic.: She was genuinely terrified by seeing the mortician cutting a corpse.',
  'Claim the corpses rose from the dead or blame the night janitor.',
  'NORMAL',
  'Did the rising floodwaters push the stainless steel drawers open, or was someone searching the dead?',
  '[{"character":"Victor Vance","secret":"He has fifty uncut industrial diamonds hidden in his stainless steel specimen jar."},{"character":"Frank Cole (Deceased)","secret":"He swallowed three balloon packets of raw diamonds before his arrest."},{"character":"Nurse Elena Cruz","secret":"She dropped her flashlight and fled upstairs in sheer terror."},{"character":"Detective Thomas Hansen","secret":"Tracking the international diamond smuggling ring across three port cities."}]'::jsonb,
  '[{"lead":"The storm caused widespread city flooding.","explanation":"The river crested high, but the hospital sub-basement had floodgates."},{"lead":"Nurse Cruz dropped her flashlight in panic.","explanation":"She was genuinely terrified by seeing the mortician cutting a corpse."}]'::jsonb,
  '{"wrongTheories":["The dead corpses reanimated due to an unknown biological contagion in the floodwater.","Water pressure naturally popped open the steel drawers and ruptured the bodies."],"correctTheory":"Mortician Victor Vance manually opened the storm drainage valve to flood the morgue, used a surgical scalpel to extract sixty carats of smuggled diamonds from a deceased courier’s stomach, and hid the gems in a specimen jar while corpses floated in the water."}'::jsonb,
  'Mortician Victor Vance flooded the morgue to harvest diamonds from a corpse!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Hansen seized the diamond jar and matched the scalpel to the incision. Victor Vance was arrested for body desecration, grand larceny, and infrastructure sabotage."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The hospital board wrote off the incident as a tragic storm flood disaster. Victor smuggled the sixty carats of diamonds to Antwerp and retired."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Superstitious hospital staff circulated stories of \"The Night the Dead Floated.\" Victor capitalized on the chaos and maintained his position."}]'::jsonb,
  '{"intros":["During a flash flood storm, morgue refrigerated drawers were found pulled open, and three bodies were floating in waist-deep water.","Case file story_057: During a flash flood storm, morgue refrigerated drawers were found pulled open, and three bodies were floating in waist-deep water. Look closely at every clue.","Trouble begins in City Memorial Hospital Sub-Basement Morgue, flickering fluorescent tubes, cold stainless steel trays, rising floodwaters. During a flash flood storm, morgue refrigerated drawers were found pulled open, and three bodies were floating in waist-deep water.","The mystery starts now. During a flash flood storm, morgue refrigerated drawers were found pulled open, and three bodies were floating in waist-deep water. Can you solve it?"],"reveals":["Mortician Victor Vance flooded the morgue to harvest diamonds from a corpse!","The mystery is unraveled! Mortician Victor Vance flooded the morgue to harvest diamonds from a corpse!","At last, the truth comes out: Mortician Victor Vance flooded the morgue to harvest diamonds from a corpse!","Case resolved! Here is what happened: Mortician Victor Vance flooded the morgue to harvest diamonds from a corpse!"],"hints":["Pay attention to where Mortician Victor Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_057';
DELETE FROM public.case_events WHERE case_id = 'story_057';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0ea668e6-ac44-5133-8f86-85840aeb7196',
  'story_057',
  'Victor Vance',
  'Chief Hospital Mortician',
  'Cold, sterile, pale skin, wearing tall rubber wading boots and bloodstained surgical scrubs',
  'The sewer line backed up during the storm surge. The water pressure popped the drawer latches.',
  'He has fifty uncut industrial diamonds hidden in his stainless steel specimen jar.',
  'In the ground floor pathology office writing autopsy reports',
  'Sole pathologist with access to the sub-basement body vaults',
  'The courier corpse #408 swallowed sixty carats of uncut diamonds in latex balloons.',
  'Did not know the autopsy scalpel left unique micro-serrations on the corpse’s ribs.',
  '🥼',
  '["The sewer line backed up during the storm surge. The water pressure popped the drawer latches.","\"The sewer line backed up during the storm surge. The water pressure popped the drawer latches.\"","Listen to me: The sewer line backed up during the storm surge. The water pressure popped the drawer latches.","I tell you the truth: The sewer line backed up during the storm surge. The water pressure popped the drawer latches."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '226d4f64-484e-5dfa-bbf5-53458d10df5e',
  'story_057',
  'Frank Cole (Deceased)',
  'Courier Corpse #408',
  'Deceased international smuggler, floating on an overturned stainless steel gurney',
  'Deceased victim; chest and abdomen showed surgical incision marks made post-mortem.',
  'He swallowed three balloon packets of raw diamonds before his arrest.',
  'In Morgue Vault Drawer 12',
  'The body raided for the stolen diamonds',
  'His stomach had been cleanly excised with a surgical incision.',
  'Could not prevent the desecration of his body.',
  '💀',
  '["Deceased victim; chest and abdomen showed surgical incision marks made post-mortem.","\"Deceased victim; chest and abdomen showed surgical incision marks made post-mortem.\"","Listen to me: Deceased victim; chest and abdomen showed surgical incision marks made post-mortem.","I tell you the truth: Deceased victim; chest and abdomen showed surgical incision marks made post-mortem."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ad3ac430-d57a-53eb-b94e-827bf2184c61',
  'story_057',
  'Nurse Elena Cruz',
  'Night Triage Nurse',
  'Alert, courageous, wearing waterproof boots and holding a flashlight',
  'I came down for emergency blood bags and found the mortician standing in waist-deep water cutting a corpse.',
  'She dropped her flashlight and fled upstairs in sheer terror.',
  'At the second floor triage emergency station',
  'Eyewitness who surprised Victor during the body harvesting',
  'Saw Victor stuffing something into a glass formaldehyde jar.',
  'Did not know the items were multi-million-dollar diamonds.',
  '👩‍⚕️',
  '["I came down for emergency blood bags and found the mortician standing in waist-deep water cutting a corpse.","\"I came down for emergency blood bags and found the mortician standing in waist-deep water cutting a corpse.\"","Listen to me: I came down for emergency blood bags and found the mortician standing in waist-deep water cutting a corpse.","I tell you the truth: I came down for emergency blood bags and found the mortician standing in waist-deep water cutting a corpse."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a4e47d9e-e8fd-5a7c-92e4-df4dbedfbb69',
  'story_057',
  'Detective Thomas Hansen',
  'Coroner’s Inquest Investigator',
  'Methodical, grim, wading through the murky flooded morgue in waders',
  'Water pressure does not slice surgical Y-incisions into deceased human torsos.',
  'Tracking the international diamond smuggling ring across three port cities.',
  'Dispatched to the hospital after the flooding was reported',
  'Leading the criminal desecration and diamond theft inquiry',
  'Found diamond jeweler’s loupe lenses in Victor’s locker.',
  'Did not know where the specimen jar of diamonds was stashed.',
  '🔍',
  '["Water pressure does not slice surgical Y-incisions into deceased human torsos.","\"Water pressure does not slice surgical Y-incisions into deceased human torsos.\"","Listen to me: Water pressure does not slice surgical Y-incisions into deceased human torsos.","I tell you the truth: Water pressure does not slice surgical Y-incisions into deceased human torsos."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '391f4f46-f305-553f-9816-1d1df9c4fcf1',
  'story_057',
  'ev_1',
  1,
  '01:45 AM',
  'Stainless steel refrigerated drawer #12 is pulled wide open, submerged in murky floodwater.',
  'Stainless steel refrigerated drawer #12 is pulled wide open, submerged in murky floodwater.',
  'The drawer was opened by a human hand using the master brass release key.',
  'Submerged Morgue Drawer',
  'Steel drawer tray floating partially open with water splashing over the name tag.',
  '["Wooden Coffin","Hospital Bed","Stretcher"]'::jsonb,
  'Submerged Morgue Drawer',
  '["submerged morgue drawer","drawer","morgue drawer","refrigerated drawer","tray"]'::jsonb,
  'A large stainless steel slide-out compartment used to store bodies in a morgue.',
  'ev_2',
  true,
  '{"descriptions":["Stainless steel refrigerated drawer #12 is pulled wide open, submerged in murky floodwater.","At 01:45 AM: Stainless steel refrigerated drawer #12 is pulled wide open, submerged in murky floodwater.","Notice this clue: Stainless steel refrigerated drawer #12 is pulled wide open, submerged in murky floodwater."],"hints":["A large stainless steel slide-out compartment used to store bodies in a morgue.","Clue hint: Think about submerged morgue drawer.","Search for: the drawer was opened by a human hand using the master brass release key."],"clues":["Submerged Morgue Drawer","Item: Submerged Morgue Drawer","Clue Word: Submerged Morgue Drawer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '625de73b-84cf-55b9-96c5-add106caf877',
  'story_057',
  'ev_2',
  2,
  '01:50 AM',
  'A post-mortem surgical incision spans the chest and abdomen of Corpse #408.',
  'A post-mortem surgical incision spans the chest and abdomen of Corpse #408.',
  'The incision was made after death specifically to extract the stomach contents.',
  'Surgical Incision',
  'Clean scalpel cut through abdominal tissue with no vital tissue reaction.',
  '["Bullet Wound","Blunt Bruise","Bite Mark"]'::jsonb,
  'Surgical Incision',
  '["surgical incision","incision","cut","wound","scalpel cut"]'::jsonb,
  'A clean, straight cut made in human skin using a sharp surgical knife.',
  'ev_3',
  false,
  '{"descriptions":["A post-mortem surgical incision spans the chest and abdomen of Corpse #408.","At 01:50 AM: A post-mortem surgical incision spans the chest and abdomen of Corpse #408.","Notice this clue: A post-mortem surgical incision spans the chest and abdomen of Corpse #408."],"hints":["A clean, straight cut made in human skin using a sharp surgical knife.","Clue hint: Think about surgical incision.","Search for: the incision was made after death specifically to extract the stomach contents."],"clues":["Surgical Incision","Item: Surgical Incision","Clue Word: Surgical Incision"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '86018522-52d8-5a51-9561-4e95faa7e7e1',
  'story_057',
  'ev_3',
  3,
  '01:55 AM',
  'A glass formaldehyde specimen jar holds sixty carats of raw uncut diamonds.',
  'A glass formaldehyde specimen jar holds sixty carats of raw uncut diamonds.',
  'The stolen gems were hidden inside a jar labeled "Pathology - Liver Tissue".',
  'Diamond Specimen Jar',
  'Heavy glass laboratory jar filled with amber preservative and sparkling rough stones.',
  '["Medicine Bottle","Test Tube","Beaker"]'::jsonb,
  'Diamond Specimen Jar',
  '["diamond specimen jar","jar","specimen jar","diamond jar","glass jar"]'::jsonb,
  'A thick glass container used in medical labs to preserve organs in liquid.',
  'ev_4',
  false,
  '{"descriptions":["A glass formaldehyde specimen jar holds sixty carats of raw uncut diamonds.","At 01:55 AM: A glass formaldehyde specimen jar holds sixty carats of raw uncut diamonds.","Notice this clue: A glass formaldehyde specimen jar holds sixty carats of raw uncut diamonds."],"hints":["A thick glass container used in medical labs to preserve organs in liquid.","Clue hint: Think about diamond specimen jar.","Search for: the stolen gems were hidden inside a jar labeled \"pathology - liver tissue\"."],"clues":["Diamond Specimen Jar","Item: Diamond Specimen Jar","Clue Word: Diamond Specimen Jar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ad8b05ae-673a-574e-87be-c7d81e60025e',
  'story_057',
  'ev_4',
  4,
  '02:00 AM',
  'Tall black rubber chest waders are found dripping water behind Victor’s office door.',
  'Tall black rubber chest waders are found dripping water behind Victor’s office door.',
  'Victor wore waterproof gear to stand in the three-foot floodwaters.',
  'Rubber Chest Waders',
  'Heavy neoprene waterproof overalls smelling of storm sewer runoff.',
  '["Raincoat","Rubber Boots","Diving Suit"]'::jsonb,
  'Rubber Chest Waders',
  '["rubber chest waders","waders","chest waders","boots","rubber waders"]'::jsonb,
  'High waterproof rubber boots that extend up to the chest worn by fishermen.',
  'ev_5',
  false,
  '{"descriptions":["Tall black rubber chest waders are found dripping water behind Victor’s office door.","At 02:00 AM: Tall black rubber chest waders are found dripping water behind Victor’s office door.","Notice this clue: Tall black rubber chest waders are found dripping water behind Victor’s office door."],"hints":["High waterproof rubber boots that extend up to the chest worn by fishermen.","Clue hint: Think about rubber chest waders.","Search for: victor wore waterproof gear to stand in the three-foot floodwaters."],"clues":["Rubber Chest Waders","Item: Rubber Chest Waders","Clue Word: Rubber Chest Waders"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5135c7be-0828-53aa-8e01-3fd2fee3d7ef',
  'story_057',
  'ev_5',
  5,
  '02:02 AM',
  'A stainless steel #10 surgical scalpel is dropped beneath the floating gurney.',
  'A stainless steel #10 surgical scalpel is dropped beneath the floating gurney.',
  'The murder tool was the chief mortician’s personalized hospital scalpel.',
  'Autopsy Scalpel',
  'Surgical knife with disposable blade matching micro-scratches on the corpse’s ribs.',
  '["Kitchen Knife","Pocket Knife","Scissors"]'::jsonb,
  'Autopsy Scalpel',
  '["autopsy scalpel","scalpel","surgical knife","knife"]'::jsonb,
  'A tiny, extremely sharp knife used by surgeons and pathologists during operations.',
  'ev_6',
  true,
  '{"descriptions":["A stainless steel #10 surgical scalpel is dropped beneath the floating gurney.","At 02:02 AM: A stainless steel #10 surgical scalpel is dropped beneath the floating gurney.","Notice this clue: A stainless steel #10 surgical scalpel is dropped beneath the floating gurney."],"hints":["A tiny, extremely sharp knife used by surgeons and pathologists during operations.","Clue hint: Think about autopsy scalpel.","Search for: the murder tool was the chief mortician’s personalized hospital scalpel."],"clues":["Autopsy Scalpel","Item: Autopsy Scalpel","Clue Word: Autopsy Scalpel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '72f52590-c219-56a4-ab41-17b35af50481',
  'story_057',
  'ev_6',
  6,
  '02:10 AM',
  'The basement storm drainage intake valve wheel was manually cranked open.',
  'The basement storm drainage intake valve wheel was manually cranked open.',
  'The flooding was deliberately caused to create confusion and mask the mutilation.',
  'Flood Drainage Valve',
  'Cast-iron water intake valve turned five full rotations to open sewer inflow.',
  '["Water Tap","Gas Pipe","Steam Valve"]'::jsonb,
  'Flood Drainage Valve',
  '["flood drainage valve","valve","drainage valve","flood valve","wheel"]'::jsonb,
  'A heavy circular iron handle on a wall pipe used to open or close water drains.',
  'ev_7',
  false,
  '{"descriptions":["The basement storm drainage intake valve wheel was manually cranked open.","At 02:10 AM: The basement storm drainage intake valve wheel was manually cranked open.","Notice this clue: The basement storm drainage intake valve wheel was manually cranked open."],"hints":["A heavy circular iron handle on a wall pipe used to open or close water drains.","Clue hint: Think about flood drainage valve.","Search for: the flooding was deliberately caused to create confusion and mask the mutilation."],"clues":["Flood Drainage Valve","Item: Flood Drainage Valve","Clue Word: Flood Drainage Valve"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'eaf02756-f06b-5287-8edc-016188fd337f',
  'story_057',
  'ev_7',
  7,
  '02:40 AM',
  'A 10x jeweler’s magnifying loupe is discovered in Victor’s scrub pocket.',
  'A 10x jeweler’s magnifying loupe is discovered in Victor’s scrub pocket.',
  'The mortician inspected the clarity and carat weight of the harvested gems.',
  'Jeweler Loupe',
  'Chrome folding optical magnifying glass with diamond dust residue.',
  '["Eyeglasses","Microscope","Magnifying Glass"]'::jsonb,
  'Jeweler Loupe',
  '["jeweler loupe","loupe","magnifier","lens"]'::jsonb,
  'A small round magnifying lens held close to the eye to inspect precious gems.',
  'ev_8',
  false,
  '{"descriptions":["A 10x jeweler’s magnifying loupe is discovered in Victor’s scrub pocket.","At 02:40 AM: A 10x jeweler’s magnifying loupe is discovered in Victor’s scrub pocket.","Notice this clue: A 10x jeweler’s magnifying loupe is discovered in Victor’s scrub pocket."],"hints":["A small round magnifying lens held close to the eye to inspect precious gems.","Clue hint: Think about jeweler loupe.","Search for: the mortician inspected the clarity and carat weight of the harvested gems."],"clues":["Jeweler Loupe","Item: Jeweler Loupe","Clue Word: Jeweler Loupe"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4a54b13d-205c-5378-900b-b311433f47a7',
  'story_057',
  'ev_8',
  8,
  '03:15 AM',
  'Three bodies on stainless steel gurneys drift across the flooded morgue floor.',
  'Three bodies on stainless steel gurneys drift across the flooded morgue floor.',
  'The floating corpses were let loose to simulate a chaotic structural failure.',
  'Floating Gurneys',
  'Wheeled metal hospital tables drifting in three feet of cold brown floodwater.',
  '["Hospital Beds","Stairs","Wheelchairs"]'::jsonb,
  'Floating Gurneys',
  '["floating gurneys","gurneys","tables","stretchers"]'::jsonb,
  'Metal wheeled tables used in hospitals and morgues to move patients and bodies.',
  NULL,
  true,
  '{"descriptions":["Three bodies on stainless steel gurneys drift across the flooded morgue floor.","At 03:15 AM: Three bodies on stainless steel gurneys drift across the flooded morgue floor.","Notice this clue: Three bodies on stainless steel gurneys drift across the flooded morgue floor."],"hints":["Metal wheeled tables used in hospitals and morgues to move patients and bodies.","Clue hint: Think about floating gurneys.","Search for: the floating corpses were let loose to simulate a chaotic structural failure."],"clues":["Floating Gurneys","Item: Floating Gurneys","Clue Word: Floating Gurneys"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_058 — THE CAMPFIRE FOOTPRINTS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_058',
  'The Campfire Footprints',
  'Horror',
  'Blackwood Lake Campground, pine trees, ashes of an extinguished campfire, misty black water',
  'Barefoot prints circled a family tent four times in the mud and walked directly into the freezing deep lake, with no footsteps returning.',
  '[{"name":"Julian Vance","role":"Brother-in-Law & Co-Camper","alibi":"Asleep in his solo pup-tent beside the fire pit","avatar":"⛺"},{"name":"David Cole (Deceased)","role":"Wealthy Resort Owner","alibi":"Missing person","avatar":"🏊"},{"name":"Ranger Toby Ross","role":"Park Forest Ranger","alibi":"At the park ranger station two miles down the fire road","avatar":"🌲"},{"name":"Detective Clara Reed","role":"Underwater Search & Recovery Investigator","alibi":"Arrived with the police dive boat at 7:00 AM","avatar":"🤿"}]'::jsonb,
  'Julian Vance slipped sleeping sedatives into David’s campfire tea. After David lost consciousness, Julian carried him to the lake shore, put David’s bare feet into the mud to fake a sleepwalking suicide, drowned him in deep water, and swam back using scuba fins.',
  'Brother-in-Law Julian Vance',
  'Julian wanted to inherit David’s lakeside timber resort and eliminate a business rival.',
  '[{"time":"09:30 PM","event":"Julian serves David herbal tea laced with heavy chloral hydrate sedative."},{"time":"10:45 PM","event":"David passes out inside his sleeping bag in the family tent."},{"time":"01:30 AM","event":"Julian presses David’s bare feet into the mud around the tent to fake tracks."},{"time":"01:45 AM","event":"Julian carries David into the lake, holds him under, and swims back using scuba gear."},{"time":"06:00 AM","event":"Julian calls the park rangers, claiming David sleepwalked into the lake."}]'::jsonb,
  '[{"id":"ev1","title":"Neoprene Scuba Fin Strap in Lilies","detail":"Matches the Mares diving fin missing its strap in Julian’s car trunk."},{"id":"ev2","title":"Pony Scuba Tank in Car Trunk","detail":"Partially depleted air tank showing exact usage corresponding to a 15-minute swim."},{"id":"ev3","title":"Campfire Mug Sedative Residue","detail":"Toxicology confirms chloral hydrate identical to the drugs in David’s bloodstream."},{"id":"ev4","title":"Resort Partnership Survivorship Clause","detail":"Proves Julian stood to inherit full control of the multi-million-dollar lakeside resort."}]'::jsonb,
  '[{"order":1,"title":"Circling Footprints","text":"Bare footsteps artificially pressed into the campsite mud around the tent."},{"order":2,"title":"Vanishing Lake Tracks","text":"Footprints that walk directly into the freezing water without returning."},{"order":3,"title":"Scuba Fin Strap","text":"Rubber flipper piece dropped in the water weeds by the swimmer."},{"order":4,"title":"Campfire Mug","text":"Metal cup containing the sleeping sedative used to knock David out."},{"order":5,"title":"Pony Scuba Tank","text":"Compact underwater breathing tank hidden inside the brother-in-law’s car."},{"order":6,"title":"Resort Buyout Agreement","text":"Contract transferring full ownership of the resort upon David’s death."}]'::jsonb,
  'Ranger Toby was awake at 2:00 AM.: He was patrolling the fire road and had no motive to harm the campers.; Campers reported seeing mysterious lights across the lake.: Reflections from distant highway trucks on the far shore.',
  'Claim a lake demon lured David into the water or blame the camp ranger.',
  'NORMAL',
  'Did camper David drown himself in a trance, or did an outside killer stage a lake vanishing?',
  '[{"character":"Julian Vance","secret":"He hid a compact scuba diving pony bottle and dive fins in his car trunk."},{"character":"David Cole (Deceased)","secret":"He had discovered Julian was falsifying resort construction bids."},{"character":"Ranger Toby Ross","secret":"He saw Julian’s car headlights on near the boat dock at 2:00 AM."},{"character":"Detective Clara Reed","secret":"Certified master diver with ten years of lake recovery experience."}]'::jsonb,
  '[{"lead":"Ranger Toby was awake at 2:00 AM.","explanation":"He was patrolling the fire road and had no motive to harm the campers."},{"lead":"Campers reported seeing mysterious lights across the lake.","explanation":"Reflections from distant highway trucks on the far shore."}]'::jsonb,
  '{"wrongTheories":["A mythical lake serpent or water demon lured David into the water under a trance.","David was a chronic sleepwalker who accidentally drowned in the dark."],"correctTheory":"Brother-in-law Julian Vance drugged David’s campfire tea with chloral hydrate, staged fake sleepwalking footprints leading into the lake, carried David out to drown him, and swam back using scuba gear to inherit the multi-million-dollar lakeside resort."}'::jsonb,
  'Brother-in-law Julian drugged David, faked the tracks, and drowned him using scuba gear!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Reed matched the fin strap to the gear in Julian’s trunk and extracted the dive computer log. Julian was arrested for first-degree murder and insurance fraud."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The coroner ruled the death an accidental sleepwalking drowning. Julian inherited the resort and sold the lakefront to developers for millions."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The lake was closed to the public as \"The Drowning Water.\" Julian operated paid paranormal boat tours while enjoying his stolen fortune."}]'::jsonb,
  '{"intros":["Barefoot prints circled a family tent four times in the mud and walked directly into the freezing deep lake, with no footsteps returning.","Case file story_058: Barefoot prints circled a family tent four times in the mud and walked directly into the freezing deep lake, with no footsteps returning. Look closely at every clue.","Trouble begins in Blackwood Lake Campground, pine trees, ashes of an extinguished campfire, misty black water. Barefoot prints circled a family tent four times in the mud and walked directly into the freezing deep lake, with no footsteps returning.","The mystery starts now. Barefoot prints circled a family tent four times in the mud and walked directly into the freezing deep lake, with no footsteps returning. Can you solve it?"],"reveals":["Brother-in-law Julian drugged David, faked the tracks, and drowned him using scuba gear!","The mystery is unraveled! Brother-in-law Julian drugged David, faked the tracks, and drowned him using scuba gear!","At last, the truth comes out: Brother-in-law Julian drugged David, faked the tracks, and drowned him using scuba gear!","Case resolved! Here is what happened: Brother-in-law Julian drugged David, faked the tracks, and drowned him using scuba gear!"],"hints":["Pay attention to where Brother-in-Law Julian Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_058';
DELETE FROM public.case_events WHERE case_id = 'story_058';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd0ccf273-3705-5407-b94d-3331ba68f090',
  'story_058',
  'Julian Vance',
  'Brother-in-Law & Co-Camper',
  'Nervous, overly dramatic, shivering in a fleece jacket by the cold ashes',
  'David had nightmares about the lake. He must have sleepwalked straight into the black water.',
  'He hid a compact scuba diving pony bottle and dive fins in his car trunk.',
  'Asleep in his solo pup-tent beside the fire pit',
  'Business partner and brother-in-law of the missing camper',
  'The lake drops off sixty feet deep just ten yards from the shore.',
  'Did not know he dropped a neoprene scuba fin strap in the water reeds.',
  '⛺',
  '["David had nightmares about the lake. He must have sleepwalked straight into the black water.","\"David had nightmares about the lake. He must have sleepwalked straight into the black water.\"","Listen to me: David had nightmares about the lake. He must have sleepwalked straight into the black water.","I tell you the truth: David had nightmares about the lake. He must have sleepwalked straight into the black water."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '85882276-740e-530b-9117-a496cbb1d535',
  'story_058',
  'David Cole (Deceased)',
  'Wealthy Resort Owner',
  'Fit, outdoorsman, missing beneath the dark surface of the lake',
  'Victim deceased; body submerged in sixty feet of water near the drop-off.',
  'He had discovered Julian was falsifying resort construction bids.',
  'Missing person',
  'Target of the staged drowning murder',
  'His campfire tea tasted strongly of bitter almond powder.',
  'Did not expect his brother-in-law to drown him in his sleep.',
  '🏊',
  '["Victim deceased; body submerged in sixty feet of water near the drop-off.","\"Victim deceased; body submerged in sixty feet of water near the drop-off.\"","Listen to me: Victim deceased; body submerged in sixty feet of water near the drop-off.","I tell you the truth: Victim deceased; body submerged in sixty feet of water near the drop-off."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fa1ac11a-1a2a-56cd-94aa-44adfb2ba618',
  'story_058',
  'Ranger Toby Ross',
  'Park Forest Ranger',
  'Practical, observant, carrying a heavy timber flashlight and radio',
  'Sleepwalkers do not circle a tent in tight circles before heading into sixty-degree lake water.',
  'He saw Julian’s car headlights on near the boat dock at 2:00 AM.',
  'At the park ranger station two miles down the fire road',
  'Responded to Julian’s emergency 911 call at dawn',
  'The footprints show heavy downward pressure, consistent with carrying a body.',
  'Did not know Julian had scuba equipment in his trunk.',
  '🌲',
  '["Sleepwalkers do not circle a tent in tight circles before heading into sixty-degree lake water.","\"Sleepwalkers do not circle a tent in tight circles before heading into sixty-degree lake water.\"","Listen to me: Sleepwalkers do not circle a tent in tight circles before heading into sixty-degree lake water.","I tell you the truth: Sleepwalkers do not circle a tent in tight circles before heading into sixty-degree lake water."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '32423558-fd16-55ae-b51f-ea8b7a4ee634',
  'story_058',
  'Detective Clara Reed',
  'Underwater Search & Recovery Investigator',
  'Sharp, athletic, wearing a drysuit and dive computer',
  'Water in the victim’s lungs shows chloral hydrate sleeping sedative.',
  'Certified master diver with ten years of lake recovery experience.',
  'Arrived with the police dive boat at 7:00 AM',
  'Leading the underwater recovery and forensic search',
  'Found fin propulsion silt marks on the lake bed.',
  'Did not immediately have a warrant to open Julian’s locked vehicle trunk.',
  '🤿',
  '["Water in the victim’s lungs shows chloral hydrate sleeping sedative.","\"Water in the victim’s lungs shows chloral hydrate sleeping sedative.\"","Listen to me: Water in the victim’s lungs shows chloral hydrate sleeping sedative.","I tell you the truth: Water in the victim’s lungs shows chloral hydrate sleeping sedative."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9ea3a532-0157-5b11-bb71-3729d249293d',
  'story_058',
  'ev_1',
  1,
  '01:30 AM',
  'Bare human footprints circle the canvas tent four times in muddy pine needles.',
  'Bare human footprints circle the canvas tent four times in muddy pine needles.',
  'The tracks were pressed artificially into the mud to fake a sleepwalker’s confusion.',
  'Circling Footprints',
  'Deep bare foot impressions showing zero toe-splay and abnormal weight distribution.',
  '["Shoe Tracks","Animal Prints","Boot Scuffs"]'::jsonb,
  'Circling Footprints',
  '["circling footprints","footprints","bare footprints","tracks"]'::jsonb,
  'Marks of bare human feet pressed in circular paths around a tent.',
  'ev_2',
  true,
  '{"descriptions":["Bare human footprints circle the canvas tent four times in muddy pine needles.","At 01:30 AM: Bare human footprints circle the canvas tent four times in muddy pine needles.","Notice this clue: Bare human footprints circle the canvas tent four times in muddy pine needles."],"hints":["Marks of bare human feet pressed in circular paths around a tent.","Clue hint: Think about circling footprints.","Search for: the tracks were pressed artificially into the mud to fake a sleepwalker’s confusion."],"clues":["Circling Footprints","Item: Circling Footprints","Clue Word: Circling Footprints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f51aef7d-7599-539e-887e-9a1ac3642cea',
  'story_058',
  'ev_2',
  2,
  '01:45 AM',
  'The bare footprints lead in a straight line into the lake reeds and vanish in deep water.',
  'The bare footprints lead in a straight line into the lake reeds and vanish in deep water.',
  'There are no return footprints exiting the lake back onto the shore.',
  'Vanishing Lake Tracks',
  'Footprints ending abruptly where the sandy bottom drops into dark black water.',
  '["Boat Scrape","Drag Mark","Bicycle Skid"]'::jsonb,
  'Vanishing Lake Tracks',
  '["vanishing lake tracks","tracks","lake tracks","vanishing tracks","water tracks"]'::jsonb,
  'Footsteps that lead into deep water and stop completely.',
  'ev_3',
  false,
  '{"descriptions":["The bare footprints lead in a straight line into the lake reeds and vanish in deep water.","At 01:45 AM: The bare footprints lead in a straight line into the lake reeds and vanish in deep water.","Notice this clue: The bare footprints lead in a straight line into the lake reeds and vanish in deep water."],"hints":["Footsteps that lead into deep water and stop completely.","Clue hint: Think about vanishing lake tracks.","Search for: there are no return footprints exiting the lake back onto the shore."],"clues":["Vanishing Lake Tracks","Item: Vanishing Lake Tracks","Clue Word: Vanishing Lake Tracks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a2e36e6b-d180-547d-86f0-c64e1a43ba06',
  'story_058',
  'ev_3',
  3,
  '02:00 AM',
  'A black neoprene rubber scuba diving fin strap is tangled in the water lilies.',
  'A black neoprene rubber scuba diving fin strap is tangled in the water lilies.',
  'The killer used diving fins to swim back to shore without leaving footprints.',
  'Scuba Fin Strap',
  'Heavy black rubber flipper heel strap stamped "AQUALUNG PRO".',
  '["Fish Net","Rope","Life Jacket"]'::jsonb,
  'Scuba Fin Strap',
  '["scuba fin strap","strap","fin strap","scuba strap","rubber strap"]'::jsonb,
  'A flexible rubber band that secures a swimmer’s flipper onto their foot.',
  'ev_4',
  false,
  '{"descriptions":["A black neoprene rubber scuba diving fin strap is tangled in the water lilies.","At 02:00 AM: A black neoprene rubber scuba diving fin strap is tangled in the water lilies.","Notice this clue: A black neoprene rubber scuba diving fin strap is tangled in the water lilies."],"hints":["A flexible rubber band that secures a swimmer’s flipper onto their foot.","Clue hint: Think about scuba fin strap.","Search for: the killer used diving fins to swim back to shore without leaving footprints."],"clues":["Scuba Fin Strap","Item: Scuba Fin Strap","Clue Word: Scuba Fin Strap"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '90ded088-f025-5fe2-90ae-212b51f8db4d',
  'story_058',
  'ev_4',
  4,
  '02:15 AM',
  'An empty enamel campfire mug smells of sweet herbal tea and chloral hydrate.',
  'An empty enamel campfire mug smells of sweet herbal tea and chloral hydrate.',
  'David was drugged before being carried down into the water.',
  'Campfire Mug',
  'Blue speckled metal camping mug with sedative residue in the bottom.',
  '["Coffee Pot","Water Bottle","Beer Can"]'::jsonb,
  'Campfire Mug',
  '["campfire mug","mug","tea mug","cup"]'::jsonb,
  'A metal drinking cup used around campfires for hot coffee or tea.',
  'ev_5',
  false,
  '{"descriptions":["An empty enamel campfire mug smells of sweet herbal tea and chloral hydrate.","At 02:15 AM: An empty enamel campfire mug smells of sweet herbal tea and chloral hydrate.","Notice this clue: An empty enamel campfire mug smells of sweet herbal tea and chloral hydrate."],"hints":["A metal drinking cup used around campfires for hot coffee or tea.","Clue hint: Think about campfire mug.","Search for: david was drugged before being carried down into the water."],"clues":["Campfire Mug","Item: Campfire Mug","Clue Word: Campfire Mug"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '160239d2-64c1-5e9d-ac91-08d912670ea5',
  'story_058',
  'ev_5',
  5,
  '07:30 AM',
  'A compact aluminum pony scuba tank and regulator are hidden in Julian’s trunk.',
  'A compact aluminum pony scuba tank and regulator are hidden in Julian’s trunk.',
  'Julian had underwater breathing gear to swim back under the surface unseen.',
  'Pony Scuba Tank',
  'Yellow 19-cubic-foot emergency dive cylinder with breathing mouthpiece.',
  '["Fire Extinguisher","Gas Tank","Propane Can"]'::jsonb,
  'Pony Scuba Tank',
  '["pony scuba tank","scuba tank","pony tank","tank","dive tank"]'::jsonb,
  'A small metal tank filled with compressed air for breathing underwater.',
  'ev_6',
  true,
  '{"descriptions":["A compact aluminum pony scuba tank and regulator are hidden in Julian’s trunk.","At 07:30 AM: A compact aluminum pony scuba tank and regulator are hidden in Julian’s trunk.","Notice this clue: A compact aluminum pony scuba tank and regulator are hidden in Julian’s trunk."],"hints":["A small metal tank filled with compressed air for breathing underwater.","Clue hint: Think about pony scuba tank.","Search for: julian had underwater breathing gear to swim back under the surface unseen."],"clues":["Pony Scuba Tank","Item: Pony Scuba Tank","Clue Word: Pony Scuba Tank"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bff4aa07-7860-5b15-bd33-fdefa0e22f3b',
  'story_058',
  'ev_6',
  6,
  '08:00 AM',
  'David’s body is recovered sixty feet deep with water and sedative in his lungs.',
  'David’s body is recovered sixty feet deep with water and sedative in his lungs.',
  'Medical proof that David was unconscious when he entered the water.',
  'Toxicology Report',
  'Forensic coroner report showing fatal levels of sleep sedative in blood.',
  '["Autopsy Chart","Death Certificate","X-Ray"]'::jsonb,
  'Toxicology Report',
  '["toxicology report","report","blood test","lab report"]'::jsonb,
  'A scientific paper showing what drugs or poisons were inside a drowned body.',
  'ev_7',
  false,
  '{"descriptions":["David’s body is recovered sixty feet deep with water and sedative in his lungs.","At 08:00 AM: David’s body is recovered sixty feet deep with water and sedative in his lungs.","Notice this clue: David’s body is recovered sixty feet deep with water and sedative in his lungs."],"hints":["A scientific paper showing what drugs or poisons were inside a drowned body.","Clue hint: Think about toxicology report.","Search for: medical proof that david was unconscious when he entered the water."],"clues":["Toxicology Report","Item: Toxicology Report","Clue Word: Toxicology Report"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5eefc3cc-a37a-5d05-92b6-70cf48939302',
  'story_058',
  'ev_7',
  7,
  '08:30 AM',
  'A multi-million-dollar buyout contract for the lakeside timber resort is in Julian’s glovebox.',
  'A multi-million-dollar buyout contract for the lakeside timber resort is in Julian’s glovebox.',
  'Julian inherited full sole ownership of the resort upon David’s death.',
  'Resort Buyout Agreement',
  'Signed partnership contract with a survivorship clause granting Julian the property.',
  '["Camp Permit","Car Registration","Receipt"]'::jsonb,
  'Resort Buyout Agreement',
  '["resort buyout agreement","agreement","buyout agreement","contract","resort contract"]'::jsonb,
  'A legal document showing who inherits a valuable business if one partner dies.',
  'ev_8',
  false,
  '{"descriptions":["A multi-million-dollar buyout contract for the lakeside timber resort is in Julian’s glovebox.","At 08:30 AM: A multi-million-dollar buyout contract for the lakeside timber resort is in Julian’s glovebox.","Notice this clue: A multi-million-dollar buyout contract for the lakeside timber resort is in Julian’s glovebox."],"hints":["A legal document showing who inherits a valuable business if one partner dies.","Clue hint: Think about resort buyout agreement.","Search for: julian inherited full sole ownership of the resort upon david’s death."],"clues":["Resort Buyout Agreement","Item: Resort Buyout Agreement","Clue Word: Resort Buyout Agreement"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0d9ac43b-f00f-5fdc-8fdd-76824a107f01',
  'story_058',
  'ev_8',
  8,
  '09:00 AM',
  'Underwater dive computer logs show a 15-minute submerged swim at 1:45 AM.',
  'Underwater dive computer logs show a 15-minute submerged swim at 1:45 AM.',
  'Digital proof that someone operated diving gear in the lake during the murder window.',
  'Dive Computer Log',
  'Wristwatch-sized dive computer showing depth profile of 20 feet at 1:45 AM.',
  '["GPS Watch","Heart Monitor","Smart Watch"]'::jsonb,
  'Dive Computer Log',
  '["dive computer log","dive computer","log","dive log","computer log"]'::jsonb,
  'An electronic waterproof wristwatch that records depth and time spent underwater.',
  NULL,
  true,
  '{"descriptions":["Underwater dive computer logs show a 15-minute submerged swim at 1:45 AM.","At 09:00 AM: Underwater dive computer logs show a 15-minute submerged swim at 1:45 AM.","Notice this clue: Underwater dive computer logs show a 15-minute submerged swim at 1:45 AM."],"hints":["An electronic waterproof wristwatch that records depth and time spent underwater.","Clue hint: Think about dive computer log.","Search for: digital proof that someone operated diving gear in the lake during the murder window."],"clues":["Dive Computer Log","Item: Dive Computer Log","Clue Word: Dive Computer Log"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_059 — THE CURSED CAMERA FILM
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_059',
  'The Cursed Camera Film',
  'Horror',
  'The Darkroom at Hawthorne Manor, red safelight, trays of chemical developer, dripping photographs',
  'Photographer Arthur developed a roll of 35mm film; in each consecutive photo, a hooded figure in the background moved closer, until the final photo showed the figure standing behind his darkroom chair.',
  '[{"name":"Felix Vance","role":"Darkroom Assistant & Apprentice","alibi":"In the chemical mixing pantry preparing developer fluid","avatar":"🎞️"},{"name":"Arthur Cole","role":"Master Fine-Art Photographer","alibi":"Trapped inside the darkroom developing film","avatar":"📷"},{"name":"Clara Sterling","role":"Art Gallery Curator","alibi":"Arrived at the front reception hall at midnight","avatar":"🖼️"},{"name":"Detective Frank Rossi","role":"Forensic Photography Specialist","alibi":"Dispatched to the darkroom following Clara’s 911 emergency call","avatar":"🔍"}]'::jsonb,
  'Darkroom assistant Felix Vance double-exposed a roll of 35mm film with sequential images of himself wearing a dark burlap shroud. When Arthur developed the pictures, the hooded figure appeared to march toward him, while Felix silently slipped into the darkroom to stage the final terrifying confrontation.',
  'Assistant Felix Vance',
  'Felix wanted to drive Arthur to madness and suicide to steal his collection of rare vintage photographic negatives.',
  '[{"time":"08:00 PM","event":"Felix double-exposes thirty-six frames on a roll of Ilford HP5 film using a black backdrop."},{"time":"10:00 PM","event":"Arthur loads the prepared roll into his camera and shoots outdoor street scenes."},{"time":"11:30 PM","event":"Arthur enters the darkroom to develop the film under the red safelight."},{"time":"11:45 PM","event":"The images appear in the developer tray; the hooded figure steps closer frame by frame."},{"time":"12:05 AM","event":"Felix enters the darkroom wearing the shroud to stage the heart-stopping climax."}]'::jsonb,
  '[{"id":"ev1","title":"Double-Exposure Shutter Curtain Artifacts","detail":"Forensic photography analysis proves the ghost images were pre-exposed onto the film."},{"id":"ev2","title":"Black Wool Shroud in Pantry","detail":"Matches the exact garment worn in the 36 consecutive negative frames."},{"id":"ev3","title":"Felix’s Exposure Notebook","detail":"Contains handwritten calculations planning the visual \"approach\" of the phantom."},{"id":"ev4","title":"One-Million-Dollar Daguerreotype Collection","detail":"Recovered from Felix Vance’s locker, establishing the motive for driving Arthur away."}]'::jsonb,
  '[{"order":1,"title":"Sequential Negatives","text":"Film strip showing a hooded phantom stepping closer with every shot."},{"order":2,"title":"Hooded Black Shroud","text":"The costume worn by the assistant to stage the terrifying darkroom trick."},{"order":3,"title":"Rangefinder Camera","text":"Vintage mechanical camera capable of manual double-exposure manipulation."},{"order":4,"title":"Chemical Tray Fibers","text":"Shroud threads dropped into the liquid developer bath during the encounter."},{"order":5,"title":"Daguerreotype Collection","text":"Priceless historical photographs stolen by the apprentice."},{"order":6,"title":"Exposure Notebook","text":"Step-by-step notes calculating the lighting ratios for the fake ghost."}]'::jsonb,
  'Curator Clara arrived late at night.: She was arriving to buy the collection legitimately with bank checks.; The darkroom smelled of sharp acetic acid.: Standard vinegar smell of photographic stop-bath chemicals.',
  'Claim a genuine darkroom demon was summoned by silver chemicals or blame the photography client.',
  'NORMAL',
  'Was the film cursed by a phantom entity, or was an intruder playing an optical death game?',
  '[{"character":"Felix Vance","secret":"He hid Arthur’s multi-million-dollar early daguerreotype negative collection in his locker."},{"character":"Arthur Cole","secret":"He was planning to fire Felix for stealing historical archival prints."},{"character":"Clara Sterling","secret":"She was arriving to purchase the vintage daguerreotype collection for one million dollars."},{"character":"Detective Frank Rossi","secret":"Former police surveillance photographer for fifteen years."}]'::jsonb,
  '[{"lead":"Curator Clara arrived late at night.","explanation":"She was arriving to buy the collection legitimately with bank checks."},{"lead":"The darkroom smelled of sharp acetic acid.","explanation":"Standard vinegar smell of photographic stop-bath chemicals."}]'::jsonb,
  '{"wrongTheories":["An ancient malevolent darkroom entity was summoned by the silver halide crystals.","Arthur suffered a severe psychotic hallucination and imagined the figures on the film."],"correctTheory":"Apprentice Felix Vance pre-exposed a roll of 35mm film with sequential images of himself wearing a black shroud, luring Arthur into developing the \"cursed\" film to induce a psychological breakdown and steal his million-dollar daguerreotype collection."}'::jsonb,
  'Assistant Felix Vance faked the advancing ghost on film to steal rare daguerreotypes!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Rossi proved the double-exposure under the loupe and recovered the stolen daguerreotypes from Felix’s locker. Felix was arrested for grand larceny and psychological assault."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Arthur suffered a fatal heart attack from sheer terror in the darkroom. Felix took the million-dollar daguerreotypes and sold them to private collectors in Europe."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The \"Haunted Negative of St. Jude\" was published worldwide in paranormal magazines. Felix became a celebrated author on photographic occultism."}]'::jsonb,
  '{"intros":["Photographer Arthur developed a roll of 35mm film; in each consecutive photo, a hooded figure in the background moved closer, until the final photo showed the figure standing behind his darkroom chair.","Case file story_059: Photographer Arthur developed a roll of 35mm film; in each consecutive photo, a hooded figure in the background moved closer, until the final photo showed the figure standing behind his darkroom chair. Look closely at every clue.","Trouble begins in The Darkroom at Hawthorne Manor, red safelight, trays of chemical developer, dripping photographs. Photographer Arthur developed a roll of 35mm film; in each consecutive photo, a hooded figure in the background moved closer, until the final photo showed the figure standing behind his darkroom chair.","The mystery starts now. Photographer Arthur developed a roll of 35mm film; in each consecutive photo, a hooded figure in the background moved closer, until the final photo showed the figure standing behind his darkroom chair. Can you solve it?"],"reveals":["Assistant Felix Vance faked the advancing ghost on film to steal rare daguerreotypes!","The mystery is unraveled! Assistant Felix Vance faked the advancing ghost on film to steal rare daguerreotypes!","At last, the truth comes out: Assistant Felix Vance faked the advancing ghost on film to steal rare daguerreotypes!","Case resolved! Here is what happened: Assistant Felix Vance faked the advancing ghost on film to steal rare daguerreotypes!"],"hints":["Pay attention to where Assistant Felix Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_059';
DELETE FROM public.case_events WHERE case_id = 'story_059';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1f914062-03a9-5949-ac6a-813b0fec7c76',
  'story_059',
  'Felix Vance',
  'Darkroom Assistant & Apprentice',
  'Quiet, obsequious, smelling of acetic stop-bath and silver fixer, nervous twitch',
  'The film was sealed in an antique brass canister. The darkroom spirits have manifested on the emulsion.',
  'He hid Arthur’s multi-million-dollar early daguerreotype negative collection in his locker.',
  'In the chemical mixing pantry preparing developer fluid',
  'Apprentice to master photographer Arthur Cole',
  'Double-exposure can be executed cleanly on a vintage Leica M3 camera.',
  'Did not know his dark hooded shroud left wool fibers in the developing chemical tray.',
  '🎞️',
  '["The film was sealed in an antique brass canister. The darkroom spirits have manifested on the emulsion.","\"The film was sealed in an antique brass canister. The darkroom spirits have manifested on the emulsion.\"","Listen to me: The film was sealed in an antique brass canister. The darkroom spirits have manifested on the emulsion.","I tell you the truth: The film was sealed in an antique brass canister. The darkroom spirits have manifested on the emulsion."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '76b77947-decc-5353-9ba6-8fbaac1625c1',
  'story_059',
  'Arthur Cole',
  'Master Fine-Art Photographer',
  'Obsessive, brilliant, terrified, clutching a red darkroom lamp with shaking hands',
  'In frame twelve it was by the trees. In frame twenty it was at the door. In frame thirty-six it is behind me!',
  'He was planning to fire Felix for stealing historical archival prints.',
  'Trapped inside the darkroom developing film',
  'Victim targeted by the optical psychological terror',
  'The chemical timing of the developer was strictly six minutes at 20 degrees Celsius.',
  'Did not realize the roll was pre-exposed before he loaded it into his camera.',
  '📷',
  '["In frame twelve it was by the trees. In frame twenty it was at the door. In frame thirty-six it is behind me!","\"In frame twelve it was by the trees. In frame twenty it was at the door. In frame thirty-six it is behind me!\"","Listen to me: In frame twelve it was by the trees. In frame twenty it was at the door. In frame thirty-six it is behind me!","I tell you the truth: In frame twelve it was by the trees. In frame twenty it was at the door. In frame thirty-six it is behind me!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5645e773-54b5-5f97-b8ae-4b1cc740888e',
  'story_059',
  'Clara Sterling',
  'Art Gallery Curator',
  'Elegant, observant, holding an archival photo inspection loupe',
  'Arthur called me at 11:00 PM in total hysteria saying his own photographs were coming to kill him.',
  'She was arriving to purchase the vintage daguerreotype collection for one million dollars.',
  'Arrived at the front reception hall at midnight',
  'Buyer of Arthur’s rare historical photograph collection',
  'Saw Felix carrying a dark woolen bundle toward the laundry room.',
  'Did not know the bundle was the hooded shroud used in the photos.',
  '🖼️',
  '["Arthur called me at 11:00 PM in total hysteria saying his own photographs were coming to kill him.","\"Arthur called me at 11:00 PM in total hysteria saying his own photographs were coming to kill him.\"","Listen to me: Arthur called me at 11:00 PM in total hysteria saying his own photographs were coming to kill him.","I tell you the truth: Arthur called me at 11:00 PM in total hysteria saying his own photographs were coming to kill him."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b946dce4-26fa-5134-8622-d99e5cf0b890',
  'story_059',
  'Detective Frank Rossi',
  'Forensic Photography Specialist',
  'Methodical, sharp, examines chemical silver density under a microscope',
  'Photons don’t manifest ghosts. What we have here is an expert double-exposure masking technique.',
  'Former police surveillance photographer for fifteen years.',
  'Dispatched to the darkroom following Clara’s 911 emergency call',
  'Leading the investigation into the darkroom attack',
  'Found dual shutter-curtain acceleration lines on the negative rebate.',
  'Did not immediately locate where the stolen daguerreotypes were stashed.',
  '🔍',
  '["Photons don’t manifest ghosts. What we have here is an expert double-exposure masking technique.","\"Photons don’t manifest ghosts. What we have here is an expert double-exposure masking technique.\"","Listen to me: Photons don’t manifest ghosts. What we have here is an expert double-exposure masking technique.","I tell you the truth: Photons don’t manifest ghosts. What we have here is an expert double-exposure masking technique."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '99936e67-e779-5d16-8e20-e179da9ea133',
  'story_059',
  'ev_1',
  1,
  '11:45 PM',
  'A wet strip of 35mm film negatives hangs from clips, showing a hooded figure advancing frame by frame.',
  'A wet strip of 35mm film negatives hangs from clips, showing a hooded figure advancing frame by frame.',
  'The film was pre-exposed with thirty-six sequential images of a phantom.',
  'Sequential Negatives',
  '35mm black-and-white negative strip showing dual exposure density lines.',
  '["Color Print","Digital File","Photo Paper"]'::jsonb,
  'Sequential Negatives',
  '["sequential negatives","negatives","film","film strip","negative strip"]'::jsonb,
  'A plastic strip of camera film with dark and clear inverted images.',
  'ev_2',
  true,
  '{"descriptions":["A wet strip of 35mm film negatives hangs from clips, showing a hooded figure advancing frame by frame.","At 11:45 PM: A wet strip of 35mm film negatives hangs from clips, showing a hooded figure advancing frame by frame.","Notice this clue: A wet strip of 35mm film negatives hangs from clips, showing a hooded figure advancing frame by frame."],"hints":["A plastic strip of camera film with dark and clear inverted images.","Clue hint: Think about sequential negatives.","Search for: the film was pre-exposed with thirty-six sequential images of a phantom."],"clues":["Sequential Negatives","Item: Sequential Negatives","Clue Word: Sequential Negatives"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c90f762c-12ff-521d-b738-2aa80213fab7',
  'story_059',
  'ev_2',
  2,
  '11:48 PM',
  'A coarse black wool hooded shroud is found stuffed behind the chemical carboys.',
  'A coarse black wool hooded shroud is found stuffed behind the chemical carboys.',
  'The exact costume worn by the figure in the frightening photographs.',
  'Hooded Black Shroud',
  'Heavy black wool cape with hood smelling of stop-bath chemicals.',
  '["Lab Coat","Raincoat","Trenchcoat"]'::jsonb,
  'Hooded Black Shroud',
  '["hooded black shroud","shroud","hooded shroud","black shroud","cape","costume"]'::jsonb,
  'A long black cloth garment with a head hood used to hide a person’s face.',
  'ev_3',
  false,
  '{"descriptions":["A coarse black wool hooded shroud is found stuffed behind the chemical carboys.","At 11:48 PM: A coarse black wool hooded shroud is found stuffed behind the chemical carboys.","Notice this clue: A coarse black wool hooded shroud is found stuffed behind the chemical carboys."],"hints":["A long black cloth garment with a head hood used to hide a person’s face.","Clue hint: Think about hooded black shroud.","Search for: the exact costume worn by the figure in the frightening photographs."],"clues":["Hooded Black Shroud","Item: Hooded Black Shroud","Clue Word: Hooded Black Shroud"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2d51fedb-ae35-5c34-8958-df89a4e7e111',
  'story_059',
  'ev_3',
  3,
  '11:50 PM',
  'A vintage Leica M3 35mm rangefinder camera sits on the light table.',
  'A vintage Leica M3 35mm rangefinder camera sits on the light table.',
  'The camera had a double-exposure override lever disengaged to allow layered frames.',
  'Rangefinder Camera',
  'Silver mechanical 35mm camera with manual double-stroke film advance.',
  '["Digital Camera","Video Camera","Box Camera"]'::jsonb,
  'Rangefinder Camera',
  '["rangefinder camera","camera","leica","35mm camera"]'::jsonb,
  'A classic mechanical metal camera used to take pictures on rolls of film.',
  'ev_4',
  false,
  '{"descriptions":["A vintage Leica M3 35mm rangefinder camera sits on the light table.","At 11:50 PM: A vintage Leica M3 35mm rangefinder camera sits on the light table.","Notice this clue: A vintage Leica M3 35mm rangefinder camera sits on the light table."],"hints":["A classic mechanical metal camera used to take pictures on rolls of film.","Clue hint: Think about rangefinder camera.","Search for: the camera had a double-exposure override lever disengaged to allow layered frames."],"clues":["Rangefinder Camera","Item: Rangefinder Camera","Clue Word: Rangefinder Camera"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2ff336ac-d3f5-5fb0-a166-5ab179ad722a',
  'story_059',
  'ev_4',
  4,
  '11:55 PM',
  'Dark black woolen fibers from the shroud are floating in the developer chemical tray.',
  'Dark black woolen fibers from the shroud are floating in the developer chemical tray.',
  'The person wearing the shroud was physically standing directly over the chemical bath.',
  'Chemical Tray Fibers',
  'Black sheep wool fibers retrieved from the hydroquinone developer liquid.',
  '["Cotton Threads","Hair","Paper Dust"]'::jsonb,
  'Chemical Tray Fibers',
  '["chemical tray fibers","fibers","wool fibers","shroud fibers","tray fibers"]'::jsonb,
  'Tiny threads from clothing found floating in liquid chemical dishes.',
  'ev_5',
  false,
  '{"descriptions":["Dark black woolen fibers from the shroud are floating in the developer chemical tray.","At 11:55 PM: Dark black woolen fibers from the shroud are floating in the developer chemical tray.","Notice this clue: Dark black woolen fibers from the shroud are floating in the developer chemical tray."],"hints":["Tiny threads from clothing found floating in liquid chemical dishes.","Clue hint: Think about chemical tray fibers.","Search for: the person wearing the shroud was physically standing directly over the chemical bath."],"clues":["Chemical Tray Fibers","Item: Chemical Tray Fibers","Clue Word: Chemical Tray Fibers"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b1db6451-05ce-503c-9068-956332faa9ab',
  'story_059',
  'ev_5',
  5,
  '12:00 AM',
  'A locked metal archive box containing fifty priceless 1850s daguerreotypes is in Felix’s locker.',
  'A locked metal archive box containing fifty priceless 1850s daguerreotypes is in Felix’s locker.',
  'The motive for the psychological assault: stealing a million-dollar antique collection.',
  'Daguerreotype Collection',
  'Velvet-lined wooden cases holding historic polished silver-plated copper photographs.',
  '["Cash Box","Jewelry Box","Stamp Album"]'::jsonb,
  'Daguerreotype Collection',
  '["daguerreotype collection","daguerreotypes","collection","antique photos","photos","archive box"]'::jsonb,
  'Rare antique photographs from the 1800s made on mirror-like silver metal plates.',
  'ev_6',
  true,
  '{"descriptions":["A locked metal archive box containing fifty priceless 1850s daguerreotypes is in Felix’s locker.","At 12:00 AM: A locked metal archive box containing fifty priceless 1850s daguerreotypes is in Felix’s locker.","Notice this clue: A locked metal archive box containing fifty priceless 1850s daguerreotypes is in Felix’s locker."],"hints":["Rare antique photographs from the 1800s made on mirror-like silver metal plates.","Clue hint: Think about daguerreotype collection.","Search for: the motive for the psychological assault: stealing a million-dollar antique collection."],"clues":["Daguerreotype Collection","Item: Daguerreotype Collection","Clue Word: Daguerreotype Collection"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '273bab69-cba8-5800-b318-a8654dcec7af',
  'story_059',
  'ev_6',
  6,
  '12:10 AM',
  'A red glowing darkroom safelight bulb casts deep crimson shadows across the tile walls.',
  'A red glowing darkroom safelight bulb casts deep crimson shadows across the tile walls.',
  'The dim red light masked Felix’s approach as he entered the darkroom.',
  'Red Safelight Bulb',
  '15-watt red ceramic light bulb providing minimal illumination.',
  '["White Light","Fluorescent Tube","Lantern"]'::jsonb,
  'Red Safelight Bulb',
  '["red safelight bulb","safelight","red light","bulb","safelight bulb"]'::jsonb,
  'A special dim red light bulb used in photography darkrooms that does not ruin paper.',
  'ev_7',
  false,
  '{"descriptions":["A red glowing darkroom safelight bulb casts deep crimson shadows across the tile walls.","At 12:10 AM: A red glowing darkroom safelight bulb casts deep crimson shadows across the tile walls.","Notice this clue: A red glowing darkroom safelight bulb casts deep crimson shadows across the tile walls."],"hints":["A special dim red light bulb used in photography darkrooms that does not ruin paper.","Clue hint: Think about red safelight bulb.","Search for: the dim red light masked felix’s approach as he entered the darkroom."],"clues":["Red Safelight Bulb","Item: Red Safelight Bulb","Clue Word: Red Safelight Bulb"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7f1c1c80-a18c-52a3-bfd6-826b90b7a752',
  'story_059',
  'ev_7',
  7,
  '12:20 AM',
  'An exposure test notebook showing exact aperture and shutter calculations for the fake ghost is seized.',
  'An exposure test notebook showing exact aperture and shutter calculations for the fake ghost is seized.',
  'Felix carefully planned the lighting ratios to make the double exposure look seamless.',
  'Exposure Notebook',
  'Handwritten testing log: "Frame 12: 1/60s at f/5.6 - Ghost at 20ft."',
  '["Diary","Phone Book","Receipt"]'::jsonb,
  'Exposure Notebook',
  '["exposure notebook","notebook","log","testing log"]'::jsonb,
  'A small book where camera settings like shutter speed and f-stops are recorded.',
  'ev_8',
  false,
  '{"descriptions":["An exposure test notebook showing exact aperture and shutter calculations for the fake ghost is seized.","At 12:20 AM: An exposure test notebook showing exact aperture and shutter calculations for the fake ghost is seized.","Notice this clue: An exposure test notebook showing exact aperture and shutter calculations for the fake ghost is seized."],"hints":["A small book where camera settings like shutter speed and f-stops are recorded.","Clue hint: Think about exposure notebook.","Search for: felix carefully planned the lighting ratios to make the double exposure look seamless."],"clues":["Exposure Notebook","Item: Exposure Notebook","Clue Word: Exposure Notebook"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c3f2447f-c02b-5721-8f74-a987c60b1e93',
  'story_059',
  'ev_8',
  8,
  '12:45 AM',
  'Microscopic inspection under the forensic loupe shows dual shutter-curtain lines.',
  'Microscopic inspection under the forensic loupe shows dual shutter-curtain lines.',
  'Proves scientifically that the film was exposed to light twice on two separate occasions.',
  'Double-Exposure Rebate',
  'Overlapping sprocket-hole light flares confirming layered physical exposures.',
  '["Watermark","Scratch","Dust Spec"]'::jsonb,
  'Double-Exposure Rebate',
  '["double-exposure rebate","double exposure","rebate","exposure line","dual exposure"]'::jsonb,
  'Optical marks on film edges showing that two different pictures were taken on one frame.',
  NULL,
  true,
  '{"descriptions":["Microscopic inspection under the forensic loupe shows dual shutter-curtain lines.","At 12:45 AM: Microscopic inspection under the forensic loupe shows dual shutter-curtain lines.","Notice this clue: Microscopic inspection under the forensic loupe shows dual shutter-curtain lines."],"hints":["Optical marks on film edges showing that two different pictures were taken on one frame.","Clue hint: Think about double-exposure rebate.","Search for: proves scientifically that the film was exposed to light twice on two separate occasions."],"clues":["Double-Exposure Rebate","Item: Double-Exposure Rebate","Clue Word: Double-Exposure Rebate"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_060 — THE FUNERAL HOME PARLOR
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_060',
  'The Funeral Home Parlor',
  'Horror',
  'Blackwood Memorial Funeral Parlor, velvet drapes, floral wreaths smelling of lilies, mahogany caskets',
  'The bronze lid of a sealed viewing coffin was found shifted open two inches at midnight, with scratch marks on the satin pillow.',
  '[{"name":"Victor Vance","role":"Funeral Director & Mortician","alibi":"In the lower embalming laboratory preparing funeral flowers","avatar":"⚰️"},{"name":"Lady Eleanor Sterling (Deceased)","role":"Wealthy Deceased Socialite","alibi":"Resting inside the sealed bronze casket","avatar":"🥀"},{"name":"Toby Miller","role":"Night Security Guard","alibi":"Patrolling the viewing chapels","avatar":"🔦"},{"name":"Detective Marcus Cole","role":"Grave Robbery Investigator","alibi":"Dispatched to the funeral parlor following Toby’s 911 call","avatar":"🔍"}]'::jsonb,
  'Mortician Victor Vance waited until the grieving family completed their evening wake. He used an embalming pry tool to crack open the sealed bronze casket of Lady Eleanor, stealing a five-carat emerald brooch and gold necklace before being startled by the night security guard.',
  'Mortician Victor Vance',
  'Victor was looting valuable jewelry buried with wealthy corpses before final burial.',
  '[{"time":"09:00 PM","event":"The family wake concludes; the bronze casket lid is sealed shut."},{"time":"11:30 PM","event":"Victor Vance enters the chapel with an embalming lever tool."},{"time":"11:45 PM","event":"Victor pops the casket seal and rips the emerald brooch from the burial gown."},{"time":"11:48 PM","event":"Guard Toby enters the chapel; Victor drops the lid and flees to the basement."},{"time":"12:15 AM","event":"Detective Cole arrives and discovers the pry marks on the casket."}]'::jsonb,
  '[{"id":"ev1","title":"Bronze Paint Scrapes on Embalming Tool","detail":"Microscopic paint match proves Victor’s tool pried open the casket lid."},{"id":"ev2","title":"Signet Ring Gold Transfer on Casket Rim","detail":"Matches the 14-carat signet ring worn on Victor Vance’s right ring finger."},{"id":"ev3","title":"Looted Jewelry Velvet Pouch in Desk","detail":"Contains six previously stolen burial rings alongside the newly stolen emerald brooch."},{"id":"ev4","title":"Post-Mortem Bruising on Victim’s Neck","detail":"Confirms the jewelry was forcibly ripped from the deceased after the wake concluded."}]'::jsonb,
  '[{"order":1,"title":"Ajar Bronze Casket","text":"Heavy burial box forced open by a mechanical lever after the family left."},{"order":2,"title":"Scratched Satin Pillow","text":"Damaged silk cushion where jewelry was violently torn from the corpse."},{"order":3,"title":"Emerald Brooch","text":"Three-hundred-thousand-dollar antique jewel stolen from the burial gown."},{"order":4,"title":"Embalming Pry Tool","text":"Mortuary instrument bearing paint transfer from the casket lid."},{"order":5,"title":"Looted Jewelry Pouch","text":"Stash of stolen burial rings discovered in the mortician’s office."},{"order":6,"title":"Signet Ring Scrape","text":"Gold marks left on the bronze metal by the mortician’s hand."}]'::jsonb,
  'Guard Toby was terrified and ran away.: Superstitious fear, but he had no involvement in looting the dead.; The funeral flowers smelled heavily of lilies.: Natural scent in a funeral home, not an olfactory poison.',
  'Claim the corpse experienced catalepsy and revived or blame the night flower deliverer.',
  'NORMAL',
  'Did the deceased rise from the coffin, or was an intruder raiding the burial vault?',
  '[{"character":"Victor Vance","secret":"He has a velvet pouch containing six stolen burial rings in his desk drawer."},{"character":"Lady Eleanor Sterling (Deceased)","secret":"She was buried with family jewelry worth over three hundred thousand dollars."},{"character":"Toby Miller","secret":"He was terrified of the dark and ran into the flower room to hide."},{"character":"Detective Marcus Cole","secret":"Investigated cemetery tomb desecrations across the county."}]'::jsonb,
  '[{"lead":"Guard Toby was terrified and ran away.","explanation":"Superstitious fear, but he had no involvement in looting the dead."},{"lead":"The funeral flowers smelled heavily of lilies.","explanation":"Natural scent in a funeral home, not an olfactory poison."}]'::jsonb,
  '{"wrongTheories":["The deceased revived from a state of medical catalepsy and pushed the casket lid open.","An outside street gang broke in through the chapel windows to loot the coffin."],"correctTheory":"Mortician Victor Vance used an embalming pry tool to force open the sealed bronze casket of Lady Eleanor, violently ripping an emerald brooch and gold necklace from the body to add to his secret stolen jewelry hoard before being interrupted by the night guard."}'::jsonb,
  'Mortician Victor Vance pried the casket open to loot the corpse’s jewelry!',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Detective Cole matched the paint on Victor’s tool and recovered the emerald brooch from his desk. Victor was arrested for grave robbery, body desecration, and grand larceny."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The family believed a supernatural awakening took place and hastily buried the closed casket. Victor sold the emerald brooch to an overseas fence for three hundred thousand dollars."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The incident was sensationalized as \"The Miracle of the Awakening Lady.\" The funeral parlor saw booming business while Victor continued his secret grave thefts."}]'::jsonb,
  '{"intros":["The bronze lid of a sealed viewing coffin was found shifted open two inches at midnight, with scratch marks on the satin pillow.","Case file story_060: The bronze lid of a sealed viewing coffin was found shifted open two inches at midnight, with scratch marks on the satin pillow. Look closely at every clue.","Trouble begins in Blackwood Memorial Funeral Parlor, velvet drapes, floral wreaths smelling of lilies, mahogany caskets. The bronze lid of a sealed viewing coffin was found shifted open two inches at midnight, with scratch marks on the satin pillow.","The mystery starts now. The bronze lid of a sealed viewing coffin was found shifted open two inches at midnight, with scratch marks on the satin pillow. Can you solve it?"],"reveals":["Mortician Victor Vance pried the casket open to loot the corpse’s jewelry!","The mystery is unraveled! Mortician Victor Vance pried the casket open to loot the corpse’s jewelry!","At last, the truth comes out: Mortician Victor Vance pried the casket open to loot the corpse’s jewelry!","Case resolved! Here is what happened: Mortician Victor Vance pried the casket open to loot the corpse’s jewelry!"],"hints":["Pay attention to where Mortician Victor Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_060';
DELETE FROM public.case_events WHERE case_id = 'story_060';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '96e5e22e-bb88-55cb-bec0-da97918a2512',
  'story_060',
  'Victor Vance',
  'Funeral Director & Mortician',
  'Somber, dignified, immaculate black frock coat, smelling of formaldehyde and lavender water',
  'Grave robbers or restless spirits have violated the sanctum. The dead deserve peace.',
  'He has a velvet pouch containing six stolen burial rings in his desk drawer.',
  'In the lower embalming laboratory preparing funeral flowers',
  'Director of the funeral parlor responsible for casket security',
  'The bronze casket lid had a rubber gasket seal that resists accidental shifting.',
  'Did not know his heavy signet ring left a distinct gold scratch on the bronze casket rim.',
  '⚰️',
  '["Grave robbers or restless spirits have violated the sanctum. The dead deserve peace.","\"Grave robbers or restless spirits have violated the sanctum. The dead deserve peace.\"","Listen to me: Grave robbers or restless spirits have violated the sanctum. The dead deserve peace.","I tell you the truth: Grave robbers or restless spirits have violated the sanctum. The dead deserve peace."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '64c09fbc-61d7-59aa-8233-b82e750876db',
  'story_060',
  'Lady Eleanor Sterling (Deceased)',
  'Wealthy Deceased Socialite',
  'Aristocratic, deceased in peaceful repose, wearing a lace burial gown',
  'Deceased victim; satin pillow had nail scratches and a missing emerald brooch.',
  'She was buried with family jewelry worth over three hundred thousand dollars.',
  'Resting inside the sealed bronze casket',
  'The deceased whose casket was violated',
  'Her neck showed post-mortem bruising where the gold necklace was ripped free.',
  'Could not defend her grave from the greedy mortician.',
  '🥀',
  '["Deceased victim; satin pillow had nail scratches and a missing emerald brooch.","\"Deceased victim; satin pillow had nail scratches and a missing emerald brooch.\"","Listen to me: Deceased victim; satin pillow had nail scratches and a missing emerald brooch.","I tell you the truth: Deceased victim; satin pillow had nail scratches and a missing emerald brooch."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b0345e39-cf8d-5505-89d9-9dc56276112b',
  'story_060',
  'Toby Miller',
  'Night Security Guard',
  'Nervous, superstitious, clutching an electric lantern and rosary',
  'I heard the casket lid creak at 11:45 PM. When I walked into the parlor, the lid was open two inches!',
  'He was terrified of the dark and ran into the flower room to hide.',
  'Patrolling the viewing chapels',
  'First person to discover the casket lid ajar',
  'Saw a figure in a black frock coat slip through the basement curtain.',
  'Did not recognize the funeral director in the dim candlelight.',
  '🔦',
  '["I heard the casket lid creak at 11:45 PM. When I walked into the parlor, the lid was open two inches!","\"I heard the casket lid creak at 11:45 PM. When I walked into the parlor, the lid was open two inches!\"","Listen to me: I heard the casket lid creak at 11:45 PM. When I walked into the parlor, the lid was open two inches!","I tell you the truth: I heard the casket lid creak at 11:45 PM. When I walked into the parlor, the lid was open two inches!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'bad97367-6a75-5a72-8b72-e338af03f3f0',
  'story_060',
  'Detective Marcus Cole',
  'Grave Robbery Investigator',
  'Sharp, unsentimental, examines metal tool marks with calipers',
  'Corpses don’t pry open rubber-gasketed bronze lids with mechanical levers.',
  'Investigated cemetery tomb desecrations across the county.',
  'Dispatched to the funeral parlor following Toby’s 911 call',
  'Leading the investigation into the casket violation',
  'Found bronze metallic paint flakes on an embalming pry tool.',
  'Did not immediately locate where the stolen emerald brooch was stashed.',
  '🔍',
  '["Corpses don’t pry open rubber-gasketed bronze lids with mechanical levers.","\"Corpses don’t pry open rubber-gasketed bronze lids with mechanical levers.\"","Listen to me: Corpses don’t pry open rubber-gasketed bronze lids with mechanical levers.","I tell you the truth: Corpses don’t pry open rubber-gasketed bronze lids with mechanical levers."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1d6c49c1-1686-5bdd-9e22-9d701e50c20b',
  'story_060',
  'ev_1',
  1,
  '11:45 PM',
  'A two-ton polished bronze casket lid is shifted open two inches, breaking the airtight seal.',
  'A two-ton polished bronze casket lid is shifted open two inches, breaking the airtight seal.',
  'The casket was forced open with a mechanical lever, tearing the rubber vacuum gasket.',
  'Ajar Bronze Casket',
  'Heavy bronze burial casket with shifted lid and torn black rubber seal.',
  '["Wooden Coffin","Cardboard Vault","Stone Tomb"]'::jsonb,
  'Ajar Bronze Casket',
  '["ajar bronze casket","casket","bronze casket","coffin","ajar casket"]'::jsonb,
  'A heavy metal burial box where a deceased person rests during a funeral.',
  'ev_2',
  true,
  '{"descriptions":["A two-ton polished bronze casket lid is shifted open two inches, breaking the airtight seal.","At 11:45 PM: A two-ton polished bronze casket lid is shifted open two inches, breaking the airtight seal.","Notice this clue: A two-ton polished bronze casket lid is shifted open two inches, breaking the airtight seal."],"hints":["A heavy metal burial box where a deceased person rests during a funeral.","Clue hint: Think about ajar bronze casket.","Search for: the casket was forced open with a mechanical lever, tearing the rubber vacuum gasket."],"clues":["Ajar Bronze Casket","Item: Ajar Bronze Casket","Clue Word: Ajar Bronze Casket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '43d46206-f0b5-5526-a239-7f9b41c7051f',
  'story_060',
  'ev_2',
  2,
  '11:47 PM',
  'Deep scratches on the white satin pillow where a gold necklace was torn from the neck.',
  'Deep scratches on the white satin pillow where a gold necklace was torn from the neck.',
  'The jewelry was forcefully ripped from the body, leaving fabric tears.',
  'Scratched Satin Pillow',
  'Tufted white satin pillow with torn lace threads and post-mortem blood smears.',
  '["Feather Cushion","Wool Blanket","Velvet Mat"]'::jsonb,
  'Scratched Satin Pillow',
  '["scratched satin pillow","pillow","satin pillow","casket pillow","cushion"]'::jsonb,
  'A soft white silk-covered cushion where the head of a deceased person rests.',
  'ev_3',
  false,
  '{"descriptions":["Deep scratches on the white satin pillow where a gold necklace was torn from the neck.","At 11:47 PM: Deep scratches on the white satin pillow where a gold necklace was torn from the neck.","Notice this clue: Deep scratches on the white satin pillow where a gold necklace was torn from the neck."],"hints":["A soft white silk-covered cushion where the head of a deceased person rests.","Clue hint: Think about scratched satin pillow.","Search for: the jewelry was forcefully ripped from the body, leaving fabric tears."],"clues":["Scratched Satin Pillow","Item: Scratched Satin Pillow","Clue Word: Scratched Satin Pillow"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0ed2b20f-c7f9-5326-930c-749767b470fe',
  'story_060',
  'ev_3',
  3,
  '11:50 PM',
  'A five-carat natural emerald brooch set in platinum is missing from the burial dress.',
  'A five-carat natural emerald brooch set in platinum is missing from the burial dress.',
  'The primary target of the grave robbery was a three-hundred-thousand-dollar jewel.',
  'Emerald Brooch',
  'Empty pin impression on the silk dress where the antique brooch had been pinned.',
  '["Diamond Ring","Gold Watch","Silver Cross"]'::jsonb,
  'Emerald Brooch',
  '["emerald brooch","brooch","emerald","jewel"]'::jsonb,
  'A decorative piece of jewelry with a large green gem pinned onto clothing.',
  'ev_4',
  false,
  '{"descriptions":["A five-carat natural emerald brooch set in platinum is missing from the burial dress.","At 11:50 PM: A five-carat natural emerald brooch set in platinum is missing from the burial dress.","Notice this clue: A five-carat natural emerald brooch set in platinum is missing from the burial dress."],"hints":["A decorative piece of jewelry with a large green gem pinned onto clothing.","Clue hint: Think about emerald brooch.","Search for: the primary target of the grave robbery was a three-hundred-thousand-dollar jewel."],"clues":["Emerald Brooch","Item: Emerald Brooch","Clue Word: Emerald Brooch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '77211574-745a-5424-87f3-502df80f24c9',
  'story_060',
  'ev_4',
  4,
  '11:55 PM',
  'A curved stainless steel embalming pry tool has bronze paint scrapes on its tip.',
  'A curved stainless steel embalming pry tool has bronze paint scrapes on its tip.',
  'The mortician used his specialized laboratory instrument to lever the heavy lid.',
  'Embalming Pry Tool',
  'Stainless steel curved lever with bronze paint transfers matching the casket.',
  '["Crowbar","Screwdriver","Surgical Knife"]'::jsonb,
  'Embalming Pry Tool',
  '["embalming pry tool","pry tool","embalming tool","tool","lever"]'::jsonb,
  'A metal handheld instrument used by morticians to open and seal burial containers.',
  'ev_5',
  false,
  '{"descriptions":["A curved stainless steel embalming pry tool has bronze paint scrapes on its tip.","At 11:55 PM: A curved stainless steel embalming pry tool has bronze paint scrapes on its tip.","Notice this clue: A curved stainless steel embalming pry tool has bronze paint scrapes on its tip."],"hints":["A metal handheld instrument used by morticians to open and seal burial containers.","Clue hint: Think about embalming pry tool.","Search for: the mortician used his specialized laboratory instrument to lever the heavy lid."],"clues":["Embalming Pry Tool","Item: Embalming Pry Tool","Clue Word: Embalming Pry Tool"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8d6c2047-cfcf-5672-8da9-721229834ae3',
  'story_060',
  'ev_5',
  5,
  '12:05 AM',
  'A velvet pouch containing six vintage gold wedding bands is in Victor’s desk.',
  'A velvet pouch containing six vintage gold wedding bands is in Victor’s desk.',
  'Victor had been looting jewelry from corpses over the past six months.',
  'Looted Jewelry Pouch',
  'Black velvet drawstring bag holding stolen rings engraved with past dates.',
  '["Cash Box","Checkbook","Wallet"]'::jsonb,
  'Looted Jewelry Pouch',
  '["looted jewelry pouch","pouch","jewelry pouch","velvet pouch","rings"]'::jsonb,
  'A small soft cloth bag used to hold stolen gold rings and necklaces.',
  'ev_6',
  true,
  '{"descriptions":["A velvet pouch containing six vintage gold wedding bands is in Victor’s desk.","At 12:05 AM: A velvet pouch containing six vintage gold wedding bands is in Victor’s desk.","Notice this clue: A velvet pouch containing six vintage gold wedding bands is in Victor’s desk."],"hints":["A small soft cloth bag used to hold stolen gold rings and necklaces.","Clue hint: Think about looted jewelry pouch.","Search for: victor had been looting jewelry from corpses over the past six months."],"clues":["Looted Jewelry Pouch","Item: Looted Jewelry Pouch","Clue Word: Looted Jewelry Pouch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cfff60d7-4638-5c9e-91a2-f861748e28c1',
  'story_060',
  'ev_6',
  6,
  '12:20 AM',
  'Gold paint scrape marks from Victor’s signet ring are found on the bronze rim.',
  'Gold paint scrape marks from Victor’s signet ring are found on the bronze rim.',
  'Victor scraped his hand against the casket rim while reaching for the brooch.',
  'Signet Ring Scrape',
  '14-carat gold metal transfer on the dark bronze casket lip.',
  '["Chalk Mark","Rust Spot","Paint Chip"]'::jsonb,
  'Signet Ring Scrape',
  '["signet ring scrape","scrape","ring scrape","gold scrape","metal transfer"]'::jsonb,
  'A metallic scratch mark left behind when a gold ring strikes another metal object.',
  'ev_7',
  false,
  '{"descriptions":["Gold paint scrape marks from Victor’s signet ring are found on the bronze rim.","At 12:20 AM: Gold paint scrape marks from Victor’s signet ring are found on the bronze rim.","Notice this clue: Gold paint scrape marks from Victor’s signet ring are found on the bronze rim."],"hints":["A metallic scratch mark left behind when a gold ring strikes another metal object.","Clue hint: Think about signet ring scrape.","Search for: victor scraped his hand against the casket rim while reaching for the brooch."],"clues":["Signet Ring Scrape","Item: Signet Ring Scrape","Clue Word: Signet Ring Scrape"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3cb3607c-b95d-5cb8-9360-c3e7737f0024',
  'story_060',
  'ev_7',
  7,
  '12:45 AM',
  'A fresh white lily flower petal is stuck to the heel of Victor’s dress shoe.',
  'A fresh white lily flower petal is stuck to the heel of Victor’s dress shoe.',
  'The petal matched the funeral wreaths in the viewing chapel.',
  'Lily Petal',
  'Crushed white flower petal coated in floral water from the funeral wreath.',
  '["Rose Petal","Leaf","Grass"]'::jsonb,
  'Lily Petal',
  '["lily petal","petal","flower petal","lily"]'::jsonb,
  'A soft white petal from a fragrant flower commonly displayed at funerals.',
  'ev_8',
  false,
  '{"descriptions":["A fresh white lily flower petal is stuck to the heel of Victor’s dress shoe.","At 12:45 AM: A fresh white lily flower petal is stuck to the heel of Victor’s dress shoe.","Notice this clue: A fresh white lily flower petal is stuck to the heel of Victor’s dress shoe."],"hints":["A soft white petal from a fragrant flower commonly displayed at funerals.","Clue hint: Think about lily petal.","Search for: the petal matched the funeral wreaths in the viewing chapel."],"clues":["Lily Petal","Item: Lily Petal","Clue Word: Lily Petal"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9a9e0c3a-041b-5748-9e76-173906ab9a82',
  'story_060',
  'ev_8',
  8,
  '01:15 AM',
  'An insurance appraisal certificate valuing the emerald brooch at $300,000 is seized.',
  'An insurance appraisal certificate valuing the emerald brooch at $300,000 is seized.',
  'The mortician knew the exact market value of the family heirloom.',
  'Jewelry Appraisal Slip',
  'Official certified jewelry appraisal document found in the family dossier.',
  '["Death Certificate","Will","Receipt"]'::jsonb,
  'Jewelry Appraisal Slip',
  '["jewelry appraisal slip","appraisal","appraisal slip","certificate","insurance paper"]'::jsonb,
  'An official paper from a jeweler stating how much an expensive gem is worth.',
  NULL,
  true,
  '{"descriptions":["An insurance appraisal certificate valuing the emerald brooch at $300,000 is seized.","At 01:15 AM: An insurance appraisal certificate valuing the emerald brooch at $300,000 is seized.","Notice this clue: An insurance appraisal certificate valuing the emerald brooch at $300,000 is seized."],"hints":["An official paper from a jeweler stating how much an expensive gem is worth.","Clue hint: Think about jewelry appraisal slip.","Search for: the mortician knew the exact market value of the family heirloom."],"clues":["Jewelry Appraisal Slip","Item: Jewelry Appraisal Slip","Clue Word: Jewelry Appraisal Slip"]}'::jsonb
);
