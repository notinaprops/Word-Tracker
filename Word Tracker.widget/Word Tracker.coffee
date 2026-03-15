# Word Tracker — Übersicht widget
# Drop this file into ~/Library/Application Support/Übersicht/widgets/Word Tracker/

refreshFrequency: false

style: '''
  top: 20px
  right: 20px
  font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif

  * { box-sizing: border-box; }

  .nw-wrap {
    display: flex;
    flex-direction: column;
    width: 320px;
  }

  .card {
    background: var(--card-bg, #ffffff);
    border-radius: 16px;
    padding: 26px 28px 22px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.06), 0 4px 16px rgba(0,0,0,0.06);
    transition: background 0.4s, box-shadow 0.4s;
  }

  .header-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 16px;
  }

  .nw-title {
    font-size: 10px;
    font-weight: 500;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--text-sub, #b0a898);
    line-height: 1.4;
    transition: color 0.4s;
  }

  .settings-btn {
    background: none;
    border: none;
    cursor: pointer;
    padding: 2px;
    line-height: 1;
    color: var(--text-sub, #b0a898);
    opacity: 0.5;
    flex-shrink: 0;
    margin-top: -1px;
    transition: opacity 0.15s, transform 0.35s cubic-bezier(0.34,1.56,0.64,1), color 0.15s;
  }
  .settings-btn:hover { opacity: 1; }
  .settings-btn.open { transform: rotate(65deg); opacity: 1; color: var(--text-main, #1a1814); }

  .settings-panel {
    background: var(--panel-bg, #faf9f7);
    border-radius: 12px;
    max-height: 0;
    overflow: hidden;
    opacity: 0;
    margin-top: 0;
    box-shadow: 0 1px 3px rgba(0,0,0,0.05), 0 4px 16px rgba(0,0,0,0.05);
    transition: max-height 0.4s cubic-bezier(0.4,0,0.2,1), opacity 0.28s ease, margin-top 0.4s cubic-bezier(0.4,0,0.2,1);
  }
  .settings-panel.open { max-height: 460px; opacity: 1; margin-top: 8px; }

  .settings-inner {
    padding: 16px;
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .s-field { display: flex; flex-direction: column; gap: 5px; }

  .s-label-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .s-label {
    font-size: 10px;
    font-weight: 500;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: var(--text-sub, #b0a898);
    transition: color 0.4s;
  }

  .pill-toggle {
    display: inline-flex;
    background: var(--divider, #f0ede8);
    border-radius: 99px;
    padding: 2px;
    gap: 1px;
    transition: background 0.4s;
  }
  .pill-opt {
    padding: 3px 9px;
    border-radius: 99px;
    border: none;
    font-size: 9px;
    font-weight: 600;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    cursor: pointer;
    background: transparent;
    color: var(--text-sub, #b0a898);
    font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif;
    transition: background 0.2s, color 0.2s, box-shadow 0.2s;
  }
  .pill-opt.active {
    background: var(--card-bg, #ffffff);
    color: var(--text-main, #1a1814);
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  }

  .settings-inner input[type="text"],
  .settings-inner input[type="number"] {
    box-sizing: border-box;
    width: 100%;
    padding: 7px 10px;
    border: 1px solid var(--input-bdr, #e8e4df);
    border-radius: 7px;
    font-size: 12px;
    font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif;
    color: var(--text-main, #1a1814);
    background: var(--card-bg, #ffffff);
    outline: none;
    transition: border-color 0.15s, background 0.4s, color 0.4s;
    -moz-appearance: textfield;
  }
  .settings-inner input::-webkit-inner-spin-button { display: none; }
  .settings-inner input:focus { border-color: var(--accent, #1a1814); }
  .settings-inner input::placeholder { color: var(--text-sub, #b0a898); opacity: 0.55; }

  .palette-row { display: flex; gap: 7px; align-items: center; flex-wrap: wrap; }
  .swatch {
    width: 22px; height: 22px;
    border-radius: 50%;
    cursor: pointer;
    border: 2px solid transparent;
    transition: transform 0.15s, border-color 0.15s;
    flex-shrink: 0;
    position: relative;
  }
  .swatch:hover { transform: scale(1.15); }
  .swatch.active { border-color: var(--text-main, #1a1814); }
  .swatch.active::after {
    content: '';
    position: absolute;
    inset: 3px;
    border-radius: 50%;
    border: 1.5px solid rgba(255,255,255,0.65);
  }

  .slider-wrap { display: flex; align-items: center; gap: 10px; }
  input[type="range"] {
    flex: 1;
    -webkit-appearance: none;
    height: 3px;
    border-radius: 99px;
    background: var(--divider, #f0ede8);
    outline: none;
    cursor: pointer;
  }
  input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    width: 13px; height: 13px;
    border-radius: 50%;
    background: var(--accent, #1a1814);
    cursor: pointer;
    transition: background 0.3s;
  }
  .slider-val { font-size: 10px; color: var(--text-sub, #b0a898); min-width: 28px; text-align: right; font-weight: 500; }

  .settings-footer { display: flex; justify-content: flex-end; padding-top: 2px; }
  .settings-apply {
    padding: 6px 14px;
    background: var(--accent, #1a1814);
    color: var(--card-bg, #ffffff);
    border: none;
    border-radius: 7px;
    font-size: 11px;
    font-weight: 500;
    font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif;
    cursor: pointer;
    letter-spacing: 0.03em;
    transition: opacity 0.15s, background 0.4s, color 0.4s;
  }
  .settings-apply:hover { opacity: 0.8; }

  .count {
    font-size: 42px;
    font-weight: 600;
    color: var(--text-main, #1a1814);
    letter-spacing: -0.02em;
    line-height: 1;
    margin-bottom: 3px;
    transition: color 0.4s;
  }
  .count-sub { font-size: 13px; color: var(--text-sub, #b0a898); font-weight: 400; margin-bottom: 20px; transition: color 0.4s; }

  .bar-wrap {
    background: var(--divider, #f0ede8);
    border-radius: 99px;
    height: 4px;
    margin-bottom: 10px;
    overflow: hidden;
    transition: background 0.4s, max-height 0.3s, opacity 0.3s, margin 0.3s;
    max-height: 10px;
  }
  .bar-wrap.hidden { max-height: 0; opacity: 0; margin-bottom: 0; }
  .bar-fill {
    height: 100%;
    border-radius: 99px;
    background: var(--bar-color, #1a1814);
    transition: width 0.8s cubic-bezier(0.4,0,0.2,1), background 0.4s;
  }

  .stats-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
    overflow: hidden;
    transition: max-height 0.3s, opacity 0.3s, margin 0.3s;
    max-height: 60px;
  }
  .stats-row.hidden { max-height: 0; opacity: 0; margin-bottom: 0; }
  .stat { display: flex; flex-direction: column; gap: 2px; }
  .stat-val { font-size: 13px; font-weight: 500; color: var(--text-mid, #3d3830); transition: color 0.4s; }
  .stat-lbl { font-size: 10px; color: var(--text-sub, #b0a898); letter-spacing: 0.05em; transition: color 0.4s; }

  .divider { border: none; border-top: 1px solid var(--divider, #f0ede8); margin-bottom: 16px; transition: border-color 0.4s; }

  .finish-row {
    font-size: 12px;
    color: var(--text-sub, #b0a898);
    margin-bottom: 16px;
    overflow: hidden;
    transition: color 0.4s, opacity 0.3s, max-height 0.3s, margin 0.3s;
    max-height: 30px;
  }
  .finish-row.hidden { max-height: 0; opacity: 0; margin-bottom: 0; }
  .finish-row strong { color: var(--text-mid, #3d3830); font-weight: 500; transition: color 0.4s; }

  .nw-quote {
    font-size: 11px;
    color: var(--text-sub, #b0a898);
    margin-bottom: 12px;
    line-height: 1.5;
    min-height: 30px;
    transition: opacity 0.3s, color 0.4s;
  }

  .input-row { display: flex; gap: 8px; width: 100%; align-items: stretch; }

  #wcIn {
    box-sizing: border-box;
    flex: 1; min-width: 0;
    padding: 8px 10px;
    border: 1px solid var(--input-bdr, #e8e4df);
    border-radius: 8px;
    font-size: 13px;
    font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif;
    color: var(--text-main, #1a1814);
    background: var(--input-bg, #faf9f7);
    outline: none;
    transition: border-color 0.15s, background 0.4s, color 0.4s;
    -moz-appearance: textfield;
  }
  #wcIn::-webkit-inner-spin-button { display: none; }
  #wcIn:focus { border-color: var(--accent, #1a1814); background: var(--card-bg, #ffffff); }
  #wcIn::placeholder { color: var(--text-sub, #b0a898); opacity: 0.55; }

  .done-btn {
    flex-shrink: 0;
    width: 36px; height: 36px;
    display: flex; align-items: center; justify-content: center;
    padding: 0;
    background: var(--accent, #1a1814);
    color: var(--card-bg, #ffffff);
    border: none; border-radius: 8px;
    cursor: pointer;
    position: relative; overflow: hidden;
    transition: background 0.4s, color 0.4s;
  }
  .done-btn svg { display: block; }
  .done-btn .ripple {
    position: absolute; border-radius: 50%;
    background: rgba(255,255,255,0.25);
    transform: scale(0);
    animation: ripple-out 0.55s linear;
    pointer-events: none;
  }
  @keyframes ripple-out { to { transform: scale(5); opacity: 0; } }
  @keyframes btn-pop {
    0%   { transform: scale(1); }
    30%  { transform: scale(0.88); }
    60%  { transform: scale(1.08); }
    80%  { transform: scale(0.97); }
    100% { transform: scale(1); }
  }
  .done-btn.popping { animation: btn-pop 0.42s cubic-bezier(0.34,1.56,0.64,1); }
  @keyframes plane-send {
    0%  { transform: translate(0,0) rotate(0deg); opacity: 1; }
    60% { transform: translate(14px,-14px) rotate(-20deg); opacity: 0; }
    61% { transform: translate(-6px,4px) rotate(0deg); opacity: 0; }
    100%{ transform: translate(0,0) rotate(0deg); opacity: 1; }
  }
  .done-btn.sending svg { animation: plane-send 0.55s ease-in-out forwards; }

  .nw-msg { font-size: 11px; color: var(--text-sub, #b0a898); margin-top: 8px; min-height: 16px; transition: opacity 0.3s, color 0.4s; }
'''

