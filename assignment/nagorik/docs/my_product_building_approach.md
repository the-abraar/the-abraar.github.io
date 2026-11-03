# Tin Shotti: how I built the answer

This page sits alongside my Junior PM assessment PDF for Nagorik Technologies. The PDF is the two-page answer. This page shows how I got there: the working diagrams, the UI, and what I'd hand a developer: a product map workbook, the test cases and a PRD.

**The brief, in one line:** a child digital-safety MVP for Bangladeshi families with children aged 3–14, one developer with an AI coding platform, six weeks.

**The PDF is the answer.** Everything below is optional background for anyone who wants the detail.

**What's here:** the reasoning (sections 1–8), the developer hand-off (section 9), the UI and brand (subpage), and how I worked with AI and how long it took (section 11).

> 📎 *Attach: Abraar_Masud_Nafiz_JuniorPM_Assessment.pdf, tin-shotti-product-map.xlsx; subpages: Tin Shotti: UI and brand, Tin Shotti: acceptance test cases*

---

## 1. Start from the constraints, not the features

One developer and six weeks means every capability has to earn its place, and anything the AI platform can't speed up (testing on real, low-cost Android phones) is where the schedule risk lives. So I asked "what is the smallest thing that solves one real moment?" before asking "what could this product do?"

## 2. Pick one moment, not a whole market

Three of the four parent comments in the brief happen in a single moment: **the evening, when a parent hands their own Android phone to a young child.** That's what the child watches next, the argument at hand-back, and the setup that was too hard. The fourth comment ("why pay when free exists?") isn't a product problem; it's the pricing question.

I framed this with the MITRE Problem Framing Canvas, then mapped options with an opportunity solution tree, so every feature traces back to a parent problem and every rejected idea has a reason.

> 📎 *Image: 01-problem-framing.png*
> 📎 *Image: 02-opportunity-tree.png*

I also wrote down the one assumption that could make this choice wrong: that most 3–8-year-olds watch on a parent's shared phone. The landing-page test asks every visitor about it.

**9–14-year-olds: later, on purpose.** Most have their own phone, where Family Link already fits. If one shares a parent's phone, they use the same app with a little more room: the parent can allow one or two more apps, such as a school or reading app. More options for older children come with v2.

## 3. Evidence before claims

The brief asks that technical capabilities be verified or marked as assumptions. I took that literally: every claim in the PDF either links to an official source (blue number) or carries a yellow **ASSUMPTION** tag. I talked informally with a few parents I know. That shaped my choices, but it isn't research, so every claim about parents stays an assumption.

Checking sources changed the plan. The Android documentation I found pointed *against* my core idea: without device-owner rights, Android only offers screen pinning, which the user can leave. That turned "can we keep a child inside allowed apps?" into the riskiest assumption, and it shaped the whole schedule.

> 📎 *Image: 04-competitor-scan.png*
> 📎 *Image: 05-positioning-map.png*

