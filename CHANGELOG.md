# Changelog

## Unreleased

- **Cheaper models**: `model=haiku`, or any Anthropic-compatible API (OpenRouter, DeepSeek, Kimi, GLM, MiniMax, Qwen) with the new `llm_base_url` input and an `LLM_API_KEY` secret ([scripts/llm_env.sh](scripts/llm_env.sh)). The findings depend on how well the model reads screenshots and reasons: [docs/cheaper-models.md](docs/cheaper-models.md).
- **Improvement report**: with [briefs/improve.md](briefs/improve.md), each persona uses the app once to reach its goal, then lists what to change first, by area and impact. SUMMARY.md starts with the goals reached, the actions and the scores, then the improvements.
- **Compare two versions**: `scripts/compare.py` puts two runs of the same personas side by side (two branches, two builds): goals reached, actions, scores, issues seen on one version only, improvements by area ([docs/compare-versions.md](docs/compare-versions.md)).
- **README**: shorter, with a "What it does" list of the uses and one table of the LocalSend, AnkiDroid and Flutter runs. Their screenshots, findings and commands moved to [docs/examples.md](docs/examples.md), in the five languages of the README.
- **Reproduce a bug report**: the `bug_report` input takes an issue (`owner/repo#123` or its URL) or the steps as text. Each agent follows it on its own device with [briefs/reproduce.md](briefs/reproduce.md) and answers yes, no or unclear, with screenshots; the summary starts with a table of the devices where it happens.
- **Standalone skill**: `skills/mobile-agent-testers/` is the plugin's setup skill as a plain Agent Skill, for skill catalogs and agents without Claude Code plugins. A test keeps the two copies identical.

## 0.1.0 (19 November 2026)

The first tagged version: everything behind the [LocalSend, AnkiDroid and Flutter runs](docs/runs/).

- **One workflow** builds your app (Flutter, React Native, Expo, native Kotlin and Swift, Kotlin Multiplatform, Capacitor, .NET MAUI) or downloads a prebuilt APK or .app, then gives each persona its own Android emulator or iOS Simulator on GitHub Actions.
- **20 ready-made personas**: 14 languages, right to left, tablets, Android 10 to 15, text from small to iOS's largest accessibility size. `all` runs them all, `none` skips a platform.
- **Accessibility check** on every screen the agents read: controls with no name and touch targets under 48 dp (Android) or 44 pt (iOS).
- **Encrypted results**: reports, screenshots, build logs and optional screen recordings (`record_video`) are encrypted with your public key before upload. Analytics hosts are blocked inside the phones.
- **One summary**: `scripts/collect.sh <run id>` decrypts everything and groups the reports that describe the same bug into `runs/<id>/SUMMARY.md`.
- **Tests** run offline on every push, on Python 3.9 and 3.13: accessibility check, persona matrix, `personas.json`, summary, and the encrypted results path from the runner to `collect.sh`.
- **Public app repos** need no token; private ones take a read-only `SOURCE_REPO_TOKEN`.
- **Claude Code plugin**: `/plugin marketplace add pierridotite/mobile-agent-testers` sets it up for your app.

Already made a copy from the template? Take `.github/workflows/agent-testers.yml`, `scripts/`, `AGENT_BRIEF.md` and `personas.json` from this version.
