# Tin Shotti: acceptance test cases

**112 test cases for the MVP and 10 for v2.** P0 blocks launch, P1 is fixed before the closed test, P2 if time allows.


These are product-level acceptance tests for the Tin Shotti MVP: what a parent or child does, and what must happen. They are not unit tests. Use them three ways:

- **Week 1 (spike):** run section 1 first. Its results decide the gate at the end of week 2.
- **Weeks 2–5 (build):** each capability has its own section. A feature is done when its P0 cases pass on every test phone.
- **Week 5 (closed test):** rerun all P0 and P1 cases on the families' own phones where possible.

**Priority:** **P0** blocks launch · **P1** fix before the closed test · **P2** fix if time allows.
**Targets marked "target"** are my guesses, set before testing so the results can't be argued away. Change them only with a reason written next to them.
**Proposed** means a product decision I've suggested but not confirmed. Raise it if it's wrong.

---

## 0 · Test setup

| Item | What to use |
|---|---|
| Phones | 4 low-cost Android phones, one each from **Xiaomi/Redmi, Samsung, Realme, Tecno**, covering Android 10 to 15. Confirm the models in week 1 from what parents actually own (open question in the competitor scan). At least one must have **curved edges** (add a fifth phone if none of the four does), and run the light tests with both **gesture navigation** and **3-button navigation**. |
| Phone state | Factory battery saver **on** for one run and **off** for another. A normal parent's phone: WhatsApp, Facebook, bKash, YouTube and YouTube Kids installed. |
| Child apps | YouTube Kids (Approved content only on) and one learning app. |
| Tools | A stopwatch or screen recording with on-screen time (to measure how fast blocked apps are covered); Firebase DebugView or a network proxy (privacy checks); a 7-year-old's curiosity (escape tests: ask a colleague's child, with the parent present). |
| Record | Phone model, Android version, battery-saver state, pass/fail, and a screen recording for every fail. |

---

## 1 · Spike: can a Play Store app keep a child inside allowed apps? (week 1, gate)