The competitor scan only states what each official page says. Built-in kid modes already exist on some brands (Samsung Kids on Galaxy, realme's Kid Space), but each works on one brand, in its own menus, without a guided Bangla setup, and realme's ends by locking the phone. So the bet isn't "the only kid mode". It's "the one that's easy and kind on any brand", and the landing page asks parents whether they've ever used their phone's kid mode. Android 16's new built-in Parental controls are the one to watch: they're made for the child's own device and need Android 16, but they show where Google is heading, so speed and the Bangla setup matter.

## 4. Scope around the riskiest assumption

- **In (3):** one-tap handover with allowed apps; a daily time the child can see, with a kind ending; a 3-minute guided setup in Bangla.
- **Out (2):** our own content filtering (YouTube Kids already does it, and one miss destroys trust) and a remote dashboard (accounts, backend, child data).
- **First:** a 3-day developer spike in week 1 that tests the guard on four low-cost phones before anything else is built. If it fails, there's a named fallback: ship a guided setup of the free tools. That fallback loses the "whole phone, any brand" reason to pay, so it launches free and pricing is re-tested before we charge anything.
- **One more bet I made explicit:** YouTube Kids is the default because it filters for free, but a child used to YouTube has to accept it. If children refuse it in the closed test, "what they watch next" needs its own fix; loosening the guard isn't one.

Three assumptions decide go, change or stop, and the PDF tags them **BET 1–3**: the visible ending calms the evening (product), a normal Play Store app can hold the guard (technical), and parents pay without a card (business).

> 📎 *Image: 06-mvp-scope.png*

## 5. Decide in advance what would change my mind

Every test has thresholds written down *before* it runs, so the result can't be argued away afterwards:

- **Willingness to pay (week 2, before the build):** a Bangla landing page with a refundable BDT 99 reservation by bKash. 2% or more of visitors paying is a pass; under 0.5% means reconsider.
- **Success after launch:** the week-2 return rate (families who start 3+ sessions in week 2). 40% or more: continue. 20–40%: change. Under 20%: stop.
- **Paying is the second big risk:** subscriptions must use Google Play billing, and Google's payment-methods page doesn't list Bangladesh, which means cards only (I rechecked it on 4 Nov; some third-party guides say bKash works). Week 1 tests bKash and carrier billing on a Bangladeshi account; if neither works, the fallback is a telco or MFS bundle, which Nagorik already builds.
- **Honest about sample size:** 500 landing-page visitors and about 100 launch families only separate a clear yes from a clear no (about ±10 points on the return rate), so the bands are wide on purpose.
- **A guard on the core bet:** if on most evenings the parent gives "+2 min" or adds time in settings, the timer isn't ending the argument, whatever the return rate says. The child's own "+5" is expected, so it doesn't count against us.

> 📎 *Image: 07-plan-and-gates.png*

## 6. Design for failure and trust, not just the happy path

The journey map compares today with Tin Shotti at each step, and shows what we count at each step and what we deliberately don't.

> 📎 *Image: 03-journey-map.png*
> 📎 *Image: 08-screen-flow.png*

Two rules guided the screens:

- **Never show "protected" when it isn't.** The app tests the guard before every handover; if it fails, *Give to child* stays off and the parent sees the one fix for their phone brand.
- **Open rules, not secret watching.** The child always sees the time light. The app reads only which app is in front, never what's on screen, and history stays on the phone.

The full screen set (26 screens), flows, corner cases and the brand are on the **Tin Shotti: UI and brand** subpage.

## 7. Product decisions I made along the way

- The timer **pauses when the screen is off**; off-screen time never counts.
- An optional **active window** (e.g. 6–10 pm): minutes not used inside it are lost that day, so time can't be saved up for late at night.
- **Grown-up apps can never be allowed**, but **incoming calls and 999 always work**. Safety shouldn't be blocked by a safety app.
- A forgotten parent PIN is reset with **the phone's own screen lock**, so no account is needed.
- **Time is a light, not a number.** A floating countdown would sit on top of what the child is doing, and a child who resents the app fights the handover. Instead, a soft light grows clockwise round the screen edge, lilac to violet to electric blue, and closes its loop when time is up. Nothing to tap, nothing covering the video.
- **The parent's controls live in a notification:** minutes left, **Pause** and **Stop**, both behind the PIN.
- **The ending is a small celebration:** confetti and the same kind words every time. Not a door closing.
- **Extra time has a fixed shape:** the child gets one "+5 min" a day without the PIN. Then the parent has one "+2 min" with the PIN. Then the screen says "No more time today", so the parent can point to the phone instead of being the one who says no. Real exceptions go through **Add time today** in settings, never the end screen.
- **No minutes as a reward.** I considered "+20 min after three days without +5" and dropped it: bonus minutes make screen time the prize. The parent sees "3 evenings in a row without +5" in the summary and decides how to celebrate.
- **The brand follows Nagorik's visual language** (ink, violet, lavender, cream). It's not what I'd pick for a consumer launch, which I'd test with parents first. But it makes Tin Shotti read as part of the Nagorik portfolio, next to products like Enova VPN's one-tap protection.

## 8. Where it could go next (v2 ideas, not in the six weeks)

- **All-day mode** for a phone the child carries for safety, including 9–14-year-olds with their own phone: apps by time of day, a daily total, calls to family and 999 always on. On a phone given only to the child, the app can be its device owner, which unlocks Android's lock-task mode: a sturdier guard than the MVP's.
- **A safe browser:** off by default, allowed sites and emergency pages only, every visit logged for the parent, and the child can see that it is. An AI summary for parents would send browsing data off the phone, so it needs explicit consent and a new privacy promise first.

> 📎 *Image: 09-product-modes.png*

## 9. Hand the developer something they can run

People don't read long PRDs any more, and they shouldn't have to. So the hand-off comes in two forms, with the same content:

- **For people: the product map workbook** (`tin-shotti-product-map.xlsx`). It works breadth-first. The first tabs show the whole product on one screen (problem, bets, plan, decisions), then the three capabilities, then the UI hierarchy (26 screens in 6 flows, what each shows top to bottom), then the design system, the 123 requirements, the 123 test cases (113 MVP + 10 v2, with a Status drop-down for QA), the edge cases and the assumptions. Every row links across levels: a screen lists its requirements and tests, and a test lists its requirements and screens. You see the shape first and go deep only where you need to, the way developers and system engineers already think about a build.
- **For AI coding agents: the PRD** (`tin-shotti-prd.md`). One file where every rule has an ID, a priority and the test that proves it, so an agent can build and check one requirement at a time. It's deliberately dense, and I cut it from 765 lines to about 380 for v7. A person reading it top to bottom has to jump between sections and IDs, which is why the workbook exists.

The test cases (Given / When / Then, P0–P2) start with the week-1 spike: escape routes a 7-year-old might find, battery-saver survival, calls and 999 during a session, privacy checks on what leaves the phone, and the time light and window rules. They're also on the **Tin Shotti: acceptance test cases** subpage, with a CSV that imports into Notion as a pass/fail tracker. The workbook is generated from the PRD, the test cases and the screen definitions, so the three can't drift apart.

> 📎 *Attach: tin-shotti-product-map.xlsx, tin-shotti-prd.md, test-cases.csv*

## 10. Iterate in the open

- **v1:** the first full answer.
- **v2:** an adversarial critique of the draft, and fixes for what it found: the free competitors I'd missed (Samsung Kids, Digital Wellbeing), the payment test moved before the build, a guard on the metric, screens for children who can't read yet, and an AI disclosure that says what I decided.
- **v3:** my own product decisions (section 7), the v2 ideas (section 8), and Nagorik's visual language for the PDF and diagrams.
- **v4:** the child should like the app too. The countdown bubble became the time light round the screen edge, the parent got a notification with Pause and Stop, and the ending got confetti.
- **v4.1:** an edge-case review of the spec: the light stays visible on curved screens, other apps' notifications stay hidden during a session (only Tin Shotti's PIN-locked Pause/Stop shows), and cloned apps, the uninstall menu and chat heads are covered. Calls the child can't answer, and two siblings sharing one daily time, are now written-down decisions.
- **v5:** extra time got a fixed shape (the child's +5, the parent's +2, then no more), and the mark "Together": a parent and a child whose bodies make a heart.
- **v7:** about 25% fewer words in the PDF with larger type; the three deciding assumptions tagged BET 1–3; YouTube Kids acceptance marked as an assumption (and test H-11); the free plan B if the guard fails; a sample-size caveat; the product map workbook as the human view of the PRD, and the PRD cut in half for AI agents.
- **v6:** one visual language everywhere (Nagorik's), a line for 9–14-year-olds, the brand kid modes and Android 16's Parental controls in the competitor scan, payment named as the second big risk, and a lighter PDF that lets these notes carry the detail.
- **A name, then a PRD:** the working name "Shishu Mode" became **Tin Shotti (তিন সত্যি)**, the childhood "triple swear": three promises kept openly (only the apps you chose, a time the child can see, a kind ending). "Shishu" can sound like "baby" to older children, and Tin Shotti was the only shortlisted name where the checks found no app, company or slang clash and both domains free (trademarks not yet checked).

## 11. How I worked with AI

**My time: about 80 minutes in front of the screen, in total.** That covers reading the brief, thinking about the problem, reviewing what the agents produced, and making the decisions, spread over two days and tracked with a Pomodoro timer, as I track all my projects. I work in parallel: when the brief arrived I spent about 2 minutes handing it to a review agent and went back to other work. When I came back, I read its review, wrote the next prompt and left again. Most of the drafting happened while I was doing something else. AI can do most of the production; my job is the judgment, the nudges, the right prompt, and giving the agents the right tools and skills. So the brief's "about 60 minutes" was my thinking time, not typing time.

AI was the team I didn't have. I set the direction and made the decisions; AI agents did the research legwork, the drafting and the production, and I reviewed everything they produced.

**1. Research agent first.** A Claude research agent (in Claude Code) swept official sources: Android developer docs, Google Play policy, YouTube Kids and Family Link help, Samsung Kids, Android 16 Parental controls, and Bangladesh's 999 service. It returned summaries with links. I opened each linked source and checked the PDF's claims against it; anything I couldn't confirm is tagged ASSUMPTION. A final fresh-eyes review agent still found two gaps (realme's Kid Space, and card-only Play payments in Bangladesh), and both are now in the PDF.

