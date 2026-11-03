# Tin Shotti: product requirements (MVP)

> **Who this is for.** This PRD is written for AI coding agents and for lookups: every rule has an ID, a priority and a test, so an agent can build and check one requirement at a time.
> **People should start with the workbook, `tin-shotti-product-map.xlsx`** (same folder). It shows the product breadth-first: one tab per level (capabilities, then screens, then requirements, then test cases), so you see the whole product at a glance and go deeper only where you need to. Reading this file top to bottom means jumping between sections and IDs.

| | |
|---|---|
| Version | 2.0, 4 November 2026 (v1.4, the full 765-line version in Simplified Technical English, is available on request) |
| Author | Abraar Masud Nafiz |
| Built from | The assessment PDF (v7) and the decisions in it |
| Test cases | `test-cases.md` / `test-cases.csv` in this folder (113 MVP + 10 v2); also the "Test cases" tab of the workbook |
| Labels | `[V1]`–`[V17]`: checked against the source in section 11. `[ASSUMPTION]`: not verified. Talks with a few parents were informal, so every claim about parents is an assumption. |
| Priority | P0: blocks the Play Store launch. P1: done before the closed test (week 5). P2: if time allows. |

## Agent rules

1. Build only what has an ID here. If something is missing or two rules conflict, stop and ask; don't invent behaviour.
2. A requirement is done when its tests in `test-cases.md` pass on all 4 test phones.
3. Never break the three promises (section 7) or the 999 rule (HND-16).
4. Never send data that PRV-01 to PRV-03 don't list.

---

## 1 Product in one paragraph

When a parent hands their Android phone to a child of 3 to 8 years, Tin Shotti lets only the apps the parent picked open (YouTube Kids by default), shows the time left as a light round the screen edge (no numbers), and ends every session with the same kind end screen. Incoming calls and 999 always work. Setup takes about 3 minutes, in Bangla. One Android developer with an AI coding platform builds the MVP in six weeks.

## 2 Problem and users

- **Moment:** the evening handover of the parent's own phone. It holds three of the four parent comments in the brief: what the child watches next (F1), the evening argument (F2), and setup that was too hard (F3). The fourth, "why pay?", is section 9.
- **Parent:** owns an Android phone (Xiaomi, Realme, Tecno or Samsung) [ASSUMPTION]; reads Bangla, maybe not English [ASSUMPTION]; sets up once, then only hands over.
- **Child:** 3 to 8 years; many 3 to 5-year-olds can't read [ASSUMPTION], so child screens use pictures, sound and a Bangla voice. 9 to 14-year-olds on a shared phone get the same app plus up to two more allowed apps (SET-04a).
- **Not in the MVP:** a phone the child owns (v2), iPhone and iPad, Android below 10.
- **Could make the choice wrong:** A-01, the child mostly watches on a tablet or the TV (section 10).

## 3 Scope

### 3.1 In the MVP

| ID | Capability | What it does | Requirement groups |
|---|---|---|---|
| F1 | Handover with allowed apps | "Give to child" starts a session. Only allowed apps open; any other app gets the grown-up cover. Calls and 999 always work; other apps' notifications are silenced. | HND |
| F2 | Time the child can see, and a kind ending | Daily time and an optional window. The time light runs round the edge. At 0 the end screen shows; the child's own +5 once a day, then the parent's +2 once (PIN), then no more. | TMR, WIN |
| F3 | Guided setup in Bangla | Brand-specific pictures, "Test it now", a light check. A forgotten PIN is reset with the phone's screen lock. | SET |
| — | Failure handling, privacy, language, performance, platform | Applies across F1 to F3 | GRD, PRV, LNG, PRF, PLT |

### 3.2 Not in the MVP

| Left out | Why |
|---|---|
| Our own content filter | YouTube Kids filters, free, in Bangladesh [V1]; one bad video would cost the parent's trust. |
| Remote parent dashboard | Needs accounts, a backend and data about the child. |
| An "approved videos only" player (rejected alternative) | YouTube API policies forbid a fee for embedded videos and require working player links [V6]; YouTube Kids has approved-only mode, free [V2]. |
| iPhone and iPad | One developer, six weeks; most families use Android [ASSUMPTION]. |
| Child profiles | They need a way to tell children apart, and the app asks for no name or photo (SET-02). Asked in the closed test. |
| Minutes as a reward | Teaches that screen time is the prize; "celebrate finishing, not using". The summary shows evenings without +5 and the parent decides (TMR-15a). |
| Answering app calls (WhatsApp, IMO) in a session | The guard sees only the app name, so it can't tell a call from a chat [ASSUMPTION]. The parent stops the session with the PIN (HND-25). |

### 3.3 Version 2 ideas

All-day mode for a phone the child owns (device owner and lock task mode [V4]); a safe browser (off by default, visible logging); an AI summary for parents (needs consent and a new privacy statement). Each roughly doubles the guard and privacy work, so the MVP proves the handover first.

## 4 Results we want