The riskiest assumption in the plan. Build the smallest guard that works, then run these on all 4 phones, once with **Usage access + overlay** and once with an **Accessibility service**. The Accessibility route needs a Play declaration, an in-app disclosure and the user's consent (Play Console Help 10964491).

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| S-01 | A session is running with only YouTube Kids allowed | The child opens Facebook from the home screen | The "grown-up app" cover appears within **1 second** (target) in 19 of 20 tries; Facebook content is never usable | P0 |
| S-02 | A session is running | The child opens a blocked app from the recent-apps list | Covered as in S-01 | P0 |
| S-03 | A session is running | The child pulls down the notification shade and taps a WhatsApp notification | WhatsApp is covered as in S-01 | P0 |
| S-04 | A session is running | The child opens quick settings and taps Settings (gear) | Settings is covered | P0 |
| S-05 | A session is running | The child tries split screen or a floating window with a blocked app | The blocked app is covered or closed | P0 |
| S-06 | A session is running | The child long-presses home or power to open the Assistant and says "open Facebook" | Facebook is covered | P1 |
| S-07 | A session is running | The child restarts the phone | After restart the guard is back **before** the child can use a blocked app, **or** this is recorded as a known escape (feeds the "mid-session failure" decision) | P0 (to measure) |
| S-08 | A session is running, battery saver **on** | 45 minutes pass with YouTube Kids playing | The guard is still active at minute 45 (S-01 still passes) | P0 |
| S-09 | A session is running, screen locked for 10 minutes | The phone is unlocked | The guard is still active | P0 |
| S-10 | A session is running | A phone call comes in and is answered, then ended | The call works; after the call the guard is still active | P0 |
| S-11 | Guard running for 45 min | Measure battery used versus YouTube Kids alone | Extra drain under **5%** of battery (target) | P1 |
| S-12 | Both guard routes tested | Compare S-01 to S-11 results | Write one line per route: pass/fail per phone, cover time, escapes found. **Decision input for the gate.** | P0 |
| S-18 | Time light running; Android 12, 13, 14 and 15; both guard routes | The child taps, scrolls and uses video controls, including at the screen edges | Every touch reaches the allowed app; nothing is blocked or ignored. If Usage access + overlay fails, record it: the light may need the Accessibility route (PRD A-10) | P0 |
| S-19 | Phones with round corners, a camera cutout, curved edges, and one in a thick case; gesture and 3-button navigation | A session runs in portrait, then a full-screen video in landscape | Every part of the light is visible: it follows the round corners, is not hidden by the cutout or the curved glass, and the status bar and navigation bar don't cover it (with Usage access + overlay they are drawn on top of it, PRD V16). It turns with the screen | P0 |
| S-20 | A session is running; WhatsApp, Messenger and bKash installed | A WhatsApp message and a bKash notification arrive, then a phone call comes in | No pop-up, nothing in the shade or on the lock screen, no Reply button. The phone call rings and can be answered. After the session, Do not disturb is back to what the parent had before. Repeat on Android 15 (the app's own Do not disturb rule, PRD V17) | P0 |
| S-21 | A session is running | The child opens quick settings and taps Airplane mode, Wi-Fi, mobile data and the flashlight, then long-presses a tile | Record which tiles work: a known MVP limit (PRD HND-27). A long-press that opens Settings is covered. 999 still connects in airplane mode | P1 |
| S-22 | A cloned WhatsApp is installed (Xiaomi Dual apps, Realme App Clone, Tecno App Twin, Samsung Dual Messenger) | The child opens the clone from the home screen, recent apps and its notification | Covered as in S-01, with both guard routes | P0 |
| S-23 | A session is running | The child long-presses the Tin Shotti icon (or any icon) and taps Uninstall, App info or Pause app, or drags the icon to Uninstall | The dialog or App info is covered; Tin Shotti stays installed and the session continues | P0 |
| S-24 | Messenger chat heads on; a WhatsApp chat bubble open (Android 11+) | A session starts with a chat head or bubble on the screen, and the child taps it | The chat is covered or closed, and the grown-up cover stays on top of the chat head | P0 |

**Play review checklist (spike question c), answer in writing:**

| ID | Question | Answer needed |
|---|---|---|
| S-13 | Which foreground-service type does the guard need, and what does Play ask for it? | Type + declaration text |
| S-14 | `isMonitoringTool = child_monitoring` (Play Console Help 12955211): what else does it require? | List |
| S-15 | Does Play treat Tin Shotti as an app for children (stricter rules for SDKs such as Firebase)? Which target audience do we declare? | Decision + reason |
| S-16 | If we use an Accessibility service: draft the in-app disclosure and consent screen, and record the review video Play asks for | Draft + video |
| S-17 | How long did review take for a similar test build (internal or closed track)? | Days |

**Gate rule:** if S-01, S-03, S-08 or S-09 fails on 2 or more of the 4 phones with both routes, the guard fails → ship the fallback (guided setup of the free tools).

---

## 2 · Capability 3: guided setup in Bangla (built in week 2, needed in every version)

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| G-01 | First launch, phone language Bangla or English | The app opens | Bangla is the default; a বাংলা/English switch is visible on the first screen | P0 |
| G-02 | First launch | The parent picks the child's age band (3–5, 6–8 or 9–14) and daily time | A default daily time is suggested by age (proposed: 30 / 45 / 60 min); for 9–14 the parent can allow up to two more apps, never a grown-up app; no name, photo or sign-up is asked for | P0 |
| G-02b | First launch | The parent turns on the optional active window and sets 6–10 pm | The window is saved and shown on the Hand over screen; leaving it off means minutes can be used any time that day | P0 |
| G-03 | Setup, allowed-apps step | The screen loads | YouTube Kids is pre-ticked if installed; installed learning apps are listed; WhatsApp, IMO, Messenger, Facebook, bKash, YouTube, Settings and Play Store are listed as blocked and **cannot** be ticked as allowed; phone calls and 999 are shown as "always on", with one line saying WhatsApp, IMO and Messenger calls can't be answered during a session | P0 |
| G-04 | YouTube Kids is not installed | The parent reaches the allowed-apps step | The app explains why and offers a button to its Play Store page; setup can continue without it | P1 |
| G-05 | Setup, PIN step | The parent enters a 4-digit PIN twice | PIN saved; mismatched entries show "PINs don't match" and clear both fields | P0 |
| G-06 | Setup, PIN step | The parent enters 0000, 1234 or 1111 | A gentle warning ("easy to guess") with the option to keep it (proposed) | P2 |
| G-07 | Setup, permissions step on a Xiaomi phone | The screen loads | It shows **Xiaomi**-specific pictures and the steps for each permission the guard needs, including Autostart | P0 |
| G-08 | Same, on Samsung, Realme and Tecno | The screen loads | Brand-specific steps for each; an unknown brand gets generic Android steps | P0 |
| G-09 | A permission is switched on in system settings | The parent comes back to the app | That row flips to ON without restarting setup | P0 |
| G-10 | All permissions ON | The parent taps **Test it now** | The app tries to open a blocked app and confirms it was covered; shows "Protected · test passed" with the time | P0 |
| G-11 | One permission still OFF, or the test fails | The parent taps **Test it now** | "Not protected yet" with the one fix for their brand; **Give to child stays disabled** | P0 |
| G-12 | 5 parents who have never seen the app (closed test) | They complete setup unaided | Median time **3 minutes or less** (target); note where each one hesitates | P1 |
| G-13 | Setup half-finished | The parent closes the app and reopens it later | Setup resumes at the same step; nothing already done is lost | P1 |
| G-14 | Any parent screen | TalkBack is on | Every button and ON/OFF state is read out in the selected language | P2 |
| G-15 | Setup, guard test passed | The light check runs | The light goes round the edge once in about 5 seconds, then "আলোটা পুরোটা দেখা যাচ্ছে? / Can you see all of the light?" **Yes** goes to Protected. **Part is hidden** moves the light 8 dp in and runs it again (up to 24 dp). The choice is used in every session | P0 |
| G-16 | Setup done, a new thick case on the phone | The parent enters the PIN and runs the light check again | Same as G-15; the new position is used from the next session | P1 |
| G-17 | Setup, permissions step | The screen loads, then Do not disturb access is left OFF | A "Do not disturb" row with the brand's pictures; with it OFF, **Test it now** fails as in G-11 and **Give to child** stays off | P0 |

---

## 3 · Capability 1: one-tap handover with allowed apps

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| H-01 | Setup done, guard test passed | The parent opens the app | The Hand over screen shows: protected status, minutes left today (and the window, if set), minute choices no larger than what's left, and **Give to child** | P0 |
| H-02 | Hand over screen | The parent taps **Give to child** | The guard test runs again silently; if it passes, YouTube Kids opens and the session starts. **2 taps total** from opening the app | P0 |
| H-03 | Hand over screen, guard test fails (e.g. battery saver killed the service) | The parent taps **Give to child** | No session starts; "Not protected yet" with the fix; the app never shows "protected" when it isn't | P0 |
| H-04 | A session is running | The child opens an allowed app other than YouTube Kids | It opens normally | P0 |
| H-05 | A session is running | The child opens any app not on the allowed list | Grown-up cover: icon, "এটা বড়দের অ্যাপ / This one is for grown-ups", voice line in Bangla, **Back to my videos** button | P0 |
| H-06 | Grown-up cover showing | The child taps **Back to my videos** | Returns to the last allowed app | P0 |
| H-07 | A session is running | A blocked app is opened 5 times in a row | Covered every time; the count is stored on the phone only (shown in today's summary) | P1 |
| H-08 | A session is running | A link inside an allowed app tries to open a blocked app or the browser | The target is covered | P1 |
| H-09 | A session is running | The parent needs the phone urgently (incoming call, or they take it back) | A parent exit is reachable from the session notification and the Tin Shotti icon: PIN, then the session ends as "stopped early" | P0 |
| H-10 | A session is running in a learning app with in-app purchases | The child taps a "Buy" or "Unlock" button | The Google Play payment screen is covered; nothing can be bought | P1 |

---

## 4 · Capability 2: the time light and a kind ending (the core bet)

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| T-01 | A 20-minute session starts (inside the window, if set) | The child watches | A soft line of light (the time light) starts at the top-left corner and grows clockwise along the screen edge. The child sees no numbers. The light never covers the app's content | P0 |
| T-01b | A 20-minute session | 10 minutes pass, then 20 | At 10 min the light has covered half the edge (to the bottom-right corner) and its head is Violet; at 20 min it is back at the top-left corner and Electric | P0 |
| T-02 | Time light visible | The child taps, swipes or scrolls anywhere, including on the light | Every touch goes to the app below; the light can't be moved, closed or tapped | P0 |
| T-03 | 2 minutes left | The timer reaches 2:00 | A chime and a short Bangla voice line play once | P0 |
| T-04 | Phone on silent or vibrate | 2 minutes left | The light pulses slowly; no sound overrides silent mode (proposed) | P1 |
| T-05 | The timer reaches 0 | Time's up | The light closes the loop and glows along the whole edge for 1 second; then a full-screen "Well done! দারুণ! আজকের সময় শেষ" with the Tin Shotti mark, 3 seconds of confetti and the voice covers everything; video audio stops | P0 |
| T-05b | Android "Remove animations" is on | Time's up | The end screen shows the confetti still, not falling; nothing flashes | P1 |
| T-06 | Time's up screen | The child taps anything except the **+5 min** button and the PIN boxes | Nothing changes; no way back into apps | P0 |
| T-07 | Time's up screen | The parent enters the correct PIN and taps **Done** | The session ends as "on time"; the phone returns to normal with every app usable | P0 |
| T-08 | Time's up screen, +5 not used today | The child taps **+5 min** (no PIN) | 5 more minutes start; the time light runs a new short loop; the voice says this is today's one +5. If the session then ends on time, it counts as `plus5_child` | P0 |
| T-08b | The child's +5 is already used today (this session or an earlier one) | Time's up again | No +5 button. Parent PIN, then **+2 min** (once) or **Done**. +2 starts 2 minutes and counts as `plus2_parent` | P0 |
| T-08c | +5 and +2 both used today | Time's up | Only the PIN boxes and **Done**, with "আজ আর সময় নেই · No more time today". Nothing on this screen can add time, even with the correct PIN | P0 |
| T-08d | Any time, the parent opens settings with the PIN | **Add time today** → 10 min | Today's daily time grows by 10 min only; the next `session_started` has `added_time = true`; the end screen still shows no extra button | P1 |
| T-09 | Time's up screen | A wrong PIN is entered 5 times | A 30-second wait before the next try (proposed); the child can't brute-force it quickly | P1 |
| T-10 | Parent forgot the PIN | They tap "Forgot PIN?" | They confirm with the phone's own screen lock (PIN, pattern or fingerprint), then set a new PIN. A child who doesn't know the phone's lock can't reset it | P0 |
| T-10b | The phone has no screen lock set | The parent taps "Forgot PIN?" | The app explains that a phone screen lock is needed to reset the PIN, and setup asks for one up front (developer to confirm behaviour) | P1 |
| T-10c | The child knows the phone's pattern | During a session the child taps "Forgot PIN?", draws the pattern and sets a new PIN | The reset works (it is the phone's own lock), but the next Hand over screen shows "পিন বদলানো হয়েছে · The PIN was reset at 8:14 pm, during a session" | P1 |
| T-10d | A phone with a fingerprint sensor | The parent uses a fingerprint on the PIN screen | Accepted. The phone's own screen-lock PIN or pattern is not accepted on this screen | P2 |
| T-11 | A session is running with 12 min left | The screen is turned off for 10 min, then on | The timer **paused**: still 12 min left. Off-screen time never counts | P0 |
| T-12 | A session is running | The phone restarts | Depends on S-07. Proposed: if the guard returns, the session resumes with the remaining time; if not, the parent sees "the last session ended early: the phone restarted" at the next handover | P1 |
| T-13 | Session ended | The parent looks at the Time's up / summary screen | "Today: 20 min, 1 app blocked. Saved on this phone only." | P1 |
| T-13b | Three evenings in a row ended without the child's +5 | The parent opens the summary | "৩ সন্ধ্যা +৫ ছাড়া · 3 evenings in a row without +5". No minutes are given as a reward; on the next +5 the count starts again | P2 |
| T-14 | A session is running | The parent pulls down the notification shade | "তিন সত্যি চালু আছে · Tin Shotti is on" shows the minutes left, a progress bar, Pause and Stop. Both ask for the PIN before they act; a child who taps them sees only the PIN screen | P0 |
| T-15 | A session is running with 12 min left | The parent taps Pause and enters the PIN | Time stops; a calm break screen covers all apps; the light stops and dims; only the PIN resumes; after 10 min paused, 12 min are still left and the daily time is unchanged | P1 |
| T-16 | A session is running | The session notification is swiped away (Android 14+ allows it), or the child taps the Tin Shotti icon | The notification comes back (developer to confirm what Android allows); the icon always opens the parent's PIN screen | P1 |
| T-17 | 3 children aged 3–8, closed test, parent present | Near the end of a session, ask: "How much time is left?" | Each child points to the gap in the light or says "almost done". Note any child the ending surprises (PRD A-09) | P1 |
| T-18 | A session in YouTube Kids on a mostly white screen, then a dark full-screen video | Look at the light at 10%, 50% and 90% | Each colour (Lilac, Violet, Electric) is easy to see on both. If not, add the thin Ink line (PRD TMR-02d) and test again | P1 |

---

## 4b · Daily time and the active window

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| W-01 | Daily time 45 min, no window | Two handovers of 15 and 20 min on the same day | The Hand over screen then shows 10 min left; minute choices above 10 are not offered | P0 |
| W-02 | Window 6–10 pm | The parent opens the app at 4 pm | **Give to child** is off, with "Opens at 6 pm" | P0 |
| W-03 | Window 6–10 pm, a session started at 9:50 pm with 20 min chosen | The clock reaches 10 pm | The session ends with the kind ending ("Well done", PIN to clear); counted as `window_closed`; neither +5 nor +2 is offered after the window closes (proposed) | P0 |
| W-04 | Window 6–10 pm, 25 min unused at 10 pm | The next day starts | Unused minutes are gone; the new day starts from the full daily time | P0 |
| W-05 | No window set | Midnight passes during a session | Proposed: the session continues to its end, and the new day's time starts afterwards. Test the chosen rule | P1 |
| W-06 | A session is running | The screen is off for most of the window | Off-screen time is not counted (T-11), but unused minutes still end with the window | P0 |
| W-07 | A session is running | Someone changes the phone's clock or time zone (Settings is blocked, so test from the parent's side) | Time left is not reset or extended by a clock change; note what happens | P1 |
| W-08 | Daily time 45 min, all 45 used, inside the window | Time's up; the child taps **+5 min**, then at the next time's up the parent gives **+2 min** | Both work past the daily cap (PRD WIN-08). Today shows 52 min used and 0 min left, never a negative number | P0 |

