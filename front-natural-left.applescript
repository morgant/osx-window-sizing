-- Put frontmost window on left side

tell application "Safari"
  set screen_width to (do JavaScript "screen.availWidth" in document 1)
  set screen_height to (do JavaScript "screen.availHeight" in document 1)
end tell

tell application "System Events"

	set myFrontMost to name of first item of (processes whose frontmost is true)
	
  tell process myFrontMost
    set size of window 1 to {1040, screen_height}
    set position of window 1 to {0, 20}
  end tell

end tell
