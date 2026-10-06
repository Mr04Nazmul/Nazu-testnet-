-- NAZU Testnet database starter
-- Run this in Supabase SQL Editor.
create table if not exists public.users (
  id uuid primary key default gen_random_uuid(),
  wallet_address text unique not null,
  points bigint not null default 0,
  node_status text not null default 'offline' check (node_status in ('offline','online')),
  uptime_seconds bigint not null default 0,
  last_heartbeat timestamptz,
  eligible boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.airdrop_allocations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  points_snapshot bigint not null,
  allocation_amount numeric(38,18) not null default 0,
  status text not null default 'pending',
  created_at timestamptz not null default now()
);

create table if not exists public.admin_audit_logs (
  id uuid primary key default gen_random_uuid(),
  admin_user_id uuid,
  action text not null,
  target_user_id uuid,
  old_value jsonb,
  new_value jsonb,
  created_at timestamptz not null default now()
);

alter table public.users enable row level security;
alter table public.airdrop_allocations enable row level security;
alter table public.admin_audit_logs enable row level security;

-- IMPORTANT:
-- Do not create broad public write policies.
-- Production writes should go through authenticated backend/Edge Functions.
-- Never expose a service-role/secret key in index.html.
