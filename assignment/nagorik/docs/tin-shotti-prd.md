# Tin Shotti: Product Requirements Document

| Item | Value |
|---|---|
| Name | Tin Shotti (তিন সত্যি). The previous name was "Shishu Mode". |
| Document | Product requirements document (PRD) for the minimum viable product (MVP) |
| Document version | 1.4, draft |
| Date | 4 November 2026 |
| Author | Abraar Masud Nafiz |
| Readers | The developer, the product manager, and the review team at Nagorik Technologies |
| Standard | ASD-STE100 Simplified Technical English, Issue 9 |
| Related documents | Assessment PDF, version 6: `Abraar_Masud_Nafiz_JuniorPM_Assessment.pdf`. Test cases: the Notion page "Tin Shotti: acceptance test cases" (`test-cases.md`, `test-cases.csv`). |

Versions of the related documents before 3 November 2026 use the name "Shishu Mode". "Shishu Mode" and "Tin Shotti" are two names for the same app.

---

## 1 About this document

### 1.1 Function of this document

This document gives the requirements for the MVP of Tin Shotti. Tin Shotti is an app that gives a child mode to the Android phone of a parent. One developer with an AI coding platform will build the MVP in six weeks.

These persons use this document:

- The developer, who builds the app and does the tests
- The product manager, who makes the decisions about Tin Shotti
- The review team at Nagorik Technologies.

### 1.2 Rules for the text

We wrote this document in ASD-STE100 Simplified Technical English, Issue 9. Section 2 gives the technical nouns and the technical verbs that are not in the STE dictionary.

Text in quotation marks is text that the app shows on the screen, or text from a different document. Each requirement is a descriptive sentence with "must". The procedures in section 9 use the imperative form.

### 1.3 Labels for statements

Each statement about a fact or about a person has one of these labels:

- [V1] to [V17]: We examined the statement against the source with that number in section 18.
- [ASSUMPTION]: We did not make sure that the statement is correct.

The author spoke informally with some parents that he knows. This is not research. The four parent comments in the assessment brief are only examples. Thus, each statement about parents is an assumption.

### 1.4 Priority

- P0: The MVP cannot go to the Play Store if this requirement is not satisfactory.
- P1: Complete this requirement before the closed test in week 5.
- P2: Complete this requirement if time is available.

In each requirement table, the "Tests" column gives the IDs of the test cases in `test-cases.md`.

---

## 2 Technical nouns and technical verbs

These words are not in the STE dictionary. This document uses them as technical nouns (Rule 1.5) or as technical verbs (Rule 1.12). The category numbers come from these two rules.

### 2.1 Technical nouns for Tin Shotti

