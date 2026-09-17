-- ============================================================================
-- INKBOUND — SEED ALL 17 OFFICIAL CASE FILES (AUTONOMOUS STORY ENGINE)
-- Generated from /STORY markdown files for public.cases table
-- ============================================================================

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_01_the_midnight_museum',
    'THE MIDNIGHT MUSEUM',
    'Investigation / Crime',
    'The Kessler Antiquities Museum, 3rd Floor Vault Gallery',
    'During a museum gala, the lights die for exactly 47 seconds — and when they return, the priceless Varga Blue Diamond is gone from an unbroken case, guarded the entire time by a man who never moved.',
    '[{"name":"Elena Voss","role":"Head Curator","alibi":"protect her professional reputation at any cost.","avatar":"🏛️"},{"name":"Marcus Reyes","role":"Head of Security","alibi":"protect his estranged daughter, who isn''t supposed to be in the building tonight.","avatar":"🛡️"},{"name":"Isabelle Chen","role":"Insurance Investigator (Meridian Underwriters)","alibi":"stop a third fraudulent claim from going through on her desk.","avatar":"🔍"},{"name":"Dominic Hart","role":"Board Chairman & Major Donor","alibi":"avoid financial and social ruin.","avatar":"👤"},{"name":"Priya Malhotra","role":"Night-Shift Restoration Intern","alibi":"be taken seriously.","avatar":"🔬"}]'::jsonb,
    'Dominic arranges the swap during a "routine cleaning."
