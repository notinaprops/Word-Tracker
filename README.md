Novel Progress — Übersicht Widget

A minimal, beautiful desktop widget for tracking your novel's word count. Lives quietly in the corner of your screen and cheers you on every time you write.

<img src="Screenshot 2.png" alt="Novel Progress Widget" width="600" />

## Features

- **Word count input** with a satisfying paper-airplane "Done" button and ripple animation
- **Progress bar**, % complete, and words-to-go — only shown once you set a manuscript total
- **Est. Completion date** calculated from your daily or weekly word goal
- **110 rotating writer quotes** — a new one with every update
- **Settings panel** (gear icon, opens below the card) for:
  - Custom novel title
  - Manuscript total
  - Daily or weekly word goal (pill toggle)
  - 6 color palettes: Ink, Midnight, Sage, Dusk, Caramel, Slate
  - Transparency slider (30–100%)
- All settings and word count persist via `localStorage`

## Installation

1. Download "Word Tracker.widget.zip" and unzip it
2. Open Übersicht --> Open Widget Folder (or find the folder manually "~/Library/Application Support/Übersicht/widgets/")
3. In the Übersicht menu bar, choose **Refresh All Widgets**

The widget appears in the top left of your desktop by default. To move it to the left, open "Word Tracker.coffee" and change:

In style:
right: 20px --> left: 20px

In afterRender:
domEl.style.right = '20px'  -->  domEl.style.left  = '20px'
domEl.style.left  = 'auto'  -->  domEl.style.right = 'auto'


## Requirements

- [Übersicht](https://tracesof.net/uebersicht/) for macOS
Ensure you move the app icon into your Applications folder. It may open only in the upper menu bar. You can access the widgets and folders there.

## Author

Built by Me
https://github.com/notinaprops
Reddit: u/not_inappropriate 
