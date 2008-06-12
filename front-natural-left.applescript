-- Put frontmost window on left half

tell application "System Events"

	set myFrontMost to name of first item of (processes whose frontmost is true)
	
  tell process myFrontMost
    set size of window 1 to {1040, 1040}
    set position of window 1 to {0, 20}
  end tell

end tell