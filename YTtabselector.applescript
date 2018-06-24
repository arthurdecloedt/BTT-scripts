if application "Safari" is running then
	tell application "Safari"
		set winlist to every window
		set winmatchlist to {}
		set tabmatchlist to {}
		set tabnamematchlist to {}
		repeat with win in windowlist
			repeat with t in tabs of win 
				tell t
					if URL starts with "https://www.youtube.com/watch" then
						set end of winmatchlist to win
						set end of tabmatchlist to t
						set end of tabnamematchlist to (id of win as string) & "." & (index of t as string) & ".  " & (name of t as string)
					end if
				end tell
			end repeat
		end repeat
	if (count of tabmatchlist) = 1 then
		--display dialog "one!"
		set w to item 1 of winmatchlist
		set t to item 1 of tabmatchlist
		set current tab of w to t
		set index of w to 1
	else if (count of tabmatchlist) = 0 then
		display dialog "No matches"
	else
		set AppleScript's text item delimiters to "."
		if whichtab is not equal to false then
			set tmp to text items of (whichtab as string)
			set w to (item 1 of tmp) as integer
			set t to (item 2 of tmp) as integer
			set current tab of window id w to tab t of window id w
			set index of window id w to 1
		end if
	end if
	end tell
end if