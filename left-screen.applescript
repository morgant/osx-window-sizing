-- DESCRIPTION: Put frontmost window on left screen in my dual monitor setup.

-- Works with most setups
tell application "Finder"
  set {screen_left, screen_top, screen_width, screen_height} to bounds of window of desktop
end tell

-- NOTE This may work better with some multi-monitor setups
-- tell application "Safari"
--   set screen_width to (do JavaScript "screen.availWidth" in document 1)
--   set screen_height to (do JavaScript "screen.availHeight" in document 1)
-- end tell

tell application "System Events"
  set myFrontMost to name of first item of (processes whose frontmost is true)
end tell

tell application "System Events"
  tell process myFrontMost
    set position of window 1 to {(screen_left + 200), (screen_top + 500)}
  end tell
end tell
