Novel Progress — Übersicht Widget

A minimal, beautiful desktop widget for tracking your novel's word count. Lives quietly in the corner of your screen and cheers you on every time you write.

<img src="Screenshot 2.png" alt="Novel Progress Widget" width="516" height="320"/>

## Features

What it does:
- Tracks your total manuscript word count
- Set a word count goal and watch a progress bar fill up as you get closer
- Pace calculator available for daily or weekly word counts and it'll predict your estimated finish date
- Little writing quotes to keep you motivated (they rotate every time you log words)
- Customizable with multiple colour palettes, adjustable widget opacity, and your novel's title
- **Settings panel** (gear icon, opens below the card) for:
  - Custom novel title
  - Manuscript total
  - Daily or weekly word goal (pill toggle)
  - 6 color palettes: Paper, Midnight, Sage, Dusk, Caramel, Slate
  - Transparency slider (30–100%)
- All settings and word count persist via "localStorage"

## Installation

1. Download "Word Tracker.widget.zip" and unzip it
2. Open Übersicht --> Open Widget Folder (or find the folder manually "~/Library/Application Support/Übersicht/widgets/")
3. In the Übersicht menu bar, choose **Refresh All Widgets**

The widget appears in the top left of your desktop by default. To move it to the left, open "Word Tracker.coffee" and change:

In style:
<br>right: 20px --> left: 20px

In afterRender:
<br>domEl.style.right = '20px'  -->  domEl.style.left  = '20px'
<br>domEl.style.left  = 'auto'  -->  domEl.style.right = 'auto'


## Requirements

- [Übersicht](https://tracesof.net/uebersicht/) for macOS
Ensure you move the app icon into your Applications folder. It may open only in the upper menu bar. You can access the widgets and folders there.

## Author

Built by Me
https://github.com/notinaprops
<br>Reddit: u/not_inappropriate 