**2. Then people.** I talked to a few parents I know about the evening handover, what they'd tried and what they'd pay. Not research, but enough to choose the moment and test my instincts.

**3. My decisions, then AI drafts.** With the problem, cuts, price, thresholds and timer rules decided, I sketched the screens by hand first. Then I had AI draft the problem framing canvas, the opportunity solution tree and the PRD. The PRD is in ASD-STE100 Simplified Technical English, the controlled language aerospace manuals use, so a developer reads one meaning per sentence. I updated it incrementally (1.0 to 1.4) as decisions changed, then cut it to a short AI-facing version (2.0) with the workbook as the human view.

**4. The PDF with Claude.** I built the two-page PDF with Claude in Claude Code: LaTeX for the layout, TikZ for the six phone sketches, and every source as a live link.

**5. Specialist agents in parallel.** While I worked on the core answer, I ran parallel sub-agents with narrow briefs:
- **UI/UX agents** for the screen set, flows and corner cases, with design-critique, UX-copy and WCAG accessibility-review skills (every text colour pair is checked against 4.5:1 in code).
- **A brand agent** that built the logo, the mark and the brand sheet as code (SVG and HarfBuzz text shaping), so every asset rebuilds from one palette. I decided the brand should follow Nagorik's own visual language so it's easy for the team to place. It's a deliberate choice, not the palette I'd pick for a consumer launch.
- **A marketing agent** for the name shortlist (app-store, company, slang and domain clash checks) and the Bangla landing-page copy for the payment test.
- **A QA agent** that turned the PRD into Given/When/Then acceptance tests, and an edge-case review that found gaps such as curved screens, cloned apps and chat heads.

