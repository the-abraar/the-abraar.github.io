# Tin Shotti: UI/UX principles (v3, 4 Nov 2026)

Eight principles for every screen of the MVP. They come from the product decisions in the assessment and the PRD (`../prd/tin-shotti-prd.md`); IDs in brackets point to PRD requirements and test cases (`../notion/test-cases.md`). Colours and type are in `brand-guidelines.md`; `ui-samples.png` shows five screens built on these rules.

Two people use one phone, at different moments:

| | Parent | Child (3–8) |
|---|---|---|
| When | Setup once (~3 min), then a few seconds each evening | 10–45 min, every evening |
| Reads | Bangla; some don't read English [ASSUMPTION] | Often not at all, at 3–5 [ASSUMPTION] |
| Wants | A calm handover and a fair, automatic end | More time, and to know what happens next |
| Screens | Cream with Lavender cards, text-led, compact | Cream, Lavender or Ink; picture-led, big, spoken |

---

## 1. Honest status, always

**Never show "protected" when it isn't.**

- The app tests the guard before every handover. If the test fails, **Give to child** stays disabled and the screen shows the one fix for that phone brand [HND, GRD, H-03, G-11].
- Every status says *when* it was true: "সুরক্ষিত · টেস্ট পাস ৭:০২" (Protected · test passed 7:02).
- If protection stopped during a session, say so plainly at the next handover, with the fix [F-01].
- Status = colour + icon + words: ✓ Protected (green chip), ✕ Not protected yet (red chip).

## 2. Open rules, not secret watching

The child can always see the rules that apply to them.

- The time light runs along the screen edge for the whole session, so the child always knows a session is on and roughly how much is left [T-01, P-07]. It is never hidden, and it never gets in the way (principle 8).
- No hidden mode, no screenshots, no record of what was watched. The app knows only which app is in front [PRV].
- Privacy is shown, not claimed: "শুধু এই ফোনেই সেভ থাকে" (Saved on this phone only) sits under the main button [T-13].
- No child name, photo, school or birthday is asked for, anywhere [P-03].
- The parent's privacy counts too: during a session, Do not disturb keeps their WhatsApp messages and bKash codes off the screen, without the app reading any notification [HND-20, PRV-09, S-20].

## 3. One decision per screen, Bangla first

Setup target: 3 minutes, with no help [R-03, G-12].

- Each setup screen asks for one thing: language and age, then apps and PIN, then permissions. Progress is always visible.
- Bangla is the default; a বাংলা / English switch is on the first screen [G-01]. Every string exists in both [LNG-04].
- Smart defaults do most of the work: YouTube Kids pre-ticked, daily time suggested by age, grown-up apps pre-blocked [G-02, G-03].
- Permission steps show real pictures for the parent's phone brand [G-07, G-08]. A row flips to ON as soon as the parent returns [G-09].
- Leaving halfway loses nothing [G-13].

## 4. The evening handover is two taps

Open the app, pick the minutes, tap **শিশুকে দিন / Give to child** [H-02].

- The big number is what matters: minutes left today, in Hind Siliguri display size.
- Minute choices never exceed what's left [W-01]. Outside the window, the button is off with the reason: "Opens at 6 pm" [W-02].
- One primary button per screen, Violet, full width, at thumb height.
- What stays on (YouTube Kids, calls, 999) is shown in a Lavender card, so the parent sees the rules before handing over.

## 5. The child never has to read

Every child screen works through **picture + voice + one big button** [LNG-02, L-02].

- Child touch targets are **64 dp or larger** (PRD minimum: 48 dp [LNG-03]).
- At most 3 words, spoken by the Bangla voice line.
- The grown-up cover is Lavender, with a simple adult silhouette holding a phone, "এটা বড়দের অ্যাপ" spoken once, and one button: **ভিডিওতে ফিরে যাই / Back to my videos** [H-05, H-06].
- Taps only. No swipes, long-presses or hidden gestures for the child.

## 6. A kind ending, the same every time

The phone ends the session, so the parent doesn't have to be the bad guy. This is the core bet [R-02].

- **2 minutes left:** the light, now Electric and nearly back at the start, pulses slowly; one soft chime and a voice line play once. Silent mode stays silent; only the pulse shows [T-03, T-04].
- **Time's up:** the light closes its loop and glows around the whole screen for a second, like a finished drawing. Then the Ink end screen: the mark (a parent and a child making a heart), **3 seconds of confetti** in the brand colours, "দারুণ! আজকের সময় শেষ", and "ফোনটা আব্বু-আম্মুকে দাও". The same screen, sound and voice every time. The ending should feel like a small celebration, not a door closing [T-05].
- With "Remove animations" on, the confetti is shown still and nothing flashes [T-05b].
- **The child's own +5, once a day.** A big Violet **+৫ মিনিট · আজ একবার / +5 min, once today** button the child can tap without the PIN. A little say in the ending, without the parent giving in [TMR-10, T-08].
- **Then the parent, then no more.** After the child's +5, only the parent's PIN works: **শেষ / Done** (primary) or **+২ মিনিট / +2 min** (outlined, smaller, once a day). After +2 the screen says **আজ আর সময় নেই / No more time today**, so the parent can point to the phone: the rule, not the parent, says no [TMR-10b, TMR-10c, T-08b, T-08c].
- **Real exceptions live in settings,** behind the PIN (**Add time today**), never on the end screen, so the evening rule looks the same every time [TMR-10d].
- **No minutes as a reward.** Evenings without +5 are shown to the parent in the summary; the parent decides how to celebrate. Bonus minutes would make screen time the prize [TMR-15a, PRD 6.2].
- The confetti celebrates *finishing*, never *using more*. No streaks, points, badges or "come back tomorrow". We want less screen time, not more engagement.
- Never punish: no red screens, no alarms, no "you used too much".

