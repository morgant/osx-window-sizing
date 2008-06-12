-- Put Terminal on one side and TextMate on the other

tell application "System Events"

  -- TODO hide all other apps
	
  tell process "Terminal"
    set position of window 1 to {800, 50}
    set size of window 1 to {700, 800}
  end tell

  tell process "TextMate"
    -- try
    --   set {{w, h}} to size of drawer of window 1
    -- on error
    --   set {w, h} to {0, 0}
    -- end try
    set position of window 1 to {0, 50}
    set size of window 1 to {800, 794}
  end tell

end tell