| Technical noun | Category | Meaning in this document |
|---|---|---|
| Tin Shotti | Proper noun | The name of the app. The previous name was "Shishu Mode". |
| app | 19 | A software application on a phone. "The app" is the Tin Shotti app. |
| Android | 19 | The operating system on the phone |
| phone | 19 | A smartphone with Android |
| shared phone | 19 | A phone that the parent and the child use |
| test phone | 19 | One of 4 Android phones with a low price, from Xiaomi, Samsung, Realme, and Tecno |
| parent | 11 | The person who has the phone, does the setup, and makes the payment |
| child, children | 11 | A person of 3 to 8 years who uses the phone during a session |
| family, families | 11 | A parent and a child who use one phone |
| developer | 11 | The one software engineer who builds the MVP |
| product manager | 11 | The person who makes the decisions about Tin Shotti |
| handover | 6 | The step where the parent gives the phone to the child |
| session | 19 | The period from the tap on "Give to child" to the end of the end screen |
| permitted app | 19 | An app that the child can open during a session. The "Allowed apps" screen shows these apps. |
| grown-up app | 19 | An app that the child cannot open during a session |
| learning app | 19 | An app for children, for example an app for Bangla or for mathematics |
| guard | 6 | The part of the app that finds the foreground app. It shows the cover screen on top of grown-up apps. |
| guard method | 6 | One of the two methods for the guard: "Usage access" with an overlay, or an Accessibility service |
| guard test | 19 | An automatic test. The app opens a grown-up app and makes sure that the cover screen shows. |
| cover screen | 19 | The full screen that the guard shows on top of a grown-up app |
| timer | 19 | The function that counts the minutes available in a session. The child sees the timer as the time light. The parent sees the minutes in the session notification. |
| time light | 19 | A line of light along the edge of the screen. It starts at the top-left corner and moves clockwise. At 0 minutes, it is back at the top-left corner. Its color changes from Lilac (light violet) to Violet to Electric (dark blue). It does not show numbers. |
| light check | 19 | A step in the setup. The time light goes around the edge of the screen one time. The parent tells the app if all of the light is visible. |
| curved edge | 19 | A part of the screen that bends to the side of the phone. Android calls a screen with curved edges a "waterfall display" [V15]. |
| cloned app | 19 | A second copy of an app on the same phone, for example a second WhatsApp for a second SIM. Phone brands call this function "Dual apps", "App clone", or "App twin". |
| app call | 19 | A call through an app, for example WhatsApp, IMO, or Messenger. An app call is not a phone call. |
| floating chat | 19 | A small window of a chat app on top of other apps, for example a Messenger chat head or an Android chat bubble |
| session notification | 19 | The Android notification that shows during a session. It shows the minutes available and the "Pause" and "Stop" buttons. |
| break screen | 19 | The full screen that shows when the parent pauses a session |
| end screen | 19 | The full screen that shows when the timer is at 0 minutes |
| extra time | 9 | Minutes after the timer is at 0 minutes: the "+5 min" of the child, the "+2 min" of the parent, or "Add time today" in the settings |
| daily time | 9 | The maximum number of minutes for all sessions in one day |
| time window | 9 | An optional period of the day. Sessions can operate only in this period. |
| age group | 9 | One of three groups of children: 3 to 5 years, 6 to 8 years, or 9 to 14 years |
| PIN | 19 | The 4-digit number of the parent |
| screen lock | 19 | The PIN, pattern, or fingerprint that locks the phone |
| setup, guided setup | 19 | The first procedure in the app (steps 1 to 3 in section 9). The app shows each step with pictures. |
| permission | 19 | An Android setting that lets an app do a specified function |
| "Usage access", "Display over other apps", "Autostart", "Extreme battery saver", "Do not disturb", "Airplane mode", "Wi-Fi", "App info", "Pause app", "Dual apps", "App clone", "App twin" | 10 | Names of Android settings and phone functions |
| Accessibility service | 19 | An Android service that can read and control the screen. Play has special conditions for this service [V12]. |
| overlay | 19 | A window that an app shows on top of other apps |
| foreground app | 19 | The app that is on the screen at this time |
| battery saver | 19 | A phone function that stops background apps to decrease the use of the battery |
| device owner | 19 | An app with full control of the phone. Usually, you set it on a new phone. |
| device owner rights | 19 | The control that a device owner has |
| lock task mode | 19 | An Android mode that keeps the phone in a set of apps. Only a device owner can use it [V4]. |
| app pinning | 19 | An Android function that keeps one app on the screen. The person who uses the phone can stop it [V4]. |
| incoming call | 19 | A phone call that the phone receives |
| emergency dialer | 19 | The Android screen for emergency calls |
| 999 | 9 | The emergency number in Bangladesh [V13] |
| event | 19 | A data item that the app sends to Firebase Analytics |
| install ID | 19 | A random number for one installation of the app. It does not identify a person. |
| advertising ID | 19 | The Android number that identifies a phone to advertisers |
| landing page | 19 | A web page for the payment test |
| spike | 19 | A short test of the guard before the build |
| closed test | 19 | A Google Play test track for a small group of testers |
| launch | 19 | The day when the app becomes available on the Play Store |
| gate | 15 | A specified time in the schedule where we make a decision. We set the conditions before the test. |
| free tool | Rule 1.8 | A tool from Google or Samsung that the parent can use without a payment |
| week-2 return rate | 7 | The metric in section 13.1 |

### 2.2 Other technical nouns

- Documents (category 15): document, section, table, column, list, page, label, statement, comment, brief, assessment, issue, draft, dictionary, rule, guide, report.
- More documents (category 15): ID, Data safety form, news article, community site.
- Specifications (category 15): requirement, functional requirement, non-functional requirement, priority, assumption, test case, acceptance, product requirements document, PRD, minimum viable product, MVP.
- STE terms (category 15): technical noun, technical verb, quotation marks, descriptive sentence, imperative form.
- Persons and groups (category 11): author, reader, review team, tester, advertiser, software engineer, trademark agent, school, country, countries, Bangladesh Police.
- Time (category 9): year, day, week, month, minute, second, evening, night, midnight, pm, November, today, birth date, clock, time zone.
- Numbers and units (category 9): first (the number), BDT (the Bangladeshi taka), %, dp, 4-digit, 40-second.
- Colors (category 17): red, white, black, Ink, Lilac, Violet, Electric.
- Medical terms (category 14): injury, death.
- Failure terms (category 18): failure.
- Safety words (Rule 7.1): WARNING.
- Screen items (category 19): screen, home screen, split screen, floating window, notification shade, recent apps, quick settings, quick settings tile, notification action, status bar, navigation bar, navigation button, gesture navigation, lock screen, uninstall dialog, chat head, chat bubble, pop-up, button, field, switch, link, check mark, touch target, keyboard, star.
- Media (category 19): video, embedded video, player, video player, approved-content mode, chime, picture, icon, text, font, language, web page, website, photo, title, content, screen content.
- Phone and system terms (category 19): operating system, Android setting, setting, default, crash, update, internet, battery, background app, foreground, foreground service, silent mode, installation, tablet, TV, brand, phone model, SIM, phone case, fingerprint, fingerprint sensor, opacity, rule.
- Calls (category 19): call, phone call.
- Software terms (category 19): software application, build, code, backend, dashboard, browser, safe browser, content filter, service, emergency service, accessibility.
- Accounts and releases (category 19): account, developer account, organization account, personal account, SDK, API, prototype, version, search, track, production.
- More software terms (category 19): registry, domain, session history, AI coding platform, AI summary, all-day mode.
- Law (category 21): trademark, trademark search, class, consent, disclosure, in-app disclosure, declaration, policy, policies, privacy, privacy statement.
- Payments and marketing (Rule 1.8): price, price tier, payment, in-app purchase, subscription, free trial, refund, fee, revenue, revenue model, budget, ad, click, visitor, paywall, reservation list, card, telco, bundle.
- Research (category 7): research, metric, return rate, median, mathematics.
- Body (category 12): finger.
- Companies (category 11): Nagorik Technologies, Nagorik, Google, Samsung, Xiaomi, Realme, Tecno, Figma, bKash, Claude, Claude Code.
- Apps and services (category 11): YouTube, YouTube Kids, Facebook, Messenger, WhatsApp, IMO, Google Play, Play Store, Play Console, Google Play billing, Google Play payment screen, Play review.
- More apps and services (category 11): Firebase Analytics, Samsung Kids, Samsung Galaxy, Family Link, Digital Wellbeing, TalkBack, Google Account, Google Assistant, iPhone, iPad, Teen Patti.
- Places, languages, and persons (category 11): Bangladesh, Dhaka, Chattogram, Bangla, English, Abraar Masud Nafiz.