| ID | Result | Measured by |
|---|---|---|
| R-01 | During a session the child can open only allowed apps. | Spike tests S-01 to S-12 |
| R-02 | Sessions stop at the time the parent set; the phone, not the parent, says so. | Closed test, and the +2 guard in section 9.3 |
| R-03 | A parent finishes setup in Bangla in 3 minutes or less. | G-12 |
| R-04 | 40% or more of families start 3+ sessions in week 2 after launch. | Section 9.3 |

---

## 5 Functional requirements

### 5.1 F3: Setup (SET)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| SET-01 | The app must show Bangla text by default. The first screen must have a "বাংলা / English" switch. | P0 | G-01 |
| SET-02 | The app must not have a field for the name, the photo, the school, or the birth date of the child. | P0 | G-02, P-03 |
| SET-03 | The parent must select an age group and a daily time. | P0 | G-02 |
| SET-04 | The app must recommend a daily time for each age group: 30 minutes for 3 to 5 years, 45 minutes for 6 to 8 years, and 60 minutes for 9 to 14 years [ASSUMPTION]. | P0 | G-02 |
| SET-04a | For the age group 9 to 14 years, the parent can allow a maximum of two more apps. Grown-up apps (SET-08, SET-09) must stay blocked. | P1 | G-02 |
| SET-05 | The parent can set an optional time window, for example 6 pm to 10 pm. The "Hand over" screen must show the time window. | P0 | G-02b |
| SET-06 | If YouTube Kids is installed, the app must select it as a permitted app. | P0 | G-03 |
| SET-07 | The app must show the learning apps on the phone. The parent can select them as permitted apps. | P0 | G-03 |
| SET-08 | The app must show these grown-up apps with a red "X": YouTube, Facebook, Messenger, WhatsApp, IMO, bKash, Settings, Play Store, and the Phone app. | P0 | G-03 |
| SET-09 | The app must not let the parent select a grown-up app as a permitted app. | P0 | G-03, E-04 |
| SET-10 | The app must show incoming calls and the emergency number 999 as "Always on". The app must also tell the parent that the child cannot answer app calls during a session (HND-25). | P0 | G-03 |
| SET-11 | If YouTube Kids is not installed, the app must tell the parent the cause. The app must show a link to the Play Store page of YouTube Kids. | P1 | G-04 |
| SET-12 | If YouTube Kids is not installed, the parent can continue the setup. | P1 | G-04 |
| SET-13 | The parent must enter a 4-digit PIN two times. If the two entries are different, the app must show "The PINs are not the same". Then, the app must remove the entries from the two fields. | P0 | G-05 |
| SET-14 | If the PIN is 0000, 1111, or 1234, the app must tell the parent that the PIN is easy to find. The parent can keep the PIN. | P2 | G-06 |
| SET-15 | The app must identify the brand of the phone. For Xiaomi, Samsung, Realme, and Tecno, the app must show pictures and steps for that brand. | P0 | G-07, G-08 |
| SET-16 | For a different brand, the app must show the general Android steps. | P0 | G-08 |
| SET-17 | When the parent sets a permission to ON in the Android settings and comes back, the app must show that permission as ON. The app must not start the setup again. | P0 | G-09 |
| SET-18 | When the parent taps "Test it now", the app must do the guard test. | P0 | G-10 |
| SET-19 | If the guard test is satisfactory, the app must show "Protected · test passed" and the time of the test. | P0 | G-10 |
| SET-20 | If a permission is OFF or the guard test is not satisfactory, the app must show "Not protected yet". The app must also show the one repair for that phone brand. | P0 | G-11 |
| SET-21 | While the guard test is not satisfactory, the "Give to child" button must not be available. | P0 | G-11, H-03 |
| SET-22 | If the parent closes the app during the setup, the app must open at the same step the next time. The app must keep all completed steps. | P1 | G-13 |
| SET-23 | In the closed test, 5 parents who did not see the app before must do the setup. Their median time must be 3 minutes or less [ASSUMPTION]. | P1 | G-12 |
| SET-24 | If the phone has no screen lock, the setup must tell the parent to set a screen lock. Cause: the parent uses the screen lock to set a new PIN (TMR-11). | P1 | T-10b |
| SET-25 | After a satisfactory guard test, the app must do the light check. The time light goes around the edge of the screen one time in approximately 5 seconds. Then the app asks: "আলোটা পুরোটা দেখা যাচ্ছে? / Can you see all of the light?" | P0 | G-15 |
| SET-26 | If the parent taps "একটা অংশ ঢাকা / Part is hidden", the app must move the time light 8 dp in from the edge. Then the app must do the light check again. The maximum is 24 dp. The app must keep the position for all sessions. | P0 | G-15 |
| SET-27 | Behind the PIN, the parent can do the light check again, for example after the parent puts a new case on the phone. | P1 | G-16 |
| SET-28 | The "Switch on protection" screen must include the "Do not disturb" access (HND-20). The guard test must make sure that this access is ON. | P0 | G-17 |

