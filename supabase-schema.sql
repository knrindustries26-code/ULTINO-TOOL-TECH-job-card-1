-- ULTINO TOOL TECH - shared cloud sync table
-- Run this once in the Supabase SQL Editor.
create table if not exists public.sync_records (
  record_type text not null check (record_type in ('customer','item','job')),
  record_id text not null,
  data jsonb not null,
  updated_at timestamptz not null,
  deleted_at timestamptz null,
  device_id text not null,
  primary key (record_type, record_id)
);

alter table public.sync_records enable row level security;

-- All phones used for this workshop sign in to the same Supabase account.
-- Therefore every authenticated workshop device can read/write the shared records.
drop policy if exists "workshop members can read sync records" on public.sync_records;
create policy "workshop members can read sync records"
on public.sync_records for select to authenticated using (true);

drop policy if exists "workshop members can insert sync records" on public.sync_records;
create policy "workshop members can insert sync records"
on public.sync_records for insert to authenticated with check (true);

drop policy if exists "workshop members can update sync records" on public.sync_records;
create policy "workshop members can update sync records"
on public.sync_records for update to authenticated using (true) with check (true);

create index if not exists sync_records_updated_at_idx on public.sync_records(updated_at);


-- Enable database-change events for automatic multi-phone refresh.
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'sync_records'
  ) then
    alter publication supabase_realtime add table public.sync_records;
  end if;
end $$;