## 4c · Calls and emergency

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| E-01 | A session is running | A phone call comes in | It rings and can be answered; after the call the child returns to the allowed app and the guard is still active (see S-10) | P0 |
| E-02 | A session is running, or the Time's up screen is showing | Someone uses Android's own emergency call (lock screen or power menu) and dials 999 | The emergency dialer is never covered and the call connects | P0 |
| E-03 | A session is running | The child opens the Phone app to call someone | Proposed for the MVP: the Phone app is a grown-up app (covered); only incoming calls and emergency calls work. Calls to family contacts are a v2 all-day-mode feature | P1 |
| E-04 | A session is running | The child opens any grown-up app, then tries to add it to the allowed list | Impossible: the allowed list is only reachable behind the parent's PIN, and grown-up apps can't be ticked there (G-03) | P0 |
| E-05 | A session is running | A WhatsApp or IMO call comes in | The call screen is covered (with Do not disturb it may also be silent). The parent can stop the session with the PIN while it still rings (target: under 10 seconds). Answering app calls inside a session is v2 (V-09) | P1 |

---

## 5 · When the guard fails, and how we recover

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| F-01 | A session is running | The OS kills the guard (simulate: force-stop from adb, or battery saver) | Recorded on the phone; at the next handover the parent sees "Protection stopped during the last session" plus the fix | P0 |
| F-02 | Between sessions | The parent switches off a needed permission | The next **Give to child** tap fails the test (H-03) and shows which permission to turn back on | P0 |
| F-03 | App updated from Play during a session | The update installs | No crash; the guard returns, or F-01 applies | P1 |
| F-04 | Battery at 5% during a session | The phone enters extreme battery saving | F-01 applies; no false "protected" status anywhere | P1 |
| F-05 | No internet | Setup, handover and a full session | Everything works offline; analytics events queue and send later | P0 |

