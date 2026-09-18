-- ============================================================================
-- INKBOUND — STORY DYNAMIC WORDING & CONNECTED NARRATIVE SCHEMA MIGRATION
-- Enhances cases, case_characters, and case_events to support:
-- 1. 120 Complete Connected Stories (story_001 to story_120)
-- 2. Dynamic Wording Variations (intros, clues, hints, statements, reveals)
-- 3. Red Herrings, Wrong Theories vs Correct Theory, Multiple Endings
-- ============================================================================

-- 1. Enhance public.cases table
ALTER TABLE public.cases
  ADD COLUMN IF NOT EXISTS main_mystery TEXT,
  ADD COLUMN IF NOT EXISTS character_secrets JSONB DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS red_herrings JSONB DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS theories JSONB DEFAULT '{"wrongTheories": [], "correctTheory": ""}'::jsonb,
  ADD COLUMN IF NOT EXISTS final_reveal TEXT,
  ADD COLUMN IF NOT EXISTS endings JSONB DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS dynamic_wording JSONB DEFAULT '{"intros": [], "reveals": [], "hints": []}'::jsonb;

-- 2. Enhance public.case_characters table
ALTER TABLE public.case_characters
  ADD COLUMN IF NOT EXISTS personality TEXT,
  ADD COLUMN IF NOT EXISTS what_they_say TEXT,
  ADD COLUMN IF NOT EXISTS what_they_hide TEXT,
  ADD COLUMN IF NOT EXISTS connection TEXT,
  ADD COLUMN IF NOT EXISTS what_they_know TEXT,
  ADD COLUMN IF NOT EXISTS what_they_do_not_know TEXT,
  ADD COLUMN IF NOT EXISTS statement_variations JSONB DEFAULT '[]'::jsonb;

-- 3. Enhance public.case_events table
ALTER TABLE public.case_events
  ADD COLUMN IF NOT EXISTS event_key TEXT,
  ADD COLUMN IF NOT EXISTS what_happens TEXT,
  ADD COLUMN IF NOT EXISTS what_to_discover TEXT,
  ADD COLUMN IF NOT EXISTS clue TEXT,
  ADD COLUMN IF NOT EXISTS evidence TEXT,
  ADD COLUMN IF NOT EXISTS wrong_answers JSONB DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS correct_answer TEXT,
  ADD COLUMN IF NOT EXISTS accepted_guesses JSONB DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS hint TEXT,
  ADD COLUMN IF NOT EXISTS next_event_key TEXT,
  ADD COLUMN IF NOT EXISTS dynamic_wording JSONB DEFAULT '{"descriptions": [], "hints": [], "clues": []}'::jsonb;

-- 4. Create performance indexes for case queries
CREATE INDEX IF NOT EXISTS idx_cases_genre ON public.cases(genre);
CREATE INDEX IF NOT EXISTS idx_cases_difficulty ON public.cases(difficulty);
CREATE INDEX IF NOT EXISTS idx_case_characters_case_id ON public.case_characters(case_id);
CREATE INDEX IF NOT EXISTS idx_case_events_case_id ON public.case_events(case_id);
CREATE INDEX IF NOT EXISTS idx_case_events_order_index ON public.case_events(case_id, order_index);

-- 5. Ensure Row Level Security (RLS) policies permit public read for games
ALTER TABLE public.cases ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.case_characters ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.case_events ENABLE ROW LEVEL SECURITY;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE tablename = 'cases' AND policyname = 'Public cases are readable by all'
  ) THEN
    CREATE POLICY "Public cases are readable by all" ON public.cases
      FOR SELECT USING (true);
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE tablename = 'case_characters' AND policyname = 'Public case characters are readable by all'
  ) THEN
    CREATE POLICY "Public case characters are readable by all" ON public.case_characters
      FOR SELECT USING (true);
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE tablename = 'case_events' AND policyname = 'Public case events are readable by all'
  ) THEN
    CREATE POLICY "Public case events are readable by all" ON public.case_events
      FOR SELECT USING (true);
  END IF;
END $$;