render: () -> """
  <div class="nw-wrap">

    <div class="card">
      <div class="header-row">
        <div class="nw-title" id="nwTitleEl">Novel in Progress</div>
        <button class="settings-btn" id="nwSettingsBtn" title="Settings">
          <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
            <path d="M7 9a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z" stroke="currentColor" stroke-width="1.3" stroke-linecap="round"/>
            <path d="M11.4 8.6a1 1 0 0 0 .2 1.1l.04.04a1.2 1.2 0 0 1-1.7 1.7l-.04-.04a1 1 0 0 0-1.1-.2 1 1 0 0 0-.6.92V12a1.2 1.2 0 0 1-2.4 0v-.05A1 1 0 0 0 5.1 11a1 1 0 0 0-1.1.2l-.04.04a1.2 1.2 0 0 1-1.7-1.7l.04-.04A1 1 0 0 0 2.5 8.4a1 1 0 0 0-.92-.6H1.5a1.2 1.2 0 0 1 0-2.4h.05A1 1 0 0 0 2.5 4.8a1 1 0 0 0-.2-1.1l-.04-.04a1.2 1.2 0 0 1 1.7-1.7l.04.04A1 1 0 0 0 5.1 2.2a1 1 0 0 0 .6-.92V1.2a1.2 1.2 0 0 1 2.4 0v.05a1 1 0 0 0 .6.92 1 1 0 0 0 1.1-.2l.04-.04a1.2 1.2 0 0 1 1.7 1.7l-.04.04A1 1 0 0 0 11.3 4.8a1 1 0 0 0 .92.6h.08a1.2 1.2 0 0 1 0 2.4h-.05a1 1 0 0 0-.85.8Z" stroke="currentColor" stroke-width="1.3" stroke-linecap="round"/>
          </svg>
        </button>
      </div>

      <div class="count" id="nwCountEl">—</div>
      <div class="count-sub">words written</div>

      <div class="bar-wrap hidden" id="nwBarWrap">
        <div class="bar-fill" id="nwBarFill" style="width:0%"></div>
      </div>

      <div class="stats-row hidden" id="nwStatsRow">
        <div class="stat">
          <span class="stat-val" id="nwPctEl">—</span>
          <span class="stat-lbl">complete</span>
        </div>
        <div class="stat" style="text-align:right">
          <span class="stat-val" id="nwRemEl">—</span>
          <span class="stat-lbl">words to go</span>
        </div>
      </div>

      <hr class="divider">

      <div class="finish-row" id="nwFinishRow">
        Est. Completion &nbsp;<strong id="nwFinishEl">—</strong>
      </div>

      <div class="nw-quote" id="nwQuoteEl"></div>

      <div class="input-row">
        <input type="number" id="wcIn" placeholder="Wordcount" min="0" />
        <button class="done-btn" id="nwDoneBtn" title="Done">
          <svg width="15" height="15" viewBox="0 0 15 15" fill="none">
            <path d="M1 1.5L14 7.5L1 13.5V9.2L10.5 7.5L1 5.8V1.5Z" fill="currentColor"/>
          </svg>
        </button>
      </div>
      <div class="nw-msg" id="nwMsgEl"></div>
    </div>

    <div class="settings-panel" id="nwSettingsPanel">
      <div class="settings-inner">

        <div class="s-field">
          <div class="s-label-row"><span class="s-label">Novel Title</span></div>
          <input type="text" id="nwTitleInput" placeholder="Novel Title" maxlength="60" />
        </div>

        <div class="s-field">
          <div class="s-label-row"><span class="s-label">Manuscript Total</span></div>
          <input type="number" id="nwGoalInput" placeholder="e.g. 80000" min="0" />
        </div>

        <div class="s-field">
          <div class="s-label-row">
            <span class="s-label">Word Goal</span>
            <div class="pill-toggle" id="nwPillToggle">
              <button class="pill-opt active" data-val="daily">Daily</button>
              <button class="pill-opt" data-val="weekly">Weekly</button>
            </div>
          </div>
          <input type="number" id="nwPaceInput" placeholder="e.g. 900" min="0" />
        </div>

        <div class="s-field">
          <div class="s-label-row"><span class="s-label">Palette</span></div>
          <div class="palette-row" id="nwPaletteRow"></div>
        </div>

        <div class="s-field">
          <div class="s-label-row"><span class="s-label">Transparency</span></div>
          <div class="slider-wrap">
            <input type="range" id="nwAlphaSlider" min="30" max="100" value="100" />
            <span class="slider-val" id="nwAlphaVal">100%</span>
          </div>
        </div>

        <div class="settings-footer">
          <button class="settings-apply" id="nwApplyBtn">Apply</button>
        </div>

      </div>
    </div>

  </div>
"""