### 2.3 Technical verbs

| Technical verb | Category | Meaning in this document |
|---|---|---|
| tap | 2a | To touch a button on the screen one time |
| enter | 2a | To type a value into a field |
| type | 2a | To put text into a field with the keyboard |
| pulse | 2b | To become bright and then dim again, slowly and more than one time |
| pause | 2b | To stop the timer for some time. The session continues after the PIN. |
| open, close | 2b | To start an app on the screen, or to stop it |
| install, uninstall | 2c | To put an app on the phone, or to remove it |
| restart | 2c | To stop the phone and start it again |
| build | 2c | To make a software application from its code |

---

## 3 Problem

### 3.1 The problem in the evening

In the evening, a child of 4 to 8 years wants the Android phone of a parent. The child wants to look at videos for children on YouTube. These three problems occur [ASSUMPTION]:

- YouTube automatically starts a new video. The parent does not know the next video.
- When the parent wants the phone back, the child does not want to give it. Then, the parent and the child have a problem.
- The same phone has the WhatsApp, Facebook, and bKash apps of the parent.

### 3.2 Parent comments from the brief

| Comment from the brief | Effect on the MVP |
|---|---|
| "My child needs YouTube for learning, but I worry about what they watch next." | Function F1. The child can open only permitted apps. YouTube Kids is the default permitted app. |
| "We argue about screen time every evening." | Function F2. The child can see the time light. Each session stops with the same end screen. |
| "I tried a parental-control app, but setting it up was too difficult." | Function F3. A guided setup in Bangla in approximately 3 minutes. |
| "Why should I pay when free parental controls already exist?" | Section 12. The price and the payment test. |

### 3.3 Causes for this selection

We selected the handover first for these causes:

- Three of the four comments occur at the handover.
- The free tools do not operate correctly on a shared phone (refer to section 12.1).
- A child of 3 to 8 years cannot make a decision about limits with a parent. Thus, a limit that the phone applies each evening can help most [ASSUMPTION].

### 3.4 An assumption that can make this selection incorrect

A-01: Most children of 3 to 8 years use the shared phone of a parent. They do not use a tablet or a TV [ASSUMPTION].

If A-01 is incorrect, the handover is not the primary problem. The payment test examines A-01 (section 12.4).

### 3.5 Children in the MVP

The brief includes children of 3 to 14 years. The MVP is primarily for children of 3 to 8 years. Cause: the handover is a problem of children who use the phone of a parent [ASSUMPTION].

Many children of 9 to 14 years have a phone for their use only. Family Link is applicable to these phones [V3]. If a child of 9 to 14 years uses the phone of a parent, the parent can use the same app. The parent can allow one or two more apps for this child, for example a school app or a reading app (SET-04a). Grown-up apps are always blocked. Version 2 can add more functions for children of 9 to 14 years (section 6.3).

---

## 4 Persons who use the app

### 4.1 Parent

The parent:

- Has an Android phone from Xiaomi, Realme, Tecno, or Samsung [ASSUMPTION]
- Reads Bangla. Some parents do not read English [ASSUMPTION].
- Does the setup one time. Then, each evening, does only the handover.
- Makes the payment.

### 4.2 Child

The child:

- Is a child of 3 to 8 years
- Frequently cannot read at 3 to 5 years [ASSUMPTION]. Thus, the child screens use pictures, sound, and a Bangla voice.
- Uses the phone for 10 to 45 minutes in the evening [ASSUMPTION].

### 4.3 Persons and devices that are not in the MVP

- Children who have a phone for their use only (version 2, section 6.3)
- iPhones and iPads
- Phones with an Android version less than 10.

---

## 5 Results that we want from the MVP

