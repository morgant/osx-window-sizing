-- AUTHOR: Yehuda Katz
-- MODIFIED: Geoffrey Grosenbach http://peepcode.com
-- MODIFIED: Morgan Aldridge http://www.makkintosshu.com/

set windowWidth to 1280
set windowHeight to 780
set gutter to 5
delay 0.1

set AppleScript's text item delimiters to "x"

-- Uncomment to see dialog
-- set res to text returned of (display dialog "Enter the width x height:" default answer ((windowWidth & windowHeight) as text))
-- HACK Manually set target window size
set res to "" & ( windowWidth - ( gutter * 2 ) ) & "x" & ( windowHeight - ( gutter * 2 ) )

if res is "" then
  display dialog "You need to enter a correct response"
  return
end if
set {windowWidth, windowHeight} to text items of res

set AppleScript's text item delimiters to ""

-- Works with most setups
tell application "Finder"
  set {screen_top, screen_left, screen_width, screen_height} to bounds of window of desktop
end tell

-- NOTE This may work better with some multi-monitor setups
-- tell application "Safari"
--   set screen_width to (do JavaScript "screen.availWidth" in document 1)
--   set screen_height to (do JavaScript "screen.availHeight" in document 1)
-- end tell

tell application "System Events"
  set myFrontMost to name of first item of (processes whose frontmost is true)
end tell

tell application "Finder"
  set {desktopTop, desktopLeft, desktopRight, desktopBottom} to bounds of desktop
end tell

try
  tell application "System Events"
    tell process myFrontMost
      set {{w, h}} to size of drawer of window 1
    end tell
  end tell
on error
  set {w, h} to {0, 0}
end try

tell application "System Events"
  tell process myFrontMost
    try
      set {{w, h}} to size of drawer of window 1
    on error
      set {w, h} to {0, 0}
    end try
    -- Okay, this is a little funky to handle all the cases:
    -- 1) Move the window first ('cause you can't resize beyond the bounds of the screen if it's near an edge)
    -- 2) Resize the window
    -- 3) Get the size of the window (in case it's non-resizeable)
    -- 4) Then move the window again (based on the final size)
    set position of window 1 to {((screen_width - windowWidth - w) / 2), ((screen_height - windowHeight) / 2.0) - desktopTop}
    set size of window 1 to {windowWidth - w, windowHeight}
    set {window_width, window_height} to size of window 1
    set position of window 1 to {((screen_width - window_width - w) / 2), ((screen_height - window_height) / 2.0) - desktopTop}
  end tell
end tell