afterRender: (domEl) ->
  domEl.style.right = '20px'
  domEl.style.left  = 'auto'

  PALETTES =
    ink:      { label: 'Ink',      body: '#f7f5f2', card: '#ffffff', main: '#1a1814', sub: '#b0a898', mid: '#3d3830', accent: '#1a1814', bar: '#1a1814', div: '#f0ede8', inBg: '#faf9f7', inBdr: '#e8e4df', pBg: '#faf9f7', swatch: '#1a1814' }
    midnight: { label: 'Midnight', body: '#0e0c0a', card: '#1e1a15', main: '#f0ead8', sub: '#6b5f50', mid: '#d4c8b0', accent: '#d4c8b0', bar: '#d4c8b0', div: '#2e2820', inBg: '#2a2418', inBdr: '#3e3628', pBg: '#2a2418', swatch: '#1e1a15' }
    sage:     { label: 'Sage',     body: '#e8ede6', card: '#f2f6f0', main: '#253d26', sub: '#7a9e7c', mid: '#2d4a2e', accent: '#3d5a3e', bar: '#3d5a3e', div: '#d4e4d4', inBg: '#eaf2ea', inBdr: '#c8dcc8', pBg: '#eaf2ea', swatch: '#3d5a3e' }
    dusk:     { label: 'Dusk',     body: '#f0e8ed', card: '#fdf5f8', main: '#3e1f2e', sub: '#c09aae', mid: '#5a2e42', accent: '#7a4058', bar: '#7a4058', div: '#f0dde6', inBg: '#f8eef3', inBdr: '#e8d0dc', pBg: '#f8eef3', swatch: '#7a4058' }
    caramel:  { label: 'Caramel',  body: '#f0e8d8', card: '#fdf8f0', main: '#3a2810', sub: '#c0a070', mid: '#5a3a18', accent: '#8a5a28', bar: '#8a5a28', div: '#f0dfc8', inBg: '#f8f0e4', inBdr: '#e8d4b8', pBg: '#f8f0e4', swatch: '#8a5a28' }
    slate:    { label: 'Slate',    body: '#e4e8ed', card: '#f4f6f8', main: '#1a2535', sub: '#8090a8', mid: '#2a3a50', accent: '#2a3a50', bar: '#2a3a50', div: '#d8e0ea', inBg: '#edf0f4', inBdr: '#ccd4e0', pBg: '#edf0f4', swatch: '#2a3a50' }

  QUOTES = [
    "A word after a word after a word is power. — Atwood",
    "You can always edit a bad page. You can't edit a blank page. — Picoult",
    "The first draft is just you telling yourself the story. — Pratchett",
    "You fail only if you stop writing. — Bradbury",
    "The scariest moment is always just before you start. — King",
    "If you don't have time to read, you don't have the time to write. — King",
    "The road to hell is paved with adverbs. — King",
    "Easy reading is damn hard writing. — Hawthorne",
    "No tears in the writer, no tears in the reader. — Frost",
    "There's nothing to writing. All you do is sit down at a typewriter and bleed. — Hemingway",
    "Almost all good writing begins with terrible first efforts. — Lamott",
    "Don't tell me the moon is shining; show me the glint of light on broken glass. — Chekhov",
    "Writing is thinking on paper. — Zinsser",
    "Fill your paper with the breathings of your heart. — Wordsworth",
    "You must stay drunk on writing so reality cannot destroy you. — Bradbury",
    "Write hard and clear about what hurts. — Hemingway",
    "I write to find out what I think. — Didion",
    "Writing is the only thing that, when I do it, I don't feel I should be doing something else. — Steinem",
    "Writing is easy. All you have to do is cross out the wrong words. — Twain",
    "Substitute 'damn' every time you're inclined to write 'very.' Your editor will delete it. — Twain",
    "The pen is the tongue of the mind. — Cervantes",
    "No one needs to know how many tabs were open during this chapter.",
    "Your first draft is allowed to be terrible. It's basically a requirement.",
    "Inspiration exists, but it has to find you working. — Picasso",
    "The manuscript won't write itself, no matter how long you stare at it.",
    "Some days writing feels like pulling teeth. Some days it's the wrong teeth.",
    "Coffee is just writer fuel with branding.",
    "The best time to start was yesterday. The second best is now.",
    "Your inner critic has terrible timing and worse taste.",
    "Deadline: nature's most reliable writing tool.",
    "Words per day is basically calories, but for your novel.",
    "Your outline is a detailed plan for what you'll ignore by chapter three.",
    "Writer's block is your brain's way of asking for a snack.",
    "Every chapter one is just a chapter two waiting to happen.",
    "The delete key is also a writing tool, and sometimes a merciful one.",
    "Revision is where writing actually happens.",
    "Every writer I know has trouble writing. — Heller",
    "The first sentence can't be written until the final sentence is written. — Oates",
    "A blank page isn't failure. It's an invitation.",
    "You don't have to write well every day. You just have to write.",
    "Every sentence you write is one your reader will someday love.",
    "The story that lives only in your head helps no one.",
    "You're not writing for perfection. You're writing for completion.",
    "One word leads to the next. That's the whole secret.",
    "You have already started. That is more than most people ever do.",
    "The chapter you're avoiding is usually the one that matters most.",
    "Good writing is mostly just good showing up.",
    "Write for the reader you were at your most lost.",
    "The book you're writing is the one only you can write.",
    "Momentum is a writer's most underrated tool.",
    "Even bad writing days move the story forward.",
    "Finishing matters more than being perfect.",
    "Every great novel was once a messy first draft.",
    "Trust the process, even when the process feels like chaos.",
    "You don't find your voice. You write until it finds you.",
    "The middle of the book is where writers are made.",
    "What you're writing today might be someone's favorite book someday.",
    "The story wants to be told. You're just the one telling it.",
    "Doubt is part of the job. So is writing through it.",
    "Every word is a small act of courage.",
    "You've already proved you're a writer. Now prove you're a finisher.",
    "Hard days make great stories.",
    "No one remembers how long it took. They only remember that it exists.",
    "The words you write today will outlast the doubt you feel today.",
    "Be the writer you needed when you were a reader.",
    "Writing badly is the fastest way to writing well.",
    "Done is better than perfect, and both are better than never started.",
    "There are readers out there waiting for exactly this story.",
    "Write like no one is reading. Edit like everyone is.",
    "The ending is already written. You just have to find it.",
    "Great books are just small words arranged well by someone who didn't quit.",
    "The voice that says you can't? It can't write. You can.",
    "More words, fewer regrets.",
    "If it's worth imagining, it's worth writing down.",
    "A story half-finished is a story half-alive.",
    "Today's words are tomorrow's chapters.",
    "Somewhere, a reader is waiting for the exact sentence you haven't written yet.",
    "The only wrong way to write is to stop.",
    "You started. That's not nothing. That's everything.",
    "Write the scene that scares you. That's the one they'll remember.",
    "A good book is just a bad book that was revised enough times.",
    "Keep writing. The plot will catch up eventually.",
    "Novels are written one imperfect sentence at a time.",
    "Write it down before the feeling fades.",
    "Inspiration is perishable. Write it now.",
    "Your best chapter is always the next one.",
    "Writing is the act of pretending you know what happens next.",
    "Every author you admire was once exactly where you are.",
    "Progress is always worth recording, no matter how small.",
    "Hard truths make the best fiction.",
    "Your characters are more alive than your doubts.",
    "The only real failure is the page you refused to fill.",
    "A chapter a week is a book a year.",
    "Write the book, then worry about whether it's good.",
    "Every page is closer than yesterday.",
    "No one cares about the draft. Everyone cares about the book.",
    "The story does not care how you feel today. Write it anyway.",
    "You will not remember what you didn't write.",
    "If writing were easy, everyone would have finished their novel. You will.",
    "Start anywhere. The beginning can be fixed later.",
    "You are not stuck. You are just between sentences.",
    "A writer's job is to show up. Everything else is editing.",
    "The novel you're avoiding will not write itself out of sympathy.",
    "Your characters did not come this far to be left in a draft.",
    "Somewhere between chapter one and the end is the book you always wanted to read.",
    "Keep going. The reader is counting on you.",
    "The blank page has never once finished a novel. You will.",
    "Writing is not a talent. It is a habit. You are building it right now.",
    "The hardest part of writing is not the writing. It's sitting down to write.",
    "All first drafts are terrible. All published books were first drafts.",
    "You have something to say. The world needs you to say it.",
    "The longer you wait for the right moment, the longer your reader waits.",
    "Finishing your novel is an act of generosity to your future self."
  ]

  # ── State ──────────────────────────────────────────────────────────────────
  GOAL       = parseInt(localStorage.getItem('nwGoal')    || '0')    || 0
  paceVal    = parseInt(localStorage.getItem('nwPaceVal') || '0')    || 0
  paceType   = localStorage.getItem('nwPaceType') || 'daily'
  words      = parseInt(localStorage.getItem('nw')        || '0')    || 0
  qIdx       = parseInt(localStorage.getItem('nwQ')       || String(Math.floor(Date.now() / 86400000) % 110))
  curPalette = localStorage.getItem('nwPalette') || 'ink'
  curAlpha   = parseInt(localStorage.getItem('nwAlpha')   || '100')  || 100
  _paceType  = paceType
  settingsOpen = false

  # ── Helpers ────────────────────────────────────────────────────────────────
  q = (id) -> domEl.querySelector('#' + id)

  hexToRgba = (hex, a) ->
    r = parseInt(hex.slice(1,3), 16)
    g = parseInt(hex.slice(3,5), 16)
    b = parseInt(hex.slice(5,7), 16)
    'rgba(' + r + ',' + g + ',' + b + ',' + (a / 100) + ')'

  applyPalette = (key, alpha) ->
    p = PALETTES[key]
    return unless p
    root = document.documentElement
    root.style.setProperty '--body-bg',    p.body
    root.style.setProperty '--card-bg',    hexToRgba(p.card, alpha)
    root.style.setProperty '--panel-bg',   hexToRgba(p.pBg,  alpha)
    root.style.setProperty '--text-main',  p.main
    root.style.setProperty '--text-sub',   p.sub
    root.style.setProperty '--text-mid',   p.mid
    root.style.setProperty '--text-quote', p.sub
    root.style.setProperty '--accent',     p.accent
    root.style.setProperty '--bar-color',  p.bar
    root.style.setProperty '--divider',    p.div
    root.style.setProperty '--input-bg',   p.inBg
    root.style.setProperty '--input-bdr',  p.inBdr
    domEl.querySelectorAll('.swatch').forEach (s) ->
      s.classList.toggle 'active', s.dataset.key is key

  buildSwatches = ->
    row = q('nwPaletteRow')
    Object.keys(PALETTES).forEach (key) ->
      p = PALETTES[key]
      s = document.createElement 'button'
      s.className = 'swatch' + (if key is curPalette then ' active' else '')
      s.dataset.key = key
      s.title = p.label
      s.style.background = p.swatch
      s.style.boxShadow  = 'inset 0 0 0 1px rgba(0,0,0,0.08)'
      s.onclick = ->
        curPalette = key
        applyPalette key, curAlpha
      row.appendChild s

  dailyPace = ->
    return 0 unless paceVal and not isNaN(paceVal)
    if paceType is 'weekly' then paceVal / 7 else paceVal

  renderStats = (w) ->
    hasGoal = GOAL > 0
    pace    = dailyPace()
    hasPace = pace > 0

    q('nwCountEl').textContent = if w > 0 then w.toLocaleString() else '—'
    q('nwBarWrap').classList.toggle  'hidden', not hasGoal
    q('nwStatsRow').classList.toggle 'hidden', not hasGoal

    if hasGoal
      pct = Math.min(w / GOAL, 1)
      q('nwBarFill').style.width   = (pct * 100).toFixed(2) + '%'
      q('nwPctEl').textContent     = (pct * 100).toFixed(1) + '%'
      q('nwRemEl').textContent     = Math.max(GOAL - w, 0).toLocaleString()

    finishRow = q('nwFinishRow')
    if not hasGoal or not hasPace
      finishRow.classList.add 'hidden'
    else
      finishRow.classList.remove 'hidden'
      daysLeft = Math.ceil(Math.max(GOAL - w, 0) / pace)
      finish   = new Date()
      finish.setDate finish.getDate() + daysLeft
      q('nwFinishEl').textContent =
        finish.toLocaleDateString 'en-US', { month: 'long', day: 'numeric', year: 'numeric' }

  showQuote = (idx) ->
    el = q('nwQuoteEl')
    el.style.opacity = '0'
    setTimeout ->
      el.textContent = QUOTES[idx % QUOTES.length]
      el.style.opacity = '1'
    , 200

  flashMsg = (txt) ->
    el = q('nwMsgEl')
    el.style.opacity = '0'
    setTimeout ->
      el.textContent = txt
      el.style.opacity = '1'
    , 80
    clearTimeout el._t
    el._t = setTimeout ->
      el.style.opacity = '0'
    , 3500

  animateBtn = (e) ->
    btn  = q('nwDoneBtn')
    rect = btn.getBoundingClientRect()
    size = Math.max(btn.offsetWidth, btn.offsetHeight) * 2
    x    = (e.clientX - rect.left) - size / 2
    y    = (e.clientY - rect.top)  - size / 2
    rip  = document.createElement 'span'
    rip.className = 'ripple'
    rip.style.cssText = 'width:' + size + 'px;height:' + size + 'px;left:' + x + 'px;top:' + y + 'px'
    btn.appendChild rip
    setTimeout (-> rip.remove()), 600
    btn.classList.remove 'popping', 'sending'
    btn.offsetWidth
    btn.classList.add 'popping', 'sending'
    setTimeout (-> btn.classList.remove 'popping', 'sending'), 560

  save = (e) ->
    v = parseInt q('wcIn').value
    if isNaN(v) or v < 0
      flashMsg 'enter a valid number'
      return
    animateBtn e
    diff  = v - words
    words = v
    localStorage.setItem 'nw', words
    qIdx = (qIdx + 1) % QUOTES.length
    localStorage.setItem 'nwQ', qIdx
    showQuote qIdx
    renderStats words
    q('wcIn').value = ''
    if v >= GOAL and GOAL > 0
      flashMsg 'you finished your novel.'
    else if diff > 0
      flashMsg '+' + diff.toLocaleString() + ' words — nice work'
    else
      flashMsg 'saved'

  setPaceType = (val) ->
    _paceType = val
    domEl.querySelectorAll('.pill-opt').forEach (b) ->
      b.classList.toggle 'active', b.dataset.val is val

  previewAlpha = (val) ->
    q('nwAlphaVal').textContent = val + '%'
    applyPalette curPalette, parseInt(val)

  toggleSettings = ->
    settingsOpen = not settingsOpen
    q('nwSettingsPanel').classList.toggle 'open', settingsOpen
    q('nwSettingsBtn').classList.toggle   'open', settingsOpen
    if settingsOpen
      q('nwTitleInput').value     = localStorage.getItem('nwTitle') || ''
      q('nwGoalInput').value      = if GOAL then GOAL else ''
      q('nwPaceInput').value      = if paceVal then paceVal else ''
      q('nwAlphaSlider').value    = curAlpha
      q('nwAlphaVal').textContent = curAlpha + '%'
      _paceType = paceType
      domEl.querySelectorAll('.pill-opt').forEach (b) ->
        b.classList.toggle 'active', b.dataset.val is _paceType

  saveSettings = ->
    newTitle = q('nwTitleInput').value.trim()
    newGoal  = parseInt q('nwGoalInput').value
    newPace  = parseInt q('nwPaceInput').value
    newAlpha = parseInt q('nwAlphaSlider').value
    if newTitle
      localStorage.setItem 'nwTitle', newTitle
      q('nwTitleEl').textContent = newTitle
    GOAL     = if not isNaN(newGoal) and newGoal > 0 then newGoal else 0
    paceVal  = if not isNaN(newPace) and newPace > 0 then newPace else 0
    paceType = _paceType
    curAlpha = newAlpha
    localStorage.setItem 'nwGoal',     GOAL
    localStorage.setItem 'nwPaceVal',  paceVal
    localStorage.setItem 'nwPaceType', paceType
    localStorage.setItem 'nwAlpha',    curAlpha
    localStorage.setItem 'nwPalette',  curPalette
    applyPalette curPalette, curAlpha
    toggleSettings()
    renderStats words

  # ── Apply saved title ──────────────────────────────────────────────────────
  savedTitle = localStorage.getItem 'nwTitle'
  if savedTitle
    q('nwTitleEl').textContent = savedTitle

  # ── Event binding ──────────────────────────────────────────────────────────
  $(domEl).find('#nwSettingsBtn').on 'click', ->
    toggleSettings()

  $(domEl).find('#nwDoneBtn').on 'click', (e) ->
    save(e)

  $(domEl).find('#wcIn').on 'keydown', (e) ->
    save(e) if e.key is 'Enter'

  $(domEl).find('#nwApplyBtn').on 'click', ->
    saveSettings()

  $(domEl).find('.pill-opt').on 'click', ->
    setPaceType $(@).data('val')

  $(domEl).find('#nwAlphaSlider').on 'input', ->
    previewAlpha $(@).val()

  # ── Initialise ─────────────────────────────────────────────────────────────
  buildSwatches()
  applyPalette curPalette, curAlpha
  setTimeout ->
    renderStats words
    showQuote qIdx
  , 60