### 5.2 F1: Handover with permitted apps (HND)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| HND-01 | After the setup, the app must open on the "Hand over" screen. | P0 | H-01 |
| HND-02 | The "Hand over" screen must show the protection condition, the minutes available for the day, the time window (if the parent set it), and the "Give to child" button. | P0 | H-01 |
| HND-03 | The minute selections (10, 15, 20) must not be more than the minutes available for the day. | P0 | H-01, W-01 |
| HND-04 | When the parent taps "Give to child", the app must do the guard test again. | P0 | H-02 |
| HND-05 | If the guard test is satisfactory, YouTube Kids must open and the session must start. From the start of the app, the parent must do a maximum of 2 taps. | P0 | H-02 |
| HND-06 | If the guard test is not satisfactory, the session must not start. The app must show "Not protected yet" and the repair. | P0 | H-03, F-02 |
| HND-07 | The app must not show "Protected" when the guard does not operate. | P0 | H-03, F-04 |
| HND-08 | During a session, the child can open all permitted apps. | P0 | H-04 |
| HND-09 | During a session, when the child opens a grown-up app, the guard must show the cover screen in 1 second or less. This must occur in 19 of 20 tries [ASSUMPTION]. | P0 | S-01, H-05 |
| HND-10 | The guard must show the cover screen for grown-up apps that the child opens from these locations: the home screen, the recent apps, the notification shade, and the quick settings. | P0 | S-01 to S-04 |
| HND-11 | The guard must show the cover screen when the child opens a grown-up app in a split screen or in a floating window. | P0 | S-05 |
| HND-12 | The guard must show the cover screen when the child opens a grown-up app with Google Assistant, or with a link in a permitted app. | P1 | S-06, H-08 |
| HND-13 | The cover screen must show a picture, the text "এটা বড়দের অ্যাপ / This one is for grown-ups", a Bangla voice, and the "Back to my videos" button. | P0 | H-05 |
| HND-14 | When the child taps "Back to my videos", the last permitted app must open again. | P0 | H-06 |
| HND-15 | During a session, the phone must receive incoming calls. After the call, the guard must operate again. | P0 | S-10, E-01 |
| HND-16 | The guard must not show the cover screen on top of the Android emergency dialer. A call to 999 must connect during a session and on the end screen [V13]. | P0 | E-02 |
| HND-17 | During a session, the Phone app is a grown-up app. Only incoming calls and emergency calls operate. | P1 | E-03 |
| HND-18 | The parent can stop a session at all times from the session notification or from the Tin Shotti icon. The parent enters the PIN, and the session stops with the result "early". | P0 | H-09 |
| HND-19 | The app must count the grown-up apps that the child opens in a session. The app must keep this count only on the phone. | P1 | H-07 |
| HND-20 | During a session, the app must set "Do not disturb" to ON. Notifications from other apps must not show as a pop-up, in the notification shade, or on the lock screen. Thus, the child cannot read the messages of the parent or use a notification action, for example "Reply". Incoming phone calls must continue to ring (HND-15) [ASSUMPTION]. On Android 15 and later, the app operates its own "Do not disturb" rule, not the global setting [V17]. | P0 | S-20 |
| HND-21 | At the end of a session, "Do not disturb" must go back to the setting that the parent had before the session. | P0 | S-20 |
| HND-22 | The guard must show the cover screen for a cloned grown-up app, as for the original app [ASSUMPTION]. | P0 | S-22 |
| HND-23 | During a session, the guard must show the cover screen on the uninstall dialog, on "App info", and on "Pause app" when the child opens them from an icon on the home screen. | P0 | S-23 |
| HND-24 | The guard must show the cover screen when the child opens a floating chat of a grown-up app. The cover screen must stay on top of floating chats [ASSUMPTION]. | P0 | S-24 |
| HND-25 | In the MVP, app calls are grown-up apps. The child cannot answer an app call during a session. The parent stops the session with the PIN (HND-18), and then answers the call. | P1 | E-05 |
| HND-26 | When a permitted app opens a Google Play payment screen, the guard must show the cover screen. | P1 | H-10 |
| HND-27 | The spike must record the quick settings tiles that the child can use during a session, for example "Airplane mode" and "Wi-Fi". These tiles are a known limit of the MVP (section 7). If a tile opens an app, the guard must show the cover screen. | P1 | S-21 |

> **WARNING:** DO NOT LET THE GUARD SHOW THE COVER SCREEN ON TOP OF THE EMERGENCY DIALER. IF THE GUARD DOES THIS, A PERSON CANNOT MAKE A CALL TO 999. THIS CAN CAUSE INJURY OR DEATH.

