# Brief: LegalHub — Sign In on the development demo build

Read `AGENT_BRIEF.md` first: its tools, rules and final report all apply.

This is a credential-free build of LegalHub (Flutter, `development` flavor, no
`.env`, fake gateways). Do not look for a backend or a real account.

## How to get in

- Onboarding may appear on first launch. Swipe/tap through it to reach **Sign In**
  (heading "Welcome Back").
- On Sign In, tap the demo shortcut: an outlined button with a flask/science icon.
  Label by locale:
  - Arabic: `المتابعة بجلسة تجريبية`
  - Turkish: `Demo oturumuyla devam et`
  - English: `Continue with demo session`
  - A small notice under it says "Development-only demo session" (localized).
- If the demo shortcut is NOT visible on this device, that is a finding: screenshot
  the whole Sign In screen and report it as blocked. Do not guess a workaround.
- Never tap Google or Apple, never open Create Account, never enter real credentials.
  Typing into the email field with Turkish characters is fine for a layout check,
  but do not submit the form.

## Goal

Reach Sign In, enter the demo session, then inspect the first screen after it.
Stop there unless you still have budget. Your persona's own goal applies where
relevant, but getting past Sign In is the priority.

## What to check on this screen

1. RTL mirroring (Arabic): heading, fields, back arrow, icons, alignment and the
   order of the social buttons. Arrows should point toward the reading direction.
2. Turkish glyphs: type `İşğü ŞİĞ` in the email field and look for missing glyphs,
   clipping or overflow.
3. Large text (200%): heading, field labels, demo button, notice and the
   "Forgot password?" target — nothing cut off or hidden under the keyboard.
4. Tablet: does the auth layout use the space or stretch too wide? Content should
   stay within a sensible max width.
5. Touch targets: back arrow, demo button, "Forgot password?" and the two social
   buttons (48 dp / 44 pt).
6. The demo notice must stay readable and the shortcut must not read like a real
   production sign-in.

## Out of scope

Supabase/backend, real OAuth, payments, AI research, video consultations, legal
corpus text, account deletion.