| ID | Result | How we measure the result |
|---|---|---|
| R-01 | During a session, the child can open only permitted apps. | Tests S-01 to S-12 in the spike |
| R-02 | The session stops at the time that the parent set. The phone, not the parent, tells the child that the time is finished. | The closed test, and the "+2 min" limit in section 13 |
| R-03 | A parent completes the setup in Bangla in 3 minutes or less. | Test G-12 |
| R-04 | 40% or more of the families start 3 or more sessions in week 2 after the launch. | Section 13 |

---

## 6 Functions in the MVP and functions not in the MVP

### 6.1 Functions in the MVP

| Function | Operation | Effect for the family |
|---|---|---|
| F1. Handover with permitted apps | The parent taps "Give to child". The child can open only permitted apps, and YouTube Kids is the default. Each grown-up app shows the cover screen. Incoming calls and 999 always operate. Notifications from other apps do not show during a session. | The child stays in a safe app and cannot open WhatsApp or Facebook. YouTube Kids has a content filter and is available in Bangladesh [V1]. We do not make a content filter. |
| F2. Daily time with a timer and an end screen | The parent sets the daily time and an optional time window. The time light moves along the edge of the screen and shows the time without numbers. The parent sees the minutes in the session notification. At 2 minutes, a chime and a Bangla voice occur. At 0 minutes, the end screen shows "Well done" with confetti. One time each day, the child can tap "+5 min" without the PIN. After that, the parent can give "+2 min" one time with the PIN. Then the end screen gives no more time. | Each session stops with the same end screen. Thus, the problem in comment 2 decreases [ASSUMPTION]. This is the primary assumption of the MVP. |
| F3. A guided setup in Bangla in approximately 3 minutes | The setup shows pictures for the phone brand. A "Test it now" button makes sure that the guard operates. If the parent does not know the PIN, the parent uses the screen lock to set a new PIN. | This function gives a solution for comment 3: "setting it up was too difficult". The free tools do not give this function. |

### 6.2 Functions not in the MVP

| Function | Cause |
|---|---|
| A content filter from Tin Shotti | YouTube Kids has a content filter and is available in Bangladesh [V1]. One incorrect video can cause a parent to stop the use of Tin Shotti. |
| A dashboard for the parent on a different device (reports, location) | This function must have accounts, a backend, and data about the child. Six weeks is not sufficient for this work. |
| A video player that shows only approved YouTube videos (the rejected alternative) | In the YouTube API policies, a fee for embedded videos is not permitted [V6]. In the same policies, the links in the player must operate [V6]. YouTube Kids has an approved-content mode without a payment [V2]. |
| An app for iPhones and iPads | One developer has six weeks. Most phones of the families use Android [ASSUMPTION]. |
| A profile for each child | The daily time is for the phone, not for each child. Thus, two children share one daily time. A profile must identify each child, but the app does not ask for a name or a photo (SET-02). We ask families with two children in the closed test (section 16). |
| A reward of minutes, for example "+20 min" after 3 days without "+5 min" | Minutes as a reward teach the child that screen time is the prize. The design principle is "celebrate finishing, not using". Many children of 3 to 5 years cannot wait 3 days for a reward [ASSUMPTION]. The summary shows the days without "+5 min" to the parent, and the parent decides on a reward (TMR-15a). Version 2 can examine this function with parents (V-10). |
| App calls during a session | The guard knows only the name of the foreground app. Thus, it cannot find the difference between an app call and a chat in the same app [ASSUMPTION]. In the MVP, the parent stops the session to answer an app call (HND-25). Version 2 can examine this function. |

### 6.3 Functions for version 2

These functions are not in the six weeks:

- All-day mode: The child has the phone at all times, for example a previous phone of a parent. The parent sets permitted apps for each time of day and a total time for each day. Calls with the family and calls to 999 always operate.
- Device owner for all-day mode: On a phone for the child only, the app can be the device owner. Then, the app can use lock task mode. Lock task mode is not as easy to stop as an overlay [V4].
- Safe browser: The browser is OFF by default. The child can open only permitted websites and emergency pages. The browser records each website that the child opens. The child can see that the browser records these websites.
- AI summary for parents: This function sends data about websites from the phone. Thus, the parent must give consent first. A new privacy statement is also necessary.

These functions increase the work on the guard and on privacy by two times. Thus, the MVP examines the handover first.

---

## 7 Functional requirements

### 7.1 F3: Setup (SET)

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

### 7.2 F1: Handover with permitted apps (HND)

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
| HND-27 | The spike must record the quick settings tiles that the child can use during a session, for example "Airplane mode" and "Wi-Fi". These tiles are a known limit of the MVP (section 10). If a tile opens an app, the guard must show the cover screen. | P1 | S-21 |

> **WARNING:** DO NOT LET THE GUARD SHOW THE COVER SCREEN ON TOP OF THE EMERGENCY DIALER. IF THE GUARD DOES THIS, A PERSON CANNOT MAKE A CALL TO 999. THIS CAN CAUSE INJURY OR DEATH.