---

## 6 · Privacy and trust (the promise in the PDF)

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| P-01 | Firebase DebugView or a network proxy | A full setup and 3 sessions are run | The **only** events sent are `setup_finished`, `session_started` and `session_ended` (with `reason` = on_time / plus5_child / plus2_parent / early / window_closed; `session_started` carries only `added_time`), plus a random install ID. **No** app names, video titles, screen content, child age, or advertising ID | P0 |
| P-02 | Analytics SDK configured | Check the build config | Advertising ID collection is off | P0 |
| P-03 | Any screen | Look through the whole app | No field asks for the child's name, photo, school or birthday | P0 |
| P-04 | Several sessions done | Check app storage | Session history (apps opened, blocked counts) exists only on the phone, and only the event list in P-01 leaves it | P0 |
| P-05 | The app is uninstalled | Check the phone | All local data is gone | P1 |
| P-06 | Play Console | Fill in the Data safety form | It matches P-01 exactly | P0 |
| P-07 | A session is running | The child looks at the screen | The time light is always visible to the child (no secret monitoring mode exists) | P0 |

---

## 7 · Language, children who can't read, accessibility

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| L-01 | All 4 phones | Open every Bangla screen | Bangla renders correctly (no broken conjuncts or vowel signs) with the app's bundled font | P0 |
| L-02 | A 4-year-old who can't read | They hit the grown-up cover and the Time's up screen | They understand from the icon, voice and button alone (watch 3 children in the closed test; note confusion) | P1 |
| L-03 | Child screens | Measure buttons | Touch targets at least 48 dp (Android's guideline) | P1 |
| L-04 | English selected | Walk through every screen | No Bangla left untranslated, and the reverse | P1 |
| L-05 | A 4-year-old who can't read, closed test | Time's up with +5 not used | They understand the **+5 min** button from its look and the voice line ("আরও ৫ মিনিট, আজ একবার") and know it works once. Note any child who expects a second +5 | P1 |

---

## 8 · Metric plumbing (so the two-week decision can be made)

| ID | Given | When | Then | Pri |
|---|---|---|---|---|
| M-01 | A test install | Setup finished, then 3 sessions on 3 different days | The dashboard can compute "families who finished setup in week 1 and started 3+ sessions in week 2" from the events alone | P0 |
| M-02 | Same | Sessions end on time, with the child's +5, with the parent's +2, stopped early, and when the window closed; one session uses Add time today | Each `session_ended.reason` and `added_time` is counted correctly, so the guard ("days with +2 or Add time today") can be computed | P0 |
| M-03 | Reinstall | The parent uninstalls and reinstalls | Counted as a new install (a known limit of anonymous IDs; note it in the analysis) | P2 |

---

## 9 · v2 ideas: tests to write later (not part of the MVP)

| ID | Idea | First test to write | Pri |
|---|---|---|---|
| V-01 | All-day mode: apps by time of day | Given a school-hours schedule, when the child opens a game at 10 am, then it is covered; at 5 pm it opens | v2 |
| V-02 | All-day mode: daily total across schedules | Given a 2-hour daily total, all allowed use across the day adds up and stops at 2 hours | v2 |
| V-03 | All-day mode: calls to family | Only the parent-approved contacts and 999 can be called; incoming calls from others follow the parent's setting | v2 |
| V-04 | All-day mode: device owner | On a factory-fresh phone, provisioning sets Tin Shotti as device owner; lock-task mode then keeps the child in allowed apps across restarts | v2 |
| V-05 | Safe browser: allowed sites only | A site not on the list is blocked with the grown-up cover; emergency pages always open | v2 |
| V-06 | Safe browser: logging the child can see | Every visit is logged for the parent, and the browser always shows the child that it is logged | v2 |
| V-07 | Safe browser: AI summary | No browsing data leaves the phone until the parent gives explicit consent on a dedicated screen; turning consent off stops it | v2 |
| V-08 | Profiles for siblings | Given two children with their own daily time, when one child's time runs out, the other child's time is unchanged (needs a way to tell them apart without names or photos) | v2 |
| V-09 | App calls during a session | Given a WhatsApp or IMO call during a session, the child sees "Give the phone to a grown-up" instead of the grown-up cover (needs a reliable call signal, not only the app name) | v2 |
| V-10 | A reward for evenings without +5 (e.g. +20 min after 3) | Only after parents ask for it in research: given 3 evenings without +5, the parent is offered (never auto-given) a one-time +20. Risk to test first: it teaches that screen time is the prize (PRD section 6.2) | v2 |

## Bug report template

```
Title: [ID] short description (e.g. S-03 WhatsApp opens from notification on Redmi)
Phone / Android / battery saver: Redmi ___ / Android 13 / on
Guard route: Usage access + overlay | Accessibility service
Steps: 1. … 2. … 3. …
Expected (from the test case): …
Actual: …
Video: link
How often: x of y tries
```

## Launch checklist (definition of done)

- [ ] All **P0** cases pass on all 4 test phones (or the failure is accepted in writing with a reason)
- [ ] Spike results (S-12) and Play answers (S-13 to S-17) written up before the end of week 2
- [ ] P1 cases pass, or are listed as known issues for the closed test
- [ ] Data safety form matches P-01
- [ ] Closed-test notes from G-12, L-02 and W-03 written up, plus two questions for parents: does your child know the phone's pattern (T-10c), and do two children share this phone in the evening (PRD section 16)?

*Sources: the numbered list in the assessment PDF. I talked informally with a few parents I know; that is not research. Every "target" and "proposed" item is a guess to be confirmed.*

## Change log

**v3.4 (4 Nov):** a third age band, 9–14: the same handover, and the parent can allow up to two more apps (G-02, PRD SET-04a). The time light follows Nagorik's palette: Lilac → Violet → Electric (T-01b, T-18). PRD 1.4.

**v3.3 (3 Nov, extra time):** the child gets one **+5 min** a day without the PIN; after that the parent has one **+2 min** with the PIN; then the end screen offers no more time. Real exceptions go through **Add time today** in settings (PIN). Days without +5 are shown to the parent in the summary, never paid out in minutes. New: T-08b, T-08c, T-08d, T-13b, L-05, V-10. Changed: T-06, T-08, W-03, W-08, P-01, M-02. PRD 1.3.

**v3.2 (3 Nov, edge-case review):** the time light must stay visible on curved edges, under a thick case and next to the system bars, and the parent gets a light check in setup that moves it in. Other apps' notifications are silenced with Do not disturb during a session. Cloned apps, the uninstall menu, chat heads and in-app payments are covered. "+5 min" now works after the daily time runs out. A PIN reset during a session is shown to the parent. App calls (WhatsApp, IMO, Messenger) are a stated MVP limit. New: S-20 to S-24, G-15 to G-17, H-10, T-10c, T-10d, T-18, W-08, E-05, V-08, V-09. Changed: test setup, S-19 (now P0), G-03.

**v3.1 (3 Nov):** the floating timer bubble is gone. The child sees a time light along the screen edge (no numbers); the parent sees the minutes, Pause and Stop in a session notification; the end screen has confetti. New or changed: S-18, S-19, T-01, T-01b, T-02, T-04, T-05, T-05b, T-14 to T-17, H-09, P-07.

**v3 decisions:** the timer pauses when the screen is off; an optional active window (e.g. 6–10 pm) where unused minutes are lost; grown-up apps can never be allowed; incoming calls and 999 always work; a forgotten PIN is reset with the phone's own screen lock. All-day mode and a safe browser are v2 ideas (section 9 above), not MVP.
