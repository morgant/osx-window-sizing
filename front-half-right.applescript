-- Put frontmost window on right half

tell application "System Events"

	set myFrontMost to name of first item of (processes whose frontmost is true)
	
  tell process myFrontMost
    set size of window 1 to {840, 1040}
    set position of window 1 to {840, 20}
  end tell

end tell