# Tin Shotti: brand guidelines (v3, 4 Nov 2026)

Tin Shotti (তিন সত্যি) is the childhood "triple swear": say it three times and the promise holds. The brand should feel like that promise: **calm, warm and dependable**. A parent trusts it with their child; a child feels safe, not watched.

Three promises, kept openly:

1. Only the apps you chose open.
2. The time light is always on the screen.
3. Every session ends the same kind way.

Earlier versions: v1 (three dots) and v2 (the "Held" arcs, shown in `concepts.png`).

> Nothing here was tested with parents or children. The closed test in week 5 is the first check (see "To check").

---

## 1. Personality

| We are | We are not |
|---|---|
| **Calm**: deep ink, soft cream, plenty of space | Clinical, alarming, "security software" |
| **Warm**: one violet accent, rounded shapes, a friendly geometric sans | Childish: rainbows, cartoon mascots, shouting colours |
| **Honest**: we say exactly what the app does | Salesy: "100% safe", fear, guilt |
| **Together, not watching**: a parent and a child; nothing has eyes | Surveillance: padlocks, eyes, shields with alarms |

---

## 2. Logo

**The mark: "Together".** Two figures, a parent and a smaller child, side by side. The curves of their bodies meet and make a heart in the space between them. Tin Shotti is something a parent and a child do together each evening, not something done to the child. Cream parent and Lilac child, on a Violet tile or on Ink.

The shape comes from the icon the owner chose on 3 Nov 2026 (an image exploration; the others are in `logo/other_ideas/`). `source/build.py` redraws it as clean vectors in the brand colours.

| File (`logo/`) | Use it for |
|---|---|
| `tin-shotti-mark` | The mark on its Violet tile: social avatars, favicons, small spaces |
| `tin-shotti-app-icon` | Play Store and launcher. Full-bleed Violet square; Android applies the mask. The figures sit inside the adaptive-icon safe zone. |
| `tin-shotti-logo-horizontal` | The main logo, on Cream or white: Ink wordmark, Violet Bangla |
| `tin-shotti-logo-reversed` | On Ink: the mark without its tile (Cream parent, Lilac child), Cream wordmark, Lilac Bangla |
| `tin-shotti-logo-stacked` | Square spaces: splash screen, posters, the landing-page hero |
| `tin-shotti-logo-mono` | One colour (Ink) on light backgrounds: print, stamps, receipts |

Each comes as SVG and PNG. **All text is already converted to outlines**, so the files look the same everywhere. Rebuild them with `source/build.sh`.

`concepts.png` records the directions explored for v2 and v3 and which one won.