### 5.3 F2: Timer and end screen (TMR)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| TMR-01 | During a session, the time light must show along the edge of the screen, on top of all permitted apps. The time light must not show numbers to the child. | P0 | T-01, P-07 |
| TMR-02 | All touches must go through the time light to the permitted app. The child cannot move, close, or tap the time light. The time light must not cover the content of the app. | P0 | T-02, S-18 |
| TMR-02a | The time light must start at the top-left corner and move clockwise. The length of the light must show the part of the session that is complete. At 0 minutes, the light must be back at the top-left corner. The color must change from Lilac (light violet), to Violet, to Electric (dark blue). | P0 | T-01b |
| TMR-02b | The child must see all of the time light. The light must follow the visible edge of the screen: the round corners, the camera cutout, the curved edges [V15], and the landscape position for full-screen videos. The status bar and the navigation bar must not cover the light. With "Usage access", Android shows the overlay below these bars [V16]. If the spike shows that the bars cover the light, the light must go below the status bar and above the navigation bar, or the light must use the Accessibility service. | P0 | S-19, G-15 |
| TMR-02c | To make the light easier to see, the app must move the light in from the edge (SET-26). The opacity of the light must not be more than 80%. Cause: Android 12 and later do not send touches through an overlay from a different app that has an opacity of more than 0.8 [V14]. | P0 | S-18 |
| TMR-02d | The time light must be easy to see on a white screen and on a black screen. If test T-18 shows that the light is not easy to see on white, the app must add a thin Ink line on the outer side of the light [ASSUMPTION]. | P1 | T-18 |
| TMR-03 | The timer must stop when the screen is off. The timer must start again when the screen is on. The timer does not count time with the screen off. | P0 | T-11, W-06 |
| TMR-04 | At 2 minutes, the app must give a chime and a short Bangla voice one time. | P0 | T-03 |
| TMR-05 | At 2 minutes, the time light must pulse slowly. If the phone is in silent mode, the pulse is the only warning. The app must not make a sound in silent mode [ASSUMPTION]. | P1 | T-04 |
| TMR-06 | At 0 minutes, the end screen must show on the full screen. The video sound must stop. | P0 | T-05 |
| TMR-07 | Before the end screen, the time light must close the loop and become bright along all of the edge for 1 second. Then the end screen must show the Tin Shotti mark, confetti for 3 seconds, the text "Well done! দারুণ! আজকের সময় শেষ", and a Bangla voice. | P0 | T-05 |
| TMR-07a | If the Android setting "Remove animations" is ON, the end screen must show the confetti without movement. The screen must not flash. | P1 | T-05b |
| TMR-08 | On the end screen, only the "+5 min" button of the child (TMR-10) and the PIN fields must operate. The child cannot go back to an app in a different way. | P0 | T-06 |
| TMR-09 | When the parent enters the correct PIN and taps "Done", the session must stop with the result "on time". Then, all apps must operate as before the session. | P0 | T-07 |
| TMR-10 | One time each day, the end screen must show a large "+৫ মিনিট / +5 min" button. The child can tap it without the PIN. Then 5 more minutes start, and the time light starts a new short loop. The voice says that this is the one "+5 min" for today. | P0 | T-08 |
| TMR-10a | After the child uses "+5 min", the end screen must not show "+5 min" again on that day. | P0 | T-08b |
| TMR-10b | When the "+5 min" of that day is used, the end screen must show "+2 min" for the parent. "+2 min" operates only after the correct PIN, and only one time each day. | P0 | T-08b |
| TMR-10c | After "+2 min" is used, the end screen must show only the PIN fields, "Done", and the text "আজ আর সময় নেই / No more time today". The end screen must not give more time on that day. Cause: the parent can tell the child that the phone does not permit more time. | P0 | T-08c |
| TMR-10d | Behind the PIN, the settings must have "Add time today" (5, 10, or 15 minutes). These minutes add to the daily time of that day only. The end screen must not show this function. | P1 | T-08d |
| TMR-11 | If the parent does not know the PIN, the parent must use the screen lock of the phone to set a new PIN. A child who does not know the screen lock cannot change the PIN. | P0 | T-10 |
| TMR-11a | If a person sets a new PIN during a session or on the end screen, the app must record the time. At the next handover, the "Hand over" screen must show "পিন বদলানো হয়েছে / The PIN was reset at 8:14 pm, during a session". Cause: some children know the screen lock of the phone (A-12). | P1 | T-10c |
| TMR-11b | On the PIN screen, the parent can use a fingerprint instead of the PIN, if the phone has a fingerprint sensor [ASSUMPTION]. This screen must not accept the PIN or the pattern of the screen lock. Cause: a child can see the PIN or know the pattern. | P2 | T-10d |
| TMR-12 | After 5 incorrect PIN entries, the app must not accept a new entry for 30 seconds [ASSUMPTION]. | P1 | T-09 |
| TMR-13 | If the phone restarts during a session and the guard starts again, the session must continue with the remaining minutes [ASSUMPTION]. | P1 | S-07, T-12 |
| TMR-14 | If the phone restarts during a session and the guard does not start again, the app must tell the parent at the next handover [ASSUMPTION]. | P1 | S-07, T-12 |
| TMR-15 | After a session, the app must show the minutes used on that day and the number of grown-up apps that the child opened. It must also show "Saved on this phone only". | P1 | T-13 |
| TMR-15a | The summary must show the number of evenings in a row that ended without "+5 min", for example "৩ সন্ধ্যা +৫ ছাড়া / 3 evenings in a row without +5". The parent decides on a reward outside the app. The app must not give minutes as a reward (section 3.2). | P2 | T-13b |
| TMR-16 | During a session, the app must show the session notification: "তিন সত্যি চালু আছে · Tin Shotti is on", the minutes available, a progress bar, and the "Pause" and "Stop" buttons. Before "Pause" or "Stop" operates, the parent must enter the PIN. | P0 | T-14 |
| TMR-17 | When the parent pauses a session, the timer must stop and the break screen must show on top of all apps. The time light must stop and become dim. Only the PIN of the parent continues the session. The time of the pause must not decrease the daily time. If the time window closes during the pause, the session must stop with the result `window_closed`. | P1 | T-15 |
| TMR-18 | If a person removes the session notification, the app must show it again [ASSUMPTION]. During a session, the Tin Shotti icon must always open the PIN screen of the parent. | P1 | T-16 |