### 7.3 F2: Timer and end screen (TMR)

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
| TMR-15a | The summary must show the number of evenings in a row that ended without "+5 min", for example "৩ সন্ধ্যা +৫ ছাড়া / 3 evenings in a row without +5". The parent decides on a reward outside the app. The app must not give minutes as a reward (section 6.2). | P2 | T-13b |
| TMR-16 | During a session, the app must show the session notification: "তিন সত্যি চালু আছে · Tin Shotti is on", the minutes available, a progress bar, and the "Pause" and "Stop" buttons. Before "Pause" or "Stop" operates, the parent must enter the PIN. | P0 | T-14 |
| TMR-17 | When the parent pauses a session, the timer must stop and the break screen must show on top of all apps. The time light must stop and become dim. Only the PIN of the parent continues the session. The time of the pause must not decrease the daily time. If the time window closes during the pause, the session must stop with the result `window_closed`. | P1 | T-15 |
| TMR-18 | If a person removes the session notification, the app must show it again [ASSUMPTION]. During a session, the Tin Shotti icon must always open the PIN screen of the parent. | P1 | T-16 |

### 7.4 Daily time and time window (WIN)

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

### 7.5 Guard failures (GRD)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| GRD-01 | If Android stops the guard during a session, the app must record the failure on the phone. At the next handover, the app must show "Protection stopped during the last session" and the repair. | P0 | F-01 |
| GRD-02 | When the phone is in "Extreme battery saver" mode, the app must not show "Protected" if the guard does not operate. | P1 | F-04 |
| GRD-03 | An update of the app during a session must not cause a crash. After the update, the guard must operate again, or GRD-01 applies. | P1 | F-03 |
| GRD-04 | The setup, the handover, and the sessions must operate without internet. | P0 | F-05 |
| GRD-05 | Without internet, the app must keep the events. The app must send the events when the internet is available. | P0 | F-05 |

---

## 8 Non-functional requirements

### 8.1 Privacy (PRV)

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

### 8.2 Language and accessibility (LNG)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| LNG-01 | Bangla text must show correctly on the 4 test phones with the font in the app. | P0 | L-01 |
| LNG-02 | A child of 4 years who cannot read must know the next step on the cover screen and on the end screen. The child uses only the picture, the voice, and the button. | P1 | L-02 |
| LNG-03 | On the child screens, each touch target must be 48 dp or larger. | P1 | L-03 |
| LNG-04 | Each screen must have the full text in Bangla and in English. | P1 | L-04 |
| LNG-05 | TalkBack must read all buttons and all ON and OFF conditions in the selected language. | P2 | G-14 |

### 8.3 Performance of the guard (PRF)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| PRF-01 | With the battery saver ON, the guard must operate for 45 minutes. | P0 | S-08 |
| PRF-02 | After the screen is locked for 10 minutes, the guard must operate. | P0 | S-09 |
| PRF-03 | In 45 minutes, the guard must use less than 5% more battery than YouTube Kids without the guard [ASSUMPTION]. | P1 | S-11 |

### 8.4 Android and Play Store (PLT)

| ID | Requirement | Priority | Tests |
|---|---|---|---|
| PLT-01 | The app must operate on Android 10 to Android 15 [ASSUMPTION]. | P0 | Section 0 of `test-cases.md` |
| PLT-02 | The app must use Google Play billing for subscriptions [V7]. | P0 | None |
| PLT-03 | The app must use Firebase Analytics with the advertising ID set to OFF. We do not make a backend [ASSUMPTION]. | P0 | P-02 |
| PLT-04 | The app must have the `isMonitoringTool` declaration for apps that monitor children [V8]. | P0 | S-14 |
| PLT-05 | If the guard uses an Accessibility service, the app must have the Play declaration, an in-app disclosure, and the consent of the parent [V12]. | P0 | S-16 |
| PLT-06 | We must make the app available from the Nagorik organization account. New personal accounts have more test conditions before production [V9]. | P0 | S-17 |
| PLT-07 | One test phone must have curved edges. The tests of the time light must use gesture navigation and the 3 navigation buttons. | P1 | Section 0 of `test-cases.md`, S-19 |

---

## 9 User flow: from the first start to the first satisfactory result

The parent does steps 1 to 4 one time, in approximately 3 minutes. After that, each evening is only step 4. The child sees steps 5 and 6.

### Step 1: The "Welcome" screen (parent)

1. Select "বাংলা" or "English".
2. Select the age group of the child: "3–5", "6–8", or "9–14".
3. Set the daily time, for example 45 minutes.
4. If you want a time window, set it, for example 6 pm to 10 pm.
5. Tap "Start".

### Step 2: The "Allowed apps" screen (parent)

1. Make sure that YouTube Kids has a check mark.
2. Select the learning apps that the child can use.
3. Enter a 4-digit PIN two times.
4. Tap "Next".

The grown-up apps show with a red "X". The parent cannot select them.

### Step 3: The "Switch on protection" screen (parent)

1. Set each permission to ON, and the "Do not disturb" access. The app shows pictures for the phone brand.
2. Tap "Test it now".
3. Look at the light check. If you cannot see all of the light, tap "Part is hidden". Do this step again until you can see all of the light.

If the test is satisfactory, the screen shows "Protected · test passed 7:02 pm". If the test is not satisfactory, refer to section 10.

