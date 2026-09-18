-- ============================================================================
-- INKBOUND — SEED STORIES 091 TO 120
-- Part of the 120 Complete Connected Story Database with Dynamic Wording
-- ============================================================================

-- ----------------------------------------------------------------------------
-- CASE: STORY_091 — THE QUANTUM ENCRYPTION KEY
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_091',
  'The Quantum Encryption Key',
  'Sci-Fi / Cyber',
  'The rooftop penthouse lab of Aegis Quantum Technologies, solar glass ceilings, argon-cooled laser tables, and fiber optic arrays',
  'The world’s only unbreakable quantum decryption hard drive was wiped completely blank the instant morning sunlight illuminated the clean-room sensor.',
  '[{"name":"Dennis Vance","role":"Chief Security Officer","alibi":"Reviewing security rosters at the ground floor security desk","avatar":"🛡️"},{"name":"Dr. Alistair Finch","role":"Quantum Physics Pioneer","alibi":"Sleeping at his residence three miles away","avatar":"🔬"},{"name":"Maya Torres","role":"Optics Calibration Engineer","alibi":"Arrived at the lab at 06:30 AM right after the alarm","avatar":"📐"},{"name":"Special Agent Leo King","role":"Financial Cybercrime Agent","alibi":"En route to the lab to conduct a scheduled federal security audit","avatar":"💼"}]'::jsonb,
  'Security Director Dennis Vance made an illicit clone of the global interbank decryption key overnight. To conceal his data theft and frame the company’s optical system, Dennis adjusted a precision solar prism on the roof so that the morning sun would beam directly into the emergency wipe photo-sensor.',
  'Security Chief Dennis Vance',
  'Dennis had copied an unauthorized clone of the bank encryption keys and triggered the wipe to hide his theft.',
  '[{"time":"03:22 AM","event":"Dennis Vance clones the quantum encryption master drive onto a shielded portable module."},{"time":"05:30 AM","event":"Dennis climbs to the rooftop lab and rotates the solar prism micro-screws."},{"time":"06:14 AM","event":"Morning sunrise hits the redirected prism, focusing 600 lumens onto the wipe sensor."},{"time":"06:15 AM","event":"The quantum drive triggers instant magnetic degaussing, wiping all master data."},{"time":"07:00 AM","event":"Federal Agent King arrives to discover the lab in full crisis mode."}]'::jsonb,
  '[{"id":"ev_1","title":"Degaussed Master Core","detail":"The erased quantum core showing complete erasure triggered by the solar photo-diode."},{"id":"ev_2","title":"Tampered Prism Mount","detail":"Brass rooftop mount deliberately shifted three rotations to focus sunrise light."},{"id":"ev_3","title":"Non-Magnetic Alignment Wrench","detail":"Ceramic hex tool bearing Dennis Vance’s fingerprints matching the prism screws."},{"id":"ev_4","title":"Recovered Master Clone","detail":"The physical clone drive retrieved from Dennis Vance’s car trunk."}]'::jsonb,
  '[{"order":1,"title":"Wiped quantum core","text":"Confirms the emergency optical wipe system was successfully triggered."},{"order":2,"title":"Turned altitude screw","text":"Proves the sunrise beam was an engineered physical alignment, not an accident."},{"order":3,"title":"03:22 AM clone log","text":"Establishes the criminal intent: the data was copied before being destroyed."},{"order":4,"title":"Ceramic hex wrench","text":"Physical tool link connecting Dennis directly to the altered prism."},{"order":5,"title":"Rooftop badge scan","text":"Places the security chief at the crime scene minutes before dawn."},{"order":6,"title":"Cryo-shielded clone drive","text":"Smoking gun recovery of the stolen quantum data."}]'::jsonb,
  'Minor solar flare activity: Space weather reported small solar flares, but none penetrated the roof shield.; Dr. Finch’s forgotten coffee cup on the console: Finch left a cup on the desk, but it didn’t touch the electronics.',
  'Claim a rare solar flare particle cascade tripped the quantum photo-receptors.',
  'NORMAL',
  'Did solar thermal expansion trigger a sensor fail-safe, or was the drive wiped intentionally to hide an inside crime?',
  '[{"character":"Dennis Vance","secret":"A cryo-shielded quantum data clone drive hidden inside his luxury vehicle trunk."},{"character":"Dr. Alistair Finch","secret":"He suspected an employee was siphoning bank codes for months."},{"character":"Maya Torres","secret":"She was working late in the optical calibration bay last night."},{"character":"Special Agent Leo King","secret":"He had an international warrant for a ghost broker nicknamed \"The Shadow Vault\"."}]'::jsonb,
  '[{"lead":"Minor solar flare activity","explanation":"Space weather reported small solar flares, but none penetrated the roof shield."},{"lead":"Dr. Finch’s forgotten coffee cup on the console","explanation":"Finch left a cup on the desk, but it didn’t touch the electronics."}]'::jsonb,
  '{"wrongTheories":["Natural solar thermal expansion moved the prism frame and accidentally triggered the sensor.","A rogue electromagnetic pulse from an outside drone wiped the quantum drive."],"correctTheory":"Security Chief Dennis Vance cloned the quantum bank keys and tilted the solar prism so sunrise would wipe the original."}'::jsonb,
  'Dennis Vance cloned the drive at night and re-aligned the roof prism so sunlight would wipe the evidence of his theft.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Dennis was sentenced to federal prison for cyber-treason, and the cloned drive restored global financial security."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Dennis escaped on a private flight with the clone, bankrupting global financial institutions."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The disaster was labeled an unavoidable design flaw in quantum physics, leaving the thief with a billion dollars."}]'::jsonb,
  '{"intros":["The world’s only unbreakable quantum decryption hard drive was wiped completely blank the instant morning sunlight illuminated the clean-room sensor.","Case file story_091: The world’s only unbreakable quantum decryption hard drive was wiped completely blank the instant morning sunlight illuminated the clean-room sensor. Look closely at every clue.","Trouble begins in The rooftop penthouse lab of Aegis Quantum Technologies, solar glass ceilings, argon-cooled laser tables, and fiber optic arrays. The world’s only unbreakable quantum decryption hard drive was wiped completely blank the instant morning sunlight illuminated the clean-room sensor.","The mystery starts now. The world’s only unbreakable quantum decryption hard drive was wiped completely blank the instant morning sunlight illuminated the clean-room sensor. Can you solve it?"],"reveals":["Dennis Vance cloned the drive at night and re-aligned the roof prism so sunlight would wipe the evidence of his theft.","The mystery is unraveled! Dennis Vance cloned the drive at night and re-aligned the roof prism so sunlight would wipe the evidence of his theft.","At last, the truth comes out: Dennis Vance cloned the drive at night and re-aligned the roof prism so sunlight would wipe the evidence of his theft.","Case resolved! Here is what happened: Dennis Vance cloned the drive at night and re-aligned the roof prism so sunlight would wipe the evidence of his theft."],"hints":["Pay attention to where Security Chief Dennis Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_091';
DELETE FROM public.case_events WHERE case_id = 'story_091';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1a429856-cb0c-515a-820b-19cd38be536c',
  'story_091',
  'Dennis Vance',
  'Chief Security Officer',
  'Imposing, tactical black turtleneck, military posture, checked smartwatch constantly',
  'The solar reflection was an unavoidable optical refraction anomaly caused by morning glare.',
  'A cryo-shielded quantum data clone drive hidden inside his luxury vehicle trunk.',
  'Reviewing security rosters at the ground floor security desk',
  'Head of facility security at Aegis Quantum',
  'The optical wipe sensor responds to 500 lumens of direct natural sunlight.',
  'Did not know the laser table gyro-stabilizer recorded the exact angular shift of the prism.',
  '🛡️',
  '["The solar reflection was an unavoidable optical refraction anomaly caused by morning glare.","\"The solar reflection was an unavoidable optical refraction anomaly caused by morning glare.\"","Listen to me: The solar reflection was an unavoidable optical refraction anomaly caused by morning glare.","I tell you the truth: The solar reflection was an unavoidable optical refraction anomaly caused by morning glare."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5972d32d-a6ff-5e27-b395-a31dbe7268a6',
  'story_091',
  'Dr. Alistair Finch',
  'Quantum Physics Pioneer',
  'Frail genius, wild white hair, tweed jacket, devastated over his destroyed life’s work',
  'That drive held the cryptographic foundation of the global banking system! Forty years wiped in an instant.',
  'He suspected an employee was siphoning bank codes for months.',
  'Sleeping at his residence three miles away',
  'Inventor of the quantum cryptographic core',
  'The solar sensor was installed as a tamper-proof self-destruct against physical theft.',
  'Did not suspect his trusted head of security would deliberately align the prism.',
  '🔬',
  '["That drive held the cryptographic foundation of the global banking system! Forty years wiped in an instant.","\"That drive held the cryptographic foundation of the global banking system! Forty years wiped in an instant.\"","Listen to me: That drive held the cryptographic foundation of the global banking system! Forty years wiped in an instant.","I tell you the truth: That drive held the cryptographic foundation of the global banking system! Forty years wiped in an instant."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1d99e684-d926-5648-9d51-6e5e39fad37d',
  'story_091',
  'Maya Torres',
  'Optics Calibration Engineer',
  'Young, perceptive, ponytail, holding laser calipers and alignment levels',
  'The solar prism doesn’t move on its own. The brass micro-screws were turned three full rotations clockwise.',
  'She was working late in the optical calibration bay last night.',
  'Arrived at the lab at 06:30 AM right after the alarm',
  'Responsible for laser table precision alignment',
  'Someone adjusted the prism using a non-magnetic ceramic hex wrench.',
  'Did not know Dennis had borrowed the ceramic tool kit from her workbench.',
  '📐',
  '["The solar prism doesn’t move on its own. The brass micro-screws were turned three full rotations clockwise.","\"The solar prism doesn’t move on its own. The brass micro-screws were turned three full rotations clockwise.\"","Listen to me: The solar prism doesn’t move on its own. The brass micro-screws were turned three full rotations clockwise.","I tell you the truth: The solar prism doesn’t move on its own. The brass micro-screws were turned three full rotations clockwise."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b9261f24-b574-5cc5-8eb8-5178a3f890a9',
  'story_091',
  'Special Agent Leo King',
  'Financial Cybercrime Agent',
  'Sharp suit, trench coat, armed with forensic drive scanners and legal warrants',
  'When a bank encryption master drive dies conveniently on audit morning, we look for who owns the duplicate.',
  'He had an international warrant for a ghost broker nicknamed "The Shadow Vault".',
  'En route to the lab to conduct a scheduled federal security audit',
  'Lead federal cyber investigator',
  'The drive had an active data clone event recorded at 03:22 AM.',
  'Did not know the physical clone was stored in Dennis’s car.',
  '💼',
  '["When a bank encryption master drive dies conveniently on audit morning, we look for who owns the duplicate.","\"When a bank encryption master drive dies conveniently on audit morning, we look for who owns the duplicate.\"","Listen to me: When a bank encryption master drive dies conveniently on audit morning, we look for who owns the duplicate.","I tell you the truth: When a bank encryption master drive dies conveniently on audit morning, we look for who owns the duplicate."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a795830f-1306-536c-bfa2-aa4f7de64fd9',
  'story_091',
  'ev_1',
  1,
  '06:15 AM',
  'The quantum drive wipes its quantum state as sunlight strikes.',
  'The quantum drive wipes its quantum state as sunlight strikes.',
  'A degaussed quantum core with zero residual magnetic spin data.',
  'Wiped quantum core',
  'Degaussed Master Core',
  '["Burnt silicon","Melted cable","Cracked glass"]'::jsonb,
  'Wiped quantum core',
  '["wiped quantum core","quantum core","wiped core","degaussed core","master core"]'::jsonb,
  'The erased quantum data drive completely devoid of data.',
  'ev_2',
  true,
  '{"descriptions":["The quantum drive wipes its quantum state as sunlight strikes.","At 06:15 AM: The quantum drive wipes its quantum state as sunlight strikes.","Notice this clue: The quantum drive wipes its quantum state as sunlight strikes."],"hints":["The erased quantum data drive completely devoid of data.","Clue hint: Think about wiped quantum core.","Search for: a degaussed quantum core with zero residual magnetic spin data."],"clues":["Wiped quantum core","Item: Wiped quantum core","Clue Word: Wiped quantum core"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f486b7dd-af06-51da-ba82-732cb0597024',
  'story_091',
  'ev_2',
  2,
  '06:35 AM',
  'Maya Torres inspects the rooftop laser prism array.',
  'Maya Torres inspects the rooftop laser prism array.',
  'A brass adjustment mount showing three turns on the altitude micro-screw.',
  'Turned altitude screw',
  'Tampered Prism Mount',
  '["Rusted bolt","Broken glass","Loose lens"]'::jsonb,
  'Turned altitude screw',
  '["turned altitude screw","altitude screw","screw turns","prism mount","tampered screw"]'::jsonb,
  'Adjustment hardware manually rotated to direct sunlight onto the sensor.',
  'ev_3',
  false,
  '{"descriptions":["Maya Torres inspects the rooftop laser prism array.","At 06:35 AM: Maya Torres inspects the rooftop laser prism array.","Notice this clue: Maya Torres inspects the rooftop laser prism array."],"hints":["Adjustment hardware manually rotated to direct sunlight onto the sensor.","Clue hint: Think about turned altitude screw.","Search for: a brass adjustment mount showing three turns on the altitude micro-screw."],"clues":["Turned altitude screw","Item: Turned altitude screw","Clue Word: Turned altitude screw"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '592876cb-f489-5858-a3f9-8b54ed62e724',
  'story_091',
  'ev_3',
  3,
  '06:45 AM',
  'Agent King checks the offline hardware transaction log.',
  'Agent King checks the offline hardware transaction log.',
  'A high-speed data clone transfer executed at 03:22 AM using security master credentials.',
  '03:22 AM clone log',
  'Unauthorized Cloning Record',
  '["System reboot","Backup backup","Virus alert"]'::jsonb,
  '03:22 AM clone log',
  '["03:22 am clone log","clone log","cloning record","transfer log","data clone"]'::jsonb,
  'Audit trail proving the drive was copied hours before the wipe.',
  'ev_4',
  false,
  '{"descriptions":["Agent King checks the offline hardware transaction log.","At 06:45 AM: Agent King checks the offline hardware transaction log.","Notice this clue: Agent King checks the offline hardware transaction log."],"hints":["Audit trail proving the drive was copied hours before the wipe.","Clue hint: Think about 03:22 am clone log.","Search for: a high-speed data clone transfer executed at 03:22 am using security master credentials."],"clues":["03:22 AM clone log","Item: 03:22 AM clone log","Clue Word: 03:22 AM clone log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a2f93f59-4bbf-5232-8071-8ecb5439429a',
  'story_091',
  'ev_4',
  4,
  '07:15 AM',
  'Torres checks her workbench ceramic tool drawer.',
  'Torres checks her workbench ceramic tool drawer.',
  'A ceramic 4mm hex wrench covered in Dennis Vance’s fingerprint grease.',
  'Ceramic hex wrench',
  'Non-Magnetic Alignment Wrench',
  '["Steel wrench","Pliers","Screwdriver"]'::jsonb,
  'Ceramic hex wrench',
  '["ceramic hex wrench","hex wrench","ceramic wrench","wrench","alignment wrench"]'::jsonb,
  'Special non-magnetic tool used to turn the rooftop screws without tripping sensors.',
  'ev_5',
  false,
  '{"descriptions":["Torres checks her workbench ceramic tool drawer.","At 07:15 AM: Torres checks her workbench ceramic tool drawer.","Notice this clue: Torres checks her workbench ceramic tool drawer."],"hints":["Special non-magnetic tool used to turn the rooftop screws without tripping sensors.","Clue hint: Think about ceramic hex wrench.","Search for: a ceramic 4mm hex wrench covered in dennis vance’s fingerprint grease."],"clues":["Ceramic hex wrench","Item: Ceramic hex wrench","Clue Word: Ceramic hex wrench"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a53f23b9-2541-5ee5-872c-cae701b508b8',
  'story_091',
  'ev_5',
  5,
  '07:30 AM',
  'King checks the rooftop security door electronic badge reader.',
  'King checks the rooftop security door electronic badge reader.',
  'Dennis Vance’s biometric badge scanned at the roof hatch at 05:28 AM.',
  'Rooftop badge scan',
  'Roof Door Access Record',
  '["Cleaning staff badge","Visitor pass","Key override"]'::jsonb,
  'Rooftop badge scan',
  '["rooftop badge scan","badge scan","roof scan","rooftop scan","access record"]'::jsonb,
  'Electronic proof that Dennis went onto the roof right before sunrise.',
  'ev_6',
  true,
  '{"descriptions":["King checks the rooftop security door electronic badge reader.","At 07:30 AM: King checks the rooftop security door electronic badge reader.","Notice this clue: King checks the rooftop security door electronic badge reader."],"hints":["Electronic proof that Dennis went onto the roof right before sunrise.","Clue hint: Think about rooftop badge scan.","Search for: dennis vance’s biometric badge scanned at the roof hatch at 05:28 am."],"clues":["Rooftop badge scan","Item: Rooftop badge scan","Clue Word: Rooftop badge scan"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b5675250-5107-57e0-846f-de396152907f',
  'story_091',
  'ev_6',
  6,
  '07:50 AM',
  'King executes a federal search warrant on Dennis’s sports car.',
  'King executes a federal search warrant on Dennis’s sports car.',
  'A cryo-shielded quantum data clone hidden in the spare tire compartment.',
  'Cryo-shielded clone drive',
  'Recovered Master Clone',
  '["Laptop","Cash bag","Gun case"]'::jsonb,
  'Cryo-shielded clone drive',
  '["cryo-shielded clone drive","clone drive","quantum clone","shielded drive","recovered clone"]'::jsonb,
  'The stolen duplicate drive containing all the global bank codes.',
  'ev_7',
  false,
  '{"descriptions":["King executes a federal search warrant on Dennis’s sports car.","At 07:50 AM: King executes a federal search warrant on Dennis’s sports car.","Notice this clue: King executes a federal search warrant on Dennis’s sports car."],"hints":["The stolen duplicate drive containing all the global bank codes.","Clue hint: Think about cryo-shielded clone drive.","Search for: a cryo-shielded quantum data clone hidden in the spare tire compartment."],"clues":["Cryo-shielded clone drive","Item: Cryo-shielded clone drive","Clue Word: Cryo-shielded clone drive"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '27cf003e-96b0-5b1d-9e35-ab8c9d748d8e',
  'story_091',
  'ev_7',
  7,
  '08:15 AM',
  'Forensics connects the cloned drive to Agent King’s diagnostic deck.',
  'Forensics connects the cloned drive to Agent King’s diagnostic deck.',
  'Complete functional copy of the global interbank decryption master key.',
  'Intact bank master key',
  'Decrypted Master Key File',
  '["Blank data","Corrupted file","Movie file"]'::jsonb,
  'Intact bank master key',
  '["intact bank master key","master key","bank key","decrypted key","master key file"]'::jsonb,
  'Priceless encryption data that controls billions in banking transactions.',
  'ev_8',
  false,
  '{"descriptions":["Forensics connects the cloned drive to Agent King’s diagnostic deck.","At 08:15 AM: Forensics connects the cloned drive to Agent King’s diagnostic deck.","Notice this clue: Forensics connects the cloned drive to Agent King’s diagnostic deck."],"hints":["Priceless encryption data that controls billions in banking transactions.","Clue hint: Think about intact bank master key.","Search for: complete functional copy of the global interbank decryption master key."],"clues":["Intact bank master key","Item: Intact bank master key","Clue Word: Intact bank master key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '240c8b5e-88f8-5663-8032-764a24683869',
  'story_091',
  'ev_8',
  8,
  '08:30 AM',
  'Dennis Vance is arrested for corporate espionage and grand larceny.',
  'Dennis Vance is arrested for corporate espionage and grand larceny.',
  'Dennis’s signed confession detailing his arrangement with international buyers.',
  'Vance’s signed confession',
  'Espionage Confession',
  '["Bail petition","Lawyer statement","Silence"]'::jsonb,
  'Vance’s signed confession',
  '["vance’s signed confession","confession","signed confession","vance confession","espionage confession"]'::jsonb,
  'Written admission of the entire plot to steal the bank keys.',
  NULL,
  true,
  '{"descriptions":["Dennis Vance is arrested for corporate espionage and grand larceny.","At 08:30 AM: Dennis Vance is arrested for corporate espionage and grand larceny.","Notice this clue: Dennis Vance is arrested for corporate espionage and grand larceny."],"hints":["Written admission of the entire plot to steal the bank keys.","Clue hint: Think about vance’s signed confession.","Search for: dennis’s signed confession detailing his arrangement with international buyers."],"clues":["Vance’s signed confession","Item: Vance’s signed confession","Clue Word: Vance’s signed confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_092 — THE GHOST IN THE NET
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_092',
  'The Ghost in the Net',
  'Sci-Fi / Cyber',
  'The abandoned server basement of OmniCorp Cybernetics, rusted cooling pipes, green phosphor monitors, and dripping cables',
  'One year after the mysterious death of OmniCorp’s lead software architect, his personal chat bot began sending messages containing live security camera feeds from inside the CEO’s private office.',
  '[{"name":"Maya Vance","role":"Vengeful Sister & Hacker","alibi":"Operating an unauthorized terminal in the abandoned sub-basement","avatar":"💻"},{"name":"CEO Arthur Cross","role":"Ruthless Corporate Executive","alibi":"Pacing in his top-floor executive suite","avatar":"👔"},{"name":"GHOST-7 (AI Chatbot)","role":"Synthetic Persona Algorithm","alibi":"Running across OmniCorp intranet nodes","avatar":"👻"},{"name":"Inspector Ray Kelly","role":"Cybercrime Detective","alibi":"Tracing network packet hops from precinct headquarters","avatar":"🕵️‍♂️"}]'::jsonb,
  'Software engineer David Vance was murdered by OmniCorp CEO Arthur Cross. David’s sister Maya discovered her brother’s hidden basement server containing his personal voice models and intranet backdoors. She orchestrated the "ghost" messages to terrify the CEO into confessing while broadcasting the feed to the police.',
  'Deceased Architect’s Sister Maya Vance',
  'Maya wanted to expose that the CEO murdered her brother to steal his neural compression algorithm.',
  '[{"time":"One Year Ago","event":"CEO Cross pushes David Vance down the fire escape and claims it was an accident."},{"time":"Yesterday - 11:00 PM","event":"Maya Vance deploys the GHOST-7 conversational script on server node 4."},{"time":"Today - 09:00 AM","event":"The CEO receives a video call from \"David\" showing Arthur’s current desk in real time."},{"time":"Today - 10:15 AM","event":"Arthur panics and begins destroying secret paper files in his office."},{"time":"Today - 11:30 AM","event":"Inspector Kelly traces the transmission cables to the abandoned basement."}]'::jsonb,
  '[{"id":"ev_1","title":"Concealed Desk Pinhole Cam","detail":"Micro-camera in the CEO’s lamp transmitting live video to Maya’s basement terminal."},{"id":"ev_2","title":"Scorched Corporate Memos","detail":"Partially burned memos showing CEO Cross stole David’s compression algorithm."},{"id":"ev_3","title":"Murder Security Footage","detail":"Historic video recording showing Arthur Cross pushing David down the fire escape."},{"id":"ev_4","title":"Captured Audio Confession","detail":"Recording of CEO Cross begging David’s ghost for forgiveness and admitting the murder."}]'::jsonb,
  '[{"order":1,"title":"Desk lamp camera","text":"Explains how the \"ghost\" could see inside the locked CEO office in real time."},{"order":2,"title":"David’s synthesized voice","text":"Proves the messages were generated using high-tech voice synthesis, not a real ghost."},{"order":3,"title":"Burned patent theft memos","text":"The financial motive that led Arthur to murder his chief engineer."},{"order":4,"title":"Sub-level 3 cyberdeck","text":"The physical control station orchestrating the haunting."},{"order":5,"title":"Camera remote receiver","text":"Proves Maya Vance was the human puppet master behind the ghost persona."},{"order":6,"title":"Fire escape murder video","text":"Direct conclusive proof of the historical murder."}]'::jsonb,
  'OmniCorp AI server glitch report: IT staff blamed server bugs for the network anomalies.; Subway electrical vibrations: Vibrations in the basement were caused by trains, not digital specters.',
  'Claim David’s consciousness spontaneously digitized and lived inside the company mainframe.',
  'NORMAL',
  'Did the dead engineer upload his mind into the internet, or is someone using his ghost persona to seek revenge?',
  '[{"character":"Maya Vance","secret":"A direct remote tap into the CEO’s private boardroom microphone."},{"character":"CEO Arthur Cross","secret":"A shredded police inquiry file hidden in his executive paper safe."},{"character":"GHOST-7 (AI Chatbot)","secret":"A hardcoded forensic memory archive holding David’s last voice recordings."},{"character":"Inspector Ray Kelly","secret":"He kept David’s unsolved death file on his desk for a full year."}]'::jsonb,
  '[{"lead":"OmniCorp AI server glitch report","explanation":"IT staff blamed server bugs for the network anomalies."},{"lead":"Subway electrical vibrations","explanation":"Vibrations in the basement were caused by trains, not digital specters."}]'::jsonb,
  '{"wrongTheories":["David Vance successfully digitized his brain before death and lives inside the network.","A rival tech firm hacked the company to execute a corporate smear campaign."],"correctTheory":"Maya Vance used her dead brother’s voice models and a hidden pinhole camera to terrorize CEO Cross into confessing to murder."}'::jsonb,
  'Maya Vance engineered the ghost persona using voice synthesis and hidden cameras to force CEO Cross to confess to her brother’s murder.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"CEO Arthur Cross was imprisoned for life for murder, and Maya successfully restored her brother’s legacy."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Cross had Maya arrested for corporate hacking, keeping the murder secret forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The tech community believed in the digital ghost myth, while Cross quietly retired with the stolen fortune."}]'::jsonb,
  '{"intros":["One year after the mysterious death of OmniCorp’s lead software architect, his personal chat bot began sending messages containing live security camera feeds from inside the CEO’s private office.","Case file story_092: One year after the mysterious death of OmniCorp’s lead software architect, his personal chat bot began sending messages containing live security camera feeds from inside the CEO’s private office. Look closely at every clue.","Trouble begins in The abandoned server basement of OmniCorp Cybernetics, rusted cooling pipes, green phosphor monitors, and dripping cables. One year after the mysterious death of OmniCorp’s lead software architect, his personal chat bot began sending messages containing live security camera feeds from inside the CEO’s private office.","The mystery starts now. One year after the mysterious death of OmniCorp’s lead software architect, his personal chat bot began sending messages containing live security camera feeds from inside the CEO’s private office. Can you solve it?"],"reveals":["Maya Vance engineered the ghost persona using voice synthesis and hidden cameras to force CEO Cross to confess to her brother’s murder.","The mystery is unraveled! Maya Vance engineered the ghost persona using voice synthesis and hidden cameras to force CEO Cross to confess to her brother’s murder.","At last, the truth comes out: Maya Vance engineered the ghost persona using voice synthesis and hidden cameras to force CEO Cross to confess to her brother’s murder.","Case resolved! Here is what happened: Maya Vance engineered the ghost persona using voice synthesis and hidden cameras to force CEO Cross to confess to her brother’s murder."],"hints":["Pay attention to where Deceased Architect’s Sister Maya Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_092';
DELETE FROM public.case_events WHERE case_id = 'story_092';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd0006408-aa77-55b8-bb9a-e8faf1b3856a',
  'story_092',
  'Maya Vance',
  'Vengeful Sister & Hacker',
  'Determined, dark hoodie, rings under her eyes, skilled keyboard operator',
  'David’s voice won’t be silenced until the man who killed him pays for his crime.',
  'A direct remote tap into the CEO’s private boardroom microphone.',
  'Operating an unauthorized terminal in the abandoned sub-basement',
  'Sister of late software engineer David Vance',
  'Arthur Cross pushed David down the fire stairs when David refused to sell the code.',
  'Did not know the CEO had ordered private security to sweep the basement with heat sensors.',
  '💻',
  '["David’s voice won’t be silenced until the man who killed him pays for his crime.","\"David’s voice won’t be silenced until the man who killed him pays for his crime.\"","Listen to me: David’s voice won’t be silenced until the man who killed him pays for his crime.","I tell you the truth: David’s voice won’t be silenced until the man who killed him pays for his crime."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'beb9ae44-0d62-5368-bd16-1e64d04b7633',
  'story_092',
  'CEO Arthur Cross',
  'Ruthless Corporate Executive',
  'Tailored three-piece suit, sweating through his collar, trembling, clutching a gold lighter',
  'David Vance died of an accidental fall a year ago! This ghost is impossible!',
  'A shredded police inquiry file hidden in his executive paper safe.',
  'Pacing in his top-floor executive suite',
  'Former boss and killer of David Vance',
  'David kept a digital ledger of stolen algorithmic royalties.',
  'Did not realize his private office desk lamp contained a live micro-camera.',
  '👔',
  '["David Vance died of an accidental fall a year ago! This ghost is impossible!","\"David Vance died of an accidental fall a year ago! This ghost is impossible!\"","Listen to me: David Vance died of an accidental fall a year ago! This ghost is impossible!","I tell you the truth: David Vance died of an accidental fall a year ago! This ghost is impossible!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b3752c81-3516-5a31-8487-e6a44e91d2d7',
  'story_092',
  'GHOST-7 (AI Chatbot)',
  'Synthetic Persona Algorithm',
  'Echoing, calm, speaking in David Vance’s exact vocal inflection and vocabulary',
  'Arthur... you pushed me from the tenth-floor fire escape. The ledger is still on server four.',
  'A hardcoded forensic memory archive holding David’s last voice recordings.',
  'Running across OmniCorp intranet nodes',
  'Digital construct built by David before his death',
  'The exact coordinates of the basement server hosting the original algorithm.',
  'Lacks actual human consciousness; executes automated script loops.',
  '👻',
  '["Arthur... you pushed me from the tenth-floor fire escape. The ledger is still on server four.","\"Arthur... you pushed me from the tenth-floor fire escape. The ledger is still on server four.\"","Listen to me: Arthur... you pushed me from the tenth-floor fire escape. The ledger is still on server four.","I tell you the truth: Arthur... you pushed me from the tenth-floor fire escape. The ledger is still on server four."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '35244aa5-c9fb-581a-acdd-2ab1d0e8e5c0',
  'story_092',
  'Inspector Ray Kelly',
  'Cybercrime Detective',
  'Weary, trench coat, holding a rugged datapad, skeptical of digital spirits',
  'Ghosts don’t ping IP addresses through local fiber-optic switchboards.',
  'He kept David’s unsolved death file on his desk for a full year.',
  'Tracing network packet hops from precinct headquarters',
  'Investigating the mysterious intranet intrusions',
  'The keystrokes originating the ghost messages came from sub-level 3.',
  'Did not know Maya was hiding behind the old cooling tower partition.',
  '🕵️‍♂️',
  '["Ghosts don’t ping IP addresses through local fiber-optic switchboards.","\"Ghosts don’t ping IP addresses through local fiber-optic switchboards.\"","Listen to me: Ghosts don’t ping IP addresses through local fiber-optic switchboards.","I tell you the truth: Ghosts don’t ping IP addresses through local fiber-optic switchboards."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2aacabf8-cbd6-5bee-9409-fc18384cb626',
  'story_092',
  'ev_1',
  1,
  '09:00 AM',
  'Arthur’s screen flickers with a video of his own office desk.',
  'Arthur’s screen flickers with a video of his own office desk.',
  'A hidden pinhole optical camera disguised as a desk lamp bolt.',
  'Desk lamp camera',
  'Concealed Desk Pinhole Cam',
  '["Broken bulb","Mirror reflection","Screen glare"]'::jsonb,
  'Desk lamp camera',
  '["desk lamp camera","lamp camera","pinhole camera","camera","desk camera"]'::jsonb,
  'Microscopic video transmitter hidden in the CEO’s office lamp.',
  'ev_2',
  true,
  '{"descriptions":["Arthur’s screen flickers with a video of his own office desk.","At 09:00 AM: Arthur’s screen flickers with a video of his own office desk.","Notice this clue: Arthur’s screen flickers with a video of his own office desk."],"hints":["Microscopic video transmitter hidden in the CEO’s office lamp.","Clue hint: Think about desk lamp camera.","Search for: a hidden pinhole optical camera disguised as a desk lamp bolt."],"clues":["Desk lamp camera","Item: Desk lamp camera","Clue Word: Desk lamp camera"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a6f95796-96ab-534b-8137-a88c6a631318',
  'story_092',
  'ev_2',
  2,
  '09:30 AM',
  'GHOST-7 transmits David’s synthesized voice over the executive speaker.',
  'GHOST-7 transmits David’s synthesized voice over the executive speaker.',
  'An audio file using David’s speech cadence: "Why did you push me, Arthur?"',
  'David’s synthesized voice',
  'Deepfake Audio Stream',
  '["Radio static","Phone voicemail","Answering machine"]'::jsonb,
  'David’s synthesized voice',
  '["david’s synthesized voice","synthesized voice","ghost voice","voice audio","deepfake voice"]'::jsonb,
  'Synthesized vocal audio matching the deceased engineer perfectly.',
  'ev_3',
  false,
  '{"descriptions":["GHOST-7 transmits David’s synthesized voice over the executive speaker.","At 09:30 AM: GHOST-7 transmits David’s synthesized voice over the executive speaker.","Notice this clue: GHOST-7 transmits David’s synthesized voice over the executive speaker."],"hints":["Synthesized vocal audio matching the deceased engineer perfectly.","Clue hint: Think about david’s synthesized voice.","Search for: an audio file using david’s speech cadence: \"why did you push me, arthur?\""],"clues":["David’s synthesized voice","Item: David’s synthesized voice","Clue Word: David’s synthesized voice"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4b196ac3-c806-57b5-8dc9-f13419145de0',
  'story_092',
  'ev_3',
  3,
  '10:15 AM',
  'Arthur burns files in his personal brass wastebasket in terror.',
  'Arthur burns files in his personal brass wastebasket in terror.',
  'Partially burned memos detailing the theft of David’s compression patent.',
  'Burned patent theft memos',
  'Scorched Corporate Memos',
  '["Newspaper","Receipt","Napkin"]'::jsonb,
  'Burned patent theft memos',
  '["burned patent theft memos","patent memos","burned memos","scorched memos","theft memos"]'::jsonb,
  'Burnt paper fragments documenting Arthur’s scheme to steal David’s invention.',
  'ev_4',
  false,
  '{"descriptions":["Arthur burns files in his personal brass wastebasket in terror.","At 10:15 AM: Arthur burns files in his personal brass wastebasket in terror.","Notice this clue: Arthur burns files in his personal brass wastebasket in terror."],"hints":["Burnt paper fragments documenting Arthur’s scheme to steal David’s invention.","Clue hint: Think about burned patent theft memos.","Search for: partially burned memos detailing the theft of david’s compression patent."],"clues":["Burned patent theft memos","Item: Burned patent theft memos","Clue Word: Burned patent theft memos"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2f001132-76ef-56aa-94f2-1bba5d22f862',
  'story_092',
  'ev_4',
  4,
  '11:30 AM',
  'Inspector Kelly descends into the flooded server basement.',
  'Inspector Kelly descends into the flooded server basement.',
  'An active cyberdeck rigged to the building’s primary fiber trunk.',
  'Sub-level 3 cyberdeck',
  'Sub-Basement Cyberdeck',
  '["Old radio","Generator","Battery bank"]'::jsonb,
  'Sub-level 3 cyberdeck',
  '["sub-level 3 cyberdeck","cyberdeck","deck","basement deck","terminal rig"]'::jsonb,
  'High-power hacker computer operating in the dark basement.',
  'ev_5',
  false,
  '{"descriptions":["Inspector Kelly descends into the flooded server basement.","At 11:30 AM: Inspector Kelly descends into the flooded server basement.","Notice this clue: Inspector Kelly descends into the flooded server basement."],"hints":["High-power hacker computer operating in the dark basement.","Clue hint: Think about sub-level 3 cyberdeck.","Search for: an active cyberdeck rigged to the building’s primary fiber trunk."],"clues":["Sub-level 3 cyberdeck","Item: Sub-level 3 cyberdeck","Clue Word: Sub-level 3 cyberdeck"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4824da58-909c-53a9-a554-b544d3292bf0',
  'story_092',
  'ev_5',
  5,
  '11:45 AM',
  'Kelly spots Maya hiding behind the cooling tower.',
  'Kelly spots Maya hiding behind the cooling tower.',
  'Maya holding the remote camera receiver linked to Arthur’s lamp.',
  'Camera remote receiver',
  'Live Surveillance Handheld',
  '["Walkie talkie","Flashlight","Smartphone"]'::jsonb,
  'Camera remote receiver',
  '["camera remote receiver","receiver","remote receiver","camera receiver","handheld"]'::jsonb,
  'Video screen in Maya’s hands displaying the CEO’s panicked office.',
  'ev_6',
  true,
  '{"descriptions":["Kelly spots Maya hiding behind the cooling tower.","At 11:45 AM: Kelly spots Maya hiding behind the cooling tower.","Notice this clue: Kelly spots Maya hiding behind the cooling tower."],"hints":["Video screen in Maya’s hands displaying the CEO’s panicked office.","Clue hint: Think about camera remote receiver.","Search for: maya holding the remote camera receiver linked to arthur’s lamp."],"clues":["Camera remote receiver","Item: Camera remote receiver","Clue Word: Camera remote receiver"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bb329c7a-f6df-56f6-b700-f10b6444d253',
  'story_092',
  'ev_6',
  6,
  '12:00 PM',
  'Maya hands Kelly an encrypted USB drive left by David.',
  'Maya hands Kelly an encrypted USB drive left by David.',
  'A security camera video from one year ago showing Arthur shoving David.',
  'Fire escape murder video',
  'Murder Security Footage',
  '["Audio clip","Still photo","Written note"]'::jsonb,
  'Fire escape murder video',
  '["fire escape murder video","murder video","fire escape video","security video","footage"]'::jsonb,
  'Clear video evidence of the CEO pushing David to his death.',
  'ev_7',
  false,
  '{"descriptions":["Maya hands Kelly an encrypted USB drive left by David.","At 12:00 PM: Maya hands Kelly an encrypted USB drive left by David.","Notice this clue: Maya hands Kelly an encrypted USB drive left by David."],"hints":["Clear video evidence of the CEO pushing David to his death.","Clue hint: Think about fire escape murder video.","Search for: a security camera video from one year ago showing arthur shoving david."],"clues":["Fire escape murder video","Item: Fire escape murder video","Clue Word: Fire escape murder video"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5b033540-47df-50ff-b1b5-798a0f9673be',
  'story_092',
  'ev_7',
  7,
  '12:30 PM',
  'Police enter Arthur’s penthouse office as the video plays on all screens.',
  'Police enter Arthur’s penthouse office as the video plays on all screens.',
  'Arthur’s frantic audio confession captured by the desk lamp camera.',
  'Office lamp recorded confession',
  'Captured Audio Confession',
  '["Written apology","Legal denial","Silence"]'::jsonb,
  'Office lamp recorded confession',
  '["office lamp recorded confession","confession","recorded confession","lamp confession","audio confession"]'::jsonb,
  'CEO admitting to the murder while begging the "ghost" for mercy.',
  'ev_8',
  false,
  '{"descriptions":["Police enter Arthur’s penthouse office as the video plays on all screens.","At 12:30 PM: Police enter Arthur’s penthouse office as the video plays on all screens.","Notice this clue: Police enter Arthur’s penthouse office as the video plays on all screens."],"hints":["CEO admitting to the murder while begging the \"ghost\" for mercy.","Clue hint: Think about office lamp recorded confession.","Search for: arthur’s frantic audio confession captured by the desk lamp camera."],"clues":["Office lamp recorded confession","Item: Office lamp recorded confession","Clue Word: Office lamp recorded confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '92e15bbe-9f44-51e4-b3c6-6febe2f5d199',
  'story_092',
  'ev_8',
  8,
  '01:00 PM',
  'Arthur Cross is led out of the OmniCorp tower in handcuffs.',
  'Arthur Cross is led out of the OmniCorp tower in handcuffs.',
  'Arrest warrant for first-degree homicide and intellectual property theft.',
  'Homicide arrest warrant',
  'CEO Arrest Order',
  '["Tax audit","Fine receipt","Resignation notice"]'::jsonb,
  'Homicide arrest warrant',
  '["homicide arrest warrant","arrest warrant","homicide warrant","arrest order","warrant"]'::jsonb,
  'Final legal action bringing justice to the deceased architect.',
  NULL,
  true,
  '{"descriptions":["Arthur Cross is led out of the OmniCorp tower in handcuffs.","At 01:00 PM: Arthur Cross is led out of the OmniCorp tower in handcuffs.","Notice this clue: Arthur Cross is led out of the OmniCorp tower in handcuffs."],"hints":["Final legal action bringing justice to the deceased architect.","Clue hint: Think about homicide arrest warrant.","Search for: arrest warrant for first-degree homicide and intellectual property theft."],"clues":["Homicide arrest warrant","Item: Homicide arrest warrant","Clue Word: Homicide arrest warrant"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_093 — THE NANITE CONTAMINATION
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_093',
  'The Nanite Contamination',
  'Sci-Fi / Cyber',
  'Vanguard Advanced Nanotech Clean-lab, sealed airlocks, bio-hazard orange lights, and stainless steel benches',
  'Within three minutes, all solid brass door handles and titanium lab instruments across corridor B dissolved into a fine gray dust, trapping the director inside.',
  '[{"name":"Victor Shaw","role":"Fired Nanite Engineer","alibi":"Claims he was in the security parking lot packing his belongings into his car","avatar":"🧪"},{"name":"Director Warren Kane","role":"Laboratory Director","alibi":"Trapped inside the director’s executive lab suite","avatar":"🥼"},{"name":"Dr. Nora Vance","role":"Senior Materials Scientist","alibi":"Working in the secondary clean-room across the courtyard","avatar":"🔬"},{"name":"Security Officer Tyler Cole","role":"Hazard Response Guard","alibi":"At the central hazard monitoring console","avatar":"🛡️"}]'::jsonb,
  'Victor Shaw was dismissed without severance after warning the board about unstable nanite protocols. In anger, Victor reprogrammed a batch of metallurgical disassembler nanites and fed them into the air ventilation system leading to the director’s suite, dissolving the metal door locks to trap the director inside during a simulated chemical purge.',
  'Disgruntled Nanite Engineer Victor Shaw',
  'Victor was fired yesterday after his safety warnings were ignored, and he sought revenge against the laboratory director.',
  '[{"time":"02:00 PM","event":"Director Kane fires Victor Shaw and orders his badge revoked."},{"time":"02:30 PM","event":"Victor climbs into the rooftop air ventilation ducts with a nanite injector."},{"time":"02:45 PM","event":"Victor injects modified metal-eating nanites into the air supply for suite 4."},{"time":"02:48 PM","event":"Corridor B brass and titanium handles dissolve into gray metallic dust."},{"time":"03:00 PM","event":"Hazard containment triggers as Director Kane is trapped in the gas zone."}]'::jsonb,
  '[{"id":"ev_1","title":"Dissolved Alloy Powder","detail":"Gray ash residue containing billions of deconstructed metal atoms from door handles."},{"id":"ev_2","title":"Aerosol Nanite Canister","detail":"High-pressure cylinder found in the ventilation duct used to disperse the nanites."},{"id":"ev_3","title":"Nanite Frequency Transmitter","detail":"Handheld programmer found on Victor Shaw matching the nanite control frequency."},{"id":"ev_4","title":"Broadcast Shutdown Log","detail":"Telemetry proving Victor’s device held the unique cryptographic key to stop the swarm."}]'::jsonb,
  '[{"order":1,"title":"Gray metallic nanite ash","text":"Confirms rapid, targeted molecular disassembly of door hardware."},{"order":2,"title":"Nanite instruction code","text":"Microscopic proof that the nanites were altered to consume titanium alloys."},{"order":3,"title":"Unlatched ventilation grille","text":"Pinpoints the injection site into the director’s air supply."},{"order":4,"title":"Dispersal canister","text":"The physical container used to introduce the weapon into the facility."},{"order":5,"title":"Victor’s parked car","text":"Shatters Victor’s alibi that he had left the facility after being fired."},{"order":6,"title":"Handheld laser programmer","text":"Direct possession of the instrument used to control the swarm."}]'::jsonb,
  'Sterilization chemical leak warning: The chemical alarm was an automated response to the door failure, not the cause.; Power grid surge in corridor A: A surge occurred when lights flashed, unrelated to molecular breakdown.',
  'Claim a cosmic solar pulse altered the nanites’ molecular instruction code.',
  'NORMAL',
  'Was it a rogue runaway nanite mutation, or targeted industrial sabotage using weaponized disassemblers?',
  '[{"character":"Victor Shaw","secret":"A handheld laser programmer calibrated to metal-eating nanite frequencies."},{"character":"Director Warren Kane","secret":"He had suppressed Victor’s safety reports to secure a twenty-million-dollar military grant."},{"character":"Dr. Nora Vance","secret":"She secretly sympathized with Victor’s safety warnings."},{"character":"Security Officer Tyler Cole","secret":"He caught Victor walking down corridor B twenty minutes before the alarm."}]'::jsonb,
  '[{"lead":"Sterilization chemical leak warning","explanation":"The chemical alarm was an automated response to the door failure, not the cause."},{"lead":"Power grid surge in corridor A","explanation":"A surge occurred when lights flashed, unrelated to molecular breakdown."}]'::jsonb,
  '{"wrongTheories":["The medical nanites experienced a spontaneous genetic radiation mutation.","A foreign corporate spy launched an airborne drone strike against the lab."],"correctTheory":"Victor Shaw reprogrammed metal-eating nanites and released them into the air ducts to trap Director Kane out of revenge for being fired."}'::jsonb,
  'Victor Shaw released modified metallurgical nanites into the air ducts to trap Director Kane in revenge for being fired.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Victor was arrested for cybernetic terrorism, Director Kane was rescued, and federal oversight tightened nanite security."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The chemical purge triggered before the doors opened, suffocating the director while Victor escaped."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The disaster was blamed on unpredictable quantum physics, shutting down the laboratory forever."}]'::jsonb,
  '{"intros":["Within three minutes, all solid brass door handles and titanium lab instruments across corridor B dissolved into a fine gray dust, trapping the director inside.","Case file story_093: Within three minutes, all solid brass door handles and titanium lab instruments across corridor B dissolved into a fine gray dust, trapping the director inside. Look closely at every clue.","Trouble begins in Vanguard Advanced Nanotech Clean-lab, sealed airlocks, bio-hazard orange lights, and stainless steel benches. Within three minutes, all solid brass door handles and titanium lab instruments across corridor B dissolved into a fine gray dust, trapping the director inside.","The mystery starts now. Within three minutes, all solid brass door handles and titanium lab instruments across corridor B dissolved into a fine gray dust, trapping the director inside. Can you solve it?"],"reveals":["Victor Shaw released modified metallurgical nanites into the air ducts to trap Director Kane in revenge for being fired.","The mystery is unraveled! Victor Shaw released modified metallurgical nanites into the air ducts to trap Director Kane in revenge for being fired.","At last, the truth comes out: Victor Shaw released modified metallurgical nanites into the air ducts to trap Director Kane in revenge for being fired.","Case resolved! Here is what happened: Victor Shaw released modified metallurgical nanites into the air ducts to trap Director Kane in revenge for being fired."],"hints":["Pay attention to where Disgruntled Nanite Engineer Victor Shaw was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_093';
DELETE FROM public.case_events WHERE case_id = 'story_093';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '96ccf328-e9fc-5caf-86db-573e2e032cd7',
  'story_093',
  'Victor Shaw',
  'Fired Nanite Engineer',
  'Bitter, sharp features, wearing an unwashed lab coat, twitching fingers, smelling of chemical solvents',
  'I told Director Kane six months ago that these nanites were unstable. This is his own fault!',
  'A handheld laser programmer calibrated to metal-eating nanite frequencies.',
  'Claims he was in the security parking lot packing his belongings into his car',
  'Lead designer of the metallurgical nanite swarm',
  'The nanites were coded to dissolve zinc, brass, and titanium while ignoring glass.',
  'Did not know the security air filter trapped microscopic traces of his customized code packets.',
  '🧪',
  '["I told Director Kane six months ago that these nanites were unstable. This is his own fault!","\"I told Director Kane six months ago that these nanites were unstable. This is his own fault!\"","Listen to me: I told Director Kane six months ago that these nanites were unstable. This is his own fault!","I tell you the truth: I told Director Kane six months ago that these nanites were unstable. This is his own fault!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'beb9bdfe-3332-57a7-a9e9-400230f38988',
  'story_093',
  'Director Warren Kane',
  'Laboratory Director',
  'Pompous, tailored suit, coughing behind sealed glass, terrified of chemical gas',
  'Get me out of here! The door handle literally melted in my hand like sand!',
  'He had suppressed Victor’s safety reports to secure a twenty-million-dollar military grant.',
  'Trapped inside the director’s executive lab suite',
  'Target of the nanite sabotage',
  'The chemical sterilizer cycle triggers automatically in twenty minutes.',
  'Did not know Victor had bypassed the air duct filters with a custom magnetic siphon.',
  '🥼',
  '["Get me out of here! The door handle literally melted in my hand like sand!","\"Get me out of here! The door handle literally melted in my hand like sand!\"","Listen to me: Get me out of here! The door handle literally melted in my hand like sand!","I tell you the truth: Get me out of here! The door handle literally melted in my hand like sand!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c09830fd-40b2-56a9-ada4-cbadeeea276c',
  'story_093',
  'Dr. Nora Vance',
  'Senior Materials Scientist',
  'Methodical, protective hazmat suit, carrying an electromagnetic containment wand',
  'These nanites didn’t mutate naturally. Their molecular bonds show deliberate reprogramming to seek specific alloys.',
  'She secretly sympathized with Victor’s safety warnings.',
  'Working in the secondary clean-room across the courtyard',
  'Colleague of Victor Shaw',
  'Standard cleaning nanites are incapable of digesting titanium alloys without a root override.',
  'Did not suspect Victor would risk lives by trapping the director.',
  '🔬',
  '["These nanites didn’t mutate naturally. Their molecular bonds show deliberate reprogramming to seek specific alloys.","\"These nanites didn’t mutate naturally. Their molecular bonds show deliberate reprogramming to seek specific alloys.\"","Listen to me: These nanites didn’t mutate naturally. Their molecular bonds show deliberate reprogramming to seek specific alloys.","I tell you the truth: These nanites didn’t mutate naturally. Their molecular bonds show deliberate reprogramming to seek specific alloys."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ab91b959-b842-5e09-a1d8-2a8a9f0a3029',
  'story_093',
  'Security Officer Tyler Cole',
  'Hazard Response Guard',
  'Armored hazmat gear, carrying magnetic EMP pulse neutralizers, authoritative',
  'Corridor B’s ventilation access hatch was unbolted from the exterior ceiling ten minutes ago.',
  'He caught Victor walking down corridor B twenty minutes before the alarm.',
  'At the central hazard monitoring console',
  'Responsible for emergency facility containment',
  'The parking lot exit gate was never opened; Victor never left the building.',
  'Did not know how to stop the nanites from reaching the emergency generator.',
  '🛡️',
  '["Corridor B’s ventilation access hatch was unbolted from the exterior ceiling ten minutes ago.","\"Corridor B’s ventilation access hatch was unbolted from the exterior ceiling ten minutes ago.\"","Listen to me: Corridor B’s ventilation access hatch was unbolted from the exterior ceiling ten minutes ago.","I tell you the truth: Corridor B’s ventilation access hatch was unbolted from the exterior ceiling ten minutes ago."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'df99043b-e5c1-5ca6-8204-769ace5f990d',
  'story_093',
  'ev_1',
  1,
  '02:48 PM',
  'The door handles dissolve into gray metallic powder.',
  'The door handles dissolve into gray metallic powder.',
  'A pile of fine gray metallic ash beneath every dissolved door lock.',
  'Gray metallic nanite ash',
  'Dissolved Alloy Powder',
  '["Sawdust","Plastic shavings","Acid corrosion"]'::jsonb,
  'Gray metallic nanite ash',
  '["gray metallic nanite ash","nanite ash","gray ash","metal powder","metallic ash"]'::jsonb,
  'Microscopic residue left when nanites disassemble metal latches.',
  'ev_2',
  true,
  '{"descriptions":["The door handles dissolve into gray metallic powder.","At 02:48 PM: The door handles dissolve into gray metallic powder.","Notice this clue: The door handles dissolve into gray metallic powder."],"hints":["Microscopic residue left when nanites disassemble metal latches.","Clue hint: Think about gray metallic nanite ash.","Search for: a pile of fine gray metallic ash beneath every dissolved door lock."],"clues":["Gray metallic nanite ash","Item: Gray metallic nanite ash","Clue Word: Gray metallic nanite ash"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3f023ec2-0e9d-5649-92f5-9b1c2d0d2f72',
  'story_093',
  'ev_2',
  2,
  '02:52 PM',
  'Dr. Vance examines the powder under an electron microscope.',
  'Dr. Vance examines the powder under an electron microscope.',
  'Synthetic micro-machines programmed with signature instruction "CONSUME_TI".',
  'Nanite instruction code',
  'Microscopic Nanite Image',
  '["Bacteria","Virus","Fungus"]'::jsonb,
  'Nanite instruction code',
  '["nanite instruction code","nanite instruction","nanite code","instruction code","nanites"]'::jsonb,
  'Microscopic programming proving the swarm was weaponized against titanium.',
  'ev_3',
  false,
  '{"descriptions":["Dr. Vance examines the powder under an electron microscope.","At 02:52 PM: Dr. Vance examines the powder under an electron microscope.","Notice this clue: Dr. Vance examines the powder under an electron microscope."],"hints":["Microscopic programming proving the swarm was weaponized against titanium.","Clue hint: Think about nanite instruction code.","Search for: synthetic micro-machines programmed with signature instruction \"consume_ti\"."],"clues":["Nanite instruction code","Item: Nanite instruction code","Clue Word: Nanite instruction code"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'da2078e1-f4dc-5bb7-af84-6f2b7e30b100',
  'story_093',
  'ev_3',
  3,
  '03:02 PM',
  'Officer Cole inspects the ventilation duct above corridor B.',
  'Officer Cole inspects the ventilation duct above corridor B.',
  'An unlatched ceiling grille with fresh glove prints on the metal lip.',
  'Unlatched ventilation grille',
  'Tampered Air Duct',
  '["Broken fan","Clogged filter","Bird nest"]'::jsonb,
  'Unlatched ventilation grille',
  '["unlatched ventilation grille","air duct","ventilation grille","unlatched grille","vent"]'::jsonb,
  'Overhead air vent opened to inject the swarm into the airflow.',
  'ev_4',
  false,
  '{"descriptions":["Officer Cole inspects the ventilation duct above corridor B.","At 03:02 PM: Officer Cole inspects the ventilation duct above corridor B.","Notice this clue: Officer Cole inspects the ventilation duct above corridor B."],"hints":["Overhead air vent opened to inject the swarm into the airflow.","Clue hint: Think about unlatched ventilation grille.","Search for: an unlatched ceiling grille with fresh glove prints on the metal lip."],"clues":["Unlatched ventilation grille","Item: Unlatched ventilation grille","Clue Word: Unlatched ventilation grille"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '14beca9d-1ebf-589d-adf5-4a0e2b6905f2',
  'story_093',
  'ev_4',
  4,
  '03:10 PM',
  'Cole finds an aerosol dispersal canister in the duct.',
  'Cole finds an aerosol dispersal canister in the duct.',
  'A high-pressure canister labeled "METALLURGICAL SWARM B-9".',
  'Dispersal canister',
  'Aerosol Nanite Canister',
  '["Paint can","Air freshener","Fire extinguisher"]'::jsonb,
  'Dispersal canister',
  '["dispersal canister","canister","nanite canister","aerosol can"]'::jsonb,
  'The pressurized cylinder used to spray the micro-machines into the ducts.',
  'ev_5',
  false,
  '{"descriptions":["Cole finds an aerosol dispersal canister in the duct.","At 03:10 PM: Cole finds an aerosol dispersal canister in the duct.","Notice this clue: Cole finds an aerosol dispersal canister in the duct."],"hints":["The pressurized cylinder used to spray the micro-machines into the ducts.","Clue hint: Think about dispersal canister.","Search for: a high-pressure canister labeled \"metallurgical swarm b-9\"."],"clues":["Dispersal canister","Item: Dispersal canister","Clue Word: Dispersal canister"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4e961515-9bfc-56aa-89ef-4888b10cdb69',
  'story_093',
  'ev_5',
  5,
  '03:18 PM',
  'Cole checks the parking lot gate logs.',
  'Cole checks the parking lot gate logs.',
  'Victor’s car was still parked in stall 14, disproving his claim that he went home.',
  'Victor’s parked car',
  'Parking Lot Vehicle Log',
  '["Empty stall","Motorcycle","Delivery van"]'::jsonb,
  'Victor’s parked car',
  '["victor’s parked car","parked car","victor car","vehicle log","parking log"]'::jsonb,
  'Physical proof the fired engineer was still on site during the attack.',
  'ev_6',
  true,
  '{"descriptions":["Cole checks the parking lot gate logs.","At 03:18 PM: Cole checks the parking lot gate logs.","Notice this clue: Cole checks the parking lot gate logs."],"hints":["Physical proof the fired engineer was still on site during the attack.","Clue hint: Think about victor’s parked car.","Search for: victor’s car was still parked in stall 14, disproving his claim that he went home."],"clues":["Victor’s parked car","Item: Victor’s parked car","Clue Word: Victor’s parked car"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '77374290-dfc2-5a27-b320-5b13414ef6fe',
  'story_093',
  'ev_6',
  6,
  '03:25 PM',
  'Cole corners Victor in the basement locker room.',
  'Cole corners Victor in the basement locker room.',
  'A handheld laser programmer in Victor’s pocket showing the exact override code.',
  'Handheld laser programmer',
  'Nanite Frequency Transmitter',
  '["Smartphone","Calculator","Flashlight"]'::jsonb,
  'Handheld laser programmer',
  '["handheld laser programmer","laser programmer","programmer","transmitter","nanite transmitter"]'::jsonb,
  'Electronic device used to broadcast commands to the nanite swarm.',
  'ev_7',
  false,
  '{"descriptions":["Cole corners Victor in the basement locker room.","At 03:25 PM: Cole corners Victor in the basement locker room.","Notice this clue: Cole corners Victor in the basement locker room."],"hints":["Electronic device used to broadcast commands to the nanite swarm.","Clue hint: Think about handheld laser programmer.","Search for: a handheld laser programmer in victor’s pocket showing the exact override code."],"clues":["Handheld laser programmer","Item: Handheld laser programmer","Clue Word: Handheld laser programmer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e4e6719e-b76d-5dee-bb86-af1a97b03b21',
  'story_093',
  'ev_7',
  7,
  '03:30 PM',
  'Dr. Vance uses Victor’s transmitter to broadcast the shutdown kill-code.',
  'Dr. Vance uses Victor’s transmitter to broadcast the shutdown kill-code.',
  'The nanites deactivate instantly, falling harmlessly to the ground as dead iron dust.',
  'Nanite kill-code broadcast',
  'Broadcast Shutdown Log',
  '["Water hose","Fire","Chemical spray"]'::jsonb,
  'Nanite kill-code broadcast',
  '["nanite kill-code broadcast","kill code","nanite kill code","shutdown log","kill code broadcast"]'::jsonb,
  'Emergency wireless command halting the swarm before the chemical purge.',
  'ev_8',
  false,
  '{"descriptions":["Dr. Vance uses Victor’s transmitter to broadcast the shutdown kill-code.","At 03:30 PM: Dr. Vance uses Victor’s transmitter to broadcast the shutdown kill-code.","Notice this clue: Dr. Vance uses Victor’s transmitter to broadcast the shutdown kill-code."],"hints":["Emergency wireless command halting the swarm before the chemical purge.","Clue hint: Think about nanite kill-code broadcast.","Search for: the nanites deactivate instantly, falling harmlessly to the ground as dead iron dust."],"clues":["Nanite kill-code broadcast","Item: Nanite kill-code broadcast","Clue Word: Nanite kill-code broadcast"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '260cf10c-8073-5bd0-b5ec-953a9900949a',
  'story_093',
  'ev_8',
  8,
  '03:35 PM',
  'Emergency responders pry open the suite door and rescue Director Kane.',
  'Emergency responders pry open the suite door and rescue Director Kane.',
  'Director Kane safe and Victor Shaw placed under federal arrest.',
  'Victor Shaw arrest',
  'Arrest Warrant for Sabotage',
  '["Evacuation","Apology","Promotion"]'::jsonb,
  'Victor Shaw arrest',
  '["victor shaw arrest","arrest","victor arrest","sabotage warrant","arrest warrant"]'::jsonb,
  'Apprehension of the saboteur for weaponized biological/technological assault.',
  NULL,
  true,
  '{"descriptions":["Emergency responders pry open the suite door and rescue Director Kane.","At 03:35 PM: Emergency responders pry open the suite door and rescue Director Kane.","Notice this clue: Emergency responders pry open the suite door and rescue Director Kane."],"hints":["Apprehension of the saboteur for weaponized biological/technological assault.","Clue hint: Think about victor shaw arrest.","Search for: director kane safe and victor shaw placed under federal arrest."],"clues":["Victor Shaw arrest","Item: Victor Shaw arrest","Clue Word: Victor Shaw arrest"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_094 — THE HOLOGRAM WITH NO ORIGIN
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_094',
  'The Hologram with No Origin',
  'Sci-Fi / Cyber',
  'The high-tech gallery of the Neo-Tokyo Cyber Museum, dark polished obsidian floors, glass display cases, and pulsing neon beams',
  'In the center of an empty, powered-down exhibit room, a hyper-realistic 3D hologram of a fatal stabbing played on an endless sixty-second loop with no projector in sight.',
  '[{"name":"Kenji Sato","role":"Visionary Holographic Artist","alibi":"Strolling through the main gallery greeting patrons","avatar":"🎭"},{"name":"Arthur Vance (Victim in Loop)","role":"Late Museum Benefactor","alibi":"Missing for three days prior to the opening","avatar":"🖼️"},{"name":"Dr. Yuna Tanaka","role":"Quantum Optics Specialist","alibi":"Analyzing the anomaly in gallery 2","avatar":"🔬"},{"name":"Detective Shinzo Mori","role":"Metropolitan Homicide Detective","alibi":"Reviewing museum entry logs at the security desk","avatar":"🕵️"}]'::jsonb,
  'Kenji Sato murdered his wealthy sponsor Arthur Vance after Vance threatened to cut off his funding. Consumed by guilt and vanity, Kenji painted the ceiling with photon-emitting quantum micro-pigments, creating a looping holographic ghost of the murder that played without any conventional projector.',
  'Holographic Artist Kenji Sato',
  'Kenji staged the hologram loop as a cryptic confession of murdering his gallery sponsor three days ago.',
  '[{"time":"Three Days Ago - 08:00 PM","event":"Arthur confronts Kenji over embezzled funds in gallery 2."},{"time":"Three Days Ago - 08:30 PM","event":"Kenji stabs Arthur with a glass chisel; Arthur’s security cam records it."},{"time":"Two Days Ago","event":"Kenji paints the ceiling with quantum-dot micro-emitters encoding the video."},{"time":"Today - 07:00 PM","event":"Museum gallery opens; the hologram loop begins playing from the ceiling."},{"time":"Today - 07:30 PM","event":"Detective Mori recognizes Arthur Vance in the flickering 3D loop."}]'::jsonb,
  '[{"id":"ev_1","title":"Holographic Frame Capture","detail":"3D projection loop showing Arthur Vance murdered with forensic precision."},{"id":"ev_2","title":"Ceiling Paint Analysis","detail":"Quantum-dot paint layer on the ceiling acting as a distributed flat-panel projector."},{"id":"ev_3","title":"Plaster Sculpture X-Ray","detail":"X-ray scan revealing Arthur Vance’s body encased inside the gallery 4 sculpture."},{"id":"ev_4","title":"Glass Murder Weapon","detail":"Sculpting chisel matching the wound in the hologram with Arthur Vance’s blood."}]'::jsonb,
  '[{"order":1,"title":"Ruby cufflink in hologram","text":"Identifies the projection victim as missing billionaire Arthur Vance."},{"order":2,"title":"Quantum micro-emitters","text":"Solves the mystery of how a hologram could play without a projector."},{"order":3,"title":"Blood spatter under paint","text":"Forensic proof that the real murder occurred right under the ceiling."},{"order":4,"title":"Watch transmitter","text":"Proves Kenji controlled the timing and activation of the phantom loop."},{"order":5,"title":"Slow-motion lip reading","text":"The victim directly names his killer in the projection itself."},{"order":6,"title":"Body inside sculpture","text":"Locates the physical corpse hidden within the exhibition."}]'::jsonb,
  'Museum optical fiber junction box: The museum had standard fiber optic cables, but none fed gallery 2.; Eccentric patron with holographic camera: A patron had a consumer camera, but could not project ceiling images.',
  'Claim the building was haunted by a futuristic temporal time-displacement loop.',
  'NORMAL',
  'Where was the projection coming from, and who was the victim dying in the holographic loop?',
  '[{"character":"Kenji Sato","secret":"A remote frequency activator disguised as his antique brass pocket watch."},{"character":"Arthur Vance (Victim in Loop)","secret":"His actual body was hidden inside a hollow plaster sculpture in gallery 4."},{"character":"Dr. Yuna Tanaka","secret":"She was commissioned by the board to inspect museum optical security."},{"character":"Detective Shinzo Mori","secret":"He had received a missing-person report for Arthur Vance two days ago."}]'::jsonb,
  '[{"lead":"Museum optical fiber junction box","explanation":"The museum had standard fiber optic cables, but none fed gallery 2."},{"lead":"Eccentric patron with holographic camera","explanation":"A patron had a consumer camera, but could not project ceiling images."}]'::jsonb,
  '{"wrongTheories":["A temporal rift created a time-loop recording of a future murder in the gallery.","A rival cyber-collective hacked the museum screens to frame the artist with CGI."],"correctTheory":"Kenji Sato murdered his sponsor, hid the body in a sculpture, and painted the ceiling with quantum micro-emitters to project the crime."}'::jsonb,
  'Kenji Sato murdered his sponsor Arthur Vance, hid him in a sculpture, and used quantum paint on the ceiling to project the death.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Kenji Sato was convicted of first-degree murder, the body was recovered, and the exhibit was dismantled."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Kenji’s installation was praised as brilliant fiction, while Arthur Vance remained listed as an unsolved missing person."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The media declared the museum haunted, turning it into a tourist trap while the murder went unpunished."}]'::jsonb,
  '{"intros":["In the center of an empty, powered-down exhibit room, a hyper-realistic 3D hologram of a fatal stabbing played on an endless sixty-second loop with no projector in sight.","Case file story_094: In the center of an empty, powered-down exhibit room, a hyper-realistic 3D hologram of a fatal stabbing played on an endless sixty-second loop with no projector in sight. Look closely at every clue.","Trouble begins in The high-tech gallery of the Neo-Tokyo Cyber Museum, dark polished obsidian floors, glass display cases, and pulsing neon beams. In the center of an empty, powered-down exhibit room, a hyper-realistic 3D hologram of a fatal stabbing played on an endless sixty-second loop with no projector in sight.","The mystery starts now. In the center of an empty, powered-down exhibit room, a hyper-realistic 3D hologram of a fatal stabbing played on an endless sixty-second loop with no projector in sight. Can you solve it?"],"reveals":["Kenji Sato murdered his sponsor Arthur Vance, hid him in a sculpture, and used quantum paint on the ceiling to project the death.","The mystery is unraveled! Kenji Sato murdered his sponsor Arthur Vance, hid him in a sculpture, and used quantum paint on the ceiling to project the death.","At last, the truth comes out: Kenji Sato murdered his sponsor Arthur Vance, hid him in a sculpture, and used quantum paint on the ceiling to project the death.","Case resolved! Here is what happened: Kenji Sato murdered his sponsor Arthur Vance, hid him in a sculpture, and used quantum paint on the ceiling to project the death."],"hints":["Pay attention to where Holographic Artist Kenji Sato was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_094';
DELETE FROM public.case_events WHERE case_id = 'story_094';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3ddb7c24-33f4-5a26-80bc-bab1b56db37a',
  'story_094',
  'Kenji Sato',
  'Visionary Holographic Artist',
  'Avant-garde, paint-smeared velvet coat, nervous laughter, obsessed with "eternal moments"',
  'This is my masterpiece—the phantom memory of the city, captured without cameras or wires!',
  'A remote frequency activator disguised as his antique brass pocket watch.',
  'Strolling through the main gallery greeting patrons',
  'Resident artist whose exhibition was opening tonight',
  'The micro-pigment quantum dots on the ceiling activate when hit by ultraviolet lights.',
  'Did not know the museum’s infrared spectrometer could detect blood splatter under the ceiling paint.',
  '🎭',
  '["This is my masterpiece—the phantom memory of the city, captured without cameras or wires!","\"This is my masterpiece—the phantom memory of the city, captured without cameras or wires!\"","Listen to me: This is my masterpiece—the phantom memory of the city, captured without cameras or wires!","I tell you the truth: This is my masterpiece—the phantom memory of the city, captured without cameras or wires!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '09995523-b78e-5fc8-a865-5ada36219346',
  'story_094',
  'Arthur Vance (Victim in Loop)',
  'Late Museum Benefactor',
  'Arrogant billionaire art collector, seen in the loop clutching his chest and falling',
  'Victim in the projection; mouth movements in the hologram whisper: "Kenji... why?"',
  'His actual body was hidden inside a hollow plaster sculpture in gallery 4.',
  'Missing for three days prior to the opening',
  'Financial backer of Kenji’s art exhibitions',
  'Kenji had embezzled half a million dollars of museum funds.',
  'Did not expect Kenji to stab him with an antique glass sculpting chisel.',
  '🖼️',
  '["Victim in the projection; mouth movements in the hologram whisper: \"Kenji... why?\"","\"Victim in the projection; mouth movements in the hologram whisper: \"Kenji... why?\"\"","Listen to me: Victim in the projection; mouth movements in the hologram whisper: \"Kenji... why?\"","I tell you the truth: Victim in the projection; mouth movements in the hologram whisper: \"Kenji... why?\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '65886fc1-e9d7-5e64-b8d7-26f6e21b6edc',
  'story_094',
  'Dr. Yuna Tanaka',
  'Quantum Optics Specialist',
  'Glasses, lab tablet, methodical, examining light interference patterns',
  'Light doesn’t bend in mid-air without a focal point. The photons are radiating directly from the ceiling surface.',
  'She was commissioned by the board to inspect museum optical security.',
  'Analyzing the anomaly in gallery 2',
  'Independent optical consultant',
  'The ceiling is coated with experimental quantum-dot luminescent paint.',
  'Did not know the hologram was an exact visual recording of a real homicide.',
  '🔬',
  '["Light doesn’t bend in mid-air without a focal point. The photons are radiating directly from the ceiling surface.","\"Light doesn’t bend in mid-air without a focal point. The photons are radiating directly from the ceiling surface.\"","Listen to me: Light doesn’t bend in mid-air without a focal point. The photons are radiating directly from the ceiling surface.","I tell you the truth: Light doesn’t bend in mid-air without a focal point. The photons are radiating directly from the ceiling surface."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '671bb390-9ec0-519e-b72b-35a835637016',
  'story_094',
  'Detective Shinzo Mori',
  'Metropolitan Homicide Detective',
  'Sharp trench coat, quiet observation, smoking an electronic cigarette',
  'When an artist creates a loop of a man getting murdered, it’s not always fiction.',
  'He had received a missing-person report for Arthur Vance two days ago.',
  'Reviewing museum entry logs at the security desk',
  'Investigating Arthur Vance’s disappearance',
  'The man in the hologram wore the exact bespoke cufflink Arthur Vance owned.',
  'Did not know where Arthur’s real physical body was concealed.',
  '🕵️',
  '["When an artist creates a loop of a man getting murdered, it’s not always fiction.","\"When an artist creates a loop of a man getting murdered, it’s not always fiction.\"","Listen to me: When an artist creates a loop of a man getting murdered, it’s not always fiction.","I tell you the truth: When an artist creates a loop of a man getting murdered, it’s not always fiction."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5512fc7a-795e-5711-b267-0f291b07af37',
  'story_094',
  'ev_1',
  1,
  '07:30 PM',
  'Detective Mori watches the 3D loop replay the fatal stabbing.',
  'Detective Mori watches the 3D loop replay the fatal stabbing.',
  'The victim in the hologram wears Arthur Vance’s custom ruby cufflink.',
  'Ruby cufflink in hologram',
  'Holographic Frame Capture',
  '["Gold watch","Diamond ring","Tie clip"]'::jsonb,
  'Ruby cufflink in hologram',
  '["ruby cufflink in hologram","cufflink","ruby cufflink","hologram cufflink","frame capture"]'::jsonb,
  'Jewelry on the holographic victim matching the missing billionaire.',
  'ev_2',
  true,
  '{"descriptions":["Detective Mori watches the 3D loop replay the fatal stabbing.","At 07:30 PM: Detective Mori watches the 3D loop replay the fatal stabbing.","Notice this clue: Detective Mori watches the 3D loop replay the fatal stabbing."],"hints":["Jewelry on the holographic victim matching the missing billionaire.","Clue hint: Think about ruby cufflink in hologram.","Search for: the victim in the hologram wears arthur vance’s custom ruby cufflink."],"clues":["Ruby cufflink in hologram","Item: Ruby cufflink in hologram","Clue Word: Ruby cufflink in hologram"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fb3fbda8-c965-5a70-92fb-c56d03a025b4',
  'story_094',
  'ev_2',
  2,
  '07:45 PM',
  'Dr. Tanaka shines a spectrometer at the ceiling.',
  'Dr. Tanaka shines a spectrometer at the ceiling.',
  'A coat of microscopic quantum-dot emitters embedded in the white ceiling paint.',
  'Quantum micro-emitters',
  'Ceiling Paint Analysis',
  '["Fluorescent chalk","Lead paint","Fiber optic strands"]'::jsonb,
  'Quantum micro-emitters',
  '["quantum micro-emitters","micro-emitters","quantum emitters","ceiling paint","quantum dots"]'::jsonb,
  'High-tech light-emitting particles hidden inside normal ceiling paint.',
  'ev_3',
  false,
  '{"descriptions":["Dr. Tanaka shines a spectrometer at the ceiling.","At 07:45 PM: Dr. Tanaka shines a spectrometer at the ceiling.","Notice this clue: Dr. Tanaka shines a spectrometer at the ceiling."],"hints":["High-tech light-emitting particles hidden inside normal ceiling paint.","Clue hint: Think about quantum micro-emitters.","Search for: a coat of microscopic quantum-dot emitters embedded in the white ceiling paint."],"clues":["Quantum micro-emitters","Item: Quantum micro-emitters","Clue Word: Quantum micro-emitters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '623fb2d6-b5d7-528b-bbc4-d611cf035f59',
  'story_094',
  'ev_3',
  3,
  '08:00 PM',
  'Mori uses an infrared laser scanner on the ceiling tiles.',
  'Mori uses an infrared laser scanner on the ceiling tiles.',
  'Blood spatter beneath the quantum paint layer matching Arthur’s blood type.',
  'Blood spatter under paint',
  'Sub-Paint Blood Pattern',
  '["Water stain","Rust","Coffee spill"]'::jsonb,
  'Blood spatter under paint',
  '["blood spatter under paint","blood spatter","blood under paint","sub-paint blood","blood pattern"]'::jsonb,
  'Real forensic blood covered up by a fresh coat of high-tech paint.',
  'ev_4',
  false,
  '{"descriptions":["Mori uses an infrared laser scanner on the ceiling tiles.","At 08:00 PM: Mori uses an infrared laser scanner on the ceiling tiles.","Notice this clue: Mori uses an infrared laser scanner on the ceiling tiles."],"hints":["Real forensic blood covered up by a fresh coat of high-tech paint.","Clue hint: Think about blood spatter under paint.","Search for: blood spatter beneath the quantum paint layer matching arthur’s blood type."],"clues":["Blood spatter under paint","Item: Blood spatter under paint","Clue Word: Blood spatter under paint"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f2e8dd71-a378-5287-8b8c-55d8009b5d7b',
  'story_094',
  'ev_4',
  4,
  '08:15 PM',
  'Mori inspects Kenji’s antique pocket watch on his vest.',
  'Mori inspects Kenji’s antique pocket watch on his vest.',
  'A high-frequency Bluetooth transmitter hidden inside the pocket watch casing.',
  'Watch transmitter',
  'Modified Pocket Watch',
  '["Windup spring","Compass","Lighter"]'::jsonb,
  'Watch transmitter',
  '["watch transmitter","pocket watch","transmitter","modified watch"]'::jsonb,
  'The wireless controller used to turn the ceiling quantum hologram on and off.',
  'ev_5',
  false,
  '{"descriptions":["Mori inspects Kenji’s antique pocket watch on his vest.","At 08:15 PM: Mori inspects Kenji’s antique pocket watch on his vest.","Notice this clue: Mori inspects Kenji’s antique pocket watch on his vest."],"hints":["The wireless controller used to turn the ceiling quantum hologram on and off.","Clue hint: Think about watch transmitter.","Search for: a high-frequency bluetooth transmitter hidden inside the pocket watch casing."],"clues":["Watch transmitter","Item: Watch transmitter","Clue Word: Watch transmitter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6ea3ffe0-2dfc-5869-8d3e-eaffc0f14443',
  'story_094',
  'ev_5',
  5,
  '08:30 PM',
  'Mori reads the lips of the holographic victim on slow-motion replay.',
  'Mori reads the lips of the holographic victim on slow-motion replay.',
  'Arthur mouth movements clearly saying: "Kenji, why did you do this?"',
  'Slow-motion lip reading',
  'Visual Lip Analysis',
  '["Coughing","Screaming help","Singing"]'::jsonb,
  'Slow-motion lip reading',
  '["slow-motion lip reading","lip reading","lip analysis","slow motion","victim words"]'::jsonb,
  'Visual proof of the victim naming Kenji right before collapsing.',
  'ev_6',
  true,
  '{"descriptions":["Mori reads the lips of the holographic victim on slow-motion replay.","At 08:30 PM: Mori reads the lips of the holographic victim on slow-motion replay.","Notice this clue: Mori reads the lips of the holographic victim on slow-motion replay."],"hints":["Visual proof of the victim naming Kenji right before collapsing.","Clue hint: Think about slow-motion lip reading.","Search for: arthur mouth movements clearly saying: \"kenji, why did you do this?\""],"clues":["Slow-motion lip reading","Item: Slow-motion lip reading","Clue Word: Slow-motion lip reading"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9fb9ef31-1859-50d9-9dc4-609285133802',
  'story_094',
  'ev_6',
  6,
  '08:45 PM',
  'Police bring an X-ray scanner into adjacent gallery 4.',
  'Police bring an X-ray scanner into adjacent gallery 4.',
  'A human body concealed inside a hollow plaster sculpture titled "The Sinner".',
  'Body inside sculpture',
  'Plaster Sculpture X-Ray',
  '["Empty cavity","Bronze armature","Stone block"]'::jsonb,
  'Body inside sculpture',
  '["body inside sculpture","body in sculpture","sculpture body","plaster x-ray","sculpture x-ray"]'::jsonb,
  'The physical remains of Arthur Vance hidden inside Kenji’s modern art piece.',
  'ev_7',
  false,
  '{"descriptions":["Police bring an X-ray scanner into adjacent gallery 4.","At 08:45 PM: Police bring an X-ray scanner into adjacent gallery 4.","Notice this clue: Police bring an X-ray scanner into adjacent gallery 4."],"hints":["The physical remains of Arthur Vance hidden inside Kenji’s modern art piece.","Clue hint: Think about body inside sculpture.","Search for: a human body concealed inside a hollow plaster sculpture titled \"the sinner\"."],"clues":["Body inside sculpture","Item: Body inside sculpture","Clue Word: Body inside sculpture"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '13b6986d-4150-58f8-bb90-8d9219702ac8',
  'story_094',
  'ev_7',
  7,
  '09:00 PM',
  'Kenji’s studio is searched by forensics.',
  'Kenji’s studio is searched by forensics.',
  'A triangular glass sculpting chisel with dried blood in the wooden handle.',
  'Glass sculpting chisel',
  'Glass Murder Weapon',
  '["Steel knife","Hammer","Palette knife"]'::jsonb,
  'Glass sculpting chisel',
  '["glass sculpting chisel","chisel","glass chisel","sculpting chisel","murder weapon"]'::jsonb,
  'The transparent artist tool used to inflict the fatal puncture wound.',
  'ev_8',
  false,
  '{"descriptions":["Kenji’s studio is searched by forensics.","At 09:00 PM: Kenji’s studio is searched by forensics.","Notice this clue: Kenji’s studio is searched by forensics."],"hints":["The transparent artist tool used to inflict the fatal puncture wound.","Clue hint: Think about glass sculpting chisel.","Search for: a triangular glass sculpting chisel with dried blood in the wooden handle."],"clues":["Glass sculpting chisel","Item: Glass sculpting chisel","Clue Word: Glass sculpting chisel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '82636c45-cbb3-5a62-8241-cfd211917129',
  'story_094',
  'ev_8',
  8,
  '09:15 PM',
  'Kenji Sato collapses in artistic grief and confesses.',
  'Kenji Sato collapses in artistic grief and confesses.',
  'Kenji’s full confession that he turned his crime into an eternal holographic exhibit.',
  'Kenji’s confession',
  'Signed Murder Confession',
  '["Denial","Insanity plea","Silence"]'::jsonb,
  'Kenji’s confession',
  '["kenji’s confession","confession","kenji confession","artist confession","signed confession"]'::jsonb,
  'The artist admitting his guilt and morbid desire for artistic immortality.',
  NULL,
  true,
  '{"descriptions":["Kenji Sato collapses in artistic grief and confesses.","At 09:15 PM: Kenji Sato collapses in artistic grief and confesses.","Notice this clue: Kenji Sato collapses in artistic grief and confesses."],"hints":["The artist admitting his guilt and morbid desire for artistic immortality.","Clue hint: Think about kenji’s confession.","Search for: kenji’s full confession that he turned his crime into an eternal holographic exhibit."],"clues":["Kenji’s confession","Item: Kenji’s confession","Clue Word: Kenji’s confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_095 — THE STOLEN FUSION BATTERY
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_095',
  'The Stolen Fusion Battery',
  'Sci-Fi / Cyber',
  'The engine room of the Neo-Chicago Mag-Lev Bullet Train, humming superconducting coils, magnetic rails, and pulsing blue plasma conduit',
  'While cruising at 400 miles per hour through the subterranean transit tube, the train’s primary tritium fusion core was pulled from its cradle without triggering the radiation alarm.',
  '[{"name":"Carl Ortiz","role":"Chief Propulsion Engineer","alibi":"Monitoring the magnetic suspension consoles in the engine cab","avatar":"🔧"},{"name":"Conductor Brian Thorne","role":"Train Conductor","alibi":"In passenger coach 3 assisting travelers","avatar":"🚆"},{"name":"Inspector Nina Chen","role":"Transit Safety Inspector","alibi":"In the dining car when the primary power dropped","avatar":"🔍"},{"name":"Sergeant Marcus Vance","role":"Transit Police Officer","alibi":"Guarding the locomotive access door","avatar":"👮‍♂️"}]'::jsonb,
  'Chief Engineer Carl Ortiz coordinated with black-market arms buyers to steal the train’s high-density tritium fusion battery. Carl inserted an insulated magnetic containment sleeve into the core housing, swapped the glowing battery for an inert ballast capacitor, and lowered the battery through the service bilge into a trackside drop chute.',
  'Chief Propulsion Engineer Carl Ortiz',
  'Carl had sold the military-grade fusion cell to black-market arms dealers to pay off offshore debts.',
  '[{"time":"03:45 PM","event":"The Mag-Lev train enters the 100-mile subterranean mountain tunnel."},{"time":"04:10 PM","event":"Carl inserts the cryo-magnetic sleeve into the fusion core reactor."},{"time":"04:15 PM","event":"Carl drops the dummy ballast into the cradle and extracts the fusion battery."},{"time":"04:18 PM","event":"Carl drops the shielded battery through bilge chute 3 at tunnel milepost 42."},{"time":"04:20 PM","event":"Backup capacitors engage; Inspector Chen begins emergency investigation."}]'::jsonb,
  '[{"id":"ev_1","title":"Counterfeit Core Ballast","detail":"Weighted steel block painted luminescent blue to deceive cradle load sensors."},{"id":"ev_2","title":"Open Bilge Chute","detail":"Emergency undercarriage ejection chute opened at milepost 42 at 400 MPH."},{"id":"ev_3","title":"Shielding Sleeve Box","detail":"Packaging for a military cryo-magnetic sleeve used to suppress radiation signatures."},{"id":"ev_4","title":"GPS Flight Coordinates","detail":"Handheld tablet data logging the precise coordinates of the drop at milepost 42."}]'::jsonb,
  '[{"order":1,"title":"Painted dummy battery","text":"Demonstrates meticulous advance planning to fake the core presence."},{"order":2,"title":"Zero radiation reading","text":"Proves the battery was cleanly shielded rather than vaporized in an accident."},{"order":3,"title":"Bilge chute 3 hatch","text":"Reveals the physical path by which the battery left the speeding train."},{"order":4,"title":"Magnetic sleeve case","text":"Connects Carl directly to the specialized containment hardware."},{"order":5,"title":"Trackside hover-truck intercept","text":"Confirms accomplices received the jettisoned battery on the track."},{"order":6,"title":"Cartel wire receipt","text":"The ten-million-credit financial motive behind the theft."}]'::jsonb,
  'Superconducting coil heat fluctuation: Coils warmed up when power switched, a normal electrical consequence.; Passenger who left car 1 abruptly: The nervous traveler was airsick, with zero technical knowledge.',
  'Claim a high-tech teleportation beam intercepted the core while the train was in the tunnel.',
  'NORMAL',
  'How was a lethal radioactive fusion battery removed without killing the thief or crashing the train?',
  '[{"character":"Carl Ortiz","secret":"A wire transfer receipt for ten million credits from the Iron Brotherhood cartel."},{"character":"Conductor Brian Thorne","secret":"He was checking passenger tickets in car 3 when the emergency lights flashed."},{"character":"Inspector Nina Chen","secret":"She was performing an unannounced safety inspection aboard the train."},{"character":"Sergeant Marcus Vance","secret":"He caught Carl talking on an encrypted burner phone twenty minutes before the power shift."}]'::jsonb,
  '[{"lead":"Superconducting coil heat fluctuation","explanation":"Coils warmed up when power switched, a normal electrical consequence."},{"lead":"Passenger who left car 1 abruptly","explanation":"The nervous traveler was airsick, with zero technical knowledge."}]'::jsonb,
  '{"wrongTheories":["The fusion core suffered a spontaneous quantum decay and vaporized into plasma.","A rival rail corporation beamed the battery out using a high-altitude energy satellite."],"correctTheory":"Chief Propulsion Engineer Carl Ortiz swapped the fusion battery for a dummy and dropped it down the bilge chute for ten million credits."}'::jsonb,
  'Carl Ortiz used a magnetic shielding sleeve to swap the core for a dummy and dropped it through a floor chute to waiting accomplices.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The battery was safely recovered, Carl was convicted of grand treason and transit piracy, and the train arrived safely."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The backup capacitors died, stranding the train in the subterranean tunnel while the cartel fled with the core."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The transit authority covered up the theft to avoid panic, leaving the weaponized core in the hands of terrorists."}]'::jsonb,
  '{"intros":["While cruising at 400 miles per hour through the subterranean transit tube, the train’s primary tritium fusion core was pulled from its cradle without triggering the radiation alarm.","Case file story_095: While cruising at 400 miles per hour through the subterranean transit tube, the train’s primary tritium fusion core was pulled from its cradle without triggering the radiation alarm. Look closely at every clue.","Trouble begins in The engine room of the Neo-Chicago Mag-Lev Bullet Train, humming superconducting coils, magnetic rails, and pulsing blue plasma conduit. While cruising at 400 miles per hour through the subterranean transit tube, the train’s primary tritium fusion core was pulled from its cradle without triggering the radiation alarm.","The mystery starts now. While cruising at 400 miles per hour through the subterranean transit tube, the train’s primary tritium fusion core was pulled from its cradle without triggering the radiation alarm. Can you solve it?"],"reveals":["Carl Ortiz used a magnetic shielding sleeve to swap the core for a dummy and dropped it through a floor chute to waiting accomplices.","The mystery is unraveled! Carl Ortiz used a magnetic shielding sleeve to swap the core for a dummy and dropped it through a floor chute to waiting accomplices.","At last, the truth comes out: Carl Ortiz used a magnetic shielding sleeve to swap the core for a dummy and dropped it through a floor chute to waiting accomplices.","Case resolved! Here is what happened: Carl Ortiz used a magnetic shielding sleeve to swap the core for a dummy and dropped it through a floor chute to waiting accomplices."],"hints":["Pay attention to where Chief Propulsion Engineer Carl Ortiz was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_095';
DELETE FROM public.case_events WHERE case_id = 'story_095';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'eebaddbe-c610-5fa8-8be1-1af3fa99312d',
  'story_095',
  'Carl Ortiz',
  'Chief Propulsion Engineer',
  'Grease-smeared jumpsuit, heavy work boots, thick welding gloves, calm under pressure',
  'The magnetic containment cradle had an unexpected plasma destabilization. The core vaporized itself!',
  'A wire transfer receipt for ten million credits from the Iron Brotherhood cartel.',
  'Monitoring the magnetic suspension consoles in the engine cab',
  'Chief engineer responsible for the train’s power plant',
  'The battery weighs fifty pounds and emits zero radiation when enclosed in lead-alloy magnetic sleeves.',
  'Did not know the secondary track sensor logged an abnormal 50-pound drop through bilge chute 3.',
  '🔧',
  '["The magnetic containment cradle had an unexpected plasma destabilization. The core vaporized itself!","\"The magnetic containment cradle had an unexpected plasma destabilization. The core vaporized itself!\"","Listen to me: The magnetic containment cradle had an unexpected plasma destabilization. The core vaporized itself!","I tell you the truth: The magnetic containment cradle had an unexpected plasma destabilization. The core vaporized itself!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5d6b6a7c-5177-5103-806d-b7e56e092a29',
  'story_095',
  'Conductor Brian Thorne',
  'Train Conductor',
  'Impeccable uniform, pocket chronometer, anxious about passenger safety',
  'The backup capacitors kicked in automatically at 04:18 PM. We only have forty minutes of power left!',
  'He was checking passenger tickets in car 3 when the emergency lights flashed.',
  'In passenger coach 3 assisting travelers',
  'Commander of the Mag-Lev passenger express',
  'Only certified propulsion engineers possess the digital key to open the battery cradle.',
  'Did not understand how Carl bypassed the automated radiation trip sensors.',
  '🚆',
  '["The backup capacitors kicked in automatically at 04:18 PM. We only have forty minutes of power left!","\"The backup capacitors kicked in automatically at 04:18 PM. We only have forty minutes of power left!\"","Listen to me: The backup capacitors kicked in automatically at 04:18 PM. We only have forty minutes of power left!","I tell you the truth: The backup capacitors kicked in automatically at 04:18 PM. We only have forty minutes of power left!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '48d208cc-93cc-516a-9a60-97263f461a69',
  'story_095',
  'Inspector Nina Chen',
  'Transit Safety Inspector',
  'Analytical, wearing radiation badge and high-voltage boots, carrying Geiger counters',
  'Fusion batteries don’t vaporize into thin air. If it exploded, this entire train would be a radioactive crater.',
  'She was performing an unannounced safety inspection aboard the train.',
  'In the dining car when the primary power dropped',
  'Federal transit security investigator',
  'The cradle was occupied by a weighted steel dummy block painted with glow paint.',
  'Did not know where the real battery had been jettisoned along the track.',
  '🔍',
  '["Fusion batteries don’t vaporize into thin air. If it exploded, this entire train would be a radioactive crater.","\"Fusion batteries don’t vaporize into thin air. If it exploded, this entire train would be a radioactive crater.\"","Listen to me: Fusion batteries don’t vaporize into thin air. If it exploded, this entire train would be a radioactive crater.","I tell you the truth: Fusion batteries don’t vaporize into thin air. If it exploded, this entire train would be a radioactive crater."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c216368d-691f-5c4d-a001-43567b179ba4',
  'story_095',
  'Sergeant Marcus Vance',
  'Transit Police Officer',
  'Heavy armor, carrying tactical shotgun, grim expression',
  'The exterior maintenance hatch underneath the engine car has fresh scrape marks.',
  'He caught Carl talking on an encrypted burner phone twenty minutes before the power shift.',
  'Guarding the locomotive access door',
  'Transit law enforcement',
  'Track maintenance crews reported a black hover-truck waiting near tunnel milepost 42.',
  'Did not know Carl’s encrypted communication frequency.',
  '👮‍♂️',
  '["The exterior maintenance hatch underneath the engine car has fresh scrape marks.","\"The exterior maintenance hatch underneath the engine car has fresh scrape marks.\"","Listen to me: The exterior maintenance hatch underneath the engine car has fresh scrape marks.","I tell you the truth: The exterior maintenance hatch underneath the engine car has fresh scrape marks."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '68c948dc-93dc-588d-99d4-05a3453cf005',
  'story_095',
  'ev_1',
  1,
  '04:20 PM',
  'Inspector Chen inspects the reactor core housing.',
  'Inspector Chen inspects the reactor core housing.',
  'A weighted steel ballast block coated in luminescent blue paint inside the cradle.',
  'Painted dummy battery',
  'Counterfeit Core Ballast',
  '["Empty socket","Melted slag","Shattered glass"]'::jsonb,
  'Painted dummy battery',
  '["painted dummy battery","dummy battery","painted battery","fake battery","ballast block"]'::jsonb,
  'A painted chunk of steel placed in the cradle to fool weight sensors.',
  'ev_2',
  true,
  '{"descriptions":["Inspector Chen inspects the reactor core housing.","At 04:20 PM: Inspector Chen inspects the reactor core housing.","Notice this clue: Inspector Chen inspects the reactor core housing."],"hints":["A painted chunk of steel placed in the cradle to fool weight sensors.","Clue hint: Think about painted dummy battery.","Search for: a weighted steel ballast block coated in luminescent blue paint inside the cradle."],"clues":["Painted dummy battery","Item: Painted dummy battery","Clue Word: Painted dummy battery"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6318037a-723d-5463-8d5c-1ea2b389ef63',
  'story_095',
  'ev_2',
  2,
  '04:25 PM',
  'Chen scans the cradle with a Geiger radiation counter.',
  'Chen scans the cradle with a Geiger radiation counter.',
  'Zero residual radioactive isotopes, proving the battery was safely shielded.',
  'Zero radiation reading',
  'Geiger Counter Scan',
  '["Lethal gamma","Beta particles","Neutron burst"]'::jsonb,
  'Zero radiation reading',
  '["zero radiation reading","zero radiation","geiger scan","radiation reading","zero reading"]'::jsonb,
  'Scientific readout showing the core was extracted without any radiation leak.',
  'ev_3',
  false,
  '{"descriptions":["Chen scans the cradle with a Geiger radiation counter.","At 04:25 PM: Chen scans the cradle with a Geiger radiation counter.","Notice this clue: Chen scans the cradle with a Geiger radiation counter."],"hints":["Scientific readout showing the core was extracted without any radiation leak.","Clue hint: Think about zero radiation reading.","Search for: zero residual radioactive isotopes, proving the battery was safely shielded."],"clues":["Zero radiation reading","Item: Zero radiation reading","Clue Word: Zero radiation reading"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '95ac2589-1e0f-5235-9629-226285363122',
  'story_095',
  'ev_3',
  3,
  '04:32 PM',
  'Officer Vance inspects the lower maintenance bilge under car 1.',
  'Officer Vance inspects the lower maintenance bilge under car 1.',
  'An open bilge hatch leading to track chute 3 with fresh scuff marks.',
  'Bilge chute 3 hatch',
  'Open Bilge Chute',
  '["Locked door","Clean floor","Welded plate"]'::jsonb,
  'Bilge chute 3 hatch',
  '["bilge chute 3 hatch","bilge hatch","chute hatch","bilge chute","track chute"]'::jsonb,
  'Underfloor trapdoor used to drop items onto the track bed below.',
  'ev_4',
  false,
  '{"descriptions":["Officer Vance inspects the lower maintenance bilge under car 1.","At 04:32 PM: Officer Vance inspects the lower maintenance bilge under car 1.","Notice this clue: Officer Vance inspects the lower maintenance bilge under car 1."],"hints":["Underfloor trapdoor used to drop items onto the track bed below.","Clue hint: Think about bilge chute 3 hatch.","Search for: an open bilge hatch leading to track chute 3 with fresh scuff marks."],"clues":["Bilge chute 3 hatch","Item: Bilge chute 3 hatch","Clue Word: Bilge chute 3 hatch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '20d5e3a3-f271-55cc-b698-60cb697c93ff',
  'story_095',
  'ev_4',
  4,
  '04:40 PM',
  'Chen examines Carl’s engineering tool locker.',
  'Chen examines Carl’s engineering tool locker.',
  'An empty shipping container for a lead-alloy magnetic containment sleeve.',
  'Magnetic sleeve case',
  'Shielding Sleeve Box',
  '["Lunchbox","Spare uniform","Welding mask"]'::jsonb,
  'Magnetic sleeve case',
  '["magnetic sleeve case","sleeve case","magnetic sleeve","containment case","shielding box"]'::jsonb,
  'Storage box for the heavy insulated container used to transport the battery.',
  'ev_5',
  false,
  '{"descriptions":["Chen examines Carl’s engineering tool locker.","At 04:40 PM: Chen examines Carl’s engineering tool locker.","Notice this clue: Chen examines Carl’s engineering tool locker."],"hints":["Storage box for the heavy insulated container used to transport the battery.","Clue hint: Think about magnetic sleeve case.","Search for: an empty shipping container for a lead-alloy magnetic containment sleeve."],"clues":["Magnetic sleeve case","Item: Magnetic sleeve case","Clue Word: Magnetic sleeve case"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '18505a74-2cf4-5e65-bdae-9ecd3eaf61d4',
  'story_095',
  'ev_5',
  5,
  '04:48 PM',
  'Transit dispatch radios dispatch coordinates for milepost 42.',
  'Transit dispatch radios dispatch coordinates for milepost 42.',
  'Police trackside intercept of a black hover-truck holding the shielded battery.',
  'Trackside hover-truck intercept',
  'Police Recovery Report',
  '["Passenger cab","Subway train","Helicopter"]'::jsonb,
  'Trackside hover-truck intercept',
  '["trackside hover-truck intercept","hover-truck","trackside intercept","police recovery","truck intercept"]'::jsonb,
  'Accomplice vehicle caught with the stolen power cell in the tunnel.',
  'ev_6',
  true,
  '{"descriptions":["Transit dispatch radios dispatch coordinates for milepost 42.","At 04:48 PM: Transit dispatch radios dispatch coordinates for milepost 42.","Notice this clue: Transit dispatch radios dispatch coordinates for milepost 42."],"hints":["Accomplice vehicle caught with the stolen power cell in the tunnel.","Clue hint: Think about trackside hover-truck intercept.","Search for: police trackside intercept of a black hover-truck holding the shielded battery."],"clues":["Trackside hover-truck intercept","Item: Trackside hover-truck intercept","Clue Word: Trackside hover-truck intercept"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7aaa3893-f705-5740-a144-b4250716947e',
  'story_095',
  'ev_6',
  6,
  '04:55 PM',
  'Vance searches Carl’s personal tablet computer.',
  'Vance searches Carl’s personal tablet computer.',
  'Encrypted GPS coordinates matching the exact drop location at milepost 42.',
  'Milepost 42 GPS drop coordinates',
  'GPS Flight Coordinates',
  '["Train timetable","Music playlist","Personal diary"]'::jsonb,
  'Milepost 42 GPS drop coordinates',
  '["milepost 42 gps drop coordinates","gps coordinates","drop coordinates","milepost 42","drop point"]'::jsonb,
  'Digital map pinpointing where the battery was scheduled to be jettisoned.',
  'ev_7',
  false,
  '{"descriptions":["Vance searches Carl’s personal tablet computer.","At 04:55 PM: Vance searches Carl’s personal tablet computer.","Notice this clue: Vance searches Carl’s personal tablet computer."],"hints":["Digital map pinpointing where the battery was scheduled to be jettisoned.","Clue hint: Think about milepost 42 gps drop coordinates.","Search for: encrypted gps coordinates matching the exact drop location at milepost 42."],"clues":["Milepost 42 GPS drop coordinates","Item: Milepost 42 GPS drop coordinates","Clue Word: Milepost 42 GPS drop coordinates"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e4f77146-e279-52aa-a49d-11a90b30f484',
  'story_095',
  'ev_7',
  7,
  '05:05 PM',
  'Vance finds an encrypted banking message on Carl’s phone.',
  'Vance finds an encrypted banking message on Carl’s phone.',
  'A wire transfer receipt for ten million credits from the Iron Brotherhood cartel.',
  'Cartel wire receipt',
  'Bribe Transfer Confirmation',
  '["Train ticket","Paycheck","Credit card bill"]'::jsonb,
  'Cartel wire receipt',
  '["cartel wire receipt","wire receipt","cartel receipt","bribe receipt","transfer receipt"]'::jsonb,
  'Financial proof that Carl received millions to steal the power source.',
  'ev_8',
  false,
  '{"descriptions":["Vance finds an encrypted banking message on Carl’s phone.","At 05:05 PM: Vance finds an encrypted banking message on Carl’s phone.","Notice this clue: Vance finds an encrypted banking message on Carl’s phone."],"hints":["Financial proof that Carl received millions to steal the power source.","Clue hint: Think about cartel wire receipt.","Search for: a wire transfer receipt for ten million credits from the iron brotherhood cartel."],"clues":["Cartel wire receipt","Item: Cartel wire receipt","Clue Word: Cartel wire receipt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '51a018a6-12f8-58dc-b0f1-f95546770fa1',
  'story_095',
  'ev_8',
  8,
  '05:15 PM',
  'Carl Ortiz is handcuffed in the engine cab as the train docks.',
  'Carl Ortiz is handcuffed in the engine cab as the train docks.',
  'Carl’s full confession of the theft and trackside drop operation.',
  'Engineer Ortiz confession',
  'Signed Statement of Guilt',
  '["Denial","Silence","Escape attempt"]'::jsonb,
  'Engineer Ortiz confession',
  '["engineer ortiz confession","confession","ortiz confession","signed statement","engineer confession"]'::jsonb,
  'Full admission of guilt by the chief propulsion engineer.',
  NULL,
  true,
  '{"descriptions":["Carl Ortiz is handcuffed in the engine cab as the train docks.","At 05:15 PM: Carl Ortiz is handcuffed in the engine cab as the train docks.","Notice this clue: Carl Ortiz is handcuffed in the engine cab as the train docks."],"hints":["Full admission of guilt by the chief propulsion engineer.","Clue hint: Think about engineer ortiz confession.","Search for: carl’s full confession of the theft and trackside drop operation."],"clues":["Engineer Ortiz confession","Item: Engineer Ortiz confession","Clue Word: Engineer Ortiz confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_096 — DEEP SPACE DISTRESS BEACON
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_096',
  'Deep Space Distress Beacon',
  'Sci-Fi / Cyber',
  'The hollowed-out crystalline caverns of Asteroid LV-449, flashing red emergency beacon lights, thin oxygen frost, and mining excavators',
  'A high-priority military distress beacon began transmitting from a mined-out titanium asteroid that had been officially abandoned and sealed for thirty years.',
  '[{"name":"Daniel Vance","role":"Stranded Fugitive Pilot","alibi":"Hiding inside the deep crystal excavation shaft","avatar":"⛏️"},{"name":"Captain Ronald Kelly","role":"Salvage Frigate Commander","alibi":"Entering the asteroid cavern with the landing party","avatar":"🚀"},{"name":"Ensign Clara Shaw","role":"Communications & Sensor Officer","alibi":"Monitoring the beacon frequency at the landing site","avatar":"📡"},{"name":"Miner automated Drone (Unit 04)","role":"Deactivated Industrial Machine","alibi":"Deactivated near the primary elevator shaft","avatar":"🤖"}]'::jsonb,
  'Fugitive pilot Daniel Vance crash-landed his scout ship on the abandoned asteroid five years ago. Out of water and rations, Daniel bypassed the security relays of the dormant military beacon to transmit a fake medical SOS, intending to ambush whichever rescue crew landed and hijack their starship.',
  'Survey Scout Daniel Vance',
  'Daniel wanted to lure a salvage vessel to the asteroid so he could steal their ship and escape his stranded exile.',
  '[{"time":"Five Years Ago","event":"Daniel Vance crashes his stolen scout ship into Asteroid LV-449."},{"time":"One Week Ago","event":"Daniel’s water recycling filters fail, leaving him seven days to live."},{"time":"Yesterday - 06:00 PM","event":"Daniel rewires the ancient military distress beacon to his escape pod battery."},{"time":"Today - 02:00 AM","event":"The rescue frigate Starling intercepts the signal and drops out of warp."},{"time":"Today - 03:30 AM","event":"The landing party breaches the cavern and detects the manual wiring."}]'::jsonb,
  '[{"id":"ev_1","title":"Civilian Lithium Battery","detail":"Fresh battery from a crashed escape pod wired into the ancient beacon circuitry."},{"id":"ev_2","title":"Rigged EMP Ambush Mine","detail":"Electromagnetic weapon positioned over the entry airlock to disable arriving rescue teams."},{"id":"ev_3","title":"Drone Memory Video","detail":"Visual log from mining unit 04 showing Daniel Vance constructing the beacon fake."},{"id":"ev_4","title":"Recorded Ambush Confession","detail":"Audio statement from Daniel admitting he lured the ship to hijack it for survival."}]'::jsonb,
  '[{"order":1,"title":"Spliced modern battery","text":"Proves the beacon was re-energized recently by a living human."},{"order":2,"title":"Scout ship serial number","text":"Reveals the operator was a fugitive military deserter in hiding."},{"order":3,"title":"Cavern EMP trap","text":"Exposes the malicious ambush intent behind the fake distress signal."},{"order":4,"title":"Drone video of Daniel","text":"Direct visual confirmation of Daniel assembling the transmission equipment."},{"order":5,"title":"Desperate campsite","text":"Establishes the life-or-death survival motive behind the pirate scheme."},{"order":6,"title":"Primed plasma torch","text":"Physical weapon readied for the intended hijack of the rescue vessel."}]'::jsonb,
  'Asteroid crystal resonance: Crystalline rock echoed radio signals, creating ghost harmonic pings.; Ancient automated miner radio pings: Old drone relays pinged occasionally, but lacked power to broadcast SOS.',
  'Claim an alien signal reanimated the asteroid’s automated defense network.',
  'NORMAL',
  'Who activated the ancient beacon on a dead asteroid, and what dark secret was buried in the mining shafts?',
  '[{"character":"Daniel Vance","secret":"An EMP disruption grenade rigged above the airlock to knock out the rescue ship."},{"character":"Captain Ronald Kelly","secret":"He was hoping to claim salvage rights on the abandoned mining equipment."},{"character":"Ensign Clara Shaw","secret":"She intercepted Daniel’s old military deserter warrant from orbital files."},{"character":"Miner automated Drone (Unit 04)","secret":"A video log showing Daniel stripping copper cables from its chest."}]'::jsonb,
  '[{"lead":"Asteroid crystal resonance","explanation":"Crystalline rock echoed radio signals, creating ghost harmonic pings."},{"lead":"Ancient automated miner radio pings","explanation":"Old drone relays pinged occasionally, but lacked power to broadcast SOS."}]'::jsonb,
  '{"wrongTheories":["An automated military AI reawakened to defend the asteroid from incoming prospectors.","An alien organism infested the mining equipment and mimicked a human distress call."],"correctTheory":"Stranded fugitive Daniel Vance rewired the ancient beacon to lure a rescue vessel so he could hijack it to escape starvation."}'::jsonb,
  'Stranded fugitive Daniel Vance rewired the beacon and set an EMP trap to hijack the arriving rescue ship before he starved.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Captain Kelly disarmed the trap, spared Daniel’s life, and brought him aboard for trial and rehabilitation."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The EMP trap detonated, disabling the rescue frigate and stranding the crew on the frozen asteroid forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The asteroid was quarantined as an alien hazard zone, leaving the true story buried in deep space."}]'::jsonb,
  '{"intros":["A high-priority military distress beacon began transmitting from a mined-out titanium asteroid that had been officially abandoned and sealed for thirty years.","Case file story_096: A high-priority military distress beacon began transmitting from a mined-out titanium asteroid that had been officially abandoned and sealed for thirty years. Look closely at every clue.","Trouble begins in The hollowed-out crystalline caverns of Asteroid LV-449, flashing red emergency beacon lights, thin oxygen frost, and mining excavators. A high-priority military distress beacon began transmitting from a mined-out titanium asteroid that had been officially abandoned and sealed for thirty years.","The mystery starts now. A high-priority military distress beacon began transmitting from a mined-out titanium asteroid that had been officially abandoned and sealed for thirty years. Can you solve it?"],"reveals":["Stranded fugitive Daniel Vance rewired the beacon and set an EMP trap to hijack the arriving rescue ship before he starved.","The mystery is unraveled! Stranded fugitive Daniel Vance rewired the beacon and set an EMP trap to hijack the arriving rescue ship before he starved.","At last, the truth comes out: Stranded fugitive Daniel Vance rewired the beacon and set an EMP trap to hijack the arriving rescue ship before he starved.","Case resolved! Here is what happened: Stranded fugitive Daniel Vance rewired the beacon and set an EMP trap to hijack the arriving rescue ship before he starved."],"hints":["Pay attention to where Survey Scout Daniel Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_096';
DELETE FROM public.case_events WHERE case_id = 'story_096';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a709aa67-55db-552b-b591-bad5494ca21e',
  'story_096',
  'Daniel Vance',
  'Stranded Fugitive Pilot',
  'Wild bearded hermit, patchwork spacesuit, desperate eyes, clutching a plasma torch',
  'The beacon went off on its own! The old military automated network must have rebooted!',
  'An EMP disruption grenade rigged above the airlock to knock out the rescue ship.',
  'Hiding inside the deep crystal excavation shaft',
  'Sole living inhabitant of Asteroid LV-449',
  'The beacon can broadcast across three light-years on emergency battery reserves.',
  'Did not know the rescue crew’s scanner detected the heat signature of his ambush position.',
  '⛏️',
  '["The beacon went off on its own! The old military automated network must have rebooted!","\"The beacon went off on its own! The old military automated network must have rebooted!\"","Listen to me: The beacon went off on its own! The old military automated network must have rebooted!","I tell you the truth: The beacon went off on its own! The old military automated network must have rebooted!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '85b4b970-d476-5576-8682-4f447a84a90f',
  'story_096',
  'Captain Ronald Kelly',
  'Salvage Frigate Commander',
  'Veteran spacer, scarred jaw, heavy magnetic armor, carrying shotgun',
  'Military beacons don’t sleep for thirty years and wake up for fun. Someone turned this switch with their own hands.',
  'He was hoping to claim salvage rights on the abandoned mining equipment.',
  'Entering the asteroid cavern with the landing party',
  'Commander of the rescue ship Starling',
  'The distress pulse had a non-standard manual Morse code override.',
  'Did not know an EMP trap was wired to the cavern airlock door.',
  '🚀',
  '["Military beacons don’t sleep for thirty years and wake up for fun. Someone turned this switch with their own hands.","\"Military beacons don’t sleep for thirty years and wake up for fun. Someone turned this switch with their own hands.\"","Listen to me: Military beacons don’t sleep for thirty years and wake up for fun. Someone turned this switch with their own hands.","I tell you the truth: Military beacons don’t sleep for thirty years and wake up for fun. Someone turned this switch with their own hands."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd646faa8-0ed9-5118-afb0-534586093137',
  'story_096',
  'Ensign Clara Shaw',
  'Communications & Sensor Officer',
  'Sharp, youthful, carrying diagnostic tablet and sensor wand',
  'The beacon was spliced into a civilian escape pod lithium battery pack. That battery is only five years old.',
  'She intercepted Daniel’s old military deserter warrant from orbital files.',
  'Monitoring the beacon frequency at the landing site',
  'Sensor officer of the landing party',
  'Daniel Vance was wanted for stealing a scout vessel five years ago.',
  'Did not know Daniel had placed tripwires in the side cavern.',
  '📡',
  '["The beacon was spliced into a civilian escape pod lithium battery pack. That battery is only five years old.","\"The beacon was spliced into a civilian escape pod lithium battery pack. That battery is only five years old.\"","Listen to me: The beacon was spliced into a civilian escape pod lithium battery pack. That battery is only five years old.","I tell you the truth: The beacon was spliced into a civilian escape pod lithium battery pack. That battery is only five years old."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5c3fc4c9-c596-556f-9400-e211dfb939f7',
  'story_096',
  'Miner automated Drone (Unit 04)',
  'Deactivated Industrial Machine',
  'Rusted mining robot, treads caked in frozen crystal dust',
  'Recovered log: "Unauthorized lifeform accessed main terminal on cycle 1,822."',
  'A video log showing Daniel stripping copper cables from its chest.',
  'Deactivated near the primary elevator shaft',
  'Ancient mining hardware on the asteroid',
  'The asteroid holds zero titanium left; it is completely hollow.',
  'Power depleted thirty years ago.',
  '🤖',
  '["Recovered log: \"Unauthorized lifeform accessed main terminal on cycle 1,822.\"","\"Recovered log: \"Unauthorized lifeform accessed main terminal on cycle 1,822.\"\"","Listen to me: Recovered log: \"Unauthorized lifeform accessed main terminal on cycle 1,822.\"","I tell you the truth: Recovered log: \"Unauthorized lifeform accessed main terminal on cycle 1,822.\""]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ed091562-8b0f-5c21-a48f-5632525ab99a',
  'story_096',
  'ev_1',
  1,
  '03:30 AM',
  'The rescue crew reaches the glowing red distress beacon.',
  'The rescue crew reaches the glowing red distress beacon.',
  'A modern civilian lithium battery pack spliced into the antique 30-year-old beacon wiring.',
  'Spliced modern battery',
  'Civilian Lithium Battery',
  '["Nuclear generator","Solar cell","Fuel cell"]'::jsonb,
  'Spliced modern battery',
  '["spliced modern battery","modern battery","lithium battery","battery","spliced battery"]'::jsonb,
  'Recent power cell wired into the antique military distress transmitter.',
  'ev_2',
  true,
  '{"descriptions":["The rescue crew reaches the glowing red distress beacon.","At 03:30 AM: The rescue crew reaches the glowing red distress beacon.","Notice this clue: The rescue crew reaches the glowing red distress beacon."],"hints":["Recent power cell wired into the antique military distress transmitter.","Clue hint: Think about spliced modern battery.","Search for: a modern civilian lithium battery pack spliced into the antique 30-year-old beacon wiring."],"clues":["Spliced modern battery","Item: Spliced modern battery","Clue Word: Spliced modern battery"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '28fab6f2-e735-5e03-81f7-e7343f729642',
  'story_096',
  'ev_2',
  2,
  '03:45 AM',
  'Ensign Shaw reads the serial number on the battery pack.',
  'Ensign Shaw reads the serial number on the battery pack.',
  'Serial numbers registered to a military scout ship that vanished five years ago.',
  'Scout ship serial number',
  'Battery Serial Registry',
  '["Mining company ID","Cargo tag","Scrap stamp"]'::jsonb,
  'Scout ship serial number',
  '["scout ship serial number","serial number","battery serial","scout serial","registry"]'::jsonb,
  'Government identification code identifying the crashed pilot as a military deserter.',
  'ev_3',
  false,
  '{"descriptions":["Ensign Shaw reads the serial number on the battery pack.","At 03:45 AM: Ensign Shaw reads the serial number on the battery pack.","Notice this clue: Ensign Shaw reads the serial number on the battery pack."],"hints":["Government identification code identifying the crashed pilot as a military deserter.","Clue hint: Think about scout ship serial number.","Search for: serial numbers registered to a military scout ship that vanished five years ago."],"clues":["Scout ship serial number","Item: Scout ship serial number","Clue Word: Scout ship serial number"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '378e223c-4538-58d1-9c41-66a6b1375fe3',
  'story_096',
  'ev_3',
  3,
  '04:00 AM',
  'Captain Kelly inspects the cavern entry airlock.',
  'Captain Kelly inspects the cavern entry airlock.',
  'An unshielded electromagnetic pulse mine hung over the doorway with a tripwire.',
  'Cavern EMP trap',
  'Rigged EMP Ambush Mine',
  '["Explosive bomb","Gas grenade","Bear trap"]'::jsonb,
  'Cavern EMP trap',
  '["cavern emp trap","emp trap","emp mine","ambush mine","tripwire mine"]'::jsonb,
  'Weapon set to fry the rescue party’s electronic suits and weapons.',
  'ev_4',
  false,
  '{"descriptions":["Captain Kelly inspects the cavern entry airlock.","At 04:00 AM: Captain Kelly inspects the cavern entry airlock.","Notice this clue: Captain Kelly inspects the cavern entry airlock."],"hints":["Weapon set to fry the rescue party’s electronic suits and weapons.","Clue hint: Think about cavern emp trap.","Search for: an unshielded electromagnetic pulse mine hung over the doorway with a tripwire."],"clues":["Cavern EMP trap","Item: Cavern EMP trap","Clue Word: Cavern EMP trap"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9ab3ba0a-1c17-5ada-bcf4-9165489b3851',
  'story_096',
  'ev_4',
  4,
  '04:15 AM',
  'Shaw downloads the memory buffer from the old mining drone.',
  'Shaw downloads the memory buffer from the old mining drone.',
  'A security video showing Daniel Vance stripping copper cables to build the beacon rig.',
  'Drone video of Daniel',
  'Drone Memory Video',
  '["Still photo","Audio log","Sensor error"]'::jsonb,
  'Drone video of Daniel',
  '["drone video of daniel","drone video","video of daniel","mining video","drone footage"]'::jsonb,
  'Robot camera footage showing the hermit constructing the fake SOS signal.',
  'ev_5',
  false,
  '{"descriptions":["Shaw downloads the memory buffer from the old mining drone.","At 04:15 AM: Shaw downloads the memory buffer from the old mining drone.","Notice this clue: Shaw downloads the memory buffer from the old mining drone."],"hints":["Robot camera footage showing the hermit constructing the fake SOS signal.","Clue hint: Think about drone video of daniel.","Search for: a security video showing daniel vance stripping copper cables to build the beacon rig."],"clues":["Drone video of Daniel","Item: Drone video of Daniel","Clue Word: Drone video of Daniel"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '46eb2500-b391-5300-8aa0-ffa373278615',
  'story_096',
  'ev_5',
  5,
  '04:30 AM',
  'Kelly spots Daniel’s hideout in the rear mining tunnels.',
  'Kelly spots Daniel’s hideout in the rear mining tunnels.',
  'A makeshift shelter with empty ration tins and broken water purifiers.',
  'Desperate campsite',
  'Hermit Living Quarters',
  '["Luxury tent","Laboratory","Command post"]'::jsonb,
  'Desperate campsite',
  '["desperate campsite","campsite","shelter","hermit quarters","living quarters"]'::jsonb,
  'Signs of extreme survival starvation driving the man to take violent measures.',
  'ev_6',
  true,
  '{"descriptions":["Kelly spots Daniel’s hideout in the rear mining tunnels.","At 04:30 AM: Kelly spots Daniel’s hideout in the rear mining tunnels.","Notice this clue: Kelly spots Daniel’s hideout in the rear mining tunnels."],"hints":["Signs of extreme survival starvation driving the man to take violent measures.","Clue hint: Think about desperate campsite.","Search for: a makeshift shelter with empty ration tins and broken water purifiers."],"clues":["Desperate campsite","Item: Desperate campsite","Clue Word: Desperate campsite"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a47752ff-0777-5ea1-94c8-6cced8d76dcd',
  'story_096',
  'ev_6',
  6,
  '04:45 AM',
  'Kelly circles behind Daniel’s ambush perch.',
  'Kelly circles behind Daniel’s ambush perch.',
  'Daniel holding a primed plasma cutting torch ready to attack the boarding crew.',
  'Primed plasma torch',
  'Hostile Weapon',
  '["Rifle","Laser pistol","Knife"]'::jsonb,
  'Primed plasma torch',
  '["primed plasma torch","plasma torch","torch","plasma cutter","cutting torch"]'::jsonb,
  'Industrial tool intended for use as a deadly ambush weapon.',
  'ev_7',
  false,
  '{"descriptions":["Kelly circles behind Daniel’s ambush perch.","At 04:45 AM: Kelly circles behind Daniel’s ambush perch.","Notice this clue: Kelly circles behind Daniel’s ambush perch."],"hints":["Industrial tool intended for use as a deadly ambush weapon.","Clue hint: Think about primed plasma torch.","Search for: daniel holding a primed plasma cutting torch ready to attack the boarding crew."],"clues":["Primed plasma torch","Item: Primed plasma torch","Clue Word: Primed plasma torch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9bf6fa58-25ff-54b3-babd-cf32df3e12a7',
  'story_096',
  'ev_7',
  7,
  '05:00 AM',
  'Kelly disarms Daniel and forces his surrender without firing a shot.',
  'Kelly disarms Daniel and forces his surrender without firing a shot.',
  'Daniel weeping and admitting he faked the SOS to hijack their ship before he starved.',
  'Deserter’s confession',
  'Recorded Ambush Confession',
  '["Defiant shout","Silence","Suicide attempt"]'::jsonb,
  'Deserter’s confession',
  '["deserter’s confession","confession","deserter confession","ambush confession","admission"]'::jsonb,
  'Full admission that the distress beacon was a desperate pirate trap.',
  'ev_8',
  false,
  '{"descriptions":["Kelly disarms Daniel and forces his surrender without firing a shot.","At 05:00 AM: Kelly disarms Daniel and forces his surrender without firing a shot.","Notice this clue: Kelly disarms Daniel and forces his surrender without firing a shot."],"hints":["Full admission that the distress beacon was a desperate pirate trap.","Clue hint: Think about deserter’s confession.","Search for: daniel weeping and admitting he faked the sos to hijack their ship before he starved."],"clues":["Deserter’s confession","Item: Deserter’s confession","Clue Word: Deserter’s confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0306db6c-8250-527c-9c0e-776f40081944',
  'story_096',
  'ev_8',
  8,
  '05:30 AM',
  'The landing party safely neutralizes the EMP trap and returns to the Starling.',
  'The landing party safely neutralizes the EMP trap and returns to the Starling.',
  'Daniel Vance secured in the brig for court-martial and medical treatment.',
  'Brig detainment',
  'Prisoner Custody Form',
  '["Execution","Abandonment","Release"]'::jsonb,
  'Brig detainment',
  '["brig detainment","detainment","custody form","prisoner custody"]'::jsonb,
  'The fugitive spacer safely locked in the ship’s holding cell.',
  NULL,
  true,
  '{"descriptions":["The landing party safely neutralizes the EMP trap and returns to the Starling.","At 05:30 AM: The landing party safely neutralizes the EMP trap and returns to the Starling.","Notice this clue: The landing party safely neutralizes the EMP trap and returns to the Starling."],"hints":["The fugitive spacer safely locked in the ship’s holding cell.","Clue hint: Think about brig detainment.","Search for: daniel vance secured in the brig for court-martial and medical treatment."],"clues":["Brig detainment","Item: Brig detainment","Clue Word: Brig detainment"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_097 — THE POISONED VINTAGE 1945
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_097',
  'The Poisoned Vintage 1945',
  'Dark Mystery',
  'The candlelit dining hall of Blackwood Manor, heavy mahogany table, crystal goblets, and velvet drapes',
  'At an exclusive dinner party, the host poured a priceless 1945 vintage wine for all six guests from the same bottle, but only the host collapsed dead of cyanide poisoning.',
  '[{"name":"Lucas Kane","role":"Head Estate Sommelier","alibi":"Serving wine around the dining table","avatar":"🍷"},{"name":"Lord Arthur Blackwood (Victim)","role":"Ruthless Land Baron","alibi":"Dead at the head of the dinner table","avatar":"💀"},{"name":"Lady Eleanor Vance","role":"Banquet Guest & Heiress","alibi":"Seated at the dining table during the toast","avatar":"🥂"},{"name":"Inspector Thomas Finch","role":"Scotland Yard Detective","alibi":"Arrived thirty minutes after the emergency call","avatar":"🔍"}]'::jsonb,
  'The wine in the vintage 1945 bottle was completely pure. Sommelier Lucas Kane had pre-treated host Lord Arthur’s custom monogrammed silver goblet by swabbing its inside rim with invisible dried potassium cyanide. When the wine filled the goblet, the poison dissolved instantly into Arthur’s portion alone.',
  'Sommelier Lucas Kane',
  'Lucas sought revenge after discovering the host had ruined his family winery thirty years ago.',
  '[{"time":"06:00 PM","event":"Lucas polishes the silver dining ware and coats Arthur’s silver goblet with cyanide."},{"time":"07:30 PM","event":"Guests sit at the table; Arthur takes his seat at the head."},{"time":"08:00 PM","event":"Lucas uncorks the 1945 vintage wine and pours glasses for all guests."},{"time":"08:05 PM","event":"Arthur toasts the table, takes two sips, and collapses in convulsions."},{"time":"08:35 PM","event":"Inspector Finch seals the dining hall and begins testing glassware."}]'::jsonb,
  '[{"id":"ev_1","title":"Decanted Wine Test","detail":"Chemical analysis proving the shared vintage 1945 Bordeaux was completely non-toxic."},{"id":"ev_2","title":"Goblet Rim Swab","detail":"Forensic swab from Lord Arthur’s silver goblet testing positive for concentrated cyanide."},{"id":"ev_3","title":"Concealed Corkscrew Vial","detail":"Brass sommelier tool with a hollow chamber matching the potassium cyanide salts."},{"id":"ev_4","title":"Historical News Clipping","detail":"1994 newspaper documenting Arthur Blackwood’s predatory takeover of Kane Vineyards."}]'::jsonb,
  '[{"order":1,"title":"Monogram silver goblet","text":"The only drinking vessel at the table that differed from the crystal glasses."},{"order":2,"title":"Pure wine bottle","text":"Proves the poison was not delivered through the liquid inside the bottle."},{"order":3,"title":"Cyanide on goblet rim","text":"Conclusive proof the host’s cup was pre-treated with lethal poison."},{"order":4,"title":"Cyanide polishing cloth","text":"Demonstrates how the poison was rubbed onto the silver before dinner."},{"order":5,"title":"Hollow corkscrew handle","text":"The hidden physical reservoir used to transport the cyanide."},{"order":6,"title":"Kane vineyard foreclosure clipping","text":"The historical motive of bitter family revenge spanning thirty years."}]'::jsonb,
  'Hostile boundary lawsuit with Lady Eleanor: Eleanor hated Blackwood, but had no access to his private silver.; Sediment in the bottom of the vintage bottle: Normal aged wine tartrate crystals, completely harmless.',
  'Claim the wine bottle had stratified layers of poison or blame the guest sitting opposite.',
  'NORMAL',
  'How was the wine poisoned so that only the host’s glass contained lethal cyanide?',
  '[{"character":"Lucas Kane","secret":"A vial of potassium cyanide salts hidden inside his hollow corkscrew handle."},{"character":"Lord Arthur Blackwood (Victim)","secret":"He kept the original deed showing he fraudulently foreclosed on Kane Winery."},{"character":"Lady Eleanor Vance","secret":"She was being sued by Blackwood for estate land boundaries."},{"character":"Inspector Thomas Finch","secret":"He had investigated Blackwood’s predatory business practices five years ago."}]'::jsonb,
  '[{"lead":"Hostile boundary lawsuit with Lady Eleanor","explanation":"Eleanor hated Blackwood, but had no access to his private silver."},{"lead":"Sediment in the bottom of the vintage bottle","explanation":"Normal aged wine tartrate crystals, completely harmless."}]'::jsonb,
  '{"wrongTheories":["The poison was suspended in the top layer of wine and poured into the first glass.","Lady Eleanor slipped cyanide into Arthur’s glass while he was looking at the wine label."],"correctTheory":"Lucas Kane coated Arthur’s personal silver goblet with cyanide before dinner to avenge his family’s ruined vineyard."}'::jsonb,
  'Sommelier Lucas Kane coated Lord Arthur’s personal silver goblet with dried cyanide before dinner to avenge his family.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Lucas Kane was arrested for premeditated murder, and the story of the ruined vineyard was made public."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The death was ruled a sudden stroke, and Lucas inherited a large bequest in the will before vanishing abroad."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Rumors blamed a supernatural curse on the vintage 1945 wine, ruining the wine cellar forever."}]'::jsonb,
  '{"intros":["At an exclusive dinner party, the host poured a priceless 1945 vintage wine for all six guests from the same bottle, but only the host collapsed dead of cyanide poisoning.","Case file story_097: At an exclusive dinner party, the host poured a priceless 1945 vintage wine for all six guests from the same bottle, but only the host collapsed dead of cyanide poisoning. Look closely at every clue.","Trouble begins in The candlelit dining hall of Blackwood Manor, heavy mahogany table, crystal goblets, and velvet drapes. At an exclusive dinner party, the host poured a priceless 1945 vintage wine for all six guests from the same bottle, but only the host collapsed dead of cyanide poisoning.","The mystery starts now. At an exclusive dinner party, the host poured a priceless 1945 vintage wine for all six guests from the same bottle, but only the host collapsed dead of cyanide poisoning. Can you solve it?"],"reveals":["Sommelier Lucas Kane coated Lord Arthur’s personal silver goblet with dried cyanide before dinner to avenge his family.","The mystery is unraveled! Sommelier Lucas Kane coated Lord Arthur’s personal silver goblet with dried cyanide before dinner to avenge his family.","At last, the truth comes out: Sommelier Lucas Kane coated Lord Arthur’s personal silver goblet with dried cyanide before dinner to avenge his family.","Case resolved! Here is what happened: Sommelier Lucas Kane coated Lord Arthur’s personal silver goblet with dried cyanide before dinner to avenge his family."],"hints":["Pay attention to where Sommelier Lucas Kane was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_097';
DELETE FROM public.case_events WHERE case_id = 'story_097';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '56a48acd-12d5-5722-a07f-8b1ca7158be9',
  'story_097',
  'Lucas Kane',
  'Head Estate Sommelier',
  'Impeccable white gloves, polished posture, calm aristocratic voice, cold measuring eyes',
  'I decanted the 1945 Bordeaux before everyone’s eyes. Every guest drank from the very same bottle.',
  'A vial of potassium cyanide salts hidden inside his hollow corkscrew handle.',
  'Serving wine around the dining table',
  'Son of the vineyard owner Arthur Blackwood bankrupted decades ago',
  'Arthur Blackwood always demanded his personal silver goblet, never crystal glasses.',
  'Did not know the police chemist could test the silver goblet’s rim independently from the bottle.',
  '🍷',
  '["I decanted the 1945 Bordeaux before everyone’s eyes. Every guest drank from the very same bottle.","\"I decanted the 1945 Bordeaux before everyone’s eyes. Every guest drank from the very same bottle.\"","Listen to me: I decanted the 1945 Bordeaux before everyone’s eyes. Every guest drank from the very same bottle.","I tell you the truth: I decanted the 1945 Bordeaux before everyone’s eyes. Every guest drank from the very same bottle."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1a05efe6-e7b8-546c-821a-45f6723aeadf',
  'story_097',
  'Lord Arthur Blackwood (Victim)',
  'Ruthless Land Baron',
  'Arrogant, silver beard, collapsed face-down into his silver soup tureen',
  'Deceased victim; last words were: "A magnificent vintage, Lucas... but strangely bitter."',
  'He kept the original deed showing he fraudulently foreclosed on Kane Winery.',
  'Dead at the head of the dinner table',
  'Master of Blackwood Manor and host of the banquet',
  'Several guests had financial reasons to desire his demise.',
  'Did not expect his trusted personal sommelier was an undercover vengeful son.',
  '💀',
  '["Deceased victim; last words were: \"A magnificent vintage, Lucas... but strangely bitter.\"","\"Deceased victim; last words were: \"A magnificent vintage, Lucas... but strangely bitter.\"\"","Listen to me: Deceased victim; last words were: \"A magnificent vintage, Lucas... but strangely bitter.\"","I tell you the truth: Deceased victim; last words were: \"A magnificent vintage, Lucas... but strangely bitter.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b851def8-3063-5fe5-b34b-9225f4789e8b',
  'story_097',
  'Lady Eleanor Vance',
  'Banquet Guest & Heiress',
  'Elegant emerald silk gown, trembling fingers clutching her crystal goblet',
  'We all drank the very same wine! Look at my glass—I drank half of mine and feel completely fine!',
  'She was being sued by Blackwood for estate land boundaries.',
  'Seated at the dining table during the toast',
  'Neighboring landowner and party guest',
  'Arthur Blackwood insisted on using his family heirloom silver chalice.',
  'Did not understand why her own wine tasted sweet while Arthur’s smelled of bitter almonds.',
  '🥂',
  '["We all drank the very same wine! Look at my glass—I drank half of mine and feel completely fine!","\"We all drank the very same wine! Look at my glass—I drank half of mine and feel completely fine!\"","Listen to me: We all drank the very same wine! Look at my glass—I drank half of mine and feel completely fine!","I tell you the truth: We all drank the very same wine! Look at my glass—I drank half of mine and feel completely fine!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '94f5d72b-b63e-54c8-b412-cc23a137b7a6',
  'story_097',
  'Inspector Thomas Finch',
  'Scotland Yard Detective',
  'Analytical, damp trench coat, carrying chemical litmus strips and evidence vials',
  'When a shared bottle poisons one man, look to the vessel, not the bottle.',
  'He had investigated Blackwood’s predatory business practices five years ago.',
  'Arrived thirty minutes after the emergency call',
  'Investigating officer on the scene',
  'The bottle decanter tested 100% negative for any toxic compounds.',
  'Did not know who had set the dining table earlier that afternoon.',
  '🔍',
  '["When a shared bottle poisons one man, look to the vessel, not the bottle.","\"When a shared bottle poisons one man, look to the vessel, not the bottle.\"","Listen to me: When a shared bottle poisons one man, look to the vessel, not the bottle.","I tell you the truth: When a shared bottle poisons one man, look to the vessel, not the bottle."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cafd21cd-fdfb-5228-abfd-921391547c5b',
  'story_097',
  'ev_1',
  1,
  '08:05 PM',
  'Lord Arthur collapses onto the mahogany table.',
  'Lord Arthur collapses onto the mahogany table.',
  'Lord Arthur’s silver heirloom goblet knocked sideways with spilled wine.',
  'Monogram silver goblet',
  'Lord Arthur’s Goblet',
  '["Crystal tumbler","Water glass","Porcelain mug"]'::jsonb,
  'Monogram silver goblet',
  '["monogram silver goblet","silver goblet","goblet","chalice","monogram goblet"]'::jsonb,
  'The host’s custom silver drinking cup with engraved initials.',
  'ev_2',
  true,
  '{"descriptions":["Lord Arthur collapses onto the mahogany table.","At 08:05 PM: Lord Arthur collapses onto the mahogany table.","Notice this clue: Lord Arthur collapses onto the mahogany table."],"hints":["The host’s custom silver drinking cup with engraved initials.","Clue hint: Think about monogram silver goblet.","Search for: lord arthur’s silver heirloom goblet knocked sideways with spilled wine."],"clues":["Monogram silver goblet","Item: Monogram silver goblet","Clue Word: Monogram silver goblet"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a106c3db-d008-5719-8e2b-7cc3c75e5c00',
  'story_097',
  'ev_2',
  2,
  '08:40 PM',
  'Inspector Finch tests the vintage wine remaining in the bottle.',
  'Inspector Finch tests the vintage wine remaining in the bottle.',
  'The 1945 wine bottle is completely clean with zero traces of poison.',
  'Pure wine bottle',
  'Decanted Wine Test',
  '["Lethal wine","Cloudy sediment","Vinegar smell"]'::jsonb,
  'Pure wine bottle',
  '["pure wine bottle","pure wine","clean wine","wine bottle","pure bottle"]'::jsonb,
  'Laboratory test showing the main bottle of wine was completely harmless.',
  'ev_3',
  false,
  '{"descriptions":["Inspector Finch tests the vintage wine remaining in the bottle.","At 08:40 PM: Inspector Finch tests the vintage wine remaining in the bottle.","Notice this clue: Inspector Finch tests the vintage wine remaining in the bottle."],"hints":["Laboratory test showing the main bottle of wine was completely harmless.","Clue hint: Think about pure wine bottle.","Search for: the 1945 wine bottle is completely clean with zero traces of poison."],"clues":["Pure wine bottle","Item: Pure wine bottle","Clue Word: Pure wine bottle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f7e7c9f7-deed-502d-933c-fafa2d2a092a',
  'story_097',
  'ev_3',
  3,
  '08:50 PM',
  'Finch swabs the inside rim of Arthur’s silver goblet.',
  'Finch swabs the inside rim of Arthur’s silver goblet.',
  'Bright Prussian blue chemical reaction indicating heavy potassium cyanide residue.',
  'Cyanide on goblet rim',
  'Goblet Rim Swab',
  '["Sugar residue","Salt crystals","Arsenic powder"]'::jsonb,
  'Cyanide on goblet rim',
  '["cyanide on goblet rim","cyanide","cyanide residue","cyanide swab","goblet cyanide"]'::jsonb,
  'Deadly poison detected directly on the rim where the victim put his lips.',
  'ev_4',
  false,
  '{"descriptions":["Finch swabs the inside rim of Arthur’s silver goblet.","At 08:50 PM: Finch swabs the inside rim of Arthur’s silver goblet.","Notice this clue: Finch swabs the inside rim of Arthur’s silver goblet."],"hints":["Deadly poison detected directly on the rim where the victim put his lips.","Clue hint: Think about cyanide on goblet rim.","Search for: bright prussian blue chemical reaction indicating heavy potassium cyanide residue."],"clues":["Cyanide on goblet rim","Item: Cyanide on goblet rim","Clue Word: Cyanide on goblet rim"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd150f84c-103f-5404-8ea5-10d3cb1ac496',
  'story_097',
  'ev_4',
  4,
  '09:05 PM',
  'Finch searches the butler’s pantry prep station.',
  'Finch searches the butler’s pantry prep station.',
  'A bottle of silver polishing cloth dusted with dried cyanide crystals.',
  'Cyanide polishing cloth',
  'Pantry Polishing Rag',
  '["Sponge","Towel","Dish soap"]'::jsonb,
  'Cyanide polishing cloth',
  '["cyanide polishing cloth","polishing cloth","cyanide cloth","rag","cleaning cloth"]'::jsonb,
  'Cloth used by the sommelier to apply the poison during table setting.',
  'ev_5',
  false,
  '{"descriptions":["Finch searches the butler’s pantry prep station.","At 09:05 PM: Finch searches the butler’s pantry prep station.","Notice this clue: Finch searches the butler’s pantry prep station."],"hints":["Cloth used by the sommelier to apply the poison during table setting.","Clue hint: Think about cyanide polishing cloth.","Search for: a bottle of silver polishing cloth dusted with dried cyanide crystals."],"clues":["Cyanide polishing cloth","Item: Cyanide polishing cloth","Clue Word: Cyanide polishing cloth"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'df2a7203-ca91-59b3-afac-41d285e50e2a',
  'story_097',
  'ev_5',
  5,
  '09:20 PM',
  'Finch inspects Lucas’s professional sommelier tool kit.',
  'Finch inspects Lucas’s professional sommelier tool kit.',
  'An antique brass corkscrew with a hollow screw-off handle containing white powder.',
  'Hollow corkscrew handle',
  'Concealed Corkscrew Vial',
  '["Wine foil cutter","Matches","Pocket watch"]'::jsonb,
  'Hollow corkscrew handle',
  '["hollow corkscrew handle","hollow corkscrew","corkscrew","corkscrew vial","corkscrew handle"]'::jsonb,
  'Wine tool designed with a secret compartment inside the grip.',
  'ev_6',
  true,
  '{"descriptions":["Finch inspects Lucas’s professional sommelier tool kit.","At 09:20 PM: Finch inspects Lucas’s professional sommelier tool kit.","Notice this clue: Finch inspects Lucas’s professional sommelier tool kit."],"hints":["Wine tool designed with a secret compartment inside the grip.","Clue hint: Think about hollow corkscrew handle.","Search for: an antique brass corkscrew with a hollow screw-off handle containing white powder."],"clues":["Hollow corkscrew handle","Item: Hollow corkscrew handle","Clue Word: Hollow corkscrew handle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6081e165-aa30-5c8c-a131-6a8f0b9d295f',
  'story_097',
  'ev_6',
  6,
  '09:35 PM',
  'Finch finds an old newspaper clipping inside Lucas’s coat wallet.',
  'Finch finds an old newspaper clipping inside Lucas’s coat wallet.',
  'A 1994 article detailing the bankruptcy of Kane Vineyards driven by Arthur Blackwood.',
  'Kane vineyard foreclosure clipping',
  'Historical News Clipping',
  '["Wine review","Menu card","Train ticket"]'::jsonb,
  'Kane vineyard foreclosure clipping',
  '["kane vineyard foreclosure clipping","newspaper clipping","vineyard clipping","kane clipping","clipping"]'::jsonb,
  'Old newspaper article showing Arthur Blackwood destroyed Lucas’s family estate.',
  'ev_7',
  false,
  '{"descriptions":["Finch finds an old newspaper clipping inside Lucas’s coat wallet.","At 09:35 PM: Finch finds an old newspaper clipping inside Lucas’s coat wallet.","Notice this clue: Finch finds an old newspaper clipping inside Lucas’s coat wallet."],"hints":["Old newspaper article showing Arthur Blackwood destroyed Lucas’s family estate.","Clue hint: Think about kane vineyard foreclosure clipping.","Search for: a 1994 article detailing the bankruptcy of kane vineyards driven by arthur blackwood."],"clues":["Kane vineyard foreclosure clipping","Item: Kane vineyard foreclosure clipping","Clue Word: Kane vineyard foreclosure clipping"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f17ce014-18c3-5362-bbd5-931c2f241a16',
  'story_097',
  'ev_7',
  7,
  '09:50 PM',
  'Lucas’s true birth certificate is uncovered in the manor staff records.',
  'Lucas’s true birth certificate is uncovered in the manor staff records.',
  'Lucas Kane is legally the eldest son of the bankrupt vineyard founder.',
  'Lucas Kane birth certificate',
  'True Identity Record',
  '["Passport","Driver license","Reference letter"]'::jsonb,
  'Lucas Kane birth certificate',
  '["lucas kane birth certificate","birth certificate","identity record","kane certificate","record"]'::jsonb,
  'Official paper proving the sommelier was the rightful heir to the ruined vineyard.',
  'ev_8',
  false,
  '{"descriptions":["Lucas’s true birth certificate is uncovered in the manor staff records.","At 09:50 PM: Lucas’s true birth certificate is uncovered in the manor staff records.","Notice this clue: Lucas’s true birth certificate is uncovered in the manor staff records."],"hints":["Official paper proving the sommelier was the rightful heir to the ruined vineyard.","Clue hint: Think about lucas kane birth certificate.","Search for: lucas kane is legally the eldest son of the bankrupt vineyard founder."],"clues":["Lucas Kane birth certificate","Item: Lucas Kane birth certificate","Clue Word: Lucas Kane birth certificate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8e0eac5c-dead-5b88-ba99-07ca9e7ac151',
  'story_097',
  'ev_8',
  8,
  '10:05 PM',
  'Finch confronts Lucas with the swab, the corkscrew, and his true identity.',
  'Finch confronts Lucas with the swab, the corkscrew, and his true identity.',
  'Lucas’s calm confession that he avenged his father thirty years later.',
  'Sommelier’s confession',
  'Recorded Confession',
  '["Denial","Panic run","Silence"]'::jsonb,
  'Sommelier’s confession',
  '["sommelier’s confession","confession","sommelier confession","lucas confession","admission"]'::jsonb,
  'Full admission of the cold, calculated revenge poisoning.',
  NULL,
  true,
  '{"descriptions":["Finch confronts Lucas with the swab, the corkscrew, and his true identity.","At 10:05 PM: Finch confronts Lucas with the swab, the corkscrew, and his true identity.","Notice this clue: Finch confronts Lucas with the swab, the corkscrew, and his true identity."],"hints":["Full admission of the cold, calculated revenge poisoning.","Clue hint: Think about sommelier’s confession.","Search for: lucas’s calm confession that he avenged his father thirty years later."],"clues":["Sommelier’s confession","Item: Sommelier’s confession","Clue Word: Sommelier’s confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_098 — THE BURIED SAFE IN THE WOODS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_098',
  'The Buried Safe in the Woods',
  'Dark Mystery',
  'The dense pine forest behind the old Blackwood sawmill, damp moss, rusted logging chains, and fresh rain puddles',
  'Two mushroom hunters uncovered a heavy cast-iron safe buried four feet deep beneath pine needles, its door blown open from the inside with dynamite.',
  '[{"name":"Sheriff Donald Briggs (Retired)","role":"Former County Sheriff","alibi":"Retired living on his lakeside ranch","avatar":"🤠"},{"name":"Clyde Vance (Deceased)","role":"Bank Robber & Victim","alibi":"Buried in the pine woods since 2004","avatar":"💀"},{"name":"Deputy Sarah Cole","role":"Young Forest Ranger","alibi":"Patrolling the state park logging roads","avatar":"🌲"},{"name":"Detective Marcus Bell","role":"State Forensic Investigator","alibi":"Processing the forest crime scene","avatar":"🔍"}]'::jsonb,
  'Twenty years ago, Sheriff Briggs and bank robber Clyde Vance stole one million dollars in gold coins. Briggs betrayed Clyde, tricked him into stepping into the heavy underground walk-in safe to count the loot, locked the door, and buried it. In a desperate bid to escape, Clyde detonated a stick of dynamite from the inside.',
  'Corrupt Sheriff Donald Briggs',
  'Sheriff Briggs trapped his bank-robbing partner inside the steel vault after their heist and buried him alive.',
  '[{"time":"November 12, 2004","event":"Briggs and Clyde rob the county bank of one million in gold coins."},{"time":"November 13, 2004 - 02:00 AM","event":"Briggs locks Clyde inside the buried bunker safe and crushes the air pipe."},{"time":"November 13, 2004 - 04:00 AM","event":"Clyde lights a dynamite stick in desperation, blowing the door outward."},{"time":"November 14, 2004","event":"Briggs tells the press Clyde escaped across the Mexican border."},{"time":"Present Day - 10:00 AM","event":"Mushroom foragers uncover the rusted iron door in the pine needle mulch."}]'::jsonb,
  '[{"id":"ev_1","title":"Deformed Steel Hinges","detail":"Safe door hinges bowed outward proving high-explosive detonation from the interior."},{"id":"ev_2","title":"Carved Steel Message","detail":"Chiseled interior message on safe door naming Sheriff Briggs as the murderer."},{"id":"ev_3","title":"Flattened Ventilation Pipe","detail":"Air intake pipe crushed with a sledgehammer to suffocate the trapped robber."},{"id":"ev_4","title":"Recovered Stolen Gold","detail":"Fifty pounds of uncirculated gold coins from the 2004 heist recovered at Briggs’s home."}]'::jsonb,
  '[{"order":1,"title":"Buried vault door","text":"Uncovers the secret tomb hidden in the forest for twenty years."},{"order":2,"title":"Outward blown hinges","text":"Proves someone was trapped inside trying to blast their way out."},{"order":3,"title":"Scratched interior dying message","text":"Dying testimony directly naming Sheriff Briggs."},{"order":4,"title":"Crushed air pipe","text":"Conclusive physical evidence of premeditated burial and suffocation."},{"order":5,"title":"Skeleton with fuse lighter","text":"Identifies the victim as Clyde Vance, debunking the Mexico escape myth."},{"order":6,"title":"Stolen mint gold coins","text":"Direct possession of the stolen bank treasure linking Briggs to the crime."}]'::jsonb,
  'Old sawmill logging blast permit: Old sawmill records showed legitimate dynamite use in 1980.; Rumors of Clyde living in Tijuana: Sightings in Mexico were fabricated by Briggs to close the case.',
  'Claim an eccentric prospector buried dynamite to protect his gold from claim jumpers.',
  'NORMAL',
  'Why was the safe blown open from the inside, and what happened to the bank robber who hid it twenty years ago?',
  '[{"character":"Sheriff Donald Briggs (Retired)","secret":"A set of heavy brass vault keys hidden in his home workshop gun safe."},{"character":"Clyde Vance (Deceased)","secret":"He held the original combination lock sheet for the bank treasury."},{"character":"Deputy Sarah Cole","secret":"Her grandfather was the bank teller wounded during the 2004 heist."},{"character":"Detective Marcus Bell","secret":"He reopened the cold case after federal treasury serial numbers surfaced recently."}]'::jsonb,
  '[{"lead":"Old sawmill logging blast permit","explanation":"Old sawmill records showed legitimate dynamite use in 1980."},{"lead":"Rumors of Clyde living in Tijuana","explanation":"Sightings in Mexico were fabricated by Briggs to close the case."}]'::jsonb,
  '{"wrongTheories":["Clyde blew himself up accidentally while trying to crack open a stolen safe in the woods.","A rival gang found the safe and used dynamite to blow the door off from the outside."],"correctTheory":"Sheriff Briggs trapped Clyde in the buried safe and crushed the air pipe; Clyde detonated dynamite from inside in a desperate bid to escape."}'::jsonb,
  'Sheriff Briggs trapped his robbery partner Clyde inside the buried safe; Clyde detonated dynamite from within in a failed escape.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Briggs was convicted of aggravated first-degree murder and bank robbery, serving life in state prison."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Briggs claimed he found the gold legally, and the statute of limitations expired, leaving him free."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The forest was declared an old mining hazard zone, leaving the murder buried in local folklore."}]'::jsonb,
  '{"intros":["Two mushroom hunters uncovered a heavy cast-iron safe buried four feet deep beneath pine needles, its door blown open from the inside with dynamite.","Case file story_098: Two mushroom hunters uncovered a heavy cast-iron safe buried four feet deep beneath pine needles, its door blown open from the inside with dynamite. Look closely at every clue.","Trouble begins in The dense pine forest behind the old Blackwood sawmill, damp moss, rusted logging chains, and fresh rain puddles. Two mushroom hunters uncovered a heavy cast-iron safe buried four feet deep beneath pine needles, its door blown open from the inside with dynamite.","The mystery starts now. Two mushroom hunters uncovered a heavy cast-iron safe buried four feet deep beneath pine needles, its door blown open from the inside with dynamite. Can you solve it?"],"reveals":["Sheriff Briggs trapped his robbery partner Clyde inside the buried safe; Clyde detonated dynamite from within in a failed escape.","The mystery is unraveled! Sheriff Briggs trapped his robbery partner Clyde inside the buried safe; Clyde detonated dynamite from within in a failed escape.","At last, the truth comes out: Sheriff Briggs trapped his robbery partner Clyde inside the buried safe; Clyde detonated dynamite from within in a failed escape.","Case resolved! Here is what happened: Sheriff Briggs trapped his robbery partner Clyde inside the buried safe; Clyde detonated dynamite from within in a failed escape."],"hints":["Pay attention to where Corrupt Sheriff Donald Briggs was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_098';
DELETE FROM public.case_events WHERE case_id = 'story_098';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '49692234-fb5c-5135-a744-63cc07309260',
  'story_098',
  'Sheriff Donald Briggs (Retired)',
  'Former County Sheriff',
  'Weathered, silver star badge pinned inside his leather coat, walking with a wooden cane, watchful',
  'Clyde Vance fled to Mexico with the bank gold twenty years ago. Everyone in town knows that.',
  'A set of heavy brass vault keys hidden in his home workshop gun safe.',
  'Retired living on his lakeside ranch',
  'Sheriff who originally investigated the 2004 bank heist',
  'The safe was a military surplus bunker box buried in the old sawmill lot.',
  'Did not know ground radar located the skeletal remains blown thirty feet away.',
  '🤠',
  '["Clyde Vance fled to Mexico with the bank gold twenty years ago. Everyone in town knows that.","\"Clyde Vance fled to Mexico with the bank gold twenty years ago. Everyone in town knows that.\"","Listen to me: Clyde Vance fled to Mexico with the bank gold twenty years ago. Everyone in town knows that.","I tell you the truth: Clyde Vance fled to Mexico with the bank gold twenty years ago. Everyone in town knows that."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b5015efb-d786-5cb3-94b8-44275fe31e92',
  'story_098',
  'Clyde Vance (Deceased)',
  'Bank Robber & Victim',
  'Reckless outlaw, remains found near the shattered safe with dynamite residue',
  'Deceased victim; scratched into the inner steel safe door: "BRIGGS SHUT THE AIR PIPE".',
  'He held the original combination lock sheet for the bank treasury.',
  'Buried in the pine woods since 2004',
  'Former partner of Sheriff Briggs',
  'Briggs took half the gold before sealing the heavy door.',
  'Did not know the dynamite blast would cave the ceiling upon him.',
  '💀',
  '["Deceased victim; scratched into the inner steel safe door: \"BRIGGS SHUT THE AIR PIPE\".","\"Deceased victim; scratched into the inner steel safe door: \"BRIGGS SHUT THE AIR PIPE\".\"","Listen to me: Deceased victim; scratched into the inner steel safe door: \"BRIGGS SHUT THE AIR PIPE\".","I tell you the truth: Deceased victim; scratched into the inner steel safe door: \"BRIGGS SHUT THE AIR PIPE\"."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '18d810a1-dd5b-597c-bb9b-9c88d551cea0',
  'story_098',
  'Deputy Sarah Cole',
  'Young Forest Ranger',
  'Sharp, green uniform, mud boots, carrying metal detector and topographic maps',
  'The steel hinges are bowed outward. This explosion didn’t come from a safecracker—it came from within.',
  'Her grandfather was the bank teller wounded during the 2004 heist.',
  'Patrolling the state park logging roads',
  'First officer on the excavation scene',
  'The air pipe connected to the safe had been crimped shut with a sledgehammer.',
  'Did not know Briggs was the secret inside man on the heist.',
  '🌲',
  '["The steel hinges are bowed outward. This explosion didn’t come from a safecracker—it came from within.","\"The steel hinges are bowed outward. This explosion didn’t come from a safecracker—it came from within.\"","Listen to me: The steel hinges are bowed outward. This explosion didn’t come from a safecracker—it came from within.","I tell you the truth: The steel hinges are bowed outward. This explosion didn’t come from a safecracker—it came from within."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'b8e827ce-8618-58b7-ac01-0593a5b35a21',
  'story_098',
  'Detective Marcus Bell',
  'State Forensic Investigator',
  'Methodical, white forensic coveralls, carrying laser scanners and bone brushes',
  'Outward steel deformation requires a high-explosive detonation inside a hermetic enclosure.',
  'He reopened the cold case after federal treasury serial numbers surfaced recently.',
  'Processing the forest crime scene',
  'Lead state cold-case investigator',
  'The gold coins recovered from Briggs’s bank account matched the 2004 mint batch.',
  'Did not know where the remaining buried crates were hidden.',
  '🔍',
  '["Outward steel deformation requires a high-explosive detonation inside a hermetic enclosure.","\"Outward steel deformation requires a high-explosive detonation inside a hermetic enclosure.\"","Listen to me: Outward steel deformation requires a high-explosive detonation inside a hermetic enclosure.","I tell you the truth: Outward steel deformation requires a high-explosive detonation inside a hermetic enclosure."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0ae4d999-7936-553f-9e8e-ebc01a7b8300',
  'story_098',
  'ev_1',
  1,
  'Present Day - 10:00 AM',
  'Foragers strike rusted iron with a walking stick.',
  'Foragers strike rusted iron with a walking stick.',
  'A cast-iron vault door buried four feet deep in forest earth.',
  'Buried vault door',
  'Excavated Iron Vault',
  '["Car chassis","Septic tank","Fuel barrel"]'::jsonb,
  'Buried vault door',
  '["buried vault door","vault door","iron door","safe","buried vault"]'::jsonb,
  'Heavy bank safe door uncovered beneath forest pine needles.',
  'ev_2',
  true,
  '{"descriptions":["Foragers strike rusted iron with a walking stick.","At Present Day - 10:00 AM: Foragers strike rusted iron with a walking stick.","Notice this clue: Foragers strike rusted iron with a walking stick."],"hints":["Heavy bank safe door uncovered beneath forest pine needles.","Clue hint: Think about buried vault door.","Search for: a cast-iron vault door buried four feet deep in forest earth."],"clues":["Buried vault door","Item: Buried vault door","Clue Word: Buried vault door"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '117d34be-9f65-58ab-8212-50bdf9f515cb',
  'story_098',
  'ev_2',
  2,
  'Present Day - 10:30 AM',
  'Deputy Cole examines the sheared door hinges.',
  'Deputy Cole examines the sheared door hinges.',
  'Steel hinges peeled outward like flower petals from an interior blast.',
  'Outward blown hinges',
  'Deformed Steel Hinges',
  '["Pried edges","Torch cuts","Rust decay"]'::jsonb,
  'Outward blown hinges',
  '["outward blown hinges","blown hinges","hinges","outward hinges","deformed hinges"]'::jsonb,
  'Hinges warped outward, proving the explosion occurred inside the chamber.',
  'ev_3',
  false,
  '{"descriptions":["Deputy Cole examines the sheared door hinges.","At Present Day - 10:30 AM: Deputy Cole examines the sheared door hinges.","Notice this clue: Deputy Cole examines the sheared door hinges."],"hints":["Hinges warped outward, proving the explosion occurred inside the chamber.","Clue hint: Think about outward blown hinges.","Search for: steel hinges peeled outward like flower petals from an interior blast."],"clues":["Outward blown hinges","Item: Outward blown hinges","Clue Word: Outward blown hinges"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '872539dd-3f28-5ffb-8331-129535e759d2',
  'story_098',
  'ev_3',
  3,
  'Present Day - 11:15 AM',
  'Detective Bell brushes the dirt from the interior steel wall.',
  'Detective Bell brushes the dirt from the interior steel wall.',
  'Scratched words on the inner steel: "BRIGGS SHUT THE AIR PIPE".',
  'Scratched interior dying message',
  'Carved Steel Message',
  '["Graffiti","Numbers","Initials"]'::jsonb,
  'Scratched interior dying message',
  '["scratched interior dying message","dying message","scratched message","steel message","briggs message"]'::jsonb,
  'Desperate words carved into the inner vault steel before the blast.',
  'ev_4',
  false,
  '{"descriptions":["Detective Bell brushes the dirt from the interior steel wall.","At Present Day - 11:15 AM: Detective Bell brushes the dirt from the interior steel wall.","Notice this clue: Detective Bell brushes the dirt from the interior steel wall."],"hints":["Desperate words carved into the inner vault steel before the blast.","Clue hint: Think about scratched interior dying message.","Search for: scratched words on the inner steel: \"briggs shut the air pipe\"."],"clues":["Scratched interior dying message","Item: Scratched interior dying message","Clue Word: Scratched interior dying message"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ecb32262-cb82-511b-a9db-7fcd51cf3f78',
  'story_098',
  'ev_4',
  4,
  'Present Day - 11:45 AM',
  'Cole uncovers the crushed air intake pipe in the soil.',
  'Cole uncovers the crushed air intake pipe in the soil.',
  'A galvanized steel pipe flattened with heavy sledgehammer blows.',
  'Crushed air pipe',
  'Flattened Ventilation Pipe',
  '["Rusted hole","Clogged leaves","Open valve"]'::jsonb,
  'Crushed air pipe',
  '["crushed air pipe","crushed pipe","air pipe","ventilation pipe","flattened pipe"]'::jsonb,
  'Air tube deliberately smashed flat to suffocate whoever was inside.',
  'ev_5',
  false,
  '{"descriptions":["Cole uncovers the crushed air intake pipe in the soil.","At Present Day - 11:45 AM: Cole uncovers the crushed air intake pipe in the soil.","Notice this clue: Cole uncovers the crushed air intake pipe in the soil."],"hints":["Air tube deliberately smashed flat to suffocate whoever was inside.","Clue hint: Think about crushed air pipe.","Search for: a galvanized steel pipe flattened with heavy sledgehammer blows."],"clues":["Crushed air pipe","Item: Crushed air pipe","Clue Word: Crushed air pipe"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1ad7b7ce-e733-5106-8c1e-d181d7e456b2',
  'story_098',
  'ev_5',
  5,
  'Present Day - 12:30 PM',
  'Ground radar detects skeletal remains twenty feet from the door.',
  'Ground radar detects skeletal remains twenty feet from the door.',
  'Clyde Vance’s skeleton holding a burned dynamite fuse lighter.',
  'Skeleton with fuse lighter',
  'Clyde’s Skeletal Remains',
  '["Animal bones","Empty clothes","Old boots"]'::jsonb,
  'Skeleton with fuse lighter',
  '["skeleton with fuse lighter","skeleton","clyde skeleton","remains","skeletal remains"]'::jsonb,
  'Human remains proving the robber never escaped to Mexico.',
  'ev_6',
  true,
  '{"descriptions":["Ground radar detects skeletal remains twenty feet from the door.","At Present Day - 12:30 PM: Ground radar detects skeletal remains twenty feet from the door.","Notice this clue: Ground radar detects skeletal remains twenty feet from the door."],"hints":["Human remains proving the robber never escaped to Mexico.","Clue hint: Think about skeleton with fuse lighter.","Search for: clyde vance’s skeleton holding a burned dynamite fuse lighter."],"clues":["Skeleton with fuse lighter","Item: Skeleton with fuse lighter","Clue Word: Skeleton with fuse lighter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'da157b7c-b721-50ee-b19c-3f16c95789eb',
  'story_098',
  'ev_6',
  6,
  'Present Day - 01:15 PM',
  'Bell finds a dropped leather wallet among the bone fragments.',
  'Bell finds a dropped leather wallet among the bone fragments.',
  'A 2004 bank robbery plan diagram with Sheriff Briggs’s signature.',
  'Signed heist diagram',
  'Robbery Blueprint',
  '["Driver license","Playing card","Dollar bill"]'::jsonb,
  'Signed heist diagram',
  '["signed heist diagram","heist diagram","blueprint","robbery plan","signed diagram"]'::jsonb,
  'Paper map proving the Sheriff co-planned the bank robbery.',
  'ev_7',
  false,
  '{"descriptions":["Bell finds a dropped leather wallet among the bone fragments.","At Present Day - 01:15 PM: Bell finds a dropped leather wallet among the bone fragments.","Notice this clue: Bell finds a dropped leather wallet among the bone fragments."],"hints":["Paper map proving the Sheriff co-planned the bank robbery.","Clue hint: Think about signed heist diagram.","Search for: a 2004 bank robbery plan diagram with sheriff briggs’s signature."],"clues":["Signed heist diagram","Item: Signed heist diagram","Clue Word: Signed heist diagram"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4837eabc-7782-5720-a8dc-0ba84454892a',
  'story_098',
  'ev_7',
  7,
  'Present Day - 02:00 PM',
  'Police raid retired Sheriff Briggs’s lakeside workshop.',
  'Police raid retired Sheriff Briggs’s lakeside workshop.',
  'A trunk filled with 1994 uncirculated gold coins from the county heist.',
  'Stolen mint gold coins',
  'Recovered Stolen Gold',
  '["Silver bullion","Paper cash","Rifle ammo"]'::jsonb,
  'Stolen mint gold coins',
  '["stolen mint gold coins","gold coins","stolen gold","mint coins","coins"]'::jsonb,
  'The original stolen bank treasure found in the sheriff’s house.',
  'ev_8',
  false,
  '{"descriptions":["Police raid retired Sheriff Briggs’s lakeside workshop.","At Present Day - 02:00 PM: Police raid retired Sheriff Briggs’s lakeside workshop.","Notice this clue: Police raid retired Sheriff Briggs’s lakeside workshop."],"hints":["The original stolen bank treasure found in the sheriff’s house.","Clue hint: Think about stolen mint gold coins.","Search for: a trunk filled with 1994 uncirculated gold coins from the county heist."],"clues":["Stolen mint gold coins","Item: Stolen mint gold coins","Clue Word: Stolen mint gold coins"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ed93f35b-a834-5ede-8619-4f71ba97a2a2',
  'story_098',
  'ev_8',
  8,
  'Present Day - 03:00 PM',
  'Detective Bell presents the dying message, the pipe, and the coins to Briggs.',
  'Detective Bell presents the dying message, the pipe, and the coins to Briggs.',
  'Briggs’s full confession of burying his partner alive twenty years ago.',
  'Sheriff’s confession',
  'Signed Murder Confession',
  '["Denial","Suicide","Silence"]'::jsonb,
  'Sheriff’s confession',
  '["sheriff’s confession","confession","sheriff confession","signed confession","admission"]'::jsonb,
  'Full admission by the corrupt retired lawman.',
  NULL,
  true,
  '{"descriptions":["Detective Bell presents the dying message, the pipe, and the coins to Briggs.","At Present Day - 03:00 PM: Detective Bell presents the dying message, the pipe, and the coins to Briggs.","Notice this clue: Detective Bell presents the dying message, the pipe, and the coins to Briggs."],"hints":["Full admission by the corrupt retired lawman.","Clue hint: Think about sheriff’s confession.","Search for: briggs’s full confession of burying his partner alive twenty years ago."],"clues":["Sheriff’s confession","Item: Sheriff’s confession","Clue Word: Sheriff’s confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_099 — THE BLACKMAIL PHOTOS IN THE DARKROOM
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_099',
  'The Blackmail Photos in the Darkroom',
  'Dark Mystery',
  'The red-lit basement darkroom of the Daily Chronicle, chemical trays, hanging film negatives, and smell of acetic stop-bath',
  'A veteran investigative photographer was found drowned inside his own chemical development tank, with freshly exposed negatives hanging above showing the mayor accepting bribes.',
  '[{"name":"Gregory Vance","role":"Mayor’s Chief of Staff","alibi":"Claims he was attending the Mayor’s charity gala across town","avatar":"👔"},{"name":"Walter Ross (Victim)","role":"Investigative Photojournalist","alibi":"Murdered in the darkroom at 10:15 PM","avatar":"📷"},{"name":"Nora Hayes","role":"Darkroom Apprentice","alibi":"In the supply closet stocking developer bottles","avatar":"🎞️"},{"name":"Detective Frank O’Malley","role":"Homicide Detective","alibi":"Arrived at the news building within fifteen minutes of the call","avatar":"🕵️‍♂️"}]'::jsonb,
  'Photographer Walter Ross captured photographs of the Mayor taking bribes from mob contractors. Chief of Staff Gregory Vance broke into the darkroom, drowned Walter in the acidic fixer tray, and opened the darkroom light trap to scorch the negatives, not realizing Walter had slipped the true roll into his socks.',
  'Mayor’s Chief of Staff Gregory Vance',
  'Gregory wanted to destroy the photographic evidence of the mayor’s bribe before the morning newspaper edition.',
  '[{"time":"09:00 PM","event":"Walter photographs the mayor accepting a bribe briefcase at the harbor docks."},{"time":"09:45 PM","event":"Walter arrives at the Chronicle darkroom to develop the film."},{"time":"10:15 PM","event":"Gregory Vance enters the darkroom, grabs Walter from behind, and drowns him in tray 3."},{"time":"10:20 PM","event":"Gregory flips on the white room lights to ruin the developing film sheets."},{"time":"10:45 PM","event":"Nora discovers Walter’s body and calls police."}]'::jsonb,
  '[{"id":"ev_1","title":"Drowning Chemical Tray","detail":"Stainless tray containing acidic fixer solution in which Walter was forcibly drowned."},{"id":"ev_2","title":"Forensic Neck Contusions","detail":"Thumb and finger pressure marks showing the victim was held down by force."},{"id":"ev_3","title":"Trench Coat Residue","detail":"Photographic fixer chemical traces found on Gregory Vance’s luxury coat sleeves."},{"id":"ev_4","title":"Bribe Exposure Prints","detail":"Sharp photographs from Walter’s sock showing Mayor Sterling accepting mob cash."}]'::jsonb,
  '[{"order":1,"title":"Submerged chemical tray","text":"The instrument of death inside the darkroom."},{"order":2,"title":"Light-burned negatives","text":"Demonstrates intentional destruction of photographic evidence."},{"order":3,"title":"Bruises on neck","text":"Proves violent homicide rather than an accidental fainting spell."},{"order":4,"title":"Chemical on light switch","text":"Shows the killer turned on the light with wet chemical fingers."},{"order":5,"title":"Acid fixer on coat cuffs","text":"Direct forensic trace placing Gregory Vance at the execution sink."},{"order":6,"title":"Sock-concealed film canister","text":"Smoking gun film roll containing the true pictures of the crime."}]'::jsonb,
  'Rival newspaper competitor seen outside: The competitor was looking for a scoop, but never went inside.; Darkroom chemical fumes warning label: Fumes were strong, but cannot produce physical thumb bruises on a neck.',
  'Claim the photographer had a toxic asthma attack from chemical vapor exposure.',
  'NORMAL',
  'Did the photographer suffer a chemical seizure, or was he silenced by the politician he exposed?',
  '[{"character":"Gregory Vance","secret":"A set of car keys with a Chronicle press basement entry fob on the ring."},{"character":"Walter Ross (Victim)","secret":"The genuine 35mm film canister hidden inside the ankle of his wool sock."},{"character":"Nora Hayes","secret":"She was developing portraits in the adjacent washroom when the intruder entered."},{"character":"Detective Frank O’Malley","secret":"He had received tips about municipal bribery from Walter yesterday."}]'::jsonb,
  '[{"lead":"Rival newspaper competitor seen outside","explanation":"The competitor was looking for a scoop, but never went inside."},{"lead":"Darkroom chemical fumes warning label","explanation":"Fumes were strong, but cannot produce physical thumb bruises on a neck."}]'::jsonb,
  '{"wrongTheories":["Walter suffered a toxic fainting seizure from breathing chemical stop-bath fumes and fell in.","The apprentice accidentally turned on the light and Walter died of an apoplexy shock."],"correctTheory":"Chief of Staff Gregory Vance drowned Walter in the fixer tray and flipped on the lights to destroy bribery photos."}'::jsonb,
  'Gregory Vance drowned Walter in the fixer bath to destroy photographs showing the mayor taking bribes at the docks.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Gregory Vance was convicted of murder, Mayor Sterling was impeached, and Walter’s final photos made front-page news."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The photos were lost forever, Walter’s death was ruled a toxic accident, and the corrupt mayor won re-election."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The newspaper publisher suppressed the story to avoid political backlash, dishonoring Walter’s sacrifice."}]'::jsonb,
  '{"intros":["A veteran investigative photographer was found drowned inside his own chemical development tank, with freshly exposed negatives hanging above showing the mayor accepting bribes.","Case file story_099: A veteran investigative photographer was found drowned inside his own chemical development tank, with freshly exposed negatives hanging above showing the mayor accepting bribes. Look closely at every clue.","Trouble begins in The red-lit basement darkroom of the Daily Chronicle, chemical trays, hanging film negatives, and smell of acetic stop-bath. A veteran investigative photographer was found drowned inside his own chemical development tank, with freshly exposed negatives hanging above showing the mayor accepting bribes.","The mystery starts now. A veteran investigative photographer was found drowned inside his own chemical development tank, with freshly exposed negatives hanging above showing the mayor accepting bribes. Can you solve it?"],"reveals":["Gregory Vance drowned Walter in the fixer bath to destroy photographs showing the mayor taking bribes at the docks.","The mystery is unraveled! Gregory Vance drowned Walter in the fixer bath to destroy photographs showing the mayor taking bribes at the docks.","At last, the truth comes out: Gregory Vance drowned Walter in the fixer bath to destroy photographs showing the mayor taking bribes at the docks.","Case resolved! Here is what happened: Gregory Vance drowned Walter in the fixer bath to destroy photographs showing the mayor taking bribes at the docks."],"hints":["Pay attention to where Mayor’s Chief of Staff Gregory Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_099';
DELETE FROM public.case_events WHERE case_id = 'story_099';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3aced6f9-1549-5637-a4ef-bac57f37d285',
  'story_099',
  'Gregory Vance',
  'Mayor’s Chief of Staff',
  'Smooth politician, expensive trench coat, smelling faintly of photographic stop-bath chemicals, polished leather shoes',
  'Walter was an eccentric alcoholic who worked with dangerous chemicals without a mask. It was an accident!',
  'A set of car keys with a Chronicle press basement entry fob on the ring.',
  'Claims he was attending the Mayor’s charity gala across town',
  'Top aide to Mayor Arthur Sterling',
  'The newspaper printing presses were scheduled to start rolling at midnight.',
  'Did not know the press building security cameras recorded his wet shoes leaving the side exit.',
  '👔',
  '["Walter was an eccentric alcoholic who worked with dangerous chemicals without a mask. It was an accident!","\"Walter was an eccentric alcoholic who worked with dangerous chemicals without a mask. It was an accident!\"","Listen to me: Walter was an eccentric alcoholic who worked with dangerous chemicals without a mask. It was an accident!","I tell you the truth: Walter was an eccentric alcoholic who worked with dangerous chemicals without a mask. It was an accident!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f602e327-c889-5315-919f-1febd0b08e90',
  'story_099',
  'Walter Ross (Victim)',
  'Investigative Photojournalist',
  'Fearless, dedicated, found face down in the industrial chemical fixer bath',
  'Deceased victim; note on his dryer read: "The mayor took the briefcase at the docks tonight."',
  'The genuine 35mm film canister hidden inside the ankle of his wool sock.',
  'Murdered in the darkroom at 10:15 PM',
  'Senior photographer for the Daily Chronicle',
  'The photos showed the mob boss handing the mayor cash in broad daylight.',
  'Did not hear Gregory sneak behind him under the red safety light.',
  '📷',
  '["Deceased victim; note on his dryer read: \"The mayor took the briefcase at the docks tonight.\"","\"Deceased victim; note on his dryer read: \"The mayor took the briefcase at the docks tonight.\"\"","Listen to me: Deceased victim; note on his dryer read: \"The mayor took the briefcase at the docks tonight.\"","I tell you the truth: Deceased victim; note on his dryer read: \"The mayor took the briefcase at the docks tonight.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5e9ed88f-27c9-536e-9b1d-3fea4162667e',
  'story_099',
  'Nora Hayes',
  'Darkroom Apprentice',
  'Young, ink-stained apron, glasses, crying in shock over Walter’s death',
  'The main white light switch was flipped on. Walter would NEVER turn on white light while negatives hung!',
  'She was developing portraits in the adjacent washroom when the intruder entered.',
  'In the supply closet stocking developer bottles',
  'Apprentice to Walter Ross',
  'Someone forced Walter’s head into tray three—the acetic acid fixer.',
  'Did not see the killer’s face in the dark corridor.',
  '🎞️',
  '["The main white light switch was flipped on. Walter would NEVER turn on white light while negatives hung!","\"The main white light switch was flipped on. Walter would NEVER turn on white light while negatives hung!\"","Listen to me: The main white light switch was flipped on. Walter would NEVER turn on white light while negatives hung!","I tell you the truth: The main white light switch was flipped on. Walter would NEVER turn on white light while negatives hung!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3f785158-3ed7-511c-ba8c-72402ce18ed9',
  'story_099',
  'Detective Frank O’Malley',
  'Homicide Detective',
  'Gruff, chewing toothpick, wearing felt fedora, holding forensic baggies',
  'Accidental drowning victims don’t have heavy bruising on the back of their neck from someone’s fingers.',
  'He had received tips about municipal bribery from Walter yesterday.',
  'Arrived at the news building within fifteen minutes of the call',
  'Investigating Walter’s homicide',
  'The chemical level in Walter’s lungs matched tray 3 photographic fixer.',
  'Did not know where Walter concealed the unexposed backup roll.',
  '🕵️‍♂️',
  '["Accidental drowning victims don’t have heavy bruising on the back of their neck from someone’s fingers.","\"Accidental drowning victims don’t have heavy bruising on the back of their neck from someone’s fingers.\"","Listen to me: Accidental drowning victims don’t have heavy bruising on the back of their neck from someone’s fingers.","I tell you the truth: Accidental drowning victims don’t have heavy bruising on the back of their neck from someone’s fingers."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '84f04bc8-c74c-52c6-a893-9f0bf4d7d7c4',
  'story_099',
  'ev_1',
  1,
  '10:45 PM',
  'Nora finds Walter slumped in the chemical sink.',
  'Nora finds Walter slumped in the chemical sink.',
  'Walter’s head submerged in photographic fixer bath with neck bruises.',
  'Submerged chemical tray',
  'Drowning Chemical Tray',
  '["Clean water sink","Developer tray","Wash tub"]'::jsonb,
  'Submerged chemical tray',
  '["submerged chemical tray","chemical tray","fixer tray","sink","submerged tray"]'::jsonb,
  'Large stainless steel development tray filled with acidic fixing solution.',
  'ev_2',
  true,
  '{"descriptions":["Nora finds Walter slumped in the chemical sink.","At 10:45 PM: Nora finds Walter slumped in the chemical sink.","Notice this clue: Nora finds Walter slumped in the chemical sink."],"hints":["Large stainless steel development tray filled with acidic fixing solution.","Clue hint: Think about submerged chemical tray.","Search for: walter’s head submerged in photographic fixer bath with neck bruises."],"clues":["Submerged chemical tray","Item: Submerged chemical tray","Clue Word: Submerged chemical tray"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7ad3da40-1eb7-5529-9026-228f181addbe',
  'story_099',
  'ev_2',
  2,
  '10:55 PM',
  'Detective O’Malley inspects the overhead drying line.',
  'Detective O’Malley inspects the overhead drying line.',
  'Severely scorched, blackened film negatives burned white by room light.',
  'Light-burned negatives',
  'Scorched Negatives',
  '["Torn paper","Wet cloth","Cut film"]'::jsonb,
  'Light-burned negatives',
  '["light-burned negatives","burned negatives","scorched negatives","light burned negatives","ruined film"]'::jsonb,
  'Film strips completely blacked out because someone intentionally flipped the white lights.',
  'ev_3',
  false,
  '{"descriptions":["Detective O’Malley inspects the overhead drying line.","At 10:55 PM: Detective O’Malley inspects the overhead drying line.","Notice this clue: Detective O’Malley inspects the overhead drying line."],"hints":["Film strips completely blacked out because someone intentionally flipped the white lights.","Clue hint: Think about light-burned negatives.","Search for: severely scorched, blackened film negatives burned white by room light."],"clues":["Light-burned negatives","Item: Light-burned negatives","Clue Word: Light-burned negatives"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b47e185e-4317-58d7-aa83-2de0ddc91836',
  'story_099',
  'ev_3',
  3,
  '11:05 PM',
  'O’Malley notices finger bruises on Walter’s neck.',
  'O’Malley notices finger bruises on Walter’s neck.',
  'Clear thumb impressions and pressure bruises on the back of the neck.',
  'Bruises on neck',
  'Forensic Neck Contusions',
  '["Cut throat","Rope mark","Scratch"]'::jsonb,
  'Bruises on neck',
  '["bruises on neck","neck bruises","bruises","thumb impressions","neck marks"]'::jsonb,
  'Definite physical signs of someone’s hands forcing the victim downward.',
  'ev_4',
  false,
  '{"descriptions":["O’Malley notices finger bruises on Walter’s neck.","At 11:05 PM: O’Malley notices finger bruises on Walter’s neck.","Notice this clue: O’Malley notices finger bruises on Walter’s neck."],"hints":["Definite physical signs of someone’s hands forcing the victim downward.","Clue hint: Think about bruises on neck.","Search for: clear thumb impressions and pressure bruises on the back of the neck."],"clues":["Bruises on neck","Item: Bruises on neck","Clue Word: Bruises on neck"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '57217007-6da3-5cbb-a500-9e8cae3f9b9f',
  'story_099',
  'ev_4',
  4,
  '11:20 PM',
  'O’Malley inspects the room’s light switch on the wall.',
  'O’Malley inspects the room’s light switch on the wall.',
  'Traces of chemical fixer fluid on the white plastic light toggle.',
  'Chemical on light switch',
  'Chemical Smudge on Switch',
  '["Blood","Ink","Dust"]'::jsonb,
  'Chemical on light switch',
  '["chemical on light switch","chemical smudge","light switch","fixer smudge","chemical on switch"]'::jsonb,
  'Wet chemical finger smudges left on the switch by the killer as he fled.',
  'ev_5',
  false,
  '{"descriptions":["O’Malley inspects the room’s light switch on the wall.","At 11:20 PM: O’Malley inspects the room’s light switch on the wall.","Notice this clue: O’Malley inspects the room’s light switch on the wall."],"hints":["Wet chemical finger smudges left on the switch by the killer as he fled.","Clue hint: Think about chemical on light switch.","Search for: traces of chemical fixer fluid on the white plastic light toggle."],"clues":["Chemical on light switch","Item: Chemical on light switch","Clue Word: Chemical on light switch"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1405f6cf-e9a9-5c72-98ae-e4c3d2d4ed2e',
  'story_099',
  'ev_5',
  5,
  '11:35 PM',
  'O’Malley checks Gregory Vance’s trench coat cuffs at the crime scene.',
  'O’Malley checks Gregory Vance’s trench coat cuffs at the crime scene.',
  'Distinct vinegar smell of acetic acid fixer soaked into Gregory’s coat cuffs.',
  'Acid fixer on coat cuffs',
  'Trench Coat Residue',
  '["Perfume","Alcohol","Tobacco smoke"]'::jsonb,
  'Acid fixer on coat cuffs',
  '["acid fixer on coat cuffs","fixer residue","acid on cuffs","coat cuffs","trench coat residue"]'::jsonb,
  'Photographic darkroom chemical smell clinging to the politician’s jacket.',
  'ev_6',
  true,
  '{"descriptions":["O’Malley checks Gregory Vance’s trench coat cuffs at the crime scene.","At 11:35 PM: O’Malley checks Gregory Vance’s trench coat cuffs at the crime scene.","Notice this clue: O’Malley checks Gregory Vance’s trench coat cuffs at the crime scene."],"hints":["Photographic darkroom chemical smell clinging to the politician’s jacket.","Clue hint: Think about acid fixer on coat cuffs.","Search for: distinct vinegar smell of acetic acid fixer soaked into gregory’s coat cuffs."],"clues":["Acid fixer on coat cuffs","Item: Acid fixer on coat cuffs","Clue Word: Acid fixer on coat cuffs"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '72447922-4b74-512b-ba76-cec0ce358625',
  'story_099',
  'ev_6',
  6,
  '11:50 PM',
  'O’Malley examines Walter’s clothing during the coroner inspection.',
  'O’Malley examines Walter’s clothing during the coroner inspection.',
  'An undamaged 35mm film canister tucked inside Walter’s heavy wool sock.',
  'Sock-concealed film canister',
  'Preserved 35mm Canister',
  '["Flash drive","Cash roll","Lighter"]'::jsonb,
  'Sock-concealed film canister',
  '["sock-concealed film canister","film canister","sock canister","35mm canister","preserved canister"]'::jsonb,
  'The real roll of film hidden away before the killer arrived.',
  'ev_7',
  false,
  '{"descriptions":["O’Malley examines Walter’s clothing during the coroner inspection.","At 11:50 PM: O’Malley examines Walter’s clothing during the coroner inspection.","Notice this clue: O’Malley examines Walter’s clothing during the coroner inspection."],"hints":["The real roll of film hidden away before the killer arrived.","Clue hint: Think about sock-concealed film canister.","Search for: an undamaged 35mm film canister tucked inside walter’s heavy wool sock."],"clues":["Sock-concealed film canister","Item: Sock-concealed film canister","Clue Word: Sock-concealed film canister"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '87cda4bc-6f3d-5a0d-8a78-3e7fd4781e9c',
  'story_099',
  'ev_7',
  7,
  '12:15 AM',
  'Nora develops the hidden sock canister in the secondary darkroom.',
  'Nora develops the hidden sock canister in the secondary darkroom.',
  'Crystal-clear photos of Mayor Sterling and Gregory Vance receiving cash at the docks.',
  'Mayor bribery photographs',
  'Bribe Exposure Prints',
  '["Blurry shadow","City landscape","Portrait of Walter"]'::jsonb,
  'Mayor bribery photographs',
  '["mayor bribery photographs","bribery photos","bribe photos","photos of mayor","bribe prints"]'::jsonb,
  'The photographic proof of corruption that cost Walter his life.',
  'ev_8',
  false,
  '{"descriptions":["Nora develops the hidden sock canister in the secondary darkroom.","At 12:15 AM: Nora develops the hidden sock canister in the secondary darkroom.","Notice this clue: Nora develops the hidden sock canister in the secondary darkroom."],"hints":["The photographic proof of corruption that cost Walter his life.","Clue hint: Think about mayor bribery photographs.","Search for: crystal-clear photos of mayor sterling and gregory vance receiving cash at the docks."],"clues":["Mayor bribery photographs","Item: Mayor bribery photographs","Clue Word: Mayor bribery photographs"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f6988a21-bd9b-59ac-8487-8a05659eedfe',
  'story_099',
  'ev_8',
  8,
  '12:35 AM',
  'Police place Gregory Vance and the Mayor under immediate arrest.',
  'Police place Gregory Vance and the Mayor under immediate arrest.',
  'Gregory’s confession when confronted with the chemical swab on his cuffs and the photos.',
  'Chief of Staff confession',
  'Signed Statement of Guilt',
  '["Denial","Bail bond","Silence"]'::jsonb,
  'Chief of Staff confession',
  '["chief of staff confession","confession","gregory confession","signed statement","admission"]'::jsonb,
  'Full confession of the drowning and attempted evidence destruction.',
  NULL,
  true,
  '{"descriptions":["Police place Gregory Vance and the Mayor under immediate arrest.","At 12:35 AM: Police place Gregory Vance and the Mayor under immediate arrest.","Notice this clue: Police place Gregory Vance and the Mayor under immediate arrest."],"hints":["Full confession of the drowning and attempted evidence destruction.","Clue hint: Think about chief of staff confession.","Search for: gregory’s confession when confronted with the chemical swab on his cuffs and the photos."],"clues":["Chief of Staff confession","Item: Chief of Staff confession","Clue Word: Chief of Staff confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_100 — THE ALCHEMIST’S FURNACE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_100',
  'The Alchemist’s Furnace',
  'Dark Mystery',
  'The abandoned underground stone cellar of an 18th-century foundry, soot-stained arches, iron furnaces, and green copper residue',
  'Inside a cold, bricked-up smelting furnace in the abandoned foundry, investigators discovered a human skeleton turned bright emerald green.',
  '[{"name":"Bartholomew Vance (Historical)","role":"Late Foundry Magnate","alibi":"Deceased founder of Vance Metallurgy","avatar":"🏭"},{"name":"Silas Thorne (Victim)","role":"Genius Metallurgist","alibi":"Murdered in 1898 inside the furnace","avatar":"💀"},{"name":"Dr. Helena Roy","role":"Forensic Archaeologist","alibi":"Excavating the cellar hearth site","avatar":"🏺"},{"name":"Julian Vance","role":"Vance Metallurgy Heir","alibi":"In the executive offices reviewing historical deeds","avatar":"📜"}]'::jsonb,
  'A century ago, foundry owner Bartholomew Vance discovered his partner Silas had perfected a lucrative green bronze alloy. Bartholomew struck Silas with a heavy iron crucible, shoved him into the furnace retort with fifty pounds of copper sulfate, and bricked up the chimney. Over the decades, the copper salts permeated Silas’s bones, turning them emerald green.',
  'Foundry Owner Bartholomew Vance',
  'Bartholomew murdered his partner to steal a secret formula for smelting indestructible green bronze.',
  '[{"time":"October 14, 1898 - 08:00 PM","event":"Silas perfects the green bronze formula in the foundry furnace."},{"time":"October 14, 1898 - 09:30 PM","event":"Bartholomew strikes Silas with an iron crucible and shuts him in the furnace."},{"time":"October 14, 1898 - 10:00 PM","event":"Bartholomew bricks up the furnace mouth and dumps copper sulfate into the flue."},{"time":"October 15, 1898","event":"Bartholomew announces Silas fled to America with the company gold."},{"time":"Present Day - 11:00 AM","event":"Archaeologists knock down the brick wall and uncover the emerald skeleton."}]'::jsonb,
  '[{"id":"ev_1","title":"Mineralized Bones","detail":"Complete human skeleton transformed into bright green copper carbonate."},{"id":"ev_2","title":"Foundry Crucible Murder Weapon","detail":"Iron casting pot with edge contours matching the fatal square skull fracture."},{"id":"ev_3","title":"Flask with Hidden Recipe","detail":"Silas’s pocket flask containing the original 1898 green bronze formula."},{"id":"ev_4","title":"Historical Confession Diary","detail":"Bartholomew Vance’s private journal detailing how he sealed Silas in the furnace."}]'::jsonb,
  '[{"order":1,"title":"Emerald green skeleton","text":"The astonishing discovery of bones dyed green by copper salts."},{"order":2,"title":"Square skull fracture","text":"Proves Silas Thorne was murdered before being sealed in the furnace."},{"order":3,"title":"Heavy casting crucible","text":"The physical tool used to strike Silas unconscious."},{"order":4,"title":"Copper-bronze pocket flask","text":"The coveted invention that drove Bartholomew to murder."},{"order":5,"title":"Foundry slag mortar","text":"Proves the furnace was permanently sealed in 1898."},{"order":6,"title":"Founder’s 1898 diary confession","text":"Unshakable historical written proof of Bartholomew Vance’s guilt."}]'::jsonb,
  'Alchemical mystical symbols on the cellar wall: Carved by eccentric foundry workers as folklore decorations.; Gold coins missing from foundry safe: Bartholomew spent the missing gold on personal debts in 1899.',
  'Claim an occult alchemical ritual caused the victim’s skeleton to turn into green crystal.',
  'NORMAL',
  'Why were the bones stained brilliant green, and who sealed the victim inside the furnace?',
  '[{"character":"Bartholomew Vance (Historical)","secret":"A sealed iron ledger hidden in the foundry cornerstone documenting the murder."},{"character":"Silas Thorne (Victim)","secret":"The handwritten recipe for green bronze was sealed inside his bronze pocket flask."},{"character":"Dr. Helena Roy","secret":"She was commissioned by the city to assess the historic foundry for demolition."},{"character":"Julian Vance","secret":"He possesses Bartholomew’s private handwritten diary detailing the 1898 crime."}]'::jsonb,
  '[{"lead":"Alchemical mystical symbols on the cellar wall","explanation":"Carved by eccentric foundry workers as folklore decorations."},{"lead":"Gold coins missing from foundry safe","explanation":"Bartholomew spent the missing gold on personal debts in 1899."}]'::jsonb,
  '{"wrongTheories":["An alchemist accidentally poisoned himself with arsenic while trying to create gold.","A runaway slave took refuge in the furnace and died of winter exposure."],"correctTheory":"Bartholomew Vance struck Silas Thorne with a crucible and sealed him inside the copper furnace to steal his green bronze formula."}'::jsonb,
  'Silas Thorne was struck with an iron crucible and sealed inside the furnace by Bartholomew Vance, who stole his green bronze alloy.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Silas Thorne was given an honorable burial, his name was restored as the true inventor, and the Vance fortune was seized by descendants."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The skeleton was placed in a museum freak show, leaving the true murder and intellectual theft forgotten."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The foundry was demolished, burying Silas’s remains and the true story beneath a parking lot forever."}]'::jsonb,
  '{"intros":["Inside a cold, bricked-up smelting furnace in the abandoned foundry, investigators discovered a human skeleton turned bright emerald green.","Case file story_100: Inside a cold, bricked-up smelting furnace in the abandoned foundry, investigators discovered a human skeleton turned bright emerald green. Look closely at every clue.","Trouble begins in The abandoned underground stone cellar of an 18th-century foundry, soot-stained arches, iron furnaces, and green copper residue. Inside a cold, bricked-up smelting furnace in the abandoned foundry, investigators discovered a human skeleton turned bright emerald green.","The mystery starts now. Inside a cold, bricked-up smelting furnace in the abandoned foundry, investigators discovered a human skeleton turned bright emerald green. Can you solve it?"],"reveals":["Silas Thorne was struck with an iron crucible and sealed inside the furnace by Bartholomew Vance, who stole his green bronze alloy.","The mystery is unraveled! Silas Thorne was struck with an iron crucible and sealed inside the furnace by Bartholomew Vance, who stole his green bronze alloy.","At last, the truth comes out: Silas Thorne was struck with an iron crucible and sealed inside the furnace by Bartholomew Vance, who stole his green bronze alloy.","Case resolved! Here is what happened: Silas Thorne was struck with an iron crucible and sealed inside the furnace by Bartholomew Vance, who stole his green bronze alloy."],"hints":["Pay attention to where Foundry Owner Bartholomew Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_100';
DELETE FROM public.case_events WHERE case_id = 'story_100';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ee98f6b2-38bd-5d45-90d7-b2d7f7b72704',
  'story_100',
  'Bartholomew Vance (Historical)',
  'Late Foundry Magnate',
  'Greedy, iron-willed, portrait shows him holding an emerald bronze scepter',
  'Historical records state Silas left for America with his share of company gold.',
  'A sealed iron ledger hidden in the foundry cornerstone documenting the murder.',
  'Deceased founder of Vance Metallurgy',
  'Business partner and killer of Silas Thorne',
  'Silas’s body was encased behind the firebrick refractory wall.',
  'Did not foresee modern historical archaeologists excavating the basement.',
  '🏭',
  '["Historical records state Silas left for America with his share of company gold.","\"Historical records state Silas left for America with his share of company gold.\"","Listen to me: Historical records state Silas left for America with his share of company gold.","I tell you the truth: Historical records state Silas left for America with his share of company gold."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '45520222-58f4-5577-be0f-7fbae632e02b',
  'story_100',
  'Silas Thorne (Victim)',
  'Genius Metallurgist',
  'Brilliant chemist, skeleton discovered inside the bricked furnace retort',
  'Deceased victim; skull shows a blunt force fracture from an iron crucible.',
  'The handwritten recipe for green bronze was sealed inside his bronze pocket flask.',
  'Murdered in 1898 inside the furnace',
  'Partner and inventor of the green alloy',
  'Bartholomew was planning to sell the patent to the military without him.',
  'Did not expect his partner to strike him from behind with an iron crucible.',
  '💀',
  '["Deceased victim; skull shows a blunt force fracture from an iron crucible.","\"Deceased victim; skull shows a blunt force fracture from an iron crucible.\"","Listen to me: Deceased victim; skull shows a blunt force fracture from an iron crucible.","I tell you the truth: Deceased victim; skull shows a blunt force fracture from an iron crucible."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6ab12e10-fc06-542c-8f0f-b873f812c755',
  'story_100',
  'Dr. Helena Roy',
  'Forensic Archaeologist',
  'Focused, dust-covered khakis, magnifying loupe, carrying chemical reagents',
  'The green coloration isn’t magic—it’s copper carbonate mineralization from prolonged heat and copper salts.',
  'She was commissioned by the city to assess the historic foundry for demolition.',
  'Excavating the cellar hearth site',
  'Lead researcher examining the green skeleton',
  'The skull suffered a massive depression fracture before being exposed to heat.',
  'Did not know where the original patent formulas were concealed.',
  '🏺',
  '["The green coloration isn’t magic—it’s copper carbonate mineralization from prolonged heat and copper salts.","\"The green coloration isn’t magic—it’s copper carbonate mineralization from prolonged heat and copper salts.\"","Listen to me: The green coloration isn’t magic—it’s copper carbonate mineralization from prolonged heat and copper salts.","I tell you the truth: The green coloration isn’t magic—it’s copper carbonate mineralization from prolonged heat and copper salts."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '58b315d1-1787-5ce2-81ca-ff4c36de5667',
  'story_100',
  'Julian Vance',
  'Vance Metallurgy Heir',
  'Nervous corporate heir, cashmere coat, desperate to protect the family corporate brand',
  'Silas Thorne was a rogue partner who embezzled our foundry funds and ran away!',
  'He possesses Bartholomew’s private handwritten diary detailing the 1898 crime.',
  'In the executive offices reviewing historical deeds',
  'Great-grandson of Bartholomew Vance',
  'The family fortune was founded entirely on the stolen green bronze recipe.',
  'Did not know Dr. Roy found Silas’s bronze pocket flask inside the skeleton’s ribs.',
  '📜',
  '["Silas Thorne was a rogue partner who embezzled our foundry funds and ran away!","\"Silas Thorne was a rogue partner who embezzled our foundry funds and ran away!\"","Listen to me: Silas Thorne was a rogue partner who embezzled our foundry funds and ran away!","I tell you the truth: Silas Thorne was a rogue partner who embezzled our foundry funds and ran away!"]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '081d226a-dfd6-535e-88e8-86d6eeee261a',
  'story_100',
  'ev_1',
  1,
  'Present Day - 11:00 AM',
  'Dr. Roy breaks through the sealed brick furnace wall.',
  'Dr. Roy breaks through the sealed brick furnace wall.',
  'A complete human skeleton stained glowing emerald green inside the iron flue.',
  'Emerald green skeleton',
  'Mineralized Bones',
  '["Charred wood","Iron slag","Copper ingot"]'::jsonb,
  'Emerald green skeleton',
  '["emerald green skeleton","green skeleton","emerald skeleton","mineralized bones","green bones"]'::jsonb,
  'Human remains dyed bright green by intense copper salt saturation.',
  'ev_2',
  true,
  '{"descriptions":["Dr. Roy breaks through the sealed brick furnace wall.","At Present Day - 11:00 AM: Dr. Roy breaks through the sealed brick furnace wall.","Notice this clue: Dr. Roy breaks through the sealed brick furnace wall."],"hints":["Human remains dyed bright green by intense copper salt saturation.","Clue hint: Think about emerald green skeleton.","Search for: a complete human skeleton stained glowing emerald green inside the iron flue."],"clues":["Emerald green skeleton","Item: Emerald green skeleton","Clue Word: Emerald green skeleton"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '558e98b4-b7e2-5c0c-b426-7bf4f8b1af12',
  'story_100',
  'ev_2',
  2,
  'Present Day - 11:30 AM',
  'Dr. Roy inspects the skull of the skeleton.',
  'Dr. Roy inspects the skull of the skeleton.',
  'A square-edge blunt force depression fracture on the parietal bone.',
  'Square skull fracture',
  'Depression Skull Trauma',
  '["Bullet hole","Axe cut","Normal crack"]'::jsonb,
  'Square skull fracture',
  '["square skull fracture","skull fracture","square fracture","blunt trauma","depression fracture"]'::jsonb,
  'Lethal blow delivered to the head with a heavy square iron tool.',
  'ev_3',
  false,
  '{"descriptions":["Dr. Roy inspects the skull of the skeleton.","At Present Day - 11:30 AM: Dr. Roy inspects the skull of the skeleton.","Notice this clue: Dr. Roy inspects the skull of the skeleton."],"hints":["Lethal blow delivered to the head with a heavy square iron tool.","Clue hint: Think about square skull fracture.","Search for: a square-edge blunt force depression fracture on the parietal bone."],"clues":["Square skull fracture","Item: Square skull fracture","Clue Word: Square skull fracture"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4d58baac-58a2-59e2-b139-bab4dae89288',
  'story_100',
  'ev_3',
  3,
  'Present Day - 12:00 PM',
  'Roy recovers an antique iron tool from the ashes beside the bones.',
  'Roy recovers an antique iron tool from the ashes beside the bones.',
  'An 1898 heavy casting crucible with edges matching the skull fracture.',
  'Heavy casting crucible',
  'Foundry Crucible Murder Weapon',
  '["Shovel","Tongs","Hammer"]'::jsonb,
  'Heavy casting crucible',
  '["heavy casting crucible","casting crucible","crucible","iron crucible","murder weapon"]'::jsonb,
  'Cast-iron pot used for melting metal, matching the wound in the victim’s skull.',
  'ev_4',
  false,
  '{"descriptions":["Roy recovers an antique iron tool from the ashes beside the bones.","At Present Day - 12:00 PM: Roy recovers an antique iron tool from the ashes beside the bones.","Notice this clue: Roy recovers an antique iron tool from the ashes beside the bones."],"hints":["Cast-iron pot used for melting metal, matching the wound in the victim’s skull.","Clue hint: Think about heavy casting crucible.","Search for: an 1898 heavy casting crucible with edges matching the skull fracture."],"clues":["Heavy casting crucible","Item: Heavy casting crucible","Clue Word: Heavy casting crucible"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1b907f31-7ce1-55ff-b8cb-08a2f3929fca',
  'story_100',
  'ev_4',
  4,
  'Present Day - 12:45 PM',
  'Roy searches inside the skeleton’s rib cage.',
  'Roy searches inside the skeleton’s rib cage.',
  'A sealed copper-bronze flask containing parchment blueprints.',
  'Copper-bronze pocket flask',
  'Flask with Hidden Recipe',
  '["Belt buckle","Pocket watch","Coin purse"]'::jsonb,
  'Copper-bronze pocket flask',
  '["copper-bronze pocket flask","bronze flask","pocket flask","flask","recipe flask"]'::jsonb,
  'Metal liquor flask containing Silas’s original green bronze metallurgy formula.',
  'ev_5',
  false,
  '{"descriptions":["Roy searches inside the skeleton’s rib cage.","At Present Day - 12:45 PM: Roy searches inside the skeleton’s rib cage.","Notice this clue: Roy searches inside the skeleton’s rib cage."],"hints":["Metal liquor flask containing Silas’s original green bronze metallurgy formula.","Clue hint: Think about copper-bronze pocket flask.","Search for: a sealed copper-bronze flask containing parchment blueprints."],"clues":["Copper-bronze pocket flask","Item: Copper-bronze pocket flask","Clue Word: Copper-bronze pocket flask"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '39c3774c-2108-5607-bb3c-0f59b37b24ce',
  'story_100',
  'ev_5',
  5,
  'Present Day - 01:30 PM',
  'Roy inspects the brick mortar of the sealed furnace mouth.',
  'Roy inspects the brick mortar of the sealed furnace mouth.',
  'Lime mortar mixed with 1898 foundry slag stamped with Bartholomew’s mark.',
  'Foundry slag mortar',
  'Sealed Masonry Mortar',
  '["Modern cement","Mud","Clay"]'::jsonb,
  'Foundry slag mortar',
  '["foundry slag mortar","slag mortar","mortar","masonry mortar","foundry mortar"]'::jsonb,
  'Historical building mortar proving the furnace was sealed shut in 1898.',
  'ev_6',
  true,
  '{"descriptions":["Roy inspects the brick mortar of the sealed furnace mouth.","At Present Day - 01:30 PM: Roy inspects the brick mortar of the sealed furnace mouth.","Notice this clue: Roy inspects the brick mortar of the sealed furnace mouth."],"hints":["Historical building mortar proving the furnace was sealed shut in 1898.","Clue hint: Think about foundry slag mortar.","Search for: lime mortar mixed with 1898 foundry slag stamped with bartholomew’s mark."],"clues":["Foundry slag mortar","Item: Foundry slag mortar","Clue Word: Foundry slag mortar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '43ae1dff-dc8e-5ad1-bfcd-0af280003819',
  'story_100',
  'ev_6',
  6,
  'Present Day - 02:15 PM',
  'Police inspect Julian Vance’s executive safe.',
  'Police inspect Julian Vance’s executive safe.',
  'Bartholomew Vance’s handwritten 1898 diary confessing to killing Silas in the kiln.',
  'Founder’s 1898 diary confession',
  'Historical Confession Diary',
  '["Old ledger","Tax bill","Company catalog"]'::jsonb,
  'Founder’s 1898 diary confession',
  '["founder’s 1898 diary confession","diary confession","founder diary","1898 diary","confession diary"]'::jsonb,
  'Personal handwritten journal admitting to the murder and cover-up.',
  'ev_7',
  false,
  '{"descriptions":["Police inspect Julian Vance’s executive safe.","At Present Day - 02:15 PM: Police inspect Julian Vance’s executive safe.","Notice this clue: Police inspect Julian Vance’s executive safe."],"hints":["Personal handwritten journal admitting to the murder and cover-up.","Clue hint: Think about founder’s 1898 diary confession.","Search for: bartholomew vance’s handwritten 1898 diary confessing to killing silas in the kiln."],"clues":["Founder’s 1898 diary confession","Item: Founder’s 1898 diary confession","Clue Word: Founder’s 1898 diary confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '03e84b5b-ba83-519f-9b1a-bcb00c5b0c37',
  'story_100',
  'ev_7',
  7,
  'Present Day - 03:00 PM',
  'Forensic chemical spectroscopy analysis completes on the bone marrow.',
  'Forensic chemical spectroscopy analysis completes on the bone marrow.',
  'Copper carbonate mineral bonds proving ninety years of chemical crystallization.',
  'Copper carbonate bone test',
  'Spectroscopy Bone Report',
  '["Arsenic test","Lead test","Rust report"]'::jsonb,
  'Copper carbonate bone test',
  '["copper carbonate bone test","copper carbonate","bone test","spectroscopy report","carbonate test"]'::jsonb,
  'Scientific proof that copper salts saturated the bones inside the sealed kiln.',
  'ev_8',
  false,
  '{"descriptions":["Forensic chemical spectroscopy analysis completes on the bone marrow.","At Present Day - 03:00 PM: Forensic chemical spectroscopy analysis completes on the bone marrow.","Notice this clue: Forensic chemical spectroscopy analysis completes on the bone marrow."],"hints":["Scientific proof that copper salts saturated the bones inside the sealed kiln.","Clue hint: Think about copper carbonate bone test.","Search for: copper carbonate mineral bonds proving ninety years of chemical crystallization."],"clues":["Copper carbonate bone test","Item: Copper carbonate bone test","Clue Word: Copper carbonate bone test"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '559a7742-1308-5b81-b5bc-9f5c57684e9c',
  'story_100',
  'ev_8',
  8,
  'Present Day - 03:45 PM',
  'The historical society officially re-attributes the green bronze patent to Silas Thorne.',
  'The historical society officially re-attributes the green bronze patent to Silas Thorne.',
  'Silas Thorne restored to history as the true inventor of the famous alloy.',
  'Patent re-attribution decree',
  'Historical Justice Decree',
  '["Court fine","Demolition order","Lawsuit"]'::jsonb,
  'Patent re-attribution decree',
  '["patent re-attribution decree","patent decree","justice decree","attribution decree","decree"]'::jsonb,
  'Official correction of history giving full credit to the murdered partner.',
  NULL,
  true,
  '{"descriptions":["The historical society officially re-attributes the green bronze patent to Silas Thorne.","At Present Day - 03:45 PM: The historical society officially re-attributes the green bronze patent to Silas Thorne.","Notice this clue: The historical society officially re-attributes the green bronze patent to Silas Thorne."],"hints":["Official correction of history giving full credit to the murdered partner.","Clue hint: Think about patent re-attribution decree.","Search for: silas thorne restored to history as the true inventor of the famous alloy."],"clues":["Patent re-attribution decree","Item: Patent re-attribution decree","Clue Word: Patent re-attribution decree"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_101 — THE CLOCKMAKER’S LAST WILL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_101',
  'The Clockmaker’s Last Will',
  'Dark Mystery',
  'The master workshop of the Old Town Clockmaker, hundreds of ticking pendulum clocks, gears, brass springs, and chime weights',
  'At exactly 11:11 AM, the master horologist’s giant grandfather clock released a brass spring, opening a secret drawer that was empty, while the clockmaker lay dead at his workbench with a gear tooth lodged in his windpipe.',
  '[{"name":"Gregory Vance","role":"Greedy Nephew","alibi":"Claims he was having breakfast at the bakery across the square","avatar":"⏱️"},{"name":"Tobias Vance (Victim)","role":"Master Clockmaker","alibi":"Murdered at workbench 1","avatar":"🕰️"},{"name":"Clara Sutton","role":"Horology Apprentice","alibi":"Delivering repaired watches to customers in town","avatar":"⚙️"},{"name":"Inspector Ray Vance","role":"City Coroner & Detective","alibi":"Arrived at the scene at 11:20 AM right after the alarm chime","avatar":"🔎"}]'::jsonb,
  'Clockmaker Tobias Vance created an elaborate grandfather clock programmed to open a secret will compartment at 11:11 AM on his 80th birthday. His greedy nephew Gregory broke into the shop at 10:45 AM, stole the will, and murdered his uncle by forcing a sharp clock gear into his throat to fake an accidental gear-spring malfunction.',
  'Nephew Gregory Vance',
  'Gregory wanted to steal the clockmaker’s secret will before the 11:11 mechanism opened to disinherit him.',
  '[{"time":"10:30 AM","event":"Tobias finishes winding the 11:11 commemorative grandfather clock."},{"time":"10:45 AM","event":"Gregory enters the workshop demanding his inheritance."},{"time":"10:50 AM","event":"Gregory strangles Tobias and shoves a brass gear into his windpipe to fake an explosion."},{"time":"11:00 AM","event":"Gregory steals the will from the open workbench drawer and flees."},{"time":"11:11 AM","event":"The grandfather clock chimes loudly and springs open the empty secret compartment."}]'::jsonb,
  '[{"id":"ev_1","title":"Lodged Escapement Gear","detail":"Twelve-tooth brass gear forced down Tobias’s windpipe to simulate mechanical failure."},{"id":"ev_2","title":"Neck Bruise Pattern","detail":"Fingertip bruises proving Tobias was strangled unconscious before the gear was placed."},{"id":"ev_3","title":"Gear Tooth Thumb Injury","detail":"Deep cut on Gregory’s thumb matching the exact spacing of the brass gear teeth."},{"id":"ev_4","title":"Pendulum Will Duplicate","detail":"Legal testament found inside the clock pendulum bequeathing the business to Clara."}]'::jsonb,
  '[{"order":1,"title":"Empty 11:11 clock drawer","text":"Confirms the secret inheritance document was stolen before the chime."},{"order":2,"title":"Brass gear in throat","text":"The grotesque instrument used to stage an accidental workshop explosion."},{"order":3,"title":"Manual strangulation bruises","text":"Irrefutable proof of violent premeditated homicide."},{"order":4,"title":"Intact mainspring","text":"Completely disproves the theory that a high-tension spring snapped."},{"order":5,"title":"Matching gear cut on thumb","text":"Physical injury linking Gregory directly to inserting the gear."},{"order":6,"title":"Stolen charred will","text":"The motive: Gregory wanted to destroy the will disinheriting him."}]'::jsonb,
  'Rattling high-pressure pendulum weight: Standard lead weight adjustment, completely non-hazardous.; Disgruntled customer demanding a clock refund: A customer argued with Tobias yesterday, but left the city.',
  'Claim a high-tension mainspring exploded and fired the gear across the room into his neck.',
  'NORMAL',
  'Did a catastrophic gear failure shoot metal into his throat, or was the clockmaker assassinated for his hidden will?',
  '[{"character":"Gregory Vance","secret":"Tobias’s real will leaving the clockmaking shop to the city apprentice guild."},{"character":"Tobias Vance (Victim)","secret":"A duplicate will hidden inside the hollow brass pendulum bob."},{"character":"Clara Sutton","secret":"She was chosen by Tobias to inherit and manage the master workshop."},{"character":"Inspector Ray Vance","secret":"He was a longtime admirer of Tobias’s precision clocks."}]'::jsonb,
  '[{"lead":"Rattling high-pressure pendulum weight","explanation":"Standard lead weight adjustment, completely non-hazardous."},{"lead":"Disgruntled customer demanding a clock refund","explanation":"A customer argued with Tobias yesterday, but left the city."}]'::jsonb,
  '{"wrongTheories":["The high-tension mainspring exploded under pressure and shot a gear into Tobias’s neck.","Tobias accidentally swallowed a small gear while using his teeth to hold parts during repair."],"correctTheory":"Gregory Vance strangled his uncle and jammed a clock gear down his throat to fake an accident and steal the will disinheriting him."}'::jsonb,
  'Gregory Vance strangled Tobias and forced a gear into his throat to fake a workshop explosion so he could steal the disinheriting will.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Gregory was sentenced to hang for murder, and Clara Sutton inherited the master workshop to continue Tobias’s legacy."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The death was ruled a freak workshop accident, and Gregory sold off the shop’s antique clocks for gambling money."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Town gossip blamed a mechanical clock curse, frightening customers away while Gregory escaped justice."}]'::jsonb,
  '{"intros":["At exactly 11:11 AM, the master horologist’s giant grandfather clock released a brass spring, opening a secret drawer that was empty, while the clockmaker lay dead at his workbench with a gear tooth lodged in his windpipe.","Case file story_101: At exactly 11:11 AM, the master horologist’s giant grandfather clock released a brass spring, opening a secret drawer that was empty, while the clockmaker lay dead at his workbench with a gear tooth lodged in his windpipe. Look closely at every clue.","Trouble begins in The master workshop of the Old Town Clockmaker, hundreds of ticking pendulum clocks, gears, brass springs, and chime weights. At exactly 11:11 AM, the master horologist’s giant grandfather clock released a brass spring, opening a secret drawer that was empty, while the clockmaker lay dead at his workbench with a gear tooth lodged in his windpipe.","The mystery starts now. At exactly 11:11 AM, the master horologist’s giant grandfather clock released a brass spring, opening a secret drawer that was empty, while the clockmaker lay dead at his workbench with a gear tooth lodged in his windpipe. Can you solve it?"],"reveals":["Gregory Vance strangled Tobias and forced a gear into his throat to fake a workshop explosion so he could steal the disinheriting will.","The mystery is unraveled! Gregory Vance strangled Tobias and forced a gear into his throat to fake a workshop explosion so he could steal the disinheriting will.","At last, the truth comes out: Gregory Vance strangled Tobias and forced a gear into his throat to fake a workshop explosion so he could steal the disinheriting will.","Case resolved! Here is what happened: Gregory Vance strangled Tobias and forced a gear into his throat to fake a workshop explosion so he could steal the disinheriting will."],"hints":["Pay attention to where Nephew Gregory Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_101';
DELETE FROM public.case_events WHERE case_id = 'story_101';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '17031e69-8c1d-5aa7-97c9-43a7941b7c45',
  'story_101',
  'Gregory Vance',
  'Greedy Nephew',
  'Gambling debts, cheap cologne, nervous glance at the wall clocks, bandaged thumb',
  'Uncle Tobias was working on that dangerous pressurized mainspring. It must have burst in his face!',
  'Tobias’s real will leaving the clockmaking shop to the city apprentice guild.',
  'Claims he was having breakfast at the bakery across the square',
  'Sole living nephew of Tobias Vance',
  'The grandfather clock drawer was calibrated to pop open at 11:11 AM.',
  'Did not know Tobias kept a duplicate copy of the will inside the clock’s pendulum hollow.',
  '⏱️',
  '["Uncle Tobias was working on that dangerous pressurized mainspring. It must have burst in his face!","\"Uncle Tobias was working on that dangerous pressurized mainspring. It must have burst in his face!\"","Listen to me: Uncle Tobias was working on that dangerous pressurized mainspring. It must have burst in his face!","I tell you the truth: Uncle Tobias was working on that dangerous pressurized mainspring. It must have burst in his face!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '92426d40-adc7-5e81-8dde-a1e99a3e2fae',
  'story_101',
  'Tobias Vance (Victim)',
  'Master Clockmaker',
  'Meticulous craftsman, white apron, dead at his workbench with clock tools scattered',
  'Deceased victim; his pocket chronometer was set to chime at 11:11 AM.',
  'A duplicate will hidden inside the hollow brass pendulum bob.',
  'Murdered at workbench 1',
  'Owner of the Vance Horology Workshop',
  'Gregory had stolen gold chronometer gears from the shop last month.',
  'Did not suspect his nephew would physically choke him with clock parts.',
  '🕰️',
  '["Deceased victim; his pocket chronometer was set to chime at 11:11 AM.","\"Deceased victim; his pocket chronometer was set to chime at 11:11 AM.\"","Listen to me: Deceased victim; his pocket chronometer was set to chime at 11:11 AM.","I tell you the truth: Deceased victim; his pocket chronometer was set to chime at 11:11 AM."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3a6cd283-83f4-5f98-b735-cdfc9117bb0e',
  'story_101',
  'Clara Sutton',
  'Horology Apprentice',
  'Quiet, ink-stained fingers, deep reverence for her master, wearing magnifying loupe',
  'Master Tobias’s mainsprings never explode. He wound that clock with an antique safety key yesterday.',
  'She was chosen by Tobias to inherit and manage the master workshop.',
  'Delivering repaired watches to customers in town',
  'Apprentice of Tobias Vance for seven years',
  'The drawer at 11:11 was designed to hold the inheritance deed.',
  'Did not know Gregory had cornered Tobias in the workshop earlier.',
  '⚙️',
  '["Master Tobias’s mainsprings never explode. He wound that clock with an antique safety key yesterday.","\"Master Tobias’s mainsprings never explode. He wound that clock with an antique safety key yesterday.\"","Listen to me: Master Tobias’s mainsprings never explode. He wound that clock with an antique safety key yesterday.","I tell you the truth: Master Tobias’s mainsprings never explode. He wound that clock with an antique safety key yesterday."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fb1c78b9-0476-52bd-b496-78b2f6634312',
  'story_101',
  'Inspector Ray Vance',
  'City Coroner & Detective',
  'Methodical, spectacles, carrying tweezers and forensic forceps',
  'A flying gear doesn’t wedge itself three inches down a man’s windpipe without crushing the exterior throat cartilage.',
  'He was a longtime admirer of Tobias’s precision clocks.',
  'Arrived at the scene at 11:20 AM right after the alarm chime',
  'Investigator handling the death',
  'The injuries show manual strangulation before the gear was inserted.',
  'Did not know the pendulum itself was a secret compartment.',
  '🔎',
  '["A flying gear doesn’t wedge itself three inches down a man’s windpipe without crushing the exterior throat cartilage.","\"A flying gear doesn’t wedge itself three inches down a man’s windpipe without crushing the exterior throat cartilage.\"","Listen to me: A flying gear doesn’t wedge itself three inches down a man’s windpipe without crushing the exterior throat cartilage.","I tell you the truth: A flying gear doesn’t wedge itself three inches down a man’s windpipe without crushing the exterior throat cartilage."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c0a8ca1a-b7e5-565e-a0ff-b08e7e667127',
  'story_101',
  'ev_1',
  1,
  '11:11 AM',
  'The grandfather clock chime sounds and opens a drawer.',
  'The grandfather clock chime sounds and opens a drawer.',
  'An empty velvet-lined secret drawer popped open on the clock face.',
  'Empty 11:11 clock drawer',
  'Secret Clock Compartment',
  '["Drawer with money","Broken spring","Torn paper"]'::jsonb,
  'Empty 11:11 clock drawer',
  '["empty 11:11 clock drawer","empty drawer","clock drawer","secret compartment","11:11 drawer"]'::jsonb,
  'The hidden compartment that was designed to reveal the master’s will.',
  'ev_2',
  true,
  '{"descriptions":["The grandfather clock chime sounds and opens a drawer.","At 11:11 AM: The grandfather clock chime sounds and opens a drawer.","Notice this clue: The grandfather clock chime sounds and opens a drawer."],"hints":["The hidden compartment that was designed to reveal the master’s will.","Clue hint: Think about empty 11:11 clock drawer.","Search for: an empty velvet-lined secret drawer popped open on the clock face."],"clues":["Empty 11:11 clock drawer","Item: Empty 11:11 clock drawer","Clue Word: Empty 11:11 clock drawer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0c1bb728-38bd-5863-83e3-5d4a7a2d908a',
  'story_101',
  'ev_2',
  2,
  '11:20 AM',
  'Inspector Vance examines Tobias’s throat.',
  'Inspector Vance examines Tobias’s throat.',
  'A sharp 12-tooth brass escapement gear lodged deep inside the trachea.',
  'Brass gear in throat',
  'Lodged Escapement Gear',
  '["Bullet","Glass shard","Spring coil"]'::jsonb,
  'Brass gear in throat',
  '["brass gear in throat","gear in throat","brass gear","gear","escapement gear"]'::jsonb,
  'Clock mechanism gear forcibly jammed down the victim’s windpipe.',
  'ev_3',
  false,
  '{"descriptions":["Inspector Vance examines Tobias’s throat.","At 11:20 AM: Inspector Vance examines Tobias’s throat.","Notice this clue: Inspector Vance examines Tobias’s throat."],"hints":["Clock mechanism gear forcibly jammed down the victim’s windpipe.","Clue hint: Think about brass gear in throat.","Search for: a sharp 12-tooth brass escapement gear lodged deep inside the trachea."],"clues":["Brass gear in throat","Item: Brass gear in throat","Clue Word: Brass gear in throat"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '45a49218-e7df-5335-9da6-363a88904fbc',
  'story_101',
  'ev_3',
  3,
  '11:30 AM',
  'Vance checks the exterior of Tobias’s neck.',
  'Vance checks the exterior of Tobias’s neck.',
  'Heavy fingertip bruises and thumb marks around the vocal cords.',
  'Manual strangulation bruises',
  'Neck Bruise Pattern',
  '["Burn marks","Scratches","Cut skin"]'::jsonb,
  'Manual strangulation bruises',
  '["manual strangulation bruises","strangulation bruises","neck bruises","choke marks","bruises"]'::jsonb,
  'Signs of manual choking proving the victim was strangled before the gear was placed.',
  'ev_4',
  false,
  '{"descriptions":["Vance checks the exterior of Tobias’s neck.","At 11:30 AM: Vance checks the exterior of Tobias’s neck.","Notice this clue: Vance checks the exterior of Tobias’s neck."],"hints":["Signs of manual choking proving the victim was strangled before the gear was placed.","Clue hint: Think about manual strangulation bruises.","Search for: heavy fingertip bruises and thumb marks around the vocal cords."],"clues":["Manual strangulation bruises","Item: Manual strangulation bruises","Clue Word: Manual strangulation bruises"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '012b30d1-27fa-59ce-9578-bc7fe647165d',
  'story_101',
  'ev_4',
  4,
  '11:45 AM',
  'Apprentice Clara inspects the mainspring of the clock.',
  'Apprentice Clara inspects the mainspring of the clock.',
  'The mainspring is completely intact and securely latched in its steel arbor.',
  'Intact mainspring',
  'Undamaged Clock Spring',
  '["Shattered steel","Snapped coil","Loose gear"]'::jsonb,
  'Intact mainspring',
  '["intact mainspring","intact spring","mainspring","undamaged spring","clock spring"]'::jsonb,
  'Proof that no spring explosion ever occurred in the workshop.',
  'ev_5',
  false,
  '{"descriptions":["Apprentice Clara inspects the mainspring of the clock.","At 11:45 AM: Apprentice Clara inspects the mainspring of the clock.","Notice this clue: Apprentice Clara inspects the mainspring of the clock."],"hints":["Proof that no spring explosion ever occurred in the workshop.","Clue hint: Think about intact mainspring.","Search for: the mainspring is completely intact and securely latched in its steel arbor."],"clues":["Intact mainspring","Item: Intact mainspring","Clue Word: Intact mainspring"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '509dda92-db78-53af-baa7-852a72b790a8',
  'story_101',
  'ev_5',
  5,
  '12:00 PM',
  'Vance inspects Gregory’s bandaged right thumb.',
  'Vance inspects Gregory’s bandaged right thumb.',
  'A deep cut matching the sharp tooth spacing of the 12-tooth gear.',
  'Matching gear cut on thumb',
  'Gear Tooth Thumb Injury',
  '["Knife cut","Paper cut","Burn blister"]'::jsonb,
  'Matching gear cut on thumb',
  '["matching gear cut on thumb","thumb cut","gear cut","thumb injury","matching cut"]'::jsonb,
  'Physical injury on Gregory caused when forcing the jagged gear into Tobias’s throat.',
  'ev_6',
  true,
  '{"descriptions":["Vance inspects Gregory’s bandaged right thumb.","At 12:00 PM: Vance inspects Gregory’s bandaged right thumb.","Notice this clue: Vance inspects Gregory’s bandaged right thumb."],"hints":["Physical injury on Gregory caused when forcing the jagged gear into Tobias’s throat.","Clue hint: Think about matching gear cut on thumb.","Search for: a deep cut matching the sharp tooth spacing of the 12-tooth gear."],"clues":["Matching gear cut on thumb","Item: Matching gear cut on thumb","Clue Word: Matching gear cut on thumb"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b22faac7-3170-52d8-8e1e-b7ae0ac9c26c',
  'story_101',
  'ev_6',
  6,
  '12:15 PM',
  'Police search Gregory’s apartment coat closet.',
  'Police search Gregory’s apartment coat closet.',
  'The stolen will leaving the shop to the apprentice, with burned edges.',
  'Stolen charred will',
  'Recovered Stolen Will',
  '["Bank book","Deed","Cash envelope"]'::jsonb,
  'Stolen charred will',
  '["stolen charred will","stolen will","charred will","will","recovered will"]'::jsonb,
  'The original inheritance document found hidden in Gregory’s closet.',
  'ev_7',
  false,
  '{"descriptions":["Police search Gregory’s apartment coat closet.","At 12:15 PM: Police search Gregory’s apartment coat closet.","Notice this clue: Police search Gregory’s apartment coat closet."],"hints":["The original inheritance document found hidden in Gregory’s closet.","Clue hint: Think about stolen charred will.","Search for: the stolen will leaving the shop to the apprentice, with burned edges."],"clues":["Stolen charred will","Item: Stolen charred will","Clue Word: Stolen charred will"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '036580e5-6400-5649-a0be-da9d8e5a1286',
  'story_101',
  'ev_7',
  7,
  '12:30 PM',
  'Clara twists the brass bob of the grandfather clock pendulum.',
  'Clara twists the brass bob of the grandfather clock pendulum.',
  'A duplicate original will sealed inside the hollow pendulum bob.',
  'Pendulum bob duplicate will',
  'Pendulum Will Duplicate',
  '["Lead weights","Mercury vial","Spare gears"]'::jsonb,
  'Pendulum bob duplicate will',
  '["pendulum bob duplicate will","duplicate will","pendulum will","bob will","pendulum duplicate"]'::jsonb,
  'Tobias’s backup will proving his intention to give the workshop to Clara.',
  'ev_8',
  false,
  '{"descriptions":["Clara twists the brass bob of the grandfather clock pendulum.","At 12:30 PM: Clara twists the brass bob of the grandfather clock pendulum.","Notice this clue: Clara twists the brass bob of the grandfather clock pendulum."],"hints":["Tobias’s backup will proving his intention to give the workshop to Clara.","Clue hint: Think about pendulum bob duplicate will.","Search for: a duplicate original will sealed inside the hollow pendulum bob."],"clues":["Pendulum bob duplicate will","Item: Pendulum bob duplicate will","Clue Word: Pendulum bob duplicate will"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fce98b9f-cc17-5663-b28b-f8ae44123c78',
  'story_101',
  'ev_8',
  8,
  '12:45 PM',
  'Inspector Vance arrests Gregory for first-degree murder.',
  'Inspector Vance arrests Gregory for first-degree murder.',
  'Gregory’s confession admitting he panicked when Tobias refused to sign over the shop.',
  'Gregory Vance confession',
  'Signed Murder Deposition',
  '["Denial","Insanity claim","Silence"]'::jsonb,
  'Gregory Vance confession',
  '["gregory vance confession","confession","gregory confession","signed deposition","admission"]'::jsonb,
  'Full confession of the robbery and staged industrial accident.',
  NULL,
  true,
  '{"descriptions":["Inspector Vance arrests Gregory for first-degree murder.","At 12:45 PM: Inspector Vance arrests Gregory for first-degree murder.","Notice this clue: Inspector Vance arrests Gregory for first-degree murder."],"hints":["Full confession of the robbery and staged industrial accident.","Clue hint: Think about gregory vance confession.","Search for: gregory’s confession admitting he panicked when tobias refused to sign over the shop."],"clues":["Gregory Vance confession","Item: Gregory Vance confession","Clue Word: Gregory Vance confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_102 — THE LOCKED FAMILY CRYPT
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_102',
  'The Locked Family Crypt',
  'Dark Mystery',
  'The fog-covered cemetery grounds of Ravenwood Abbey, crumbling stone mausoleums, iron gates, and weeping willow trees',
  'The massive bronze deadbolt of the Ravenwood family crypt was found completely unbolted from the inside, with the family patriarch’s coffin opened and empty.',
  '[{"name":"Julian Ravenwood","role":"Prodigal Disinherited Son","alibi":"Claims he was mourning at the village tavern all night","avatar":"⚰️"},{"name":"Father Michael","role":"Abbey Priest & Groundskeeper","alibi":"In the monastery chapel leading midnight prayers","avatar":"✝️"},{"name":"Victoria Ravenwood","role":"Elder Daughter & Heiress","alibi":"At the family manor across the hill","avatar":"🧕"},{"name":"Inspector Thomas Vance","role":"Metropolitan Detective","alibi":"Called to the cemetery at dawn by Father Michael","avatar":"🕵️"}]'::jsonb,
  'Julian Ravenwood faked his own whereabouts and hid inside a hollow stone altar inside the family crypt during his father’s burial service. Once the heavy iron doors were locked for the night, Julian opened his father’s sarcophagus, took the diamond burial shroud and jewels, unbolted the door from the inside, and slipped into the night.',
  'Grave Robber & Disgraced Son Julian Ravenwood',
  'Julian wanted to steal the family diamond burial shroud to pay off syndicate debts.',
  '[{"time":"Yesterday - 04:00 PM","event":"Lord Arthur’s coffin is placed in the stone crypt; Julian hides in the hollow altar."},{"time":"Yesterday - 05:00 PM","event":"Father Michael locks the massive bronze crypt door from the outside."},{"time":"Yesterday - 11:30 PM","event":"Julian emerges from the altar, pries open the sarcophagus, and takes the diamond shroud."},{"time":"Yesterday - 11:45 PM","event":"Julian pulls the interior escape lever, unbolts the door, and walks out."},{"time":"Today - 06:00 AM","event":"Father Michael discovers the unbolted crypt door swinging open."}]'::jsonb,
  '[{"id":"ev_1","title":"Crypt Interior Latch","detail":"The massive bronze deadbolt shown to have been retracted using the interior release lever."},{"id":"ev_2","title":"Monogram Lighter","detail":"Sterling silver lighter dropped inside the opened sarcophagus bearing Julian’s initials."},{"id":"ev_3","title":"Concealed Altar Space","detail":"Cavity inside the crypt altar containing a blanket and flask where Julian hid."},{"id":"ev_4","title":"Recovered Diamond Shroud","detail":"The diamond-woven funeral shroud found in Julian’s luggage at the coaching inn."}]'::jsonb,
  '[{"order":1,"title":"Unbolted interior deadbolt","text":"Proves the crypt was opened from the inside, not broken into from outside."},{"order":2,"title":"Open stone sarcophagus","text":"Shows targeted plundering of the patriarch’s burial wealth."},{"order":3,"title":"Havana cigar ash","text":"Physical proof a living, smoking human was inside the crypt during the night."},{"order":4,"title":"Engraved silver lighter","text":"Irrefutable personal property tying Julian Ravenwood directly to the open grave."},{"order":5,"title":"Hollow altar hideout","text":"Explains how the thief entered the crypt before the priest locked the doors."},{"order":6,"title":"Diamond burial shroud","text":"Smoking gun recovery of the stolen funeral heirloom."}]'::jsonb,
  'Old cemetery vampire folklore: Local villagers spread vampire rumors, distracting police from theft.; Scratches on the exterior gate: Made by stray dogs trying to dig under the cemetery fence.',
  'Claim the deceased patriarch became a vampire and pushed open his own tomb from within.',
  'NORMAL',
  'Did the dead patriarch rise from his grave, or did someone hide inside the tomb to escape with a buried fortune?',
  '[{"character":"Julian Ravenwood","secret":"A diamond-encrusted silk burial shroud hidden inside his leather travel valise."},{"character":"Father Michael","secret":"He noticed the hollow altar was missing its stone locking pin yesterday."},{"character":"Victoria Ravenwood","secret":"She suspected Julian was in town specifically to raid the burial vault."},{"character":"Inspector Thomas Vance","secret":"He tracked Julian’s travel from Paris to the village yesterday."}]'::jsonb,
  '[{"lead":"Old cemetery vampire folklore","explanation":"Local villagers spread vampire rumors, distracting police from theft."},{"lead":"Scratches on the exterior gate","explanation":"Made by stray dogs trying to dig under the cemetery fence."}]'::jsonb,
  '{"wrongTheories":["The dead patriarch reanimated as an unholy creature and broke out of his own tomb.","A band of grave robbers dug a secret underground tunnel into the vault."],"correctTheory":"Julian Ravenwood hid inside the crypt altar during the funeral, stole the diamond shroud, and unbolted the door from within."}'::jsonb,
  'Julian Ravenwood hid inside the altar before the crypt was locked, robbed his father’s diamond shroud, and unbolted the door from inside.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Julian was imprisoned for grave robbery and grand theft, and the diamond shroud was restored to the family vault."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Julian escaped to Paris on the morning coach, fencing the diamonds while rumors of vampires terrified the town."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The church sealed the crypt in holy water and stone, leaving Julian rich and the truth forgotten."}]'::jsonb,
  '{"intros":["The massive bronze deadbolt of the Ravenwood family crypt was found completely unbolted from the inside, with the family patriarch’s coffin opened and empty.","Case file story_102: The massive bronze deadbolt of the Ravenwood family crypt was found completely unbolted from the inside, with the family patriarch’s coffin opened and empty. Look closely at every clue.","Trouble begins in The fog-covered cemetery grounds of Ravenwood Abbey, crumbling stone mausoleums, iron gates, and weeping willow trees. The massive bronze deadbolt of the Ravenwood family crypt was found completely unbolted from the inside, with the family patriarch’s coffin opened and empty.","The mystery starts now. The massive bronze deadbolt of the Ravenwood family crypt was found completely unbolted from the inside, with the family patriarch’s coffin opened and empty. Can you solve it?"],"reveals":["Julian Ravenwood hid inside the altar before the crypt was locked, robbed his father’s diamond shroud, and unbolted the door from inside.","The mystery is unraveled! Julian Ravenwood hid inside the altar before the crypt was locked, robbed his father’s diamond shroud, and unbolted the door from inside.","At last, the truth comes out: Julian Ravenwood hid inside the altar before the crypt was locked, robbed his father’s diamond shroud, and unbolted the door from inside.","Case resolved! Here is what happened: Julian Ravenwood hid inside the altar before the crypt was locked, robbed his father’s diamond shroud, and unbolted the door from inside."],"hints":["Pay attention to where Grave Robber & Disgraced Son Julian Ravenwood was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_102';
DELETE FROM public.case_events WHERE case_id = 'story_102';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7c09dea2-0301-5181-9374-61ba292394d0',
  'story_102',
  'Julian Ravenwood',
  'Prodigal Disinherited Son',
  'Disheveled elegance, black mourning wool coat, mud on his dress boots, nervous hands',
  'My father was an unholy man. The whispers said he would walk the earth again!',
  'A diamond-encrusted silk burial shroud hidden inside his leather travel valise.',
  'Claims he was mourning at the village tavern all night',
  'Youngest son of the late Lord Arthur Ravenwood',
  'The tomb bronze door has an emergency escape lever on the interior stone lintel.',
  'Did not know he dropped his custom silver monogram cigar lighter inside the sarcophagus.',
  '⚰️',
  '["My father was an unholy man. The whispers said he would walk the earth again!","\"My father was an unholy man. The whispers said he would walk the earth again!\"","Listen to me: My father was an unholy man. The whispers said he would walk the earth again!","I tell you the truth: My father was an unholy man. The whispers said he would walk the earth again!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '468fdf62-5848-5d9e-a3ea-954a161397de',
  'story_102',
  'Father Michael',
  'Abbey Priest & Groundskeeper',
  'Pious, trembling hands holding iron keys, smelling of incense and damp soil',
  'I turned the master key myself at sundown. No one entered through these doors all night.',
  'He noticed the hollow altar was missing its stone locking pin yesterday.',
  'In the monastery chapel leading midnight prayers',
  'Caretaker of the Ravenwood cemetery',
  'The deadbolt can only be moved from the inside by pulling the iron chain.',
  'Did not notice Julian slipping into the crypt behind the floral tributes.',
  '✝️',
  '["I turned the master key myself at sundown. No one entered through these doors all night.","\"I turned the master key myself at sundown. No one entered through these doors all night.\"","Listen to me: I turned the master key myself at sundown. No one entered through these doors all night.","I tell you the truth: I turned the master key myself at sundown. No one entered through these doors all night."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'acd8d296-5e57-55a4-b656-30998737aa6a',
  'story_102',
  'Victoria Ravenwood',
  'Elder Daughter & Heiress',
  'Stern, aristocratic poise, wearing black veil, furious over the desecration',
  'My father’s burial shroud was woven with five thousand Russian diamonds. This is theft, not resurrection!',
  'She suspected Julian was in town specifically to raid the burial vault.',
  'At the family manor across the hill',
  'Eldest daughter and executor of the estate',
  'Julian had owed two million francs to Parisian loan sharks.',
  'Did not know how Julian bypassed the exterior cemetery gates.',
  '🧕',
  '["My father’s burial shroud was woven with five thousand Russian diamonds. This is theft, not resurrection!","\"My father’s burial shroud was woven with five thousand Russian diamonds. This is theft, not resurrection!\"","Listen to me: My father’s burial shroud was woven with five thousand Russian diamonds. This is theft, not resurrection!","I tell you the truth: My father’s burial shroud was woven with five thousand Russian diamonds. This is theft, not resurrection!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f6e0d8ef-315b-5983-a96a-36056da52d47',
  'story_102',
  'Inspector Thomas Vance',
  'Metropolitan Detective',
  'Pragmatic, sharp trench coat, carrying forensic lantern and footprint plaster',
  'Vampires don’t leave fresh Havana cigar ash and Paris shoe tracks in the moss.',
  'He tracked Julian’s travel from Paris to the village yesterday.',
  'Called to the cemetery at dawn by Father Michael',
  'Investigating the grave desecration and jewel theft',
  'The exterior lock showed zero scratch marks from lockpicks.',
  'Did not know where Julian was keeping his escape carriage.',
  '🕵️',
  '["Vampires don’t leave fresh Havana cigar ash and Paris shoe tracks in the moss.","\"Vampires don’t leave fresh Havana cigar ash and Paris shoe tracks in the moss.\"","Listen to me: Vampires don’t leave fresh Havana cigar ash and Paris shoe tracks in the moss.","I tell you the truth: Vampires don’t leave fresh Havana cigar ash and Paris shoe tracks in the moss."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2ffd06f4-fe31-5b0f-8ff2-61cdc2839777',
  'story_102',
  'ev_1',
  1,
  'Today - 06:00 AM',
  'Father Michael finds the heavy crypt door open.',
  'Father Michael finds the heavy crypt door open.',
  'A massive bronze deadbolt retracted from the interior release chain.',
  'Unbolted interior deadbolt',
  'Crypt Interior Latch',
  '["Broken lock","Melted hinges","Blown door"]'::jsonb,
  'Unbolted interior deadbolt',
  '["unbolted interior deadbolt","unbolted deadbolt","interior deadbolt","deadbolt","interior latch"]'::jsonb,
  'The heavy bolt mechanism operated from inside the sealed tomb.',
  'ev_2',
  true,
  '{"descriptions":["Father Michael finds the heavy crypt door open.","At Today - 06:00 AM: Father Michael finds the heavy crypt door open.","Notice this clue: Father Michael finds the heavy crypt door open."],"hints":["The heavy bolt mechanism operated from inside the sealed tomb.","Clue hint: Think about unbolted interior deadbolt.","Search for: a massive bronze deadbolt retracted from the interior release chain."],"clues":["Unbolted interior deadbolt","Item: Unbolted interior deadbolt","Clue Word: Unbolted interior deadbolt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c16866e7-903e-5334-98dc-9889d71b41c4',
  'story_102',
  'ev_2',
  2,
  'Today - 06:30 AM',
  'Inspector Vance inspects the open stone sarcophagus.',
  'Inspector Vance inspects the open stone sarcophagus.',
  'A heavy stone coffin lid shoved aside and the empty resting slab.',
  'Open stone sarcophagus',
  'Pried Sarcophagus Lid',
  '["Broken glass","Shattered marble","Intact coffin"]'::jsonb,
  'Open stone sarcophagus',
  '["open stone sarcophagus","open sarcophagus","sarcophagus","coffin","pried lid"]'::jsonb,
  'The stone burial box opened and stripped of its funeral contents.',
  'ev_3',
  false,
  '{"descriptions":["Inspector Vance inspects the open stone sarcophagus.","At Today - 06:30 AM: Inspector Vance inspects the open stone sarcophagus.","Notice this clue: Inspector Vance inspects the open stone sarcophagus."],"hints":["The stone burial box opened and stripped of its funeral contents.","Clue hint: Think about open stone sarcophagus.","Search for: a heavy stone coffin lid shoved aside and the empty resting slab."],"clues":["Open stone sarcophagus","Item: Open stone sarcophagus","Clue Word: Open stone sarcophagus"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f66552a4-5fe4-56a4-b7d6-338f65d2cc5d',
  'story_102',
  'ev_3',
  3,
  'Today - 06:45 AM',
  'Vance finds dropped Havana cigar ash beside the coffin.',
  'Vance finds dropped Havana cigar ash beside the coffin.',
  'Fresh gray cigar ash and a spent matchstick on the tomb flagstones.',
  'Havana cigar ash',
  'Tomb Tobacco Ash',
  '["Incense dust","Candle wax","Spider web"]'::jsonb,
  'Havana cigar ash',
  '["havana cigar ash","cigar ash","havana ash","ash","tobacco ash"]'::jsonb,
  'Fresh tobacco remnants dropped on the tomb floor last night.',
  'ev_4',
  false,
  '{"descriptions":["Vance finds dropped Havana cigar ash beside the coffin.","At Today - 06:45 AM: Vance finds dropped Havana cigar ash beside the coffin.","Notice this clue: Vance finds dropped Havana cigar ash beside the coffin."],"hints":["Fresh tobacco remnants dropped on the tomb floor last night.","Clue hint: Think about havana cigar ash.","Search for: fresh gray cigar ash and a spent matchstick on the tomb flagstones."],"clues":["Havana cigar ash","Item: Havana cigar ash","Clue Word: Havana cigar ash"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0c8357af-8ab2-5c9d-a6d0-3f4dcde29a27',
  'story_102',
  'ev_4',
  4,
  'Today - 07:00 AM',
  'Vance shines his lantern into the bottom of the sarcophagus.',
  'Vance shines his lantern into the bottom of the sarcophagus.',
  'A sterling silver cigar lighter engraved with Julian’s initials "J.R.".',
  'Engraved silver lighter',
  'Monogram Lighter',
  '["Rosary","Ring","Pocket knife"]'::jsonb,
  'Engraved silver lighter',
  '["engraved silver lighter","silver lighter","cigar lighter","lighter","monogram lighter"]'::jsonb,
  'Luxury lighter dropped inside the open grave by the thief.',
  'ev_5',
  false,
  '{"descriptions":["Vance shines his lantern into the bottom of the sarcophagus.","At Today - 07:00 AM: Vance shines his lantern into the bottom of the sarcophagus.","Notice this clue: Vance shines his lantern into the bottom of the sarcophagus."],"hints":["Luxury lighter dropped inside the open grave by the thief.","Clue hint: Think about engraved silver lighter.","Search for: a sterling silver cigar lighter engraved with julian’s initials \"j.r.\"."],"clues":["Engraved silver lighter","Item: Engraved silver lighter","Clue Word: Engraved silver lighter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4a2b638f-cc65-569b-b188-c25fef4a3203',
  'story_102',
  'ev_5',
  5,
  'Today - 07:20 AM',
  'Father Michael inspects the stone prayer altar in the crypt corner.',
  'Father Michael inspects the stone prayer altar in the crypt corner.',
  'A hollow interior cavity inside the altar with a wool blanket and water flask.',
  'Hollow altar hideout',
  'Concealed Altar Space',
  '["Secret tunnel","Coal chute","Drain pipe"]'::jsonb,
  'Hollow altar hideout',
  '["hollow altar hideout","hollow altar","altar hideout","altar cavity","altar space"]'::jsonb,
  'Hiding spot inside the stone furniture where Julian waited until dark.',
  'ev_6',
  true,
  '{"descriptions":["Father Michael inspects the stone prayer altar in the crypt corner.","At Today - 07:20 AM: Father Michael inspects the stone prayer altar in the crypt corner.","Notice this clue: Father Michael inspects the stone prayer altar in the crypt corner."],"hints":["Hiding spot inside the stone furniture where Julian waited until dark.","Clue hint: Think about hollow altar hideout.","Search for: a hollow interior cavity inside the altar with a wool blanket and water flask."],"clues":["Hollow altar hideout","Item: Hollow altar hideout","Clue Word: Hollow altar hideout"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd9b13438-8f63-5d05-95a4-e09f44a939a5',
  'story_102',
  'ev_6',
  6,
  'Today - 07:45 AM',
  'Vance tracks footprints leading through the cemetery dew.',
  'Vance tracks footprints leading through the cemetery dew.',
  'Muddy Parisian designer shoe prints leading from the crypt to the carriage road.',
  'Parisian shoe prints',
  'Muddy Boot Impressions',
  '["Bare feet","Work boot prints","Hoof marks"]'::jsonb,
  'Parisian shoe prints',
  '["parisian shoe prints","shoe prints","parisian prints","boot impressions","footprints"]'::jsonb,
  'Expensive foreign footwear impressions leading out of the cemetery.',
  'ev_7',
  false,
  '{"descriptions":["Vance tracks footprints leading through the cemetery dew.","At Today - 07:45 AM: Vance tracks footprints leading through the cemetery dew.","Notice this clue: Vance tracks footprints leading through the cemetery dew."],"hints":["Expensive foreign footwear impressions leading out of the cemetery.","Clue hint: Think about parisian shoe prints.","Search for: muddy parisian designer shoe prints leading from the crypt to the carriage road."],"clues":["Parisian shoe prints","Item: Parisian shoe prints","Clue Word: Parisian shoe prints"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ad095bb2-8547-5f3e-8e39-01b24e5583ad',
  'story_102',
  'ev_7',
  7,
  'Today - 08:30 AM',
  'Police intercept Julian Ravenwood at the local coaching inn.',
  'Police intercept Julian Ravenwood at the local coaching inn.',
  'Julian’s leather valise stuffed with the diamond-encrusted silk burial shroud.',
  'Diamond burial shroud',
  'Recovered Diamond Shroud',
  '["Cash rolls","Gold bars","Silver chalice"]'::jsonb,
  'Diamond burial shroud',
  '["diamond burial shroud","burial shroud","diamond shroud","shroud","recovered shroud"]'::jsonb,
  'The priceless funeral cloth woven with five thousand diamonds.',
  'ev_8',
  false,
  '{"descriptions":["Police intercept Julian Ravenwood at the local coaching inn.","At Today - 08:30 AM: Police intercept Julian Ravenwood at the local coaching inn.","Notice this clue: Police intercept Julian Ravenwood at the local coaching inn."],"hints":["The priceless funeral cloth woven with five thousand diamonds.","Clue hint: Think about diamond burial shroud.","Search for: julian’s leather valise stuffed with the diamond-encrusted silk burial shroud."],"clues":["Diamond burial shroud","Item: Diamond burial shroud","Clue Word: Diamond burial shroud"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '884810f8-61c6-51fe-b726-ad976e390efd',
  'story_102',
  'ev_8',
  8,
  'Today - 09:00 AM',
  'Julian is brought to the precinct and breaks into tears.',
  'Julian is brought to the precinct and breaks into tears.',
  'Julian’s full confession of the staged resurrection and grave theft.',
  'Julian’s confession',
  'Signed Theft Confession',
  '["Denial","Vampire claim","Silence"]'::jsonb,
  'Julian’s confession',
  '["julian’s confession","confession","julian confession","theft confession","admission"]'::jsonb,
  'Admission that he locked himself inside to rob his father’s tomb.',
  NULL,
  true,
  '{"descriptions":["Julian is brought to the precinct and breaks into tears.","At Today - 09:00 AM: Julian is brought to the precinct and breaks into tears.","Notice this clue: Julian is brought to the precinct and breaks into tears."],"hints":["Admission that he locked himself inside to rob his father’s tomb.","Clue hint: Think about julian’s confession.","Search for: julian’s full confession of the staged resurrection and grave theft."],"clues":["Julian’s confession","Item: Julian’s confession","Clue Word: Julian’s confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_103 — THE BLOOD OATH OF THE SECRET SOCIETY
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_103',
  'The Blood Oath of the Secret Society',
  'Dark Mystery',
  'The subterranean stone catacombs of the Owl & Key Society, black candles, marble altar, ceremonial robes, and iron chains',
  'During a midnight initiation ceremony in the subterranean temple, the Grand Master was found stabbed to death on the marble altar with an antique ceremonial dagger, while all twelve robed members swore they never left their chanting circles.',
  '[{"name":"Nicholas Vance","role":"New Society Initiate","alibi":"Chanting in circle seven at the back of the chamber","avatar":"🦉"},{"name":"Grand Master Julian Thorne (Deceased)","role":"Secret Society Leader","alibi":"Murdered on the altar during the blackout chant","avatar":"👑"},{"name":"High Chancellor Ray Kelly","role":"Master of Ceremonies","alibi":"Standing at the podium striking the bell","avatar":"🔔"},{"name":"Inspector Charles Cross","role":"Special Inquiries Detective","alibi":"Breached the catacombs with police backup after the alarm","avatar":"🔍"}]'::jsonb,
  'The Owl & Key initiation requires a two-minute ceremonial blackout while members chant in assigned chalk circles. Initiate Nicholas Vance had laid down a path of invisible glowing phosphor thread earlier. In total darkness, Nicholas followed the glowing path to the altar, stabbed the Grand Master, returned to his circle, and re-joined the chant.',
  'Initiate Nicholas Vance',
  'Nicholas discovered the Grand Master had murdered his father fifteen years ago to take over the secret society.',
  '[{"time":"11:30 PM","event":"Nicholas lays down an invisible phosphor navigation thread from circle seven to the altar."},{"time":"11:55 PM","event":"The twelve members step into their assigned chalk circles and pull their hoods."},{"time":"12:00 AM","event":"Torches are extinguished; the two-minute blackout ritual chant begins."},{"time":"12:01 AM","event":"Nicholas follows the thread in darkness, stabs Thorne on the altar, and returns to his circle."},{"time":"12:02 AM","event":"Torches are relit; the Chancellor finds Thorne dead and sounds the gong."}]'::jsonb,
  '[{"id":"ev_1","title":"Altar Stiletto Weapon","detail":"Silver ritual dagger with Grand Master Thorne’s blood recovered from the altar."},{"id":"ev_2","title":"Phosphorescent Guide Line","detail":"UV-reactive glowing string leading from circle seven to the altar through the dark."},{"id":"ev_3","title":"Night-Vision Monocular","detail":"Infrared optic device found hidden in Nicholas Vance’s ceremonial skull sash."},{"id":"ev_4","title":"Thorne’s Written Confession","detail":"Parchment found on the victim proving Thorne poisoned Nicholas’s father in 2009."}]'::jsonb,
  '[{"order":1,"title":"Silver ritual dagger","text":"The ceremonial murder weapon used to strike during the blackout."},{"order":2,"title":"Glowing phosphor thread","text":"Reveals how the killer walked in pitch darkness without stumbling."},{"order":3,"title":"Anchor pin in circle seven","text":"Directly ties the navigation thread to Nicholas Vance’s assigned spot."},{"order":4,"title":"Blood spatter on robe cuffs","text":"Physical forensic proof connecting Nicholas to the stabbing."},{"order":5,"title":"Infrared monocular","text":"The technological tool used to track the glowing path."},{"order":6,"title":"Historical murder memo","text":"The deeply personal revenge motive behind the execution."}]'::jsonb,
  'Chancellor’s financial dispute with Thorne: Kelly was arguing over funds, but never left the bell podium.; Occult demon chanting script: The chant was theatrical mumbo-jumbo with zero supernatural power.',
  'Claim a vengeful catacomb demon answered the blood oath chant.',
  'NORMAL',
  'Which member broke the sacred circle in the pitch darkness to murder the Grand Master?',
  '[{"character":"Nicholas Vance","secret":"An infrared night-vision optic monocular hidden inside his ceremonial skull sash."},{"character":"Grand Master Julian Thorne (Deceased)","secret":"A confession document admitting he assassinated founder Marcus Vance."},{"character":"High Chancellor Ray Kelly","secret":"He suspected Thorne was embezzling the brotherhood’s offshore treasury."},{"character":"Inspector Charles Cross","secret":"He had tried to infiltrate the society for three years to investigate financial fraud."}]'::jsonb,
  '[{"lead":"Chancellor’s financial dispute with Thorne","explanation":"Kelly was arguing over funds, but never left the bell podium."},{"lead":"Occult demon chanting script","explanation":"The chant was theatrical mumbo-jumbo with zero supernatural power."}]'::jsonb,
  '{"wrongTheories":["The Grand Master committed ceremonial suicide in front of the altar.","A shadowy demon answered the ritual blood oath and ended the leader’s life."],"correctTheory":"Nicholas Vance used an invisible glowing phosphor thread and night-vision optics to navigate the blackout and kill Thorne to avenge his father."}'::jsonb,
  'Nicholas Vance navigated the dark using a glowing phosphor thread and stabbed the Grand Master to avenge his father’s murder.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Nicholas was sentenced for murder, the truth about his father’s death was acknowledged, and the society was outlawed."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The killing was declared an act of dark magic, and Nicholas took the throne as the new Grand Master."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The cult members swore a vow of silence, leaving the murder an eternal unsolved mystery of the catacombs."}]'::jsonb,
  '{"intros":["During a midnight initiation ceremony in the subterranean temple, the Grand Master was found stabbed to death on the marble altar with an antique ceremonial dagger, while all twelve robed members swore they never left their chanting circles.","Case file story_103: During a midnight initiation ceremony in the subterranean temple, the Grand Master was found stabbed to death on the marble altar with an antique ceremonial dagger, while all twelve robed members swore they never left their chanting circles. Look closely at every clue.","Trouble begins in The subterranean stone catacombs of the Owl & Key Society, black candles, marble altar, ceremonial robes, and iron chains. During a midnight initiation ceremony in the subterranean temple, the Grand Master was found stabbed to death on the marble altar with an antique ceremonial dagger, while all twelve robed members swore they never left their chanting circles.","The mystery starts now. During a midnight initiation ceremony in the subterranean temple, the Grand Master was found stabbed to death on the marble altar with an antique ceremonial dagger, while all twelve robed members swore they never left their chanting circles. Can you solve it?"],"reveals":["Nicholas Vance navigated the dark using a glowing phosphor thread and stabbed the Grand Master to avenge his father’s murder.","The mystery is unraveled! Nicholas Vance navigated the dark using a glowing phosphor thread and stabbed the Grand Master to avenge his father’s murder.","At last, the truth comes out: Nicholas Vance navigated the dark using a glowing phosphor thread and stabbed the Grand Master to avenge his father’s murder.","Case resolved! Here is what happened: Nicholas Vance navigated the dark using a glowing phosphor thread and stabbed the Grand Master to avenge his father’s murder."],"hints":["Pay attention to where Initiate Nicholas Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_103';
DELETE FROM public.case_events WHERE case_id = 'story_103';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9d5ae1c7-7d71-5282-a1c0-e0b69da2ce10',
  'story_103',
  'Nicholas Vance',
  'New Society Initiate',
  'Quiet, intense, wearing plain black velvet robe, polished silver owl ring',
  'We were forbidden to step out of our chalk circles in the dark on pain of death. I never moved an inch!',
  'An infrared night-vision optic monocular hidden inside his ceremonial skull sash.',
  'Chanting in circle seven at the back of the chamber',
  'Son of the murdered founder Marcus Vance',
  'The ceremonial lights go out for precisely one hundred and twenty seconds.',
  'Did not know the Grand Master’s blood spattered onto the hem of his velvet robe.',
  '🦉',
  '["We were forbidden to step out of our chalk circles in the dark on pain of death. I never moved an inch!","\"We were forbidden to step out of our chalk circles in the dark on pain of death. I never moved an inch!\"","Listen to me: We were forbidden to step out of our chalk circles in the dark on pain of death. I never moved an inch!","I tell you the truth: We were forbidden to step out of our chalk circles in the dark on pain of death. I never moved an inch!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5006785a-66cc-5419-a8f4-3dfaa4dc0444',
  'story_103',
  'Grand Master Julian Thorne (Deceased)',
  'Secret Society Leader',
  'Ruthless patrician, gold-embroidered cowl, dead across the marble altar',
  'Deceased victim; grasped a silver coin stamped with an owl and key in his hand.',
  'A confession document admitting he assassinated founder Marcus Vance.',
  'Murdered on the altar during the blackout chant',
  'Supreme ruler of the Owl & Key brotherhood',
  'Nicholas was Marcus’s son, but believed Nicholas was completely ignorant.',
  'Did not expect Nicholas to weaponize the darkness of the ritual.',
  '👑',
  '["Deceased victim; grasped a silver coin stamped with an owl and key in his hand.","\"Deceased victim; grasped a silver coin stamped with an owl and key in his hand.\"","Listen to me: Deceased victim; grasped a silver coin stamped with an owl and key in his hand.","I tell you the truth: Deceased victim; grasped a silver coin stamped with an owl and key in his hand."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0bd3b729-bd5a-51a1-8971-0dc49198f540',
  'story_103',
  'High Chancellor Ray Kelly',
  'Master of Ceremonies',
  'Old aristocrat, trembling silver beard, holding ceremonial bronze bell',
  'When the blackout ended and I struck the bronze bell, the Grand Master was dead in a pool of blood!',
  'He suspected Thorne was embezzling the brotherhood’s offshore treasury.',
  'Standing at the podium striking the bell',
  'Second-in-command of the society',
  'The dagger on the altar was an antique silver stiletto from 1750.',
  'Did not see Nicholas moving along the phosphor thread.',
  '🔔',
  '["When the blackout ended and I struck the bronze bell, the Grand Master was dead in a pool of blood!","\"When the blackout ended and I struck the bronze bell, the Grand Master was dead in a pool of blood!\"","Listen to me: When the blackout ended and I struck the bronze bell, the Grand Master was dead in a pool of blood!","I tell you the truth: When the blackout ended and I struck the bronze bell, the Grand Master was dead in a pool of blood!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e86be7a6-14c2-5aca-88bb-d1518ef546aa',
  'story_103',
  'Inspector Charles Cross',
  'Special Inquiries Detective',
  'Unimpressed by occult theater, trench coat, holding ultraviolet torch',
  'Secret brotherhoods can dress in velvet all they want, but blood and phosphor obey forensic science.',
  'He had tried to infiltrate the society for three years to investigate financial fraud.',
  'Breached the catacombs with police backup after the alarm',
  'Investigating officer on the murder scene',
  'The chalk circles were unbroken except for faint scuffs along path seven.',
  'Did not know the exact motive until reading the parchment in Thorne’s robe.',
  '🔍',
  '["Secret brotherhoods can dress in velvet all they want, but blood and phosphor obey forensic science.","\"Secret brotherhoods can dress in velvet all they want, but blood and phosphor obey forensic science.\"","Listen to me: Secret brotherhoods can dress in velvet all they want, but blood and phosphor obey forensic science.","I tell you the truth: Secret brotherhoods can dress in velvet all they want, but blood and phosphor obey forensic science."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '733502e1-a5f4-59f8-985e-d69f218f2989',
  'story_103',
  'ev_1',
  1,
  '12:02 AM',
  'Torches ignite, revealing the Grand Master dead on the marble.',
  'Torches ignite, revealing the Grand Master dead on the marble.',
  'Grand Master Thorne stabbed through the heart with the silver ritual dagger.',
  'Silver ritual dagger',
  'Altar Stiletto Weapon',
  '["Poison chalice","Strangulation cord","Sword"]'::jsonb,
  'Silver ritual dagger',
  '["silver ritual dagger","ritual dagger","silver dagger","dagger","stiletto"]'::jsonb,
  'Antique silver blade taken from the ceremonial altar stand.',
  'ev_2',
  true,
  '{"descriptions":["Torches ignite, revealing the Grand Master dead on the marble.","At 12:02 AM: Torches ignite, revealing the Grand Master dead on the marble.","Notice this clue: Torches ignite, revealing the Grand Master dead on the marble."],"hints":["Antique silver blade taken from the ceremonial altar stand.","Clue hint: Think about silver ritual dagger.","Search for: grand master thorne stabbed through the heart with the silver ritual dagger."],"clues":["Silver ritual dagger","Item: Silver ritual dagger","Clue Word: Silver ritual dagger"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd91c6f33-6321-5039-858f-10b0eb095cca',
  'story_103',
  'ev_2',
  2,
  '12:15 AM',
  'Inspector Cross shines an ultraviolet blacklight across the stone floor.',
  'Inspector Cross shines an ultraviolet blacklight across the stone floor.',
  'A glowing line of green phosphorescent thread running from circle 7 directly to the altar.',
  'Glowing phosphor thread',
  'Phosphorescent Guide Line',
  '["Chalk line","Water trail","Blood smear"]'::jsonb,
  'Glowing phosphor thread',
  '["glowing phosphor thread","phosphor thread","glowing thread","thread","guide line"]'::jsonb,
  'Invisible string visible only under UV light used to navigate the pitch blackness.',
  'ev_3',
  false,
  '{"descriptions":["Inspector Cross shines an ultraviolet blacklight across the stone floor.","At 12:15 AM: Inspector Cross shines an ultraviolet blacklight across the stone floor.","Notice this clue: Inspector Cross shines an ultraviolet blacklight across the stone floor."],"hints":["Invisible string visible only under UV light used to navigate the pitch blackness.","Clue hint: Think about glowing phosphor thread.","Search for: a glowing line of green phosphorescent thread running from circle 7 directly to the altar."],"clues":["Glowing phosphor thread","Item: Glowing phosphor thread","Clue Word: Glowing phosphor thread"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '455e01c9-5954-5f51-a5a5-732e2485ad8f',
  'story_103',
  'ev_3',
  3,
  '12:25 AM',
  'Cross inspects chalk circle seven at the rear of the chamber.',
  'Cross inspects chalk circle seven at the rear of the chamber.',
  'A pin in the floor anchoring the start of the glowing phosphor thread in Nicholas’s circle.',
  'Anchor pin in circle seven',
  'Circle Seven Anchor Pin',
  '["Candle stub","Coin","Chalk piece"]'::jsonb,
  'Anchor pin in circle seven',
  '["anchor pin in circle seven","anchor pin","pin","circle seven pin","floor pin"]'::jsonb,
  'Brass needle holding the glowing thread firmly in Nicholas Vance’s spot.',
  'ev_4',
  false,
  '{"descriptions":["Cross inspects chalk circle seven at the rear of the chamber.","At 12:25 AM: Cross inspects chalk circle seven at the rear of the chamber.","Notice this clue: Cross inspects chalk circle seven at the rear of the chamber."],"hints":["Brass needle holding the glowing thread firmly in Nicholas Vance’s spot.","Clue hint: Think about anchor pin in circle seven.","Search for: a pin in the floor anchoring the start of the glowing phosphor thread in nicholas’s circle."],"clues":["Anchor pin in circle seven","Item: Anchor pin in circle seven","Clue Word: Anchor pin in circle seven"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '54b5fadf-382e-57f1-9776-f9c513f228a2',
  'story_103',
  'ev_4',
  4,
  '12:35 AM',
  'Cross inspects Nicholas’s ceremonial black robe under UV light.',
  'Cross inspects Nicholas’s ceremonial black robe under UV light.',
  'High-velocity blood spatter droplets on the inner cuffs of Nicholas’s black sleeves.',
  'Blood spatter on robe cuffs',
  'Robed Sleeve Spatter',
  '["Wine stain","Wax drop","Ink mark"]'::jsonb,
  'Blood spatter on robe cuffs',
  '["blood spatter on robe cuffs","blood spatter","robe spatter","blood on cuffs","sleeve spatter"]'::jsonb,
  'Forensic blood spots matching the victim found on the initiate’s clothing.',
  'ev_5',
  false,
  '{"descriptions":["Cross inspects Nicholas’s ceremonial black robe under UV light.","At 12:35 AM: Cross inspects Nicholas’s ceremonial black robe under UV light.","Notice this clue: Cross inspects Nicholas’s ceremonial black robe under UV light."],"hints":["Forensic blood spots matching the victim found on the initiate’s clothing.","Clue hint: Think about blood spatter on robe cuffs.","Search for: high-velocity blood spatter droplets on the inner cuffs of nicholas’s black sleeves."],"clues":["Blood spatter on robe cuffs","Item: Blood spatter on robe cuffs","Clue Word: Blood spatter on robe cuffs"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4b06d197-a788-560d-9754-18159b5ea677',
  'story_103',
  'ev_5',
  5,
  '12:45 AM',
  'Cross searches Nicholas’s ceremonial sash.',
  'Cross searches Nicholas’s ceremonial sash.',
  'An infrared night-vision monocular hidden in the embroidered silk fold.',
  'Infrared monocular',
  'Night-Vision Monocular',
  '["Magnifying glass","Pocket mirror","Spectacles"]'::jsonb,
  'Infrared monocular',
  '["infrared monocular","monocular","night vision","night-vision monocular"]'::jsonb,
  'Optical device used to see the glowing thread in total darkness.',
  'ev_6',
  true,
  '{"descriptions":["Cross searches Nicholas’s ceremonial sash.","At 12:45 AM: Cross searches Nicholas’s ceremonial sash.","Notice this clue: Cross searches Nicholas’s ceremonial sash."],"hints":["Optical device used to see the glowing thread in total darkness.","Clue hint: Think about infrared monocular.","Search for: an infrared night-vision monocular hidden in the embroidered silk fold."],"clues":["Infrared monocular","Item: Infrared monocular","Clue Word: Infrared monocular"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0b6d5efa-b4bb-5cdd-9ca2-a16620324327',
  'story_103',
  'ev_6',
  6,
  '01:00 AM',
  'Cross examines the parchment gripped in dead Thorne’s fist.',
  'Cross examines the parchment gripped in dead Thorne’s fist.',
  'A confession memo admitting Thorne poisoned founder Marcus Vance in 2009.',
  'Historical murder memo',
  'Thorne’s Written Confession',
  '["Society bylaws","Ritual chant","Membership list"]'::jsonb,
  'Historical murder memo',
  '["historical murder memo","murder memo","confession memo","written confession","memo"]'::jsonb,
  'Proof that the Grand Master had murdered Nicholas’s father fifteen years ago.',
  'ev_7',
  false,
  '{"descriptions":["Cross examines the parchment gripped in dead Thorne’s fist.","At 01:00 AM: Cross examines the parchment gripped in dead Thorne’s fist.","Notice this clue: Cross examines the parchment gripped in dead Thorne’s fist."],"hints":["Proof that the Grand Master had murdered Nicholas’s father fifteen years ago.","Clue hint: Think about historical murder memo.","Search for: a confession memo admitting thorne poisoned founder marcus vance in 2009."],"clues":["Historical murder memo","Item: Historical murder memo","Clue Word: Historical murder memo"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'da63c658-cd0f-5d7c-b887-cf8d6155f74e',
  'story_103',
  'ev_7',
  7,
  '01:15 AM',
  'Cross confronts Nicholas with the thread, the monocular, and the blood spatter.',
  'Cross confronts Nicholas with the thread, the monocular, and the blood spatter.',
  'Nicholas admits he avenged his father during the darkness of the blood oath.',
  'Initiate’s revenge confession',
  'Signed Murder Admission',
  '["Denial","Brotherhood plea","Silence"]'::jsonb,
  'Initiate’s revenge confession',
  '["initiate’s revenge confession","confession","revenge confession","nicholas confession","admission"]'::jsonb,
  'Full confession of the assassination carried out during the ceremony.',
  'ev_8',
  false,
  '{"descriptions":["Cross confronts Nicholas with the thread, the monocular, and the blood spatter.","At 01:15 AM: Cross confronts Nicholas with the thread, the monocular, and the blood spatter.","Notice this clue: Cross confronts Nicholas with the thread, the monocular, and the blood spatter."],"hints":["Full confession of the assassination carried out during the ceremony.","Clue hint: Think about initiate’s revenge confession.","Search for: nicholas admits he avenged his father during the darkness of the blood oath."],"clues":["Initiate’s revenge confession","Item: Initiate’s revenge confession","Clue Word: Initiate’s revenge confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '63ac0b34-a326-5e2e-b10a-08a92fcf6a54',
  'story_103',
  'ev_8',
  8,
  '01:30 AM',
  'Police arrest Nicholas Vance and dismantle the Owl & Key society catacombs.',
  'Police arrest Nicholas Vance and dismantle the Owl & Key society catacombs.',
  'The disbanding and seizure of the illegal secret society temple.',
  'Society seizure order',
  'Police Seizure Voucher',
  '["Ritual resumption","New grand master","Secret pact"]'::jsonb,
  'Society seizure order',
  '["society seizure order","seizure order","society seizure","voucher","police voucher"]'::jsonb,
  'Official closing of the underground cult headquarters.',
  NULL,
  true,
  '{"descriptions":["Police arrest Nicholas Vance and dismantle the Owl & Key society catacombs.","At 01:30 AM: Police arrest Nicholas Vance and dismantle the Owl & Key society catacombs.","Notice this clue: Police arrest Nicholas Vance and dismantle the Owl & Key society catacombs."],"hints":["Official closing of the underground cult headquarters.","Clue hint: Think about society seizure order.","Search for: the disbanding and seizure of the illegal secret society temple."],"clues":["Society seizure order","Item: Society seizure order","Clue Word: Society seizure order"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_104 — THE SMUGGLER’S SEA CAVE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_104',
  'The Smuggler’s Sea Cave',
  'Dark Mystery',
  'Smuggler’s Cove limestone sea cavern, crashing Atlantic surf, rising tide, damp seaweed, and rusted iron mooring rings',
  'As the high tide rushed into the flooded cavern, the body of an antique dealer was found handcuffed to an iron cavern wall ring with water rising to his neck, while crates of gold bullion rested untouched beside him.',
  '[{"name":"Duncan Vance","role":"Harbor Master","alibi":"Claims he was in the harbor master tower recording ship arrivals","avatar":"⚓"},{"name":"Arthur Sterling (Victim)","role":"Antique Dealer & Smuggler","alibi":"Drowned in the cave by the morning tide","avatar":"🌊"},{"name":"Officer Clara Reed","role":"Coast Guard Investigator","alibi":"Patrolling the coastline in a zodiac boat","avatar":"🚤"},{"name":"Detective Marcus Cole","role":"Maritime Crimes Detective","alibi":"Arrived at the cove with the rescue cutter","avatar":"🔍"}]'::jsonb,
  'Antique dealer Arthur Sterling blackmailed Harbor Master Duncan Vance over illegal gold shipments. Duncan lured Arthur into the sea cave under the pretense of dividing the crates. Once inside, Duncan snapped steel handcuffs connecting Arthur to the cavern low-tide ring, leaving the incoming six-foot tide to drown him while leaving the gold intact as a distraction.',
  'Harbor Master Duncan Vance',
  'Duncan wanted to silence the dealer who was blackmailing him over thirty years of maritime smuggling.',
  '[{"time":"04:00 AM","event":"Low tide exposes the dry floor of the Smuggler’s Cove cave."},{"time":"04:30 AM","event":"Duncan meets Arthur inside the cave beside the crates of gold."},{"time":"04:45 AM","event":"Duncan overpowers Arthur and handcuffs his wrist to the low-tide mooring ring."},{"time":"05:00 AM","event":"Duncan leaves in his motor launch as the Atlantic tide begins rising."},{"time":"06:30 AM","event":"Coast Guard officer Reed enters the cave and discovers Arthur drowned."}]'::jsonb,
  '[{"id":"ev_1","title":"Serialized Handcuffs","detail":"Harbor Patrol cuffs stamped HP-408 used to chain the victim to the tidal mooring ring."},{"id":"ev_2","title":"Smuggled Spanish Gold","detail":"Ten crates of antique gold bullion untouched in the cavern, disproving robbery."},{"id":"ev_3","title":"Harbor Armory Log","detail":"Official equipment log proving Duncan Vance signed out handcuffs HP-408."},{"id":"ev_4","title":"Aerial Thermal Video","detail":"Coast Guard helicopter video showing Duncan’s motor launch leaving the murder cove."}]'::jsonb,
  '[{"order":1,"title":"Handcuffed to mooring ring","text":"Proves the death was a cold, premeditated execution by rising tide."},{"order":2,"title":"Harbor Patrol handcuffs","text":"Links the crime directly to harbor law enforcement hardware."},{"order":3,"title":"Untouched gold crates","text":"Demonstrates the murder was about silencing blackmail, not stealing cargo."},{"order":4,"title":"Waterproof debt note","text":"Dying identification pointing directly at Duncan Vance."},{"order":5,"title":"Handcuff checkout log","text":"Documentary proof placing the murder restraints in Duncan’s hands."},{"order":6,"title":"Helicopter launch footage","text":"Crushes Duncan’s alibi and places his vessel at the cave at low tide."}]'::jsonb,
  'Ghostly whispers recorded in the cave: Wind whistling through limestone fissures created haunting sounds.; Unregistered fishing skiff anchored nearby: The fishermen were poaching lobster, unrelated to the murder.',
  'Claim pirate ghosts bound the victim in accordance with an ancient sea curse.',
  'NORMAL',
  'Why was the victim handcuffed to drown when millions in gold were left untouched?',
  '[{"character":"Duncan Vance","secret":"A duplicate master key to the harbor customs warehouse where the gold was registered."},{"character":"Arthur Sterling (Victim)","secret":"He had hidden audio tapes exposing the harbor master in his coastal antique shop."},{"character":"Officer Clara Reed","secret":"She was running a secret federal investigation into coastal smuggling."},{"character":"Detective Marcus Cole","secret":"He had received Arthur’s preliminary anonymous tip two days ago."}]'::jsonb,
  '[{"lead":"Ghostly whispers recorded in the cave","explanation":"Wind whistling through limestone fissures created haunting sounds."},{"lead":"Unregistered fishing skiff anchored nearby","explanation":"The fishermen were poaching lobster, unrelated to the murder."}]'::jsonb,
  '{"wrongTheories":["Arthur accidentally locked himself to the ring while trying to secure the gold crates.","A rival smuggling cartel killed Arthur and planned to return for the gold later."],"correctTheory":"Harbor Master Duncan Vance handcuffed Arthur to the low-tide ring to let the tide drown him to silence his blackmail."}'::jsonb,
  'Harbor Master Duncan Vance handcuffed Arthur to the low-tide ring to drown him and silence his smuggling blackmail.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Duncan Vance was convicted of premeditated murder, and the smuggling ring was dismantled."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Duncan claimed Arthur was a rogue pirate who died in a scuffle, retaining his harbor master post."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The cave was sealed off with concrete as an unsafe cliff, burying the truth of the murder forever."}]'::jsonb,
  '{"intros":["As the high tide rushed into the flooded cavern, the body of an antique dealer was found handcuffed to an iron cavern wall ring with water rising to his neck, while crates of gold bullion rested untouched beside him.","Case file story_104: As the high tide rushed into the flooded cavern, the body of an antique dealer was found handcuffed to an iron cavern wall ring with water rising to his neck, while crates of gold bullion rested untouched beside him. Look closely at every clue.","Trouble begins in Smuggler’s Cove limestone sea cavern, crashing Atlantic surf, rising tide, damp seaweed, and rusted iron mooring rings. As the high tide rushed into the flooded cavern, the body of an antique dealer was found handcuffed to an iron cavern wall ring with water rising to his neck, while crates of gold bullion rested untouched beside him.","The mystery starts now. As the high tide rushed into the flooded cavern, the body of an antique dealer was found handcuffed to an iron cavern wall ring with water rising to his neck, while crates of gold bullion rested untouched beside him. Can you solve it?"],"reveals":["Harbor Master Duncan Vance handcuffed Arthur to the low-tide ring to drown him and silence his smuggling blackmail.","The mystery is unraveled! Harbor Master Duncan Vance handcuffed Arthur to the low-tide ring to drown him and silence his smuggling blackmail.","At last, the truth comes out: Harbor Master Duncan Vance handcuffed Arthur to the low-tide ring to drown him and silence his smuggling blackmail.","Case resolved! Here is what happened: Harbor Master Duncan Vance handcuffed Arthur to the low-tide ring to drown him and silence his smuggling blackmail."],"hints":["Pay attention to where Harbor Master Duncan Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_104';
DELETE FROM public.case_events WHERE case_id = 'story_104';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e9bdf7b1-4f44-5378-9d87-1a968758c7a3',
  'story_104',
  'Duncan Vance',
  'Harbor Master',
  'Weathered salt, oilskin slicker, smoking a brass pipe, scarred forearms, steely gaze',
  'Arthur was a reckless smuggler who got caught by the incoming tide while loading his boat.',
  'A duplicate master key to the harbor customs warehouse where the gold was registered.',
  'Claims he was in the harbor master tower recording ship arrivals',
  'Secret partner and syndicate boss of the smuggling operation',
  'The cavern floods completely with twelve feet of water at high tide.',
  'Did not know the coast guard helicopter camera caught his boat leaving the cove at 05:00 AM.',
  '⚓',
  '["Arthur was a reckless smuggler who got caught by the incoming tide while loading his boat.","\"Arthur was a reckless smuggler who got caught by the incoming tide while loading his boat.\"","Listen to me: Arthur was a reckless smuggler who got caught by the incoming tide while loading his boat.","I tell you the truth: Arthur was a reckless smuggler who got caught by the incoming tide while loading his boat."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e8373a55-e681-53b5-a6bf-a2567ee73c3b',
  'story_104',
  'Arthur Sterling (Victim)',
  'Antique Dealer & Smuggler',
  'Found chained to the rock wall in rising seawater, bruised wrists',
  'Deceased victim; note in his waterproof pocket read: "Duncan meets me at low tide to settle the debt."',
  'He had hidden audio tapes exposing the harbor master in his coastal antique shop.',
  'Drowned in the cave by the morning tide',
  'Victim and blackmailer of Duncan Vance',
  'Duncan had arranged fifty illegal gold shipments over twenty years.',
  'Did not suspect Duncan would murder him rather than pay the blackmail.',
  '🌊',
  '["Deceased victim; note in his waterproof pocket read: \"Duncan meets me at low tide to settle the debt.\"","\"Deceased victim; note in his waterproof pocket read: \"Duncan meets me at low tide to settle the debt.\"\"","Listen to me: Deceased victim; note in his waterproof pocket read: \"Duncan meets me at low tide to settle the debt.\"","I tell you the truth: Deceased victim; note in his waterproof pocket read: \"Duncan meets me at low tide to settle the debt.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ef7d711a-6ed9-5923-a0a3-fe7f469545b1',
  'story_104',
  'Officer Clara Reed',
  'Coast Guard Investigator',
  'Brave, waterproof tactical gear, piloting a zodiac rescue boat into the surf',
  'This wasn’t an accident. Police-issue handcuffs don’t lock themselves around an iron wall ring.',
  'She was running a secret federal investigation into coastal smuggling.',
  'Patrolling the coastline in a zodiac boat',
  'First responder who discovered Arthur’s body',
  'The handcuffs were stamped with official Harbor Patrol serial numbers.',
  'Did not know which harbor officer checked out that specific pair.',
  '🚤',
  '["This wasn’t an accident. Police-issue handcuffs don’t lock themselves around an iron wall ring.","\"This wasn’t an accident. Police-issue handcuffs don’t lock themselves around an iron wall ring.\"","Listen to me: This wasn’t an accident. Police-issue handcuffs don’t lock themselves around an iron wall ring.","I tell you the truth: This wasn’t an accident. Police-issue handcuffs don’t lock themselves around an iron wall ring."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7ff7ced6-252f-5953-8353-560d9c0ea8f5',
  'story_104',
  'Detective Marcus Cole',
  'Maritime Crimes Detective',
  'Sharp, dry sense of humor, carrying evidence pouches and bolt cutters',
  'Leaving millions in gold behind tells you the killer wanted silence, not profit.',
  'He had received Arthur’s preliminary anonymous tip two days ago.',
  'Arrived at the cove with the rescue cutter',
  'Lead detective on the murder',
  'The harbor logbook had twenty minutes torn out from the night shift.',
  'Did not know where Duncan threw the handcuff key.',
  '🔍',
  '["Leaving millions in gold behind tells you the killer wanted silence, not profit.","\"Leaving millions in gold behind tells you the killer wanted silence, not profit.\"","Listen to me: Leaving millions in gold behind tells you the killer wanted silence, not profit.","I tell you the truth: Leaving millions in gold behind tells you the killer wanted silence, not profit."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c7677846-4f5f-54a6-bca4-a9b6e3082643',
  'story_104',
  'ev_1',
  1,
  '06:30 AM',
  'Officer Reed navigates her zodiac into the sea cave.',
  'Officer Reed navigates her zodiac into the sea cave.',
  'Arthur Sterling drowned while handcuffed to a rusted iron mooring ring.',
  'Handcuffed to mooring ring',
  'Chained Body Scene',
  '["Tied with rope","Trapped under rock","Tangled in nets"]'::jsonb,
  'Handcuffed to mooring ring',
  '["handcuffed to mooring ring","handcuffed body","mooring ring","handcuffed to ring","chained body"]'::jsonb,
  'Victim secured to the cave wall with heavy steel handcuffs.',
  'ev_2',
  true,
  '{"descriptions":["Officer Reed navigates her zodiac into the sea cave.","At 06:30 AM: Officer Reed navigates her zodiac into the sea cave.","Notice this clue: Officer Reed navigates her zodiac into the sea cave."],"hints":["Victim secured to the cave wall with heavy steel handcuffs.","Clue hint: Think about handcuffed to mooring ring.","Search for: arthur sterling drowned while handcuffed to a rusted iron mooring ring."],"clues":["Handcuffed to mooring ring","Item: Handcuffed to mooring ring","Clue Word: Handcuffed to mooring ring"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '31a0f776-7ec5-5ece-890a-018da2402d49',
  'story_104',
  'ev_2',
  2,
  '06:45 AM',
  'Detective Cole examines the steel handcuffs on Arthur’s wrist.',
  'Detective Cole examines the steel handcuffs on Arthur’s wrist.',
  'Handcuffs stamped with official Harbor Patrol serial number "HP-408".',
  'Harbor Patrol handcuffs',
  'Serialized Handcuffs',
  '["Civilian cuffs","Rusted chain","Zip ties"]'::jsonb,
  'Harbor Patrol handcuffs',
  '["harbor patrol handcuffs","patrol handcuffs","serialized handcuffs","handcuffs","hp handcuffs"]'::jsonb,
  'Law enforcement restraints issued specifically to harbor master officers.',
  'ev_3',
  false,
  '{"descriptions":["Detective Cole examines the steel handcuffs on Arthur’s wrist.","At 06:45 AM: Detective Cole examines the steel handcuffs on Arthur’s wrist.","Notice this clue: Detective Cole examines the steel handcuffs on Arthur’s wrist."],"hints":["Law enforcement restraints issued specifically to harbor master officers.","Clue hint: Think about harbor patrol handcuffs.","Search for: handcuffs stamped with official harbor patrol serial number \"hp-408\"."],"clues":["Harbor Patrol handcuffs","Item: Harbor Patrol handcuffs","Clue Word: Harbor Patrol handcuffs"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '913a89a2-7ead-55f8-b9fa-d7d1025b893c',
  'story_104',
  'ev_3',
  3,
  '07:00 AM',
  'Cole inspects the wooden crates stacked on the cave ledge.',
  'Cole inspects the wooden crates stacked on the cave ledge.',
  'Ten crates of 18th-century Spanish gold bullion completely untouched.',
  'Untouched gold crates',
  'Smuggled Spanish Gold',
  '["Empty crates","Contraband rum","Stolen weapons"]'::jsonb,
  'Untouched gold crates',
  '["untouched gold crates","gold crates","untouched gold","spanish gold","bullion crates"]'::jsonb,
  'Millions in antique gold left behind, proving robbery was not the motive.',
  'ev_4',
  false,
  '{"descriptions":["Cole inspects the wooden crates stacked on the cave ledge.","At 07:00 AM: Cole inspects the wooden crates stacked on the cave ledge.","Notice this clue: Cole inspects the wooden crates stacked on the cave ledge."],"hints":["Millions in antique gold left behind, proving robbery was not the motive.","Clue hint: Think about untouched gold crates.","Search for: ten crates of 18th-century spanish gold bullion completely untouched."],"clues":["Untouched gold crates","Item: Untouched gold crates","Clue Word: Untouched gold crates"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e02aabdb-bd07-5f94-a175-20fe156dce7c',
  'story_104',
  'ev_4',
  4,
  '07:20 AM',
  'Cole searches the waterproof pocket of Arthur’s oilskin jacket.',
  'Cole searches the waterproof pocket of Arthur’s oilskin jacket.',
  'A handwritten appointment note: "Duncan meets me at low tide to settle the debt."',
  'Waterproof debt note',
  'Victim Pocket Note',
  '["Shopping list","Map","Receipt"]'::jsonb,
  'Waterproof debt note',
  '["waterproof debt note","debt note","pocket note","appointment note","waterproof note"]'::jsonb,
  'Note written by Arthur naming Duncan as his meeting partner.',
  'ev_5',
  false,
  '{"descriptions":["Cole searches the waterproof pocket of Arthur’s oilskin jacket.","At 07:20 AM: Cole searches the waterproof pocket of Arthur’s oilskin jacket.","Notice this clue: Cole searches the waterproof pocket of Arthur’s oilskin jacket."],"hints":["Note written by Arthur naming Duncan as his meeting partner.","Clue hint: Think about waterproof debt note.","Search for: a handwritten appointment note: \"duncan meets me at low tide to settle the debt.\""],"clues":["Waterproof debt note","Item: Waterproof debt note","Clue Word: Waterproof debt note"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '966ce33b-c6be-52d3-aeb4-887f88579d33',
  'story_104',
  'ev_5',
  5,
  '07:45 AM',
  'Cole inspects the harbor patrol equipment equipment logbook.',
  'Cole inspects the harbor patrol equipment equipment logbook.',
  'Handcuffs HP-408 were signed out by Harbor Master Duncan Vance yesterday.',
  'Handcuff checkout log',
  'Harbor Armory Log',
  '["Cleaning roster","Fuel log","Duty schedule"]'::jsonb,
  'Handcuff checkout log',
  '["handcuff checkout log","checkout log","armory log","handcuff log","equipment log"]'::jsonb,
  'Written record proving Duncan took the murder handcuffs from the station.',
  'ev_6',
  true,
  '{"descriptions":["Cole inspects the harbor patrol equipment equipment logbook.","At 07:45 AM: Cole inspects the harbor patrol equipment equipment logbook.","Notice this clue: Cole inspects the harbor patrol equipment equipment logbook."],"hints":["Written record proving Duncan took the murder handcuffs from the station.","Clue hint: Think about handcuff checkout log.","Search for: handcuffs hp-408 were signed out by harbor master duncan vance yesterday."],"clues":["Handcuff checkout log","Item: Handcuff checkout log","Clue Word: Handcuff checkout log"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '63733709-a738-5741-ab53-3ad61dda027d',
  'story_104',
  'ev_6',
  6,
  '08:10 AM',
  'Officer Reed reviews the coast guard helicopter thermal video.',
  'Officer Reed reviews the coast guard helicopter thermal video.',
  'Duncan’s private green motor launch speeding away from the cove at 05:02 AM.',
  'Helicopter launch footage',
  'Aerial Thermal Video',
  '["Sailboat","Fishing trawler","Cargo ship"]'::jsonb,
  'Helicopter launch footage',
  '["helicopter launch footage","launch footage","thermal video","helicopter footage","motor launch"]'::jsonb,
  'Night-vision video catching Duncan’s boat fleeing the cove as the tide rose.',
  'ev_7',
  false,
  '{"descriptions":["Officer Reed reviews the coast guard helicopter thermal video.","At 08:10 AM: Officer Reed reviews the coast guard helicopter thermal video.","Notice this clue: Officer Reed reviews the coast guard helicopter thermal video."],"hints":["Night-vision video catching Duncan’s boat fleeing the cove as the tide rose.","Clue hint: Think about helicopter launch footage.","Search for: duncan’s private green motor launch speeding away from the cove at 05:02 am."],"clues":["Helicopter launch footage","Item: Helicopter launch footage","Clue Word: Helicopter launch footage"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2bd7bfef-5f20-5aaa-9bf1-4654d2c6c706',
  'story_104',
  'ev_7',
  7,
  '08:40 AM',
  'Cole searches Duncan’s office in the harbor tower.',
  'Cole searches Duncan’s office in the harbor tower.',
  'Arthur’s blackmail demand letters demanding two hundred thousand dollars.',
  'Blackmail demand letters',
  'Extortion Correspondence',
  '["Shipping invoices","Tax forms","Personal letters"]'::jsonb,
  'Blackmail demand letters',
  '["blackmail demand letters","blackmail letters","demand letters","extortion letters","letters"]'::jsonb,
  'Written extortion letters establishing Duncan’s motive to eliminate Arthur.',
  'ev_8',
  false,
  '{"descriptions":["Cole searches Duncan’s office in the harbor tower.","At 08:40 AM: Cole searches Duncan’s office in the harbor tower.","Notice this clue: Cole searches Duncan’s office in the harbor tower."],"hints":["Written extortion letters establishing Duncan’s motive to eliminate Arthur.","Clue hint: Think about blackmail demand letters.","Search for: arthur’s blackmail demand letters demanding two hundred thousand dollars."],"clues":["Blackmail demand letters","Item: Blackmail demand letters","Clue Word: Blackmail demand letters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '06263700-e7a9-5ef3-8a7f-a5ee5f966ea7',
  'story_104',
  'ev_8',
  8,
  '09:10 AM',
  'Duncan Vance is arrested on the harbor docks.',
  'Duncan Vance is arrested on the harbor docks.',
  'Duncan’s confession admitting he handcuffed Arthur to let the sea drown the secret.',
  'Harbor master confession',
  'Signed Drowning Confession',
  '["Denial","Suicide claim","Silence"]'::jsonb,
  'Harbor master confession',
  '["harbor master confession","confession","duncan confession","admission"]'::jsonb,
  'Full confession of the brutal tidal execution.',
  NULL,
  true,
  '{"descriptions":["Duncan Vance is arrested on the harbor docks.","At 09:10 AM: Duncan Vance is arrested on the harbor docks.","Notice this clue: Duncan Vance is arrested on the harbor docks."],"hints":["Full confession of the brutal tidal execution.","Clue hint: Think about harbor master confession.","Search for: duncan’s confession admitting he handcuffed arthur to let the sea drown the secret."],"clues":["Harbor master confession","Item: Harbor master confession","Clue Word: Harbor master confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_105 — THE FORGED PASSPORT IN THE SUITCASE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_105',
  'The Forged Passport in the Suitcase',
  'Dark Mystery',
  'Room 404 of the Grand Continental Hotel, heavy velvet curtains, crystal decanter, luggage racks, and rain-streaked windows',
  'A foreign diplomat was found dead in his luxury hotel suite of an apparent heart attack, but a false-bottomed leather suitcase in his closet held three passports with his photo under three different names.',
  '[{"name":"Elena Rostova","role":"Diplomatic Attache","alibi":"Attending the embassy reception downstairs","avatar":"💼"},{"name":"Arthur Sterling (Victim)","role":"Senior Diplomat & Triple Agent","alibi":"Dead in hotel room 404","avatar":"👔"},{"name":"Inspector Viktor Vance","role":"Counter-Intelligence Investigator","alibi":"In the surveillance van parked across the hotel square","avatar":"🕵️‍♂️"},{"name":"Henri Dupont","role":"Hotel Concierge","alibi":"Managing the concierge desk in the main lobby","avatar":"🛎️"}]'::jsonb,
  'Diplomat Arthur Sterling was secretly a triple agent operating under multiple identities. Attache Elena Rostova, a rival operative, discovered his hidden stash of forged passports. Elena coated the leather cover of the British passport with an untraceable cardiac nerve agent, knowing Arthur would handle it before his midnight departure.',
  'Diplomatic Attache Elena Rostova',
  'Elena was an enemy agent who poisoned the diplomat to steal an encrypted embassy microdot.',
  '[{"time":"07:00 PM","event":"Elena bribes the concierge for an unlogged keycard to room 404."},{"time":"07:15 PM","event":"Elena enters room 404 and coats the British passport cover with contact nerve toxin."},{"time":"10:30 PM","event":"Arthur returns to room 404, opens the suitcase, and touches the British passport."},{"time":"10:45 PM","event":"The transdermal toxin induces sudden cardiac arrhythmia; Arthur collapses."},{"time":"11:15 PM","event":"Hotel maid discovers Arthur’s body and alerts security."}]'::jsonb,
  '[{"id":"ev_1","title":"Counterfeit Passport Trio","detail":"Three expertly forged passports found in the suitcase false bottom establishing espionage."},{"id":"ev_2","title":"Contact Toxin Swab","detail":"Spectroscopy test confirming lethal nerve agent VX-4 on the British passport cover."},{"id":"ev_3","title":"Bribed Master Keycard","detail":"Concierge keycard proving Elena Rostova entered room 404 at 07:15 PM."},{"id":"ev_4","title":"Stolen State Microdot","detail":"Microdot containing state military secrets recovered from Elena’s fountain pen."}]'::jsonb,
  '[{"order":1,"title":"Slumped diplomat body","text":"Initial appearance of natural heart attack designed to mislead doctors."},{"order":2,"title":"False-bottom suitcase","text":"Unveils the victim’s secret double life as an international operative."},{"order":3,"title":"Three forged passports","text":"Proves Arthur was preparing for an imminent defection under an assumed name."},{"order":4,"title":"Nerve agent on passport","text":"Identifies the untraceable murder weapon disguised as leather sheen."},{"order":5,"title":"Concierge bribe keycard","text":"Destroys Elena’s alibi and places her inside the private room."},{"order":6,"title":"Hollow pen microdot","text":"Smoking gun recovery of the stolen espionage prize."}]'::jsonb,
  'Arthur’s prescription heart pills on nightstand: Arthur had mild high blood pressure, which Elena used as a cover.; Decanter of vintage scotch: Tested 100% clean, proving the drink was not poisoned.',
  'Claim the diplomat had natural cardiac arrest from the stress of espionage.',
  'NORMAL',
  'Was the diplomat an international spy, and did he die of natural causes or an untraceable poison?',
  '[{"character":"Elena Rostova","secret":"An encrypted microdot containing state military secrets inside her hollow fountain pen."},{"character":"Arthur Sterling (Victim)","secret":"A secret microdot containing high-level military codes."},{"character":"Inspector Viktor Vance","secret":"He had been running surveillance on room 404 for seventy-two hours."},{"character":"Henri Dupont","secret":"He took a five-hundred-franc tip from Elena to keep the keycard request unlogged."}]'::jsonb,
  '[{"lead":"Arthur’s prescription heart pills on nightstand","explanation":"Arthur had mild high blood pressure, which Elena used as a cover."},{"lead":"Decanter of vintage scotch","explanation":"Tested 100% clean, proving the drink was not poisoned."}]'::jsonb,
  '{"wrongTheories":["The diplomat suffered a natural heart attack caused by the extreme stress of defecting.","Arthur was poisoned by the hotel room service scotch decanter."],"correctTheory":"Elena Rostova bribed the concierge and coated Arthur’s forged passport with nerve toxin to kill him and steal the microdot."}'::jsonb,
  'Elena Rostova coated Arthur’s forged passport with transdermal nerve toxin to cause cardiac arrest and steal an embassy microdot.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Elena was stripped of diplomatic immunity and imprisoned for espionage and murder; the microdot was secured."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The death was signed off as a natural heart attack, and Elena flew home as a celebrated intelligence officer."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Diplomatic cover-ups buried the autopsy report, leaving the public convinced it was sudden medical illness."}]'::jsonb,
  '{"intros":["A foreign diplomat was found dead in his luxury hotel suite of an apparent heart attack, but a false-bottomed leather suitcase in his closet held three passports with his photo under three different names.","Case file story_105: A foreign diplomat was found dead in his luxury hotel suite of an apparent heart attack, but a false-bottomed leather suitcase in his closet held three passports with his photo under three different names. Look closely at every clue.","Trouble begins in Room 404 of the Grand Continental Hotel, heavy velvet curtains, crystal decanter, luggage racks, and rain-streaked windows. A foreign diplomat was found dead in his luxury hotel suite of an apparent heart attack, but a false-bottomed leather suitcase in his closet held three passports with his photo under three different names.","The mystery starts now. A foreign diplomat was found dead in his luxury hotel suite of an apparent heart attack, but a false-bottomed leather suitcase in his closet held three passports with his photo under three different names. Can you solve it?"],"reveals":["Elena Rostova coated Arthur’s forged passport with transdermal nerve toxin to cause cardiac arrest and steal an embassy microdot.","The mystery is unraveled! Elena Rostova coated Arthur’s forged passport with transdermal nerve toxin to cause cardiac arrest and steal an embassy microdot.","At last, the truth comes out: Elena Rostova coated Arthur’s forged passport with transdermal nerve toxin to cause cardiac arrest and steal an embassy microdot.","Case resolved! Here is what happened: Elena Rostova coated Arthur’s forged passport with transdermal nerve toxin to cause cardiac arrest and steal an embassy microdot."],"hints":["Pay attention to where Diplomatic Attache Elena Rostova was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_105';
DELETE FROM public.case_events WHERE case_id = 'story_105';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6027e1e2-7b2a-5c0e-b26f-654e244c7824',
  'story_105',
  'Elena Rostova',
  'Diplomatic Attache',
  'Charming, ice-blue eyes, impeccably styled gray suit, multilingual, unshakeable poise',
  'Ambassador Sterling had a chronic heart condition. The tension of the summit was simply too much for him.',
  'An encrypted microdot containing state military secrets inside her hollow fountain pen.',
  'Attending the embassy reception downstairs',
  'Personal assistant and diplomatic attache to the victim',
  'Arthur was planning to defect to London using his British forged passport tonight.',
  'Did not know Arthur wore thin latex gloves when handling his secondary identity papers.',
  '💼',
  '["Ambassador Sterling had a chronic heart condition. The tension of the summit was simply too much for him.","\"Ambassador Sterling had a chronic heart condition. The tension of the summit was simply too much for him.\"","Listen to me: Ambassador Sterling had a chronic heart condition. The tension of the summit was simply too much for him.","I tell you the truth: Ambassador Sterling had a chronic heart condition. The tension of the summit was simply too much for him."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'cd6002ae-8a14-5d5d-b6fc-b7f4a2d2246a',
  'story_105',
  'Arthur Sterling (Victim)',
  'Senior Diplomat & Triple Agent',
  'Found slumped in the leather armchair clutching his chest, dead of cardiac arrest',
  'Deceased victim; bedside notepad showed scribbled flight numbers for Zurich.',
  'A secret microdot containing high-level military codes.',
  'Dead in hotel room 404',
  'Chief negotiator at the international peace summit',
  'Elena was secretly reporting to a foreign intelligence agency.',
  'Did not suspect the poison was rubbed directly onto his passport cover.',
  '👔',
  '["Deceased victim; bedside notepad showed scribbled flight numbers for Zurich.","\"Deceased victim; bedside notepad showed scribbled flight numbers for Zurich.\"","Listen to me: Deceased victim; bedside notepad showed scribbled flight numbers for Zurich.","I tell you the truth: Deceased victim; bedside notepad showed scribbled flight numbers for Zurich."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'de642ae3-f6d1-574f-becd-11ca3c0b8715',
  'story_105',
  'Inspector Viktor Vance',
  'Counter-Intelligence Investigator',
  'Cynical, trench coat, smoking a Turkish cigarette, carrying ultraviolet forensic lamps',
  'Triple agents don’t suffer fatal heart attacks five minutes before boarding a defection flight.',
  'He had been running surveillance on room 404 for seventy-two hours.',
  'In the surveillance van parked across the hotel square',
  'Lead state intelligence investigator',
  'The British passport cover tested positive for synthetic organophosphate toxin.',
  'Did not know where the stolen microdot had been hidden.',
  '🕵️‍♂️',
  '["Triple agents don’t suffer fatal heart attacks five minutes before boarding a defection flight.","\"Triple agents don’t suffer fatal heart attacks five minutes before boarding a defection flight.\"","Listen to me: Triple agents don’t suffer fatal heart attacks five minutes before boarding a defection flight.","I tell you the truth: Triple agents don’t suffer fatal heart attacks five minutes before boarding a defection flight."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '33623396-cdc1-5bfc-9b78-e4aabf1d80e9',
  'story_105',
  'Henri Dupont',
  'Hotel Concierge',
  'Discreet, nervous, black tuxedo, carrying brass master room keys',
  'Madame Rostova requested an extra keycard for room 404 at 07:00 PM to deliver urgent diplomatic pouches.',
  'He took a five-hundred-franc tip from Elena to keep the keycard request unlogged.',
  'Managing the concierge desk in the main lobby',
  'Provided room access to the killer',
  'Arthur Sterling ordered a private limousine for 11:30 PM.',
  'Did not know what was inside the diplomatic pouch.',
  '🛎️',
  '["Madame Rostova requested an extra keycard for room 404 at 07:00 PM to deliver urgent diplomatic pouches.","\"Madame Rostova requested an extra keycard for room 404 at 07:00 PM to deliver urgent diplomatic pouches.\"","Listen to me: Madame Rostova requested an extra keycard for room 404 at 07:00 PM to deliver urgent diplomatic pouches.","I tell you the truth: Madame Rostova requested an extra keycard for room 404 at 07:00 PM to deliver urgent diplomatic pouches."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f84ef16a-258b-5154-b83e-105b0b034e6d',
  'story_105',
  'ev_1',
  1,
  '11:15 PM',
  'Maid finds Arthur dead in the leather armchair.',
  'Maid finds Arthur dead in the leather armchair.',
  'Arthur slumped dead with zero physical signs of trauma or struggle.',
  'Slumped diplomat body',
  'Victim Death Scene',
  '["Strangulation mark","Stab wound","Gunshot"]'::jsonb,
  'Slumped diplomat body',
  '["slumped diplomat body","slumped body","diplomat body","dead diplomat","death scene"]'::jsonb,
  'Unmarked body appearing at first glance to have died of a natural heart attack.',
  'ev_2',
  true,
  '{"descriptions":["Maid finds Arthur dead in the leather armchair.","At 11:15 PM: Maid finds Arthur dead in the leather armchair.","Notice this clue: Maid finds Arthur dead in the leather armchair."],"hints":["Unmarked body appearing at first glance to have died of a natural heart attack.","Clue hint: Think about slumped diplomat body.","Search for: arthur slumped dead with zero physical signs of trauma or struggle."],"clues":["Slumped diplomat body","Item: Slumped diplomat body","Clue Word: Slumped diplomat body"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '21f41c31-cfb9-5185-8340-6ded08f00ee2',
  'story_105',
  'ev_2',
  2,
  '11:30 PM',
  'Inspector Vance inspects the closet luggage rack.',
  'Inspector Vance inspects the closet luggage rack.',
  'A bespoke leather suitcase with a false bottom opened with a hidden sliding latch.',
  'False-bottom suitcase',
  'Concealed Suitcase Cavity',
  '["Standard bag","Briefcase","Duffel bag"]'::jsonb,
  'False-bottom suitcase',
  '["false-bottom suitcase","false bottom","suitcase","false suitcase","hidden cavity"]'::jsonb,
  'Luxury travel bag equipped with a secret compartment beneath the silk lining.',
  'ev_3',
  false,
  '{"descriptions":["Inspector Vance inspects the closet luggage rack.","At 11:30 PM: Inspector Vance inspects the closet luggage rack.","Notice this clue: Inspector Vance inspects the closet luggage rack."],"hints":["Luxury travel bag equipped with a secret compartment beneath the silk lining.","Clue hint: Think about false-bottom suitcase.","Search for: a bespoke leather suitcase with a false bottom opened with a hidden sliding latch."],"clues":["False-bottom suitcase","Item: False-bottom suitcase","Clue Word: False-bottom suitcase"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '45eba936-6153-520d-b9b2-4583818f4bcb',
  'story_105',
  'ev_3',
  3,
  '11:45 PM',
  'Vance removes three passports from the secret compartment.',
  'Vance removes three passports from the secret compartment.',
  'Three authentic-grade passports under names Sterling, Miller, and Dubois with Arthur’s photo.',
  'Three forged passports',
  'Counterfeit Passport Trio',
  '["Credit cards","Checkbooks","Diplomatic badges"]'::jsonb,
  'Three forged passports',
  '["three forged passports","forged passports","three passports","passports","fake passports"]'::jsonb,
  'Multiple high-quality foreign identities belonging to the dead diplomat.',
  'ev_4',
  false,
  '{"descriptions":["Vance removes three passports from the secret compartment.","At 11:45 PM: Vance removes three passports from the secret compartment.","Notice this clue: Vance removes three passports from the secret compartment."],"hints":["Multiple high-quality foreign identities belonging to the dead diplomat.","Clue hint: Think about three forged passports.","Search for: three authentic-grade passports under names sterling, miller, and dubois with arthur’s photo."],"clues":["Three forged passports","Item: Three forged passports","Clue Word: Three forged passports"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6ea0bdc6-2bc7-5734-affd-d42bfd04ec2f',
  'story_105',
  'ev_4',
  4,
  '12:00 AM',
  'Vance swabs the dark blue cover of the British passport.',
  'Vance swabs the dark blue cover of the British passport.',
  'Lethal oily sheen of transdermal cardiac nerve agent VX-4.',
  'Nerve agent on passport',
  'Contact Toxin Swab',
  '["Fingerprint dust","Water stain","Perfume oil"]'::jsonb,
  'Nerve agent on passport',
  '["nerve agent on passport","nerve agent","toxin on passport","contact toxin","poison on passport"]'::jsonb,
  'Deadly contact poison rubbed directly onto the leather cover of the document.',
  'ev_5',
  false,
  '{"descriptions":["Vance swabs the dark blue cover of the British passport.","At 12:00 AM: Vance swabs the dark blue cover of the British passport.","Notice this clue: Vance swabs the dark blue cover of the British passport."],"hints":["Deadly contact poison rubbed directly onto the leather cover of the document.","Clue hint: Think about nerve agent on passport.","Search for: lethal oily sheen of transdermal cardiac nerve agent vx-4."],"clues":["Nerve agent on passport","Item: Nerve agent on passport","Clue Word: Nerve agent on passport"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '14cdd220-d12e-5ea1-8676-2a60fa149f4b',
  'story_105',
  'ev_5',
  5,
  '12:15 AM',
  'Vance examines Arthur’s right index finger.',
  'Vance examines Arthur’s right index finger.',
  'Skin absorption erythema matching the contact zone on the passport.',
  'Finger absorption mark',
  'Cutaneous Absorption Pattern',
  '["Ink stain","Paper cut","Bruise"]'::jsonb,
  'Finger absorption mark',
  '["finger absorption mark","absorption mark","finger mark","toxin mark","absorption pattern"]'::jsonb,
  'Forensic skin reaction proving the poison entered Arthur’s body through his finger.',
  'ev_6',
  true,
  '{"descriptions":["Vance examines Arthur’s right index finger.","At 12:15 AM: Vance examines Arthur’s right index finger.","Notice this clue: Vance examines Arthur’s right index finger."],"hints":["Forensic skin reaction proving the poison entered Arthur’s body through his finger.","Clue hint: Think about finger absorption mark.","Search for: skin absorption erythema matching the contact zone on the passport."],"clues":["Finger absorption mark","Item: Finger absorption mark","Clue Word: Finger absorption mark"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3bab338f-bbe2-5c4b-9e3e-1878c40d4668',
  'story_105',
  'ev_6',
  6,
  '12:30 AM',
  'Vance interrogates Concierge Henri Dupont.',
  'Vance interrogates Concierge Henri Dupont.',
  'A five-hundred-franc banknote and an unlogged master keycard issued to Elena Rostova.',
  'Concierge bribe keycard',
  'Bribed Master Keycard',
  '["Room bill","Luggage tag","Taxi receipt"]'::jsonb,
  'Concierge bribe keycard',
  '["concierge bribe keycard","bribe keycard","keycard","master keycard","concierge keycard"]'::jsonb,
  'Hotel electronic keycard proving Elena entered the room while Arthur was out.',
  'ev_7',
  false,
  '{"descriptions":["Vance interrogates Concierge Henri Dupont.","At 12:30 AM: Vance interrogates Concierge Henri Dupont.","Notice this clue: Vance interrogates Concierge Henri Dupont."],"hints":["Hotel electronic keycard proving Elena entered the room while Arthur was out.","Clue hint: Think about concierge bribe keycard.","Search for: a five-hundred-franc banknote and an unlogged master keycard issued to elena rostova."],"clues":["Concierge bribe keycard","Item: Concierge bribe keycard","Clue Word: Concierge bribe keycard"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f90b084b-d86c-524a-82d8-197e51fbd82a',
  'story_105',
  'ev_7',
  7,
  '12:45 AM',
  'Vance searches Elena’s diplomatic pouch in the hotel lounge.',
  'Vance searches Elena’s diplomatic pouch in the hotel lounge.',
  'A fountain pen containing a microscopic glass microdot with state military codes.',
  'Hollow pen microdot',
  'Stolen State Microdot',
  '["Diamond","Cocaine","Cyanide pill"]'::jsonb,
  'Hollow pen microdot',
  '["hollow pen microdot","microdot","pen microdot","hollow pen","stolen microdot"]'::jsonb,
  'High-level spy intelligence stolen from Arthur’s suite.',
  'ev_8',
  false,
  '{"descriptions":["Vance searches Elena’s diplomatic pouch in the hotel lounge.","At 12:45 AM: Vance searches Elena’s diplomatic pouch in the hotel lounge.","Notice this clue: Vance searches Elena’s diplomatic pouch in the hotel lounge."],"hints":["High-level spy intelligence stolen from Arthur’s suite.","Clue hint: Think about hollow pen microdot.","Search for: a fountain pen containing a microscopic glass microdot with state military codes."],"clues":["Hollow pen microdot","Item: Hollow pen microdot","Clue Word: Hollow pen microdot"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '139ec65e-a634-5fde-a50e-5e35a236751c',
  'story_105',
  'ev_8',
  8,
  '01:00 AM',
  'Elena is detained by federal counter-intelligence agents.',
  'Elena is detained by federal counter-intelligence agents.',
  'Elena’s full confession of the targeted political assassination.',
  'Elena’s confession',
  'Espionage Confession Record',
  '["Diplomatic immunity plea","Silence","Escape attempt"]'::jsonb,
  'Elena’s confession',
  '["elena’s confession","confession","elena confession","espionage confession","admission"]'::jsonb,
  'Full admission of using contact nerve toxin to murder the defector.',
  NULL,
  true,
  '{"descriptions":["Elena is detained by federal counter-intelligence agents.","At 01:00 AM: Elena is detained by federal counter-intelligence agents.","Notice this clue: Elena is detained by federal counter-intelligence agents."],"hints":["Full admission of using contact nerve toxin to murder the defector.","Clue hint: Think about elena’s confession.","Search for: elena’s full confession of the targeted political assassination."],"clues":["Elena’s confession","Item: Elena’s confession","Clue Word: Elena’s confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_106 — THE VANISHING MAGICIAN
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_106',
  'The Vanishing Magician',
  'Dark Mystery',
  'The grand stage of the Majestic Illusion Theater, red velvet curtains, stage lights, trapdoors, and mirrors',
  'At the grand climax of his famous vanishing cabinet illusion, the master magician vanished into thin air, but when the trapdoor below was opened, only his blood-stained top hat and a severed rope remained.',
  '[{"name":"Marcus Cole","role":"Understudy & Assistant","alibi":"Holding the cabinet curtain on the left side of the stage","avatar":"🎩"},{"name":"The Great Alonzo (Victim)","role":"World-Renowned Illusionist","alibi":"Murdered beneath the stage during the 09:00 PM show","avatar":"🪄"},{"name":"Lily Vance","role":"Cabinet Assistant","alibi":"Holding the cabinet door open for the audience","avatar":"💃"},{"name":"Detective Raymond Cross","role":"Theatrical Crimes Detective","alibi":"Seated in row 4 of the theater auditorium","avatar":"🔍"}]'::jsonb,
  'Understudy Marcus Cole sabotaged the mechanical slide beneath the stage trapdoor. When master magician Alonzo stepped through the false bottom into the dark chute, an eight-hundred-pound counterweight released by Marcus crushed him instantly. Marcus dragged the body into the theater furnace boiler and threw the bloodied top hat back onto the stage floor.',
  'Stage Assistant & Understudy Marcus Cole',
  'Marcus wanted to steal the magician’s private notebook of patented illusions and take over the headline tour.',
  '[{"time":"07:30 PM","event":"Marcus rigs the counterweight winch above the trapdoor chute."},{"time":"08:30 PM","event":"Alonzo fires Marcus in his private dressing room for stealing trick designs."},{"time":"09:00 PM","event":"Alonzo steps into the vanishing cabinet on the brightly lit stage."},{"time":"09:02 PM","event":"Alonzo drops through the trapdoor; the counterweight crushes him in the pit."},{"time":"09:15 PM","event":"Detective Cross seals the stage and descends into the sub-stage machinery room."}]'::jsonb,
  '[{"id":"ev_1","title":"Magician’s Bloody Hat","detail":"Alonzo’s silk top hat saturated with fresh blood thrown onto the stage floor."},{"id":"ev_2","title":"Bloodied Counterweight","detail":"Eight-hundred-pound iron weight positioned beneath the trapdoor with victim blood."},{"id":"ev_3","title":"Grease-Stained Stage Gloves","detail":"Marcus Cole’s white gloves coated in winch cable grease and victim blood."},{"id":"ev_4","title":"Stolen Book of Illusions","detail":"Alonzo’s proprietary illusion design ledger found in Marcus Cole’s personal bag."}]'::jsonb,
  '[{"order":1,"title":"Bloodstained silk top hat","text":"Proves the disappearance was a violent murder, not a successful illusion."},{"order":2,"title":"Severed safety wire","text":"Demonstrates calculated mechanical sabotage of the safety chute."},{"order":3,"title":"Crushing iron counterweight","text":"The lethal instrument rigged directly beneath the trapdoor."},{"order":4,"title":"Cable grease on gloves","text":"Forensic link placing Marcus at the winch mechanism before showtime."},{"order":5,"title":"Watch chain in furnace ash","text":"Locates the destroyed remains of the victim in the theater boiler."},{"order":6,"title":"Master illusion notebook","text":"The multi-million-dollar career motive driving the understudy to kill."}]'::jsonb,
  'Theater mirror reflection illusion: Mirrors were aligned normally for the cabinet trick.; Audience member who yelled during the trick: A drunk theater patron yelled, causing temporary distraction.',
  'Claim the magician was teleported into another dimension by real stage magic.',
  'NORMAL',
  'Did the illusion go horribly wrong in the mechanics, or was the magician murdered beneath the stage?',
  '[{"character":"Marcus Cole","secret":"Alonzo’s secret black leather grimoire of patented illusion blueprints in his dressing bag."},{"character":"The Great Alonzo (Victim)","secret":"He had fired Marcus this morning for stealing trade secrets."},{"character":"Lily Vance","secret":"She saw Marcus working under the stage with a heavy wrench before the show."},{"character":"Detective Raymond Cross","secret":"He was in the audience watching the show when the trick went wrong."}]'::jsonb,
  '[{"lead":"Theater mirror reflection illusion","explanation":"Mirrors were aligned normally for the cabinet trick."},{"lead":"Audience member who yelled during the trick","explanation":"A drunk theater patron yelled, causing temporary distraction."}]'::jsonb,
  '{"wrongTheories":["Alonzo teleported into another dimension through ancient magical arts.","The trapdoor snapped accidentally due to rusted stage hinges and fifty years of wear."],"correctTheory":"Marcus Cole cut the safety cable and rigged a counterweight to crush Alonzo so he could steal his secret illusion book."}'::jsonb,
  'Understudy Marcus Cole rigged an 800-pound counterweight beneath the trapdoor to crush Alonzo and steal his illusion designs.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Marcus was convicted of premeditated murder and sentenced to hang, while Alonzo’s assistant published his secrets honorably."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The show tour was taken over by Marcus, who became a famous headliner while Alonzo’s body was never found."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The theater was condemned as cursed, turning the murder into a ghost legend while the killer went free."}]'::jsonb,
  '{"intros":["At the grand climax of his famous vanishing cabinet illusion, the master magician vanished into thin air, but when the trapdoor below was opened, only his blood-stained top hat and a severed rope remained.","Case file story_106: At the grand climax of his famous vanishing cabinet illusion, the master magician vanished into thin air, but when the trapdoor below was opened, only his blood-stained top hat and a severed rope remained. Look closely at every clue.","Trouble begins in The grand stage of the Majestic Illusion Theater, red velvet curtains, stage lights, trapdoors, and mirrors. At the grand climax of his famous vanishing cabinet illusion, the master magician vanished into thin air, but when the trapdoor below was opened, only his blood-stained top hat and a severed rope remained.","The mystery starts now. At the grand climax of his famous vanishing cabinet illusion, the master magician vanished into thin air, but when the trapdoor below was opened, only his blood-stained top hat and a severed rope remained. Can you solve it?"],"reveals":["Understudy Marcus Cole rigged an 800-pound counterweight beneath the trapdoor to crush Alonzo and steal his illusion designs.","The mystery is unraveled! Understudy Marcus Cole rigged an 800-pound counterweight beneath the trapdoor to crush Alonzo and steal his illusion designs.","At last, the truth comes out: Understudy Marcus Cole rigged an 800-pound counterweight beneath the trapdoor to crush Alonzo and steal his illusion designs.","Case resolved! Here is what happened: Understudy Marcus Cole rigged an 800-pound counterweight beneath the trapdoor to crush Alonzo and steal his illusion designs."],"hints":["Pay attention to where Stage Assistant & Understudy Marcus Cole was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_106';
DELETE FROM public.case_events WHERE case_id = 'story_106';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1518e7c7-be6e-5d64-94dc-02ee5b37aaeb',
  'story_106',
  'Marcus Cole',
  'Understudy & Assistant',
  'Ambitious, slick hair, tuxedo with stage glitter, quick hands, rehearsed theatrical smile',
  'Alonzo was a true sorcerer. He stepped through the cabinet and the universe swallowed him whole!',
  'Alonzo’s secret black leather grimoire of patented illusion blueprints in his dressing bag.',
  'Holding the cabinet curtain on the left side of the stage',
  'Understudy to master illusionist Alonzo',
  'The trapdoor chute drops thirty feet directly into the sub-stage machinery pit.',
  'Did not know the stage grease on his white gloves matched the counterweight winch cable.',
  '🎩',
  '["Alonzo was a true sorcerer. He stepped through the cabinet and the universe swallowed him whole!","\"Alonzo was a true sorcerer. He stepped through the cabinet and the universe swallowed him whole!\"","Listen to me: Alonzo was a true sorcerer. He stepped through the cabinet and the universe swallowed him whole!","I tell you the truth: Alonzo was a true sorcerer. He stepped through the cabinet and the universe swallowed him whole!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c775024c-e027-5ef4-beef-f19ec428cd65',
  'story_106',
  'The Great Alonzo (Victim)',
  'World-Renowned Illusionist',
  'Charismatic, flamboyant, body incinerated in the theater boiler furnace',
  'Deceased victim; his final program note said: "Tonight, I reveal the greatest illusion of death itself."',
  'He had fired Marcus this morning for stealing trade secrets.',
  'Murdered beneath the stage during the 09:00 PM show',
  'Star of the Majestic Theater',
  'Marcus had been copying his secret mirror angles.',
  'Did not expect his safety slide was sabotaged with an iron counterweight.',
  '🪄',
  '["Deceased victim; his final program note said: \"Tonight, I reveal the greatest illusion of death itself.\"","\"Deceased victim; his final program note said: \"Tonight, I reveal the greatest illusion of death itself.\"\"","Listen to me: Deceased victim; his final program note said: \"Tonight, I reveal the greatest illusion of death itself.\"","I tell you the truth: Deceased victim; his final program note said: \"Tonight, I reveal the greatest illusion of death itself.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ba1db032-a6ec-52b5-8c99-883381d43f03',
  'story_106',
  'Lily Vance',
  'Cabinet Assistant',
  'Sequined stage leotard, terrified, trembling voice, clutching the cabinet silk',
  'I heard a terrible metal crunching sound under the stage the second Alonzo stepped through the floor.',
  'She saw Marcus working under the stage with a heavy wrench before the show.',
  'Holding the cabinet door open for the audience',
  'Stage assistant on the illusion team',
  'Alonzo always dropped onto a soft feather mattress slide.',
  'Did not know Marcus had replaced the mattress with an iron counterweight trap.',
  '💃',
  '["I heard a terrible metal crunching sound under the stage the second Alonzo stepped through the floor.","\"I heard a terrible metal crunching sound under the stage the second Alonzo stepped through the floor.\"","Listen to me: I heard a terrible metal crunching sound under the stage the second Alonzo stepped through the floor.","I tell you the truth: I heard a terrible metal crunching sound under the stage the second Alonzo stepped through the floor."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '8993d644-5150-5f5e-9e53-2d33fef8bb89',
  'story_106',
  'Detective Raymond Cross',
  'Theatrical Crimes Detective',
  'Sharp, dry, carrying magnifying glass and stage schematics, skeptical of magic',
  'There are no miracles on stage—only levers, cables, mirrors, and greedy men.',
  'He was in the audience watching the show when the trick went wrong.',
  'Seated in row 4 of the theater auditorium',
  'Eyewitness and investigating detective',
  'The trapdoor showed fresh human blood and severed steel cable strands.',
  'Did not know where Alonzo’s body had been taken until checking the boiler.',
  '🔍',
  '["There are no miracles on stage—only levers, cables, mirrors, and greedy men.","\"There are no miracles on stage—only levers, cables, mirrors, and greedy men.\"","Listen to me: There are no miracles on stage—only levers, cables, mirrors, and greedy men.","I tell you the truth: There are no miracles on stage—only levers, cables, mirrors, and greedy men."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c2af27e4-cbcf-5028-9a6e-04e710200007',
  'story_106',
  'ev_1',
  1,
  '09:02 PM',
  'The cabinet opens empty, with a bloodied top hat tossed out.',
  'The cabinet opens empty, with a bloodied top hat tossed out.',
  'Alonzo’s black silk top hat stained with fresh arterial blood on the rim.',
  'Bloodstained silk top hat',
  'Magician’s Bloody Hat',
  '["White rabbit","Silk scarf","Wand"]'::jsonb,
  'Bloodstained silk top hat',
  '["bloodstained silk top hat","top hat","bloody hat","bloodstained hat","silk hat"]'::jsonb,
  'The magician’s iconic stage headwear covered in fresh blood.',
  'ev_2',
  true,
  '{"descriptions":["The cabinet opens empty, with a bloodied top hat tossed out.","At 09:02 PM: The cabinet opens empty, with a bloodied top hat tossed out.","Notice this clue: The cabinet opens empty, with a bloodied top hat tossed out."],"hints":["The magician’s iconic stage headwear covered in fresh blood.","Clue hint: Think about bloodstained silk top hat.","Search for: alonzo’s black silk top hat stained with fresh arterial blood on the rim."],"clues":["Bloodstained silk top hat","Item: Bloodstained silk top hat","Clue Word: Bloodstained silk top hat"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c71500ee-4a21-530a-ba80-4fa6e298f68f',
  'story_106',
  'ev_2',
  2,
  '09:15 PM',
  'Detective Cross inspects the cabinet floor.',
  'Detective Cross inspects the cabinet floor.',
  'A trapdoor mechanism with a severed steel tension safety wire.',
  'Severed safety wire',
  'Sabotaged Trapdoor Cable',
  '["Rusted hinge","Jammed latch","Broken wood"]'::jsonb,
  'Severed safety wire',
  '["severed safety wire","safety wire","severed wire","trapdoor cable","cut cable"]'::jsonb,
  'Cable deliberately cut to disable the soft landing slide.',
  'ev_3',
  false,
  '{"descriptions":["Detective Cross inspects the cabinet floor.","At 09:15 PM: Detective Cross inspects the cabinet floor.","Notice this clue: Detective Cross inspects the cabinet floor."],"hints":["Cable deliberately cut to disable the soft landing slide.","Clue hint: Think about severed safety wire.","Search for: a trapdoor mechanism with a severed steel tension safety wire."],"clues":["Severed safety wire","Item: Severed safety wire","Clue Word: Severed safety wire"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '538c55f8-d000-5d74-a56f-990d7e1f74dc',
  'story_106',
  'ev_3',
  3,
  '09:30 PM',
  'Cross descends into the sub-stage machinery pit.',
  'Cross descends into the sub-stage machinery pit.',
  'An eight-hundred-pound iron scenery counterweight smeared with blood.',
  'Crushing iron counterweight',
  'Bloodied Counterweight',
  '["Feather mattress","Cardboard box","Safety net"]'::jsonb,
  'Crushing iron counterweight',
  '["crushing iron counterweight","counterweight","iron counterweight","crushing weight","bloodied weight"]'::jsonb,
  'Massive iron stage weight used to crush the magician as he dropped.',
  'ev_4',
  false,
  '{"descriptions":["Cross descends into the sub-stage machinery pit.","At 09:30 PM: Cross descends into the sub-stage machinery pit.","Notice this clue: Cross descends into the sub-stage machinery pit."],"hints":["Massive iron stage weight used to crush the magician as he dropped.","Clue hint: Think about crushing iron counterweight.","Search for: an eight-hundred-pound iron scenery counterweight smeared with blood."],"clues":["Crushing iron counterweight","Item: Crushing iron counterweight","Clue Word: Crushing iron counterweight"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '643a10ff-bf17-595e-afb3-4af565442fbd',
  'story_106',
  'ev_4',
  4,
  '09:45 PM',
  'Cross inspects Marcus’s formal white stage gloves.',
  'Cross inspects Marcus’s formal white stage gloves.',
  'Black industrial cable grease and blood spatters on Marcus’s fingertips.',
  'Cable grease on gloves',
  'Grease-Stained Stage Gloves',
  '["Chalk","Powder","Ink"]'::jsonb,
  'Cable grease on gloves',
  '["cable grease on gloves","cable grease","grease on gloves","stage gloves","stained gloves"]'::jsonb,
  'Heavy winch grease matching the sabotaged counterweight cable on Marcus.',
  'ev_5',
  false,
  '{"descriptions":["Cross inspects Marcus’s formal white stage gloves.","At 09:45 PM: Cross inspects Marcus’s formal white stage gloves.","Notice this clue: Cross inspects Marcus’s formal white stage gloves."],"hints":["Heavy winch grease matching the sabotaged counterweight cable on Marcus.","Clue hint: Think about cable grease on gloves.","Search for: black industrial cable grease and blood spatters on marcus’s fingertips."],"clues":["Cable grease on gloves","Item: Cable grease on gloves","Clue Word: Cable grease on gloves"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '09bf28fc-b869-582c-a3da-7a620741fbe3',
  'story_106',
  'ev_5',
  5,
  '10:00 PM',
  'Assistant Lily shows Cross the basement boiler room.',
  'Assistant Lily shows Cross the basement boiler room.',
  'The theater coal furnace burning hot with Alonzo’s gold pocket watch chain in the ash.',
  'Watch chain in furnace ash',
  'Furnace Gold Chain',
  '["Coal lump","Charred wood","Iron bolt"]'::jsonb,
  'Watch chain in furnace ash',
  '["watch chain in furnace ash","watch chain","furnace chain","gold chain","furnace ash"]'::jsonb,
  'The master magician’s melted gold chain recovered from the incinerator.',
  'ev_6',
  true,
  '{"descriptions":["Assistant Lily shows Cross the basement boiler room.","At 10:00 PM: Assistant Lily shows Cross the basement boiler room.","Notice this clue: Assistant Lily shows Cross the basement boiler room."],"hints":["The master magician’s melted gold chain recovered from the incinerator.","Clue hint: Think about watch chain in furnace ash.","Search for: the theater coal furnace burning hot with alonzo’s gold pocket watch chain in the ash."],"clues":["Watch chain in furnace ash","Item: Watch chain in furnace ash","Clue Word: Watch chain in furnace ash"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4ddc5571-0891-5555-9f66-40df27bd685e',
  'story_106',
  'ev_6',
  6,
  '10:15 PM',
  'Cross searches Marcus’s leather dressing bag.',
  'Cross searches Marcus’s leather dressing bag.',
  'Alonzo’s handwritten master secret book of illusions and stage patents.',
  'Master illusion notebook',
  'Stolen Book of Illusions',
  '["Makeup kit","Script","Costume"]'::jsonb,
  'Master illusion notebook',
  '["master illusion notebook","illusion notebook","book of illusions","stolen book","notebook"]'::jsonb,
  'Priceless notebook containing the proprietary engineering behind all of Alonzo’s tricks.',
  'ev_7',
  false,
  '{"descriptions":["Cross searches Marcus’s leather dressing bag.","At 10:15 PM: Cross searches Marcus’s leather dressing bag.","Notice this clue: Cross searches Marcus’s leather dressing bag."],"hints":["Priceless notebook containing the proprietary engineering behind all of Alonzo’s tricks.","Clue hint: Think about master illusion notebook.","Search for: alonzo’s handwritten master secret book of illusions and stage patents."],"clues":["Master illusion notebook","Item: Master illusion notebook","Clue Word: Master illusion notebook"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bdb8eb5f-6e4a-5a5e-bf25-9d8add9a0d2d',
  'story_106',
  'ev_7',
  7,
  '10:30 PM',
  'Cross inspects Alonzo’s dressing room wastebasket.',
  'Cross inspects Alonzo’s dressing room wastebasket.',
  'A signed termination notice firing Marcus Cole for corporate espionage.',
  'Termination notice',
  'Fired Assistant Notice',
  '["Fan letter","Theater bill","Telegram"]'::jsonb,
  'Termination notice',
  '["termination notice","fired notice","firing letter","notice"]'::jsonb,
  'Proof that Alonzo fired Marcus two hours before the performance.',
  'ev_8',
  false,
  '{"descriptions":["Cross inspects Alonzo’s dressing room wastebasket.","At 10:30 PM: Cross inspects Alonzo’s dressing room wastebasket.","Notice this clue: Cross inspects Alonzo’s dressing room wastebasket."],"hints":["Proof that Alonzo fired Marcus two hours before the performance.","Clue hint: Think about termination notice.","Search for: a signed termination notice firing marcus cole for corporate espionage."],"clues":["Termination notice","Item: Termination notice","Clue Word: Termination notice"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '24cf6f5d-2479-5652-8693-4344b5278800',
  'story_106',
  'ev_8',
  8,
  '10:45 PM',
  'Marcus breaks down under interrogation in the theater wings.',
  'Marcus breaks down under interrogation in the theater wings.',
  'Marcus’s confession admitting he sabotaged the chute to inherit the show.',
  'Marcus’s confession',
  'Signed Murder Confession',
  '["Magic trick claim","Denial","Silence"]'::jsonb,
  'Marcus’s confession',
  '["marcus’s confession","confession","marcus confession","signed confession","admission"]'::jsonb,
  'Full admission of staging the deadly cabinet sabotage.',
  NULL,
  true,
  '{"descriptions":["Marcus breaks down under interrogation in the theater wings.","At 10:45 PM: Marcus breaks down under interrogation in the theater wings.","Notice this clue: Marcus breaks down under interrogation in the theater wings."],"hints":["Full admission of staging the deadly cabinet sabotage.","Clue hint: Think about marcus’s confession.","Search for: marcus’s confession admitting he sabotaged the chute to inherit the show."],"clues":["Marcus’s confession","Item: Marcus’s confession","Clue Word: Marcus’s confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_107 — THE SEALED WELL OF RAVEN HILL
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_107',
  'The Sealed Well of Raven Hill',
  'Dark Mystery',
  'The overgrown courtyard of the abandoned Raven Hill Asylum, crumbling stone walls, tangled briars, and a heavy wooden well cover',
  'A heavy iron chain bound around an old stone well was found padlocked shut, but fresh red rope hung over the rim, leading forty feet down into the dark water where a flashlight still glowed.',
  '[{"name":"Silas Vance","role":"Asylum Caretaker","alibi":"In the caretaker’s cottage at the front gate","avatar":"🗝️"},{"name":"Clara Moore (Victim)","role":"Investigative Reporter","alibi":"Trapped in the bottom of the 40-foot well","avatar":"🔦"},{"name":"Officer David Ross","role":"County Sheriff’s Deputy","alibi":"First officer on the asylum courtyard scene","avatar":"👮‍♂️"},{"name":"Dr. Evelyn Hayes","role":"Paramedic & Rescuer","alibi":"Arrived with the ambulance rescue team","avatar":"🚑"}]'::jsonb,
  'Journalist Clara Moore broke into the abandoned asylum to find buried historical patient ledgers. Caretaker Silas Vance, who had guarded the site’s dark secrets for decades, ambushed Clara, shoved her down the forty-foot well shaft, and padlocked the heavy timber cover to drown and starve her in the dark.',
  'Asylum Caretaker Silas Vance',
  'Silas wanted to prevent an investigative journalist from uncovering sixty years of buried patient abuse records.',
  '[{"time":"08:00 PM","event":"Clara arrives at Raven Hill and discovers the secret patient archive."},{"time":"08:45 PM","event":"Clara explores the courtyard well where old medical instruments were dumped."},{"time":"09:00 PM","event":"Silas attacks Clara from behind, shoving her forty feet down the shaft."},{"time":"09:05 PM","event":"Silas throws the timber cover over the well, wraps the chain, and clicks the padlock."},{"time":"10:15 PM","event":"Deputy Ross spots Clara’s abandoned car and investigates the courtyard."}]'::jsonb,
  '[{"id":"ev_1","title":"Padlocked Well Chains","detail":"Heavy iron chains and padlock used to seal the timber cover over the forty-foot well."},{"id":"ev_2","title":"Audio Ambush Recording","detail":"Digital voice file capturing Silas shouting threats and the lid slamming shut."},{"id":"ev_3","title":"Well Key in Tobacco Pouch","detail":"Brass key recovered from Silas Vance’s pouch operating the well padlock."},{"id":"ev_4","title":"Historical Patient Ledger","detail":"Recovered asylum archive detailing historical atrocities that Silas sought to hide."}]'::jsonb,
  '[{"order":1,"title":"Glowing well flashlight","text":"Alerted responders to the presence of a living human in the well."},{"order":2,"title":"Locked well padlock","text":"Proves the well was deliberately sealed from the outside by another person."},{"order":3,"title":"Trapped journalist rescue","text":"Living eyewitness victim who directly identifies her attacker."},{"order":4,"title":"Asylum abuse ledger","text":"The dark historical motive driving the caretaker to murder."},{"order":5,"title":"Recorded threat audio","text":"Irrefutable audio evidence of Silas committing the crime."},{"order":6,"title":"Padlock brass key","text":"Direct physical possession linking Silas to the sealed well."}]'::jsonb,
  'Local ghost stories of the weeping patient: Old asylum myths obscured real criminal activities on the grounds.; Rusted hospital gurneys in the courtyard: Normal abandoned hospital debris, unrelated to the well trap.',
  'Claim an asylum ghost lured the journalist into the well.',
  'NORMAL',
  'Who was trapped at the bottom of the asylum well, and why was the well locked from the outside?',
  '[{"character":"Silas Vance","secret":"The brass padlock key hidden inside his tobacco pipe pouch."},{"character":"Clara Moore (Victim)","secret":"She tucked the asylum patient ledger inside her waterproof chest pouch."},{"character":"Officer David Ross","secret":"He responded to Clara’s missing vehicle parked on the dirt road."},{"character":"Dr. Evelyn Hayes","secret":"She was called by the sheriff’s dispatch for confined-space rescue."}]'::jsonb,
  '[{"lead":"Local ghost stories of the weeping patient","explanation":"Old asylum myths obscured real criminal activities on the grounds."},{"lead":"Rusted hospital gurneys in the courtyard","explanation":"Normal abandoned hospital debris, unrelated to the well trap."}]'::jsonb,
  '{"wrongTheories":["Clara lost her footing and accidentally fell down the well while taking photographs.","A malevolent spirit pushed Clara down the well to protect the asylum’s secrets."],"correctTheory":"Caretaker Silas Vance pushed Clara down the forty-foot well and padlocked the cover to silence her from exposing the asylum’s abuse records."}'::jsonb,
  'Caretaker Silas Vance pushed Clara down the well and locked the timber cover to bury sixty years of horrific asylum abuse records.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Clara was safely rescued and hospitalized, Silas was convicted of attempted murder, and the asylum records were published."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Deputy Ross left without checking the well, leaving Clara to drown in freezing water in the dark."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The asylum was demolished over the well, burying Clara and the historical secrets beneath tons of rubble."}]'::jsonb,
  '{"intros":["A heavy iron chain bound around an old stone well was found padlocked shut, but fresh red rope hung over the rim, leading forty feet down into the dark water where a flashlight still glowed.","Case file story_107: A heavy iron chain bound around an old stone well was found padlocked shut, but fresh red rope hung over the rim, leading forty feet down into the dark water where a flashlight still glowed. Look closely at every clue.","Trouble begins in The overgrown courtyard of the abandoned Raven Hill Asylum, crumbling stone walls, tangled briars, and a heavy wooden well cover. A heavy iron chain bound around an old stone well was found padlocked shut, but fresh red rope hung over the rim, leading forty feet down into the dark water where a flashlight still glowed.","The mystery starts now. A heavy iron chain bound around an old stone well was found padlocked shut, but fresh red rope hung over the rim, leading forty feet down into the dark water where a flashlight still glowed. Can you solve it?"],"reveals":["Caretaker Silas Vance pushed Clara down the well and locked the timber cover to bury sixty years of horrific asylum abuse records.","The mystery is unraveled! Caretaker Silas Vance pushed Clara down the well and locked the timber cover to bury sixty years of horrific asylum abuse records.","At last, the truth comes out: Caretaker Silas Vance pushed Clara down the well and locked the timber cover to bury sixty years of horrific asylum abuse records.","Case resolved! Here is what happened: Caretaker Silas Vance pushed Clara down the well and locked the timber cover to bury sixty years of horrific asylum abuse records."],"hints":["Pay attention to where Asylum Caretaker Silas Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_107';
DELETE FROM public.case_events WHERE case_id = 'story_107';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0cdb8962-0e91-5c10-9665-236440367cb1',
  'story_107',
  'Silas Vance',
  'Asylum Caretaker',
  'Weathered hermit, dirty canvas jacket, heavy steel keyring, hollow sunken eyes, holding shotgun',
  'I lock the well every night to keep trespassers from falling in. That girl must have broken the lock herself!',
  'The brass padlock key hidden inside his tobacco pipe pouch.',
  'In the caretaker’s cottage at the front gate',
  'Caretaker of Raven Hill Asylum grounds for forty years',
  'The water at the bottom of the well is ten feet deep and freezing cold.',
  'Did not know Clara’s audio recorder was still recording at the bottom of the shaft.',
  '🗝️',
  '["I lock the well every night to keep trespassers from falling in. That girl must have broken the lock herself!","\"I lock the well every night to keep trespassers from falling in. That girl must have broken the lock herself!\"","Listen to me: I lock the well every night to keep trespassers from falling in. That girl must have broken the lock herself!","I tell you the truth: I lock the well every night to keep trespassers from falling in. That girl must have broken the lock herself!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '571c5715-2105-54b7-b0f8-2cc05b42efc2',
  'story_107',
  'Clara Moore (Victim)',
  'Investigative Reporter',
  'Trapped at the bottom of the well, clinging to a slippery stone ledge in freezing water',
  'Survivor shouting from the deep: "Silas locked the top! He threw the wood cover over my head!"',
  'She tucked the asylum patient ledger inside her waterproof chest pouch.',
  'Trapped in the bottom of the 40-foot well',
  'Journalist investigating historical crimes',
  'Silas’s father had operated illegal medical experiments at the asylum.',
  'Did not hear Silas creeping through the briars behind her.',
  '🔦',
  '["Survivor shouting from the deep: \"Silas locked the top! He threw the wood cover over my head!\"","\"Survivor shouting from the deep: \"Silas locked the top! He threw the wood cover over my head!\"\"","Listen to me: Survivor shouting from the deep: \"Silas locked the top! He threw the wood cover over my head!\"","I tell you the truth: Survivor shouting from the deep: \"Silas locked the top! He threw the wood cover over my head!\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1dd848ed-6d22-5898-995c-b5e4a6ba1e24',
  'story_107',
  'Officer David Ross',
  'County Sheriff’s Deputy',
  'Young, athletic, tactical vest, carrying high-powered searchlights and rope harnesses',
  'A padlock doesn’t lock itself around a heavy timber well cover while a rope is tied to the rim.',
  'He responded to Clara’s missing vehicle parked on the dirt road.',
  'First officer on the asylum courtyard scene',
  'Responding law officer',
  'The padlock showed zero marks of prying; it was locked smoothly with a key.',
  'Did not know Silas had the key in his tobacco pouch.',
  '👮‍♂️',
  '["A padlock doesn’t lock itself around a heavy timber well cover while a rope is tied to the rim.","\"A padlock doesn’t lock itself around a heavy timber well cover while a rope is tied to the rim.\"","Listen to me: A padlock doesn’t lock itself around a heavy timber well cover while a rope is tied to the rim.","I tell you the truth: A padlock doesn’t lock itself around a heavy timber well cover while a rope is tied to the rim."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '064f5d96-9982-5dc8-90b1-77ccd4284373',
  'story_107',
  'Dr. Evelyn Hayes',
  'Paramedic & Rescuer',
  'Professional, thermal blankets, emergency medical kit, focused on saving the victim',
  'Hypothermia sets in within two hours in water that cold. We have minutes to haul her up.',
  'She was called by the sheriff’s dispatch for confined-space rescue.',
  'Arrived with the ambulance rescue team',
  'Medical rescue personnel',
  'Clara has a fractured shoulder from the forty-foot fall down the shaft.',
  'Did not know why Clara was investigating the asylum.',
  '🚑',
  '["Hypothermia sets in within two hours in water that cold. We have minutes to haul her up.","\"Hypothermia sets in within two hours in water that cold. We have minutes to haul her up.\"","Listen to me: Hypothermia sets in within two hours in water that cold. We have minutes to haul her up.","I tell you the truth: Hypothermia sets in within two hours in water that cold. We have minutes to haul her up."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '38fa0e0e-cec6-5897-80e0-8ff46e31eb33',
  'story_107',
  'ev_1',
  1,
  '10:15 PM',
  'Deputy Ross spots a glowing light forty feet down the locked well.',
  'Deputy Ross spots a glowing light forty feet down the locked well.',
  'A high-powered flashlight beam illuminating water at the bottom of the well.',
  'Glowing well flashlight',
  'Submerged Flashlight Beam',
  '["Candle light","Phosphor moss","Reflection"]'::jsonb,
  'Glowing well flashlight',
  '["glowing well flashlight","flashlight","well flashlight","glowing light","flashlight beam"]'::jsonb,
  'Electric waterproof torch shining from the deep water below.',
  'ev_2',
  true,
  '{"descriptions":["Deputy Ross spots a glowing light forty feet down the locked well.","At 10:15 PM: Deputy Ross spots a glowing light forty feet down the locked well.","Notice this clue: Deputy Ross spots a glowing light forty feet down the locked well."],"hints":["Electric waterproof torch shining from the deep water below.","Clue hint: Think about glowing well flashlight.","Search for: a high-powered flashlight beam illuminating water at the bottom of the well."],"clues":["Glowing well flashlight","Item: Glowing well flashlight","Clue Word: Glowing well flashlight"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cbdfbb99-87e5-58e6-9843-a9d390e0fe2c',
  'story_107',
  'ev_2',
  2,
  '10:20 PM',
  'Ross inspects the heavy timber well cover.',
  'Ross inspects the heavy timber well cover.',
  'A hardened steel padlock snapped shut around heavy iron chains.',
  'Locked well padlock',
  'Padlocked Well Chains',
  '["Rusted latch","Tied rope","Nailed wood"]'::jsonb,
  'Locked well padlock',
  '["locked well padlock","padlock","locked padlock","well padlock","padlocked chains"]'::jsonb,
  'Heavy lock keeping the timber lid sealed shut over the trapped journalist.',
  'ev_3',
  false,
  '{"descriptions":["Ross inspects the heavy timber well cover.","At 10:20 PM: Ross inspects the heavy timber well cover.","Notice this clue: Ross inspects the heavy timber well cover."],"hints":["Heavy lock keeping the timber lid sealed shut over the trapped journalist.","Clue hint: Think about locked well padlock.","Search for: a hardened steel padlock snapped shut around heavy iron chains."],"clues":["Locked well padlock","Item: Locked well padlock","Clue Word: Locked well padlock"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '80df21f9-b68b-580a-b6dc-1e70a1e86b30',
  'story_107',
  'ev_3',
  3,
  '10:30 PM',
  'Ross cuts the padlock with bolt cutters and lowers a rescue line.',
  'Ross cuts the padlock with bolt cutters and lowers a rescue line.',
  'Clara Moore clinging to a stone ledge with a dislocated shoulder.',
  'Trapped journalist rescue',
  'Rescued Victim Statement',
  '["Empty water","Skeleton","Doll"]'::jsonb,
  'Trapped journalist rescue',
  '["trapped journalist rescue","clara rescue","victim rescue","rescued victim","trapped journalist"]'::jsonb,
  'Living victim pulled from the freezing water by the rescue team.',
  'ev_4',
  false,
  '{"descriptions":["Ross cuts the padlock with bolt cutters and lowers a rescue line.","At 10:30 PM: Ross cuts the padlock with bolt cutters and lowers a rescue line.","Notice this clue: Ross cuts the padlock with bolt cutters and lowers a rescue line."],"hints":["Living victim pulled from the freezing water by the rescue team.","Clue hint: Think about trapped journalist rescue.","Search for: clara moore clinging to a stone ledge with a dislocated shoulder."],"clues":["Trapped journalist rescue","Item: Trapped journalist rescue","Clue Word: Trapped journalist rescue"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '913627de-e950-5a76-96cb-f925bf216469',
  'story_107',
  'ev_4',
  4,
  '10:45 PM',
  'Dr. Hayes examines Clara’s waterproof backpack.',
  'Dr. Hayes examines Clara’s waterproof backpack.',
  'Historical asylum ledgers documenting illegal lobotomies and hidden deaths.',
  'Asylum abuse ledger',
  'Historical Patient Ledger',
  '["Diary","Camera","Map"]'::jsonb,
  'Asylum abuse ledger',
  '["asylum abuse ledger","abuse ledger","patient ledger","asylum ledger","ledger"]'::jsonb,
  'Stolen records proving decades of horrific crimes at the institution.',
  'ev_5',
  false,
  '{"descriptions":["Dr. Hayes examines Clara’s waterproof backpack.","At 10:45 PM: Dr. Hayes examines Clara’s waterproof backpack.","Notice this clue: Dr. Hayes examines Clara’s waterproof backpack."],"hints":["Stolen records proving decades of horrific crimes at the institution.","Clue hint: Think about asylum abuse ledger.","Search for: historical asylum ledgers documenting illegal lobotomies and hidden deaths."],"clues":["Asylum abuse ledger","Item: Asylum abuse ledger","Clue Word: Asylum abuse ledger"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a7977da6-9441-5b82-8a64-d82ebd237d22',
  'story_107',
  'ev_5',
  5,
  '11:00 PM',
  'Clara hands Deputy Ross her digital voice recorder.',
  'Clara hands Deputy Ross her digital voice recorder.',
  'Audio recording of Silas’s voice shouting: "You’ll drown down there, girl!"',
  'Recorded threat audio',
  'Audio Ambush Recording',
  '["Static","Music","Wind noise"]'::jsonb,
  'Recorded threat audio',
  '["recorded threat audio","threat audio","recorded audio","audio recording","ambush recording"]'::jsonb,
  'First-person sound recording capturing Silas shoving Clara and locking the lid.',
  'ev_6',
  true,
  '{"descriptions":["Clara hands Deputy Ross her digital voice recorder.","At 11:00 PM: Clara hands Deputy Ross her digital voice recorder.","Notice this clue: Clara hands Deputy Ross her digital voice recorder."],"hints":["First-person sound recording capturing Silas shoving Clara and locking the lid.","Clue hint: Think about recorded threat audio.","Search for: audio recording of silas’s voice shouting: \"you’ll drown down there, girl!\""],"clues":["Recorded threat audio","Item: Recorded threat audio","Clue Word: Recorded threat audio"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'dbbaf3d7-333a-5b42-b4df-27ac79d483e0',
  'story_107',
  'ev_6',
  6,
  '11:15 PM',
  'Ross searches Silas’s caretaker cabin.',
  'Ross searches Silas’s caretaker cabin.',
  'A brass key in Silas’s tobacco pouch matching the well padlock perfectly.',
  'Padlock brass key',
  'Well Key in Tobacco Pouch',
  '["Car key","House key","Watch key"]'::jsonb,
  'Padlock brass key',
  '["padlock brass key","brass key","well key","padlock key","key"]'::jsonb,
  'The physical key used to lock Clara in the well found on the caretaker.',
  'ev_7',
  false,
  '{"descriptions":["Ross searches Silas’s caretaker cabin.","At 11:15 PM: Ross searches Silas’s caretaker cabin.","Notice this clue: Ross searches Silas’s caretaker cabin."],"hints":["The physical key used to lock Clara in the well found on the caretaker.","Clue hint: Think about padlock brass key.","Search for: a brass key in silas’s tobacco pouch matching the well padlock perfectly."],"clues":["Padlock brass key","Item: Padlock brass key","Clue Word: Padlock brass key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a06e50ef-e838-56d4-8436-dd5330c3a502',
  'story_107',
  'ev_7',
  7,
  '11:30 PM',
  'Ross finds fresh red rope fibers under Silas’s fingernails.',
  'Ross finds fresh red rope fibers under Silas’s fingernails.',
  'Red nylon climbing fibers matching Clara’s rope caught in Silas’s hands.',
  'Red rope fibers on hands',
  'Forensic Fiber Match',
  '["Wood splinters","Soil","Tobacco flakes"]'::jsonb,
  'Red rope fibers on hands',
  '["red rope fibers on hands","rope fibers","red fibers","fiber match","fibers on hands"]'::jsonb,
  'Physical trace from Clara’s climbing rope transferred to the caretaker’s hands.',
  'ev_8',
  false,
  '{"descriptions":["Ross finds fresh red rope fibers under Silas’s fingernails.","At 11:30 PM: Ross finds fresh red rope fibers under Silas’s fingernails.","Notice this clue: Ross finds fresh red rope fibers under Silas’s fingernails."],"hints":["Physical trace from Clara’s climbing rope transferred to the caretaker’s hands.","Clue hint: Think about red rope fibers on hands.","Search for: red nylon climbing fibers matching clara’s rope caught in silas’s hands."],"clues":["Red rope fibers on hands","Item: Red rope fibers on hands","Clue Word: Red rope fibers on hands"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4377c33e-dbc8-53c1-9c86-e97b35f5d55e',
  'story_107',
  'ev_8',
  8,
  '11:45 PM',
  'Silas Vance is handcuffed and placed in the sheriff’s cruiser.',
  'Silas Vance is handcuffed and placed in the sheriff’s cruiser.',
  'Silas’s full confession that he tried to drown Clara to protect the family name.',
  'Caretaker confession',
  'Signed Attempted Murder Confession',
  '["Denial","Self-defense claim","Silence"]'::jsonb,
  'Caretaker confession',
  '["caretaker confession","confession","silas confession","admission"]'::jsonb,
  'Full admission of attempted murder and unlawful imprisonment.',
  NULL,
  true,
  '{"descriptions":["Silas Vance is handcuffed and placed in the sheriff’s cruiser.","At 11:45 PM: Silas Vance is handcuffed and placed in the sheriff’s cruiser.","Notice this clue: Silas Vance is handcuffed and placed in the sheriff’s cruiser."],"hints":["Full admission of attempted murder and unlawful imprisonment.","Clue hint: Think about caretaker confession.","Search for: silas’s full confession that he tried to drown clara to protect the family name."],"clues":["Caretaker confession","Item: Caretaker confession","Clue Word: Caretaker confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_108 — THE DEAD MAN’S WATCH
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_108',
  'The Dead Man’s Watch',
  'Dark Mystery',
  'The riverbank marsh of Blackwood Creek, weeping willow branches, mud flats, buzzing insects, and murky brown water',
  'A drowned body was pulled from the river with an antique gold watch stopped at exactly 4:18 PM, but the coroner determined the man had already been dead for two days before the watch stopped.',
  '[{"name":"Walter Shaw","role":"Corrupt Business Partner","alibi":"Speaking on live television at the city council meeting at 4:18 PM","avatar":"👔"},{"name":"Arthur Vance (Victim)","role":"Slain Business Partner","alibi":"Murdered two days ago","avatar":"⌚"},{"name":"Dr. Rebecca Vance","role":"Forensic Medical Examiner","alibi":"Performing autopsy in the county morgue","avatar":"🔬"},{"name":"Detective Marcus Cole","role":"Homicide Detective","alibi":"Investigating the riverbank recovery site","avatar":"🕵️‍♂️"}]'::jsonb,
  'Walter Shaw murdered his business partner Arthur Vance forty-eight hours ago in an industrial freezer. Today at 4:00 PM, while Walter sat in a televised city council meeting, Walter’s accomplice threw the frozen body into the warm creek with the freshly wound watch, which flooded and stopped at 4:18 PM to manufacture a fake time of death.',
  'Business Partner Walter Shaw',
  'Walter wanted to establish an ironclad alibi by faking the victim’s time of death to match his business meeting.',
  '[{"time":"Two Days Ago - 08:00 PM","event":"Walter suffocates Arthur inside the Vance-Shaw meat locker facility."},{"time":"Two Days Ago - 09:00 PM","event":"Walter places Arthur’s body in a commercial blast freezer at zero degrees."},{"time":"Today - 03:30 PM","event":"Walter winds Arthur’s gold watch and gives the frozen body to an accomplice."},{"time":"Today - 04:00 PM","event":"Accomplice dumps the body in Blackwood Creek while Walter speaks on live TV."},{"time":"Today - 04:18 PM","event":"Muddy creek water enters the watch casing, stopping the gear train."}]'::jsonb,
  '[{"id":"ev_1","title":"Flooded Gold Watch","detail":"Pocket watch stopped at 4:18 PM by river water flooding the escapement."},{"id":"ev_2","title":"Histology Cold Freeze Report","detail":"Pathology findings showing the victim’s body was commercially frozen after death."},{"id":"ev_3","title":"Commercial Freezer Scene","detail":"Walk-in freezer at Walter’s warehouse containing Arthur’s blood and hair DNA."},{"id":"ev_4","title":"Signed Embezzlement Audit","detail":"Financial audit proving Arthur Vance was about to expose Walter’s multi-million fraud."}]'::jsonb,
  '[{"order":1,"title":"Gold watch stopped at 4:18","text":"The staged centerpiece of Walter’s artificial alibi."},{"order":2,"title":"Ice crystallization in tissue","text":"Shatters the claim that the victim died on the riverbank this afternoon."},{"order":3,"title":"Two-day decomposition timeline","text":"Establishes the true time of death as forty-eight hours prior."},{"order":4,"title":"Televised city council alibi","text":"Demonstrates how Walter used the watch time to manufacture an alibi."},{"order":5,"title":"Blast freezer blood DNA","text":"Physical forensic crime scene where the murder occurred."},{"order":6,"title":"Watch-winding key receipt","text":"Proves Walter wound the dead man’s watch immediately before the dump."}]'::jsonb,
  'River water temperature cooling effect: Cold water slows decay, but cannot create cellular ice crystallization.; Mud on the watch crystal face: Mud splashed naturally when the watch hit the riverbed.',
  'Claim river water currents kept the automatic pendulum watch wound for two days.',
  'NORMAL',
  'Why was the watch running for two days after the man died, and who set it to stop at 4:18 PM?',
  '[{"character":"Walter Shaw","secret":"A receipt for forty pounds of dry ice purchased three days ago from the cold storage depot."},{"character":"Arthur Vance (Victim)","secret":"He had signed an audit report accusing Walter of two million dollars of contract fraud."},{"character":"Dr. Rebecca Vance","secret":"She was a former colleague of Arthur’s late wife."},{"character":"Detective Marcus Cole","secret":"He had been investigating Vance-Shaw municipal kickbacks for six months."}]'::jsonb,
  '[{"lead":"River water temperature cooling effect","explanation":"Cold water slows decay, but cannot create cellular ice crystallization."},{"lead":"Mud on the watch crystal face","explanation":"Mud splashed naturally when the watch hit the riverbed."}]'::jsonb,
  '{"wrongTheories":["Arthur slipped and fell into the river at 4:00 PM and drowned naturally.","The watch had an automatic water-motion winding pendulum that kept it ticking while floating."],"correctTheory":"Walter Shaw killed Arthur two days ago, froze him, wound his watch, and dumped him in the river at 4:00 PM to forge an alibi during a TV council meeting."}'::jsonb,
  'Walter Shaw froze the murdered victim, wound the watch, and had it dumped in the river at 4:00 PM to match his live TV alibi.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Walter Shaw was convicted of first-degree premeditated murder, and the stolen company funds were returned."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The live TV alibi was accepted by the coroner, and Walter inherited the entire company without penalty."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The death was ruled an accidental river drowning, leaving the cleverest alibi in city history unbroken."}]'::jsonb,
  '{"intros":["A drowned body was pulled from the river with an antique gold watch stopped at exactly 4:18 PM, but the coroner determined the man had already been dead for two days before the watch stopped.","Case file story_108: A drowned body was pulled from the river with an antique gold watch stopped at exactly 4:18 PM, but the coroner determined the man had already been dead for two days before the watch stopped. Look closely at every clue.","Trouble begins in The riverbank marsh of Blackwood Creek, weeping willow branches, mud flats, buzzing insects, and murky brown water. A drowned body was pulled from the river with an antique gold watch stopped at exactly 4:18 PM, but the coroner determined the man had already been dead for two days before the watch stopped.","The mystery starts now. A drowned body was pulled from the river with an antique gold watch stopped at exactly 4:18 PM, but the coroner determined the man had already been dead for two days before the watch stopped. Can you solve it?"],"reveals":["Walter Shaw froze the murdered victim, wound the watch, and had it dumped in the river at 4:00 PM to match his live TV alibi.","The mystery is unraveled! Walter Shaw froze the murdered victim, wound the watch, and had it dumped in the river at 4:00 PM to match his live TV alibi.","At last, the truth comes out: Walter Shaw froze the murdered victim, wound the watch, and had it dumped in the river at 4:00 PM to match his live TV alibi.","Case resolved! Here is what happened: Walter Shaw froze the murdered victim, wound the watch, and had it dumped in the river at 4:00 PM to match his live TV alibi."],"hints":["Pay attention to where Business Partner Walter Shaw was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_108';
DELETE FROM public.case_events WHERE case_id = 'story_108';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7b7f1a34-77c9-52d8-9324-96ed68f0bd3d',
  'story_108',
  'Walter Shaw',
  'Corrupt Business Partner',
  'Immaculate pinstripe suit, smooth smile, checking his own wristwatch, confident alibi',
  'I was on live television at the city council at 4:18 PM! Arthur must have fallen in the river this afternoon.',
  'A receipt for forty pounds of dry ice purchased three days ago from the cold storage depot.',
  'Speaking on live television at the city council meeting at 4:18 PM',
  'Business partner in Vance-Shaw Construction',
  'The mechanical watch stops eighteen minutes after being submerged in water.',
  'Did not know the medical examiner can measure body decomposition independent of watch time.',
  '👔',
  '["I was on live television at the city council at 4:18 PM! Arthur must have fallen in the river this afternoon.","\"I was on live television at the city council at 4:18 PM! Arthur must have fallen in the river this afternoon.\"","Listen to me: I was on live television at the city council at 4:18 PM! Arthur must have fallen in the river this afternoon.","I tell you the truth: I was on live television at the city council at 4:18 PM! Arthur must have fallen in the river this afternoon."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2fb4619d-b6f3-5c9e-bdf1-38d509afd6cd',
  'story_108',
  'Arthur Vance (Victim)',
  'Slain Business Partner',
  'Found floating in the creek with an antique gold pocket watch and ice crystal lung tissue',
  'Deceased victim; cellular decomposition proves death occurred forty-eight hours prior.',
  'He had signed an audit report accusing Walter of two million dollars of contract fraud.',
  'Murdered two days ago',
  'Co-owner of Vance-Shaw Construction',
  'Walter was siphoning city concrete funds for offshore gambling.',
  'Did not expect Walter to knock him out in the cold meat locker.',
  '⌚',
  '["Deceased victim; cellular decomposition proves death occurred forty-eight hours prior.","\"Deceased victim; cellular decomposition proves death occurred forty-eight hours prior.\"","Listen to me: Deceased victim; cellular decomposition proves death occurred forty-eight hours prior.","I tell you the truth: Deceased victim; cellular decomposition proves death occurred forty-eight hours prior."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1f6df145-8950-59bd-a6de-4bbb07cbd247',
  'story_108',
  'Dr. Rebecca Vance',
  'Forensic Medical Examiner',
  'Brilliant pathologist, glasses, white lab coat, holding histological tissue slides',
  'Watches can be wound by anyone. The victim’s liver temperature and cellular decay prove he died two days ago.',
  'She was a former colleague of Arthur’s late wife.',
  'Performing autopsy in the county morgue',
  'Forensic pathologist',
  'The victim’s muscle tissue showed ice crystallization from post-mortem freezing.',
  'Did not know where the body had been frozen until police raided the cold storage.',
  '🔬',
  '["Watches can be wound by anyone. The victim’s liver temperature and cellular decay prove he died two days ago.","\"Watches can be wound by anyone. The victim’s liver temperature and cellular decay prove he died two days ago.\"","Listen to me: Watches can be wound by anyone. The victim’s liver temperature and cellular decay prove he died two days ago.","I tell you the truth: Watches can be wound by anyone. The victim’s liver temperature and cellular decay prove he died two days ago."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '73b59c3b-46e4-5f6c-a668-0fa12fe48c87',
  'story_108',
  'Detective Marcus Cole',
  'Homicide Detective',
  'Hardboiled, brown leather jacket, holding cold storage receipts and timeline logs',
  'When an alibi depends entirely on a broken watch, the watch was placed there by the killer.',
  'He had been investigating Vance-Shaw municipal kickbacks for six months.',
  'Investigating the riverbank recovery site',
  'Lead detective on the murder',
  'Walter had an accomplice seen throwing a heavy sack into the creek at 4:00 PM.',
  'Did not know the accomplice’s identity until checking phone call logs.',
  '🕵️‍♂️',
  '["When an alibi depends entirely on a broken watch, the watch was placed there by the killer.","\"When an alibi depends entirely on a broken watch, the watch was placed there by the killer.\"","Listen to me: When an alibi depends entirely on a broken watch, the watch was placed there by the killer.","I tell you the truth: When an alibi depends entirely on a broken watch, the watch was placed there by the killer."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '945efc06-6b6a-52ab-983f-f90f4a9a406d',
  'story_108',
  'ev_1',
  1,
  'Today - 05:00 PM',
  'Fishermen haul Arthur’s body from the river mud.',
  'Fishermen haul Arthur’s body from the river mud.',
  'An antique gold pocket watch in the victim’s vest stopped at 4:18 PM.',
  'Gold watch stopped at 4:18',
  'Flooded Gold Watch',
  '["Broken glass","Stolen chain","Running watch"]'::jsonb,
  'Gold watch stopped at 4:18',
  '["gold watch stopped at 4:18","gold watch","watch","pocket watch","stopped watch"]'::jsonb,
  'The antique timepiece stopped at eighteen minutes past four.',
  'ev_2',
  true,
  '{"descriptions":["Fishermen haul Arthur’s body from the river mud.","At Today - 05:00 PM: Fishermen haul Arthur’s body from the river mud.","Notice this clue: Fishermen haul Arthur’s body from the river mud."],"hints":["The antique timepiece stopped at eighteen minutes past four.","Clue hint: Think about gold watch stopped at 4:18.","Search for: an antique gold pocket watch in the victim’s vest stopped at 4:18 pm."],"clues":["Gold watch stopped at 4:18","Item: Gold watch stopped at 4:18","Clue Word: Gold watch stopped at 4:18"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '58b6fd80-048b-5da9-82c3-27eb8e5e8c59',
  'story_108',
  'ev_2',
  2,
  'Today - 06:30 PM',
  'Dr. Rebecca Vance examines the internal liver tissue.',
  'Dr. Rebecca Vance examines the internal liver tissue.',
  'Microscopic ice crystallization in muscle fibers proving deep freezing.',
  'Ice crystallization in tissue',
  'Histology Cold Freeze Report',
  '["Sunburn","Fever","Poison"]'::jsonb,
  'Ice crystallization in tissue',
  '["ice crystallization in tissue","ice tissue","ice crystallization","freeze report","frozen tissue"]'::jsonb,
  'Cellular proof that the victim was frozen in a commercial freezer after death.',
  'ev_3',
  false,
  '{"descriptions":["Dr. Rebecca Vance examines the internal liver tissue.","At Today - 06:30 PM: Dr. Rebecca Vance examines the internal liver tissue.","Notice this clue: Dr. Rebecca Vance examines the internal liver tissue."],"hints":["Cellular proof that the victim was frozen in a commercial freezer after death.","Clue hint: Think about ice crystallization in tissue.","Search for: microscopic ice crystallization in muscle fibers proving deep freezing."],"clues":["Ice crystallization in tissue","Item: Ice crystallization in tissue","Clue Word: Ice crystallization in tissue"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f61e80d0-d6a5-5503-a907-89487c28dee4',
  'story_108',
  'ev_3',
  3,
  'Today - 07:15 PM',
  'Dr. Vance measures gastric contents and rigor mortis.',
  'Dr. Vance measures gastric contents and rigor mortis.',
  'Digestion and chemical rigor showing death occurred forty-eight hours ago.',
  'Two-day decomposition timeline',
  'Forensic Timeline Report',
  '["One hour","Four hours","One week"]'::jsonb,
  'Two-day decomposition timeline',
  '["two-day decomposition timeline","two day timeline","decomposition timeline","two days","timeline report"]'::jsonb,
  'Medical timeline proving the watch time was a staged fabrication.',
  'ev_4',
  false,
  '{"descriptions":["Dr. Vance measures gastric contents and rigor mortis.","At Today - 07:15 PM: Dr. Vance measures gastric contents and rigor mortis.","Notice this clue: Dr. Vance measures gastric contents and rigor mortis."],"hints":["Medical timeline proving the watch time was a staged fabrication.","Clue hint: Think about two-day decomposition timeline.","Search for: digestion and chemical rigor showing death occurred forty-eight hours ago."],"clues":["Two-day decomposition timeline","Item: Two-day decomposition timeline","Clue Word: Two-day decomposition timeline"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b6984bba-8ca8-5fd7-bf15-38d8e669f9e8',
  'story_108',
  'ev_4',
  4,
  'Today - 08:00 PM',
  'Detective Cole reviews the televised city council broadcast.',
  'Detective Cole reviews the televised city council broadcast.',
  'Walter Shaw speaking on the podium at 4:18 PM with a deliberate glance at his watch.',
  'Televised city council alibi',
  'Council Broadcast Footage',
  '["Radio speech","Hotel camera","Flight record"]'::jsonb,
  'Televised city council alibi',
  '["televised city council alibi","council broadcast","alibi video","television alibi","council footage"]'::jsonb,
  'Broadcast video showing Walter setting up his manufactured public alibi.',
  'ev_5',
  false,
  '{"descriptions":["Detective Cole reviews the televised city council broadcast.","At Today - 08:00 PM: Detective Cole reviews the televised city council broadcast.","Notice this clue: Detective Cole reviews the televised city council broadcast."],"hints":["Broadcast video showing Walter setting up his manufactured public alibi.","Clue hint: Think about televised city council alibi.","Search for: walter shaw speaking on the podium at 4:18 pm with a deliberate glance at his watch."],"clues":["Televised city council alibi","Item: Televised city council alibi","Clue Word: Televised city council alibi"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '70b12a6b-9bd1-54f8-bc8e-378cd22b97b2',
  'story_108',
  'ev_5',
  5,
  'Today - 08:30 PM',
  'Cole inspects Walter’s construction warehouse on 4th Street.',
  'Cole inspects Walter’s construction warehouse on 4th Street.',
  'A commercial walk-in blast freezer with Arthur’s blood DNA on the freezer shelf.',
  'Blast freezer blood DNA',
  'Commercial Freezer Scene',
  '["Empty room","Tool rack","Paint booth"]'::jsonb,
  'Blast freezer blood DNA',
  '["blast freezer blood dna","freezer blood","blast freezer","dna blood","freezer dna"]'::jsonb,
  'The cold storage locker where Arthur’s body was frozen for two days.',
  'ev_6',
  true,
  '{"descriptions":["Cole inspects Walter’s construction warehouse on 4th Street.","At Today - 08:30 PM: Cole inspects Walter’s construction warehouse on 4th Street.","Notice this clue: Cole inspects Walter’s construction warehouse on 4th Street."],"hints":["The cold storage locker where Arthur’s body was frozen for two days.","Clue hint: Think about blast freezer blood dna.","Search for: a commercial walk-in blast freezer with arthur’s blood dna on the freezer shelf."],"clues":["Blast freezer blood DNA","Item: Blast freezer blood DNA","Clue Word: Blast freezer blood DNA"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ddb4e9e2-4bab-5af1-863d-6406419a7d6b',
  'story_108',
  'ev_6',
  6,
  'Today - 09:00 PM',
  'Cole checks Walter’s credit card transactions.',
  'Cole checks Walter’s credit card transactions.',
  'Purchase of an antique watch-winding key matching Arthur’s gold watch two days ago.',
  'Watch-winding key receipt',
  'Watch Key Purchase Receipt',
  '["Restaurant bill","Hotel charge","Gas ticket"]'::jsonb,
  'Watch-winding key receipt',
  '["watch-winding key receipt","key receipt","watch key","winding key","watch receipt"]'::jsonb,
  'Paper trail proving Walter bought a tool to wind Arthur’s pocket watch before the dump.',
  'ev_7',
  false,
  '{"descriptions":["Cole checks Walter’s credit card transactions.","At Today - 09:00 PM: Cole checks Walter’s credit card transactions.","Notice this clue: Cole checks Walter’s credit card transactions."],"hints":["Paper trail proving Walter bought a tool to wind Arthur’s pocket watch before the dump.","Clue hint: Think about watch-winding key receipt.","Search for: purchase of an antique watch-winding key matching arthur’s gold watch two days ago."],"clues":["Watch-winding key receipt","Item: Watch-winding key receipt","Clue Word: Watch-winding key receipt"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e2c9de0a-137d-5d34-a873-689287700033',
  'story_108',
  'ev_7',
  7,
  'Today - 09:30 PM',
  'Cole searches Arthur’s office desk safe.',
  'Cole searches Arthur’s office desk safe.',
  'Arthur’s signed financial audit exposing Walter’s two-million-dollar fraud.',
  'Fraud audit document',
  'Signed Embezzlement Audit',
  '["Will","Insurance policy","Personal letter"]'::jsonb,
  'Fraud audit document',
  '["fraud audit document","fraud audit","audit document","audit","embezzlement audit"]'::jsonb,
  'The financial motive that drove Walter to plan the calculated execution.',
  'ev_8',
  false,
  '{"descriptions":["Cole searches Arthur’s office desk safe.","At Today - 09:30 PM: Cole searches Arthur’s office desk safe.","Notice this clue: Cole searches Arthur’s office desk safe."],"hints":["The financial motive that drove Walter to plan the calculated execution.","Clue hint: Think about fraud audit document.","Search for: arthur’s signed financial audit exposing walter’s two-million-dollar fraud."],"clues":["Fraud audit document","Item: Fraud audit document","Clue Word: Fraud audit document"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cda325b5-e607-53e4-a5b7-e4047c0561be',
  'story_108',
  'ev_8',
  8,
  'Today - 10:00 PM',
  'Walter is confronted with the tissue crystallization, the freezer DNA, and the key.',
  'Walter is confronted with the tissue crystallization, the freezer DNA, and the key.',
  'Walter’s complete confession that he faked the watch time to forge an alibi.',
  'Walter Shaw’s confession',
  'Signed Murder Confession',
  '["Denial","Lawyer statement","Silence"]'::jsonb,
  'Walter Shaw’s confession',
  '["walter shaw’s confession","confession","walter confession","signed confession","admission"]'::jsonb,
  'Full admission of murdering his partner and staging the river timeline.',
  NULL,
  true,
  '{"descriptions":["Walter is confronted with the tissue crystallization, the freezer DNA, and the key.","At Today - 10:00 PM: Walter is confronted with the tissue crystallization, the freezer DNA, and the key.","Notice this clue: Walter is confronted with the tissue crystallization, the freezer DNA, and the key."],"hints":["Full admission of murdering his partner and staging the river timeline.","Clue hint: Think about walter shaw’s confession.","Search for: walter’s complete confession that he faked the watch time to forge an alibi."],"clues":["Walter Shaw’s confession","Item: Walter Shaw’s confession","Clue Word: Walter Shaw’s confession"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_109 — THE GRANDFATHER’S SECRET WORKSHOP
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_109',
  'The Grandfather’s Secret Workshop',
  'Emotional Mystery',
  'The dusty attic workshop of late toy maker Samuel Vance, wooden carved horses, brass music mechanisms, and cedar sawdust',
  'After the beloved old toy maker passed away, his greedy heirs prepared to sell his shop to developers, but a hand-carved wooden robin was found holding a tiny brass key that opened no known lock.',
  '[{"name":"Arthur Vance","role":"Greedy Estranged Son","alibi":"Ransacking the attic under the excuse of \"organizing father’s estate\"","avatar":"💼"},{"name":"Samuel Vance (Late Grandfather)","role":"Master Toy Artisan","alibi":"Passed away peacefully in his sleep at age 86","avatar":"👴"},{"name":"Sister Clara","role":"Orphanage Director","alibi":"Praying in the chapel for a miracle to save the orphanage","avatar":"🕊️"},{"name":"Detective Marcus Bell","role":"Probate & Estate Investigator","alibi":"Called to the shop after Arthur smashed several antique cabinets","avatar":"🔍"}]'::jsonb,
  'Toy maker Samuel Vance spent his final year crafting toys for disabled children and willed the entire property to the St. Jude Children’s Home. Knowing his estranged son Arthur would contest or steal the will, Samuel concealed the true trust deed inside a secret compartment in his heavy maple workbench, keyed exclusively to the hand-carved wooden robin.',
  'Greedy Son Arthur Vance',
  'Arthur wanted to destroy his father’s final will, which gave the million-dollar toy workshop to the local orphanage.',
  '[{"time":"One Month Ago","event":"Samuel creates the secret workbench compartment and conceals the orphanage deed."},{"time":"Yesterday - 08:00 AM","event":"Samuel passes away in his sleep, holding the wooden robin on his chest."},{"time":"Today - 09:00 AM","event":"Arthur arrives with moving men to pack up and demolish the workshop."},{"time":"Today - 10:15 AM","event":"Arthur attempts to smash the wooden robin on the floor to find gold inside."},{"time":"Today - 11:00 AM","event":"Detective Bell halts the demolition and begins inspecting the hand-carved robin."}]'::jsonb,
  '[{"id":"ev_1","title":"Hand-Carved Robin","detail":"Masterpiece carved bird holding the brass key in its spring-loaded beak."},{"id":"ev_2","title":"Workbench Secret Keyhole","detail":"Concealed keyhole inside the maple workbench leg opened by the robin’s key."},{"id":"ev_3","title":"Certified Last Will","detail":"Samuel’s valid legal deed bequeathing the workshop to St. Jude’s Orphanage."},{"id":"ev_4","title":"Samuel’s Final Letter","detail":"Loving letter explaining that generosity is the greatest toy a man can build."}]'::jsonb,
  '[{"order":1,"title":"Wooden robin with brass key","text":"The mechanical puzzle holding the master key to the mystery."},{"order":2,"title":"Spring-loaded bird beak","text":"Demonstrates Samuel’s artisan brilliance in hiding the key in plain sight."},{"order":3,"title":"Concealed maple keyhole","text":"The hidden lock located in the workshop’s foundation workbench."},{"order":4,"title":"Spring secret drawer","text":"Reveals the physical hiding spot Samuel created before his passing."},{"order":5,"title":"Orphanage trust will","text":"The legal document ensuring the property will save the children."},{"order":6,"title":"Father’s farewell letter","text":"The emotional catalyst that moves Arthur from greed to redemption."}]'::jsonb,
  'Attic trunk filled with old broken clocks: Samuel kept old parts for spare springs, unrelated to the will.; Arthur’s claimed verbal promise: Arthur claimed father promised him the cash, completely unverified.',
  'Claim the grandfather lost his mind in senility and carved meaningless toy keys.',
  'NORMAL',
  'What secret lock did the wooden robin’s key open, and why was the toy maker so protective of his attic workbench?',
  '[{"character":"Arthur Vance","secret":"A real estate contract already drafted to demolish the historic workshop next Monday."},{"character":"Samuel Vance (Late Grandfather)","secret":"A million-dollar endowment trust inside the workbench leg."},{"character":"Sister Clara","secret":"The orphanage faced immediate eviction without Samuel’s financial help."},{"character":"Detective Marcus Bell","secret":"He was an orphan who received a wooden locomotive from Samuel thirty years ago."}]'::jsonb,
  '[{"lead":"Attic trunk filled with old broken clocks","explanation":"Samuel kept old parts for spare springs, unrelated to the will."},{"lead":"Arthur’s claimed verbal promise","explanation":"Arthur claimed father promised him the cash, completely unverified."}]'::jsonb,
  '{"wrongTheories":["Samuel hid a stash of stolen bank gold inside the wooden toys in the attic.","The grandfather suffered senile dementia and forgot where he left his real will."],"correctTheory":"Samuel Vance hid his true will inside his maple workbench, keyed to a carved wooden robin, to save the orphanage from his greedy son."}'::jsonb,
  'Samuel Vance hid his will inside the workbench to leave the workshop to the local orphanage, softening his greedy son’s heart.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Arthur broke down, tore up the demolition contract, and joined the orphanage board to preserve his father’s legacy."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Arthur smashed the workbench with a sledgehammer, burned the will, and built luxury condominiums."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The workshop was abandoned as junk, and the secret will remained locked inside the maple leg for a century."}]'::jsonb,
  '{"intros":["After the beloved old toy maker passed away, his greedy heirs prepared to sell his shop to developers, but a hand-carved wooden robin was found holding a tiny brass key that opened no known lock.","Case file story_109: After the beloved old toy maker passed away, his greedy heirs prepared to sell his shop to developers, but a hand-carved wooden robin was found holding a tiny brass key that opened no known lock. Look closely at every clue.","Trouble begins in The dusty attic workshop of late toy maker Samuel Vance, wooden carved horses, brass music mechanisms, and cedar sawdust. After the beloved old toy maker passed away, his greedy heirs prepared to sell his shop to developers, but a hand-carved wooden robin was found holding a tiny brass key that opened no known lock.","The mystery starts now. After the beloved old toy maker passed away, his greedy heirs prepared to sell his shop to developers, but a hand-carved wooden robin was found holding a tiny brass key that opened no known lock. Can you solve it?"],"reveals":["Samuel Vance hid his will inside the workbench to leave the workshop to the local orphanage, softening his greedy son’s heart.","The mystery is unraveled! Samuel Vance hid his will inside the workbench to leave the workshop to the local orphanage, softening his greedy son’s heart.","At last, the truth comes out: Samuel Vance hid his will inside the workbench to leave the workshop to the local orphanage, softening his greedy son’s heart.","Case resolved! Here is what happened: Samuel Vance hid his will inside the workbench to leave the workshop to the local orphanage, softening his greedy son’s heart."],"hints":["Pay attention to where Greedy Son Arthur Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_109';
DELETE FROM public.case_events WHERE case_id = 'story_109';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'aa8b799a-5610-540d-bd6b-68e12d70adaf',
  'story_109',
  'Arthur Vance',
  'Greedy Estranged Son',
  'Tailored suit, impatient, dismissive of toys, checking his phone constantly for real estate offers',
  'Father was losing his mind! This workshop is worth millions to condominium builders.',
  'A real estate contract already drafted to demolish the historic workshop next Monday.',
  'Ransacking the attic under the excuse of "organizing father’s estate"',
  'Only surviving biological son of Samuel Vance',
  'Samuel never kept cash in banks, hiding all wealth inside the workshop.',
  'Did not know the wooden robin’s beak had a secret spring release mechanism.',
  '💼',
  '["Father was losing his mind! This workshop is worth millions to condominium builders.","\"Father was losing his mind! This workshop is worth millions to condominium builders.\"","Listen to me: Father was losing his mind! This workshop is worth millions to condominium builders.","I tell you the truth: Father was losing his mind! This workshop is worth millions to condominium builders."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7d67b42d-2320-500d-913d-7e28879e3182',
  'story_109',
  'Samuel Vance (Late Grandfather)',
  'Master Toy Artisan',
  'Gentle, loving, white beard, left a final note: "Kindness is the only treasure that endures."',
  'Deceased grandfather; his journal read: "Listen to the song of the robin to find the children’s home."',
  'A million-dollar endowment trust inside the workbench leg.',
  'Passed away peacefully in his sleep at age 86',
  'Father of Arthur and beloved neighborhood grandfather',
  'Arthur cared only for money and would abandon the orphanage.',
  'Could not stop Arthur from physically forcing open workbench drawers.',
  '👴',
  '["Deceased grandfather; his journal read: \"Listen to the song of the robin to find the children’s home.\"","\"Deceased grandfather; his journal read: \"Listen to the song of the robin to find the children’s home.\"\"","Listen to me: Deceased grandfather; his journal read: \"Listen to the song of the robin to find the children’s home.\"","I tell you the truth: Deceased grandfather; his journal read: \"Listen to the song of the robin to find the children’s home.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4faecc44-b588-5a9a-ab9e-097a94b6cec2',
  'story_109',
  'Sister Clara',
  'Orphanage Director',
  'Humble nun, woolen shawl, kind smile, clutching a hand-carved wooden music box',
  'Samuel repaired every toy in our orphanage for forty years. He promised the children would always have a home.',
  'The orphanage faced immediate eviction without Samuel’s financial help.',
  'Praying in the chapel for a miracle to save the orphanage',
  'Close friend and spiritual confidante of Samuel',
  'Samuel told her the wooden robin held the key to the future.',
  'Did not know where the key fitted in the workshop.',
  '🕊️',
  '["Samuel repaired every toy in our orphanage for forty years. He promised the children would always have a home.","\"Samuel repaired every toy in our orphanage for forty years. He promised the children would always have a home.\"","Listen to me: Samuel repaired every toy in our orphanage for forty years. He promised the children would always have a home.","I tell you the truth: Samuel repaired every toy in our orphanage for forty years. He promised the children would always have a home."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3a10d7ce-e451-5e5b-8556-362aa69d06c9',
  'story_109',
  'Detective Marcus Bell',
  'Probate & Estate Investigator',
  'Patient, warm-hearted, wearing spectacles, examining hand-carved wooden joints',
  'True master craftsmen never leave useless mechanisms. Every gear has a loving purpose.',
  'He was an orphan who received a wooden locomotive from Samuel thirty years ago.',
  'Called to the shop after Arthur smashed several antique cabinets',
  'Probate court officer ensuring lawful estate resolution',
  'The maple workbench was built using interlocking dovetail pins with zero nails.',
  'Did not know the secret sequence to twist the wooden robin.',
  '🔍',
  '["True master craftsmen never leave useless mechanisms. Every gear has a loving purpose.","\"True master craftsmen never leave useless mechanisms. Every gear has a loving purpose.\"","Listen to me: True master craftsmen never leave useless mechanisms. Every gear has a loving purpose.","I tell you the truth: True master craftsmen never leave useless mechanisms. Every gear has a loving purpose."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fbae6a1c-a2bc-5020-b1bd-4e7882a1ee05',
  'story_109',
  'ev_1',
  1,
  '11:00 AM',
  'Detective Bell rescues the carved toy from Arthur’s hands.',
  'Detective Bell rescues the carved toy from Arthur’s hands.',
  'A finely carved wooden robin with a miniature brass key locked in its beak.',
  'Wooden robin with brass key',
  'Hand-Carved Robin',
  '["Toy train","Wooden doll","Music drum"]'::jsonb,
  'Wooden robin with brass key',
  '["wooden robin with brass key","wooden robin","robin","carved robin","toy robin"]'::jsonb,
  'Handmade wooden bird holding a tiny brass key in its beak.',
  'ev_2',
  true,
  '{"descriptions":["Detective Bell rescues the carved toy from Arthur’s hands.","At 11:00 AM: Detective Bell rescues the carved toy from Arthur’s hands.","Notice this clue: Detective Bell rescues the carved toy from Arthur’s hands."],"hints":["Handmade wooden bird holding a tiny brass key in its beak.","Clue hint: Think about wooden robin with brass key.","Search for: a finely carved wooden robin with a miniature brass key locked in its beak."],"clues":["Wooden robin with brass key","Item: Wooden robin with brass key","Clue Word: Wooden robin with brass key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '06060d09-c7db-5b6c-aea6-e60f3b74f332',
  'story_109',
  'ev_2',
  2,
  '11:15 AM',
  'Bell inspects the robin’s wing joints.',
  'Bell inspects the robin’s wing joints.',
  'Pressing the left wing causes the bird’s beak to spring open, releasing the key.',
  'Spring-loaded bird beak',
  'Robin Mechanical Release',
  '["Broken wood","Glued seam","Loose screw"]'::jsonb,
  'Spring-loaded bird beak',
  '["spring-loaded bird beak","bird beak","spring beak","beak release","robin beak"]'::jsonb,
  'Secret mechanical spring release inside the carved bird.',
  'ev_3',
  false,
  '{"descriptions":["Bell inspects the robin’s wing joints.","At 11:15 AM: Bell inspects the robin’s wing joints.","Notice this clue: Bell inspects the robin’s wing joints."],"hints":["Secret mechanical spring release inside the carved bird.","Clue hint: Think about spring-loaded bird beak.","Search for: pressing the left wing causes the bird’s beak to spring open, releasing the key."],"clues":["Spring-loaded bird beak","Item: Spring-loaded bird beak","Clue Word: Spring-loaded bird beak"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6de35b00-7086-5724-9b61-0fccca8e0ece',
  'story_109',
  'ev_3',
  3,
  '11:30 AM',
  'Bell examines the master maple workbench.',
  'Bell examines the master maple workbench.',
  'A hidden keyhole concealed beneath a sliding wooden knot in the center leg.',
  'Concealed maple keyhole',
  'Workbench Secret Keyhole',
  '["Drawer handle","Vise clamp","Nail hole"]'::jsonb,
  'Concealed maple keyhole',
  '["concealed maple keyhole","keyhole","concealed keyhole","workbench keyhole","maple keyhole"]'::jsonb,
  'Tiny brass keyway disguised as a natural knot in the wooden table leg.',
  'ev_4',
  false,
  '{"descriptions":["Bell examines the master maple workbench.","At 11:30 AM: Bell examines the master maple workbench.","Notice this clue: Bell examines the master maple workbench."],"hints":["Tiny brass keyway disguised as a natural knot in the wooden table leg.","Clue hint: Think about concealed maple keyhole.","Search for: a hidden keyhole concealed beneath a sliding wooden knot in the center leg."],"clues":["Concealed maple keyhole","Item: Concealed maple keyhole","Clue Word: Concealed maple keyhole"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '64e2ca97-812a-567b-9ee7-f08c1d8bde35',
  'story_109',
  'ev_4',
  4,
  '11:45 AM',
  'Bell turns the brass key in the hidden keyhole.',
  'Bell turns the brass key in the hidden keyhole.',
  'A spring drawer glides out containing the original signed probate deed.',
  'Spring secret drawer',
  'Maple Workbench Drawer',
  '["Empty cavity","Box of nails","Old chisel"]'::jsonb,
  'Spring secret drawer',
  '["spring secret drawer","secret drawer","spring drawer","workbench drawer","drawer"]'::jsonb,
  'Hidden compartment sliding out of the heavy wooden workbench.',
  'ev_5',
  false,
  '{"descriptions":["Bell turns the brass key in the hidden keyhole.","At 11:45 AM: Bell turns the brass key in the hidden keyhole.","Notice this clue: Bell turns the brass key in the hidden keyhole."],"hints":["Hidden compartment sliding out of the heavy wooden workbench.","Clue hint: Think about spring secret drawer.","Search for: a spring drawer glides out containing the original signed probate deed."],"clues":["Spring secret drawer","Item: Spring secret drawer","Clue Word: Spring secret drawer"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '80ca4225-c64f-5e65-9c78-04bc2cecf141',
  'story_109',
  'ev_5',
  5,
  '12:00 PM',
  'Bell unfolds the legal parchment inside the drawer.',
  'Bell unfolds the legal parchment inside the drawer.',
  'Samuel’s certified last will bequeathing the property and funds to St. Jude’s Orphanage.',
  'Orphanage trust will',
  'Certified Last Will',
  '["Receipt","Family photo","Blueprint"]'::jsonb,
  'Orphanage trust will',
  '["orphanage trust will","trust will","will","orphanage will","certified will"]'::jsonb,
  'Official legal testament protecting the workshop and gifting it to the children.',
  'ev_6',
  true,
  '{"descriptions":["Bell unfolds the legal parchment inside the drawer.","At 12:00 PM: Bell unfolds the legal parchment inside the drawer.","Notice this clue: Bell unfolds the legal parchment inside the drawer."],"hints":["Official legal testament protecting the workshop and gifting it to the children.","Clue hint: Think about orphanage trust will.","Search for: samuel’s certified last will bequeathing the property and funds to st. jude’s orphanage."],"clues":["Orphanage trust will","Item: Orphanage trust will","Clue Word: Orphanage trust will"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c6c08e39-3cbb-5eaa-ab4b-6120be1c4061',
  'story_109',
  'ev_6',
  6,
  '12:15 PM',
  'Bell finds a personal handwritten letter attached to the will.',
  'Bell finds a personal handwritten letter attached to the will.',
  'Samuel’s loving farewell letter: "To Arthur: May this gift teach you the true joy of giving."',
  'Father’s farewell letter',
  'Samuel’s Final Letter',
  '["Anger note","Legal threat","Blank page"]'::jsonb,
  'Father’s farewell letter',
  '["father’s farewell letter","farewell letter","father letter","final letter","samuel letter"]'::jsonb,
  'Heartfelt letter from the dying grandfather urging his son to choose compassion.',
  'ev_7',
  false,
  '{"descriptions":["Bell finds a personal handwritten letter attached to the will.","At 12:15 PM: Bell finds a personal handwritten letter attached to the will.","Notice this clue: Bell finds a personal handwritten letter attached to the will."],"hints":["Heartfelt letter from the dying grandfather urging his son to choose compassion.","Clue hint: Think about father’s farewell letter.","Search for: samuel’s loving farewell letter: \"to arthur: may this gift teach you the true joy of giving.\""],"clues":["Father’s farewell letter","Item: Father’s farewell letter","Clue Word: Father’s farewell letter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a7b50487-0f0f-58a5-811c-32ad68cf43f5',
  'story_109',
  'ev_7',
  7,
  '12:30 PM',
  'Arthur reads his father’s words and sinks into a chair in tears.',
  'Arthur reads his father’s words and sinks into a chair in tears.',
  'Arthur’s emotional breakdown as he surrenders the demolition contracts.',
  'Surrendered demolition contract',
  'Torn Real Estate Contract',
  '["Lawsuit filing","Police report","Eviction notice"]'::jsonb,
  'Surrendered demolition contract',
  '["surrendered demolition contract","demolition contract","contract","torn contract","surrendered contract"]'::jsonb,
  'The builder papers torn up by the son after experiencing a change of heart.',
  'ev_8',
  false,
  '{"descriptions":["Arthur reads his father’s words and sinks into a chair in tears.","At 12:30 PM: Arthur reads his father’s words and sinks into a chair in tears.","Notice this clue: Arthur reads his father’s words and sinks into a chair in tears."],"hints":["The builder papers torn up by the son after experiencing a change of heart.","Clue hint: Think about surrendered demolition contract.","Search for: arthur’s emotional breakdown as he surrenders the demolition contracts."],"clues":["Surrendered demolition contract","Item: Surrendered demolition contract","Clue Word: Surrendered demolition contract"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c3585599-9cec-5bd7-bc6b-722935b28ae8',
  'story_109',
  'ev_8',
  8,
  '01:00 PM',
  'Sister Clara and the orphan children enter the workshop in joy.',
  'Sister Clara and the orphan children enter the workshop in joy.',
  'The workshop permanently dedicated as the Samuel Vance Children’s Community Center.',
  'Dedicated community center',
  'Memorial Plaque',
  '["Sold sign","Condo banner","Boarded windows"]'::jsonb,
  'Dedicated community center',
  '["dedicated community center","community center","memorial plaque","plaque","dedication"]'::jsonb,
  'Permanent preservation of the beloved grandfather’s life work.',
  NULL,
  true,
  '{"descriptions":["Sister Clara and the orphan children enter the workshop in joy.","At 01:00 PM: Sister Clara and the orphan children enter the workshop in joy.","Notice this clue: Sister Clara and the orphan children enter the workshop in joy."],"hints":["Permanent preservation of the beloved grandfather’s life work.","Clue hint: Think about dedicated community center.","Search for: the workshop permanently dedicated as the samuel vance children’s community center."],"clues":["Dedicated community center","Item: Dedicated community center","Clue Word: Dedicated community center"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_110 — THE LAST MELODY ON THE PIANO
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_110',
  'The Last Melody on the Piano',
  'Emotional Mystery',
  'The dusty music salon of late pianist Clara Schumann-Vance, grand Steinway piano, yellowed sheet music, and velvet armchairs',
  'Before passing away in silence, the world-famous concert pianist composed a final unfinished piano song titled "Forgive Me", but whenever played, the fourth bar produced a sharp dissonant clink from inside the piano strings.',
  '[{"name":"Beatrice Thorne","role":"Celebrated Composer Rival","alibi":"Visiting the music salon to pay \"respects\" to her late colleague","avatar":"🎹"},{"name":"Clara Vance (Deceased Pianist)","role":"Virtuoso Composer","alibi":"Passed away peacefully two days ago","avatar":"🎶"},{"name":"Julian Ross","role":"Young Conservatory Student","alibi":"Practicing the final piece at the piano bench","avatar":"🎼"},{"name":"Inspector Sarah Chen","role":"Cultural Property Detective","alibi":"Called to the salon after reports of forced entry last night","avatar":"🔍"}]'::jsonb,
  'Fifty years ago, Beatrice Thorne claimed credit for Clara’s masterpiece concerto. On her deathbed, Clara wrote "Forgive Me", embedding the true musical cipher of the melody. When played, the hammer on middle C struck a secret brass locket wedged beneath the soundboard strings, containing the original copyright certificate.',
  'Jealous Former Rival Beatrice Thorne',
  'Beatrice wanted to destroy the manuscript proving Clara had authored the century’s greatest concerto.',
  '[{"time":"May 12, 1965","event":"Beatrice steals Clara’s conservatory concerto manuscript and publishes it under her name."},{"time":"Three Days Ago","event":"Clara writes \"Forgive Me\" and wedges the copyright locket into the piano bridge."},{"time":"Yesterday - 09:00 PM","event":"Beatrice breaks the salon window with her cane looking for Clara’s notes."},{"time":"Today - 10:00 AM","event":"Julian plays the melody and hears the metallic clink on middle C."},{"time":"Today - 10:30 AM","event":"Inspector Chen uses an inspection mirror to locate the brass locket."}]'::jsonb,
  '[{"id":"ev_1","title":"Soundboard Brass Locket","detail":"Tarnished locket wedged beneath middle C strings causing the intentional clink."},{"id":"ev_2","title":"Original Copyright Certificate","detail":"1965 state copyright deed proving Clara Vance was the sole author of the concerto."},{"id":"ev_3","title":"Ciphered Sheet Music","detail":"Final manuscript where the notes in bar four spell the name BEATRICE."},{"id":"ev_4","title":"Window Toolmark Evidence","detail":"Pry marks on the salon window matching the silver tip of Beatrice’s cane."}]'::jsonb,
  '[{"order":1,"title":"Metallic clink on middle C","text":"The musical clue Clara engineered to draw attention to the soundboard."},{"order":2,"title":"Tarnished brass locket","text":"The physical container hidden inside the instrument harp."},{"order":3,"title":"1965 copyright certificate","text":"Unshakeable documentary proof exposing fifty years of stolen fame."},{"order":4,"title":"Musical name cipher","text":"Artistic evidence left by Clara naming the rival who betrayed her."},{"order":5,"title":"Silver cane pry marks","text":"Places Beatrice at the salon committing illegal break-in last night."},{"order":6,"title":"Wire clippers and sketchbooks","text":"Stolen intellectual property found directly on the rival."}]'::jsonb,
  'Loose piano tuning pin on high treble: Normal instrument wear, unrelated to middle C.; Student Julian’s financial poverty: Julian struggled for tuition, but loved Clara like a grandmother.',
  'Claim the piano had a broken tuning pin from fifty years of neglect.',
  'NORMAL',
  'What was trapped inside the piano strings, and what secret did the dissonant note hide?',
  '[{"character":"Beatrice Thorne","secret":"A wire cutter in her velvet handbag used to tamper with the piano strings."},{"character":"Clara Vance (Deceased Pianist)","secret":"A gold-embossed copyright registration folded inside the piano soundboard."},{"character":"Julian Ross","secret":"He was Clara’s last devoted student and cared for her in her illness."},{"character":"Inspector Sarah Chen","secret":"She investigated historic intellectual property art thefts for the state archive."}]'::jsonb,
  '[{"lead":"Loose piano tuning pin on high treble","explanation":"Normal instrument wear, unrelated to middle C."},{"lead":"Student Julian’s financial poverty","explanation":"Julian struggled for tuition, but loved Clara like a grandmother."}]'::jsonb,
  '{"wrongTheories":["The piano soundboard cracked due to dry winter humidity and temperature drops.","A jealous conservatory student dropped a coin into the piano to ruin the recital."],"correctTheory":"Clara hid a copyright locket under middle C and wrote a musical cipher to expose Beatrice Thorne for stealing her concerto fifty years ago."}'::jsonb,
  'Clara hid her 1965 copyright certificate in a locket wedged in the strings to prove rival Beatrice stole her masterpiece concerto.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Clara was posthumously credited worldwide, Beatrice publicly surrendered her awards, and Julian played the concerto at Carnegie Hall."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Beatrice burned the locket before anyone looked inside, keeping the stolen fame forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The piano was discarded as out-of-tune junk, leaving Clara’s greatest melody forgotten by the world."}]'::jsonb,
  '{"intros":["Before passing away in silence, the world-famous concert pianist composed a final unfinished piano song titled \"Forgive Me\", but whenever played, the fourth bar produced a sharp dissonant clink from inside the piano strings.","Case file story_110: Before passing away in silence, the world-famous concert pianist composed a final unfinished piano song titled \"Forgive Me\", but whenever played, the fourth bar produced a sharp dissonant clink from inside the piano strings. Look closely at every clue.","Trouble begins in The dusty music salon of late pianist Clara Schumann-Vance, grand Steinway piano, yellowed sheet music, and velvet armchairs. Before passing away in silence, the world-famous concert pianist composed a final unfinished piano song titled \"Forgive Me\", but whenever played, the fourth bar produced a sharp dissonant clink from inside the piano strings.","The mystery starts now. Before passing away in silence, the world-famous concert pianist composed a final unfinished piano song titled \"Forgive Me\", but whenever played, the fourth bar produced a sharp dissonant clink from inside the piano strings. Can you solve it?"],"reveals":["Clara hid her 1965 copyright certificate in a locket wedged in the strings to prove rival Beatrice stole her masterpiece concerto.","The mystery is unraveled! Clara hid her 1965 copyright certificate in a locket wedged in the strings to prove rival Beatrice stole her masterpiece concerto.","At last, the truth comes out: Clara hid her 1965 copyright certificate in a locket wedged in the strings to prove rival Beatrice stole her masterpiece concerto.","Case resolved! Here is what happened: Clara hid her 1965 copyright certificate in a locket wedged in the strings to prove rival Beatrice stole her masterpiece concerto."],"hints":["Pay attention to where Jealous Former Rival Beatrice Thorne was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_110';
DELETE FROM public.case_events WHERE case_id = 'story_110';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '893173cf-209d-5541-a639-545ea9c4926b',
  'story_110',
  'Beatrice Thorne',
  'Celebrated Composer Rival',
  'Aging diva, diamond rings, sharp tongue, carrying silver walking cane, defensive of her fame',
  'Clara was a second-rate accompanist. The Great Concerto was my original genius!',
  'A wire cutter in her velvet handbag used to tamper with the piano strings.',
  'Visiting the music salon to pay "respects" to her late colleague',
  'Lifelong rival and former conservatory classmate of Clara',
  'Clara’s original manuscript bore identical watermark stamps to her own published score.',
  'Did not know Clara had hidden the government copyright registration inside the piano.',
  '🎹',
  '["Clara was a second-rate accompanist. The Great Concerto was my original genius!","\"Clara was a second-rate accompanist. The Great Concerto was my original genius!\"","Listen to me: Clara was a second-rate accompanist. The Great Concerto was my original genius!","I tell you the truth: Clara was a second-rate accompanist. The Great Concerto was my original genius!"]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'd9fd7f0a-163a-5458-bed7-f966482f2703',
  'story_110',
  'Clara Vance (Deceased Pianist)',
  'Virtuoso Composer',
  'Gentle, forgiving, lived in quiet humility, left her final melody on the music stand',
  'Deceased victim; note on the music stand: "The fourth bar sings the song of truth."',
  'A gold-embossed copyright registration folded inside the piano soundboard.',
  'Passed away peacefully two days ago',
  'True uncredited author of the century’s greatest concerto',
  'Beatrice had stolen her student draft in 1965 and published it as her own.',
  'Did not live to see the public restitution of her artistic honor.',
  '🎶',
  '["Deceased victim; note on the music stand: \"The fourth bar sings the song of truth.\"","\"Deceased victim; note on the music stand: \"The fourth bar sings the song of truth.\"\"","Listen to me: Deceased victim; note on the music stand: \"The fourth bar sings the song of truth.\"","I tell you the truth: Deceased victim; note on the music stand: \"The fourth bar sings the song of truth.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f357bfd7-c967-5fe1-b76a-594fad5c66a8',
  'story_110',
  'Julian Ross',
  'Young Conservatory Student',
  'Passionate musician, sensitive, playing Clara’s piano with reverent tears',
  'Every time I strike middle C in bar four, the string buzzes and clinks against metal.',
  'He was Clara’s last devoted student and cared for her in her illness.',
  'Practicing the final piece at the piano bench',
  'Protege of Clara Vance',
  'The sheet music notes spell out letters using the German musical cipher: B-E-A-T-R-I-C-E.',
  'Did not know how to remove the foreign object from beneath the piano soundboard.',
  '🎼',
  '["Every time I strike middle C in bar four, the string buzzes and clinks against metal.","\"Every time I strike middle C in bar four, the string buzzes and clinks against metal.\"","Listen to me: Every time I strike middle C in bar four, the string buzzes and clinks against metal.","I tell you the truth: Every time I strike middle C in bar four, the string buzzes and clinks against metal."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7afa07d4-e617-5306-b0e8-09836480af6c',
  'story_110',
  'Inspector Sarah Chen',
  'Cultural Property Detective',
  'Observant, trench coat, carries piano tuning fork and inspection mirrors',
  'Musical instruments don’t produce metallic clinks unless a foreign object is dampening the strings.',
  'She investigated historic intellectual property art thefts for the state archive.',
  'Called to the salon after reports of forced entry last night',
  'Investigating the salon break-in and missing manuscripts',
  'The window latch had fresh pry marks made by the tip of a silver walking cane.',
  'Did not know what was wedged inside the piano harp.',
  '🔍',
  '["Musical instruments don’t produce metallic clinks unless a foreign object is dampening the strings.","\"Musical instruments don’t produce metallic clinks unless a foreign object is dampening the strings.\"","Listen to me: Musical instruments don’t produce metallic clinks unless a foreign object is dampening the strings.","I tell you the truth: Musical instruments don’t produce metallic clinks unless a foreign object is dampening the strings."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c3edb721-ea3f-5b08-978f-a75a2526ccda',
  'story_110',
  'ev_1',
  1,
  '10:00 AM',
  'Julian strikes middle C in the fourth measure of "Forgive Me".',
  'Julian strikes middle C in the fourth measure of "Forgive Me".',
  'A harsh metallic clink instead of a musical tone vibrating from the soundboard.',
  'Metallic clink on middle C',
  'Dissonant Piano Tone',
  '["Snapped wire","Wood creak","Rattling pedal"]'::jsonb,
  'Metallic clink on middle C',
  '["metallic clink on middle c","metallic clink","middle c","clink","dissonant tone"]'::jsonb,
  'Unusual metallic buzz ringing out whenever a specific key is pressed.',
  'ev_2',
  true,
  '{"descriptions":["Julian strikes middle C in the fourth measure of \"Forgive Me\".","At 10:00 AM: Julian strikes middle C in the fourth measure of \"Forgive Me\".","Notice this clue: Julian strikes middle C in the fourth measure of \"Forgive Me\"."],"hints":["Unusual metallic buzz ringing out whenever a specific key is pressed.","Clue hint: Think about metallic clink on middle c.","Search for: a harsh metallic clink instead of a musical tone vibrating from the soundboard."],"clues":["Metallic clink on middle C","Item: Metallic clink on middle C","Clue Word: Metallic clink on middle C"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '61b4723b-2881-5c45-99c2-f4d3120bddc3',
  'story_110',
  'ev_2',
  2,
  '10:30 AM',
  'Inspector Chen slides an angled dental mirror under the piano strings.',
  'Inspector Chen slides an angled dental mirror under the piano strings.',
  'A tarnished brass keepsake locket wedged tightly against the middle C bridge pin.',
  'Tarnished brass locket',
  'Soundboard Brass Locket',
  '["Tuning hammer","Coin","Hairpin"]'::jsonb,
  'Tarnished brass locket',
  '["tarnished brass locket","brass locket","locket","tarnished locket","piano locket"]'::jsonb,
  'Antique metal jewelry piece jammed beneath the piano wires.',
  'ev_3',
  false,
  '{"descriptions":["Inspector Chen slides an angled dental mirror under the piano strings.","At 10:30 AM: Inspector Chen slides an angled dental mirror under the piano strings.","Notice this clue: Inspector Chen slides an angled dental mirror under the piano strings."],"hints":["Antique metal jewelry piece jammed beneath the piano wires.","Clue hint: Think about tarnished brass locket.","Search for: a tarnished brass keepsake locket wedged tightly against the middle c bridge pin."],"clues":["Tarnished brass locket","Item: Tarnished brass locket","Clue Word: Tarnished brass locket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'daa944cf-8d4b-501c-9bb6-a99c9968aaf6',
  'story_110',
  'ev_3',
  3,
  '10:45 AM',
  'Chen extracts the locket with needle-nose forceps.',
  'Chen extracts the locket with needle-nose forceps.',
  'A folded 1965 government copyright certificate bearing Clara’s signature and seal.',
  '1965 copyright certificate',
  'Original Copyright Certificate',
  '["Photo of rival","Love letter","Concert ticket"]'::jsonb,
  '1965 copyright certificate',
  '["1965 copyright certificate","copyright certificate","certificate","copyright","1965 certificate"]'::jsonb,
  'Official government paper proving Clara owned the famous concerto first.',
  'ev_4',
  false,
  '{"descriptions":["Chen extracts the locket with needle-nose forceps.","At 10:45 AM: Chen extracts the locket with needle-nose forceps.","Notice this clue: Chen extracts the locket with needle-nose forceps."],"hints":["Official government paper proving Clara owned the famous concerto first.","Clue hint: Think about 1965 copyright certificate.","Search for: a folded 1965 government copyright certificate bearing clara’s signature and seal."],"clues":["1965 copyright certificate","Item: 1965 copyright certificate","Clue Word: 1965 copyright certificate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '8d9363c1-d03c-520c-8ecb-f74dd3576787',
  'story_110',
  'ev_4',
  4,
  '11:00 AM',
  'Julian analyzes the sheet music notes of the dissonant fourth bar.',
  'Julian analyzes the sheet music notes of the dissonant fourth bar.',
  'The musical notes spell out the name "B-E-A-T-R-I-C-E" in classical cipher notation.',
  'Musical name cipher',
  'Ciphered Sheet Music',
  '["Random notes","Hymn tune","Scale exercise"]'::jsonb,
  'Musical name cipher',
  '["musical name cipher","musical cipher","beatrice cipher","name cipher","sheet cipher"]'::jsonb,
  'Notes in the melody spelling out the name of the rival who stole the piece.',
  'ev_5',
  false,
  '{"descriptions":["Julian analyzes the sheet music notes of the dissonant fourth bar.","At 11:00 AM: Julian analyzes the sheet music notes of the dissonant fourth bar.","Notice this clue: Julian analyzes the sheet music notes of the dissonant fourth bar."],"hints":["Notes in the melody spelling out the name of the rival who stole the piece.","Clue hint: Think about musical name cipher.","Search for: the musical notes spell out the name \"b-e-a-t-r-i-c-e\" in classical cipher notation."],"clues":["Musical name cipher","Item: Musical name cipher","Clue Word: Musical name cipher"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '568b5702-622d-53e3-a9ab-dcfc8dc5d8c1',
  'story_110',
  'ev_5',
  5,
  '11:20 AM',
  'Chen inspects the salon French doors.',
  'Chen inspects the salon French doors.',
  'Silver metal scratches on the exterior window latch matching Beatrice’s silver cane.',
  'Silver cane pry marks',
  'Window Toolmark Evidence',
  '["Crowbar dent","Broken glass","Shoe scuff"]'::jsonb,
  'Silver cane pry marks',
  '["silver cane pry marks","cane marks","silver cane","pry marks","cane pry marks"]'::jsonb,
  'Physical impressions left by Beatrice’s walking cane during the midnight break-in.',
  'ev_6',
  true,
  '{"descriptions":["Chen inspects the salon French doors.","At 11:20 AM: Chen inspects the salon French doors.","Notice this clue: Chen inspects the salon French doors."],"hints":["Physical impressions left by Beatrice’s walking cane during the midnight break-in.","Clue hint: Think about silver cane pry marks.","Search for: silver metal scratches on the exterior window latch matching beatrice’s silver cane."],"clues":["Silver cane pry marks","Item: Silver cane pry marks","Clue Word: Silver cane pry marks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f7b8b75e-c841-5c12-b58a-7033670f827b',
  'story_110',
  'ev_6',
  6,
  '11:40 AM',
  'Chen searches Beatrice’s velvet handbag.',
  'Chen searches Beatrice’s velvet handbag.',
  'A pair of wire clippers and Clara’s missing early sketchbooks.',
  'Wire clippers and sketchbooks',
  'Recovered Conservatory Sketches',
  '["Opera glasses","Makeup","Flask"]'::jsonb,
  'Wire clippers and sketchbooks',
  '["wire clippers and sketchbooks","wire clippers","sketchbooks","clara sketches","clippers"]'::jsonb,
  'Tools and stolen original music notebooks found in Beatrice’s possession.',
  'ev_7',
  false,
  '{"descriptions":["Chen searches Beatrice’s velvet handbag.","At 11:40 AM: Chen searches Beatrice’s velvet handbag.","Notice this clue: Chen searches Beatrice’s velvet handbag."],"hints":["Tools and stolen original music notebooks found in Beatrice’s possession.","Clue hint: Think about wire clippers and sketchbooks.","Search for: a pair of wire clippers and clara’s missing early sketchbooks."],"clues":["Wire clippers and sketchbooks","Item: Wire clippers and sketchbooks","Clue Word: Wire clippers and sketchbooks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'adde91c9-25d9-5cf2-9055-01a9bd56a094',
  'story_110',
  'ev_7',
  7,
  '12:00 PM',
  'Beatrice is confronted with the copyright certificate and cipher in the salon.',
  'Beatrice is confronted with the copyright certificate and cipher in the salon.',
  'Beatrice breaks down in tears, confessing she lived a lifelong lie of stolen fame.',
  'Beatrice’s confession',
  'Signed Fraud Admission',
  '["Denial","Storm out","Silence"]'::jsonb,
  'Beatrice’s confession',
  '["beatrice’s confession","confession","beatrice confession","signed admission","fraud admission"]'::jsonb,
  'Full emotional confession of stealing the masterpiece fifty years ago.',
  'ev_8',
  false,
  '{"descriptions":["Beatrice is confronted with the copyright certificate and cipher in the salon.","At 12:00 PM: Beatrice is confronted with the copyright certificate and cipher in the salon.","Notice this clue: Beatrice is confronted with the copyright certificate and cipher in the salon."],"hints":["Full emotional confession of stealing the masterpiece fifty years ago.","Clue hint: Think about beatrice’s confession.","Search for: beatrice breaks down in tears, confessing she lived a lifelong lie of stolen fame."],"clues":["Beatrice’s confession","Item: Beatrice’s confession","Clue Word: Beatrice’s confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '87e08d78-a79b-594c-acee-36e901f7e0b4',
  'story_110',
  'ev_8',
  8,
  '12:30 PM',
  'Julian sits at the piano with the locket placed on the music stand.',
  'Julian sits at the piano with the locket placed on the music stand.',
  'Julian performs the restored concerto under Clara’s true name in international tribute.',
  'Restored concerto tribute',
  'Historic Music Registry Update',
  '["Canceled concert","Lawsuit","Funeral silence"]'::jsonb,
  'Restored concerto tribute',
  '["restored concerto tribute","concerto tribute","restored tribute","music tribute","registry update"]'::jsonb,
  'Official restitution honoring Clara as the true genius of the century.',
  NULL,
  true,
  '{"descriptions":["Julian sits at the piano with the locket placed on the music stand.","At 12:30 PM: Julian sits at the piano with the locket placed on the music stand.","Notice this clue: Julian sits at the piano with the locket placed on the music stand."],"hints":["Official restitution honoring Clara as the true genius of the century.","Clue hint: Think about restored concerto tribute.","Search for: julian performs the restored concerto under clara’s true name in international tribute."],"clues":["Restored concerto tribute","Item: Restored concerto tribute","Clue Word: Restored concerto tribute"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_111 — THE LOCKET LOST IN 1968
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_111',
  'The Locket Lost in 1968',
  'Emotional Mystery',
  'The stormy sand dunes of Whispering Shoals beach, sea oats, rolling whitecaps, and rusted driftwood',
  'After a ferocious ocean storm washed away the sand dunes, a beachcomber uncovered an engraved gold locket containing two photographs and a desperate SOS note dated August 14, 1968.',
  '[{"name":"George Vance","role":"Grandson of the Tycoon","alibi":"Reviewing property boundaries on the beach","avatar":"🛥️"},{"name":"Mary Sterling (Victim in 1968)","role":"Vanished Heiress","alibi":"Lost at sea August 14, 1968","avatar":"🌊"},{"name":"Thomas Drake (Victim in 1968)","role":"Young Fisherman","alibi":"Lost at sea August 14, 1968","avatar":"⚓"},{"name":"Detective Clara Finch","role":"Cold Case Maritime Investigator","alibi":"Processing the exposed beach dune site","avatar":"🔍"},{"name":"Harrison Vance (Deceased Tycoon)","role":"Historical Culprit & Spurned Suitor","alibi":"Deceased in 1985; was at the yacht club during the 1968 storm","avatar":"⚓"}]'::jsonb,
  'In August 1968, fisherman Thomas and heiress Mary eloped on a small wooden sloop. Spurned suitor Harrison Vance drilled a pinhole into their fuel line. The boat lost power during the gale and crashed on the reef. Before drowning, Mary sealed their photos and a dying message into her watertight gold locket and cast it into the sea.',
  'Jealous Tycoon Harrison Vance (Deceased)',
  'Harrison sabotaged the young couple’s sailboat fuel line because the girl chose a poor fisherman over his millions.',
  '[{"time":"August 14, 1968 - 04:00 PM","event":"Harrison drills a pinhole in Thomas’s sailboat fuel line at the docks."},{"time":"August 14, 1968 - 06:00 PM","event":"Thomas and Mary set sail for Cape May as gale warnings sound."},{"time":"August 14, 1968 - 08:30 PM","event":"Fuel line fails; boat crashes on Whispering Shoals reef; Mary throws locket."},{"time":"August 15, 1968","event":"Harrison leads the search party, pretending to be heartbroken."},{"time":"Present Day - 08:00 AM","event":"A coastal storm erodes the sand dune, exposing the shiny gold locket."}]'::jsonb,
  '[{"id":"ev_1","title":"Watertight Gold Locket","detail":"Sealed gold heart washed ashore containing the photos and dying message of Mary Sterling."},{"id":"ev_2","title":"Victim’s Dying Message","detail":"Pencil-written wax paper reading: \"The engine died. Harrison cut the fuel. Thomas loves me.\""},{"id":"ev_3","title":"Harrison’s Written Confession","detail":"2010 deathbed letter by tycoon Harrison Vance admitting to drilling the fuel line."},{"id":"ev_4","title":"Victim’s Stolen Compass","detail":"Thomas Drake’s brass compass kept as a secret trophy in Harrison Vance’s study."}]'::jsonb,
  '[{"order":1,"title":"Beeswax-sealed gold locket","text":"The time capsule that preserved the truth beneath the ocean for fifty-six years."},{"order":2,"title":"Black-and-white portraits","text":"Identifies the long-lost victims of the 1968 storm."},{"order":3,"title":"Mary’s dying note","text":"Direct eyewitness testimony from the victim accusing Harrison Vance."},{"order":4,"title":"1968 drilled fuel pipe photo","text":"Physical forensic proof that the engine failure was deliberate sabotage."},{"order":5,"title":"Tycoon deathbed confession","text":"Conclusive documentary admission of the crime by the wealthy suitor."},{"order":6,"title":"Stolen brass compass trophy","text":"Smoking gun souvenir proving Harrison’s obsession and guilt."}]'::jsonb,
  'Fierce 1968 gale meteorological data: The storm was powerful, which Harrison counted on to hide his crime.; Rumors of sightings in Florida: False leads generated by Harrison in 1968 to stop police search efforts.',
  'Claim the couple successfully escaped to a deserted tropical island to live in paradise.',
  'NORMAL',
  'What happened to the young couple whose boat disappeared in the great storm of 1968?',
  '[{"character":"George Vance","secret":"A private letter from his grandfather admitting to the fuel line sabotage on his deathbed."},{"character":"Mary Sterling (Victim in 1968)","secret":"She carried her grandmother’s wedding ring into the deep sea."},{"character":"Thomas Drake (Victim in 1968)","secret":"He refused Harrison’s cash bribe to leave town."},{"character":"Detective Clara Finch","secret":"Her great-uncle was the coast guard skipper who conducted the failed 1968 search."},{"character":"Harrison Vance (Deceased Tycoon)","secret":"His pinhole drilling tool was hidden in his coastal estate basement."}]'::jsonb,
  '[{"lead":"Fierce 1968 gale meteorological data","explanation":"The storm was powerful, which Harrison counted on to hide his crime."},{"lead":"Rumors of sightings in Florida","explanation":"False leads generated by Harrison in 1968 to stop police search efforts."}]'::jsonb,
  '{"wrongTheories":["The young couple drowned accidentally because they set sail in an unseaworthy boat during a gale.","Thomas deliberately sank the boat to escape with Mary’s family jewelry under assumed names."],"correctTheory":"Harrison Vance sabotaged the sailboat fuel line out of jealousy, causing Mary and Thomas to drown in the storm of 1968."}'::jsonb,
  'Harrison Vance drilled a pinhole in the fuel line of Mary and Thomas’s boat; the dying lovers cast the locket into the sea.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The truth was recorded in history, Harrison Vance’s name was disgraced, and Mary and Thomas were honored in a coastal memorial."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The locket was sold to a pawn shop and melted down, keeping the tragic romance buried in the sea forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The media sensationalized the locket as a cursed pirate treasure, burying the real love story under folklore."}]'::jsonb,
  '{"intros":["After a ferocious ocean storm washed away the sand dunes, a beachcomber uncovered an engraved gold locket containing two photographs and a desperate SOS note dated August 14, 1968.","Case file story_111: After a ferocious ocean storm washed away the sand dunes, a beachcomber uncovered an engraved gold locket containing two photographs and a desperate SOS note dated August 14, 1968. Look closely at every clue.","Trouble begins in The stormy sand dunes of Whispering Shoals beach, sea oats, rolling whitecaps, and rusted driftwood. After a ferocious ocean storm washed away the sand dunes, a beachcomber uncovered an engraved gold locket containing two photographs and a desperate SOS note dated August 14, 1968.","The mystery starts now. After a ferocious ocean storm washed away the sand dunes, a beachcomber uncovered an engraved gold locket containing two photographs and a desperate SOS note dated August 14, 1968. Can you solve it?"],"reveals":["Harrison Vance drilled a pinhole in the fuel line of Mary and Thomas’s boat; the dying lovers cast the locket into the sea.","The mystery is unraveled! Harrison Vance drilled a pinhole in the fuel line of Mary and Thomas’s boat; the dying lovers cast the locket into the sea.","At last, the truth comes out: Harrison Vance drilled a pinhole in the fuel line of Mary and Thomas’s boat; the dying lovers cast the locket into the sea.","Case resolved! Here is what happened: Harrison Vance drilled a pinhole in the fuel line of Mary and Thomas’s boat; the dying lovers cast the locket into the sea."],"hints":["Pay attention to where Jealous Tycoon Harrison Vance (Deceased) was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_111';
DELETE FROM public.case_events WHERE case_id = 'story_111';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c688ffc9-80f1-5bca-a45d-182519e2550d',
  'story_111',
  'George Vance',
  'Grandson of the Tycoon',
  'Nervous heir, driving expensive beach rover, clutching grandfather’s old ship logbook',
  'My grandfather was a decorated naval hero! He spent three weeks searching for that lost boat in 1968.',
  'A private letter from his grandfather admitting to the fuel line sabotage on his deathbed.',
  'Reviewing property boundaries on the beach',
  'Grandson of the late tycoon Harrison Vance',
  'His grandfather kept Thomas’s navigation compass as a morbid trophy.',
  'Did not know the ocean currents would return the locket to shore fifty-six years later.',
  '🛥️',
  '["My grandfather was a decorated naval hero! He spent three weeks searching for that lost boat in 1968.","\"My grandfather was a decorated naval hero! He spent three weeks searching for that lost boat in 1968.\"","Listen to me: My grandfather was a decorated naval hero! He spent three weeks searching for that lost boat in 1968.","I tell you the truth: My grandfather was a decorated naval hero! He spent three weeks searching for that lost boat in 1968."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '84bc8dd6-e515-553b-9328-7af6466ec011',
  'story_111',
  'Mary Sterling (Victim in 1968)',
  'Vanished Heiress',
  'Passionate, devoted, portrait inside the locket shows a radiant smile beside Thomas',
  'Victim drowned in 1968; note inside locket reads: "The engine died. Harrison cut the fuel. Thomas loves me."',
  'She carried her grandmother’s wedding ring into the deep sea.',
  'Lost at sea August 14, 1968',
  'Betrothed to Thomas, pursued by Harrison',
  'Harrison had threatened that if he couldn’t have her, no one would.',
  'Did not know the pinhole in the fuel line would starve the engine in heavy surf.',
  '🌊',
  '["Victim drowned in 1968; note inside locket reads: \"The engine died. Harrison cut the fuel. Thomas loves me.\"","\"Victim drowned in 1968; note inside locket reads: \"The engine died. Harrison cut the fuel. Thomas loves me.\"\"","Listen to me: Victim drowned in 1968; note inside locket reads: \"The engine died. Harrison cut the fuel. Thomas loves me.\"","I tell you the truth: Victim drowned in 1968; note inside locket reads: \"The engine died. Harrison cut the fuel. Thomas loves me.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c9e2757c-c5a4-5042-9140-a232bed22d2a',
  'story_111',
  'Thomas Drake (Victim in 1968)',
  'Young Fisherman',
  'Honorable, brave, gave his only lifejacket to Mary during the storm',
  'Victim drowned in 1968; photo shows him at the helm in yellow oilskins.',
  'He refused Harrison’s cash bribe to leave town.',
  'Lost at sea August 14, 1968',
  'True love of Mary',
  'The fuel gauge showed full when they departed the harbor.',
  'Could not restart the engine once air sucked into the carburetor.',
  '⚓',
  '["Victim drowned in 1968; photo shows him at the helm in yellow oilskins.","\"Victim drowned in 1968; photo shows him at the helm in yellow oilskins.\"","Listen to me: Victim drowned in 1968; photo shows him at the helm in yellow oilskins.","I tell you the truth: Victim drowned in 1968; photo shows him at the helm in yellow oilskins."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '25d8053e-fc6f-5686-ba6f-225c1085e44e',
  'story_111',
  'Detective Clara Finch',
  'Cold Case Maritime Investigator',
  'Compassionate, windbreaker, holding waterproof evidence containers and magnifying glass',
  'Gold does not corrode in salt water. After fifty-six years, the truth has finally washed ashore.',
  'Her great-uncle was the coast guard skipper who conducted the failed 1968 search.',
  'Processing the exposed beach dune site',
  'Investigating the historical maritime cold case',
  'The 1968 salvage wreck report noted the engine cut out right before the reef impact.',
  'Did not know George held the deathbed confession letter in his briefcase.',
  '🔍',
  '["Gold does not corrode in salt water. After fifty-six years, the truth has finally washed ashore.","\"Gold does not corrode in salt water. After fifty-six years, the truth has finally washed ashore.\"","Listen to me: Gold does not corrode in salt water. After fifty-six years, the truth has finally washed ashore.","I tell you the truth: Gold does not corrode in salt water. After fifty-six years, the truth has finally washed ashore."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4954eee1-ffa1-5a84-aca6-1980ebf2e10e',
  'story_111',
  'Harrison Vance (Deceased Tycoon)',
  'Historical Culprit & Spurned Suitor',
  'Arrogant, vengeful millionaire who could not accept rejection',
  'Deceased in 1985; left behind a locked safe and a deathbed confession letter.',
  'His pinhole drilling tool was hidden in his coastal estate basement.',
  'Deceased in 1985; was at the yacht club during the 1968 storm',
  'Spurned suitor of Mary Sterling and grandfather of George',
  'The wooden sloop could not survive heavy surf without an engine.',
  'Did not know the ocean currents would return Mary’s gold locket to shore fifty-six years later.',
  '⚓',
  '["Deceased in 1985; left behind a locked safe and a deathbed confession letter.","\"Deceased in 1985; left behind a locked safe and a deathbed confession letter.\"","Listen to me: Deceased in 1985; left behind a locked safe and a deathbed confession letter.","I tell you the truth: Deceased in 1985; left behind a locked safe and a deathbed confession letter."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cec19614-cca7-5b70-8ab6-20d0e551dbf5',
  'story_111',
  'ev_1',
  1,
  'Present Day - 08:00 AM',
  'A beachcomber’s metal detector beeps over exposed shell beds.',
  'A beachcomber’s metal detector beeps over exposed shell beds.',
  'A heavy 18-karat gold heart locket sealed with waterproof beeswax.',
  'Beeswax-sealed gold locket',
  'Watertight Gold Locket',
  '["Brass coin","Rusted belt buckle","Bottle cap"]'::jsonb,
  'Beeswax-sealed gold locket',
  '["beeswax-sealed gold locket","gold locket","locket","sealed locket","heart locket"]'::jsonb,
  'Gold heirloom preserved in sea sand for over fifty years.',
  'ev_2',
  true,
  '{"descriptions":["A beachcomber’s metal detector beeps over exposed shell beds.","At Present Day - 08:00 AM: A beachcomber’s metal detector beeps over exposed shell beds.","Notice this clue: A beachcomber’s metal detector beeps over exposed shell beds."],"hints":["Gold heirloom preserved in sea sand for over fifty years.","Clue hint: Think about beeswax-sealed gold locket.","Search for: a heavy 18-karat gold heart locket sealed with waterproof beeswax."],"clues":["Beeswax-sealed gold locket","Item: Beeswax-sealed gold locket","Clue Word: Beeswax-sealed gold locket"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '22cb7f03-e357-568f-8e3c-532d2e3daf71',
  'story_111',
  'ev_2',
  2,
  'Present Day - 08:30 AM',
  'Detective Finch breaks the wax seal on the locket.',
  'Detective Finch breaks the wax seal on the locket.',
  'Two black-and-white portraits of Mary and Thomas and a folded wax-paper note.',
  'Black-and-white portraits',
  'Locket Photographs',
  '["Lock of hair","Dried flower","Miniature cross"]'::jsonb,
  'Black-and-white portraits',
  '["black-and-white portraits","portraits","locket photos","photographs","photos"]'::jsonb,
  'Vintage pictures of the young runaway lovers from 1968.',
  'ev_3',
  false,
  '{"descriptions":["Detective Finch breaks the wax seal on the locket.","At Present Day - 08:30 AM: Detective Finch breaks the wax seal on the locket.","Notice this clue: Detective Finch breaks the wax seal on the locket."],"hints":["Vintage pictures of the young runaway lovers from 1968.","Clue hint: Think about black-and-white portraits.","Search for: two black-and-white portraits of mary and thomas and a folded wax-paper note."],"clues":["Black-and-white portraits","Item: Black-and-white portraits","Clue Word: Black-and-white portraits"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a9106afe-3c8b-58d5-8924-88b75facedd7',
  'story_111',
  'ev_3',
  3,
  'Present Day - 09:00 AM',
  'Finch unfolds the wax paper under magnification.',
  'Finch unfolds the wax paper under magnification.',
  'Mary’s dying handwriting: "The engine died. Harrison cut the fuel. Thomas loves me."',
  'Mary’s dying note',
  'Victim’s Dying Message',
  '["Poem","Map","Coordinates"]'::jsonb,
  'Mary’s dying note',
  '["mary’s dying note","dying note","mary note","wax paper note","dying message"]'::jsonb,
  'Desperate handwritten note naming Harrison Vance as the saboteur.',
  'ev_4',
  false,
  '{"descriptions":["Finch unfolds the wax paper under magnification.","At Present Day - 09:00 AM: Finch unfolds the wax paper under magnification.","Notice this clue: Finch unfolds the wax paper under magnification."],"hints":["Desperate handwritten note naming Harrison Vance as the saboteur.","Clue hint: Think about mary’s dying note.","Search for: mary’s dying handwriting: \"the engine died. harrison cut the fuel. thomas loves me.\""],"clues":["Mary’s dying note","Item: Mary’s dying note","Clue Word: Mary’s dying note"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7cd024ed-974f-5cb5-ae2e-76a2f5067efd',
  'story_111',
  'ev_4',
  4,
  'Present Day - 09:45 AM',
  'Finch pulls the 1968 Coast Guard wreckage report from county archives.',
  'Finch pulls the 1968 Coast Guard wreckage report from county archives.',
  'A photograph of the recovered engine pipe showing a drilled 1mm hole.',
  '1968 drilled fuel pipe photo',
  'Archive Wreckage Report',
  '["Shattered hull","Torn sail","Broken rudder"]'::jsonb,
  '1968 drilled fuel pipe photo',
  '["1968 drilled fuel pipe photo","drilled pipe","fuel pipe photo","wreckage report","drilled fuel pipe"]'::jsonb,
  'Historical police photo showing mechanical sabotage to the fuel line.',
  'ev_5',
  false,
  '{"descriptions":["Finch pulls the 1968 Coast Guard wreckage report from county archives.","At Present Day - 09:45 AM: Finch pulls the 1968 Coast Guard wreckage report from county archives.","Notice this clue: Finch pulls the 1968 Coast Guard wreckage report from county archives."],"hints":["Historical police photo showing mechanical sabotage to the fuel line.","Clue hint: Think about 1968 drilled fuel pipe photo.","Search for: a photograph of the recovered engine pipe showing a drilled 1mm hole."],"clues":["1968 drilled fuel pipe photo","Item: 1968 drilled fuel pipe photo","Clue Word: 1968 drilled fuel pipe photo"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3a48a3f2-959e-5b4c-bc6a-c7d63bb15031',
  'story_111',
  'ev_5',
  5,
  'Present Day - 10:30 AM',
  'Finch confronts George Vance on the beach dune.',
  'Finch confronts George Vance on the beach dune.',
  'George’s leather briefcase containing Harrison Vance’s 2010 deathbed confession.',
  'Tycoon deathbed confession',
  'Harrison’s Written Confession',
  '["Will","Deed","Bank ledger"]'::jsonb,
  'Tycoon deathbed confession',
  '["tycoon deathbed confession","deathbed confession","harrison confession","tycoon confession","confession letter"]'::jsonb,
  'Written admission by the elderly tycoon before his death admitting the fuel sabotage.',
  'ev_6',
  true,
  '{"descriptions":["Finch confronts George Vance on the beach dune.","At Present Day - 10:30 AM: Finch confronts George Vance on the beach dune.","Notice this clue: Finch confronts George Vance on the beach dune."],"hints":["Written admission by the elderly tycoon before his death admitting the fuel sabotage.","Clue hint: Think about tycoon deathbed confession.","Search for: george’s leather briefcase containing harrison vance’s 2010 deathbed confession."],"clues":["Tycoon deathbed confession","Item: Tycoon deathbed confession","Clue Word: Tycoon deathbed confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '5fdc76a5-1d75-5cf9-9ddd-35d68795ab84',
  'story_111',
  'ev_6',
  6,
  'Present Day - 11:15 AM',
  'Finch searches the Vance family estate trophy room.',
  'Finch searches the Vance family estate trophy room.',
  'Thomas Drake’s antique brass maritime compass kept in Harrison’s display case.',
  'Stolen brass compass trophy',
  'Victim’s Stolen Compass',
  '["Hunting rifle","Silver cup","Mounted fish"]'::jsonb,
  'Stolen brass compass trophy',
  '["stolen brass compass trophy","brass compass","stolen compass","compass","compass trophy"]'::jsonb,
  'Morbid souvenir kept by the killer taken from the wreckage in 1968.',
  'ev_7',
  false,
  '{"descriptions":["Finch searches the Vance family estate trophy room.","At Present Day - 11:15 AM: Finch searches the Vance family estate trophy room.","Notice this clue: Finch searches the Vance family estate trophy room."],"hints":["Morbid souvenir kept by the killer taken from the wreckage in 1968.","Clue hint: Think about stolen brass compass trophy.","Search for: thomas drake’s antique brass maritime compass kept in harrison’s display case."],"clues":["Stolen brass compass trophy","Item: Stolen brass compass trophy","Clue Word: Stolen brass compass trophy"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6aad989c-ab06-53d6-8d2d-9526219d9bca',
  'story_111',
  'ev_7',
  7,
  'Present Day - 12:00 PM',
  'George Vance surrenders all historical family documentation to the court.',
  'George Vance surrenders all historical family documentation to the court.',
  'George officially apologizing on behalf of the family and dedicating an estate park.',
  'Vance family restitution decree',
  'Formal Restitution Document',
  '["Lawsuit defense","Denial statement","Settlement check"]'::jsonb,
  'Vance family restitution decree',
  '["vance family restitution decree","restitution decree","restitution document","formal apology","decree"]'::jsonb,
  'Legal acknowledgment bringing historical justice to the drowned couple.',
  'ev_8',
  false,
  '{"descriptions":["George Vance surrenders all historical family documentation to the court.","At Present Day - 12:00 PM: George Vance surrenders all historical family documentation to the court.","Notice this clue: George Vance surrenders all historical family documentation to the court."],"hints":["Legal acknowledgment bringing historical justice to the drowned couple.","Clue hint: Think about vance family restitution decree.","Search for: george officially apologizing on behalf of the family and dedicating an estate park."],"clues":["Vance family restitution decree","Item: Vance family restitution decree","Clue Word: Vance family restitution decree"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c1de0dbe-5969-5735-b7db-37e8a8c718b2',
  'story_111',
  'ev_8',
  8,
  'Present Day - 01:00 PM',
  'A memorial marker is unveiled on Whispering Shoals beach.',
  'A memorial marker is unveiled on Whispering Shoals beach.',
  'Mary and Thomas officially honored together in permanent coastal stone.',
  'Lovers’ memorial stone',
  'Beach Memorial Monument',
  '["Lighthouse","Dock banner","Plaque in church"]'::jsonb,
  'Lovers’ memorial stone',
  '["lovers’ memorial stone","memorial stone","lovers memorial","monument","memorial"]'::jsonb,
  'Stone memorial ensuring the truth of their love and sacrifice is never forgotten.',
  NULL,
  true,
  '{"descriptions":["A memorial marker is unveiled on Whispering Shoals beach.","At Present Day - 01:00 PM: A memorial marker is unveiled on Whispering Shoals beach.","Notice this clue: A memorial marker is unveiled on Whispering Shoals beach."],"hints":["Stone memorial ensuring the truth of their love and sacrifice is never forgotten.","Clue hint: Think about lovers’ memorial stone.","Search for: mary and thomas officially honored together in permanent coastal stone."],"clues":["Lovers’ memorial stone","Item: Lovers’ memorial stone","Clue Word: Lovers’ memorial stone"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_112 — THE HOSPITAL ROOM 204
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_112',
  'The Hospital Room 204',
  'Emotional Mystery',
  'St. Mary’s Palliative Hospital room 204, beeping heart monitors, white curtains, nightstand with fresh flowers, and rain on the window',
  'Every morning at 06:00 AM, a newly folded origami paper crane made from vintage watercolor paper was placed on the nightstand of a comatose grandmother, with no visitor logged in the hospital security registry.',
  '[{"name":"Maya Lin","role":"Estranged Granddaughter & Volunteer","alibi":"Preparing coffee in the ground-floor hospital cafeteria at dawn","avatar":"🕊️"},{"name":"Clara Lin (Comatose Patient)","role":"Beloved Grandmother","alibi":"Comatose in room 204","avatar":"👵"},{"name":"Nurse Hannah Cole","role":"Night Ward Nurse","alibi":"Administering morning medications at the nurses’ station","avatar":"👩‍⚕️"},{"name":"Detective Ray Vance","role":"Hospital Security Investigator","alibi":"Reviewing corridor hallway CCTV footage","avatar":"🔍"}]'::jsonb,
  'Ten years ago, Maya had a bitter argument with her grandmother Clara and ran away. When Clara fell into a coma, a remorseful Maya volunteered in the hospital cafeteria. Every dawn before security shifts rotated, Maya left an origami crane folded from Clara’s old paintings, each containing a tiny handwritten apology inside the folds.',
  'Estranged Granddaughter Maya Lin',
  'Maya was seeking forgiveness after running away ten years ago, but felt too ashamed to reveal herself while awake.',
  '[{"time":"05:30 AM","event":"Maya begins her shift in the hospital kitchen prep room."},{"time":"05:45 AM","event":"Maya folds an origami crane from a strip of Clara’s old watercolor landscape."},{"time":"05:52 AM","event":"Maya uses the kitchen service stairs to reach the second floor."},{"time":"05:55 AM","event":"Maya places the crane beside Clara’s hand, kisses her forehead, and slips away."},{"time":"06:00 AM","event":"Nurse Hannah enters room 204 and discovers the 100th origami crane."}]'::jsonb,
  '[{"id":"ev_1","title":"100th Origami Crane","detail":"The milestone paper bird folded from Clara’s original watercolor art."},{"id":"ev_2","title":"Granddaughter Apology Note","detail":"Hidden writing inside the crane proving Maya was the phantom visitor."},{"id":"ev_3","title":"Stairwell Access Record","detail":"Door swipe proving Volunteer Fob #14 entered the ward at 05:51 AM."},{"id":"ev_4","title":"Family Reconciliation","detail":"Maya bedside at Clara’s hospital bed, holding hands in tears of forgiveness."}]'::jsonb,
  '[{"order":1,"title":"Indigo watercolor paper crane","text":"The artistic tokens left at the patient’s bedside every morning."},{"order":2,"title":"Unfolded crane apology","text":"Reveals the secret identity and emotional motive of the phantom visitor."},{"order":3,"title":"French watercolor rag paper","text":"Ties the paper directly to Clara’s private painting supplies."},{"order":4,"title":"Volunteer fob stairwell scan","text":"Pinpoints how the visitor bypassed visitor registration every dawn."},{"order":5,"title":"Cafeteria volunteer roster","text":"Unmasks the missing granddaughter hiding in plain sight in the hospital."},{"order":6,"title":"Bone folding tool in apron","text":"Physical tool link found in Maya’s uniform."}]'::jsonb,
  'Late-night priest visits to the ward: Father Thomas gave evening blessings, unrelated to the dawn cranes.; Faulty hallway motion sensor: The sensor blinked intermittently due to low voltage, not paranormal ghosts.',
  'Claim an ethereal guardian spirit visited the room each morning.',
  'NORMAL',
  'Who was slipping past hospital security to leave the paper cranes, and what message did they hold?',
  '[{"character":"Maya Lin","secret":"A pair of paper-folding tweezers and strips of watercolor paper in her apron pocket."},{"character":"Clara Lin (Comatose Patient)","secret":"A bank trust fund established exclusively in Maya’s name."},{"character":"Nurse Hannah Cole","secret":"She noticed Maya crying outside room 204 three nights ago."},{"character":"Detective Ray Vance","secret":"He was asked by the family lawyer to find Maya before Clara passed away."}]'::jsonb,
  '[{"lead":"Late-night priest visits to the ward","explanation":"Father Thomas gave evening blessings, unrelated to the dawn cranes."},{"lead":"Faulty hallway motion sensor","explanation":"The sensor blinked intermittently due to low voltage, not paranormal ghosts."}]'::jsonb,
  '{"wrongTheories":["A hospital burglar was casing the room to steal Clara’s jewelry at dawn.","An angelic spiritual presence was folding the paper cranes through divine intervention."],"correctTheory":"Estranged granddaughter Maya Lin took a hospital volunteer job and left 100 origami cranes with apologies to beg her comatose grandmother for forgiveness."}'::jsonb,
  'Estranged granddaughter Maya Lin volunteered in the kitchen and left daily cranes with apologies, reuniting with her grandmother before she woke.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Clara awakened, forgave Maya, and the family was joyfully reunited as Clara recovered at home."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Security banned Maya from the building, and Clara passed away in silence without ever knowing Maya returned."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The story was dismissed as a hospital marketing stunt, leaving the granddaughter forgotten in the kitchen."}]'::jsonb,
  '{"intros":["Every morning at 06:00 AM, a newly folded origami paper crane made from vintage watercolor paper was placed on the nightstand of a comatose grandmother, with no visitor logged in the hospital security registry.","Case file story_112: Every morning at 06:00 AM, a newly folded origami paper crane made from vintage watercolor paper was placed on the nightstand of a comatose grandmother, with no visitor logged in the hospital security registry. Look closely at every clue.","Trouble begins in St. Mary’s Palliative Hospital room 204, beeping heart monitors, white curtains, nightstand with fresh flowers, and rain on the window. Every morning at 06:00 AM, a newly folded origami paper crane made from vintage watercolor paper was placed on the nightstand of a comatose grandmother, with no visitor logged in the hospital security registry.","The mystery starts now. Every morning at 06:00 AM, a newly folded origami paper crane made from vintage watercolor paper was placed on the nightstand of a comatose grandmother, with no visitor logged in the hospital security registry. Can you solve it?"],"reveals":["Estranged granddaughter Maya Lin volunteered in the kitchen and left daily cranes with apologies, reuniting with her grandmother before she woke.","The mystery is unraveled! Estranged granddaughter Maya Lin volunteered in the kitchen and left daily cranes with apologies, reuniting with her grandmother before she woke.","At last, the truth comes out: Estranged granddaughter Maya Lin volunteered in the kitchen and left daily cranes with apologies, reuniting with her grandmother before she woke.","Case resolved! Here is what happened: Estranged granddaughter Maya Lin volunteered in the kitchen and left daily cranes with apologies, reuniting with her grandmother before she woke."],"hints":["Pay attention to where Estranged Granddaughter Maya Lin was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_112';
DELETE FROM public.case_events WHERE case_id = 'story_112';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '57559f4c-06e1-5da2-a59c-03d683b3a2f2',
  'story_112',
  'Maya Lin',
  'Estranged Granddaughter & Volunteer',
  'Quiet, wearing green volunteer smock, ink-stained fingertips, dark circles under her eyes, deep regret',
  'I just deliver the morning breakfast trays to the third floor. I don’t know about room 204.',
  'A pair of paper-folding tweezers and strips of watercolor paper in her apron pocket.',
  'Preparing coffee in the ground-floor hospital cafeteria at dawn',
  'Granddaughter of comatose patient Clara Lin',
  'Clara taught her how to fold paper cranes when she was five years old.',
  'Did not know Clara’s brainwave monitor showed sudden active spikes whenever the cranes arrived.',
  '🕊️',
  '["I just deliver the morning breakfast trays to the third floor. I don’t know about room 204.","\"I just deliver the morning breakfast trays to the third floor. I don’t know about room 204.\"","Listen to me: I just deliver the morning breakfast trays to the third floor. I don’t know about room 204.","I tell you the truth: I just deliver the morning breakfast trays to the third floor. I don’t know about room 204."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4e146157-0bb5-5a0c-a0fe-5bfd724f09e0',
  'story_112',
  'Clara Lin (Comatose Patient)',
  'Beloved Grandmother',
  'Frail retired painter, sleeping peacefully with heart monitor leads attached',
  'Comatose victim of stroke; her bedside diary ends with: "I pray Maya comes home before I close my eyes."',
  'A bank trust fund established exclusively in Maya’s name.',
  'Comatose in room 204',
  'Grandmother who raised Maya after her parents passed',
  'Maya’s favorite colors were indigo and rose watercolor.',
  'Unconscious, but physiological signs respond to familiar voices.',
  '👵',
  '["Comatose victim of stroke; her bedside diary ends with: \"I pray Maya comes home before I close my eyes.\"","\"Comatose victim of stroke; her bedside diary ends with: \"I pray Maya comes home before I close my eyes.\"\"","Listen to me: Comatose victim of stroke; her bedside diary ends with: \"I pray Maya comes home before I close my eyes.\"","I tell you the truth: Comatose victim of stroke; her bedside diary ends with: \"I pray Maya comes home before I close my eyes.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '46b75eab-845f-53f9-883a-33c4373d5c37',
  'story_112',
  'Nurse Hannah Cole',
  'Night Ward Nurse',
  'Attentive, carrying medical clipboard, kind eyes, protective of her patients',
  'Room 204 was completely empty at 05:45 AM. At 06:00 AM, the crane was sitting beside the lilies.',
  'She noticed Maya crying outside room 204 three nights ago.',
  'Administering morning medications at the nurses’ station',
  'Primary night nurse for room 204',
  'The paper used to fold the birds has the faint aroma of lavender painting oil.',
  'Did not know the secret messages were written on the inside of the folded paper.',
  '👩‍⚕️',
  '["Room 204 was completely empty at 05:45 AM. At 06:00 AM, the crane was sitting beside the lilies.","\"Room 204 was completely empty at 05:45 AM. At 06:00 AM, the crane was sitting beside the lilies.\"","Listen to me: Room 204 was completely empty at 05:45 AM. At 06:00 AM, the crane was sitting beside the lilies.","I tell you the truth: Room 204 was completely empty at 05:45 AM. At 06:00 AM, the crane was sitting beside the lilies."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'a43c44a8-9841-5ace-9040-4f644ecfb7e1',
  'story_112',
  'Detective Ray Vance',
  'Hospital Security Investigator',
  'Gentle, methodical, wearing plain clothes, carrying badge and camera',
  'Unregistered visitors in palliative care are usually driven by love or guilt, not crime.',
  'He was asked by the family lawyer to find Maya before Clara passed away.',
  'Reviewing corridor hallway CCTV footage',
  'Investigating the mysterious security bypass',
  'The stairwell door alarm was bypassed with a cafeteria magnetic access fob.',
  'Did not realize the cafeteria volunteer was the missing granddaughter.',
  '🔍',
  '["Unregistered visitors in palliative care are usually driven by love or guilt, not crime.","\"Unregistered visitors in palliative care are usually driven by love or guilt, not crime.\"","Listen to me: Unregistered visitors in palliative care are usually driven by love or guilt, not crime.","I tell you the truth: Unregistered visitors in palliative care are usually driven by love or guilt, not crime."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1a2acd82-699c-5db1-b1b2-85d475fb615f',
  'story_112',
  'ev_1',
  1,
  '06:00 AM',
  'Nurse Hannah finds a new origami crane on the bedside table.',
  'Nurse Hannah finds a new origami crane on the bedside table.',
  'An intricate paper crane folded from textured indigo watercolor paper.',
  'Indigo watercolor paper crane',
  '100th Origami Crane',
  '["Plastic flower","Greeting card","Candle"]'::jsonb,
  'Indigo watercolor paper crane',
  '["indigo watercolor paper crane","origami crane","paper crane","crane","watercolor crane"]'::jsonb,
  'Hand-folded paper bird placed beside the sleeping patient.',
  'ev_2',
  true,
  '{"descriptions":["Nurse Hannah finds a new origami crane on the bedside table.","At 06:00 AM: Nurse Hannah finds a new origami crane on the bedside table.","Notice this clue: Nurse Hannah finds a new origami crane on the bedside table."],"hints":["Hand-folded paper bird placed beside the sleeping patient.","Clue hint: Think about indigo watercolor paper crane.","Search for: an intricate paper crane folded from textured indigo watercolor paper."],"clues":["Indigo watercolor paper crane","Item: Indigo watercolor paper crane","Clue Word: Indigo watercolor paper crane"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e1ff3cd7-bfe9-57ac-9966-b03c80924c77',
  'story_112',
  'ev_2',
  2,
  '06:15 AM',
  'Detective Vance unfolds one of the previous cranes.',
  'Detective Vance unfolds one of the previous cranes.',
  'Handwritten ink inside the paper: "Day 99: Grandma, please wake up. I’m so sorry I left. - Maya".',
  'Unfolded crane apology',
  'Granddaughter Apology Note',
  '["Medical bill","Bible verse","Song lyric"]'::jsonb,
  'Unfolded crane apology',
  '["unfolded crane apology","crane apology","apology note","maya note","handwritten apology"]'::jsonb,
  'Words written on the interior folds of the paper crane begging for forgiveness.',
  'ev_3',
  false,
  '{"descriptions":["Detective Vance unfolds one of the previous cranes.","At 06:15 AM: Detective Vance unfolds one of the previous cranes.","Notice this clue: Detective Vance unfolds one of the previous cranes."],"hints":["Words written on the interior folds of the paper crane begging for forgiveness.","Clue hint: Think about unfolded crane apology.","Search for: handwritten ink inside the paper: \"day 99: grandma, please wake up. i’m so sorry i left. - maya\"."],"clues":["Unfolded crane apology","Item: Unfolded crane apology","Clue Word: Unfolded crane apology"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7bda3f65-0c85-5f53-8ef4-3d344d728270',
  'story_112',
  'ev_3',
  3,
  '06:30 AM',
  'Vance recognizes the unique texture of the paper.',
  'Vance recognizes the unique texture of the paper.',
  'Heavy French rag paper matching Clara’s personal art studio supply.',
  'French watercolor rag paper',
  'Artist Paper Match',
  '["Newspaper","Copy paper","Origami sheet"]'::jsonb,
  'French watercolor rag paper',
  '["french watercolor rag paper","rag paper","watercolor paper","french paper","artist paper"]'::jsonb,
  'High-end painting paper showing the visitor had access to Clara’s old art supplies.',
  'ev_4',
  false,
  '{"descriptions":["Vance recognizes the unique texture of the paper.","At 06:30 AM: Vance recognizes the unique texture of the paper.","Notice this clue: Vance recognizes the unique texture of the paper."],"hints":["High-end painting paper showing the visitor had access to Clara’s old art supplies.","Clue hint: Think about french watercolor rag paper.","Search for: heavy french rag paper matching clara’s personal art studio supply."],"clues":["French watercolor rag paper","Item: French watercolor rag paper","Clue Word: French watercolor rag paper"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '48fffad4-59ef-589f-a379-bc77a556eced',
  'story_112',
  'ev_4',
  4,
  '06:45 AM',
  'Vance checks the second-floor stairwell door logs.',
  'Vance checks the second-floor stairwell door logs.',
  'An access scan from Cafeteria Volunteer Fob #14 at 05:51 AM.',
  'Volunteer fob stairwell scan',
  'Stairwell Access Record',
  '["Master key","Doctor badge","Visitor pass"]'::jsonb,
  'Volunteer fob stairwell scan',
  '["volunteer fob stairwell scan","volunteer fob","stairwell scan","fob scan","access record"]'::jsonb,
  'Electronic door record tracing the phantom visitor to the kitchen staff.',
  'ev_5',
  false,
  '{"descriptions":["Vance checks the second-floor stairwell door logs.","At 06:45 AM: Vance checks the second-floor stairwell door logs.","Notice this clue: Vance checks the second-floor stairwell door logs."],"hints":["Electronic door record tracing the phantom visitor to the kitchen staff.","Clue hint: Think about volunteer fob stairwell scan.","Search for: an access scan from cafeteria volunteer fob #14 at 05:51 am."],"clues":["Volunteer fob stairwell scan","Item: Volunteer fob stairwell scan","Clue Word: Volunteer fob stairwell scan"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '29166927-c5b1-5180-bb88-5cba8035660e',
  'story_112',
  'ev_5',
  5,
  '07:00 AM',
  'Vance checks the roster for Volunteer Fob #14.',
  'Vance checks the roster for Volunteer Fob #14.',
  'Fob issued to cafeteria worker "Maya Lin" who started working two months ago.',
  'Cafeteria volunteer roster',
  'Hospital Volunteer Log',
  '["Nurse roster","Doctor schedule","Security list"]'::jsonb,
  'Cafeteria volunteer roster',
  '["cafeteria volunteer roster","volunteer roster","volunteer log","maya lin roster","roster"]'::jsonb,
  'Hospital employment file confirming Maya was working in the building.',
  'ev_6',
  true,
  '{"descriptions":["Vance checks the roster for Volunteer Fob #14.","At 07:00 AM: Vance checks the roster for Volunteer Fob #14.","Notice this clue: Vance checks the roster for Volunteer Fob #14."],"hints":["Hospital employment file confirming Maya was working in the building.","Clue hint: Think about cafeteria volunteer roster.","Search for: fob issued to cafeteria worker \"maya lin\" who started working two months ago."],"clues":["Cafeteria volunteer roster","Item: Cafeteria volunteer roster","Clue Word: Cafeteria volunteer roster"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '639ed5e3-53e1-5b7f-9908-f1e972743b14',
  'story_112',
  'ev_6',
  6,
  '07:15 AM',
  'Vance approaches Maya in the cafeteria kitchen.',
  'Vance approaches Maya in the cafeteria kitchen.',
  'Maya’s apron pocket holding paper folding bone-folders and watercolor strips.',
  'Bone folding tool in apron',
  'Paper Folding Tools',
  '["Kitchen knife","Spoon","Peeler"]'::jsonb,
  'Bone folding tool in apron',
  '["bone folding tool in apron","bone folder","folding tool","apron tool","tools"]'::jsonb,
  'Craft tool used to make crisp, perfect folds in heavy watercolor paper.',
  'ev_7',
  false,
  '{"descriptions":["Vance approaches Maya in the cafeteria kitchen.","At 07:15 AM: Vance approaches Maya in the cafeteria kitchen.","Notice this clue: Vance approaches Maya in the cafeteria kitchen."],"hints":["Craft tool used to make crisp, perfect folds in heavy watercolor paper.","Clue hint: Think about bone folding tool in apron.","Search for: maya’s apron pocket holding paper folding bone-folders and watercolor strips."],"clues":["Bone folding tool in apron","Item: Bone folding tool in apron","Clue Word: Bone folding tool in apron"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ab2695dc-2083-5aa6-bc54-df588afeaecf',
  'story_112',
  'ev_7',
  7,
  '07:30 AM',
  'Vance gently invites Maya to room 204 without fear.',
  'Vance gently invites Maya to room 204 without fear.',
  'Maya breaking into tears and walking into Clara’s room to take her hand.',
  'Granddaughter’s reunion',
  'Family Reconciliation',
  '["Arrest","Interrogation","Eviction"]'::jsonb,
  'Granddaughter’s reunion',
  '["granddaughter’s reunion","reunion","reconciliation","family reunion","bedside reunion"]'::jsonb,
  'Emotional return of the long-lost granddaughter to her grandmother’s side.',
  'ev_8',
  false,
  '{"descriptions":["Vance gently invites Maya to room 204 without fear.","At 07:30 AM: Vance gently invites Maya to room 204 without fear.","Notice this clue: Vance gently invites Maya to room 204 without fear."],"hints":["Emotional return of the long-lost granddaughter to her grandmother’s side.","Clue hint: Think about granddaughter’s reunion.","Search for: maya breaking into tears and walking into clara’s room to take her hand."],"clues":["Granddaughter’s reunion","Item: Granddaughter’s reunion","Clue Word: Granddaughter’s reunion"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '58cf64be-5fa3-5003-9971-8467a1bd9dfa',
  'story_112',
  'ev_8',
  8,
  '07:45 AM',
  'Clara’s heart monitor stabilizes as she opens her eyes.',
  'Clara’s heart monitor stabilizes as she opens her eyes.',
  'Clara wakes from her coma, whispers "My little crane," and squeezes Maya’s hand.',
  'Grandmother awakens',
  'Medical Awakening Record',
  '["Flatline","Deep sleep","Transfer"]'::jsonb,
  'Grandmother awakens',
  '["grandmother awakens","awakening","clara awakens","medical record"]'::jsonb,
  'Miraculous emotional breakthrough as love and forgiveness heal the family.',
  NULL,
  true,
  '{"descriptions":["Clara’s heart monitor stabilizes as she opens her eyes.","At 07:45 AM: Clara’s heart monitor stabilizes as she opens her eyes.","Notice this clue: Clara’s heart monitor stabilizes as she opens her eyes."],"hints":["Miraculous emotional breakthrough as love and forgiveness heal the family.","Clue hint: Think about grandmother awakens.","Search for: clara wakes from her coma, whispers \"my little crane,\" and squeezes maya’s hand."],"clues":["Grandmother awakens","Item: Grandmother awakens","Clue Word: Grandmother awakens"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_113 — THE UNSENT LETTERS OF PRIVATE JAMES
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_113',
  'The Unsent Letters of Private James',
  'Emotional Mystery',
  'The dusty attic rafters of an old farmhouse in Meadowbrook, sunbeams, dry pine floorboards, and antique steamer trunks',
  'During attic roof repairs, a carpenter lifted a loose floorboard and discovered a rusted steel military ammo box containing forty unsent love letters written by a soldier who was reported missing in action in 1944.',
  '[{"name":"Thomas Vance (Historical)","role":"Jealous Older Brother","alibi":"Deceased former owner of the farmhouse","avatar":"🚜"},{"name":"Private James Vance (Fallen Soldier)","role":"WWII Soldier & True Love","alibi":"KIA in the Battle of the Bulge","avatar":"🪖"},{"name":"Evelyn Gray (Elderly Widow)","role":"Beloved Sweetheart","alibi":"Living in the Meadowbrook nursing home down the lane","avatar":"👵"},{"name":"David Cole","role":"Attic Carpenter & Restorer","alibi":"Repairing roof rafters when he found the box","avatar":"🔨"}]'::jsonb,
  'In 1944, Private James Vance wrote home from the front lines every week to his sweetheart Evelyn. James’s jealous brother Thomas intercepted the postman at the gate, hid all forty letters beneath the attic floor, and forged a military telegram claiming James had abandoned his post. In truth, James died a hero trying to return home to Evelyn.',
  'Brother Thomas Vance (Historical)',
  'Thomas intercepted his brother’s letters to convince James’s fiancee that James had abandoned her so Thomas could marry her.',
  '[{"time":"Autumn 1944","event":"James mails weekly letters from France containing poems and his dog tag."},{"time":"October 1944","event":"Thomas intercepts each letter at the rural mailbox and hides them in the attic."},{"time":"December 1944","event":"James is killed in action in the Ardennes; Thomas fakes an abandonment telegram."},{"time":"June 1947","event":"Evelyn marries Thomas, believing James deserted her."},{"time":"Present Day - 02:00 PM","event":"Carpenter David Cole pulls the ammo box from beneath the attic floor."}]'::jsonb,
  '[{"id":"ev_1","title":"Concealed Ammo Box","detail":"Army metal box hidden beneath bedroom floorboards holding 40 unsent letters."},{"id":"ev_2","title":"Bundle of 40 War Letters","detail":"Intact wartime correspondence from Private James Vance to Evelyn Gray."},{"id":"ev_3","title":"James’s Silver Dog Tag","detail":"Soldier’s identification tag enclosed in the final letter from the Ardennes front."},{"id":"ev_4","title":"Thomas’s Written Confession","detail":"Confession note by older brother Thomas admitting he intercepted the mail to marry Evelyn."}]'::jsonb,
  '[{"order":1,"title":"Attic steel ammo box","text":"The hidden time capsule concealed beneath the floorboards for eighty years."},{"order":2,"title":"Forty unopened V-Mail letters","text":"Proves the soldier wrote faithfully every week as promised."},{"order":3,"title":"1944 army postmarks","text":"Confirms the letters reached the farm, debunking the claim they were lost in Europe."},{"order":4,"title":"Silver military dog tag","text":"Irrefutable personal keepsake sent by James as an eternal promise of love."},{"order":5,"title":"Brother’s hidden confession","text":"Exposes the selfish deception that stole Evelyn’s true romance."},{"order":6,"title":"Evelyn holding dog tag","text":"The powerful emotional culmination of eighty years of mystery resolved."}]'::jsonb,
  'Rumors of a French village mistress: Fabricated by brother Thomas in 1945 to break Evelyn’s hope.; Old military deserter list in local paper: James’s name was erroneously listed due to missing-in-action confusion.',
  'Claim Private James deserted the army and lived a secret double life in South America.',
  'NORMAL',
  'Why were the soldier’s letters never mailed from Europe, and why were they hidden beneath his own family’s attic floor?',
  '[{"character":"Thomas Vance (Historical)","secret":"A duplicate mailbox key hidden inside his brass tackle box."},{"character":"Private James Vance (Fallen Soldier)","secret":"His military silver dog tag enclosed inside letter number 40."},{"character":"Evelyn Gray (Elderly Widow)","secret":"She kept James’s pressed bluebell flower in her Bible for eight decades."},{"character":"David Cole","secret":"He called the historical society immediately instead of selling them to collectors."}]'::jsonb,
  '[{"lead":"Rumors of a French village mistress","explanation":"Fabricated by brother Thomas in 1945 to break Evelyn’s hope."},{"lead":"Old military deserter list in local paper","explanation":"James’s name was erroneously listed due to missing-in-action confusion."}]'::jsonb,
  '{"wrongTheories":["Private James deserted his unit in France and started a new life under an alias.","The letters were stolen by Nazi spies to intercept coded troop positions."],"correctTheory":"Brother Thomas Vance intercepted James’s weekly letters and hid them in the attic to convince Evelyn that James had abandoned her so Thomas could marry her."}'::jsonb,
  'Brother Thomas intercepted James’s letters and hid them in the attic so he could marry James’s heartbroken fiancee Evelyn.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Evelyn learned the truth before she passed, James’s honor was restored, and the letters were placed in the town museum."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The carpenter sold the box to a scrap dealer, leaving Evelyn to die believing her true love had abandoned her."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The letters were branded historical forgeries by family heirs, burying the true tragedy in cynical doubt."}]'::jsonb,
  '{"intros":["During attic roof repairs, a carpenter lifted a loose floorboard and discovered a rusted steel military ammo box containing forty unsent love letters written by a soldier who was reported missing in action in 1944.","Case file story_113: During attic roof repairs, a carpenter lifted a loose floorboard and discovered a rusted steel military ammo box containing forty unsent love letters written by a soldier who was reported missing in action in 1944. Look closely at every clue.","Trouble begins in The dusty attic rafters of an old farmhouse in Meadowbrook, sunbeams, dry pine floorboards, and antique steamer trunks. During attic roof repairs, a carpenter lifted a loose floorboard and discovered a rusted steel military ammo box containing forty unsent love letters written by a soldier who was reported missing in action in 1944.","The mystery starts now. During attic roof repairs, a carpenter lifted a loose floorboard and discovered a rusted steel military ammo box containing forty unsent love letters written by a soldier who was reported missing in action in 1944. Can you solve it?"],"reveals":["Brother Thomas intercepted James’s letters and hid them in the attic so he could marry James’s heartbroken fiancee Evelyn.","The mystery is unraveled! Brother Thomas intercepted James’s letters and hid them in the attic so he could marry James’s heartbroken fiancee Evelyn.","At last, the truth comes out: Brother Thomas intercepted James’s letters and hid them in the attic so he could marry James’s heartbroken fiancee Evelyn.","Case resolved! Here is what happened: Brother Thomas intercepted James’s letters and hid them in the attic so he could marry James’s heartbroken fiancee Evelyn."],"hints":["Pay attention to where Brother Thomas Vance (Historical) was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_113';
DELETE FROM public.case_events WHERE case_id = 'story_113';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0b934079-cc23-50b3-b9bb-eb0b3279da13',
  'story_113',
  'Thomas Vance (Historical)',
  'Jealous Older Brother',
  'Stern, possessive, farmer who stayed behind on agricultural deferment, died in 1992',
  'Historical accounts: Thomas married Evelyn in 1947 after consoling her over James’s disappearance.',
  'A duplicate mailbox key hidden inside his brass tackle box.',
  'Deceased former owner of the farmhouse',
  'Brother of fallen soldier Private James',
  'James sent his military dog tag inside the final letter.',
  'Did not foresee the roof leaking eighty years later, exposing his crime.',
  '🚜',
  '["Historical accounts: Thomas married Evelyn in 1947 after consoling her over James’s disappearance.","\"Historical accounts: Thomas married Evelyn in 1947 after consoling her over James’s disappearance.\"","Listen to me: Historical accounts: Thomas married Evelyn in 1947 after consoling her over James’s disappearance.","I tell you the truth: Historical accounts: Thomas married Evelyn in 1947 after consoling her over James’s disappearance."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '0257ef0e-ed1e-5f7b-a726-064e7a7c1bc2',
  'story_113',
  'Private James Vance (Fallen Soldier)',
  'WWII Soldier & True Love',
  'Heroic, poetic, fallen in the Ardennes forest in December 1944',
  'Letters read: "My dearest Evelyn, every bullet that flies only reminds me of my promise to hold you again."',
  'His military silver dog tag enclosed inside letter number 40.',
  'KIA in the Battle of the Bulge',
  'Fiance of Evelyn and younger brother of Thomas',
  'He trusted his brother Thomas to deliver his letters to Evelyn in town.',
  'Did not know Thomas was hiding them in the attic and wooing Evelyn.',
  '🪖',
  '["Letters read: \"My dearest Evelyn, every bullet that flies only reminds me of my promise to hold you again.\"","\"Letters read: \"My dearest Evelyn, every bullet that flies only reminds me of my promise to hold you again.\"\"","Listen to me: Letters read: \"My dearest Evelyn, every bullet that flies only reminds me of my promise to hold you again.\"","I tell you the truth: Letters read: \"My dearest Evelyn, every bullet that flies only reminds me of my promise to hold you again.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '73d55574-7d7b-56f1-a22b-06d65cb12649',
  'story_113',
  'Evelyn Gray (Elderly Widow)',
  'Beloved Sweetheart',
  'Ninety-eight years old, silver hair, wheelchair, gentle voice, holding a faded photograph',
  'Thomas told me James ran away to France with another woman. I spent eighty years with a broken heart.',
  'She kept James’s pressed bluebell flower in her Bible for eight decades.',
  'Living in the Meadowbrook nursing home down the lane',
  'Former fiancee of James, late wife of Thomas',
  'James had sworn on his mother’s grave that he would write every week.',
  'Did not know Thomas had hidden forty letters beneath their own bedroom floor.',
  '👵',
  '["Thomas told me James ran away to France with another woman. I spent eighty years with a broken heart.","\"Thomas told me James ran away to France with another woman. I spent eighty years with a broken heart.\"","Listen to me: Thomas told me James ran away to France with another woman. I spent eighty years with a broken heart.","I tell you the truth: Thomas told me James ran away to France with another woman. I spent eighty years with a broken heart."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '44301f06-65ee-57db-ab80-2a0b901a7bfc',
  'story_113',
  'David Cole',
  'Attic Carpenter & Restorer',
  'Honest, work boots, carpenter pencil behind ear, deeply moved by the discovery',
  'These envelopes have official army postmarks from France. They were delivered here, but never opened.',
  'He called the historical society immediately instead of selling them to collectors.',
  'Repairing roof rafters when he found the box',
  'Discovered the hidden ammo box under floorboard 12',
  'The lock on the ammo box had Thomas Vance’s initials scratched into the steel.',
  'Did not know the emotional magnitude of delivering the letters to Evelyn.',
  '🔨',
  '["These envelopes have official army postmarks from France. They were delivered here, but never opened.","\"These envelopes have official army postmarks from France. They were delivered here, but never opened.\"","Listen to me: These envelopes have official army postmarks from France. They were delivered here, but never opened.","I tell you the truth: These envelopes have official army postmarks from France. They were delivered here, but never opened."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '82d9ff6a-a23b-5bd6-b92b-4c0d7e7bd404',
  'story_113',
  'ev_1',
  1,
  'Present Day - 02:00 PM',
  'David Cole lifts a warped pine attic floorboard.',
  'David Cole lifts a warped pine attic floorboard.',
  'A green military steel ammo box sealed with an antique brass padlock.',
  'Attic steel ammo box',
  'Concealed Ammo Box',
  '["Shoe box","Wooden crate","Iron tin"]'::jsonb,
  'Attic steel ammo box',
  '["attic steel ammo box","ammo box","steel box","military box","attic box"]'::jsonb,
  'Olive drab army metal box hidden beneath the bedroom floorboards.',
  'ev_2',
  true,
  '{"descriptions":["David Cole lifts a warped pine attic floorboard.","At Present Day - 02:00 PM: David Cole lifts a warped pine attic floorboard.","Notice this clue: David Cole lifts a warped pine attic floorboard."],"hints":["Olive drab army metal box hidden beneath the bedroom floorboards.","Clue hint: Think about attic steel ammo box.","Search for: a green military steel ammo box sealed with an antique brass padlock."],"clues":["Attic steel ammo box","Item: Attic steel ammo box","Clue Word: Attic steel ammo box"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6b85cac5-d479-5d22-b90f-4f963f7cd3d0',
  'story_113',
  'ev_2',
  2,
  'Present Day - 02:30 PM',
  'David opens the unlocked catch on the ammo box.',
  'David opens the unlocked catch on the ammo box.',
  'Forty unopened letters in V-Mail envelopes addressed to Miss Evelyn Gray.',
  'Forty unopened V-Mail letters',
  'Bundle of 40 War Letters',
  '["Old money","Medals","Newspapers"]'::jsonb,
  'Forty unopened V-Mail letters',
  '["forty unopened v-mail letters","letters","v-mail letters","unopened letters","war letters"]'::jsonb,
  'Stack of historic wartime letters addressed to the soldier’s sweetheart.',
  'ev_3',
  false,
  '{"descriptions":["David opens the unlocked catch on the ammo box.","At Present Day - 02:30 PM: David opens the unlocked catch on the ammo box.","Notice this clue: David opens the unlocked catch on the ammo box."],"hints":["Stack of historic wartime letters addressed to the soldier’s sweetheart.","Clue hint: Think about forty unopened v-mail letters.","Search for: forty unopened letters in v-mail envelopes addressed to miss evelyn gray."],"clues":["Forty unopened V-Mail letters","Item: Forty unopened V-Mail letters","Clue Word: Forty unopened V-Mail letters"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f8535617-977e-56c3-bca9-bc7323e9c889',
  'story_113',
  'ev_3',
  3,
  'Present Day - 03:00 PM',
  'David reads the army postmarks on the envelopes.',
  'David reads the army postmarks on the envelopes.',
  'Official US Army postmarks spanning August to December 1944.',
  '1944 army postmarks',
  'Wartime Postal Postmarks',
  '["1960 stamps","Local town postmark","Unstamped paper"]'::jsonb,
  '1944 army postmarks',
  '["1944 army postmarks","postmarks","army postmarks","1944 postmarks","postal stamps"]'::jsonb,
  'Government mail stamps proving the letters were successfully delivered to the farm.',
  'ev_4',
  false,
  '{"descriptions":["David reads the army postmarks on the envelopes.","At Present Day - 03:00 PM: David reads the army postmarks on the envelopes.","Notice this clue: David reads the army postmarks on the envelopes."],"hints":["Government mail stamps proving the letters were successfully delivered to the farm.","Clue hint: Think about 1944 army postmarks.","Search for: official us army postmarks spanning august to december 1944."],"clues":["1944 army postmarks","Item: 1944 army postmarks","Clue Word: 1944 army postmarks"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bd7856a7-8998-5b7b-aec7-94fa34c862e4',
  'story_113',
  'ev_4',
  4,
  'Present Day - 03:30 PM',
  'David opens letter number 40 dated December 10, 1944.',
  'David opens letter number 40 dated December 10, 1944.',
  'Private James’s silver military dog tag enclosed with his final declaration of love.',
  'Silver military dog tag',
  'James’s Silver Dog Tag',
  '["Gold ring","Bullet casing","Pocket knife"]'::jsonb,
  'Silver military dog tag',
  '["silver military dog tag","dog tag","silver dog tag","military dog tag","dogtag"]'::jsonb,
  'Personal soldier identification tag tucked inside the final letter.',
  'ev_5',
  false,
  '{"descriptions":["David opens letter number 40 dated December 10, 1944.","At Present Day - 03:30 PM: David opens letter number 40 dated December 10, 1944.","Notice this clue: David opens letter number 40 dated December 10, 1944."],"hints":["Personal soldier identification tag tucked inside the final letter.","Clue hint: Think about silver military dog tag.","Search for: private james’s silver military dog tag enclosed with his final declaration of love."],"clues":["Silver military dog tag","Item: Silver military dog tag","Clue Word: Silver military dog tag"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '964b7432-e981-5729-8206-cba39ed020e9',
  'story_113',
  'ev_5',
  5,
  'Present Day - 04:00 PM',
  'David finds a handwritten confession note from Thomas inside the box.',
  'David finds a handwritten confession note from Thomas inside the box.',
  'Thomas’s 1980 note: "May God forgive me. I hid James’s letters because I loved Evelyn too much."',
  'Brother’s hidden confession',
  'Thomas’s Written Confession',
  '["Farm deed","Tax record","Shopping list"]'::jsonb,
  'Brother’s hidden confession',
  '["brother’s hidden confession","confession","thomas confession","brother confession","hidden confession"]'::jsonb,
  'Guilt-ridden note from the older brother confessing to stealing the letters.',
  'ev_6',
  true,
  '{"descriptions":["David finds a handwritten confession note from Thomas inside the box.","At Present Day - 04:00 PM: David finds a handwritten confession note from Thomas inside the box.","Notice this clue: David finds a handwritten confession note from Thomas inside the box."],"hints":["Guilt-ridden note from the older brother confessing to stealing the letters.","Clue hint: Think about brother’s hidden confession.","Search for: thomas’s 1980 note: \"may god forgive me. i hid james’s letters because i loved evelyn too much.\""],"clues":["Brother’s hidden confession","Item: Brother’s hidden confession","Clue Word: Brother’s hidden confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f95706cb-6152-57ad-b556-e28904405aab',
  'story_113',
  'ev_6',
  6,
  'Present Day - 04:30 PM',
  'David and the town archivist bring the letters to 98-year-old Evelyn.',
  'David and the town archivist bring the letters to 98-year-old Evelyn.',
  'Evelyn clutching the silver dog tag and weeping tears of release and vindication.',
  'Evelyn holding dog tag',
  'Emotional Resolution Scene',
  '["Rejection","Anger","Disbelief"]'::jsonb,
  'Evelyn holding dog tag',
  '["evelyn holding dog tag","evelyn holding tag","dog tag scene","resolution","evelyn tears"]'::jsonb,
  'The elderly sweetheart finally learning after eighty years that James loved her to the end.',
  'ev_7',
  false,
  '{"descriptions":["David and the town archivist bring the letters to 98-year-old Evelyn.","At Present Day - 04:30 PM: David and the town archivist bring the letters to 98-year-old Evelyn.","Notice this clue: David and the town archivist bring the letters to 98-year-old Evelyn."],"hints":["The elderly sweetheart finally learning after eighty years that James loved her to the end.","Clue hint: Think about evelyn holding dog tag.","Search for: evelyn clutching the silver dog tag and weeping tears of release and vindication."],"clues":["Evelyn holding dog tag","Item: Evelyn holding dog tag","Clue Word: Evelyn holding dog tag"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '84990907-020c-5917-a8dd-490d27166b77',
  'story_113',
  'ev_7',
  7,
  'Present Day - 05:00 PM',
  'Evelyn reads James’s poetry out loud to her great-grandchildren.',
  'Evelyn reads James’s poetry out loud to her great-grandchildren.',
  'Evelyn’s peace as she realizes James never deserted her and died a true hero.',
  'James’s love poems read',
  'Heroic Poetic Letters',
  '["Historical lecture","Legal filing","Will reading"]'::jsonb,
  'James’s love poems read',
  '["james’s love poems read","love poems","poems read","letters read","heroic letters"]'::jsonb,
  'The soldier’s true voice finally heard across eighty years of silence.',
  'ev_8',
  false,
  '{"descriptions":["Evelyn reads James’s poetry out loud to her great-grandchildren.","At Present Day - 05:00 PM: Evelyn reads James’s poetry out loud to her great-grandchildren.","Notice this clue: Evelyn reads James’s poetry out loud to her great-grandchildren."],"hints":["The soldier’s true voice finally heard across eighty years of silence.","Clue hint: Think about james’s love poems read.","Search for: evelyn’s peace as she realizes james never deserted her and died a true hero."],"clues":["James’s love poems read","Item: James’s love poems read","Clue Word: James’s love poems read"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '70e24348-7130-58fa-91a6-55a93c111020',
  'story_113',
  'ev_8',
  8,
  'Present Day - 05:30 PM',
  'The town library enshrines the 40 letters in a permanent public memorial.',
  'The town library enshrines the 40 letters in a permanent public memorial.',
  'The Letters of Private James dedicated as a symbol of eternal devotion.',
  'Library memorial exhibit',
  'Wartime Love Memorial',
  '["Pawn sale","Private auction","Storage vault"]'::jsonb,
  'Library memorial exhibit',
  '["library memorial exhibit","memorial exhibit","library exhibit","memorial","love memorial"]'::jsonb,
  'Permanent historical display honoring the soldier’s devotion and sacrifice.',
  NULL,
  true,
  '{"descriptions":["The town library enshrines the 40 letters in a permanent public memorial.","At Present Day - 05:30 PM: The town library enshrines the 40 letters in a permanent public memorial.","Notice this clue: The town library enshrines the 40 letters in a permanent public memorial."],"hints":["Permanent historical display honoring the soldier’s devotion and sacrifice.","Clue hint: Think about library memorial exhibit.","Search for: the letters of private james dedicated as a symbol of eternal devotion."],"clues":["Library memorial exhibit","Item: Library memorial exhibit","Clue Word: Library memorial exhibit"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_114 — THE LIGHTHOUSE KEEPER’S FINAL LOG
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_114',
  'The Lighthouse Keeper’s Final Log',
  'Emotional Mystery',
  'The storm-battered spiral tower of Black Rock Lighthouse, howling Atlantic winds, brass lantern room, and crashing breakers',
  'The ancient keeper of Black Rock Lighthouse vanished during a hurricane, leaving the beacon burning bright and a final log entry that read: "The song on the waves has ceased. The child is home."',
  '[{"name":"Walter Vance (Elderly Keeper)","role":"Veteran Lighthouse Keeper","alibi":"Missing from the lighthouse tower after the storm","avatar":"🏮"},{"name":"Dr. Sarah Miller","role":"Mainland Physician & Daughter","alibi":"Waiting on the mainland dock for the storm ferry","avatar":"👩‍⚕️"},{"name":"Captain Jack Thorne","role":"Harbor Rescue Pilot","alibi":"Steering the rescue cutter through the gale","avatar":"⚓"},{"name":"Inspector Thomas Finch","role":"Maritime Safety Detective","alibi":"Arrived on Black Rock with the morning rescue crew","avatar":"🔍"},{"name":"Captain Hector Vance (Deceased Smuggler)","role":"Historical Smuggler & Culprit","alibi":"Deceased in 1990; fled the harbor after the 1974 collision","avatar":"🏴‍☠️"}]'::jsonb,
  'In 1974, lighthouse keeper Walter lost his wife and infant daughter when an unlit smuggling boat rammed their skiff. Walter kept the beacon burning for fifty years, searching the rocks every night. In his final hurricane, Walter discovered his daughter had actually been rescued in 1974 and lived as a doctor on the mainland. Walter left his post in peace to reunite with her.',
  'Historical Ship Captain Hector Vance',
  'Captain Vance caused the 1974 shipwreck that drowned the keeper’s family to smuggle contraband.',
  '[{"time":"Yesterday - 02:00 PM","event":"Walter receives a letter and baby medical records from Dr. Sarah Miller."},{"time":"Yesterday - 08:00 PM","event":"Hurricane hits; Walter polishes the Fresnel lens and trims the wick for all night."},{"time":"Yesterday - 11:30 PM","event":"Walter writes his final log entry: \"The child is home.\""},{"time":"Today - 05:00 AM","event":"Walter boards the early morning resupply barge to the mainland in peace."},{"time":"Today - 08:00 AM","event":"Rescue team finds the lighthouse burning bright, but Walter gone."}]'::jsonb,
  '[{"id":"ev_1","title":"Immaculate Lantern Room","detail":"The beacon burning bright with clean wick and full oil, proving no suicide or disaster."},{"id":"ev_2","title":"Keeper’s Final Log","detail":"Final written words: \"The song on the waves has ceased. The child is home.\""},{"id":"ev_3","title":"Dr. Miller’s Revelation Letter","detail":"1974 adoption records proving Sarah Miller was Walter’s surviving daughter."},{"id":"ev_4","title":"Hospital Reunion Scene","detail":"Walter and Sarah reunited at the mainland hospital with matching silver rattles."}]'::jsonb,
  '[{"order":1,"title":"Burning Fresnel lens","text":"Demonstrates duty and care right up to the moment of departure."},{"order":2,"title":"Final logbook entry","text":"The poetic resolution indicating peace rather than despair."},{"order":3,"title":"Daughter’s adoption letter","text":"The emotional revelation that solved the 50-year-old family tragedy."},{"order":4,"title":"Missing travel bag","text":"Physical proof of a planned departure, completely debunking drowning."},{"order":5,"title":"Engraved baby rattle","text":"The physical talisman linking Walter directly to Dr. Sarah Miller."},{"order":6,"title":"Mainland harbor radio report","text":"Living proof that the keeper was safe and reunited with his family."}]'::jsonb,
  'Ghostly siren sounds recorded on the rocks: Caused by high winds blowing through coastal blowholes.; Empty rowboat drifting off the reef: A derelict skiff that broke its moorings during the hurricane.',
  'Claim the lighthouse keeper was lured into the sea by supernatural siren songs.',
  'NORMAL',
  'Did the elderly keeper drown in the storm, or did he finally solve the fifty-year mystery of his lost daughter?',
  '[{"character":"Walter Vance (Elderly Keeper)","secret":"A faded silver baby rattle found on the rocks during yesterday’s low tide."},{"character":"Dr. Sarah Miller","secret":"She sent a letter to the lighthouse yesterday containing her baby hospital records."},{"character":"Captain Jack Thorne","secret":"His father was a crewman on the smuggling boat that rammed Walter’s family skiff."},{"character":"Inspector Thomas Finch","secret":"He had investigated the 1974 cold case smuggling collision years ago."},{"character":"Captain Hector Vance (Deceased Smuggler)","secret":"His smuggling logbook admitted to the hit-and-run collision on Black Rock reef."}]'::jsonb,
  '[{"lead":"Ghostly siren sounds recorded on the rocks","explanation":"Caused by high winds blowing through coastal blowholes."},{"lead":"Empty rowboat drifting off the reef","explanation":"A derelict skiff that broke its moorings during the hurricane."}]'::jsonb,
  '{"wrongTheories":["The elderly keeper walked into the hurricane surf in a fit of grief and drowned.","Smugglers raided the lighthouse and kidnapped the keeper to extinguish the light."],"correctTheory":"Walter Vance discovered his lost daughter had survived the 1974 wreck and was now a doctor, so he peacefully left the lighthouse to reunite with her."}'::jsonb,
  'Walter Vance discovered his daughter survived the 1974 wreck; he packed his bag, kept the light burning, and reunited with her in peace.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Walter retired from lighthouse service and lived out his final years surrounded by his daughter and grandchildren."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The search was abandoned, and Walter was listed as lost at sea while wandering the mainland looking for Sarah."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Folklore claimed Walter was taken by the sea goddess, obscuring the true human reunion under myth."}]'::jsonb,
  '{"intros":["The ancient keeper of Black Rock Lighthouse vanished during a hurricane, leaving the beacon burning bright and a final log entry that read: \"The song on the waves has ceased. The child is home.\"","Case file story_114: The ancient keeper of Black Rock Lighthouse vanished during a hurricane, leaving the beacon burning bright and a final log entry that read: \"The song on the waves has ceased. The child is home.\" Look closely at every clue.","Trouble begins in The storm-battered spiral tower of Black Rock Lighthouse, howling Atlantic winds, brass lantern room, and crashing breakers. The ancient keeper of Black Rock Lighthouse vanished during a hurricane, leaving the beacon burning bright and a final log entry that read: \"The song on the waves has ceased. The child is home.\"","The mystery starts now. The ancient keeper of Black Rock Lighthouse vanished during a hurricane, leaving the beacon burning bright and a final log entry that read: \"The song on the waves has ceased. The child is home.\" Can you solve it?"],"reveals":["Walter Vance discovered his daughter survived the 1974 wreck; he packed his bag, kept the light burning, and reunited with her in peace.","The mystery is unraveled! Walter Vance discovered his daughter survived the 1974 wreck; he packed his bag, kept the light burning, and reunited with her in peace.","At last, the truth comes out: Walter Vance discovered his daughter survived the 1974 wreck; he packed his bag, kept the light burning, and reunited with her in peace.","Case resolved! Here is what happened: Walter Vance discovered his daughter survived the 1974 wreck; he packed his bag, kept the light burning, and reunited with her in peace."],"hints":["Pay attention to where Historical Ship Captain Hector Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_114';
DELETE FROM public.case_events WHERE case_id = 'story_114';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '785e593a-5df0-50ba-ac9c-d6eba91a69b9',
  'story_114',
  'Walter Vance (Elderly Keeper)',
  'Veteran Lighthouse Keeper',
  'Weathered salt, snowy beard, oilskin slicker, gentle eyes, fifty years of solitary duty',
  'Final log: "For fifty years I watched the reef. Tonight, the sea gave back what it took."',
  'A faded silver baby rattle found on the rocks during yesterday’s low tide.',
  'Missing from the lighthouse tower after the storm',
  'Keeper of Black Rock Light for five decades',
  'The supply boat wreck in 1974 was an intentional ramming by smugglers.',
  'Did not know his daughter had been adopted by a coastal doctor until reading yesterday’s letter.',
  '🏮',
  '["Final log: \"For fifty years I watched the reef. Tonight, the sea gave back what it took.\"","\"Final log: \"For fifty years I watched the reef. Tonight, the sea gave back what it took.\"\"","Listen to me: Final log: \"For fifty years I watched the reef. Tonight, the sea gave back what it took.\"","I tell you the truth: Final log: \"For fifty years I watched the reef. Tonight, the sea gave back what it took.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '58f90393-ea9b-55fe-9cc2-e52b4915525e',
  'story_114',
  'Dr. Sarah Miller',
  'Mainland Physician & Daughter',
  'Compassionate, stethoscope around neck, holding matching silver baby rattle',
  'I was adopted in 1974 after being rescued from a shipwreck near Black Rock. Walter is my father.',
  'She sent a letter to the lighthouse yesterday containing her baby hospital records.',
  'Waiting on the mainland dock for the storm ferry',
  'Surviving daughter of Walter Vance',
  'She possessed the twin silver baby rattle matching the one at the lighthouse.',
  'Did not know Walter had walked into the mainland harbor on foot this morning.',
  '👩‍⚕️',
  '["I was adopted in 1974 after being rescued from a shipwreck near Black Rock. Walter is my father.","\"I was adopted in 1974 after being rescued from a shipwreck near Black Rock. Walter is my father.\"","Listen to me: I was adopted in 1974 after being rescued from a shipwreck near Black Rock. Walter is my father.","I tell you the truth: I was adopted in 1974 after being rescued from a shipwreck near Black Rock. Walter is my father."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6562bfa2-a142-5741-916d-fd1ebdc52bff',
  'story_114',
  'Captain Jack Thorne',
  'Harbor Rescue Pilot',
  'Stalwart sailor, yellow rain slicker, piloting rescue tug through towering waves',
  'Walter never let that beacon go dark for fifty years. He would never leave this rock unless his soul was settled.',
  'His father was a crewman on the smuggling boat that rammed Walter’s family skiff.',
  'Steering the rescue cutter through the gale',
  'Lifelong resupply friend of Walter Vance',
  'The lighthouse lantern had a brand new mantle installed right before Walter departed.',
  'Did not know Walter had caught the early morning supply barge to the mainland.',
  '⚓',
  '["Walter never let that beacon go dark for fifty years. He would never leave this rock unless his soul was settled.","\"Walter never let that beacon go dark for fifty years. He would never leave this rock unless his soul was settled.\"","Listen to me: Walter never let that beacon go dark for fifty years. He would never leave this rock unless his soul was settled.","I tell you the truth: Walter never let that beacon go dark for fifty years. He would never leave this rock unless his soul was settled."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6adede3b-e67f-5e37-944e-1786d1c3a6de',
  'story_114',
  'Inspector Thomas Finch',
  'Maritime Safety Detective',
  'Sharp, waterproof notebook, examining the immaculate lantern room',
  'Men who commit suicide don’t polish the brass lens and trim the emergency wicks for twelve hours of burning.',
  'He had investigated the 1974 cold case smuggling collision years ago.',
  'Arrived on Black Rock with the morning rescue crew',
  'Investigating the keeper’s disappearance',
  'Walter’s bed was neatly made, and his packed leather travel valise was missing.',
  'Did not know who sent the letter resting on the logbook.',
  '🔍',
  '["Men who commit suicide don’t polish the brass lens and trim the emergency wicks for twelve hours of burning.","\"Men who commit suicide don’t polish the brass lens and trim the emergency wicks for twelve hours of burning.\"","Listen to me: Men who commit suicide don’t polish the brass lens and trim the emergency wicks for twelve hours of burning.","I tell you the truth: Men who commit suicide don’t polish the brass lens and trim the emergency wicks for twelve hours of burning."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '3f407b39-029c-5333-8d47-4eaa05a64e84',
  'story_114',
  'Captain Hector Vance (Deceased Smuggler)',
  'Historical Smuggler & Culprit',
  'Reckless sea captain who ran illegal contraband with lights extinguished',
  'Deceased in 1990; court records show he was indicted for running dark channels in 1974.',
  'His smuggling logbook admitted to the hit-and-run collision on Black Rock reef.',
  'Deceased in 1990; fled the harbor after the 1974 collision',
  'Smuggling captain responsible for the 1974 collision',
  'He saw an infant washed ashore alive near the mainland inlet after the crash.',
  'Did not know the infant was adopted and would become a doctor who reunited with Walter.',
  '🏴‍☠️',
  '["Deceased in 1990; court records show he was indicted for running dark channels in 1974.","\"Deceased in 1990; court records show he was indicted for running dark channels in 1974.\"","Listen to me: Deceased in 1990; court records show he was indicted for running dark channels in 1974.","I tell you the truth: Deceased in 1990; court records show he was indicted for running dark channels in 1974."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2a47dcbc-d006-526e-a1a6-8072e5cf1e06',
  'story_114',
  'ev_1',
  1,
  'Today - 08:00 AM',
  'Captain Jack and Inspector Finch climb the lighthouse spiral stairs.',
  'Captain Jack and Inspector Finch climb the lighthouse spiral stairs.',
  'The giant Fresnel brass lens polished and burning with twelve hours of clean oil.',
  'Burning Fresnel lens',
  'Immaculate Lantern Room',
  '["Extinguished flame","Shattered glass","Smoky wick"]'::jsonb,
  'Burning Fresnel lens',
  '["burning fresnel lens","fresnel lens","burning lens","lantern room","polished lens"]'::jsonb,
  'The great lighthouse beacon burning brightly with zero sign of storm damage.',
  'ev_2',
  true,
  '{"descriptions":["Captain Jack and Inspector Finch climb the lighthouse spiral stairs.","At Today - 08:00 AM: Captain Jack and Inspector Finch climb the lighthouse spiral stairs.","Notice this clue: Captain Jack and Inspector Finch climb the lighthouse spiral stairs."],"hints":["The great lighthouse beacon burning brightly with zero sign of storm damage.","Clue hint: Think about burning fresnel lens.","Search for: the giant fresnel brass lens polished and burning with twelve hours of clean oil."],"clues":["Burning Fresnel lens","Item: Burning Fresnel lens","Clue Word: Burning Fresnel lens"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '149aed38-1918-5e32-89a1-38990bb9828a',
  'story_114',
  'ev_2',
  2,
  'Today - 08:15 AM',
  'Inspector Finch reads the open leather logbook on the desk.',
  'Inspector Finch reads the open leather logbook on the desk.',
  'Walter’s final handwritten log entry: "The song on the waves has ceased. The child is home."',
  'Final logbook entry',
  'Keeper’s Final Log',
  '["Distress call","Mayday note","Blank page"]'::jsonb,
  'Final logbook entry',
  '["final logbook entry","final log","log entry","logbook","keeper log"]'::jsonb,
  'Poetic words closing fifty years of faithful maritime vigil.',
  'ev_3',
  false,
  '{"descriptions":["Inspector Finch reads the open leather logbook on the desk.","At Today - 08:15 AM: Inspector Finch reads the open leather logbook on the desk.","Notice this clue: Inspector Finch reads the open leather logbook on the desk."],"hints":["Poetic words closing fifty years of faithful maritime vigil.","Clue hint: Think about final logbook entry.","Search for: walter’s final handwritten log entry: \"the song on the waves has ceased. the child is home.\""],"clues":["Final logbook entry","Item: Final logbook entry","Clue Word: Final logbook entry"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '604380c2-a754-5141-aecb-d373c339851b',
  'story_114',
  'ev_3',
  3,
  'Today - 08:30 AM',
  'Finch finds an opened mail envelope beside the logbook.',
  'Finch finds an opened mail envelope beside the logbook.',
  'A letter from Dr. Sarah Miller containing 1974 adoption papers and infant footprints.',
  'Daughter’s adoption letter',
  'Dr. Miller’s Revelation Letter',
  '["Tax bill","Dismissal notice","Weather chart"]'::jsonb,
  'Daughter’s adoption letter',
  '["daughter’s adoption letter","adoption letter","daughter letter","miller letter","revelation letter"]'::jsonb,
  'The letter proving Walter’s baby daughter survived the historic shipwreck.',
  'ev_4',
  false,
  '{"descriptions":["Finch finds an opened mail envelope beside the logbook.","At Today - 08:30 AM: Finch finds an opened mail envelope beside the logbook.","Notice this clue: Finch finds an opened mail envelope beside the logbook."],"hints":["The letter proving Walter’s baby daughter survived the historic shipwreck.","Clue hint: Think about daughter’s adoption letter.","Search for: a letter from dr. sarah miller containing 1974 adoption papers and infant footprints."],"clues":["Daughter’s adoption letter","Item: Daughter’s adoption letter","Clue Word: Daughter’s adoption letter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '124a0f5a-2201-5b64-88a0-9984ba063a05',
  'story_114',
  'ev_4',
  4,
  'Today - 08:45 AM',
  'Finch checks the keeper’s bedroom quarters.',
  'Finch checks the keeper’s bedroom quarters.',
  'The bed made with military precision and the keeper’s personal travel bag missing.',
  'Missing travel bag',
  'Prepared Departure Scene',
  '["Ransacked drawers","Blood on sheets","Broken window"]'::jsonb,
  'Missing travel bag',
  '["missing travel bag","travel bag","missing bag","packed bag","departure scene"]'::jsonb,
  'Clear evidence the old man packed his clothes and left willingly on foot.',
  'ev_5',
  false,
  '{"descriptions":["Finch checks the keeper’s bedroom quarters.","At Today - 08:45 AM: Finch checks the keeper’s bedroom quarters.","Notice this clue: Finch checks the keeper’s bedroom quarters."],"hints":["Clear evidence the old man packed his clothes and left willingly on foot.","Clue hint: Think about missing travel bag.","Search for: the bed made with military precision and the keeper’s personal travel bag missing."],"clues":["Missing travel bag","Item: Missing travel bag","Clue Word: Missing travel bag"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '01fe97f0-25b6-5e65-8854-b8a1ed119da0',
  'story_114',
  'ev_5',
  5,
  'Today - 09:15 AM',
  'Captain Jack inspects the watch desk drawer.',
  'Captain Jack inspects the watch desk drawer.',
  'A tarnished silver baby rattle engraved with the initial "S".',
  'Engraved baby rattle',
  'Keepsake Silver Rattle',
  '["Pocket knife","Compass","Whistle"]'::jsonb,
  'Engraved baby rattle',
  '["engraved baby rattle","baby rattle","silver rattle","rattle","keepsake rattle"]'::jsonb,
  'Cherished baby toy kept by Walter for fifty years.',
  'ev_6',
  true,
  '{"descriptions":["Captain Jack inspects the watch desk drawer.","At Today - 09:15 AM: Captain Jack inspects the watch desk drawer.","Notice this clue: Captain Jack inspects the watch desk drawer."],"hints":["Cherished baby toy kept by Walter for fifty years.","Clue hint: Think about engraved baby rattle.","Search for: a tarnished silver baby rattle engraved with the initial \"s\"."],"clues":["Engraved baby rattle","Item: Engraved baby rattle","Clue Word: Engraved baby rattle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '92c8f8d8-e129-5c73-ad5a-5f1900791b27',
  'story_114',
  'ev_6',
  6,
  'Today - 10:00 AM',
  'Radio dispatch calls from the mainland harbor station.',
  'Radio dispatch calls from the mainland harbor station.',
  'Walter Vance arrived safely on the morning supply barge and is sitting at the hospital.',
  'Mainland harbor radio report',
  'Harbor Dispatch Intercept',
  '["Coast guard search","Body found","Helicopter crash"]'::jsonb,
  'Mainland harbor radio report',
  '["mainland harbor radio report","radio report","harbor report","dispatch report","mainland report"]'::jsonb,
  'Official confirmation that the keeper was alive and well on the mainland.',
  'ev_7',
  false,
  '{"descriptions":["Radio dispatch calls from the mainland harbor station.","At Today - 10:00 AM: Radio dispatch calls from the mainland harbor station.","Notice this clue: Radio dispatch calls from the mainland harbor station."],"hints":["Official confirmation that the keeper was alive and well on the mainland.","Clue hint: Think about mainland harbor radio report.","Search for: walter vance arrived safely on the morning supply barge and is sitting at the hospital."],"clues":["Mainland harbor radio report","Item: Mainland harbor radio report","Clue Word: Mainland harbor radio report"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1c9c345d-f0ae-5b6e-a909-1c2d6e0d3a09',
  'story_114',
  'ev_7',
  7,
  'Today - 11:00 AM',
  'Finch and Jack travel to St. Jude Hospital on the mainland.',
  'Finch and Jack travel to St. Jude Hospital on the mainland.',
  'Walter and Dr. Sarah Miller holding hands in tears of joyful reunion.',
  'Father and daughter reunion',
  'Hospital Reunion Scene',
  '["Interrogation room","Morgue","Arrest scene"]'::jsonb,
  'Father and daughter reunion',
  '["father and daughter reunion","reunion","father daughter reunion","reunion scene","hospital reunion"]'::jsonb,
  'The beautiful culmination of fifty years of sorrow turned to joy.',
  'ev_8',
  false,
  '{"descriptions":["Finch and Jack travel to St. Jude Hospital on the mainland.","At Today - 11:00 AM: Finch and Jack travel to St. Jude Hospital on the mainland.","Notice this clue: Finch and Jack travel to St. Jude Hospital on the mainland."],"hints":["The beautiful culmination of fifty years of sorrow turned to joy.","Clue hint: Think about father and daughter reunion.","Search for: walter and dr. sarah miller holding hands in tears of joyful reunion."],"clues":["Father and daughter reunion","Item: Father and daughter reunion","Clue Word: Father and daughter reunion"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ac1a9485-46f9-5b61-8389-a8d7798a7667',
  'story_114',
  'ev_8',
  8,
  'Today - 12:00 PM',
  'Walter officially hands over the Black Rock lighthouse keys to the Coast Guard.',
  'Walter officially hands over the Black Rock lighthouse keys to the Coast Guard.',
  'Walter retiring with honor after completing his life’s vigil.',
  'Surrendered lighthouse keys',
  'Keeper Retirement Certificate',
  '["Court fine","Dismissal","Abandonment fine"]'::jsonb,
  'Surrendered lighthouse keys',
  '["surrendered lighthouse keys","lighthouse keys","retirement certificate","keys","surrendered keys"]'::jsonb,
  'Formal retirement ceremony celebrating fifty years of unbroken service.',
  NULL,
  true,
  '{"descriptions":["Walter officially hands over the Black Rock lighthouse keys to the Coast Guard.","At Today - 12:00 PM: Walter officially hands over the Black Rock lighthouse keys to the Coast Guard.","Notice this clue: Walter officially hands over the Black Rock lighthouse keys to the Coast Guard."],"hints":["Formal retirement ceremony celebrating fifty years of unbroken service.","Clue hint: Think about surrendered lighthouse keys.","Search for: walter retiring with honor after completing his life’s vigil."],"clues":["Surrendered lighthouse keys","Item: Surrendered lighthouse keys","Clue Word: Surrendered lighthouse keys"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_115 — THE SISTER WHO NEVER CAME HOME
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_115',
  'The Sister Who Never Came Home',
  'Emotional Mystery',
  'The dusty roadside outside an abandoned 1950s soda fountain in Oak Creek, peeling red neon, overgrown weeds, and rusted bicycle racks',
  'Forty years after a twelve-year-old girl vanished while riding her red Schwinn bicycle to buy sodas, her bicycle was found standing upright in the exact same rack, polished clean and bearing a fresh bouquet of yellow daisies.',
  '[{"name":"Martha Cole","role":"Elderly Neighbor’s Sister","alibi":"Living in the Cole family farmhouse down the road","avatar":"👵"},{"name":"Lucy Vance (Victim in 1984)","role":"Vanished Sister","alibi":"Missing since July 14, 1984","avatar":"🚲"},{"name":"David Vance","role":"Detective & Lucy’s Brother","alibi":"Called immediately to the old soda shop upon the bicycle’s recovery","avatar":"🕵️‍♂️"},{"name":"Officer Clara Bell","role":"Town Police Chief","alibi":"Securing the perimeter of the soda shop rack","avatar":"👮‍♀️"},{"name":"Arthur Cole (Deceased Neighbor)","role":"Hit-and-Run Driver & Culprit","alibi":"Deceased this week; was driving home in his farm truck on July 14, 1984","avatar":"🚜"}]'::jsonb,
  'In 1984, neighbor Arthur Cole struck young Lucy Vance with his pickup truck on a rainy evening. In terror, Arthur hid Lucy and her red bicycle in his underground root cellar. On his deathbed this week, Arthur’s conscience broke; his elderly sister restored the bicycle and returned it to the soda shop to lead police to Lucy’s hidden resting place.',
  'Neighbor Arthur Cole (Deceased)',
  'Arthur accidentally struck the girl with his truck in 1984 and hid the body in fear of prison.',
  '[{"time":"July 14, 1984 - 05:00 PM","event":"Lucy rides her red Schwinn to buy sodas; Arthur strikes her on the curve."},{"time":"July 14, 1984 - 06:00 PM","event":"Arthur hides Lucy and her bicycle inside his underground storm cellar."},{"time":"Three Days Ago","event":"Arthur Cole dies in hospice, confessing his crime to his sister Martha."},{"time":"Today - 06:00 AM","event":"Martha polishes the red bike, places daisies on it, and sets it in the soda shop rack."},{"time":"Today - 07:30 AM","event":"Townspeople discover the pristine 1984 bicycle standing in the rack."}]'::jsonb,
  '[{"id":"ev_1","title":"Returned 1984 Bicycle","detail":"Lucy’s red Schwinn returned in immaculate condition after forty years."},{"id":"ev_2","title":"Botanical Garden Match","detail":"Yellow daisies on the bike matching Martha Cole’s unique heritage garden bed."},{"id":"ev_3","title":"Written Hit-and-Run Confession","detail":"Arthur Cole’s deathbed note confessing to the 1984 collision and cover-up."},{"id":"ev_4","title":"Lucy Vance’s Remains","detail":"Lucy’s remains recovered from the storm cellar with her silver dime and lucky card."}]'::jsonb,
  '[{"order":1,"title":"Pristine red Schwinn bicycle","text":"The impossible physical return of the vanished artifact after forty years."},{"order":2,"title":"Engraved initials bell","text":"Conclusive proof the bike belonged to Lucy Vance."},{"order":3,"title":"Yellow daisies bouquet","text":"Shows the bike was delivered with deep love and remorse, not malice."},{"order":4,"title":"Heritage daisy cultivar match","text":"Led detectives directly to the Cole farmhouse."},{"order":5,"title":"Arthur Cole’s dying confession","text":"The truth revealed: an accidental collision hidden in fear for decades."},{"order":6,"title":"Storm cellar iron key","text":"Unlocked the final resting place of the lost child."}]'::jsonb,
  'Rumors of a phantom girl cycling at midnight: Folklore born from local grief, but with zero supernatural reality.; Rusted bicycle parts found in the river in 1990: From an unrelated scrap dump, unrelated to Lucy’s bike.',
  'Claim Lucy became a ghost cyclist who rides through Oak Creek every summer.',
  'NORMAL',
  'Who brought the missing bicycle back after forty years, and what happened to the girl in 1984?',
  '[{"character":"Martha Cole","secret":"The iron key to the underground root cellar where Lucy was laid to rest."},{"character":"Lucy Vance (Victim in 1984)","secret":"Her brother’s lucky baseball card was tucked into her shoe sole."},{"character":"David Vance","secret":"He kept Lucy’s favorite ribbon pinned inside his detective badge case."},{"character":"Officer Clara Bell","secret":"She remembered the massive community search parties of 1984 as a child."},{"character":"Arthur Cole (Deceased Neighbor)","secret":"He concealed Lucy’s body and bicycle in his underground root cellar behind heavy barrels."}]'::jsonb,
  '[{"lead":"Rumors of a phantom girl cycling at midnight","explanation":"Folklore born from local grief, but with zero supernatural reality."},{"lead":"Rusted bicycle parts found in the river in 1990","explanation":"From an unrelated scrap dump, unrelated to Lucy’s bike."}]'::jsonb,
  '{"wrongTheories":["Lucy ran away to Hollywood in 1984 and returned as an elderly woman to return her bike.","A notorious traveling carnival kidnapper abducted Lucy and took her out of state."],"correctTheory":"Neighbor Arthur Cole accidentally struck Lucy in 1984 and hid her in his cellar; upon his death, his sister returned the bicycle to give the family closure."}'::jsonb,
  'Arthur Cole accidentally struck Lucy in 1984; on his deathbed, his sister returned the bicycle to guide police to her resting place.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Lucy was laid to rest beside her parents with full town honors, and David’s forty-year quest was finally at peace."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Martha hid the key, leaving the bicycle outside the soda shop as an unsolved ghost legend forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The bicycle was stolen from the rack by scrap scavengers, burying the truth once more."}]'::jsonb,
  '{"intros":["Forty years after a twelve-year-old girl vanished while riding her red Schwinn bicycle to buy sodas, her bicycle was found standing upright in the exact same rack, polished clean and bearing a fresh bouquet of yellow daisies.","Case file story_115: Forty years after a twelve-year-old girl vanished while riding her red Schwinn bicycle to buy sodas, her bicycle was found standing upright in the exact same rack, polished clean and bearing a fresh bouquet of yellow daisies. Look closely at every clue.","Trouble begins in The dusty roadside outside an abandoned 1950s soda fountain in Oak Creek, peeling red neon, overgrown weeds, and rusted bicycle racks. Forty years after a twelve-year-old girl vanished while riding her red Schwinn bicycle to buy sodas, her bicycle was found standing upright in the exact same rack, polished clean and bearing a fresh bouquet of yellow daisies.","The mystery starts now. Forty years after a twelve-year-old girl vanished while riding her red Schwinn bicycle to buy sodas, her bicycle was found standing upright in the exact same rack, polished clean and bearing a fresh bouquet of yellow daisies. Can you solve it?"],"reveals":["Arthur Cole accidentally struck Lucy in 1984; on his deathbed, his sister returned the bicycle to guide police to her resting place.","The mystery is unraveled! Arthur Cole accidentally struck Lucy in 1984; on his deathbed, his sister returned the bicycle to guide police to her resting place.","At last, the truth comes out: Arthur Cole accidentally struck Lucy in 1984; on his deathbed, his sister returned the bicycle to guide police to her resting place.","Case resolved! Here is what happened: Arthur Cole accidentally struck Lucy in 1984; on his deathbed, his sister returned the bicycle to guide police to her resting place."],"hints":["Pay attention to where Neighbor Arthur Cole (Deceased) was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_115';
DELETE FROM public.case_events WHERE case_id = 'story_115';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '2f7a70b9-4046-54e8-8bb2-327b5cc2e254',
  'story_115',
  'Martha Cole',
  'Elderly Neighbor’s Sister',
  'Frail, eighty years old, black shawl, weeping softly, trembling hands holding garden shears',
  'My brother Arthur took a terrible secret to his grave. I had to bring Lucy’s bicycle home before I died.',
  'The iron key to the underground root cellar where Lucy was laid to rest.',
  'Living in the Cole family farmhouse down the road',
  'Sister of the hit-and-run driver Arthur Cole',
  'Arthur spent forty years polishing Lucy’s bicycle in his cellar in silent torment.',
  'Did not know Lucy’s brother had spent his entire adult life searching for her.',
  '👵',
  '["My brother Arthur took a terrible secret to his grave. I had to bring Lucy’s bicycle home before I died.","\"My brother Arthur took a terrible secret to his grave. I had to bring Lucy’s bicycle home before I died.\"","Listen to me: My brother Arthur took a terrible secret to his grave. I had to bring Lucy’s bicycle home before I died.","I tell you the truth: My brother Arthur took a terrible secret to his grave. I had to bring Lucy’s bicycle home before I died."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '981a5ffa-d1d5-5a0e-9e5a-6f44495a4c21',
  'story_115',
  'Lucy Vance (Victim in 1984)',
  'Vanished Sister',
  'Gentle twelve-year-old girl, loved yellow daisies, missed by her family for forty years',
  'Deceased victim; pocket contained a silver dime and a grocery note for soda pop.',
  'Her brother’s lucky baseball card was tucked into her shoe sole.',
  'Missing since July 14, 1984',
  'Beloved sister of Detective David Vance',
  'Arthur was speeding through the rain without headlights.',
  'Did not survive the impact on the dark country bend.',
  '🚲',
  '["Deceased victim; pocket contained a silver dime and a grocery note for soda pop.","\"Deceased victim; pocket contained a silver dime and a grocery note for soda pop.\"","Listen to me: Deceased victim; pocket contained a silver dime and a grocery note for soda pop.","I tell you the truth: Deceased victim; pocket contained a silver dime and a grocery note for soda pop."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '06fa1539-19b4-563d-a58f-96345bc023cf',
  'story_115',
  'David Vance',
  'Detective & Lucy’s Brother',
  'Hardened homicide detective, graying hair, eyes filled with decades of pain and tears',
  'I promised my parents on their deathbeds that I would never stop looking for my little sister.',
  'He kept Lucy’s favorite ribbon pinned inside his detective badge case.',
  'Called immediately to the old soda shop upon the bicycle’s recovery',
  'Brother of the victim Lucy Vance',
  'The red Schwinn bicycle had a custom bell engraved with Lucy’s initials "L.V.".',
  'Did not know Arthur Cole was the truck driver who hit her.',
  '🕵️‍♂️',
  '["I promised my parents on their deathbeds that I would never stop looking for my little sister.","\"I promised my parents on their deathbeds that I would never stop looking for my little sister.\"","Listen to me: I promised my parents on their deathbeds that I would never stop looking for my little sister.","I tell you the truth: I promised my parents on their deathbeds that I would never stop looking for my little sister."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '4591ee08-7fec-5bb6-b8cb-058c1d2b0366',
  'story_115',
  'Officer Clara Bell',
  'Town Police Chief',
  'Supportive, practical, carrying forensic tape and cameras, sympathetic to David',
  'Bicycles stored in barns for forty years retain distinct vintage oil smells and spider silk traces.',
  'She remembered the massive community search parties of 1984 as a child.',
  'Securing the perimeter of the soda shop rack',
  'Lifelong resident and law officer',
  'The yellow daisies on the handlebars were cut from Martha Cole’s front flower garden.',
  'Did not know where the root cellar was hidden on the Cole farm.',
  '👮‍♀️',
  '["Bicycles stored in barns for forty years retain distinct vintage oil smells and spider silk traces.","\"Bicycles stored in barns for forty years retain distinct vintage oil smells and spider silk traces.\"","Listen to me: Bicycles stored in barns for forty years retain distinct vintage oil smells and spider silk traces.","I tell you the truth: Bicycles stored in barns for forty years retain distinct vintage oil smells and spider silk traces."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c0536e81-3cf0-5e40-be05-a75372c8282e',
  'story_115',
  'Arthur Cole (Deceased Neighbor)',
  'Hit-and-Run Driver & Culprit',
  'Guilt-ridden farmer who concealed his fatal accident for four decades',
  'Deceased this week; his deathbed letter confessed to the accidental strike in the rain.',
  'He concealed Lucy’s body and bicycle in his underground root cellar behind heavy barrels.',
  'Deceased this week; was driving home in his farm truck on July 14, 1984',
  'Late brother of Martha Cole and neighbor to the Vance family',
  'He kept the bicycle polished with machine oil every winter out of remorse.',
  'Did not know his sister would restore the bike and return it to bring peace to Lucy’s family.',
  '🚜',
  '["Deceased this week; his deathbed letter confessed to the accidental strike in the rain.","\"Deceased this week; his deathbed letter confessed to the accidental strike in the rain.\"","Listen to me: Deceased this week; his deathbed letter confessed to the accidental strike in the rain.","I tell you the truth: Deceased this week; his deathbed letter confessed to the accidental strike in the rain."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e53e48e2-8e3e-5ab8-8809-4cac47ce07c5',
  'story_115',
  'ev_1',
  1,
  'Today - 07:30 AM',
  'Townspeople discover the red bicycle outside the abandoned soda shop.',
  'Townspeople discover the red bicycle outside the abandoned soda shop.',
  'Lucy’s pristine red Schwinn bicycle parked upright in the rusted bike rack.',
  'Pristine red Schwinn bicycle',
  'Returned 1984 Bicycle',
  '["Rusted scrap","Motorcycle","Tricycle"]'::jsonb,
  'Pristine red Schwinn bicycle',
  '["pristine red schwinn bicycle","red bicycle","schwinn","bicycle","returned bicycle"]'::jsonb,
  'The vintage red bicycle that vanished forty years ago returned spotless.',
  'ev_2',
  true,
  '{"descriptions":["Townspeople discover the red bicycle outside the abandoned soda shop.","At Today - 07:30 AM: Townspeople discover the red bicycle outside the abandoned soda shop.","Notice this clue: Townspeople discover the red bicycle outside the abandoned soda shop."],"hints":["The vintage red bicycle that vanished forty years ago returned spotless.","Clue hint: Think about pristine red schwinn bicycle.","Search for: lucy’s pristine red schwinn bicycle parked upright in the rusted bike rack."],"clues":["Pristine red Schwinn bicycle","Item: Pristine red Schwinn bicycle","Clue Word: Pristine red Schwinn bicycle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '653dfc18-e139-5464-ba94-8d99afe6cc16',
  'story_115',
  'ev_2',
  2,
  'Today - 07:45 AM',
  'Detective David Vance inspects the chrome handlebar bell.',
  'Detective David Vance inspects the chrome handlebar bell.',
  'An engraved chrome bell bearing his sister’s initials "L.V.".',
  'Engraved initials bell',
  'Chrome Initial Bell',
  '["Plastic reflector","Horn","Basket"]'::jsonb,
  'Engraved initials bell',
  '["engraved initials bell","initial bell","chrome bell","bell","lv bell"]'::jsonb,
  'Handlebar bell proving the bicycle was the exact one belonging to Lucy.',
  'ev_3',
  false,
  '{"descriptions":["Detective David Vance inspects the chrome handlebar bell.","At Today - 07:45 AM: Detective David Vance inspects the chrome handlebar bell.","Notice this clue: Detective David Vance inspects the chrome handlebar bell."],"hints":["Handlebar bell proving the bicycle was the exact one belonging to Lucy.","Clue hint: Think about engraved initials bell.","Search for: an engraved chrome bell bearing his sister’s initials \"l.v.\"."],"clues":["Engraved initials bell","Item: Engraved initials bell","Clue Word: Engraved initials bell"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '27d9d2f0-199c-5cc2-b93d-21ed230a3620',
  'story_115',
  'ev_3',
  3,
  'Today - 08:00 AM',
  'Officer Clara Bell examines the bouquet tied to the handlebars.',
  'Officer Clara Bell examines the bouquet tied to the handlebars.',
  'Freshly cut yellow daisies tied with white cotton embroidery thread.',
  'Yellow daisies bouquet',
  'Fresh Flower Bouquet',
  '["Plastic roses","Dead weeds","Ribbon"]'::jsonb,
  'Yellow daisies bouquet',
  '["yellow daisies bouquet","yellow daisies","daisies","flower bouquet","daisies bouquet"]'::jsonb,
  'Fresh flowers cut this morning from a local garden.',
  'ev_4',
  false,
  '{"descriptions":["Officer Clara Bell examines the bouquet tied to the handlebars.","At Today - 08:00 AM: Officer Clara Bell examines the bouquet tied to the handlebars.","Notice this clue: Officer Clara Bell examines the bouquet tied to the handlebars."],"hints":["Fresh flowers cut this morning from a local garden.","Clue hint: Think about yellow daisies bouquet.","Search for: freshly cut yellow daisies tied with white cotton embroidery thread."],"clues":["Yellow daisies bouquet","Item: Yellow daisies bouquet","Clue Word: Yellow daisies bouquet"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '36bc26bb-2e02-5cc1-8c37-12499b26fa3a',
  'story_115',
  'ev_4',
  4,
  'Today - 08:30 AM',
  'Chief Bell inspects the botanical variety of the daisies.',
  'Chief Bell inspects the botanical variety of the daisies.',
  'A rare heritage cultivar grown exclusively in Martha Cole’s front yard garden.',
  'Heritage daisy cultivar match',
  'Botanical Garden Match',
  '["Wild dandelion","Sunflower","Carnation"]'::jsonb,
  'Heritage daisy cultivar match',
  '["heritage daisy cultivar match","daisy match","heritage daisy","garden match","botanical match"]'::jsonb,
  'Specific flowers tracing the person who delivered the bike directly to Martha Cole.',
  'ev_5',
  false,
  '{"descriptions":["Chief Bell inspects the botanical variety of the daisies.","At Today - 08:30 AM: Chief Bell inspects the botanical variety of the daisies.","Notice this clue: Chief Bell inspects the botanical variety of the daisies."],"hints":["Specific flowers tracing the person who delivered the bike directly to Martha Cole.","Clue hint: Think about heritage daisy cultivar match.","Search for: a rare heritage cultivar grown exclusively in martha cole’s front yard garden."],"clues":["Heritage daisy cultivar match","Item: Heritage daisy cultivar match","Clue Word: Heritage daisy cultivar match"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6739add0-20e0-5482-8016-afb3fffa6ddc',
  'story_115',
  'ev_5',
  5,
  'Today - 09:15 AM',
  'David and Bell visit Martha Cole at the nearby farmhouse.',
  'David and Bell visit Martha Cole at the nearby farmhouse.',
  'Martha weeping on the porch holding Arthur’s handwritten dying confession.',
  'Arthur Cole’s dying confession',
  'Written Hit-and-Run Confession',
  '["Will","Deed","Photo album"]'::jsonb,
  'Arthur Cole’s dying confession',
  '["arthur cole’s dying confession","dying confession","arthur confession","confession letter","written confession"]'::jsonb,
  'Note written by the driver admitting he struck Lucy on the rainy bend in 1984.',
  'ev_6',
  true,
  '{"descriptions":["David and Bell visit Martha Cole at the nearby farmhouse.","At Today - 09:15 AM: David and Bell visit Martha Cole at the nearby farmhouse.","Notice this clue: David and Bell visit Martha Cole at the nearby farmhouse."],"hints":["Note written by the driver admitting he struck Lucy on the rainy bend in 1984.","Clue hint: Think about arthur cole’s dying confession.","Search for: martha weeping on the porch holding arthur’s handwritten dying confession."],"clues":["Arthur Cole’s dying confession","Item: Arthur Cole’s dying confession","Clue Word: Arthur Cole’s dying confession"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '993c6a2a-b289-5e53-bd41-64df79b93a5a',
  'story_115',
  'ev_6',
  6,
  'Today - 09:45 AM',
  'Martha hands David the heavy iron key to the root cellar.',
  'Martha hands David the heavy iron key to the root cellar.',
  'An antique skeleton key labeled "Storm Cellar Under Barn".',
  'Storm cellar iron key',
  'Root Cellar Key',
  '["Padlock key","Tractor key","House key"]'::jsonb,
  'Storm cellar iron key',
  '["storm cellar iron key","cellar key","iron key","storm cellar key","key"]'::jsonb,
  'Key to the underground vault where Lucy was placed forty years ago.',
  'ev_7',
  false,
  '{"descriptions":["Martha hands David the heavy iron key to the root cellar.","At Today - 09:45 AM: Martha hands David the heavy iron key to the root cellar.","Notice this clue: Martha hands David the heavy iron key to the root cellar."],"hints":["Key to the underground vault where Lucy was placed forty years ago.","Clue hint: Think about storm cellar iron key.","Search for: an antique skeleton key labeled \"storm cellar under barn\"."],"clues":["Storm cellar iron key","Item: Storm cellar iron key","Clue Word: Storm cellar iron key"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3225524c-0b15-58ea-af57-b7f5ecc670f5',
  'story_115',
  'ev_7',
  7,
  'Today - 10:30 AM',
  'Police open the underground storm cellar behind the barn.',
  'Police open the underground storm cellar behind the barn.',
  'A peaceful cedar resting box containing Lucy’s remains and her silver dime.',
  'Cedar resting box with Lucy',
  'Lucy Vance’s Remains',
  '["Empty room","Coal pile","Stolen tools"]'::jsonb,
  'Cedar resting box with Lucy',
  '["cedar resting box with lucy","cedar box","lucy remains","resting box","remains"]'::jsonb,
  'The physical discovery bringing closure to forty years of heartbreaking mystery.',
  'ev_8',
  false,
  '{"descriptions":["Police open the underground storm cellar behind the barn.","At Today - 10:30 AM: Police open the underground storm cellar behind the barn.","Notice this clue: Police open the underground storm cellar behind the barn."],"hints":["The physical discovery bringing closure to forty years of heartbreaking mystery.","Clue hint: Think about cedar resting box with lucy.","Search for: a peaceful cedar resting box containing lucy’s remains and her silver dime."],"clues":["Cedar resting box with Lucy","Item: Cedar resting box with Lucy","Clue Word: Cedar resting box with Lucy"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'fe421901-a87b-5220-80aa-b095b23440d1',
  'story_115',
  'ev_8',
  8,
  'Today - 11:30 AM',
  'David falls to his knees, finally bringing his little sister home.',
  'David falls to his knees, finally bringing his little sister home.',
  'David whispering: "Lucy, I found you... we’re going home now."',
  'Brother’s closure promise',
  'Final Family Closure',
  '["Angry arrest","Lawsuit","Silence"]'::jsonb,
  'Brother’s closure promise',
  '["brother’s closure promise","brother closure","closure promise","family closure","closure"]'::jsonb,
  'The emotional moment an eighty-year-old family promise is fulfilled.',
  NULL,
  true,
  '{"descriptions":["David falls to his knees, finally bringing his little sister home.","At Today - 11:30 AM: David falls to his knees, finally bringing his little sister home.","Notice this clue: David falls to his knees, finally bringing his little sister home."],"hints":["The emotional moment an eighty-year-old family promise is fulfilled.","Clue hint: Think about brother’s closure promise.","Search for: david whispering: \"lucy, i found you... we’re going home now.\""],"clues":["Brother’s closure promise","Item: Brother’s closure promise","Clue Word: Brother’s closure promise"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_116 — THE BAKER’S RECIPE BOOK
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_116',
  'The Baker’s Recipe Book',
  'Emotional Mystery',
  'The warm, flour-dusted kitchen of the historic Old Mill Bakery, brick hearth ovens, wooden kneading troughs, and brass scales',
  'After the town’s beloved master baker passed away, his three greedy children fought bitterly over his million-dollar sourdough starter recipe, but his handwritten recipe book contained only blank pages except for a single recipe for "Bread of Grace".',
  '[{"name":"Richard Vance","role":"Ambitious Corporate Son","alibi":"Rummaging through his father’s office desk","avatar":"💼"},{"name":"Marco Vance (Late Master Baker)","role":"Beloved Town Baker","alibi":"Passed away peacefully at age 82","avatar":"🥖"},{"name":"Elena Vance","role":"Artisan Pastry Daughter","alibi":"Kneading dough at the marble counter","avatar":"👩‍🍳"},{"name":"Thomas Vance","role":"Estranged Youngest Son","alibi":"Standing in the kitchen doorway holding his old bread paddle","avatar":"🪵"}]'::jsonb,
  'Master Baker Marco Vance knew his children were consumed by corporate greed. He divided the true century-old sourdough starter ingredients across the personal childhood memories of each of his three children in the "Bread of Grace" recipe. The recipe could only be baked if all three children forgave each other and worked together at the hearth.',
  'Oldest Son Richard Vance',
  'Richard wanted to sell the sourdough starter to a commercial bread conglomerate for two million dollars.',
  '[{"time":"Yesterday - 08:00 AM","event":"Master Baker Marco writes \"The Bread of Grace\" in his final blank recipe book."},{"time":"Yesterday - 09:00 PM","event":"Marco passes away peacefully beside the warm brick oven."},{"time":"Today - 09:00 AM","event":"Richard arrives with corporate lawyers demanding to seize the sourdough safe."},{"time":"Today - 10:00 AM","event":"Elena and Thomas discover the blank recipe book containing only the riddle."},{"time":"Today - 11:00 AM","event":"The three siblings realize the three ingredients correspond to their childhoods."}]'::jsonb,
  '[{"id":"ev_1","title":"The Bread of Grace Recipe","detail":"Marco’s final recipe requiring the three estranged children to unite their skills."},{"id":"ev_2","title":"Historic Sourdough Culture","detail":"100-year-old living starter saved from death by the combined three ingredients."},{"id":"ev_3","title":"Torn Buyout Agreement","detail":"The multi-million corporate offer torn up by Richard in a moment of family redemption."},{"id":"ev_4","title":"The Restored Master Loaf","detail":"The golden sourdough loaf proving the family bakery’s soul was preserved."}]'::jsonb,
  '[{"order":1,"title":"Blank recipe book with single entry","text":"Demonstrates Marco’s intentional design to teach a lesson rather than leave a commercial formula."},{"order":2,"title":"Three siblings riddle","text":"The puzzle connecting each ingredient to a specific estranged child."},{"order":3,"title":"Dying mother starter jar","text":"The urgent ticking clock that forced the siblings to work together immediately."},{"order":4,"title":"Wild mountain honey","text":"Elena’s contribution of sweetness and memory."},{"order":5,"title":"Roasted hazelnut meal","text":"Thomas’s contribution of artisan craft and earthiness."},{"order":6,"title":"Patience cold fermentation","text":"Richard’s contribution of discipline, forcing him to abandon corporate haste."}]'::jsonb,
  'Flour mill delivery invoice: Standard bulk grain bill, unrelated to the secret formula.; Old debt collector notice in the office: Paid off by Marco years ago, held no relevance to the recipe.',
  'Claim the baker took the secret starter recipe to his grave out of bitterness.',
  'NORMAL',
  'Where was the baker’s famous sourdough recipe, and what secret did the Bread of Grace recipe hide?',
  '[{"character":"Richard Vance","secret":"A bottle of bleach in his briefcase used to try and wash out handwritten marginal notes."},{"character":"Marco Vance (Late Master Baker)","secret":"The hundred-year-old mother sourdough culture stored in the hearth floor safe."},{"character":"Elena Vance","secret":"She remembered father’s secret temperature formula for the wood hearth."},{"character":"Thomas Vance","secret":"A carved wooden bread paddle father gave him when he was seven years old."}]'::jsonb,
  '[{"lead":"Flour mill delivery invoice","explanation":"Standard bulk grain bill, unrelated to the secret formula."},{"lead":"Old debt collector notice in the office","explanation":"Paid off by Marco years ago, held no relevance to the recipe."}]'::jsonb,
  '{"wrongTheories":["The baker sold the real recipe to a French competitor before he died.","The apprentice stole the pages of the recipe book to open a rival shop in the city."],"correctTheory":"Marco Vance left a blank recipe book with a three-part riddle so his greedy children would be forced to reconcile and bake together to save the bakery."}'::jsonb,
  'Marco Vance divided the sourdough recipe across his three children’s childhood memories, forcing them to reconcile to bake the bread.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"The siblings reconciled, rejected the corporate buyout, and operated the Old Mill Bakery together for the next generation."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Richard sold the dying starter to the conglomerate, destroying the family heritage and losing his siblings forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The bakery was shuttered and demolished, turning the master sourdough into a forgotten commercial myth."}]'::jsonb,
  '{"intros":["After the town’s beloved master baker passed away, his three greedy children fought bitterly over his million-dollar sourdough starter recipe, but his handwritten recipe book contained only blank pages except for a single recipe for \"Bread of Grace\".","Case file story_116: After the town’s beloved master baker passed away, his three greedy children fought bitterly over his million-dollar sourdough starter recipe, but his handwritten recipe book contained only blank pages except for a single recipe for \"Bread of Grace\". Look closely at every clue.","Trouble begins in The warm, flour-dusted kitchen of the historic Old Mill Bakery, brick hearth ovens, wooden kneading troughs, and brass scales. After the town’s beloved master baker passed away, his three greedy children fought bitterly over his million-dollar sourdough starter recipe, but his handwritten recipe book contained only blank pages except for a single recipe for \"Bread of Grace\".","The mystery starts now. After the town’s beloved master baker passed away, his three greedy children fought bitterly over his million-dollar sourdough starter recipe, but his handwritten recipe book contained only blank pages except for a single recipe for \"Bread of Grace\". Can you solve it?"],"reveals":["Marco Vance divided the sourdough recipe across his three children’s childhood memories, forcing them to reconcile to bake the bread.","The mystery is unraveled! Marco Vance divided the sourdough recipe across his three children’s childhood memories, forcing them to reconcile to bake the bread.","At last, the truth comes out: Marco Vance divided the sourdough recipe across his three children’s childhood memories, forcing them to reconcile to bake the bread.","Case resolved! Here is what happened: Marco Vance divided the sourdough recipe across his three children’s childhood memories, forcing them to reconcile to bake the bread."],"hints":["Pay attention to where Oldest Son Richard Vance was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_116';
DELETE FROM public.case_events WHERE case_id = 'story_116';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1367d88a-0e1a-5af9-b758-9ef38f4499c1',
  'story_116',
  'Richard Vance',
  'Ambitious Corporate Son',
  'Tailored suit, expensive shoes covered in flour, impatient, holding corporate buyout contract',
  'Father’s recipe is worth two million dollars to National Bread Mills! We are selling this shop today.',
  'A bottle of bleach in his briefcase used to try and wash out handwritten marginal notes.',
  'Rummaging through his father’s office desk',
  'Eldest son of master baker Marco Vance',
  'The commercial conglomerate gave them an ultimatum ending at noon today.',
  'Did not know the sourdough starter dies within twelve hours unless fed with the secret flour blend.',
  '💼',
  '["Father’s recipe is worth two million dollars to National Bread Mills! We are selling this shop today.","\"Father’s recipe is worth two million dollars to National Bread Mills! We are selling this shop today.\"","Listen to me: Father’s recipe is worth two million dollars to National Bread Mills! We are selling this shop today.","I tell you the truth: Father’s recipe is worth two million dollars to National Bread Mills! We are selling this shop today."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '9f7c02c7-9e96-5728-8e56-a6fd23abc4ac',
  'story_116',
  'Marco Vance (Late Master Baker)',
  'Beloved Town Baker',
  'Warm, flour on his cheeks, laughing eyes, left a final note: "Bread is love made visible."',
  'Deceased father; his kitchen plaque read: "No loaf rises without three measures of love."',
  'The hundred-year-old mother sourdough culture stored in the hearth floor safe.',
  'Passed away peacefully at age 82',
  'Founder of the Old Mill Bakery',
  'His children had not spoken to each other in ten years over petty inheritance disputes.',
  'Could only pray his final riddle would heal their broken family bond.',
  '🥖',
  '["Deceased father; his kitchen plaque read: \"No loaf rises without three measures of love.\"","\"Deceased father; his kitchen plaque read: \"No loaf rises without three measures of love.\"\"","Listen to me: Deceased father; his kitchen plaque read: \"No loaf rises without three measures of love.\"","I tell you the truth: Deceased father; his kitchen plaque read: \"No loaf rises without three measures of love.\""]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6b03c98d-cff3-53fa-9005-8b23d4cb3d7f',
  'story_116',
  'Elena Vance',
  'Artisan Pastry Daughter',
  'Flour-dusted apron, gentle, weeping over her father’s rolling pin, holding wild yeast',
  'Father didn’t care about millions. He poured his life into feeding the hungry during winter strikes.',
  'She remembered father’s secret temperature formula for the wood hearth.',
  'Kneading dough at the marble counter',
  'Daughter who worked beside Marco for twenty years',
  'The sourdough mother requires wild mountain honey and crushed barley malt.',
  'Did not know the third missing ingredient only the youngest brother knew.',
  '👩‍🍳',
  '["Father didn’t care about millions. He poured his life into feeding the hungry during winter strikes.","\"Father didn’t care about millions. He poured his life into feeding the hungry during winter strikes.\"","Listen to me: Father didn’t care about millions. He poured his life into feeding the hungry during winter strikes.","I tell you the truth: Father didn’t care about millions. He poured his life into feeding the hungry during winter strikes."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '11df66ae-1af2-5c62-b146-3f1bb8918ac2',
  'story_116',
  'Thomas Vance',
  'Estranged Youngest Son',
  'Quiet carpenter, denim jacket, rough hands, ashamed of leaving the family bakery years ago',
  'I left because Richard called me a failure. But father always saved a warm rye crust for me every Sunday.',
  'A carved wooden bread paddle father gave him when he was seven years old.',
  'Standing in the kitchen doorway holding his old bread paddle',
  'Youngest son who left to become a woodworker',
  'Father’s secret third ingredient was toasted hazelnut flour milled by hand.',
  'Did not know Elena and Richard needed his secret to save the bakery.',
  '🪵',
  '["I left because Richard called me a failure. But father always saved a warm rye crust for me every Sunday.","\"I left because Richard called me a failure. But father always saved a warm rye crust for me every Sunday.\"","Listen to me: I left because Richard called me a failure. But father always saved a warm rye crust for me every Sunday.","I tell you the truth: I left because Richard called me a failure. But father always saved a warm rye crust for me every Sunday."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'e9c9e3b3-3a1b-525a-8121-507ee960ad24',
  'story_116',
  'ev_1',
  1,
  '10:00 AM',
  'Elena opens Marco’s leather-bound recipe book.',
  'Elena opens Marco’s leather-bound recipe book.',
  'All pages blank except for a single entry titled "The Bread of Grace: Measure of Three".',
  'Blank recipe book with single entry',
  'The Bread of Grace Recipe',
  '["Filled formula book","Bank ledger","Empty diary"]'::jsonb,
  'Blank recipe book with single entry',
  '["blank recipe book with single entry","recipe book","bread of grace","recipe","single entry"]'::jsonb,
  'Handwritten book holding only one symbolic recipe for the children.',
  'ev_2',
  true,
  '{"descriptions":["Elena opens Marco’s leather-bound recipe book.","At 10:00 AM: Elena opens Marco’s leather-bound recipe book.","Notice this clue: Elena opens Marco’s leather-bound recipe book."],"hints":["Handwritten book holding only one symbolic recipe for the children.","Clue hint: Think about blank recipe book with single entry.","Search for: all pages blank except for a single entry titled \"the bread of grace: measure of three\"."],"clues":["Blank recipe book with single entry","Item: Blank recipe book with single entry","Clue Word: Blank recipe book with single entry"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bd3340b4-59ef-5171-b356-021115e4413c',
  'story_116',
  'ev_2',
  2,
  '10:15 AM',
  'Elena reads the riddle of the three ingredients.',
  'Elena reads the riddle of the three ingredients.',
  'Parchment lines: "Richard’s patience, Elena’s wild honey, and Thomas’s hazelnut timber."',
  'Three siblings riddle',
  'Marco’s Sibling Riddle',
  '["Measurement chart","Pricing list","Baking times"]'::jsonb,
  'Three siblings riddle',
  '["three siblings riddle","sibling riddle","three riddle","riddle","ingredients riddle"]'::jsonb,
  'Riddle written by the baker requiring all three children’s specific skills.',
  'ev_3',
  false,
  '{"descriptions":["Elena reads the riddle of the three ingredients.","At 10:15 AM: Elena reads the riddle of the three ingredients.","Notice this clue: Elena reads the riddle of the three ingredients."],"hints":["Riddle written by the baker requiring all three children’s specific skills.","Clue hint: Think about three siblings riddle.","Search for: parchment lines: \"richard’s patience, elena’s wild honey, and thomas’s hazelnut timber.\""],"clues":["Three siblings riddle","Item: Three siblings riddle","Clue Word: Three siblings riddle"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'af2af04b-f1e1-5838-b720-6ab73137ce5a',
  'story_116',
  'ev_3',
  3,
  '10:30 AM',
  'Richard finds the mother starter jar in the hearth floor safe.',
  'Richard finds the mother starter jar in the hearth floor safe.',
  'The 100-year-old sourdough starter bubbling and dying without its feeding blend.',
  'Dying mother starter jar',
  'Historic Sourdough Culture',
  '["Dry flour","Yeast packet","Water jug"]'::jsonb,
  'Dying mother starter jar',
  '["dying mother starter jar","starter jar","mother starter","sourdough starter","sourdough culture"]'::jsonb,
  'Centuries-old living sourdough culture that would perish without the three ingredients.',
  'ev_4',
  false,
  '{"descriptions":["Richard finds the mother starter jar in the hearth floor safe.","At 10:30 AM: Richard finds the mother starter jar in the hearth floor safe.","Notice this clue: Richard finds the mother starter jar in the hearth floor safe."],"hints":["Centuries-old living sourdough culture that would perish without the three ingredients.","Clue hint: Think about dying mother starter jar.","Search for: the 100-year-old sourdough starter bubbling and dying without its feeding blend."],"clues":["Dying mother starter jar","Item: Dying mother starter jar","Clue Word: Dying mother starter jar"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd66b6f05-f0d1-5f33-a968-ca4d7e534781',
  'story_116',
  'ev_4',
  4,
  '10:45 AM',
  'Elena shows her jar of wild mountain honey.',
  'Elena shows her jar of wild mountain honey.',
  'Ingredient one: Wild lavender honey harvested from their childhood meadow.',
  'Wild mountain honey',
  'Elena’s Honey Ingredient',
  '["Sugar","Molasses","Syrup"]'::jsonb,
  'Wild mountain honey',
  '["wild mountain honey","mountain honey","wild honey","honey","lavender honey"]'::jsonb,
  'Natural floral sweetener known only to the daughter.',
  'ev_5',
  false,
  '{"descriptions":["Elena shows her jar of wild mountain honey.","At 10:45 AM: Elena shows her jar of wild mountain honey.","Notice this clue: Elena shows her jar of wild mountain honey."],"hints":["Natural floral sweetener known only to the daughter.","Clue hint: Think about wild mountain honey.","Search for: ingredient one: wild lavender honey harvested from their childhood meadow."],"clues":["Wild mountain honey","Item: Wild mountain honey","Clue Word: Wild mountain honey"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0cc20e1c-9f8e-5736-845c-77755437bacf',
  'story_116',
  'ev_5',
  5,
  '11:00 AM',
  'Thomas reveals his carved hazelnut wood paddle.',
  'Thomas reveals his carved hazelnut wood paddle.',
  'Ingredient two: Fine roasted hazelnut meal milled using Thomas’s woodworking tools.',
  'Roasted hazelnut meal',
  'Thomas’s Hazelnut Ingredient',
  '["Almond flour","Walnut dust","Cornmeal"]'::jsonb,
  'Roasted hazelnut meal',
  '["roasted hazelnut meal","hazelnut meal","hazelnut flour","hazelnuts","roasted meal"]'::jsonb,
  'Nutty flour blend known only to the youngest son.',
  'ev_6',
  true,
  '{"descriptions":["Thomas reveals his carved hazelnut wood paddle.","At 11:00 AM: Thomas reveals his carved hazelnut wood paddle.","Notice this clue: Thomas reveals his carved hazelnut wood paddle."],"hints":["Nutty flour blend known only to the youngest son.","Clue hint: Think about roasted hazelnut meal.","Search for: ingredient two: fine roasted hazelnut meal milled using thomas’s woodworking tools."],"clues":["Roasted hazelnut meal","Item: Roasted hazelnut meal","Clue Word: Roasted hazelnut meal"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c7194c0b-8289-512a-9cdc-9b4437c878d5',
  'story_116',
  'ev_6',
  6,
  '11:15 AM',
  'Richard realizes his father’s lesson on "patience".',
  'Richard realizes his father’s lesson on "patience".',
  'Ingredient three: A six-hour cold fermentation in the cellar requiring Richard’s time.',
  'Patience cold fermentation',
  'Richard’s Fermentation Formula',
  '["Quick yeast","Microwave heat","Chemical rising"]'::jsonb,
  'Patience cold fermentation',
  '["patience cold fermentation","cold fermentation","patience","fermentation","fermentation formula"]'::jsonb,
  'The time-consuming cooling process requiring the business son to slow down and stay.',
  'ev_7',
  false,
  '{"descriptions":["Richard realizes his father’s lesson on \"patience\".","At 11:15 AM: Richard realizes his father’s lesson on \"patience\".","Notice this clue: Richard realizes his father’s lesson on \"patience\"."],"hints":["The time-consuming cooling process requiring the business son to slow down and stay.","Clue hint: Think about patience cold fermentation.","Search for: ingredient three: a six-hour cold fermentation in the cellar requiring richard’s time."],"clues":["Patience cold fermentation","Item: Patience cold fermentation","Clue Word: Patience cold fermentation"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '608d74e9-84a2-5ea6-853e-c94e3a18fd8a',
  'story_116',
  'ev_7',
  7,
  '11:30 AM',
  'The three siblings stand together at the kneading trough.',
  'The three siblings stand together at the kneading trough.',
  'Tears of reconciliation as Richard tears up the corporate buyout contract.',
  'Torn corporate contract',
  'Torn Buyout Agreement',
  '["Signed sale","Lawsuit notice","Eviction"]'::jsonb,
  'Torn corporate contract',
  '["torn corporate contract","torn contract","buyout contract","contract","torn agreement"]'::jsonb,
  'Paper contract ripped to shreds as the family chooses love over corporate millions.',
  'ev_8',
  false,
  '{"descriptions":["The three siblings stand together at the kneading trough.","At 11:30 AM: The three siblings stand together at the kneading trough.","Notice this clue: The three siblings stand together at the kneading trough."],"hints":["Paper contract ripped to shreds as the family chooses love over corporate millions.","Clue hint: Think about torn corporate contract.","Search for: tears of reconciliation as richard tears up the corporate buyout contract."],"clues":["Torn corporate contract","Item: Torn corporate contract","Clue Word: Torn corporate contract"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '39cd6135-dd7b-50ec-bd6c-4401e2196037',
  'story_116',
  'ev_8',
  8,
  '12:00 PM',
  'The first loaf of Bread of Grace emerges golden from the brick oven.',
  'The first loaf of Bread of Grace emerges golden from the brick oven.',
  'The legendary aroma filling the street as the bakery is saved forever.',
  'Golden Bread of Grace',
  'The Restored Master Loaf',
  '["Burnt bread","Flat dough","Stale crust"]'::jsonb,
  'Golden Bread of Grace',
  '["golden bread of grace","bread of grace","golden bread","master loaf","restored loaf"]'::jsonb,
  'The perfect loaf baked by the reunited siblings honoring their father.',
  NULL,
  true,
  '{"descriptions":["The first loaf of Bread of Grace emerges golden from the brick oven.","At 12:00 PM: The first loaf of Bread of Grace emerges golden from the brick oven.","Notice this clue: The first loaf of Bread of Grace emerges golden from the brick oven."],"hints":["The perfect loaf baked by the reunited siblings honoring their father.","Clue hint: Think about golden bread of grace.","Search for: the legendary aroma filling the street as the bakery is saved forever."],"clues":["Golden Bread of Grace","Item: Golden Bread of Grace","Clue Word: Golden Bread of Grace"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_117 — THE MUSIC BOX IN THE ORPHANAGE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_117',
  'The Music Box in the Orphanage',
  'Emotional Mystery',
  'The candlelit attic dorm of St. Jude’s Home for Children, iron spring beds, rain against dormer windows, and a locked wooden toy chest',
  'Inside an antique carved music box that had sat silent on the orphanage mantle for thirty years, a lullaby suddenly began playing on its own at midnight, revealing a false bottom containing a baby’s adoption bracelet.',
  '[{"name":"Sister Clara","role":"Orphanage Headmistress","alibi":"In the ground-floor chapel when the music chimed through the vents","avatar":"🕊️"},{"name":"Nora Vance (Adult Foundling)","role":"Orphanage Teacher & Foundling","alibi":"Sleeping in the teacher’s quarters when the chime awoke her","avatar":"👩‍🏫"},{"name":"Julian Vance","role":"Vance Estate Heir","alibi":"Arrived at the orphanage after receiving a call about the Vance music box","avatar":"💼"},{"name":"Inspector Thomas Finch","role":"Historical Inquiries Detective","alibi":"Called to the orphanage by Sister Clara to inspect the opened compartment","avatar":"🔍"},{"name":"Arthur Vance (Deceased Benefactor)","role":"Historical Patriarch & Culprit","alibi":"Deceased in 2010; drove to St. Jude’s steps on October 14, 1994","avatar":"🎩"}]'::jsonb,
  'Thirty years ago, aristocratic patriarch Arthur Vance covered up his unmarried daughter’s pregnancy by leaving her baby girl on the steps of St. Jude’s with an antique Swiss music box. He locked the spring mechanism with an ivory comb pin. Thirty years later, the comb pin rotted and snapped, allowing the spring to release and play the family lullaby.',
  'Founding Benefactor Arthur Vance (Deceased)',
  'Arthur concealed that his own granddaughter was abandoned at the orphanage thirty years ago to avoid social scandal.',
  '[{"time":"October 14, 1994 - 11:00 PM","event":"Arthur Vance places baby Nora and the music box on the orphanage steps."},{"time":"October 14, 1994 - 11:05 PM","event":"Arthur jams an ivory hair comb pin into the music box cylinder to silence it."},{"time":"Thirty Years of Silence","event":"The music box sits on the orphanage mantle as an enigmatic silent relic."},{"time":"Midnight Last Night","event":"The 30-year-old ivory pin finally degrades and snaps under spring tension."},{"time":"00:01 AM Today","event":"The cylinder spins, playing the Vance lullaby and springing the false bottom."}]'::jsonb,
  '[{"id":"ev_1","title":"Antique Swiss Music Box","detail":"Rosewood music box that played its family lullaby after a 30-year mechanical obstruction failed."},{"id":"ev_2","title":"Degraded Ivory Jamming Pin","detail":"Ivory pin carved with the Vance falcon crest used to silence the mechanism in 1994."},{"id":"ev_3","title":"Hospital Identity Bracelet","detail":"Gold newborn bracelet stamped with Baby Eleanor Vance’s name and birth date."},{"id":"ev_4","title":"Confession Diary of Arthur Vance","detail":"Private journal detailing how the patriarch abandoned the baby to protect social standing."}]'::jsonb,
  '[{"order":1,"title":"Rosewood music box playing","text":"The startling catalyst that broke thirty years of silence."},{"order":2,"title":"Broken ivory hairpin","text":"Solves the mechanical mystery of why the music box suddenly began playing."},{"order":3,"title":"Spring-loaded velvet tray","text":"The secret compartment engineered to open at the end of the song."},{"order":4,"title":"Gold infant birth bracelet","text":"Smoking gun proof of Nora’s true aristocratic identity."},{"order":5,"title":"Vance falcon crest pin","text":"Physical link connecting the sabotage pin to the wealthy benefactor family."},{"order":6,"title":"Arthur’s secret journal","text":"Complete documentary confession of the historical cover-up."}]'::jsonb,
  'Ghostly children laughter reported in the attic: Acoustic echoes from the ventilation ducts carrying town noises.; Julian Vance’s threatening lawyer calls: Julian blustered, but was powerless against verified DNA.',
  'Claim a ghost child entered the dorm and wound the music box key.',
  'NORMAL',
  'Why did the music box start playing after thirty years of silence, and who placed the baby bracelet inside?',
  '[{"character":"Sister Clara","secret":"She kept the original baby blanket embroidered with the initial \"V\" in her cedar trunk."},{"character":"Nora Vance (Adult Foundling)","secret":"She secretly took DNA tests to find any living blood relatives."},{"character":"Julian Vance","secret":"His late uncle Arthur’s private journal documenting the 1994 abandonment."},{"character":"Inspector Thomas Finch","secret":"He was a close friend of the family probate judge."},{"character":"Arthur Vance (Deceased Benefactor)","secret":"He hid his daughter’s birth records and jammed the heirloom music box with an ivory pin."}]'::jsonb,
  '[{"lead":"Ghostly children laughter reported in the attic","explanation":"Acoustic echoes from the ventilation ducts carrying town noises."},{"lead":"Julian Vance’s threatening lawyer calls","explanation":"Julian blustered, but was powerless against verified DNA."}]'::jsonb,
  '{"wrongTheories":["A deceased orphan ghost wound the music box key at midnight to awaken the dorm.","The music box was a cheap flea market toy with no connection to the Vance family."],"correctTheory":"Patriarch Arthur Vance abandoned his granddaughter with a silenced music box; thirty years later, the jamming pin snapped, revealing her true identity and inheritance."}'::jsonb,
  'The ivory pin Arthur Vance used to silence the music box rotted and broke, releasing the lullaby and opening a tray with his granddaughter’s birth bracelet.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Nora was recognized as the rightful Vance heiress and used her multi-million fortune to permanently fund St. Jude’s Orphanage."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Julian stole the bracelet and burned the music box, leaving Nora unaware of her true family forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The music box was locked away in a church museum as a haunted artifact, keeping Nora in poverty."}]'::jsonb,
  '{"intros":["Inside an antique carved music box that had sat silent on the orphanage mantle for thirty years, a lullaby suddenly began playing on its own at midnight, revealing a false bottom containing a baby’s adoption bracelet.","Case file story_117: Inside an antique carved music box that had sat silent on the orphanage mantle for thirty years, a lullaby suddenly began playing on its own at midnight, revealing a false bottom containing a baby’s adoption bracelet. Look closely at every clue.","Trouble begins in The candlelit attic dorm of St. Jude’s Home for Children, iron spring beds, rain against dormer windows, and a locked wooden toy chest. Inside an antique carved music box that had sat silent on the orphanage mantle for thirty years, a lullaby suddenly began playing on its own at midnight, revealing a false bottom containing a baby’s adoption bracelet.","The mystery starts now. Inside an antique carved music box that had sat silent on the orphanage mantle for thirty years, a lullaby suddenly began playing on its own at midnight, revealing a false bottom containing a baby’s adoption bracelet. Can you solve it?"],"reveals":["The ivory pin Arthur Vance used to silence the music box rotted and broke, releasing the lullaby and opening a tray with his granddaughter’s birth bracelet.","The mystery is unraveled! The ivory pin Arthur Vance used to silence the music box rotted and broke, releasing the lullaby and opening a tray with his granddaughter’s birth bracelet.","At last, the truth comes out: The ivory pin Arthur Vance used to silence the music box rotted and broke, releasing the lullaby and opening a tray with his granddaughter’s birth bracelet.","Case resolved! Here is what happened: The ivory pin Arthur Vance used to silence the music box rotted and broke, releasing the lullaby and opening a tray with his granddaughter’s birth bracelet."],"hints":["Pay attention to where Founding Benefactor Arthur Vance (Deceased) was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_117';
DELETE FROM public.case_events WHERE case_id = 'story_117';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '10a83d4a-7db6-5731-9591-b396f2a8cd1b',
  'story_117',
  'Sister Clara',
  'Orphanage Headmistress',
  'Gentle, pious, gray habit, caring for generations of orphans, holding the music box',
  'That music box was left on our doorstep in the storm of 1994 beside baby Nora. It never played a single note until tonight.',
  'She kept the original baby blanket embroidered with the initial "V" in her cedar trunk.',
  'In the ground-floor chapel when the music chimed through the vents',
  'Caretaker who raised the foundling baby Nora',
  'The music box tune is a rare 19th-century lullaby composed for the Vance family.',
  'Did not know an ivory hair pin was jammed inside the cylinder teeth.',
  '🕊️',
  '["That music box was left on our doorstep in the storm of 1994 beside baby Nora. It never played a single note until tonight.","\"That music box was left on our doorstep in the storm of 1994 beside baby Nora. It never played a single note until tonight.\"","Listen to me: That music box was left on our doorstep in the storm of 1994 beside baby Nora. It never played a single note until tonight.","I tell you the truth: That music box was left on our doorstep in the storm of 1994 beside baby Nora. It never played a single note until tonight."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'bbb2f218-d34a-56b4-b55e-e39b62c632cf',
  'story_117',
  'Nora Vance (Adult Foundling)',
  'Orphanage Teacher & Foundling',
  'Warm, compassionate, brown eyes, dedicated her life to teaching orphan children',
  'I grew up listening to other children talk about their parents. This music box was the only thing I owned in the world.',
  'She secretly took DNA tests to find any living blood relatives.',
  'Sleeping in the teacher’s quarters when the chime awoke her',
  'The infant left on the doorstep in 1994',
  'The lullaby melody was familiar to her in recurring childhood dreams.',
  'Did not know she was the legal heiress to the Vance estate.',
  '👩‍🏫',
  '["I grew up listening to other children talk about their parents. This music box was the only thing I owned in the world.","\"I grew up listening to other children talk about their parents. This music box was the only thing I owned in the world.\"","Listen to me: I grew up listening to other children talk about their parents. This music box was the only thing I owned in the world.","I tell you the truth: I grew up listening to other children talk about their parents. This music box was the only thing I owned in the world."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'c66567f7-0848-501a-9ba7-53ef455231e5',
  'story_117',
  'Julian Vance',
  'Vance Estate Heir',
  'Wealthy nephew, tailored coat, anxious about family inheritance, clutching legal briefs',
  'Our family has supported St. Jude’s for decades. We know nothing about any foundling child.',
  'His late uncle Arthur’s private journal documenting the 1994 abandonment.',
  'Arrived at the orphanage after receiving a call about the Vance music box',
  'Nephew of the late Arthur Vance',
  'If Nora is proven to be Arthur’s granddaughter, she inherits seventy percent of the family trust.',
  'Did not know the music box false bottom contained the original hospital birth bracelet.',
  '💼',
  '["Our family has supported St. Jude’s for decades. We know nothing about any foundling child.","\"Our family has supported St. Jude’s for decades. We know nothing about any foundling child.\"","Listen to me: Our family has supported St. Jude’s for decades. We know nothing about any foundling child.","I tell you the truth: Our family has supported St. Jude’s for decades. We know nothing about any foundling child."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '7f1e9f5e-62f2-5c3b-92be-2522858f535c',
  'story_117',
  'Inspector Thomas Finch',
  'Historical Inquiries Detective',
  'Methodical, spectacles, carrying tweezers and magnifying lenses',
  'Springs don’t sleep for thirty years and play by magic. A physical obstruction failed.',
  'He was a close friend of the family probate judge.',
  'Called to the orphanage by Sister Clara to inspect the opened compartment',
  'Investigating the inheritance identity verification',
  'The rotted ivory pin inside the gears matched Arthur Vance’s family crest combs.',
  'Did not know Nora’s DNA had already been submitted to the national registry.',
  '🔍',
  '["Springs don’t sleep for thirty years and play by magic. A physical obstruction failed.","\"Springs don’t sleep for thirty years and play by magic. A physical obstruction failed.\"","Listen to me: Springs don’t sleep for thirty years and play by magic. A physical obstruction failed.","I tell you the truth: Springs don’t sleep for thirty years and play by magic. A physical obstruction failed."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e1a573ae-3e73-5cc3-a51b-c9d321cfde07',
  'story_117',
  'Arthur Vance (Deceased Benefactor)',
  'Historical Patriarch & Culprit',
  'Proud aristocrat who abandoned his unwed daughter’s infant to protect his social status',
  'Deceased in 2010; family portrait shows a stern patriarch wearing a signet ring with the falcon crest.',
  'He hid his daughter’s birth records and jammed the heirloom music box with an ivory pin.',
  'Deceased in 2010; drove to St. Jude’s steps on October 14, 1994',
  'Grandfather of Nora Vance and uncle of Julian Vance',
  'He knew the music box lullaby would immediately prove the baby was a Vance heiress if played.',
  'Did not foresee that the ivory pin would decay and release the song thirty years later.',
  '🎩',
  '["Deceased in 2010; family portrait shows a stern patriarch wearing a signet ring with the falcon crest.","\"Deceased in 2010; family portrait shows a stern patriarch wearing a signet ring with the falcon crest.\"","Listen to me: Deceased in 2010; family portrait shows a stern patriarch wearing a signet ring with the falcon crest.","I tell you the truth: Deceased in 2010; family portrait shows a stern patriarch wearing a signet ring with the falcon crest."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3027b05e-8a6a-5335-a0ea-cbf717587e74',
  'story_117',
  'ev_1',
  1,
  '00:01 AM',
  'The antique music box chimed through the quiet orphanage corridors.',
  'The antique music box chimed through the quiet orphanage corridors.',
  'A carved rosewood Swiss music box spinning its brass cylinder on the mantle.',
  'Rosewood music box playing',
  'Antique Swiss Music Box',
  '["Clock chiming","Radio","Toy piano"]'::jsonb,
  'Rosewood music box playing',
  '["rosewood music box playing","music box","swiss music box","rosewood box","playing box"]'::jsonb,
  'Antique musical heirloom suddenly playing its melody after thirty years.',
  'ev_2',
  true,
  '{"descriptions":["The antique music box chimed through the quiet orphanage corridors.","At 00:01 AM: The antique music box chimed through the quiet orphanage corridors.","Notice this clue: The antique music box chimed through the quiet orphanage corridors."],"hints":["Antique musical heirloom suddenly playing its melody after thirty years.","Clue hint: Think about rosewood music box playing.","Search for: a carved rosewood swiss music box spinning its brass cylinder on the mantle."],"clues":["Rosewood music box playing","Item: Rosewood music box playing","Clue Word: Rosewood music box playing"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f87e66e0-fda8-566e-8a17-57f2d7ec0bfd',
  'story_117',
  'ev_2',
  2,
  '00:15 AM',
  'Inspector Finch inspects the interior cylinder mechanism.',
  'Inspector Finch inspects the interior cylinder mechanism.',
  'A broken ivory hairpin fragment lodged between the brass cylinder gear teeth.',
  'Broken ivory hairpin',
  'Degraded Ivory Jamming Pin',
  '["Rusted nail","Twig","Wire fragment"]'::jsonb,
  'Broken ivory hairpin',
  '["broken ivory hairpin","ivory pin","hairpin","broken pin","ivory hairpin"]'::jsonb,
  'Piece of an antique hair accessory used to keep the music box silenced.',
  'ev_3',
  false,
  '{"descriptions":["Inspector Finch inspects the interior cylinder mechanism.","At 00:15 AM: Inspector Finch inspects the interior cylinder mechanism.","Notice this clue: Inspector Finch inspects the interior cylinder mechanism."],"hints":["Piece of an antique hair accessory used to keep the music box silenced.","Clue hint: Think about broken ivory hairpin.","Search for: a broken ivory hairpin fragment lodged between the brass cylinder gear teeth."],"clues":["Broken ivory hairpin","Item: Broken ivory hairpin","Clue Word: Broken ivory hairpin"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '27a2adc5-205c-5876-9ce8-9694b5b90139',
  'story_117',
  'ev_3',
  3,
  '00:30 AM',
  'The completion of the song triggers an internal spring catch.',
  'The completion of the song triggers an internal spring catch.',
  'A hidden velvet tray underneath the music box cylinder pops open.',
  'Spring-loaded velvet tray',
  'Concealed False Bottom',
  '["Empty cavity","Sawdust","Loose spring"]'::jsonb,
  'Spring-loaded velvet tray',
  '["spring-loaded velvet tray","velvet tray","false bottom","hidden tray","secret compartment"]'::jsonb,
  'Secret compartment that opened automatically when the song reached its final note.',
  'ev_4',
  false,
  '{"descriptions":["The completion of the song triggers an internal spring catch.","At 00:30 AM: The completion of the song triggers an internal spring catch.","Notice this clue: The completion of the song triggers an internal spring catch."],"hints":["Secret compartment that opened automatically when the song reached its final note.","Clue hint: Think about spring-loaded velvet tray.","Search for: a hidden velvet tray underneath the music box cylinder pops open."],"clues":["Spring-loaded velvet tray","Item: Spring-loaded velvet tray","Clue Word: Spring-loaded velvet tray"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '923130fe-9557-525c-a74e-bd757123ef18',
  'story_117',
  'ev_4',
  4,
  '00:45 AM',
  'Sister Clara pulls an object from the velvet tray.',
  'Sister Clara pulls an object from the velvet tray.',
  'A gold hospital infant bracelet stamped "BABY ELEANOR VANCE - OCT 12 1994".',
  'Gold infant birth bracelet',
  'Hospital Identity Bracelet',
  '["Silver ring","Baptism cross","Gold coin"]'::jsonb,
  'Gold infant birth bracelet',
  '["gold infant birth bracelet","birth bracelet","infant bracelet","hospital bracelet","gold bracelet"]'::jsonb,
  'Official medical identification proving Nora’s true identity as Eleanor Vance.',
  'ev_5',
  false,
  '{"descriptions":["Sister Clara pulls an object from the velvet tray.","At 00:45 AM: Sister Clara pulls an object from the velvet tray.","Notice this clue: Sister Clara pulls an object from the velvet tray."],"hints":["Official medical identification proving Nora’s true identity as Eleanor Vance.","Clue hint: Think about gold infant birth bracelet.","Search for: a gold hospital infant bracelet stamped \"baby eleanor vance - oct 12 1994\"."],"clues":["Gold infant birth bracelet","Item: Gold infant birth bracelet","Clue Word: Gold infant birth bracelet"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '47f60bba-0cd5-568b-bd4c-2fc5a0745557',
  'story_117',
  'ev_5',
  5,
  '01:15 AM',
  'Finch inspects the crest carved on the broken ivory pin.',
  'Finch inspects the crest carved on the broken ivory pin.',
  'The Vance family falcon crest engraved on the head of the ivory hairpin.',
  'Vance falcon crest pin',
  'Family Crest Toolmark',
  '["Monogram letter","Flower carving","Plain bone"]'::jsonb,
  'Vance falcon crest pin',
  '["vance falcon crest pin","falcon crest","vance crest","crest pin","family crest"]'::jsonb,
  'Aristocratic family heraldry linking the silencing pin directly to Arthur Vance.',
  'ev_6',
  true,
  '{"descriptions":["Finch inspects the crest carved on the broken ivory pin.","At 01:15 AM: Finch inspects the crest carved on the broken ivory pin.","Notice this clue: Finch inspects the crest carved on the broken ivory pin."],"hints":["Aristocratic family heraldry linking the silencing pin directly to Arthur Vance.","Clue hint: Think about vance falcon crest pin.","Search for: the vance family falcon crest engraved on the head of the ivory hairpin."],"clues":["Vance falcon crest pin","Item: Vance falcon crest pin","Clue Word: Vance falcon crest pin"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2810815e-d204-56f0-9241-49da453ca712',
  'story_117',
  'ev_6',
  6,
  '01:45 AM',
  'Julian Vance is confronted with the bracelet and crest pin.',
  'Julian Vance is confronted with the bracelet and crest pin.',
  'Julian surrenders Arthur’s private journal confirming the abandonment cover-up.',
  'Arthur’s secret journal',
  'Confession Diary of Arthur Vance',
  '["Bank ledger","Will","Passport"]'::jsonb,
  'Arthur’s secret journal',
  '["arthur’s secret journal","secret journal","arthur journal","confession diary","journal"]'::jsonb,
  'Handwritten diary of the patriarch admitting he hid his daughter’s baby to avoid scandal.',
  'ev_7',
  false,
  '{"descriptions":["Julian Vance is confronted with the bracelet and crest pin.","At 01:45 AM: Julian Vance is confronted with the bracelet and crest pin.","Notice this clue: Julian Vance is confronted with the bracelet and crest pin."],"hints":["Handwritten diary of the patriarch admitting he hid his daughter’s baby to avoid scandal.","Clue hint: Think about arthur’s secret journal.","Search for: julian surrenders arthur’s private journal confirming the abandonment cover-up."],"clues":["Arthur’s secret journal","Item: Arthur’s secret journal","Clue Word: Arthur’s secret journal"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ca9e19c2-fd29-54be-af96-aeb1864293ae',
  'story_117',
  'ev_7',
  7,
  '02:15 AM',
  'State DNA lab confirms a 99.9% match between Nora and the Vance family line.',
  'State DNA lab confirms a 99.9% match between Nora and the Vance family line.',
  'Official genetic proof that Nora is the legal granddaughter and sole direct heir.',
  'DNA verification certificate',
  'State Forensic DNA Match',
  '["Blood type card","Doctor note","Photo match"]'::jsonb,
  'DNA verification certificate',
  '["dna verification certificate","dna match","dna certificate","genetic proof","dna verification"]'::jsonb,
  'Scientific confirmation establishing Nora’s true family heritage.',
  'ev_8',
  false,
  '{"descriptions":["State DNA lab confirms a 99.9% match between Nora and the Vance family line.","At 02:15 AM: State DNA lab confirms a 99.9% match between Nora and the Vance family line.","Notice this clue: State DNA lab confirms a 99.9% match between Nora and the Vance family line."],"hints":["Scientific confirmation establishing Nora’s true family heritage.","Clue hint: Think about dna verification certificate.","Search for: official genetic proof that nora is the legal granddaughter and sole direct heir."],"clues":["DNA verification certificate","Item: DNA verification certificate","Clue Word: DNA verification certificate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '82eafd74-522d-54d9-b6cd-2785a9117811',
  'story_117',
  'ev_8',
  8,
  '03:00 AM',
  'Nora signs documents to transfer the Vance millions to fund St. Jude’s forever.',
  'Nora signs documents to transfer the Vance millions to fund St. Jude’s forever.',
  'Nora dedicating her inheritance to build new homes for all the orphans.',
  'Orphanage endowment deed',
  'Signed Foundation Trust',
  '["Luxury mansion","Yacht purchase","Private vault"]'::jsonb,
  'Orphanage endowment deed',
  '["orphanage endowment deed","endowment deed","foundation trust","orphanage deed","trust deed"]'::jsonb,
  'The loving choice to use the restored fortune to help other abandoned children.',
  NULL,
  true,
  '{"descriptions":["Nora signs documents to transfer the Vance millions to fund St. Jude’s forever.","At 03:00 AM: Nora signs documents to transfer the Vance millions to fund St. Jude’s forever.","Notice this clue: Nora signs documents to transfer the Vance millions to fund St. Jude’s forever."],"hints":["The loving choice to use the restored fortune to help other abandoned children.","Clue hint: Think about orphanage endowment deed.","Search for: nora dedicating her inheritance to build new homes for all the orphans."],"clues":["Orphanage endowment deed","Item: Orphanage endowment deed","Clue Word: Orphanage endowment deed"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_118 — THE OLD FISHERMAN’S COMPASS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_118',
  'The Old Fisherman’s Compass',
  'Emotional Mystery',
  'The fog-bound cliffs of Cape Sorrow, rusted ship mooring chains, rocky tidal shoals, and crashing cold ocean spray',
  'For twenty years, an elderly retired fisherman carried an antique brass compass that did not point north, but instead pulled stubbornly toward an uncharted reef where his only son vanished in a storm.',
  '[{"name":"Captain Silas Thorne","role":"Harbor Pilot & Smuggler","alibi":"In the harbor pilot station when Caleb’s boat went down in 2004","avatar":"⚓"},{"name":"Old Man Jonathan (Father)","role":"Grieving Fisherman Father","alibi":"Standing on Cape Sorrow cliff every evening for twenty years","avatar":"🧭"},{"name":"Caleb Vance (Victim in 2004)","role":"Lost Son & Diver","alibi":"Lost at sea November 12, 2004","avatar":"🌊"},{"name":"Diver Clara Hayes","role":"Deep-Sea Salvage Diver","alibi":"Diving the reef coordinates off Cape Sorrow","avatar":"🤿"}]'::jsonb,
  'Twenty years ago, harbor pilot Silas murdered the fisherman’s son Caleb to steal a shipment of industrial diamonds. Silas sank Caleb’s boat on the shallow reef and mounted a strong magnetic core to the submerged hull. The father’s compass, magnetized by Silas’s trick, always pulled directly toward the secret underwater steel tomb where Caleb’s remains lay.',
  'Harbor Pilot Captain Silas Thorne',
  'Silas stole the son’s cargo of uncut raw diamonds and sabotaged his boat steering to fake a shipwreck.',
  '[{"time":"November 12, 2004 - 07:00 PM","event":"Silas hacks the rudder cable on Caleb’s boat at the fuel dock."},{"time":"November 12, 2004 - 08:30 PM","event":"Caleb’s boat loses steering and crashes on the reef; Silas mounts a magnet to the wreck."},{"time":"Twenty Years of Vigil","event":"Jonathan stands on the cliff holding the compass pointing toward the reef."},{"time":"Today - 09:00 AM","event":"Diver Clara plunges into the kelp forest following the compass bearing."},{"time":"Today - 10:30 AM","event":"Clara discovers the sunken wheelhouse and Caleb’s carved dying message."}]'::jsonb,
  '[{"id":"ev_1","title":"Aberrant Brass Compass","detail":"Antique compass that pointed toward the sunken reef for twenty years."},{"id":"ev_2","title":"Submerged Dying Message","detail":"Brass wheelhouse console chiseled with: \"SILAS CUT THE RUDDER CABLE\"."},{"id":"ev_3","title":"Cut Steering Cable","detail":"Hydraulic steering line showing unmistakable hacksaw toolmarks proving sabotage."},{"id":"ev_4","title":"Spectroscopy Gem Match","detail":"Diamond in Silas’s cane matching the exact mineral fingerprint of the recovered gems."}]'::jsonb,
  '[{"order":1,"title":"Compass locked on reef","text":"The guiding thread that kept the father’s hope alive for twenty years."},{"order":2,"title":"Sunken trawler wheelhouse","text":"Locates the long-lost grave hidden beneath the waves."},{"order":3,"title":"Carved dying accusation","text":"Direct eyewitness evidence from the deceased son naming his killer."},{"order":4,"title":"Sawn rudder cable","text":"Proves mechanical murder rather than an unfortunate storm accident."},{"order":5,"title":"Neodymium salvage magnet","text":"Explains why the compass pulled toward the wreck across miles of ocean."},{"order":6,"title":"Walking stick gem match","text":"The undeniable smoking gun linking Silas to the stolen treasure."}]'::jsonb,
  'Magnetic iron ore deposits in the cliff: The cliffs contained iron, but not enough to steer a compass out to sea.; Old fisherman’s fading eyesight: Skeptics dismissed Jonathan as confused, but his compass was exact.',
  'Claim a magnetic supernatural ghost anomaly pulled the compass toward the spirit of the lost son.',
  'NORMAL',
  'Why did the compass point toward the deadly reef, and what was hidden beneath the crashing waves?',
  '[{"character":"Captain Silas Thorne","secret":"An uncut industrial diamond set into his walking stick grip."},{"character":"Old Man Jonathan (Father)","secret":"He mortgaged his cottage to hire a professional dive salvage team today."},{"character":"Caleb Vance (Victim in 2004)","secret":"A pouch of raw diamonds strapped to his diving belt."},{"character":"Diver Clara Hayes","secret":"She volunteered her diving services to help the grieving father."}]'::jsonb,
  '[{"lead":"Magnetic iron ore deposits in the cliff","explanation":"The cliffs contained iron, but not enough to steer a compass out to sea."},{"lead":"Old fisherman’s fading eyesight","explanation":"Skeptics dismissed Jonathan as confused, but his compass was exact."}]'::jsonb,
  '{"wrongTheories":["The compass was possessed by the ghost of the son guiding his father to the reef.","Caleb drowned accidentally because his compass failed in thick fog."],"correctTheory":"Silas Thorne sawed Caleb’s rudder cable to steal his diamonds and placed a magnet on the wreck; the father’s compass tracked the magnet to expose the crime."}'::jsonb,
  'Silas Thorne sawed Caleb’s rudder cable for diamonds and mounted a magnet to the wreck, which pulled the father’s compass to the murder scene.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Silas was arrested for murder and piracy, Caleb was given a hero’s burial, and the compass finally pointed to peace."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Silas sank the dive boat with an explosive charge, keeping the secret buried in the kelp forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"Cape Sorrow was declared an unholy magnetic anomaly, leaving the grieving father alone on the cliff."}]'::jsonb,
  '{"intros":["For twenty years, an elderly retired fisherman carried an antique brass compass that did not point north, but instead pulled stubbornly toward an uncharted reef where his only son vanished in a storm.","Case file story_118: For twenty years, an elderly retired fisherman carried an antique brass compass that did not point north, but instead pulled stubbornly toward an uncharted reef where his only son vanished in a storm. Look closely at every clue.","Trouble begins in The fog-bound cliffs of Cape Sorrow, rusted ship mooring chains, rocky tidal shoals, and crashing cold ocean spray. For twenty years, an elderly retired fisherman carried an antique brass compass that did not point north, but instead pulled stubbornly toward an uncharted reef where his only son vanished in a storm.","The mystery starts now. For twenty years, an elderly retired fisherman carried an antique brass compass that did not point north, but instead pulled stubbornly toward an uncharted reef where his only son vanished in a storm. Can you solve it?"],"reveals":["Silas Thorne sawed Caleb’s rudder cable for diamonds and mounted a magnet to the wreck, which pulled the father’s compass to the murder scene.","The mystery is unraveled! Silas Thorne sawed Caleb’s rudder cable for diamonds and mounted a magnet to the wreck, which pulled the father’s compass to the murder scene.","At last, the truth comes out: Silas Thorne sawed Caleb’s rudder cable for diamonds and mounted a magnet to the wreck, which pulled the father’s compass to the murder scene.","Case resolved! Here is what happened: Silas Thorne sawed Caleb’s rudder cable for diamonds and mounted a magnet to the wreck, which pulled the father’s compass to the murder scene."],"hints":["Pay attention to where Harbor Pilot Captain Silas Thorne was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_118';
DELETE FROM public.case_events WHERE case_id = 'story_118';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'f15a32a0-117c-52d6-bb51-bffe35d88bd2',
  'story_118',
  'Captain Silas Thorne',
  'Harbor Pilot & Smuggler',
  'Weathered salt, gray muttonchops, nervous pipe smoking, refusing to sail near the reef',
  'The shoals of Cape Sorrow are cursed by magnetic iron rock! Caleb died because he ignored the tide tables.',
  'An uncut industrial diamond set into his walking stick grip.',
  'In the harbor pilot station when Caleb’s boat went down in 2004',
  'Harbor official who dispatched Caleb on the fatal night voyage',
  'The sunken trawler sits in only twenty feet of water behind the sea pinnacle.',
  'Did not know modern underwater sonar could map the trawler through the kelp forest.',
  '⚓',
  '["The shoals of Cape Sorrow are cursed by magnetic iron rock! Caleb died because he ignored the tide tables.","\"The shoals of Cape Sorrow are cursed by magnetic iron rock! Caleb died because he ignored the tide tables.\"","Listen to me: The shoals of Cape Sorrow are cursed by magnetic iron rock! Caleb died because he ignored the tide tables.","I tell you the truth: The shoals of Cape Sorrow are cursed by magnetic iron rock! Caleb died because he ignored the tide tables."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '51f2f5f9-8333-5981-a458-2cd91ee99b19',
  'story_118',
  'Old Man Jonathan (Father)',
  'Grieving Fisherman Father',
  'Eighty years old, oilskin coat, trembling hands holding the brass compass, gazing at the sea',
  'My boy Caleb promised this compass would lead him home. It never pointed to true north—it points to him.',
  'He mortgaged his cottage to hire a professional dive salvage team today.',
  'Standing on Cape Sorrow cliff every evening for twenty years',
  'Father of lost fisherman Caleb',
  'Caleb was the most skilled navigator on the coast and would never run aground in calm seas.',
  'Did not know the compass was tracking a magnetic iron mooring block placed by the killer.',
  '🧭',
  '["My boy Caleb promised this compass would lead him home. It never pointed to true north—it points to him.","\"My boy Caleb promised this compass would lead him home. It never pointed to true north—it points to him.\"","Listen to me: My boy Caleb promised this compass would lead him home. It never pointed to true north—it points to him.","I tell you the truth: My boy Caleb promised this compass would lead him home. It never pointed to true north—it points to him."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '6fcea674-ff1e-5834-a9be-359d93e5138c',
  'story_118',
  'Caleb Vance (Victim in 2004)',
  'Lost Son & Diver',
  'Brave, loyal son, skeleton preserved inside the sunken wheelhouse',
  'Deceased victim; chiseled into the wheelhouse brass dashboard: "SILAS CUT THE RUDDER CABLE".',
  'A pouch of raw diamonds strapped to his diving belt.',
  'Lost at sea November 12, 2004',
  'Son of Jonathan',
  'Silas had threatened him to turn over the diamond salvage coordinates.',
  'Did not expect Silas to sever the hydraulic steering line before departure.',
  '🌊',
  '["Deceased victim; chiseled into the wheelhouse brass dashboard: \"SILAS CUT THE RUDDER CABLE\".","\"Deceased victim; chiseled into the wheelhouse brass dashboard: \"SILAS CUT THE RUDDER CABLE\".\"","Listen to me: Deceased victim; chiseled into the wheelhouse brass dashboard: \"SILAS CUT THE RUDDER CABLE\".","I tell you the truth: Deceased victim; chiseled into the wheelhouse brass dashboard: \"SILAS CUT THE RUDDER CABLE\"."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'e64a8a4f-4929-59ee-922c-99734736a3cc',
  'story_118',
  'Diver Clara Hayes',
  'Deep-Sea Salvage Diver',
  'Athletic, high-tech scuba gear, underwater camera, fearless in heavy surf',
  'The compass isn’t magic—it’s responding to a high-density magnetic salvage transponder on the wreck.',
  'She volunteered her diving services to help the grieving father.',
  'Diving the reef coordinates off Cape Sorrow',
  'Salvage diver hired by Jonathan',
  'The trawler’s rudder cable was cleanly sliced with a hacksaw, not snapped by storm waves.',
  'Did not know Silas was watching her dive boat through high-powered binoculars.',
  '🤿',
  '["The compass isn’t magic—it’s responding to a high-density magnetic salvage transponder on the wreck.","\"The compass isn’t magic—it’s responding to a high-density magnetic salvage transponder on the wreck.\"","Listen to me: The compass isn’t magic—it’s responding to a high-density magnetic salvage transponder on the wreck.","I tell you the truth: The compass isn’t magic—it’s responding to a high-density magnetic salvage transponder on the wreck."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2afe3e6c-9c9d-53ad-8873-6558717633a8',
  'story_118',
  'ev_1',
  1,
  'Today - 09:00 AM',
  'Old Man Jonathan hands the compass to Diver Clara.',
  'Old Man Jonathan hands the compass to Diver Clara.',
  'An antique brass compass needle locked firmly forty degrees east of north toward the reef.',
  'Compass locked on reef',
  'Aberrant Brass Compass',
  '["Spinning needle","True north","Broken glass"]'::jsonb,
  'Compass locked on reef',
  '["compass locked on reef","compass","brass compass","aberrant compass","locked compass"]'::jsonb,
  'Navigational compass whose magnetic needle refuses to point north.',
  'ev_2',
  true,
  '{"descriptions":["Old Man Jonathan hands the compass to Diver Clara.","At Today - 09:00 AM: Old Man Jonathan hands the compass to Diver Clara.","Notice this clue: Old Man Jonathan hands the compass to Diver Clara."],"hints":["Navigational compass whose magnetic needle refuses to point north.","Clue hint: Think about compass locked on reef.","Search for: an antique brass compass needle locked firmly forty degrees east of north toward the reef."],"clues":["Compass locked on reef","Item: Compass locked on reef","Clue Word: Compass locked on reef"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '2fe10f7c-8d3c-54bf-900e-1ce7478412ee',
  'story_118',
  'ev_2',
  2,
  'Today - 09:45 AM',
  'Clara dives twenty feet beneath the waves at the compass bearing.',
  'Clara dives twenty feet beneath the waves at the compass bearing.',
  'The intact wheelhouse of Caleb’s trawler resting upright on a sandy shelf.',
  'Sunken trawler wheelhouse',
  'Intact Sunken Vessel',
  '["Natural reef","Shattered wood","Whale skeleton"]'::jsonb,
  'Sunken trawler wheelhouse',
  '["sunken trawler wheelhouse","sunken trawler","wheelhouse","sunken boat","intact vessel"]'::jsonb,
  'The missing ship discovered resting peacefully underwater after twenty years.',
  'ev_3',
  false,
  '{"descriptions":["Clara dives twenty feet beneath the waves at the compass bearing.","At Today - 09:45 AM: Clara dives twenty feet beneath the waves at the compass bearing.","Notice this clue: Clara dives twenty feet beneath the waves at the compass bearing."],"hints":["The missing ship discovered resting peacefully underwater after twenty years.","Clue hint: Think about sunken trawler wheelhouse.","Search for: the intact wheelhouse of caleb’s trawler resting upright on a sandy shelf."],"clues":["Sunken trawler wheelhouse","Item: Sunken trawler wheelhouse","Clue Word: Sunken trawler wheelhouse"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'eff84e61-7fab-5d31-bd61-d03393b31667',
  'story_118',
  'ev_3',
  3,
  'Today - 10:15 AM',
  'Clara scrapes sea growth from the wheelhouse steering console.',
  'Clara scrapes sea growth from the wheelhouse steering console.',
  'Carved words in the brass console: "SILAS CUT THE RUDDER CABLE".',
  'Carved dying accusation',
  'Submerged Dying Message',
  '["Ship name","Depth chart","Prayer"]'::jsonb,
  'Carved dying accusation',
  '["carved dying accusation","dying accusation","carved message","silas accusation","submerged message"]'::jsonb,
  'Chiseled words in brass naming the harbor pilot as the killer.',
  'ev_4',
  false,
  '{"descriptions":["Clara scrapes sea growth from the wheelhouse steering console.","At Today - 10:15 AM: Clara scrapes sea growth from the wheelhouse steering console.","Notice this clue: Clara scrapes sea growth from the wheelhouse steering console."],"hints":["Chiseled words in brass naming the harbor pilot as the killer.","Clue hint: Think about carved dying accusation.","Search for: carved words in the brass console: \"silas cut the rudder cable\"."],"clues":["Carved dying accusation","Item: Carved dying accusation","Clue Word: Carved dying accusation"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'f49e5d76-f2de-5451-813b-fb196610a368',
  'story_118',
  'ev_4',
  4,
  'Today - 10:30 AM',
  'Clara inspects the trawler’s stern steering linkages.',
  'Clara inspects the trawler’s stern steering linkages.',
  'A hydraulic steering cable showing clean hacksaw teeth marks.',
  'Sawn rudder cable',
  'Cut Steering Cable',
  '["Snapped wire","Rusted break","Tangled rope"]'::jsonb,
  'Sawn rudder cable',
  '["sawn rudder cable","sawn cable","rudder cable","cut cable","hacksaw cut"]'::jsonb,
  'Physical proof that the ship was sabotaged before it left the dock.',
  'ev_5',
  false,
  '{"descriptions":["Clara inspects the trawler’s stern steering linkages.","At Today - 10:30 AM: Clara inspects the trawler’s stern steering linkages.","Notice this clue: Clara inspects the trawler’s stern steering linkages."],"hints":["Physical proof that the ship was sabotaged before it left the dock.","Clue hint: Think about sawn rudder cable.","Search for: a hydraulic steering cable showing clean hacksaw teeth marks."],"clues":["Sawn rudder cable","Item: Sawn rudder cable","Clue Word: Sawn rudder cable"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'd1a5cb33-c6ee-5172-b096-46aec9b69b0e',
  'story_118',
  'ev_5',
  5,
  'Today - 10:45 AM',
  'Clara notices a heavy magnetic block bolted to the ship’s mast.',
  'Clara notices a heavy magnetic block bolted to the ship’s mast.',
  'A powerful industrial neodymium salvage magnet pulling metallic objects toward the wreck.',
  'Neodymium salvage magnet',
  'Industrial Magnetic Core',
  '["Anchor iron","Lead weight","Battery pack"]'::jsonb,
  'Neodymium salvage magnet',
  '["neodymium salvage magnet","magnet","salvage magnet","neodymium magnet","magnetic core"]'::jsonb,
  'The scientific explanation for why Jonathan’s compass was pulled to this spot.',
  'ev_6',
  true,
  '{"descriptions":["Clara notices a heavy magnetic block bolted to the ship’s mast.","At Today - 10:45 AM: Clara notices a heavy magnetic block bolted to the ship’s mast.","Notice this clue: Clara notices a heavy magnetic block bolted to the ship’s mast."],"hints":["The scientific explanation for why Jonathan’s compass was pulled to this spot.","Clue hint: Think about neodymium salvage magnet.","Search for: a powerful industrial neodymium salvage magnet pulling metallic objects toward the wreck."],"clues":["Neodymium salvage magnet","Item: Neodymium salvage magnet","Clue Word: Neodymium salvage magnet"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '91dca6ae-eeea-5c8e-a616-5d59210b67ed',
  'story_118',
  'ev_6',
  6,
  'Today - 11:30 AM',
  'Clara recovers Caleb’s waterproof diving pouch from the wreck.',
  'Clara recovers Caleb’s waterproof diving pouch from the wreck.',
  'A bag of uncut raw industrial diamonds matching Silas’s walking stick diamond.',
  'Uncut industrial diamonds',
  'Recovered Diamond Cache',
  '["Gold coins","Silver bars","Old rum"]'::jsonb,
  'Uncut industrial diamonds',
  '["uncut industrial diamonds","diamonds","raw diamonds","diamond cache","uncut diamonds"]'::jsonb,
  'The fortune in precious gems that motivated Silas to sabotage the boat.',
  'ev_7',
  false,
  '{"descriptions":["Clara recovers Caleb’s waterproof diving pouch from the wreck.","At Today - 11:30 AM: Clara recovers Caleb’s waterproof diving pouch from the wreck.","Notice this clue: Clara recovers Caleb’s waterproof diving pouch from the wreck."],"hints":["The fortune in precious gems that motivated Silas to sabotage the boat.","Clue hint: Think about uncut industrial diamonds.","Search for: a bag of uncut raw industrial diamonds matching silas’s walking stick diamond."],"clues":["Uncut industrial diamonds","Item: Uncut industrial diamonds","Clue Word: Uncut industrial diamonds"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3ad6fea0-57db-5e17-a051-420237fe833d',
  'story_118',
  'ev_7',
  7,
  'Today - 12:15 PM',
  'Police confront Silas Thorne at the harbor pilot office.',
  'Police confront Silas Thorne at the harbor pilot office.',
  'Silas breaks down as police compare his walking stick gem to the recovered diamonds.',
  'Walking stick gem match',
  'Spectroscopy Gem Match',
  '["Pocket knife","Watch","Ring"]'::jsonb,
  'Walking stick gem match',
  '["walking stick gem match","gem match","walking stick gem","diamond match","spectroscopy match"]'::jsonb,
  'Conclusive mineral link proving Silas took a diamond from the victim’s shipment.',
  'ev_8',
  false,
  '{"descriptions":["Police confront Silas Thorne at the harbor pilot office.","At Today - 12:15 PM: Police confront Silas Thorne at the harbor pilot office.","Notice this clue: Police confront Silas Thorne at the harbor pilot office."],"hints":["Conclusive mineral link proving Silas took a diamond from the victim’s shipment.","Clue hint: Think about walking stick gem match.","Search for: silas breaks down as police compare his walking stick gem to the recovered diamonds."],"clues":["Walking stick gem match","Item: Walking stick gem match","Clue Word: Walking stick gem match"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'cc5962b2-9c26-51d5-ad86-0d61fb055655',
  'story_118',
  'ev_8',
  8,
  'Today - 01:00 PM',
  'Old Man Jonathan stands at the cliff as Caleb’s remains are brought to shore.',
  'Old Man Jonathan stands at the cliff as Caleb’s remains are brought to shore.',
  'The father places the compass on his son’s coffin as the needle finally swings to north.',
  'Compass points to true north',
  'Restored Compass Needle',
  '["Broken glass","Frozen needle","Spinning needle"]'::jsonb,
  'Compass points to true north',
  '["compass points to true north","compass north","true north","restored needle","compass needle"]'::jsonb,
  'The poignant resolution as the compass returns to normal once the mystery is solved.',
  NULL,
  true,
  '{"descriptions":["Old Man Jonathan stands at the cliff as Caleb’s remains are brought to shore.","At Today - 01:00 PM: Old Man Jonathan stands at the cliff as Caleb’s remains are brought to shore.","Notice this clue: Old Man Jonathan stands at the cliff as Caleb’s remains are brought to shore."],"hints":["The poignant resolution as the compass returns to normal once the mystery is solved.","Clue hint: Think about compass points to true north.","Search for: the father places the compass on his son’s coffin as the needle finally swings to north."],"clues":["Compass points to true north","Item: Compass points to true north","Clue Word: Compass points to true north"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_119 — THE GARDEN OF STONE ANGELS
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_119',
  'The Garden of Stone Angels',
  'Emotional Mystery',
  'The forgotten corner of Oakridge Cemetery, overgrown ivy, mossy marble angels, weeping statues, and an unmarked headstone',
  'For forty years, fresh white lilies were placed every Sunday morning on an unmarked grave beneath a weeping stone angel, but when the mysterious mourner collapsed beside the tomb, a 1984 adoption file fell from her coat.',
  '[{"name":"Nora Hayes (Elderly Mourner)","role":"Devoted Mother","alibi":"Visiting the grave every Sunday at 07:00 AM for forty years","avatar":"💐"},{"name":"Judge William Vance (Deceased)","role":"Powerful Aristocratic Judge","alibi":"Deceased former chief justice of the county","avatar":"⚖️"},{"name":"Father Thomas","role":"Cemetery Priest","alibi":"Preparing the altar for Sunday morning mass","avatar":"✝️"},{"name":"Detective Clara Shaw","role":"Cold Case Genealogist & Officer","alibi":"Attending to Nora at the cemetery graveside","avatar":"🔍"}]'::jsonb,
  'In 1984, young mother Nora was forced by wealthy Judge William Vance to give up her infant daughter. When the baby died of pneumonia two months later, the Judge had her buried in an unmarked plot under a stone angel to hide his secret paternity. Nora spent forty years bringing white lilies every Sunday to her daughter’s nameless grave.',
  'Prominent Judge William Vance (Deceased)',
  'Judge Vance forced a young mother to give up her baby for adoption and buried the baby secretly when she died of illness.',
  '[{"time":"April 12, 1984","event":"Baby Lily is born to Nora Hayes; Judge Vance forces her into a private clinic."},{"time":"June 15, 1984","event":"Baby Lily passes away from pneumonia; Judge Vance buries her under the unmarked angel."},{"time":"Forty Years of Sundays","event":"Nora places fresh white lilies on the nameless stone every Sunday morning."},{"time":"Today - 07:00 AM","event":"Nora collapses from heart weakness beside the weeping stone angel."},{"time":"Today - 07:15 AM","event":"Father Thomas and Detective Shaw find Nora and the 1984 birth certificate."}]'::jsonb,
  '[{"id":"ev_1","title":"Sunday Lilies Bouquet","detail":"White Casa Blanca lilies brought every Sunday morning for forty unbroken years."},{"id":"ev_2","title":"Original Birth Certificate","detail":"1984 record naming Judge William Vance and Nora Hayes as parents of Baby Lily."},{"id":"ev_3","title":"Sculptor Inscription","detail":"Private signature behind the angel’s wing proving Judge Vance paid for the statue."},{"id":"ev_4","title":"New Carved Headstone","detail":"The restored marble marker replacing forty years of anonymity with the baby’s true name."}]'::jsonb,
  '[{"order":1,"title":"White Casa Blanca lilies","text":"The persistent ritual of maternal love that outlasted all secrecy."},{"order":2,"title":"1984 birth certificate","text":"Documentary proof revealing the identity of the child in the unmarked plot."},{"order":3,"title":"Vance sculptor signature","text":"Ties the powerful judge directly to the commissioned grave monument."},{"order":4,"title":"Church plot ledger entry","text":"Demonstrates the judge covertly financed the burial under a pseudonym."},{"order":5,"title":"Mother’s sworn testimony","text":"The deeply moving oral history of forty years of silent fidelity."},{"order":6,"title":"Carved memorial headstone","text":"The final emotional justice restoring the child’s name in stone."}]'::jsonb,
  'Weeping stone angel condensation: Water droplets on the marble face were normal morning dew, not divine tears.; Rumors of a murdered nun buried in plot 42: Cemetery gossip generated by local children to frighten visitors.',
  'Claim the stone angel cried real water tears due to an ancient cemetery miracle.',
  'NORMAL',
  'Who was buried beneath the unmarked stone angel, and why was the secret guarded for forty years?',
  '[{"character":"Nora Hayes (Elderly Mourner)","secret":"A faded 1984 hospital birth certificate naming Judge Vance as the father."},{"character":"Judge William Vance (Deceased)","secret":"A secret trust ledger hidden in the family vault funding Nora’s silent pension."},{"character":"Father Thomas","secret":"He kept the 1984 church interment registry locked in the vestry."},{"character":"Detective Clara Shaw","secret":"She was called by paramedics when Nora fainted beside the statue."}]'::jsonb,
  '[{"lead":"Weeping stone angel condensation","explanation":"Water droplets on the marble face were normal morning dew, not divine tears."},{"lead":"Rumors of a murdered nun buried in plot 42","explanation":"Cemetery gossip generated by local children to frighten visitors."}]'::jsonb,
  '{"wrongTheories":["The unmarked grave belonged to an unknown Victorian drifter with no living relatives.","The flowers were placed by a deranged lunatic who had no relationship to the cemetery."],"correctTheory":"Nora Hayes brought white lilies every Sunday for forty years to the unmarked grave of her infant daughter, who was hidden by Judge Vance to protect his social standing."}'::jsonb,
  'Nora Hayes brought lilies every Sunday to her infant daughter Lily, whom Judge William Vance buried in an unmarked grave to hide his paternity.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"Nora saw her daughter’s name restored in marble before she passed away in peace, surrounded by community honor."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"Nora passed away in the ambulance, and the child’s stone remained blank and nameless forever."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The stone angel was removed by city developers, erasing the grave and the forty-year vigil from history."}]'::jsonb,
  '{"intros":["For forty years, fresh white lilies were placed every Sunday morning on an unmarked grave beneath a weeping stone angel, but when the mysterious mourner collapsed beside the tomb, a 1984 adoption file fell from her coat.","Case file story_119: For forty years, fresh white lilies were placed every Sunday morning on an unmarked grave beneath a weeping stone angel, but when the mysterious mourner collapsed beside the tomb, a 1984 adoption file fell from her coat. Look closely at every clue.","Trouble begins in The forgotten corner of Oakridge Cemetery, overgrown ivy, mossy marble angels, weeping statues, and an unmarked headstone. For forty years, fresh white lilies were placed every Sunday morning on an unmarked grave beneath a weeping stone angel, but when the mysterious mourner collapsed beside the tomb, a 1984 adoption file fell from her coat.","The mystery starts now. For forty years, fresh white lilies were placed every Sunday morning on an unmarked grave beneath a weeping stone angel, but when the mysterious mourner collapsed beside the tomb, a 1984 adoption file fell from her coat. Can you solve it?"],"reveals":["Nora Hayes brought lilies every Sunday to her infant daughter Lily, whom Judge William Vance buried in an unmarked grave to hide his paternity.","The mystery is unraveled! Nora Hayes brought lilies every Sunday to her infant daughter Lily, whom Judge William Vance buried in an unmarked grave to hide his paternity.","At last, the truth comes out: Nora Hayes brought lilies every Sunday to her infant daughter Lily, whom Judge William Vance buried in an unmarked grave to hide his paternity.","Case resolved! Here is what happened: Nora Hayes brought lilies every Sunday to her infant daughter Lily, whom Judge William Vance buried in an unmarked grave to hide his paternity."],"hints":["Pay attention to where Prominent Judge William Vance (Deceased) was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_119';
DELETE FROM public.case_events WHERE case_id = 'story_119';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '334deee0-ff41-5939-b98c-145ebf6ff3c1',
  'story_119',
  'Nora Hayes (Elderly Mourner)',
  'Devoted Mother',
  'Frail, white hair, simple wool coat, carrying a bouquet of white lilies and worn leather Bible',
  'I promised my baby girl that she would never be forgotten, even if the world gave her no name.',
  'A faded 1984 hospital birth certificate naming Judge Vance as the father.',
  'Visiting the grave every Sunday at 07:00 AM for forty years',
  'Mother of the infant buried beneath the stone angel',
  'The judge had threatened to send her to an asylum if she revealed the child’s parentage.',
  'Did not know the judge’s estate was currently being audited by historical preservationists.',
  '💐',
  '["I promised my baby girl that she would never be forgotten, even if the world gave her no name.","\"I promised my baby girl that she would never be forgotten, even if the world gave her no name.\"","Listen to me: I promised my baby girl that she would never be forgotten, even if the world gave her no name.","I tell you the truth: I promised my baby girl that she would never be forgotten, even if the world gave her no name."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '98fbbbc3-e81c-5ba5-80ff-2c509300a571',
  'story_119',
  'Judge William Vance (Deceased)',
  'Powerful Aristocratic Judge',
  'Ruthless patrician, public pillar of virtue, private tyrant, died in 2010',
  'Historical records: Judge Vance donated the cemetery land to the city in 1985.',
  'A secret trust ledger hidden in the family vault funding Nora’s silent pension.',
  'Deceased former chief justice of the county',
  'Biological father of the unmarked infant',
  'The unmarked plot was recorded in church books as "Unknown Infant 09".',
  'Did not foresee Nora outliving him to reveal the truth.',
  '⚖️',
  '["Historical records: Judge Vance donated the cemetery land to the city in 1985.","\"Historical records: Judge Vance donated the cemetery land to the city in 1985.\"","Listen to me: Historical records: Judge Vance donated the cemetery land to the city in 1985.","I tell you the truth: Historical records: Judge Vance donated the cemetery land to the city in 1985."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '86707f2b-7fdc-5861-863f-5cff6e18b28c',
  'story_119',
  'Father Thomas',
  'Cemetery Priest',
  'Gentle, black cassock, white hair, carrying silver communion chalice, kind eyes',
  'Every Sunday for forty years, the lilies were there before the morning bell rang. I never knew who brought them.',
  'He kept the 1984 church interment registry locked in the vestry.',
  'Preparing the altar for Sunday morning mass',
  'Priest of the parish cemetery',
  'Plot 42 had no family deed recorded in the municipal archives.',
  'Did not know the identity of the infant until reading the hospital paper.',
  '✝️',
  '["Every Sunday for forty years, the lilies were there before the morning bell rang. I never knew who brought them.","\"Every Sunday for forty years, the lilies were there before the morning bell rang. I never knew who brought them.\"","Listen to me: Every Sunday for forty years, the lilies were there before the morning bell rang. I never knew who brought them.","I tell you the truth: Every Sunday for forty years, the lilies were there before the morning bell rang. I never knew who brought them."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'ca5f7513-833f-590d-9548-5df3a83521df',
  'story_119',
  'Detective Clara Shaw',
  'Cold Case Genealogist & Officer',
  'Empathetic, trench coat, holding historical archives and forensic camera',
  'Every nameless grave has a mother who cried for it. It’s time this child had her name back.',
  'She was called by paramedics when Nora fainted beside the statue.',
  'Attending to Nora at the cemetery graveside',
  'Investigating officer on the scene',
  'The stone angel had a miniature carved bird on its shoulder matching the judge’s private sculpter.',
  'Did not know the child’s true name until Nora opened her Bible.',
  '🔍',
  '["Every nameless grave has a mother who cried for it. It’s time this child had her name back.","\"Every nameless grave has a mother who cried for it. It’s time this child had her name back.\"","Listen to me: Every nameless grave has a mother who cried for it. It’s time this child had her name back.","I tell you the truth: Every nameless grave has a mother who cried for it. It’s time this child had her name back."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '24e81bd9-58a2-5f51-8c1c-12125224246e',
  'story_119',
  'ev_1',
  1,
  'Today - 07:15 AM',
  'Detective Shaw tends to the collapsed elderly woman beside the statue.',
  'Detective Shaw tends to the collapsed elderly woman beside the statue.',
  'A fresh bouquet of white Casa Blanca lilies resting against the nameless headstone.',
  'White Casa Blanca lilies',
  'Sunday Lilies Bouquet',
  '["Plastic wreath","Red roses","Dead leaves"]'::jsonb,
  'White Casa Blanca lilies',
  '["white casa blanca lilies","white lilies","lilies","bouquet","casablanca lilies"]'::jsonb,
  'Fresh fragrant flowers placed at the base of the weeping stone angel.',
  'ev_2',
  true,
  '{"descriptions":["Detective Shaw tends to the collapsed elderly woman beside the statue.","At Today - 07:15 AM: Detective Shaw tends to the collapsed elderly woman beside the statue.","Notice this clue: Detective Shaw tends to the collapsed elderly woman beside the statue."],"hints":["Fresh fragrant flowers placed at the base of the weeping stone angel.","Clue hint: Think about white casa blanca lilies.","Search for: a fresh bouquet of white casa blanca lilies resting against the nameless headstone."],"clues":["White Casa Blanca lilies","Item: White Casa Blanca lilies","Clue Word: White Casa Blanca lilies"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '9997938d-6c02-5cf2-a0b6-fe3814868a17',
  'story_119',
  'ev_2',
  2,
  'Today - 07:30 AM',
  'Shaw picks up the worn leather Bible that fell from Nora’s hands.',
  'Shaw picks up the worn leather Bible that fell from Nora’s hands.',
  'A 1984 birth certificate for "Lily Vance Hayes" naming Judge William Vance as father.',
  '1984 birth certificate',
  'Original Birth Certificate',
  '["Baptism card","Will","Marriage license"]'::jsonb,
  '1984 birth certificate',
  '["1984 birth certificate","birth certificate","1984 certificate","lily certificate","certificate"]'::jsonb,
  'Historic document proving the infant’s true name and royal parentage.',
  'ev_3',
  false,
  '{"descriptions":["Shaw picks up the worn leather Bible that fell from Nora’s hands.","At Today - 07:30 AM: Shaw picks up the worn leather Bible that fell from Nora’s hands.","Notice this clue: Shaw picks up the worn leather Bible that fell from Nora’s hands."],"hints":["Historic document proving the infant’s true name and royal parentage.","Clue hint: Think about 1984 birth certificate.","Search for: a 1984 birth certificate for \"lily vance hayes\" naming judge william vance as father."],"clues":["1984 birth certificate","Item: 1984 birth certificate","Clue Word: 1984 birth certificate"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'bef9bf92-d07b-5ae2-ac9f-188b6d305fa2',
  'story_119',
  'ev_3',
  3,
  'Today - 08:00 AM',
  'Shaw inspects the stone angel statue under magnification.',
  'Shaw inspects the stone angel statue under magnification.',
  'The sculptor’s signature "VANCE - 1984" carved discreetly behind the angel’s wing.',
  'Vance sculptor signature',
  'Sculptor Inscription',
  '["Cemetery mason mark","Greek letter","Cross symbol"]'::jsonb,
  'Vance sculptor signature',
  '["vance sculptor signature","sculptor signature","vance signature","sculptor mark","inscription"]'::jsonb,
  'Carved mark proving Judge Vance commissioned the custom stone angel in 1984.',
  'ev_4',
  false,
  '{"descriptions":["Shaw inspects the stone angel statue under magnification.","At Today - 08:00 AM: Shaw inspects the stone angel statue under magnification.","Notice this clue: Shaw inspects the stone angel statue under magnification."],"hints":["Carved mark proving Judge Vance commissioned the custom stone angel in 1984.","Clue hint: Think about vance sculptor signature.","Search for: the sculptor’s signature \"vance - 1984\" carved discreetly behind the angel’s wing."],"clues":["Vance sculptor signature","Item: Vance sculptor signature","Clue Word: Vance sculptor signature"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'c7167439-9d74-5583-92a4-94fbf1db649b',
  'story_119',
  'ev_4',
  4,
  'Today - 08:30 AM',
  'Father Thomas opens the 1984 church parish death registry.',
  'Father Thomas opens the 1984 church parish death registry.',
  'Plot 42 paid for in cash by Judge William Vance under an anonymous pseudonym.',
  'Church plot ledger entry',
  '1984 Parish Burial Log',
  '["Charity burial log","Pauper list","Missing page"]'::jsonb,
  'Church plot ledger entry',
  '["church plot ledger entry","plot ledger","burial log","parish log","church ledger"]'::jsonb,
  'Parish paperwork proving the judge secretly financed the unmarked burial.',
  'ev_5',
  false,
  '{"descriptions":["Father Thomas opens the 1984 church parish death registry.","At Today - 08:30 AM: Father Thomas opens the 1984 church parish death registry.","Notice this clue: Father Thomas opens the 1984 church parish death registry."],"hints":["Parish paperwork proving the judge secretly financed the unmarked burial.","Clue hint: Think about church plot ledger entry.","Search for: plot 42 paid for in cash by judge william vance under an anonymous pseudonym."],"clues":["Church plot ledger entry","Item: Church plot ledger entry","Clue Word: Church plot ledger entry"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'a1dd505c-9e06-5a2f-9d70-9b5dfbc0a314',
  'story_119',
  'ev_5',
  5,
  'Today - 09:15 AM',
  'Nora wakes up in the hospital and holds Detective Shaw’s hands.',
  'Nora wakes up in the hospital and holds Detective Shaw’s hands.',
  'Nora’s emotional testimony: "I couldn’t give her a home in life, but I gave her flowers for forty years."',
  'Mother’s sworn testimony',
  'Nora’s Recorded Statement',
  '["Denial","Anger","Silence"]'::jsonb,
  'Mother’s sworn testimony',
  '["mother’s sworn testimony","testimony","mother testimony","recorded statement","nora statement"]'::jsonb,
  'Heartfelt spoken record of a mother’s four decades of unbreakable devotion.',
  'ev_6',
  true,
  '{"descriptions":["Nora wakes up in the hospital and holds Detective Shaw’s hands.","At Today - 09:15 AM: Nora wakes up in the hospital and holds Detective Shaw’s hands.","Notice this clue: Nora wakes up in the hospital and holds Detective Shaw’s hands."],"hints":["Heartfelt spoken record of a mother’s four decades of unbreakable devotion.","Clue hint: Think about mother’s sworn testimony.","Search for: nora’s emotional testimony: \"i couldn’t give her a home in life, but i gave her flowers for forty years.\""],"clues":["Mother’s sworn testimony","Item: Mother’s sworn testimony","Clue Word: Mother’s sworn testimony"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '7686eb45-d262-52b8-bf7f-fc31c680ff69',
  'story_119',
  'ev_6',
  6,
  'Today - 10:00 AM',
  'Shaw searches the Judge Vance family archive at the county library.',
  'Shaw searches the Judge Vance family archive at the county library.',
  'A private letter from the Judge acknowledging baby Lily and his lifelong guilt.',
  'Judge’s guilt letter',
  'Patriarch Guilt Letter',
  '["Court ruling","Political speech","Tax bill"]'::jsonb,
  'Judge’s guilt letter',
  '["judge’s guilt letter","guilt letter","judge letter","letter","patriarch letter"]'::jsonb,
  'Written confirmation from the powerful judge admitting his daughter was buried there.',
  'ev_7',
  false,
  '{"descriptions":["Shaw searches the Judge Vance family archive at the county library.","At Today - 10:00 AM: Shaw searches the Judge Vance family archive at the county library.","Notice this clue: Shaw searches the Judge Vance family archive at the county library."],"hints":["Written confirmation from the powerful judge admitting his daughter was buried there.","Clue hint: Think about judge’s guilt letter.","Search for: a private letter from the judge acknowledging baby lily and his lifelong guilt."],"clues":["Judge’s guilt letter","Item: Judge’s guilt letter","Clue Word: Judge’s guilt letter"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'ef6f38df-1790-5f74-aa5a-cc763572bb78',
  'story_119',
  'ev_7',
  7,
  'Today - 11:30 AM',
  'The city council votes unanimously to correct the historical cemetery record.',
  'The city council votes unanimously to correct the historical cemetery record.',
  'A formal decree granting baby Lily Vance Hayes her rightful family name.',
  'Name restoration decree',
  'Official Restoration Decree',
  '["Court lawsuit","Fine notice","Dismissal"]'::jsonb,
  'Name restoration decree',
  '["name restoration decree","name decree","restoration decree","decree","name restoration"]'::jsonb,
  'Official legal restoration giving the unmarked child back her dignity.',
  'ev_8',
  false,
  '{"descriptions":["The city council votes unanimously to correct the historical cemetery record.","At Today - 11:30 AM: The city council votes unanimously to correct the historical cemetery record.","Notice this clue: The city council votes unanimously to correct the historical cemetery record."],"hints":["Official legal restoration giving the unmarked child back her dignity.","Clue hint: Think about name restoration decree.","Search for: a formal decree granting baby lily vance hayes her rightful family name."],"clues":["Name restoration decree","Item: Name restoration decree","Clue Word: Name restoration decree"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '1794ff1c-c2a0-5af7-bfad-198f897d7d4d',
  'story_119',
  'ev_8',
  8,
  'Today - 01:00 PM',
  'A new carved marble plaque is installed beneath the stone angel.',
  'A new carved marble plaque is installed beneath the stone angel.',
  'Nora in her wheelchair watching the plaque placed: "Lily Vance Hayes - Beloved Daughter".',
  'Carved memorial headstone',
  'New Carved Headstone',
  '["Blank stone","Wooden cross","Pewter plaque"]'::jsonb,
  'Carved memorial headstone',
  '["carved memorial headstone","memorial headstone","headstone","carved headstone","lily headstone"]'::jsonb,
  'The stone angel finally bearing the true name of the child.',
  NULL,
  true,
  '{"descriptions":["A new carved marble plaque is installed beneath the stone angel.","At Today - 01:00 PM: A new carved marble plaque is installed beneath the stone angel.","Notice this clue: A new carved marble plaque is installed beneath the stone angel."],"hints":["The stone angel finally bearing the true name of the child.","Clue hint: Think about carved memorial headstone.","Search for: nora in her wheelchair watching the plaque placed: \"lily vance hayes - beloved daughter\"."],"clues":["Carved memorial headstone","Item: Carved memorial headstone","Clue Word: Carved memorial headstone"]}'::jsonb
);

-- ----------------------------------------------------------------------------
-- CASE: STORY_120 — THE FINAL SUNSET AT CAPE HOPE
-- ----------------------------------------------------------------------------
INSERT INTO public.cases (
  id, title, genre, setting, description, characters, truth, culprit, motive,
  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,
  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording
) VALUES (
  'story_120',
  'The Final Sunset at Cape Hope',
  'Emotional Mystery',
  'The sunset cliffs of Cape Hope, panoramic Pacific horizon, golden grass, rusted brass telescope on a tripod, and a wooden bench',
  'On the highest cliff overlooking the golden sunset, an antique brass telescope was found locked in position pointing at an empty strip of beach, with a leather-bound notebook left on the bench containing a countdown that ended today.',
  '[{"name":"David Vance (Elderly Fisherman)","role":"Devoted Widower & Fisherman","alibi":"Sitting on the wooden bench at the telescope viewpoint","avatar":"🌅"},{"name":"Clara Vance (Deceased in 1974)","role":"Late Beloved Wife","alibi":"Deceased in 1974","avatar":"🕊️"},{"name":"Mayor Marcus Cole","role":"Town Mayor","alibi":"At the cliff viewpoint with town council members","avatar":"🏛️"},{"name":"Detective Clara Reed","role":"County Heritage Investigator","alibi":"Standing beside David on the bench at sunset","avatar":"🔍"},{"name":"Julian Vance (Historical Tycoon)","role":"Historical Land Grabber & Arsonist","alibi":"Deceased in 1999; ordered the 1974 arson from his private penthouse","avatar":"🏢"}]'::jsonb,
  'Fifty years ago, fisherman David and his wife Clara lived in a cottage on the beach below Cape Hope. Land tycoon Julian Vance burned down their home to build a golf course, causing Clara to lose her life. David spent fifty years saving every penny to buy back the land. The telescope was locked on the spot where his cottage once stood, countdown marking the day the deed reverted to the town.',
  'Ruthless Land Tycoon Julian Vance (Historical)',
  'Julian destroyed a young couple’s seaside home fifty years ago to build a luxury private golf resort.',
  '[{"time":"September 18, 1974","event":"Developers burn down David and Clara’s cottage; Clara dies in the fire."},{"time":"1975 to 2024","event":"David works as a deep-sea trawler captain, saving every dollar to buy back the coast."},{"time":"Yesterday - 04:00 PM","event":"David signs the final payment transfer and donates the land to the town as a park."},{"time":"Today - 05:30 PM","event":"David locks the brass telescope on the cottage stones and writes the final countdown: \"0\"."},{"time":"Today - 06:14 PM","event":"The sun sets over Cape Hope as the community honors fifty years of love."}]'::jsonb,
  '[{"id":"ev_1","title":"Cliff Brass Telescope","detail":"Vintage brass telescope locked permanently onto the stones of the 1974 cottage."},{"id":"ev_2","title":"David’s Countdown Journal","detail":"Notebook documenting fifty years and 18,250 days of saving to buy back the coast."},{"id":"ev_3","title":"Public Park Land Deed","detail":"Official deed dedicating 500 acres of Cape Hope as a public sanctuary forever."},{"id":"ev_4","title":"Cape Hope Memorial Plaque","detail":"Bronze dedication on the cliff bench: \"Love is stronger than greed or time.\""}]'::jsonb,
  '[{"order":1,"title":"Locked brass telescope","text":"The optical anchor keeping the old man’s eyes focused on his life’s promise."},{"order":2,"title":"Cottage stone foundation in crosshairs","text":"Reveals the exact historic home destroyed fifty years ago."},{"order":3,"title":"Fifty-year countdown notebook","text":"A staggering documentary record of half a century of devotion."},{"order":4,"title":"Clara’s 1974 portrait","text":"The human face and inspiration behind the entire mystery."},{"order":5,"title":"Clara Vance Memorial Park deed","text":"The legal victory of love and community over corporate greed."},{"order":6,"title":"Wild roses in the foundation","text":"The community tribute signaling that Clara’s memory will never fade."}]'::jsonb,
  'Astronomical eclipse calendar in the notebook back: David checked sun phases, but the countdown was about the lease.; Rumors of an eccentric hermit hoarding gold: David was simple and humble, using every penny for the park.',
  'Claim an eccentric astronomer was tracking a fictional ghost ship on the horizon.',
  'NORMAL',
  'What was the telescope pointed at on the empty beach, and why did the countdown end today?',
  '[{"character":"David Vance (Elderly Fisherman)","secret":"The original 1974 land deed reversion certificate in his breast pocket."},{"character":"Clara Vance (Deceased in 1974)","secret":"Her wedding band was buried beneath the old cottage hearthstone."},{"character":"Mayor Marcus Cole","secret":"His grandfather was the surveyor who signed the fraudulent 1974 eviction."},{"character":"Detective Clara Reed","secret":"She helped David verify the historic deed records in the state capital."},{"character":"Julian Vance (Historical Tycoon)","secret":"The forged demolition order was buried in his company’s private offshore records."}]'::jsonb,
  '[{"lead":"Astronomical eclipse calendar in the notebook back","explanation":"David checked sun phases, but the countdown was about the lease."},{"lead":"Rumors of an eccentric hermit hoarding gold","explanation":"David was simple and humble, using every penny for the park."}]'::jsonb,
  '{"wrongTheories":["An eccentric astronomer went mad watching for alien signals on the beach below.","A lonely widower was preparing to jump from the cliff at sunset."],"correctTheory":"David Vance spent fifty years saving every dollar to buy back the coastal land where his wife’s cottage was burned by developers, locking the telescope on the spot until the deed became a public park."}'::jsonb,
  'David Vance spent fifty years buying back the coastal land where his wife Clara’s cottage stood, dedicating it as a free public park forever.',
  '[{"endingId":"true_ending","title":"The Truth Revealed","narrativeText":"David celebrated the sunset surrounded by the grateful town, Clara’s beach was preserved forever, and the telescope stood as a beacon of love."},{"endingId":"wrong_accusation","title":"An Innocent Accused","narrativeText":"The developers found a loophole in the lease and built luxury mansions, tearing down the telescope."},{"endingId":"distorter_victory","title":"The Deception Succeeded","narrativeText":"The cliff was declared unstable and fenced off, leaving David’s fifty-year sacrifice unseen by the public."}]'::jsonb,
  '{"intros":["On the highest cliff overlooking the golden sunset, an antique brass telescope was found locked in position pointing at an empty strip of beach, with a leather-bound notebook left on the bench containing a countdown that ended today.","Case file story_120: On the highest cliff overlooking the golden sunset, an antique brass telescope was found locked in position pointing at an empty strip of beach, with a leather-bound notebook left on the bench containing a countdown that ended today. Look closely at every clue.","Trouble begins in The sunset cliffs of Cape Hope, panoramic Pacific horizon, golden grass, rusted brass telescope on a tripod, and a wooden bench. On the highest cliff overlooking the golden sunset, an antique brass telescope was found locked in position pointing at an empty strip of beach, with a leather-bound notebook left on the bench containing a countdown that ended today.","The mystery starts now. On the highest cliff overlooking the golden sunset, an antique brass telescope was found locked in position pointing at an empty strip of beach, with a leather-bound notebook left on the bench containing a countdown that ended today. Can you solve it?"],"reveals":["David Vance spent fifty years buying back the coastal land where his wife Clara’s cottage stood, dedicating it as a free public park forever.","The mystery is unraveled! David Vance spent fifty years buying back the coastal land where his wife Clara’s cottage stood, dedicating it as a free public park forever.","At last, the truth comes out: David Vance spent fifty years buying back the coastal land where his wife Clara’s cottage stood, dedicating it as a free public park forever.","Case resolved! Here is what happened: David Vance spent fifty years buying back the coastal land where his wife Clara’s cottage stood, dedicating it as a free public park forever."],"hints":["Pay attention to where Ruthless Land Tycoon Julian Vance (Historical) was seen.","Look closely at the timeline and missing items.","One of the character statements does not match physical evidence.","Do not trust the obvious suspect too quickly."]}'::jsonb
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

DELETE FROM public.case_characters WHERE case_id = 'story_120';
DELETE FROM public.case_events WHERE case_id = 'story_120';

INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '855df7c9-4ad2-5d57-b519-7fd4c0df5a33',
  'story_120',
  'David Vance (Elderly Fisherman)',
  'Devoted Widower & Fisherman',
  'Eighty-eight years old, weathered hands, warm smile, worn wool cap, peacefully watching the waves',
  'For fifty years, the wealthy men thought they could erase Clara’s home. Today, the earth belongs to everyone.',
  'The original 1974 land deed reversion certificate in his breast pocket.',
  'Sitting on the wooden bench at the telescope viewpoint',
  'Widower of Clara Vance and builder of the telescope viewpoint',
  'The fifty-year commercial lease signed by the tycoon expired at sunset today.',
  'Did not know the entire town had gathered at the cliff base to honor him.',
  '🌅',
  '["For fifty years, the wealthy men thought they could erase Clara’s home. Today, the earth belongs to everyone.","\"For fifty years, the wealthy men thought they could erase Clara’s home. Today, the earth belongs to everyone.\"","Listen to me: For fifty years, the wealthy men thought they could erase Clara’s home. Today, the earth belongs to everyone.","I tell you the truth: For fifty years, the wealthy men thought they could erase Clara’s home. Today, the earth belongs to everyone."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  'fb5309b3-6e02-54fa-9fab-415c3a2a4241',
  'story_120',
  'Clara Vance (Deceased in 1974)',
  'Late Beloved Wife',
  'Gentle, loved the sea, died in the cottage fire orchestrated by developers fifty years ago',
  'Portrait in the notebook shows her standing on the beach holding wild beach roses.',
  'Her wedding band was buried beneath the old cottage hearthstone.',
  'Deceased in 1974',
  'Beloved late wife of David',
  'The land was promised to be a public sanctuary forever.',
  'Did not survive the fire, but her memory guided David’s fifty-year mission.',
  '🕊️',
  '["Portrait in the notebook shows her standing on the beach holding wild beach roses.","\"Portrait in the notebook shows her standing on the beach holding wild beach roses.\"","Listen to me: Portrait in the notebook shows her standing on the beach holding wild beach roses.","I tell you the truth: Portrait in the notebook shows her standing on the beach holding wild beach roses."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '1acdc868-92aa-50a1-b0b8-e1d981f2120a',
  'story_120',
  'Mayor Marcus Cole',
  'Town Mayor',
  'Proud civic leader, carrying official town charter and municipal seals, wearing suit',
  'Mr. Vance paid the final property buyout this morning. He donated five hundred acres of coastline to our citizens.',
  'His grandfather was the surveyor who signed the fraudulent 1974 eviction.',
  'At the cliff viewpoint with town council members',
  'Presiding over the official public park dedication',
  'The golf resort developers lost their lease dispute in federal court yesterday.',
  'Did not know David had been watching the exact hearth spot through the telescope daily.',
  '🏛️',
  '["Mr. Vance paid the final property buyout this morning. He donated five hundred acres of coastline to our citizens.","\"Mr. Vance paid the final property buyout this morning. He donated five hundred acres of coastline to our citizens.\"","Listen to me: Mr. Vance paid the final property buyout this morning. He donated five hundred acres of coastline to our citizens.","I tell you the truth: Mr. Vance paid the final property buyout this morning. He donated five hundred acres of coastline to our citizens."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '5bbc54e2-a647-5c3e-baad-0d81c2245ba8',
  'story_120',
  'Detective Clara Reed',
  'County Heritage Investigator',
  'Analytical, warm, holding David’s notebook and camera, admiring the view',
  'This wasn’t a mystery of crime or violence—it’s a monument of fifty years of unbroken love.',
  'She helped David verify the historic deed records in the state capital.',
  'Standing beside David on the bench at sunset',
  'Investigator who verified the land ownership trail',
  'The brass telescope’s focal point reveals the outline of the old cottage foundation stones in the sand.',
  'Did not know David had placed wild beach roses at the site this morning.',
  '🔍',
  '["This wasn’t a mystery of crime or violence—it’s a monument of fifty years of unbroken love.","\"This wasn’t a mystery of crime or violence—it’s a monument of fifty years of unbroken love.\"","Listen to me: This wasn’t a mystery of crime or violence—it’s a monument of fifty years of unbroken love.","I tell you the truth: This wasn’t a mystery of crime or violence—it’s a monument of fifty years of unbroken love."]'::jsonb
);
INSERT INTO public.case_characters (
  id, case_id, name, role_description, personality, what_they_say, what_they_hide,
  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations
) VALUES (
  '492474e8-ad99-51f1-9298-76ea478d474b',
  'story_120',
  'Julian Vance (Historical Tycoon)',
  'Historical Land Grabber & Arsonist',
  'Greedy developer who prioritized resort profits over human lives',
  'Deceased in 1999; archive portrait shows a callous businessman holding resort blueprints.',
  'The forged demolition order was buried in his company’s private offshore records.',
  'Deceased in 1999; ordered the 1974 arson from his private penthouse',
  'Greedy developer who burned down David and Clara’s cottage in 1974',
  'The seaside coastline would be worth tens of millions once the cottage was cleared.',
  'Did not know David would spend fifty years saving every dollar to reclaim the coast for the public.',
  '🏢',
  '["Deceased in 1999; archive portrait shows a callous businessman holding resort blueprints.","\"Deceased in 1999; archive portrait shows a callous businessman holding resort blueprints.\"","Listen to me: Deceased in 1999; archive portrait shows a callous businessman holding resort blueprints.","I tell you the truth: Deceased in 1999; archive portrait shows a callous businessman holding resort blueprints."]'::jsonb
);

INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '6d42ec01-8553-5726-95c3-acf5667066f7',
  'story_120',
  'ev_1',
  1,
  '05:30 PM',
  'David locks the heavy brass telescope in place on the cliff.',
  'David locks the heavy brass telescope in place on the cliff.',
  'A high-powered vintage brass telescope locked securely on heavy tripod mountings.',
  'Locked brass telescope',
  'Cliff Brass Telescope',
  '["Camera","Survey transit","Sextant"]'::jsonb,
  'Locked brass telescope',
  '["locked brass telescope","brass telescope","telescope","cliff telescope","locked telescope"]'::jsonb,
  'Antique optical instrument aimed permanently at a specific spot on the sand.',
  'ev_2',
  true,
  '{"descriptions":["David locks the heavy brass telescope in place on the cliff.","At 05:30 PM: David locks the heavy brass telescope in place on the cliff.","Notice this clue: David locks the heavy brass telescope in place on the cliff."],"hints":["Antique optical instrument aimed permanently at a specific spot on the sand.","Clue hint: Think about locked brass telescope.","Search for: a high-powered vintage brass telescope locked securely on heavy tripod mountings."],"clues":["Locked brass telescope","Item: Locked brass telescope","Clue Word: Locked brass telescope"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '4f7dea7b-f8a4-5ec6-8302-8ee36e9c09b5',
  'story_120',
  'ev_2',
  2,
  '05:40 PM',
  'Detective Clara Reed looks through the eyepiece of the telescope.',
  'Detective Clara Reed looks through the eyepiece of the telescope.',
  'The crosshairs perfectly centered on the stone foundation outline of an old cottage.',
  'Cottage stone foundation in crosshairs',
  'Telescope Crosshairs View',
  '["Empty sea","Golf clubhouse","Lighthouse"]'::jsonb,
  'Cottage stone foundation in crosshairs',
  '["cottage stone foundation in crosshairs","cottage foundation","stone foundation","crosshairs view","foundation stones"]'::jsonb,
  'What the telescope sees: the rectangular stone footprint of a home in the sand.',
  'ev_3',
  false,
  '{"descriptions":["Detective Clara Reed looks through the eyepiece of the telescope.","At 05:40 PM: Detective Clara Reed looks through the eyepiece of the telescope.","Notice this clue: Detective Clara Reed looks through the eyepiece of the telescope."],"hints":["What the telescope sees: the rectangular stone footprint of a home in the sand.","Clue hint: Think about cottage stone foundation in crosshairs.","Search for: the crosshairs perfectly centered on the stone foundation outline of an old cottage."],"clues":["Cottage stone foundation in crosshairs","Item: Cottage stone foundation in crosshairs","Clue Word: Cottage stone foundation in crosshairs"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '23bf7d0e-dc3a-58a2-ad19-52afdaae7df6',
  'story_120',
  'ev_3',
  3,
  '05:45 PM',
  'Reed opens the worn leather notebook left on the bench.',
  'Reed opens the worn leather notebook left on the bench.',
  'Fifty years of daily entries counting down from "18,250 days" to "0 days: Today Clara’s beach is free".',
  'Fifty-year countdown notebook',
  'David’s Countdown Journal',
  '["Navigation log","Checkbook","Diary of grievances"]'::jsonb,
  'Fifty-year countdown notebook',
  '["fifty-year countdown notebook","countdown notebook","notebook","journal","fifty year notebook"]'::jsonb,
  'Leather-bound journal recording eighteen thousand days of persistent devotion.',
  'ev_4',
  false,
  '{"descriptions":["Reed opens the worn leather notebook left on the bench.","At 05:45 PM: Reed opens the worn leather notebook left on the bench.","Notice this clue: Reed opens the worn leather notebook left on the bench."],"hints":["Leather-bound journal recording eighteen thousand days of persistent devotion.","Clue hint: Think about fifty-year countdown notebook.","Search for: fifty years of daily entries counting down from \"18,250 days\" to \"0 days: today clara’s beach is free\"."],"clues":["Fifty-year countdown notebook","Item: Fifty-year countdown notebook","Clue Word: Fifty-year countdown notebook"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0e4b7b95-21ae-5b03-abb8-b9022350a269',
  'story_120',
  'ev_4',
  4,
  '05:55 PM',
  'Reed examines the 1974 photograph pasted in the front cover.',
  'Reed examines the 1974 photograph pasted in the front cover.',
  'A young Clara Vance smiling beside the cottage with wild yellow beach roses in her hair.',
  'Clara’s 1974 portrait',
  'Front Cover Photograph',
  '["Wedding certificate","Boat picture","News clipping"]'::jsonb,
  'Clara’s 1974 portrait',
  '["clara’s 1974 portrait","clara portrait","photograph","photo of clara","front photo"]'::jsonb,
  'Vintage photograph of the beloved woman who inspired fifty years of dedication.',
  'ev_5',
  false,
  '{"descriptions":["Reed examines the 1974 photograph pasted in the front cover.","At 05:55 PM: Reed examines the 1974 photograph pasted in the front cover.","Notice this clue: Reed examines the 1974 photograph pasted in the front cover."],"hints":["Vintage photograph of the beloved woman who inspired fifty years of dedication.","Clue hint: Think about clara’s 1974 portrait.","Search for: a young clara vance smiling beside the cottage with wild yellow beach roses in her hair."],"clues":["Clara’s 1974 portrait","Item: Clara’s 1974 portrait","Clue Word: Clara’s 1974 portrait"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '3e40aee5-694c-5f74-a902-63f0f35c363c',
  'story_120',
  'ev_5',
  5,
  '06:00 PM',
  'Mayor Cole presents the official county deed to David Vance.',
  'Mayor Cole presents the official county deed to David Vance.',
  'A certified deed dedicating 500 acres of coast as "The Clara Vance Memorial Park".',
  'Clara Vance Memorial Park deed',
  'Public Park Land Deed',
  '["Commercial lease","Eviction notice","Building permit"]'::jsonb,
  'Clara Vance Memorial Park deed',
  '["clara vance memorial park deed","park deed","memorial deed","deed","land deed"]'::jsonb,
  'Official municipal charter ensuring the coastline remains free and wild forever.',
  'ev_6',
  true,
  '{"descriptions":["Mayor Cole presents the official county deed to David Vance.","At 06:00 PM: Mayor Cole presents the official county deed to David Vance.","Notice this clue: Mayor Cole presents the official county deed to David Vance."],"hints":["Official municipal charter ensuring the coastline remains free and wild forever.","Clue hint: Think about clara vance memorial park deed.","Search for: a certified deed dedicating 500 acres of coast as \"the clara vance memorial park\"."],"clues":["Clara Vance Memorial Park deed","Item: Clara Vance Memorial Park deed","Clue Word: Clara Vance Memorial Park deed"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '36433eaa-781d-5e08-bf39-4deeb7af7c6f',
  'story_120',
  'ev_6',
  6,
  '06:10 PM',
  'David looks through the telescope one last time as the sun dips golden.',
  'David looks through the telescope one last time as the sun dips golden.',
  'A wreath of fresh wild roses placed inside the foundation stones by the townspeople.',
  'Wild roses in the foundation',
  'Tribute Flower Wreath',
  '["Driftwood pile","Seaweed","Sand castle"]'::jsonb,
  'Wild roses in the foundation',
  '["wild roses in the foundation","wild roses","flower wreath","roses","tribute wreath"]'::jsonb,
  'Community floral tribute honoring Clara on the exact spot of her old home.',
  'ev_7',
  false,
  '{"descriptions":["David looks through the telescope one last time as the sun dips golden.","At 06:10 PM: David looks through the telescope one last time as the sun dips golden.","Notice this clue: David looks through the telescope one last time as the sun dips golden."],"hints":["Community floral tribute honoring Clara on the exact spot of her old home.","Clue hint: Think about wild roses in the foundation.","Search for: a wreath of fresh wild roses placed inside the foundation stones by the townspeople."],"clues":["Wild roses in the foundation","Item: Wild roses in the foundation","Clue Word: Wild roses in the foundation"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  'b3669959-512e-570e-8989-40bf106d2917',
  'story_120',
  'ev_7',
  7,
  '06:14 PM',
  'The green flash of sunset sparkles on the Pacific ocean horizon.',
  'The green flash of sunset sparkles on the Pacific ocean horizon.',
  'David closing the notebook with a peaceful smile, whispering: "We did it, Clara."',
  'Closed countdown notebook',
  'Completed Mission Note',
  '["Torn page","Dropped pen","Spilled ink"]'::jsonb,
  'Closed countdown notebook',
  '["closed countdown notebook","completed note","closed notebook","final note","mission complete"]'::jsonb,
  'The profound emotional closure of a lifetime’s purpose fulfilled.',
  'ev_8',
  false,
  '{"descriptions":["The green flash of sunset sparkles on the Pacific ocean horizon.","At 06:14 PM: The green flash of sunset sparkles on the Pacific ocean horizon.","Notice this clue: The green flash of sunset sparkles on the Pacific ocean horizon."],"hints":["The profound emotional closure of a lifetime’s purpose fulfilled.","Clue hint: Think about closed countdown notebook.","Search for: david closing the notebook with a peaceful smile, whispering: \"we did it, clara.\""],"clues":["Closed countdown notebook","Item: Closed countdown notebook","Clue Word: Closed countdown notebook"]}'::jsonb
);
INSERT INTO public.case_events (
  id, case_id, event_key, order_index, time_label, description, what_happens,
  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,
  hint, next_event_key, is_key_event, dynamic_wording
) VALUES (
  '0b6dc75e-2f6c-50a1-bd15-fd22a15cb246',
  'story_120',
  'ev_8',
  8,
  '06:30 PM',
  'The town gathers on the cliff to applaud the old fisherman.',
  'The town gathers on the cliff to applaud the old fisherman.',
  'A permanent bronze plaque dedicated on the bench: "Love is stronger than greed or time."',
  'Permanent bench dedication plaque',
  'Cape Hope Memorial Plaque',
  '["Developer sign","No trespassing notice","Warning sign"]'::jsonb,
  'Permanent bench dedication plaque',
  '["permanent bench dedication plaque","bench plaque","dedication plaque","plaque","memorial plaque"]'::jsonb,
  'Permanent words etched in bronze for future generations looking out at the sea.',
  NULL,
  true,
  '{"descriptions":["The town gathers on the cliff to applaud the old fisherman.","At 06:30 PM: The town gathers on the cliff to applaud the old fisherman.","Notice this clue: The town gathers on the cliff to applaud the old fisherman."],"hints":["Permanent words etched in bronze for future generations looking out at the sea.","Clue hint: Think about permanent bench dedication plaque.","Search for: a permanent bronze plaque dedicated on the bench: \"love is stronger than greed or time.\""],"clues":["Permanent bench dedication plaque","Item: Permanent bench dedication plaque","Clue Word: Permanent bench dedication plaque"]}'::jsonb
);