### 5.4 Daily time and time window (WIN)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| WIN-01 | The total time of all sessions in one day must not be more than the daily time. The extra time is the only exception (WIN-08). | P0 | W-01 |
| WIN-02 | If the parent set a time window, the "Give to child" button must not be available before the start of the time window. The button must show the start time, for example "Opens at 6 pm". | P0 | W-02 |
| WIN-03 | If the end of the time window occurs during a session, the session must stop with the end screen. The session result must be "window_closed". | P0 | W-03 |
| WIN-04 | After the end of the time window, the end screen must not show "+5 min" or "+2 min" [ASSUMPTION]. | P0 | W-03 |
| WIN-05 | At the end of the time window, the minutes that the child did not use are not available. Each new day starts with the full daily time. | P0 | W-04 |
| WIN-06 | If the parent did not set a time window and midnight occurs during a session, the session must continue to its end. The time for the new day starts after the session [ASSUMPTION]. | P1 | W-05 |
| WIN-07 | A change to the clock or to the time zone of the phone must not add minutes. | P1 | W-07 |
| WIN-08 | The "+5 min" of the child and the "+2 min" of the parent must also operate when the daily time is finished. These minutes add to the minutes used on that day. The minutes available must not become less than 0. After the end of the time window, WIN-04 applies. | P0 | W-08 |

### 5.5 Guard failures (GRD)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| GRD-01 | If Android stops the guard during a session, the app must record the failure on the phone. At the next handover, the app must show "Protection stopped during the last session" and the repair. | P0 | F-01 |
| GRD-02 | When the phone is in "Extreme battery saver" mode, the app must not show "Protected" if the guard does not operate. | P1 | F-04 |
| GRD-03 | An update of the app during a session must not cause a crash. After the update, the guard must operate again, or GRD-01 applies. | P1 | F-03 |
| GRD-04 | The setup, the handover, and the sessions must operate without internet. | P0 | F-05 |
| GRD-05 | Without internet, the app must keep the events. The app must send the events when the internet is available. | P0 | F-05 |

---

## 6 Non-functional requirements

### 6.1 Privacy (PRV)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| PRV-01 | The app must send only these events: `setup_finished`, `session_started`, and `session_ended` with a random install ID. The `session_started` event has one value: `added_time` (true if the session uses minutes from "Add time today"). | P0 | P-01 |
| PRV-02 | The `session_ended` event must have one of these results: `on_time`, `plus5_child`, `plus2_parent`, `early`, or `window_closed`. If the session used extra time, the result is the last extra time that the session used. | P0 | P-01, M-02 |
| PRV-03 | The app must not send app names, video titles, screen content, the age group of the child, or the advertising ID. | P0 | P-01, P-02 |
| PRV-04 | The guard must read only the name of the foreground app. The guard must not read the screen content or the video titles. | P0 | P-01, S-16 |
| PRV-05 | The session history must stay on the phone. | P0 | P-04 |
| PRV-06 | After the parent uninstalls the app, data from Tin Shotti must not stay on the phone. | P1 | P-05 |
| PRV-07 | The Data safety form in Play Console must agree with PRV-01 to PRV-03. | P0 | P-06 |
| PRV-08 | During a session, the child must always see the time light. Tin Shotti must not monitor the child when the time light is not on the screen. | P0 | P-07 |
| PRV-09 | During a session, the notifications of the parent must not show to the child (HND-20). The app must not read the content of these notifications. Cause: "Do not disturb" stops the notifications, so the app does not need access to the notifications. | P0 | S-20, P-01 |

### 6.2 Language and accessibility (LNG)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| LNG-01 | Bangla text must show correctly on the 4 test phones with the font in the app. | P0 | L-01 |
| LNG-02 | A child of 4 years who cannot read must know the next step on the cover screen and on the end screen. The child uses only the picture, the voice, and the button. | P1 | L-02 |
| LNG-03 | On the child screens, each touch target must be 48 dp or larger. | P1 | L-03 |
| LNG-04 | Each screen must have the full text in Bangla and in English. | P1 | L-04 |
| LNG-05 | TalkBack must read all buttons and all ON and OFF conditions in the selected language. | P2 | G-14 |