2. ~6 months ago: The real diamond is sold privately; a flawless replica goes into the case.
3. ~1 month ago: Elena notices something off about the stone, quietly gets it re-appraised.
4. Weeks ago: Priya begins independently logging provenance inconsistencies for her paper.
5. Tonight, early evening: Dominic hires a "caterer" to fake a break-in during a blackout he''ll engineer.
6. Tonight, earlier: Marcus disables one camera so his daughter can sneak in.
7. Tonight, 9:14 PM: The blackout hits; the fake "theft" is staged.
8. Aftermath: investigation unravels the wrong crime and finds the real one underneath.',
    'Dominic Hart',
    'Extensive gambling debts; swapped the diamond for a replica 6 months prior.',
    '[{"time":"Beat 01","event":"~6 months ago: Dominic arranges the swap during a \"routine cleaning.\""},{"time":"Beat 02","event":"~6 months ago: The real diamond is sold privately; a flawless replica goes into the case."},{"time":"Beat 03","event":"~1 month ago: Elena notices something off about the stone, quietly gets it re-appraised."},{"time":"Beat 04","event":"Weeks ago: Priya begins independently logging provenance inconsistencies for her paper."},{"time":"Beat 05","event":"Tonight, early evening: Dominic hires a \"caterer\" to fake a break-in during a blackout he''ll engineer."},{"time":"Beat 06","event":"Tonight, earlier: Marcus disables one camera so his daughter can sneak in."}]'::jsonb,
    '[{"id":"ev_01_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE MIDNIGHT MUSEUM."},{"id":"ev_01_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_01_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_01_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE MIDNIGHT MUSEUM."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"~6 months ago: Dominic arranges the swap during a \"routine cleaning.\""},{"order":2,"title":"Beat 02","text":"~6 months ago: The real diamond is sold privately; a flawless replica goes into the case."},{"order":3,"title":"Beat 03","text":"~1 month ago: Elena notices something off about the stone, quietly gets it re-appraised."},{"order":4,"title":"Beat 04","text":"Weeks ago: Priya begins independently logging provenance inconsistencies for her paper."},{"order":5,"title":"Beat 05","text":"Tonight, early evening: Dominic hires a \"caterer\" to fake a break-in during a blackout he''ll engineer."},{"order":6,"title":"Beat 06","text":"Tonight, earlier: Marcus disables one camera so his daughter can sneak in."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'HARD'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_02_the_last_train',
    'THE LAST TRAIN',
    'Mystery/Thriller',
    'The Last Night Express Train, Carriage 4',
    'Four strangers board the last night train. A suitcase changes hands, a passenger seems to vanish mid-journey, and an old unsolved crime starts connecting everyone in the carriage.',
    '[{"name":"Nora Vance, 40","role":"insurance investigator riding incognito, tailing a hunch. Was the original detective on the 15-year-old case that never closed. Secret: she never stopped chasing it off the books.","alibi":"Present during the events of THE LAST TRAIN","avatar":"🔍"},{"name":"Sam Okafor, 28","role":"courier hired to carry a locked suitcase for cash, no questions asked. Doesn''t know what''s inside or where it came from.","alibi":"Present during the events of THE LAST TRAIN","avatar":"🧳"},{"name":"Priya Dutt, 33","role":"quiet woman by the window. Daughter of the man wrongly imprisoned 15 years ago; has tracked the real thief onto this train tonight to confront him.","alibi":"Present during the events of THE LAST TRAIN","avatar":"👤"},{"name":"\"Gill,\" 70","role":"dozing old passenger. Secretly the real thief from 15 years ago, now terminally ill, using tonight to return the stolen money anonymously before he dies.","alibi":"Present during the events of THE LAST TRAIN","avatar":"👤"}]'::jsonb,
    'There''s no second criminal and no real "disappearance" — Gill switched seats and coats mid-journey to slip the suitcase onto Sam''s overhead rack unseen, staging his own vanishing to avoid confrontation. He isn''t dangerous; he''s dying and trying to make it right without ever having to say so out loud.',
    'Gill',
    'Terminally ill; seeking restitution for an innocent man imprisoned 15 years ago.',
    '[{"time":"Beat 01","event":"Four strangers board separately, wary of each other."},{"time":"Beat 02","event":"Nora watches Gill from across the aisle, notebook in hand."},{"time":"Beat 03","event":"Sam boards clutching a locked suitcase, nervous."},{"time":"Beat 04","event":"Priya recognizes Gill''s face from an old photo she''s carried for years."},{"time":"Beat 05","event":"The lights flicker as the train enters a tunnel."},{"time":"Beat 06","event":"When the lights return, Gill''s seat is empty — coat still draped over it."}]'::jsonb,
    '[{"id":"ev_02_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE LAST TRAIN."},{"id":"ev_02_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_02_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_02_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE LAST TRAIN."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Four strangers board separately, wary of each other."},{"order":2,"title":"Beat 02","text":"Nora watches Gill from across the aisle, notebook in hand."},{"order":3,"title":"Beat 03","text":"Sam boards clutching a locked suitcase, nervous."},{"order":4,"title":"Beat 04","text":"Priya recognizes Gill''s face from an old photo she''s carried for years."},{"order":5,"title":"Beat 05","text":"The lights flicker as the train enters a tunnel."},{"order":6,"title":"Beat 06","text":"When the lights return, Gill''s seat is empty — coat still draped over it."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_03_the_vanishing_painting',
    'THE VANISHING PAINTING',
    'Art Mystery',
    'The Grand Metropolitan Gallery, Wing C',
    'A priceless painting vanishes from a fully alarmed museum room without tripping a single sensor — and the deeper the investigation goes, the less certain anyone is that the painting was ever real.',
    '[{"name":"Renata Osei, 45","role":"gallery director, image-conscious, has long privately suspected the piece was fake and buried the doubt.","alibi":"Present during the events of THE VANISHING PAINTING","avatar":"🏛️"},{"name":"Tomas Vale, 50","role":"insurance appraiser/investigator, methodical, skeptical of easy answers.","alibi":"Present during the events of THE VANISHING PAINTING","avatar":"🔍"},{"name":"Iris Kwan, 26","role":"junior restorer who keeps noticing brushstroke inconsistencies nobody wants to hear about.","alibi":"Present during the events of THE VANISHING PAINTING","avatar":"👤"},{"name":"Ben Okoro, 38","role":"security chief, quietly owed a decades-old favor to the Ferry family.","alibi":"Present during the events of THE VANISHING PAINTING","avatar":"🛡️"},{"name":"Aldous Ferry, 74","role":"descendant of the original painter; orchestrated tonight''s retrieval, with Ben''s help, to force the museum to acknowledge the forgery publicly.","alibi":"Present during the events of THE VANISHING PAINTING","avatar":"👤"}]'::jsonb,
    'The "original" hanging for decades was already a forgery — the real painting was sold privately by the artist''s family generations ago. Ferry, the artist''s last living descendant, learned this recently and — with Ben''s help — staged tonight''s "theft" of the forgery not for money, but to force a public reckoning and restore his family''s true history.',
    'Aldous Ferry',
    'Forcing the museum to publicly acknowledge a decades-old family forgery.',
    '[{"time":"Beat 01","event":"Guests admire the painting under gallery lights at a private viewing."},{"time":"Beat 02","event":"Motion sensors sweep the room — all green, all normal."},{"time":"Beat 03","event":"The lights briefly dim for a scheduled maintenance check — everyone assumes nothing of it."},{"time":"Beat 04","event":"Moments later, the frame is found empty — no alarm triggered."},{"time":"Beat 05","event":"Tomas arrives, immediately suspicious that no alarm went off at all."},{"time":"Beat 06","event":"Iris nervously shows Tomas old restoration photos where the brushwork looks subtly different."}]'::jsonb,
    '[{"id":"ev_03_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE VANISHING PAINTING."},{"id":"ev_03_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_03_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_03_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE VANISHING PAINTING."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Guests admire the painting under gallery lights at a private viewing."},{"order":2,"title":"Beat 02","text":"Motion sensors sweep the room — all green, all normal."},{"order":3,"title":"Beat 03","text":"The lights briefly dim for a scheduled maintenance check — everyone assumes nothing of it."},{"order":4,"title":"Beat 04","text":"Moments later, the frame is found empty — no alarm triggered."},{"order":5,"title":"Beat 05","text":"Tomas arrives, immediately suspicious that no alarm went off at all."},{"order":6,"title":"Beat 06","text":"Iris nervously shows Tomas old restoration photos where the brushwork looks subtly different."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'HARD'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_04_the_locked_room',
    'THE LOCKED ROOM',
    'Detective Mystery',
    'The Cole Family Manor, Sealed Study',
    'A man is found unconscious in a room locked from the inside, with no visible way anyone could have entered or left — and everyone in the house is hiding something.',
    '[{"name":"Desmond Cole (the \"victim\"), 45","role":"one of twin brothers; staged his own collapse for inheritance reasons.","alibi":"Present during the events of THE LOCKED ROOM","avatar":"👤"},{"name":"Julian Cole, 45","role":"Desmond''s identical twin, in on the plan.","alibi":"Present during the events of THE LOCKED ROOM","avatar":"👤"},{"name":"Marguerite Cole, 70","role":"house matriarch, holds the inheritance clause; suspicious but unaware of the twin swap.","alibi":"Present during the events of THE LOCKED ROOM","avatar":"👤"},{"name":"Priti Anand, 38","role":"jealous former business partner of Desmond, has motive but is innocent this time.","alibi":"Present during the events of THE LOCKED ROOM","avatar":"👤"},{"name":"Dr. Felix Renard, 60","role":"family doctor, the only outsider who knows about the spare key and the twins'' plan; morally conflicted about covering for it.","alibi":"Present during the events of THE LOCKED ROOM","avatar":"🔬"}]'::jsonb,
    'Desmond and Julian swapped places using a spare key Dr. Renard secretly gave them years ago. Desmond faked a collapse inside the locked room; Julian let himself in, swapped clothes/positions, and left through the same door before anyone broke it down — making it look impossible.',
    'Desmond Cole',
    'Identical twin conspiracy to trigger an inheritance clause.',
    '[{"time":"Beat 01","event":"Desmond retires to his study for the night, locking the door as always."},{"time":"Beat 02","event":"Hours later, a scream is heard; the family gathers outside the locked door."},{"time":"Beat 03","event":"The door is broken down; Desmond is found unconscious on the floor."},{"time":"Beat 04","event":"No other door, window, or vent shows any sign of entry."},{"time":"Beat 05","event":"Marguerite reveals the inheritance clause: whoever finds him first inherits control of the estate."},{"time":"Beat 06","event":"Priti is found suspiciously lingering near the study earlier that evening."}]'::jsonb,
    '[{"id":"ev_04_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE LOCKED ROOM."},{"id":"ev_04_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_04_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_04_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE LOCKED ROOM."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Desmond retires to his study for the night, locking the door as always."},{"order":2,"title":"Beat 02","text":"Hours later, a scream is heard; the family gathers outside the locked door."},{"order":3,"title":"Beat 03","text":"The door is broken down; Desmond is found unconscious on the floor."},{"order":4,"title":"Beat 04","text":"No other door, window, or vent shows any sign of entry."},{"order":5,"title":"Beat 05","text":"Marguerite reveals the inheritance clause: whoever finds him first inherits control of the estate."},{"order":6,"title":"Beat 06","text":"Priti is found suspiciously lingering near the study earlier that evening."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_05_the_wrong_suspect',
    'THE WRONG SUSPECT',
    'Psychological Mystery',
    'Blackwood Police Precinct & Interrogation Cell',
    'Every piece of evidence points to one person — almost too perfectly. The more the investigation digs, the more it looks like someone built this case on purpose.',
    '[{"name":"Farah Iqbal, 30","role":"framed ex-employee, fired shortly before the fraud was discovered, evidence stacked neatly against her.","alibi":"Present during the events of THE WRONG SUSPECT","avatar":"👤"},{"name":"Victor Damon, 48","role":"mid-level manager, real embezzler, meticulous about covering his tracks.","alibi":"Present during the events of THE WRONG SUSPECT","avatar":"👤"},{"name":"Renee Osei, 34","role":"whistleblower colleague who found irregularities early and quietly tried to protect Farah, which put her own fingerprints on the evidence trail.","alibi":"Present during the events of THE WRONG SUSPECT","avatar":"👤"},{"name":"Detective Wren, 41","role":"investigator increasingly bothered by how","alibi":"Present during the events of THE WRONG SUSPECT","avatar":"🔍"}]'::jsonb,
    'Victor embezzled the funds and carefully framed Farah after firing her, knowing she''d have no ally left to defend her. Renee discovered the fraud independently and tried to gather proof to clear Farah before going to authorities — which is why her fingerprints (literal and digital) are all over the "suspicious" trail Wren finds.',
    'Detective Miller',
    'Planting evidence to secure a conviction and cover departmental negligence.',
    '[{"time":"Beat 01","event":"Farah is escorted out of the office after a shortfall is discovered, protesting innocence."},{"time":"Beat 02","event":"Detective Wren reviews a file with evidence stacked unusually neatly against Farah."},{"time":"Beat 03","event":"Victor calmly hands over \"helpful\" documents implicating Farah."},{"time":"Beat 04","event":"Renee is spotted nervously accessing old financial files late at night."},{"time":"Beat 05","event":"Farah, at home, insists to Wren she never touched the accounts."},{"time":"Beat 06","event":"Wren finds a login timestamp that seems to prove Farah accessed the funds remotely — after she was already fired."}]'::jsonb,
    '[{"id":"ev_05_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE WRONG SUSPECT."},{"id":"ev_05_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_05_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_05_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE WRONG SUSPECT."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Farah is escorted out of the office after a shortfall is discovered, protesting innocence."},{"order":2,"title":"Beat 02","text":"Detective Wren reviews a file with evidence stacked unusually neatly against Farah."},{"order":3,"title":"Beat 03","text":"Victor calmly hands over \"helpful\" documents implicating Farah."},{"order":4,"title":"Beat 04","text":"Renee is spotted nervously accessing old financial files late at night."},{"order":5,"title":"Beat 05","text":"Farah, at home, insists to Wren she never touched the accounts."},{"order":6,"title":"Beat 06","text":"Wren finds a login timestamp that seems to prove Farah accessed the funds remotely — after she was already fired."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'HARD'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_06_the_empty_office',
    'THE EMPTY OFFICE',
    'Corporate Thriller',
    'Meridian Financial Tower, 42nd Floor',
    'A financial analyst vanishes after leaving behind one cryptic message about a mysterious account — and the deeper anyone looks, the bigger the conspiracy underneath gets.',
    '[{"name":"Leah Park, 31","role":"the \"missing\" analyst; alive, in hiding, protecting evidence of the fraud.","alibi":"Present during the events of THE EMPTY OFFICE","avatar":"👤"},{"name":"CFO Grant Whitfield, 52","role":"mastermind of the shell-account scheme, publicly the most \"concerned\" about Leah''s disappearance.","alibi":"Present during the events of THE EMPTY OFFICE","avatar":"👤"},{"name":"Ilya Novak, 27","role":"Leah''s loyal assistant, secretly relaying supplies and information to her in hiding.","alibi":"Present during the events of THE EMPTY OFFICE","avatar":"👤"},{"name":"External auditor Dana Cruz, 39","role":"brought in to investigate the disappearance, slowly uncovers the fraud instead.","alibi":"Present during the events of THE EMPTY OFFICE","avatar":"👤"}]'::jsonb,
    'Leah discovered Grant''s shell-account embezzlement scheme, tried to quietly gather proof, and fled when she realized how far Grant might go to protect it. She''s been hiding with Ilya''s help, waiting for enough evidence — and enough safety — to come forward.',
    'CFO Warren',
    'Erasing audit traces of embezzlement before morning trading.',
    '[{"time":"Beat 01","event":"Leah''s desk is found empty one morning, chair pushed in neatly, nothing disturbed."},{"time":"Beat 02","event":"A single cryptic sticky note is found: \"Ask about Meridian Holdings.\""},{"time":"Beat 03","event":"Grant publicly expresses concern, offering full cooperation to investigators."},{"time":"Beat 04","event":"Dana Cruz arrives to review Leah''s recent work logs."},{"time":"Beat 05","event":"Ilya is seen quietly leaving the building with an unusually full bag late at night."},{"time":"Beat 06","event":"Dana finds \"Meridian Holdings\" doesn''t appear in any official company filing."}]'::jsonb,
    '[{"id":"ev_06_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE EMPTY OFFICE."},{"id":"ev_06_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_06_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_06_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE EMPTY OFFICE."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Leah''s desk is found empty one morning, chair pushed in neatly, nothing disturbed."},{"order":2,"title":"Beat 02","text":"A single cryptic sticky note is found: \"Ask about Meridian Holdings.\""},{"order":3,"title":"Beat 03","text":"Grant publicly expresses concern, offering full cooperation to investigators."},{"order":4,"title":"Beat 04","text":"Dana Cruz arrives to review Leah''s recent work logs."},{"order":5,"title":"Beat 05","text":"Ilya is seen quietly leaving the building with an unusually full bag late at night."},{"order":6,"title":"Beat 06","text":"Dana finds \"Meridian Holdings\" doesn''t appear in any official company filing."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'HARD'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_07_room_404',
    'ROOM 404',
    'Supernatural Horror',
    'The Highcrest Hotel, Room 404',
    'A hotel guest is handed a key to Room 404 — a room that isn''t on any floor plan — and inside finds a perfect recreation of a childhood bedroom he doesn''t remember having.',
    '[{"name":"Adrian Cole","role":"Hotel Guest, Business Traveler","alibi":"get through the night, close the deal tomorrow, keep moving.","avatar":"🧳"},{"name":"Mrs. Leung","role":"Night-Shift Concierge","alibi":"help Adrian face what the room is showing him, without scaring him into fleeing.","avatar":"🛎️"},{"name":"Sofia Cole","role":"Adrian''s Older Sister (present only by phone)","alibi":"protect Adrian, even now, even though the protection has cost them their closeness.","avatar":"👤"}]'::jsonb,
    'the Cole family home stood where the hotel now stands.
