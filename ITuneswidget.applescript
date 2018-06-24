property trackName : ""
property fileName : ((((path to application support folder from user domain) as text) & "BetterTouchTool:" as text) & "default.png")
tell application "System Events"
	set num to count (every process whose name is "iTunes")
end tell
set maxSize to 20
if num > 0 then		
	tell application "iTunes"
		try
			if not trackName is equal to name of current track then
				tell artwork 1 of current track
					set srcBytes to raw data
					-- figure out the proper file extension
					if format is «class PNG » then
						set ext to ".png"
					else
						set ext to ".jpg"
					end if
					return ""
				end tell
				set fileName to ((((path to application support folder from user domain) as text) & "BetterTouchTool:" as text) & "itunes_cover" & ext)
				-- write to file
				set outFile to open for access file fileName with write permission
				-- truncate the file
				set eof outFile to 0
				-- write the image bytes to the file
				write srcBytes to outFile
				close access outFile
			end if
		on error
			set fileName to ((((path to application support folder from user domain) as text) & "BetterTouchTool:" as text) & "default.png")
		end try		
		set playState to (player state as text)
		if playState is equal to "playing" then
			set trackName to name of current track
			set artistName to artist of current track
			set albumName to album of current track
			if length of trackName is greater than maxSize then
				set trackName to text 1 thru (maxSize - 3) of trackName & "..."
			end if
			if length of artistName is greater than maxSize then
				set artistName to text 1 thru (maxSize - 3) of artistName & "..."
			end if
			set trackInfo to artistName & " - " & trackName
		else
			set trackInfo to "Paused"
		end if
		return "{\"text\":\"" & trackInfo & "\",\"icon_path\":\"" & (POSIX path of fileName as text) & "\"}"
	end tell
else
	return ""
end if