### 6.3 Performance of the guard (PRF)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| PRF-01 | With the battery saver ON, the guard must operate for 45 minutes. | P0 | S-08 |
| PRF-02 | After the screen is locked for 10 minutes, the guard must operate. | P0 | S-09 |
| PRF-03 | In 45 minutes, the guard must use less than 5% more battery than YouTube Kids without the guard [ASSUMPTION]. | P1 | S-11 |

### 6.4 Android and Play Store (PLT)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| PLT-01 | The app must operate on Android 10 to Android 15 [ASSUMPTION]. | P0 | `test-cases.md` section 0 |
| PLT-02 | The app must use Google Play billing for subscriptions [V7]. | P0 | None |
| PLT-03 | The app must use Firebase Analytics with the advertising ID set to OFF. We do not make a backend [ASSUMPTION]. | P0 | P-02 |
| PLT-04 | The app must have the `isMonitoringTool` declaration for apps that monitor children [V8]. | P0 | S-14 |
| PLT-05 | If the guard uses an Accessibility service, the app must have the Play declaration, an in-app disclosure, and the consent of the parent [V12]. | P0 | S-16 |
| PLT-06 | We must make the app available from the Nagorik organization account. New personal accounts have more test conditions before production [V9]. | P0 | S-17 |
| PLT-07 | One test phone must have curved edges. The tests of the time light must use gesture navigation and the 3 navigation buttons. | P1 | `test-cases.md` section 0, S-19 |

---

## 7 The experience, failure and privacy