### Step 4: The "Hand over" screen (parent, each evening)

1. Select the minutes: 10, 15, or 20.
2. Tap "Give to child".

### Step 5: A session (child)

The child sees YouTube Kids and the time light along the edge of the screen. The time light does not show numbers. When the light is almost back at the top-left corner, the session is almost complete. The parent can see the minutes in the session notification, and can pause or stop the session with the PIN. If the child opens a grown-up app, the cover screen shows. The voice speaks "এটা বড়দের অ্যাপ" in Bangla. The child taps "Back to my videos".

### Step 6: The end screen (child, then parent)

At 0 minutes, the time light closes the loop. Then the end screen shows the Tin Shotti mark, confetti, and "Well done! দারুণ! আজকের সময় শেষ". The voice tells the child to give the phone back to the parent.

One time each day, the child can tap "+5 min" without the PIN. Then the parent does these steps:

1. Enter the PIN.
2. Tap "Done". Or tap "+2 min" (one time each day). After "+2 min", the end screen gives no more time on that day.

The screen shows "Today: 20 min. Saved on this phone only."

### The first satisfactory result

The first satisfactory result is the first evening session that stops on time. The phone, not the parent, tells the child that the time is finished.

---

## 10 A failure and its repair

The failure: the battery saver stops the guard, or a permission is OFF.

The repair:

1. The app does a guard test before each handover.
2. If the test is not satisfactory, the app shows "Not protected yet" and the repair for the phone brand.
3. The "Give to child" button is not available until the test is satisfactory.

The known limit: if the guard stops during a session, the app cannot tell the parent at that time. The spike measures how frequently this failure occurs. The app tells the parent at the next handover (GRD-01).

Other known limits of the MVP:

- The child can use some quick settings tiles during a session, for example "Airplane mode" (HND-27). Calls to 999 continue to operate in airplane mode [ASSUMPTION]. We did not close the quick settings with the Accessibility service. Cause: this also closes the session notification of the parent.
- The child cannot answer app calls during a session (HND-25).
- If the child knows the screen lock of the phone, the child can set a new PIN. The app cannot stop this, but it tells the parent at the next handover (TMR-11a).

---

## 11 Privacy decision

- The app knows only the name of the foreground app. The app does not know the screen content or the videos.
- The app does not have a child account, the name of the child, or a photo of the child.
- The session history stays on the phone.
- The child always sees the time light. Tin Shotti does not monitor the child at times when the child cannot see the time light.
- During a session, the notifications of the parent do not show (PRV-09). Thus, the child does not see the messages or the bKash codes of the parent. The app does not read the notifications.

The app always obeys these three conditions, and the child can see them:

- Only the permitted apps open.
- The time light is always on the screen.
- Each session stops with the same end screen.

---

## 12 Price and payment test

### 12.1 Free tools

| Free tool | Function on a shared phone | Limit |
|---|---|---|
| YouTube Kids | An approved-content mode and a timer [V2] | Operates only in YouTube Kids [V2] |
| App pinning | Keeps one app on the screen [V4] | Only one app. The person who uses the phone can stop it [V4]. |
| Digital Wellbeing app timers | A limit for one app for each day [V11] | One limit for each app. No handover and no session. |
| Samsung Kids | A child mode with a PIN [V10] | Only on Samsung Galaxy phones [V10] |
| Family Link | Controls for parents [V3] | The child must have a Google Account [V3]. |

### 12.2 Causes for a payment

The free tools do not give these three functions on a shared phone:

1. A setup that the parent can complete: one guided setup in Bangla, with steps for the phone brand. This function gives a solution for comment 3.
2. Control of the full phone, on all Android brands. Samsung phones and realme phones have a kid mode, but each kid mode operates only on its brand (assessment PDF, sources 10 and 15). Tin Shotti operates the same on all brands [ASSUMPTION: few parents find or use the kid modes].
3. The same end screen each evening. Thus, the problem in comment 2 can decrease [ASSUMPTION until the closed test in week 5].

All-day mode (version 2) can be a higher price tier subsequently.

### 12.3 Price

- The price is BDT 99 each month after a 14-day free trial [ASSUMPTION].
- A price of less than BDT 100 keeps the decision small for the parent [ASSUMPTION].
- Subscriptions must use Google Play billing [V7].
- Some websites that are not from Google tell that bKash connects to Google Play in Bangladesh. We did not find this statement on the pages of Google [ASSUMPTION].
- In week 1, we examine this statement on an account in Bangladesh.

### 12.4 Payment test before the build (week 2)

- The budget is BDT 5,000 for ads. At BDT 10 for each click, this budget gives approximately 500 visitors [ASSUMPTION].
- The landing page is in Bangla. It has a 40-second video of the version that the spike shows is possible.
- We show the ads in parent groups on Facebook. Most of the ads go to Dhaka and Chattogram.
- First, the page shows: "Which device does your 3–8-year-old use most?" Each visitor selects one device. This selection examines A-01.
- Then, the page shows: "Reserve the founding price: pay BDT 99 by bKash, refunded on request or if we don't launch."
- A subsequent payment through Google Play has one more step. Thus, the result of this test is a maximum value.