**The app design file** is in `figma/`: six Figma-ready pages (foundations and components, flows, 26 screens, do/don't, corner cases). See `figma/README.md`.

**Rules**
- Pair the name with a descriptor until people know it: **"Tin Shotti: child mode for your phone"** / **"তিন সত্যি: ফোনের শিশু মোড"**.
- Spell it **Tin Shotti** (two words). Handles and domains: `tinshotti`. Never "Teen Shotti" (too close to Teen Patti).
- Clear space: at least the diameter of the child's head on every side.
- Smallest size: mark 24 px; horizontal logo 140 px wide. At 24 px the two heads and the heart must stay distinct.
- Don't: swap the parent and the child, close the gap at the bottom of the heart, add faces or eyes, put the mark on a photo, stretch it, or add shadows or gradients.

---

## 3. Colour

The palette deliberately follows Nagorik Technologies' own (nagorik.tech), so Tin Shotti reads as part of the Nagorik portfolio. A consumer launch brand would be revisited with research.

Deep ink and violet on a warm cream, with lavender tints: calm and trustworthy for the parent, bright enough to feel friendly to the child. No warm accent: warmth comes from the cream, the rounded shapes and the voice.

| Name | Hex | Role |
|---|---|---|
| **Ink** | `#080033` | Body text, headings on light screens, the dark end screen and dark backgrounds |
| **Ink Deep** | `#04001A` | Fields and pressed states on Ink |
| **Violet** | `#5533FF` | The brand colour: primary buttons, page titles, the logo tile, the child's own "+5 min" button, the middle of the time light |
| **Electric** | `#2B00FF` | Links, screen and test IDs, small labels on Cream; the end of the time light |
| **Lilac** | `#D4CCFF` | Borders, light fills, light text on Ink, the child in the mark, the start of the time light |
| **Lavender** | `#EAE5FF` | Parent-screen cards and chips, the grown-up cover, info cards, document backgrounds |
| **Cream** | `#F7F3EA` | The main background. Warmer than white. |
| **Muted** | `#4F4C70` | Secondary text, hints, timestamps |
| **Protected** | `#1E6A47` on `#E2F2E8` | "Protected" status only |
| **Not protected** | `#B42318` on `#FDECEA` | "Not protected yet", errors |

**Contrast.** `source/build.py` checks every text pairing below against WCAG AA (4.5:1) on each build and fails if one drops:
Ink on Cream 17.9 · Cream on Ink 17.9 · Ink on Lavender 16.2 · Ink on Lilac 13.1 · Lilac on Ink 13.1 · Violet on Cream 5.7 · Cream on Violet 5.7 · Violet on Lavender 5.2 · Electric on Cream 7.5 · Electric on Lavender 6.7 · white on Electric 8.3 · Muted on Cream 7.3 · Muted on Lavender 6.6 · Protected 5.6 · Not protected 5.8.
**Not allowed for text:** Ink on Violet (3.1), Violet or Electric on Ink (3.1 / 2.4), Lilac or Lavender on anything light.

**Proportions:** roughly 60% Cream and Lavender, 20% Ink, 15% Violet, 5% Electric and Lilac.

**Status is never colour alone.** Always an icon (✓ / ✕) and words.

---

## 4. Type

| Role | Latin | Bangla |
|---|---|---|
| Wordmark, display, big numbers | **Plus Jakarta Sans** ExtraBold (800) | **Hind Siliguri** SemiBold |
| UI and body | **Plus Jakarta Sans** (500 / 600 / 700) | **Hind Siliguri** (Regular / SemiBold) |

Both families are free under the SIL Open Font License (Google Fonts) and can ship inside the app. Bundling Hind Siliguri avoids broken conjuncts on phones with poor system fonts (test L-01).

- Nagorik's own typeface is RM Neue, a proprietary geometric sans. Plus Jakarta Sans at 800 is the closest open geometric sans, so the wordmark and titles sit next to Nagorik's material without a licence. Use 800 only for the wordmark, page titles and large numbers; UI text stays at 500–700.
- **Scale (sp):** Display 40 · Title 28 · Heading 22 · Body 18 · Label 16 · Caption 13. Body is 18, not 16: Bangla needs the extra size on low-cost screens.
- **Line height:** 1.5× for Bangla, 1.4× for Latin. Bangla vowel signs reach above and below the line.
- **Child screens:** at most 3 words, 28 sp or larger, always spoken by the voice line.

---

## 5. Shape and layout

- **Rounded everywhere:** cards 22–24 dp radius, buttons fully rounded (pill), chips 22 dp. Echoes the curves of the mark.
- **One primary action per screen.** Violet marks it: the main button, or on child screens the one thing that matters to the child (the +5 button).
- **Generous space:** 20 dp screen margins, 24 dp between groups. Calm comes from space, not decoration.
- **Illustration:** flat, solid shapes in Ink, Violet, Lilac and Lavender. People are simple silhouettes with no facial features, like the mark. No photos of children, ever.
- **Icons:** rounded line icons at 2–2.5 dp stroke, or filled when they need to read from far away (child screens).

### The time light

The child's timer is a line of light around the screen edge, not a number (see `ui-ux-principles.md`, principle 8).

- **Path:** starts at the top-left corner, grows clockwise, and closes the loop at 0 minutes. The child's "+5 min" starts a new short loop.
- **Colour along the line:** Lilac `#D4CCFF` for the first 30%, Violet `#5533FF` around the middle (always Violet at half time), Electric `#2B00FF` for the last quarter, with short blends between them. The line deepens as time runs out; the head of the line shows how far the session has gone.
- **Form:** a 6–7 dp line with a soft 16–20 dp glow on the inside edge, at most 80% opacity, following the screen's own corner radius. It sits on the edge, never across content.
- **Always fully visible:** on curved glass, under a thick case, or behind the status and navigation bars, the light moves in onto the flat, visible part of the screen: 8 dp per "Part is hidden" tap in the setup's light check, up to 24 dp. Move it in; never make it brighter. Above 80% opacity, Android 12+ stops touches reaching the app below (PRD TMR-02b, TMR-02c, SET-25).
- **Contrast:** check it on a white screen and on a dark video (T-18). Lilac is pale on white (1.5:1), so the line carries a thin Ink edge; Violet (6.4:1) and Electric (8.3:1) read on white (TMR-02d).
- **Last 2 minutes:** a slow pulse (about one every 2 seconds). At the end, the full loop glows once for 1 second.

### Confetti

- Brand colours only: Violet, Electric, Lilac, Cream and Lavender, on Ink. Rounded dots and short curved strokes that echo the curves of the mark; no glitter, stars or flashing.
- Falls slowly for 3 seconds around the mark on the end screen, then settles. Shown still when "Remove animations" is on.

See `ui-samples.png` for five screens in this style.

---

## 6. Voice and tone

We sound like **a calm older cousin**: warm, short, on the child's side and the parent's side at once.

| Do | Don't |
|---|---|
| "দারুণ! আজকের সময় শেষ" / "Well done! Time's up for today." | "Screen time limit exceeded." |
| "এটা বড়দের অ্যাপ" / "This one is for grown-ups" | "Blocked!", "Access denied" |
| "এখনও সুরক্ষিত নয়। এটা চালু করুন:" / "Not protected yet. Turn this on:" | "Error: permission missing" |
| "শুধু এই ফোনেই সেভ থাকে" / "Saved on this phone only" | "We respect your privacy." |
| "ফোনটা আব্বু-আম্মুকে দাও" / "Give the phone to Abbu or Ammu" | "Return device to parent" |

- **Bangla first.** Write the Bangla, then the English; don't translate English copy word for word.
- **Say what happens.** Never "protected" unless the guard test just passed.
- **No guilt, no fear.** No "danger", no "addicted", no shaming the parent for +2 min.
- Address the parent as আপনি and the child as তুমি.

---

## 7. Sound

- A soft two-note chime at 2 minutes left; a warm three-note rising phrase on the end screen (the three promises).
- One recorded Bangla voice, slow and warm. The same line for the same event, every time.
- Sound never overrides silent mode; the visual cue still shows.

---

## 8. Applying the brand

| Place | How |
|---|---|
| Play Store icon | `tin-shotti-app-icon` |
| Play Store feature graphic | Ink background, the reversed logo, "তিন সত্যি: ফোনের শিশু মোড" in Cream |
| Splash screen | Cream background, the stacked logo |
| Landing page (payment test) | Cream background, horizontal logo, a Violet "Reserve with bKash" button |
| Notifications | A single-colour silhouette of the mark (Android requires it). The session notification uses Violet as its accent colour, with a Lilac-to-Electric progress bar where Android allows it. |

---

## To check

- Do parents read the mark as "a parent and a child" and see the heart? Show it to 5 parents in the closed test, without explanation. Check it at 24 px on a launcher.
- Does the Nagorik violet feel calm and friendly to parents, or too "tech"? Ask the same 5 parents what the colours remind them of.
- Is the heavy sans wordmark warm enough for a family product? Compare it with a softer weight on the landing page.
- Is Hind Siliguri at 18 sp readable on a 720p Tecno screen? Test L-01.
- Trademark search for the name and the mark (Nice classes 9 and 42) before launch. Two figures making a heart is a common family motif, so check for close marks.

## What changed

| | v1 | v2 | v3 |
|---|---|---|---|
| Palette | Indigo, yellow, lavender | Evergreen, apricot, cream | Nagorik's own: Ink, Violet, Electric, Lilac, Lavender, Cream |
| Mark | Three yellow dots on indigo | A child held by three arcs | "Together": a parent and a child whose bodies make a heart |
| Wordmark | Live text, rounded sans | Serif, outlined | Plus Jakarta Sans 800, outlined, in Ink and Violet |
| Time light | (a timer bubble) | Lagoon → Pistachio → Apricot | Lilac → Violet → Electric |
| Feel | Playful app | Trusted family product | A family thing you do together |