2. 25 years ago: a faulty space heater sparks a fire at night; Teddy, age 7, dies.
3. 25 years ago: young Adrian, age 10, wrongly believes a door he left open let the fire spread.
4. Over the following decades: Sofia learns the true cause from the fire report but never corrects Adrian''s belief.
5. Present, tonight: Adrian checks into a hotel built on that same ground, alone and distracted enough for the echo to surface.',
    'The Suppressed Memory of the Space Heater Fire',
    'Unresolved grief and mistaken guilt over the loss of Teddy.',
    '[{"time":"Beat 01","event":"25 years ago: the Cole family home stood where the hotel now stands."},{"time":"Beat 02","event":"25 years ago: a faulty space heater sparks a fire at night; Teddy, age 7, dies."},{"time":"Beat 03","event":"25 years ago: young Adrian, age 10, wrongly believes a door he left open let the fire spread."},{"time":"Beat 04","event":"Over the following decades: Sofia learns the true cause from the fire report but never corrects Adrian''s belief."},{"time":"Beat 05","event":"Present, tonight: Adrian checks into a hotel built on that same ground, alone and distracted enough for the echo to surface."},{"time":"Beat 06","event":"Checking in, numb"}]'::jsonb,
    '[{"id":"ev_07_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of ROOM 404."},{"id":"ev_07_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_07_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_07_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of ROOM 404."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"25 years ago: the Cole family home stood where the hotel now stands."},{"order":2,"title":"Beat 02","text":"25 years ago: a faulty space heater sparks a fire at night; Teddy, age 7, dies."},{"order":3,"title":"Beat 03","text":"25 years ago: young Adrian, age 10, wrongly believes a door he left open let the fire spread."},{"order":4,"title":"Beat 04","text":"Over the following decades: Sofia learns the true cause from the fire report but never corrects Adrian''s belief."},{"order":5,"title":"Beat 05","text":"Present, tonight: Adrian checks into a hotel built on that same ground, alone and distracted enough for the echo to surface."},{"order":6,"title":"Beat 06","text":"Checking in, numb"}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_08_the_last_passenger',
    'THE LAST PASSENGER',
    'Supernatural Horror',
    'The Rain-slicked City Outskirts & Highway Route 9',
    'A taxi driver picks up a strange passenger in the dead of night and drives him to an abandoned house — only to realize the passenger may not be alive. Neither, perhaps, is the driver.',
    '[{"name":"Rafael, 44","role":"taxi driver, currently in a coma after tonight''s accident, unaware.","alibi":"Present during the events of THE LAST PASSENGER","avatar":"👤"},{"name":"The Passenger, unnamed","role":"calm, patient guide-figure; not malicious, here to help Rafael choose to return to life.","alibi":"Present during the events of THE LAST PASSENGER","avatar":"👤"},{"name":"Dispatcher voice, only on the radio","role":"increasingly faint and strange as the ride continues.","alibi":"Present during the events of THE LAST PASSENGER","avatar":"👤"},{"name":"The House''s Daughter, glimpsed at the end","role":"an echo tied to the abandoned house, representing a memory Rafael needs to release before he can wake.","alibi":"Present during the events of THE LAST PASSENGER","avatar":"👤"}]'::jsonb,
    'Rafael is in a coma from tonight''s crash; this ride is happening entirely in his mind. The passenger is guiding him toward accepting what happened and choosing to wake up rather than staying lost in the in-between.',
    'The Crash Memory',
    'Overcoming coma and accepting the reality of the midnight collision.',
    '[{"time":"Beat 01","event":"Rafael picks up a quiet, well-dressed passenger on an empty street."},{"time":"Beat 02","event":"The passenger gives an address that doesn''t appear on any map."},{"time":"Beat 03","event":"The radio crackles with the dispatcher''s voice, oddly distorted."},{"time":"Beat 04","event":"Streetlights flicker off one by one as the taxi passes them."},{"time":"Beat 05","event":"Rafael glances in the rearview mirror and the passenger is gone, then instantly back."},{"time":"Beat 06","event":"The passenger calmly asks Rafael if he remembers how the drive started tonight."}]'::jsonb,
    '[{"id":"ev_08_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE LAST PASSENGER."},{"id":"ev_08_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_08_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_08_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE LAST PASSENGER."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Rafael picks up a quiet, well-dressed passenger on an empty street."},{"order":2,"title":"Beat 02","text":"The passenger gives an address that doesn''t appear on any map."},{"order":3,"title":"Beat 03","text":"The radio crackles with the dispatcher''s voice, oddly distorted."},{"order":4,"title":"Beat 04","text":"Streetlights flicker off one by one as the taxi passes them."},{"order":5,"title":"Beat 05","text":"Rafael glances in the rearview mirror and the passenger is gone, then instantly back."},{"order":6,"title":"Beat 06","text":"The passenger calmly asks Rafael if he remembers how the drive started tonight."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_09_the_photograph',
    'THE PHOTOGRAPH',
    'Psychological Horror',
    'The Hawthorne Summer Cottage & Darkroom',
    'An old family photograph contains a person nobody in the family remembers — and every time someone looks at it again, something about it has changed.',
    '[{"name":"Dahlia, 36","role":"adult sibling revisiting the childhood home after a family event, first to notice the photo.","alibi":"Present during the events of THE PHOTOGRAPH","avatar":"👤"},{"name":"Marcus, 38","role":"Dahlia''s skeptical spouse, trying to find a rational explanation.","alibi":"Present during the events of THE PHOTOGRAPH","avatar":"👤"},{"name":"Grandmother Opal, 82","role":"in early memory decline, the only one who occasionally \"remembers\" the extra boy in fragments.","alibi":"Present during the events of THE PHOTOGRAPH","avatar":"👤"},{"name":"Uncle Theo (in the photo), deceased","role":"Opal''s youngest son, who died young; never discussed since.","alibi":"Present during the events of THE PHOTOGRAPH","avatar":"👤"}]'::jsonb,
    'The extra figure is Theo, a family member who died in childhood decades ago. The family collectively, silently agreed never to speak of him to spare Opal''s grief — so thoroughly that even photographs of him were quietly boxed away. The photo "changing" reflects the family''s subconscious discomfort finally surfacing; it settles once they finally say his name out loud.',
    'Forgotten Childhood Trauma',
    'A deceased sibling erased from family history.',
    '[{"time":"Beat 01","event":"Dahlia finds an old family photo while cleaning out a closet."},{"time":"Beat 02","event":"She notices an extra child in the photo she doesn''t recognize."},{"time":"Beat 03","event":"Marcus examines the photo, insisting it''s just a family friend''s kid."},{"time":"Beat 04","event":"Dahlia shows the photo to Opal, who touches the boy''s face and grows quiet."},{"time":"Beat 05","event":"Later that night, the photo appears slightly different — the boy standing a step closer."},{"time":"Beat 06","event":"Marcus tries to find the negative or digital copy, and finds none exist anywhere."}]'::jsonb,
    '[{"id":"ev_09_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE PHOTOGRAPH."},{"id":"ev_09_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_09_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_09_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE PHOTOGRAPH."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Dahlia finds an old family photo while cleaning out a closet."},{"order":2,"title":"Beat 02","text":"She notices an extra child in the photo she doesn''t recognize."},{"order":3,"title":"Beat 03","text":"Marcus examines the photo, insisting it''s just a family friend''s kid."},{"order":4,"title":"Beat 04","text":"Dahlia shows the photo to Opal, who touches the boy''s face and grows quiet."},{"order":5,"title":"Beat 05","text":"Later that night, the photo appears slightly different — the boy standing a step closer."},{"order":6,"title":"Beat 06","text":"Marcus tries to find the negative or digital copy, and finds none exist anywhere."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_10_the_empty_classroom',
    'THE EMPTY CLASSROOM',
    'College Horror',
    'St. Jude University, Old Science Wing, Room 302',
    'Students keep hearing movement and voices from a classroom that''s been locked and unused for years — and digging into why uncovers an old accident someone has spent a very long time covering up.',
    '[{"name":"Priya Nair, 21","role":"student investigator, drawn in after hearing the noises herself.","alibi":"Present during the events of THE EMPTY CLASSROOM","avatar":"🔍"},{"name":"Old janitor Solomon, 63","role":"witnessed the original accident years ago, has kept quiet out of fear for his job ever since.","alibi":"Present during the events of THE EMPTY CLASSROOM","avatar":"👤"},{"name":"Professor Halloway, 58","role":"caused the original accident through negligence, has spent years quietly maintaining the cover-up.","alibi":"Present during the events of THE EMPTY CLASSROOM","avatar":"👤"},{"name":"The echo of Nina, 20 (deceased)","role":"the student who died in the accident, her presence tied to the room.","alibi":"Present during the events of THE EMPTY CLASSROOM","avatar":"👤"}]'::jsonb,
    'Years ago, Professor Halloway ignored safety warnings about faulty lab equipment, and a student, Nina, died as a result during a late-night experiment. The department quietly filed it as "an unfortunate accident" with no real inquiry. Solomon witnessed it and has stayed silent out of fear. The room''s activity persists until the truth is finally spoken and Halloway faces real consequences.',
    'Professor Halloway',
    'Covering up laboratory negligence that caused a student disappearance.',
    '[{"time":"Beat 01","event":"Priya hears faint noises from the locked, unused classroom late at night."},{"time":"Beat 02","event":"She asks around and learns the room has been locked \"for renovations\" for years."},{"time":"Beat 03","event":"Old campus records show the room was a chemistry lab that suddenly stopped being used."},{"time":"Beat 04","event":"Priya spots Solomon quietly avoiding the hallway near that room every night."},{"time":"Beat 05","event":"She finds an old student newspaper clipping mentioning a \"lab incident\" years ago, vaguely worded."},{"time":"Beat 06","event":"Priya sneaks into the locked room and finds old lab equipment still set up, untouched."}]'::jsonb,
    '[{"id":"ev_10_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE EMPTY CLASSROOM."},{"id":"ev_10_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_10_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_10_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE EMPTY CLASSROOM."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Priya hears faint noises from the locked, unused classroom late at night."},{"order":2,"title":"Beat 02","text":"She asks around and learns the room has been locked \"for renovations\" for years."},{"order":3,"title":"Beat 03","text":"Old campus records show the room was a chemistry lab that suddenly stopped being used."},{"order":4,"title":"Beat 04","text":"Priya spots Solomon quietly avoiding the hallway near that room every night."},{"order":5,"title":"Beat 05","text":"She finds an old student newspaper clipping mentioning a \"lab incident\" years ago, vaguely worded."},{"order":6,"title":"Beat 06","text":"Priya sneaks into the locked room and finds old lab equipment still set up, untouched."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_11_the_house_that_remembers',
    'THE HOUSE THAT REMEMBERS',
    'Psychological Horror',
    'Blackwood Hollow Family Estate',
    'A family moving into a new house for a fresh start starts seeing vivid replays of past events — until they realize the house isn''t showing them the past. It''s showing them something that hasn''t happened yet.',
    '[{"name":"Nadia, 39","role":"mother, moved the family here for a fresh start after a difficult year.","alibi":"Present during the events of THE HOUSE THAT REMEMBERS","avatar":"👤"},{"name":"Farid, 41","role":"father, skeptical, wants to believe it''s just stress and unfamiliarity.","alibi":"Present during the events of THE HOUSE THAT REMEMBERS","avatar":"👤"},{"name":"Zara, 15","role":"teenage daughter, most sensitive to the visions, first to notice they don''t match any real family history.","alibi":"Present during the events of THE HOUSE THAT REMEMBERS","avatar":"👤"},{"name":"Mrs. Alvez, 70","role":"former resident/neighbor who lived here years ago and experienced the same visions herself, now trying to warn them.","alibi":"Present during the events of THE HOUSE THAT REMEMBERS","avatar":"👤"}]'::jsonb,
    'The visions aren''t replays of the past — they''re warnings of a gas leak/fire that is building toward happening very soon in the house''s old, faulty piping. The family must piece the "memory" fragments together as clues and act in time to prevent it, rather than simply trying to understand old history.',
    'The Carbon Monoxide Gas Leak',
    'Environmental hazard causing collective hallucinatory visions.',
    '[{"time":"Beat 01","event":"The family moves in, boxes everywhere, trying to feel at home."},{"time":"Beat 02","event":"Zara sees a flash of the kitchen in disarray, smoke curling near the stove, then it''s gone."},{"time":"Beat 03","event":"Farid dismisses it as exhaustion from the move."},{"time":"Beat 04","event":"Nadia finds an old photo of a previous family in a drawer, unfamiliar faces."},{"time":"Beat 05","event":"That night, Zara wakes to the same vision — this time longer, showing a flickering pilot light."},{"time":"Beat 06","event":"Nadia notices a faint gas smell near the kitchen the next morning, dismisses it as new-house smell."}]'::jsonb,
    '[{"id":"ev_11_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE HOUSE THAT REMEMBERS."},{"id":"ev_11_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_11_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_11_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE HOUSE THAT REMEMBERS."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"The family moves in, boxes everywhere, trying to feel at home."},{"order":2,"title":"Beat 02","text":"Zara sees a flash of the kitchen in disarray, smoke curling near the stove, then it''s gone."},{"order":3,"title":"Beat 03","text":"Farid dismisses it as exhaustion from the move."},{"order":4,"title":"Beat 04","text":"Nadia finds an old photo of a previous family in a drawer, unfamiliar faces."},{"order":5,"title":"Beat 05","text":"That night, Zara wakes to the same vision — this time longer, showing a flickering pilot light."},{"order":6,"title":"Beat 06","text":"Nadia notices a faint gas smell near the kitchen the next morning, dismisses it as new-house smell."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'HARD'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_12_3_13',
    '3:13',
    'Supernatural Mystery',
    'Clockwork Tower & Archive Library',
    'Every night at exactly 3:13 AM, someone receives a photograph showing an event that happens the next day. Eventually, the photographs start predicting something that seems impossible to prevent.',
    '[{"name":"Devika, 29","role":"insomniac graphic designer, the nightly recipient of the photos.","alibi":"Present during the events of 3:13","avatar":"👤"},{"name":"Aman, 34","role":"skeptical detective friend, initially convinced it''s an elaborate prank.","alibi":"Present during the events of 3:13","avatar":"🔍"},{"name":"\"The Sender\"","role":"revealed to be Devika''s own future self, somehow able to send one photo backward each night.","alibi":"Present during the events of 3:13","avatar":"👤"},{"name":"Rhea, 27","role":"Devika''s close friend, who appears in the final, \"impossible\" photo, seemingly facing her own death.","alibi":"Present during the events of 3:13","avatar":"👤"}]'::jsonb,
    'Devika''s future self is sending these photos backward through an unexplained glitch, each one depicting the next day accurately — building toward a final photo showing Rhea in mortal danger. The "impossible" photo isn''t fate; it''s a warning meant to be acted on and changed.',
    'Future Self Paradox',
    'Sending warning messages back through time to prevent catastrophe.',
    '[{"time":"Beat 01","event":"Devika wakes at exactly 3:13 AM to a photo notification with no sender listed."},{"time":"Beat 02","event":"The photo shows her own kitchen, oddly rearranged, exactly as it will look the next morning."},{"time":"Beat 03","event":"The next day, her kitchen matches the photo exactly, down to a dropped mug."},{"time":"Beat 04","event":"She shows the photo to Aman, who assumes it''s a clever prank."},{"time":"Beat 05","event":"The next 3:13 AM photo shows Aman spilling coffee on his desk."},{"time":"Beat 06","event":"It happens exactly as shown, and Aman''s skepticism cracks."}]'::jsonb,
    '[{"id":"ev_12_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of 3:13."},{"id":"ev_12_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_12_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_12_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of 3:13."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Devika wakes at exactly 3:13 AM to a photo notification with no sender listed."},{"order":2,"title":"Beat 02","text":"The photo shows her own kitchen, oddly rearranged, exactly as it will look the next morning."},{"order":3,"title":"Beat 03","text":"The next day, her kitchen matches the photo exactly, down to a dropped mug."},{"order":4,"title":"Beat 04","text":"She shows the photo to Aman, who assumes it''s a clever prank."},{"order":5,"title":"Beat 05","text":"The next 3:13 AM photo shows Aman spilling coffee on his desk."},{"order":6,"title":"Beat 06","text":"It happens exactly as shown, and Aman''s skepticism cracks."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'HARD'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_13_the_letter_never_sent',
    'THE LETTER NEVER SENT',
    'Romance / Mystery',
    'The Old Corner Bookstore & Archives',
    'Restoring her late grandmother''s bookstore, Meera finds a sealed letter tucked inside an old book — addressed to her, written twelve years ago, in handwriting she''d know anywhere.',
    '[{"name":"Meera Kapoor, 35 (23 in flashbacks)","role":"Bookstore Archivist","alibi":"finish restoring her grandmother''s shop; avoid reopening old wounds.","avatar":"👤"},{"name":"Arjun Rao, 36 (24 in flashbacks)","role":"Architect, based abroad (present only by phone/video, then in person)","alibi":"has spent twelve years believing Meera read his letter and chose silence — and has built a life around that assumption.","avatar":"👤"},{"name":"Dev","role":"Meera''s Bookstore Co-worker and Close Friend (present day)","alibi":"support Meera through whatever the letter brings, even knowing it might cost him his own chance.","avatar":"👤"}]'::jsonb,
    'Arjun writes the letter the night before his flight.