**6. Adversarial review.** Each version went through a "grill me" critique: an agent told to attack the draft as a sceptical product lead would. It found the missing free competitors and moved the payment test before the build. I kept what held up and rejected what didn't. The +5 guard became a +2 guard on my call, once I saw that the child's own +5 is part of the design.

**The toolkit:** Claude (Opus) in Claude Code as the main workspace; Claude sub-agents for research, UI/UX, brand, marketing and QA; a PM skill library (PRD, JTBD, opportunity solution tree, RICE and MoSCoW prioritisation, pricing, experiment design, launch checklists); design skills (critique, UX copy, accessibility review, user-research planning); the Notion connector to publish these notes; LaTeX/TikZ and Python for reproducible documents and assets.

**What AI did not do:** pick the problem, make the cuts, set the price or the thresholds, or decide the extra-time rules. Those are mine, and I'm ready to defend and change them in the follow-up.

**What I'd add at Nagorik:** Dovetail or a similar tool to synthesise real parent interviews, Maze for unmoderated tests of the Figma prototype, Firebase or Amplitude dashboards for the week-2 metric, and an evaluation set for any AI feature (such as the parent summary) before it ships.

## What I'd want to learn first with real families

1. Does a timer the phone enforces actually reduce the evening argument, or does the child push past their own +5 and the parent give in every night?
2. Which device do 3–8-year-olds in Bangladesh really use most: a parent's phone, their own tablet, or the TV?
3. Will parents pay BDT 99 a month when free tools exist, and can they pay through Google Play without a card?
4. Do children used to YouTube accept YouTube Kids in its place?