## 7. Safety first, even over our own rules

- **Incoming calls and 999 always work**, during a session and on the end screen; the end screen says so [E-01, E-02].
- **Grown-up apps can never be allowed**, so a tired parent can't unlock bKash or WhatsApp by mistake [G-03, E-04].
- A forgotten PIN is reset with the phone's own screen lock: no account, no email [T-10].
- Everything works offline [F-05].

## 8. Time is a light for the child, a number for the parent

A floating timer sits on top of what the child is doing: it covers buttons, it can be fiddled with, and a number counting down feels like a threat. A child who resents the app fights the handover, and the argument comes back.

- **For the child: the time light.** A soft line of light grows clockwise around the screen edge from the top-left corner. Its colour deepens from Lilac through Violet to Electric as time runs out. When it meets its start again, time is up. The gap that's left *is* the time left; no numbers, no reading [TMR-01, TMR-02a, T-01, T-01b].
- **It never gets in the way.** Every touch goes through it; it can't be tapped, moved or closed; it stays at the very edge, follows round corners and the camera cutout, and turns with full-screen video [TMR-02, TMR-02b, T-02, S-18, S-19].
- **It is never half-hidden.** Curved glass, a thick case or the system bars can hide part of the edge, and on a tall phone the light spends most of a session on the long sides. So setup ends with a light check: the light runs round once and the parent answers "Can you see all of the light?" "Part is hidden" moves it in and runs it again. The same check is behind the PIN for later [TMR-02b, SET-25 to SET-27, G-15, G-16].
- **For the parent: the session notification.** Pull down the shade to see "তিন সত্যি চালু আছে · Tin Shotti is on", the minutes left, a progress bar, and **Pause** and **Stop**. Both ask for the PIN first, so a curious child gets only the PIN screen [TMR-16, T-14].
- **Pause is a calm break,** not a punishment: a quiet break screen, the light stops and dims, and the paused minutes aren't taken from today's time [TMR-17, T-15].
- **A way back, always.** If the notification is swiped away, it comes back; the Tin Shotti icon always opens the parent's PIN screen [TMR-18, T-16].

---

## Interaction details

| Topic | Rule |
|---|---|
| Motion | Calm: 200–300 ms, ease-out. The time light grows smoothly but almost imperceptibly; it only draws attention in the last 2 minutes. Confetti falls for 3 seconds, slowly, with no flashing. With "Remove animations" on, the light moves in small steps and the confetti is still. |
| Feedback | Every tap responds within 100 ms. The guard test shows words while it runs: "পরীক্ষা চলছে… / Testing…". |
| Errors | What happened, then the one thing to do. No error codes. |
| Empty states | Teach the next step: "No learning apps yet. YouTube Kids is enough to start." |
| PIN | 4 digits, large keypad. After 5 wrong tries, a 30-second wait with a visible countdown [T-09]. |
| Accessibility | TalkBack labels in the selected language for every control and ON/OFF state [LNG-05, G-14]. Text scales to 130% without clipping. Contrast meets AA (checked in the build). |
| Layout | Designed first for 720 × 1600 at 6.5" [ASSUMPTION: common low-cost size]. Single column, 20 dp margins. |

## Screen map

| Screen (PRD §9) | Who | Background | Principles |
|---|---|---|---|
| 1. Welcome | Parent | Cream | 3 |
| 2. Allowed apps + PIN | Parent | Cream, Lavender cards | 3, 7 |
| 3. Switch on protection | Parent | Cream | 1, 3 |
| 4. Hand over | Parent | Cream | 1, 4 |
| 5. Session + grown-up cover | Child | Cream / Lavender | 2, 5, 8 |
| Session notification and break screen | Parent | Cream card / Lavender | 1, 8 |
| 6. Time's up | Child, then parent | Ink | 6, 7 |

## How we'll know the principles work

| Principle | Signal | Source |
|---|---|---|
| 3. One decision per screen | Median setup ≤ 3 min, unaided | G-12 |
| 5. Never has to read | 3 of 3 young children return from the cover without help | L-02 |
| 6. A kind ending | Few evenings need the parent's +2 or Add time today; the child's +5 is expected | M-02 |
| 1. Honest status | Zero false "protected" states on all test phones | H-03, F-04 |
| 8. Time as a light | Children point to the gap when asked "how much is left?"; no child says the light gets in the way | T-17, S-18 |