2. 12 years ago: he gives it to Kavita at the bookstore counter to pass to Meera.
3. 12 years ago: Kavita hides it inside a book instead of delivering it.
4. 12 years ago: young Meera waits for an explanation that never comes; young Arjun waits for a reply that never comes.
5. Over 12 years: both move on with careful, guarded lives, never fully closing the door.
6. Present: Kavita passes away; Meera restores the shop and finds the letter.',
    'Grandmother Kavita',
    'Protective maternal instinct to shield granddaughter from long-distance heartbreak.',
    '[{"time":"Beat 01","event":"12 years ago: Arjun writes the letter the night before his flight."},{"time":"Beat 02","event":"12 years ago: he gives it to Kavita at the bookstore counter to pass to Meera."},{"time":"Beat 03","event":"12 years ago: Kavita hides it inside a book instead of delivering it."},{"time":"Beat 04","event":"12 years ago: young Meera waits for an explanation that never comes; young Arjun waits for a reply that never comes."},{"time":"Beat 05","event":"Over 12 years: both move on with careful, guarded lives, never fully closing the door."},{"time":"Beat 06","event":"Present: Kavita passes away; Meera restores the shop and finds the letter."}]'::jsonb,
    '[{"id":"ev_13_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE LETTER NEVER SENT."},{"id":"ev_13_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_13_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_13_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE LETTER NEVER SENT."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"12 years ago: Arjun writes the letter the night before his flight."},{"order":2,"title":"Beat 02","text":"12 years ago: he gives it to Kavita at the bookstore counter to pass to Meera."},{"order":3,"title":"Beat 03","text":"12 years ago: Kavita hides it inside a book instead of delivering it."},{"order":4,"title":"Beat 04","text":"12 years ago: young Meera waits for an explanation that never comes; young Arjun waits for a reply that never comes."},{"order":5,"title":"Beat 05","text":"Over 12 years: both move on with careful, guarded lives, never fully closing the door."},{"order":6,"title":"Beat 06","text":"Present: Kavita passes away; Meera restores the shop and finds the letter."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_14_11_11',
    '11:11',
    'Romance / Fantasy',
    'City Central Clock Tower & Transit Hub',
    'Two strangers keep crossing paths at exactly 11:11 — never realizing they''re living the same day from opposite directions in time.',
    '[{"name":"Maya, 27","role":"living the day normally, forward.","alibi":"Present during the events of 11:11","avatar":"👤"},{"name":"Kabir, 29","role":"living the same day backward, his \"morning\" is everyone else''s evening.","alibi":"Present during the events of 11:11","avatar":"👤"},{"name":"The Fortune-teller / Observer, unnamed","role":"notices the pattern, nudges them without ever fully explaining it.","alibi":"Present during the events of 11:11","avatar":"👤"},{"name":"Nikhil, 30","role":"mutual friend who unknowingly introduces/connects them without realizing they''ve already \"met\" from opposite ends of the day.","alibi":"Present during the events of 11:11","avatar":"👤"}]'::jsonb,
    'Maya and Kabir are each stuck reliving the same day — Maya moving forward through it, Kabir moving backward — and 11:11 is the sole moment each day their timelines intersect. Neither realizes the other is experiencing time differently until clues (his "goodbyes" happening before her "hellos," etc.) pile up. Recognizing the pattern together and choosing to meet on purpose breaks the loop.',
    'The Time Loop Synchronicity',
    'Two souls caught in complementary halves of a shared day.',
    '[{"time":"Beat 01","event":"Maya bumps into Kabir at a café exactly at 11:11, both checking their phones at the same time."},{"time":"Beat 02","event":"Kabir says \"goodbye, see you again\" as though they''ve already met many times — Maya is confused."},{"time":"Beat 03","event":"Maya''s day continues normally — errands, work, calls."},{"time":"Beat 04","event":"Kabir''s day, unknown to Maya, is unfolding in reverse — his morning is full of \"endings.\""},{"time":"Beat 05","event":"Nikhil, a mutual friend, mentions to Maya that \"Kabir talks about you all the time\" — confusing, since they just met."},{"time":"Beat 06","event":"At 11:11 the next check-in, Maya and Kabir cross paths again, him seeming to \"recognize\" a version of her she hasn''t shown yet."}]'::jsonb,
    '[{"id":"ev_14_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of 11:11."},{"id":"ev_14_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_14_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_14_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of 11:11."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Maya bumps into Kabir at a café exactly at 11:11, both checking their phones at the same time."},{"order":2,"title":"Beat 02","text":"Kabir says \"goodbye, see you again\" as though they''ve already met many times — Maya is confused."},{"order":3,"title":"Beat 03","text":"Maya''s day continues normally — errands, work, calls."},{"order":4,"title":"Beat 04","text":"Kabir''s day, unknown to Maya, is unfolding in reverse — his morning is full of \"endings.\""},{"order":5,"title":"Beat 05","text":"Nikhil, a mutual friend, mentions to Maya that \"Kabir talks about you all the time\" — confusing, since they just met."},{"order":6,"title":"Beat 06","text":"At 11:11 the next check-in, Maya and Kabir cross paths again, him seeming to \"recognize\" a version of her she hasn''t shown yet."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'HARD'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_15_two_tickets',
    'TWO TICKETS',
    'Romance / Drama',
    'Grand Western Railway Station & Platform 7',
    'Two unused train tickets from ten years ago, found tucked in an old coat, tell the story of two people who planned to run away together — and never made it to the platform at the same time.',
    '[{"name":"Asha (past, age 24) / present-day, age 34","role":"one half of the couple, now living a quiet, separate life.","alibi":"Present during the events of TWO TICKETS","avatar":"👤"},{"name":"Rohan (past, age 26) / present-day, age 36","role":"the other half, also moved on, never fully explaining why he \"gave up.\"","alibi":"Present during the events of TWO TICKETS","avatar":"👤"},{"name":"Asha''s older sister, Meenal (past)","role":"intercepted the message about the delayed train out of fear for Asha''s safety, never told anyone.","alibi":"Present during the events of TWO TICKETS","avatar":"👤"},{"name":"Kiara","role":"present day","alibi":"Present during the events of TWO TICKETS","avatar":"👤"}]'::jsonb,
    'Rohan''s train was delayed and he sent a message to Asha through Meenal explaining he''d be late — Meenal, worried the elopement was a mistake, never passed it on. Asha, waiting and reading his absence as rejection, left without him. Rohan arrived to find her gone and assumed the same. Both moved on, each quietly believing the other changed their mind.',
    'Meenal',
    'Concealing the missed train telegram due to personal envy.',
    '[{"time":"Beat 01","event":"Kiara finds two unused train tickets, same date, tucked in an old coat pocket while cleaning out a closet."},{"time":"Beat 02","event":"She notices both tickets are for the same night, ten years ago, same destination."},{"time":"Beat 03","event":"Kiara asks her Aunt Asha about them; Asha goes quiet and changes the subject."},{"time":"Beat 04","event":"Flashback: young Asha packs a small bag late at night, nervous and excited."},{"time":"Beat 05","event":"Flashback: young Rohan, at a station, checks his watch as a delay announcement plays."},{"time":"Beat 06","event":"Flashback: Rohan hastily asks Meenal"}]'::jsonb,
    '[{"id":"ev_15_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of TWO TICKETS."},{"id":"ev_15_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_15_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_15_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of TWO TICKETS."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Kiara finds two unused train tickets, same date, tucked in an old coat pocket while cleaning out a closet."},{"order":2,"title":"Beat 02","text":"She notices both tickets are for the same night, ten years ago, same destination."},{"order":3,"title":"Beat 03","text":"Kiara asks her Aunt Asha about them; Asha goes quiet and changes the subject."},{"order":4,"title":"Beat 04","text":"Flashback: young Asha packs a small bag late at night, nervous and excited."},{"order":5,"title":"Beat 05","text":"Flashback: young Rohan, at a station, checks his watch as a delay announcement plays."},{"order":6,"title":"Beat 06","text":"Flashback: Rohan hastily asks Meenal"}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_16_the_last_dance',
    'THE LAST DANCE',
    'Romance / Emotional',
    'The Moonlight Ballroom & Grand Theatre',
    'A retired dancer receives an invitation to perform one more time at a theatre closed for years — signed by someone who has been dead for a decade.',
    '[{"name":"Elena, 58","role":"retired dancer, the invitation''s recipient, hasn''t performed in over a decade.","alibi":"Present during the events of THE LAST DANCE","avatar":"🎭"},{"name":"Viktor (deceased)","role":"Elena''s former dance partner and great love, arranged this from beyond through legal means before he died.","alibi":"Present during the events of THE LAST DANCE","avatar":"👤"},{"name":"Mr. Basu, 71","role":"the theatre''s longtime caretaker, entrusted with fulfilling Viktor''s final wish.","alibi":"Present during the events of THE LAST DANCE","avatar":"👤"},{"name":"Priya, 24","role":"a young dancer who idolizes Elena and unknowingly becomes the final piece of the promise, helping her get back on stage.","alibi":"Present during the events of THE LAST DANCE","avatar":"🎭"}]'::jsonb,
    'Ten years ago, knowing he was dying, Viktor arranged with a lawyer and Mr. Basu for this exact invitation to be mailed to Elena exactly a decade later — timed to when he believed she''d finally be ready to dance again. It''s not a ghost story; it''s a carefully engineered final act of devotion.',
    'Viktor',
    'A posthumous farewell dance orchestrating his partner’s closure.',
    '[{"time":"Beat 01","event":"Elena receives an old-fashioned, hand-addressed invitation in the mail."},{"time":"Beat 02","event":"She recognizes the elegant handwriting immediately — Viktor''s."},{"time":"Beat 03","event":"Elena visits the long-closed theatre, dust sheets over the seats."},{"time":"Beat 04","event":"Mr. Basu, the caretaker, greets her, clearly expecting her arrival."},{"time":"Beat 05","event":"Elena asks how the invitation was sent if Viktor has been gone ten years."},{"time":"Beat 06","event":"Flashback: young Elena and Viktor rehearsing together on this same stage, clearly in love."}]'::jsonb,
    '[{"id":"ev_16_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of THE LAST DANCE."},{"id":"ev_16_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_16_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_16_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of THE LAST DANCE."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Elena receives an old-fashioned, hand-addressed invitation in the mail."},{"order":2,"title":"Beat 02","text":"She recognizes the elegant handwriting immediately — Viktor''s."},{"order":3,"title":"Beat 03","text":"Elena visits the long-closed theatre, dust sheets over the seats."},{"order":4,"title":"Beat 04","text":"Mr. Basu, the caretaker, greets her, clearly expecting her arrival."},{"order":5,"title":"Beat 05","text":"Elena asks how the invitation was sent if Viktor has been gone ten years."},{"order":6,"title":"Beat 06","text":"Flashback: young Elena and Viktor rehearsing together on this same stage, clearly in love."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'NORMAL'
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
    difficulty = EXCLUDED.difficulty;

INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) VALUES (
    'story_17_across_the_platform',
    'ACROSS THE PLATFORM',
    'Romance / Slice of Life',
    'Subway Station Overpass & Platform 2',
    'Two strangers keep seeing each other across a railway platform for months, never speaking — until years later, a forgotten photograph reveals they''d already met once, and hit it off completely, without either realizing it was the same person.',
    '[{"name":"Tara, 30 (present) / 24 (party flashback)","role":"one half of the pair, a regular commuter.","alibi":"Present during the events of ACROSS THE PLATFORM","avatar":"👤"},{"name":"Devesh, 32 (present) / 26 (party flashback)","role":"the other half, sees her across the platform most mornings.","alibi":"Present during the events of ACROSS THE PLATFORM","avatar":"👤"},{"name":"Simran","role":"mutual friend (present and past)","alibi":"Present during the events of ACROSS THE PLATFORM","avatar":"👤"},{"name":"Rahul","role":"Tara''s current coworker","alibi":"Present during the events of ACROSS THE PLATFORM","avatar":"👤"}]'::jsonb,
    'Tara and Devesh already met once, years earlier, at Simran''s party — talked for hours, really connected — but lost touch before ever exchanging real contact information, and each simply forgot the other''s face enough that years of platform glances never triggered recognition, until an old photo from that party resurfaces.',
    'Missed Connections',
    'Hesitation and fear of rejection across the railway platform.',
    '[{"time":"Beat 01","event":"Tara notices a familiar-feeling stranger across the platform, though she can''t place why."},{"time":"Beat 02","event":"Devesh notices her too, glancing over just as the train arrives."},{"time":"Beat 03","event":"This happens again the next week, same platform, same time."},{"time":"Beat 04","event":"Rahul, Tara''s coworker, teases her about \"the platform guy\" she''s mentioned before."},{"time":"Beat 05","event":"Devesh, meanwhile, mentions to a friend he keeps seeing \"someone who feels familiar\" but can''t place why."},{"time":"Beat 06","event":"Months pass; the glances continue, but neither has worked up the nerve to speak."}]'::jsonb,
    '[{"id":"ev_17_1","title":"Physical Clue","detail":"Initial physical anomaly found at the scene of ACROSS THE PLATFORM."},{"id":"ev_17_2","title":"Contradictory Statement","detail":"A testimony that conflicts directly with documented records."},{"id":"ev_17_3","title":"Key Document","detail":"Paperwork or digital log proving the timeline discrepancies."},{"id":"ev_17_4","title":"The Decisive Proof","detail":"The conclusive piece that exposes the hidden truth of ACROSS THE PLATFORM."}]'::jsonb,
    '[{"order":1,"title":"Beat 01","text":"Tara notices a familiar-feeling stranger across the platform, though she can''t place why."},{"order":2,"title":"Beat 02","text":"Devesh notices her too, glancing over just as the train arrives."},{"order":3,"title":"Beat 03","text":"This happens again the next week, same platform, same time."},{"order":4,"title":"Beat 04","text":"Rahul, Tara''s coworker, teases her about \"the platform guy\" she''s mentioned before."},{"order":5,"title":"Beat 05","text":"Devesh, meanwhile, mentions to a friend he keeps seeing \"someone who feels familiar\" but can''t place why."},{"order":6,"title":"Beat 06","text":"Months pass; the glances continue, but neither has worked up the nerve to speak."}]'::jsonb,
    'Early rumors pointed to external intruders, but internal records contradict the surface appearances.',
    'Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.',
    'EASY'
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
    difficulty = EXCLUDED.difficulty;

-- Legacy compatibility alias for midnight_museum_heist
INSERT INTO public.cases (
    id, title, genre, setting, description, characters, truth, culprit, motive,
    timeline, evidence, clues, misleading_info, distorter_objective, difficulty
) SELECT 'midnight_museum_heist', title, genre, setting, description, characters, truth, culprit, motive,
         timeline, evidence, clues, misleading_info, distorter_objective, difficulty
  FROM public.cases WHERE id = 'story_01_the_midnight_museum'
  ON CONFLICT (id) DO NOTHING;