**Flow.** Parent, once (about 3 minutes): 1 Welcome (language, age group, daily time, optional window) → 2 Allowed apps + PIN → 3 Switch on protection + Test it now + light check. Each evening: 4 Hand over (minutes, Give to child: 2 taps). Child: 5 Session (time light, grown-up cover with "Back to my videos") → 6 End screen (mark, confetti, "Well done!", +5 once, then the parent's PIN: Done or +2 once). Screen-by-screen detail: the "Screens" tab of the workbook and `../design/ui/figma/`.

**First useful result:** the first evening session that ends on time on the phone's word.

**The failure we design for:** the battery saver kills the guard, or a permission is off. The guard test runs before every handover; on a fail the parent sees "Not protected yet" with the fix for that brand, and "Give to child" stays off (SET-20, SET-21, HND-06). A guard that dies mid-session is reported at the next handover (GRD-01).

**Known MVP limits:** some quick settings tiles work in a session (HND-27); app calls can't be answered (HND-25); a child who knows the phone's screen lock can reset the PIN, and the parent sees it at the next handover (TMR-11a).

**Privacy decision and the three promises.** The app knows only which app is in front, never the screen or the videos (PRV-04). No child account, name or photo. History stays on the phone (PRV-05); only the events in PRV-01 leave it. Notifications are silenced, never read (PRV-09). The child can see the rules: only the allowed apps open; the time light is always on screen; every session ends with the same end screen.

---

## 8 Schedule and the week-2 gate

| Week | Developer | Product manager |
|---|---|---|
| 1 | 3-day spike on the 4 test phones (section 10.2) | Figma prototype; test bKash and carrier billing on a Bangladeshi Play account; landing page |
| 2 | Build setup (F3) and timer (F2): needed in every version | Payment test (section 9.2) |
| 3–4 | Build the guard (F1); internal Play build in week 3 to clear declarations | Recruit 15 closed-test families |
| 5 | Fix closed-test issues | Closed test, 15 families, one week |
| 6 | Play review | Launch from Nagorik's organisation account [V9] |

| Gate, end of week 2 | Decision |
|---|---|
| Guard and payment test pass | Build the guard in weeks 3–4. |
| Guard fails: S-01, S-03, S-08 or S-09 fails on 2+ phones with each guard method | Ship a guided setup of the free tools instead. The "whole phone, any brand" reason to pay is gone, so it launches free; re-test pricing before charging. |
| Payment test fails | Stop. |

AI coding speeds up screens, not testing on real phones.

---

## 9 Pricing and the success metric

### 9.1 Price
BDT 99 a month after a 14-day free trial [ASSUMPTION]. Subscriptions must use Google Play billing [V7] (PLT-02). Google's payment-methods page doesn't list Bangladesh, which means cards only; some third-party guides say bKash works, so week 1 tests it on a real account (A-06). If neither bKash nor carrier billing works: a telco or MFS bundle.

Why pay when free tools exist (YouTube Kids [V2], app pinning [V4], Digital Wellbeing timers [V11], Samsung Kids [V10], Family Link [V3]): (1) a setup the parent can finish, (2) one rule for the whole phone on any brand [ASSUMPTION: few parents find the brand kid modes], (3) the same visible ending every evening [ASSUMPTION until the closed test].

### 9.2 Payment test (week 2, before the guard is built)
BDT 5,000 of Facebook ads to parent groups, about 500 visitors [ASSUMPTION]. A Bangla landing page with a 40-second prototype video asks "Which device does your 3–8-year-old use most?" (A-01), then "Reserve the founding price: pay BDT 99 by bKash, refunded on request or if we don't launch." It measures intent, so it is an upper bound.

| Result | Decision |
|---|---|
| 2% or more pay (about 10 of 500) | Continue |
| 0.5% to 2% | Retest the message, or BDT 49 |
| Under 0.5%, or most say YouTube Kids or Samsung Kids is enough | Go free with a telco or school bundle, or pick another problem |

### 9.3 Metric: week-2 return rate
`B / A`: A = families who finish setup in launch week; B = those of A who start 3+ sessions in week 2. Events: PRV-01, PRV-02 via Firebase Analytics, advertising ID off, no backend (PLT-03). Aim for 100+ setups and 10 parent calls. With about 100 families the rate is good to about ±10 points, so treat it as directional.

| Result | Decision |
|---|---|
| 40% or more | Continue; switch on the paywall. Next check: day-15 trial-to-paid (under 5%: back to 9.2). |
| 20% to 40% | Change: call 10 families who stopped; fix setup and brand failures first. |
| Under 20% | Stop new features; revisit the problem choice. |
| Parent gives +2 or uses Add time today on more than half of week-2 session days | Change, whatever the return rate: the ending isn't solving comment 2. The child's +5 is expected. |

---

## 10 Assumptions, risks and the spike

### 10.1 Assumptions

| ID | Assumption | Effect if the assumption is incorrect | How we examine it | Week |
|---|---|---|---|---|
| A-01 | Most children of 3 to 8 years use the shared phone of a parent. | The handover is not the primary problem. | The device selection on the landing page | 2 |
| A-02 | A usual Play Store app without device owner rights can keep a child in the permitted apps. This assumption has the highest risk. | F1 is not possible. We ship a guided setup of the free tools, free (section 8). | Tests S-01 to S-12 in the spike, on the 4 test phones | 1 |
| A-03 | Play review accepts the guard and its declarations before the end of week 6. | The launch is after week 6. | Tests S-13 to S-17 | 1 and 2 |
| A-04 | A time light that the child can see decreases the problem in comment 2. | F2 does not help the family. | The closed test and the "+2 min" limit in section 9.3 | 5 to 8 |
| A-05 | Parents make a payment of BDT 99 each month when free tools are available. | The price or the revenue model must change. | The payment test | 2 |
| A-06 | bKash operates with Google Play billing in Bangladesh. | Parents without a card cannot make the payment. | A test on an account in Bangladesh | 1 |
| A-07 | Many families have Xiaomi, Realme, or Tecno phones. | More families can use Samsung Kids. | The landing page and the closed test | 2 to 5 |
| A-08 | Google Play does not identify Tin Shotti as an app for children. | Firebase Analytics must obey more conditions for SDKs. | Test S-15 | 1 |
| A-09 | Children of 3 to 8 years understand the time light without numbers. When the light is almost back at the start, they know that the session is almost complete. | The end surprises the child. The problem in comment 2 does not decrease. | Test T-17 in the closed test | 5 |
| A-10 | On Android 12 to 15, touches go through an overlay along all of the edge of the screen to the permitted app. Android can block touches below an overlay from a different app [ASSUMPTION]. | The child cannot use the permitted app correctly. The time light must use the Accessibility service, or the design must change. | Test S-18 in the spike | 1 |
| A-11 | "Do not disturb" stops the notifications of other apps on the 4 test phones, and phone calls continue to ring. On Android 15 and later, the rule of the app gives the same result [V17]. | The child can read and answer the messages of the parent. | Test S-20 in the spike | 1 |
| A-12 | Some children know the screen lock of the phone. | The child can set a new PIN and stop the session. TMR-11a tells the parent. | Ask the parents in the closed test | 5 |
| A-13 | Android gives the correct curved edges for the test phones [V15]. | Part of the light is not visible on some phones. The light check (SET-25) is the repair. | Test S-19 in the spike | 1 |
| A-14 | The guard can identify cloned apps, floating chats, and the uninstall dialog. | The child can open WhatsApp, or remove Tin Shotti, during a session. | Tests S-22 to S-24 in the spike | 1 |
| A-15 | A child of 3 to 8 years who usually watches YouTube accepts YouTube Kids in its place. | Comment 1 ("what they watch next") is not solved. The fix is a separate decision, not a looser guard. | Test H-11 in the closed test | 5 |

Against A-02 (the riskiest): without device owner rights Android offers only app pinning, which the user can stop [V4]; Xiaomi and Samsung battery savers often stop background apps [V5].

### 10.2 Spike (week 1, 3 days, 4 test phones, Android 10 to 15)
For both guard methods (Usage access + overlay, and an Accessibility service [V12]): time to cover a blocked app; 45 minutes on battery saver; calls and 999 in a session; escapes via notification shade, recent apps, split screen, restart, cloned apps, chat heads, the uninstall dialog; touches through the time light on Android 12 to 15 (A-10); the light on round corners, cutouts and curved edges (A-13); Do not disturb silencing WhatsApp and bKash while calls ring (A-11); the Play declarations (`isMonitoringTool` [V8], foreground service type) and review time. Tests S-01 to S-24 in `test-cases.md`.

### 10.3 Open questions
1. Does a timer the phone enforces end the evening argument, or does the parent give +2 every night? (closed test, +2 guard)
2. Phone, tablet or TV: which device do 3 to 8-year-olds mostly use? (A-01)
3. Will parents pay BDT 99 a month, and can they pay through Google Play without a card? (A-05, A-06)
4. Trademark search for "Tin Shotti" in classes 9 and 42 before launch; `tinshotti.com` and `.app` were free on 3 Nov 2026. The Play name must be "Tin Shotti", never "Teen Shotti" (too close to "Teen Patti" card apps).
5. Which phone models do families own? (picks the 4 test phones)
6. Do two children share one phone in the evening?
7. Do WhatsApp or IMO calls from a parent abroad arrive during sessions? (v2 decision on app calls)

### 10.4 Done when
All P0 tests pass on the 4 test phones (or each accepted failure has a written reason); spike and Play answers (S-12 to S-17) are written before the end of week 2; P1 tests pass or are listed as known issues for the closed test; the Data safety form matches PRV-01 to PRV-03; closed-test notes for G-12, H-11, L-02 and W-03 are written.

---

## 11 Sources (checked 3–4 November 2026)

- [V1] [YouTube Kids Help, article 6130573](https://support.google.com/youtubekids/answer/6130573?co=GENIE.Platform%3DAndroid): The countries where YouTube Kids is available. The list includes Bangladesh.
- [V2] [YouTube Kids Help, article 6172308](https://support.google.com/youtubekids/answer/6172308?co=GENIE.Platform%3DAndroid) and [article 6130558](https://support.google.com/youtubekids/answer/6130558): Approved content and the timer.
- [V3] [Google For Families Help, article 9116646](https://support.google.com/families/answer/9116646): Family Link.
- [V4] [Android Developers, "Lock task mode"](https://developer.android.com/work/dpc/dedicated-devices/lock-task-mode) and [Android Help, article 9455138](https://support.google.com/android/answer/9455138): Lock task mode and app pinning.
- [V5] [dontkillmyapp.com](https://dontkillmyapp.com): Battery savers that stop background apps, for each phone brand.
- [V6] [YouTube API Developer Policies](https://developers.google.com/youtube/terms/developer-policies): Sections III.F.3 and III.I.4.
- [V7] [Play Console Help, article 9858738](https://support.google.com/googleplay/android-developer/answer/9858738): Payments.
- [V8] [Play Console Help, article 12955211](https://support.google.com/googleplay/android-developer/answer/12955211): The `isMonitoringTool` declaration.
- [V9] [Play Console Help, article 14151465](https://support.google.com/googleplay/android-developer/answer/14151465): New personal accounts.
- [V10] [Samsung Kids, Samsung Bangladesh](https://www.samsung.com/bd/apps/samsung-kids/) and [Samsung Support](https://www.samsung.com/us/support/answer/ANS10003300/): Android 9 or higher, and a PIN to exit.
- [V11] [Android Help, article 9346420](https://support.google.com/android/answer/9346420): Digital Wellbeing app timers.
- [V12] [Play Console Help, article 10964491](https://support.google.com/googleplay/android-developer/answer/10964491): The `AccessibilityService` API.
- [V13] [The Daily Star, "For emergency, dial 999"](https://online.thedailystar.net/node/1503907): The emergency service of Bangladesh. Bangladesh Police operates it.
- [V14] [Android Developers, "Behavior changes: all apps" (Android 12)](https://developer.android.com/about/versions/12/behavior-changes-all#untrusted-touch-events): Android 12 blocks touches that go through a `TYPE_APPLICATION_OVERLAY` window. The exception is a window with a combined opacity of 0.8 or less. Accessibility windows are trusted.
- [V15] [Android Developers, `DisplayCutout.getWaterfallInsets()`](https://developer.android.com/reference/android/view/DisplayCutout#getWaterfallInsets()): Android 11 (API level 30) and later give the curved areas of a waterfall display. The curve can make the content difficult to see.
- [V16] [Android Developers, `WindowManager.LayoutParams`](https://developer.android.com/reference/android/view/WindowManager.LayoutParams#TYPE_APPLICATION_OVERLAY): A `TYPE_APPLICATION_OVERLAY` window is above the windows of apps, but below the status bar and the input method.
- [V17] [Android Developers, `NotificationManager`](https://developer.android.com/reference/android/app/NotificationManager#setInterruptionFilter(int)): An app must have access to the notification policy to change "Do not disturb". On Android 15 (API level 35) and later, the app operates its own rule, not the global setting.

Changes: 2.0 (4 Nov) cut from 765 lines to this, plain English instead of STE, with the workbook as the human view; added A-15 and H-11 (does the child accept YouTube Kids?) and the free plan B at the gate. The full history is in the archived v1.4.