We set these decision conditions before the test:

| Result of the test | Decision |
|---|---|
| 2% or more of the visitors make the payment (approximately 10 of 500) | Continue. |
| 0.5% to 2% of the visitors make the payment | Do a test with different text on the page. Or do a test with a price of BDT 49. |
| Less than 0.5% make the payment, or most visitors tell that YouTube Kids or Samsung Kids is sufficient | Remove the price of the app. Get revenue from a telco bundle or a school bundle. Or select a different problem. |

The limit of this test: 500 visitors can show only a clear "yes" or a clear "no". The limits in this table are estimates.

---

## 13 Metric for the first two weeks after launch

### 13.1 The metric: week-2 return rate

`week-2 return rate = B / A`

- A: The number of families who complete the setup in the launch week.
- B: The number of families in A who start 3 or more sessions in week 2.

Cause: three evenings show that the family uses the handover as a usual procedure [ASSUMPTION].

### 13.2 How we measure the metric

- The app sends the events in PRV-01 to Firebase Analytics for each install ID.
- The events do not contain data about the child, app names, or video titles.
- We want 100 or more setups from the reservation list and from parent groups.
- We also speak with 10 parents in short phone calls.

### 13.3 Decisions

We set these decision conditions before the launch:

| Result | Decision |
|---|---|
| Week-2 return rate of 40% or more | Continue. Set the paywall to ON. |
| Week-2 return rate of 20% to 40% | Change. Speak with 10 families who stopped. First, repair the setup and the failures for each phone brand. |
| Week-2 return rate of less than 20% | Stop the work on new functions. Examine the problem selection again. |
| On more than 50% of the week-2 days with a session, the parent gives "+2 min" or uses "Add time today" | Change, at all return rates. This result shows that the end screen does not give a solution for comment 2. The "+5 min" of the child is part of the design, so it is not a failure. |

---

## 14 Schedule and gate

| Week | Developer | Product manager |
|---|---|---|
| 1 | Do the spike for 3 days on the 4 test phones (A-02 in section 15). | Make the Figma prototype. Examine bKash with Google Play on an account in Bangladesh. Prepare the landing page. |
| 2 | Build the setup (F3) and the timer (F2). All versions of Tin Shotti use these two functions. | Do the payment test (section 12.4). |
| End of week 2 | Gate (refer to the table below) | Gate |
| 3 and 4 | Build the guard (F1). | Prepare the closed test. Find 15 families. |
| 5 | Repair the problems from the closed test. | Do the closed test with 15 families. Monitor 10 families for one week. |
| 6 | Send the app to Play review. | Do the launch from the Nagorik developer account [V9]. |

The gate at the end of week 2:

| Condition | Decision |
|---|---|
| The guard and the payment test are satisfactory. | Build the guard in weeks 3 and 4. |
| The guard is not satisfactory. | Make a guided setup of the free tools available. Do a new test of the price. |
| The payment test is not satisfactory. | Stop. |

Do the guard tests with the two guard methods. If S-01, S-03, S-08, or S-09 is not satisfactory on 2 or more test phones with each method, the guard is not satisfactory.

The AI coding platform makes the build of the screens faster. It does not make the tests on the test phones faster.

---

## 15 Risks and assumptions

| ID | Assumption | Effect if the assumption is incorrect | How we examine it | Week |
|---|---|---|---|---|
| A-01 | Most children of 3 to 8 years use the shared phone of a parent. | The handover is not the primary problem. | The device selection on the landing page | 2 |
| A-02 | A usual Play Store app without device owner rights can keep a child in the permitted apps. This assumption has the highest risk. | F1 is not possible. We make the guided setup of the free tools available. | Tests S-01 to S-12 in the spike, on the 4 test phones | 1 |
| A-03 | Play review accepts the guard and its declarations before the end of week 6. | The launch is after week 6. | Tests S-13 to S-17 | 1 and 2 |
| A-04 | A time light that the child can see decreases the problem in comment 2. | F2 does not help the family. | The closed test and the "+2 min" limit in section 13 | 5 to 8 |
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

### 15.1 Data that does not agree with A-02

- Without device owner rights, Android has only app pinning. The person who uses the phone can stop app pinning [V4].
- On Xiaomi and Samsung phones, battery savers frequently stop background apps [V5].

### 15.2 Spike steps for the developer (week 1, 3 days)

Do these steps on the 4 test phones with Android 10 to 15:

1. Examine the two guard methods: "Usage access" with an overlay, and an Accessibility service [V12].
2. Measure the time until the cover screen shows.
3. Make sure that the guard operates for 45 minutes with the battery saver ON.
4. Make sure that incoming calls and 999 operate during a session.
5. Try to open a grown-up app from the notification shade, the recent apps, and a split screen.
6. Try to open a grown-up app after a restart of the phone.
7. Find the declarations that are necessary for Play review, for example `isMonitoringTool` [V8] and the foreground service type.
8. Make sure that Play does not identify the app as an app for children (A-08).
9. Record the number of days for the Play review of a test version.
10. Make sure that all touches go through the time light to the permitted app, on Android 12 to 15, with the two guard methods (A-10).
11. Make sure that the time light shows correctly with round corners, a camera cutout, curved edges, a full-screen video in landscape, gesture navigation, and the 3 navigation buttons (A-13).
12. Make sure that "Do not disturb" stops the notifications of WhatsApp and bKash during a session, and that phone calls ring (A-11).
13. Try to open a cloned WhatsApp, a Messenger chat head, and an Android chat bubble during a session (A-14).
14. Try to remove Tin Shotti, or open "App info", from the home screen during a session (A-14).

---

## 16 Open problems

1. The primary open problem: does a timer that the phone controls decrease the problem in comment 2? Or does the child not agree after the "+5 min", so that the parent gives "+2 min" or adds time each night? The closed test and the "+2 min" limit in section 13 examine this problem.
2. Do most children of 3 to 8 years in Bangladesh use the phone of a parent, a tablet, or a TV?
3. Do parents make a payment of BDT 99 each month when free tools are available? Can they make the payment through Google Play without a card?
4. Can we use the name Tin Shotti as a trademark in Bangladesh? We did not do a trademark search in classes 9 and 42. A trademark agent must do this search before the launch.
5. On 3 November 2026, the registry had no data for `tinshotti.com` and `tinshotti.app`. We did not examine `.com.bd`.
6. Until the app is on the Play Store, a search for "Tin Shotti" on the Play Store shows Teen Patti card apps. The app name must be "Tin Shotti", not "Teen Shotti". Cause: "Teen Shotti" is almost the same as "Teen Patti".
7. Which phone models do the families have? We select the 4 test phones in week 1 from this data.
8. Do two children of 3 to 8 years share one phone in the evening? Is one daily time for the phone sufficient for these families?
9. In families where a parent works in a different country, do app calls (WhatsApp or IMO) come during the sessions? Must version 2 let these calls through?

---

## 17 Acceptance conditions

The MVP is completed when these conditions are satisfactory:

- All P0 tests are satisfactory on the 4 test phones. For each P0 failure that we accept, the product manager writes the cause.
- The spike results (S-12) and the Play review data (S-13 to S-17) are completed before the end of week 2.
- All P1 tests are satisfactory, or the list of known problems for the closed test includes them.
- The Data safety form agrees with PRV-01 to PRV-03.
- The closed-test reports for G-12, L-02, and W-03 are completed.

---

## 18 Sources

We examined these sources on 3 and 4 November 2026. Sources V1 to V4, V6 to V12, and V14 to V17 are pages from Google or Samsung. V5 is a community site. V13 is a news article.

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

---

## 19 Document changes

| Version | Date | Change |
|---|---|---|
| 1.4 | 4 November 2026 | Children of 9 to 14 years: a third age group; the parent can allow a maximum of two more apps (SET-04a). The colors of the time light follow the Nagorik palette: Lilac, Violet, Electric. The author spoke informally with some parents (section 1.3). |
| 1.3 | 3 November 2026 | Extra time. The child has one "+5 min" each day without the PIN (TMR-10, TMR-10a). Then the parent has one "+2 min" with the PIN (TMR-10b). Then the end screen gives no more time (TMR-10c). Real exceptions use "Add time today" in the settings (TMR-10d). The summary shows the evenings without "+5 min" to the parent (TMR-15a). We do not give minutes as a reward (section 6.2). Changed: F2, TMR-08, WIN-01, WIN-04, WIN-08, PRV-01, PRV-02, section 9, the decision in section 13.3, R-02, A-04, and open problem 1. Brand identity v3: new colors and the new mark. |
| 1.2 | 3 November 2026 | Review of the edge cases. The time light: TMR-02b is now P0 and includes curved edges and the system bars; new TMR-02c, TMR-02d, the light check (SET-25 to SET-27), and PLT-07. The guard: "Do not disturb" during a session (HND-20, HND-21, SET-28, PRV-09), cloned apps (HND-22), the uninstall dialog (HND-23), floating chats (HND-24), app calls (HND-25), payment screens (HND-26), and quick settings tiles (HND-27). The PIN: TMR-11a and TMR-11b. "+5 min" after the daily time (WIN-08; WIN-01 changed). New: A-11 to A-14, V14 to V17, spike steps 12 to 14, open problems 8 and 9, and two functions in section 6.2. |
| 1.1 | 3 November 2026 | The time light along the edge of the screen replaces the small timer display. The child does not see numbers. New: the session notification for the parent, with "Pause" and "Stop" (TMR-16 to TMR-18), and confetti on the end screen. Cause: a small display on top of the app can stop the child from using the app, and the child can start to dislike Tin Shotti. |
| 1.0 | 3 November 2026 | First issue. We made this document from the assessment (version 3) and the test cases (version 3). The name of the app changed from "Shishu Mode" to "Tin Shotti". |

The author used Claude (Claude Code) to write the text in STE. Claude also examined the text against a version of the STE dictionary that is not from ASD. The decisions about Tin Shotti come from the assessment.
