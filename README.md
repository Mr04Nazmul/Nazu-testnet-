# NAZU Testnet Starter v1

This package contains:
- `index.html` — public NAZU testnet UI with wallet connection and local demo node/points.
- `admin.html` — admin dashboard UI shell.
- `supabase-schema.sql` — starter database schema for users, airdrop allocations and audit logs.

## Important
The browser node/points in `index.html` are DEMO/LOCAL logic. They are not a secure production rewards engine.

For production:
1. Connect the frontend to Supabase using a publishable/anon key only.
2. Put privileged operations in Supabase Edge Functions or another backend.
3. Verify node heartbeats server-side.
4. Add anti-abuse/rate limits and audit logs.
5. Keep service-role/secret keys server-side.
6. Decide and document any future token/airdrop rules before distributing tokens.

## Deploy
Upload `index.html` to the root of your GitHub repository and enable GitHub Pages.
