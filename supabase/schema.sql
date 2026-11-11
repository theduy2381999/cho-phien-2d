-- Chợ Phiên 2D: database schema for optional player accounts.
-- Run this once in the Supabase dashboard: SQL Editor > New query > paste > Run.

create table if not exists public.profiles (
  id           uuid primary key references auth.users (id) on delete cascade,
  display_name text        not null check (char_length(display_name) between 1 and 16),
  color        smallint    not null default 0 check (color  between 0 and 6),
  status       smallint    not null default 0 check (status between 0 and 7),
  pet          smallint    not null default 0 check (pet    between 0 and 6),
  avatar       jsonb       not null,
  updated_at   timestamptz not null default now()
);

-- Row level security: the public anon key in index.html can only touch your own row.
alter table public.profiles enable row level security;

drop policy if exists "profiles: read own"   on public.profiles;
drop policy if exists "profiles: insert own" on public.profiles;
drop policy if exists "profiles: update own" on public.profiles;
drop policy if exists "profiles: delete own" on public.profiles;

create policy "profiles: read own"   on public.profiles for select using (auth.uid() = id);
create policy "profiles: insert own" on public.profiles for insert with check (auth.uid() = id);
create policy "profiles: update own" on public.profiles for update using (auth.uid() = id) with check (auth.uid() = id);
create policy "profiles: delete own" on public.profiles for delete using (auth.uid() = id);
