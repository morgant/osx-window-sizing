-- Put frontmost window on left half

tell application "Safari"
  set screen_width to (do JavaScript "screen.availWidth" in document 1)
  set screen_height to (do JavaScript "screen.availHeight" in document 1)
end tell

-- tell application "Finder"
--   set {desktopTop, desktopLeft, desktopRight, desktopBottom} to bounds of desktop
-- end tell

tell application "System Events"

	set myFrontMost to name of first item of (processes whose frontmost is true)
	
  tell process myFrontMost
    set size of window 1 to {(screen_width/2), screen_height}
    set position of window 1 to {0, 20}
  end tell

end tell

tell application "Safari"
  quit
end tell
