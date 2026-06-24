# WezTerm config

My WezTerm setup (rose-pine-moon, Hack Nerd Font), adapted from Kun Chen's config.
Lives at `~/.config/wezterm/wezterm.lua`. Paired with my
[tmux config](https://github.com/richard12511/tmux_config) — most day-to-day window/pane
work happens in **tmux**; see that repo's README for the full cheat sheet (breaking out
panes, two-monitor setups, session persistence, etc.).

**Leader is `Ctrl+Space`** (with a 2-second timeout). "`Ctrl+Space` then `m`" means press
the leader, release, then press `m`. Default WezTerm bindings are left enabled, so
`Cmd+C`/`Cmd+V`, font resize, etc. all still work — these are layered on top.

> ⚠️ **MacBook built-in keyboard gotcha:** the bottom-left corner key is `🌐/fn`; Control
> is the *next* key to the right. If a `Ctrl`-based shortcut "does nothing" on the laptop
> but works on an external keyboard, you're hitting Globe instead of Control. Remap via
> System Settings → Keyboard → Keyboard Shortcuts… → Modifier Keys if you want the corner
> key to *be* Control.

---

## Cheat sheet

### Windows & tabs
| Action | Keys |
|---|---|
| New OS window | `Cmd+N` *(default)* |
| Close window / tab | `Cmd+W` *(default — closes everything if it's the last one)* |
| Maximize the window | `Ctrl+Space` then `m` |
| New tab | `Ctrl+Space` then `c` |
| Next / previous tab | `Ctrl+Space` then `n` / `p` |
| Jump to tab 1–5 | `Ctrl+Space` then `1`…`5` |

### Panes (WezTerm's own splits — note: inside tmux, use tmux's keys instead)
| Action | Keys |
|---|---|
| Split (horizontal divider) | `Ctrl+Space` then `"` |
| Split (vertical divider) | `Ctrl+Space` then `%` |
| Move between panes | `Ctrl+Space` then `h`/`j`/`k`/`l` |
| Zoom pane (toggle) | `Ctrl+Space` then `z` |
| Close pane (with confirm) | `Ctrl+Space` then `x` |

> The split/nav mnemonics intentionally mirror tmux (`"`, `%`, `h/j/k/l`).

---

## Notable settings

- `color_scheme = "rose-pine-moon"`, font **Hack Nerd Font**, `font_size = 15` (macOS).
- `window_decorations = "TITLE | RESIZE"` — keeps a **title bar** so windows can be dragged
  between monitors (and gives back the traffic-light buttons). Set to `"RESIZE"` for a
  clean borderless look (but then there's no title bar to grab when moving windows).
- Translucent + blurred background on macOS (`window_background_opacity = 0.8`,
  `macos_window_background_blur = 50`).
- WezTerm **auto-reloads** this file on save — no restart needed.

## Moving a window to another monitor
With the title bar enabled (above), just drag it by the title bar. To run a second,
*independent* view of the same tmux session on the other monitor, see the
**Two monitors, non-mirrored** section in the
[tmux README](https://github.com/richard12511/tmux_config).
