# ULTINO TOOL TECH — Cloud Sync Setup

## What is implemented

- Local-first IndexedDB storage remains active.
- Every customer/item/job save is queued for cloud upload.
- Queue retries when the phone reconnects to the internet.
- Automatic sync runs on reconnect and periodically while the app is open.
- Job photos are included in cloud records and JSON backups.
- Cloud deletes use tombstones so stale devices do not normally resurrect deleted records.
- The first sync pulls newer cloud records before uploading older local records.

## One-time Supabase setup

1. Create a Supabase project.
2. In Supabase SQL Editor, run `supabase-schema.sql`.
3. Copy the Project URL and anon/public key.
4. In the app open Backup & Database Storage → Real Cloud Sync — Multiple Phones.
5. Enter the Project URL and anon/public key.
6. Create/sign in to one workshop account.
7. Sign in with that same account on every phone/PC that should share the data.

## Important

The frontend must only use the Supabase **anon/public** key. Never put a Supabase service-role/secret key into this app.

The same workshop account is used on all devices by this implementation. If Supabase email confirmation is enabled, confirm the account email before signing in on the other devices.
