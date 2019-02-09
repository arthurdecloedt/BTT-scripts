property lastpaused : ""

tell application "Google Chrome"
	-- search for a playing video to pause
	repeat with t in tabs of windows
		tell t
			if URL starts with "http://www.youtube.com/watch" or URL starts with "https://www.youtube.com/watch" then
				set state to execute javascript "
				document.querySelectorAll('div[class*=\"-mode\"]')[0].className.match(/(playing|paused|ended)-mode/)[1]"
				if state equals "playing" then
					execute javascript "
        			var player = document.getElementById('movie_player') || document.getElementsByTagName('embed')[0];
    
        			if (player) {
          			document.getElementsByClassName('ytp-play-button')[0].click()
		    		}
        			"
        			set lastpaused to URL
					return
				end if
			end if
		end tell
	end repeat

	-- search for the last paused video to play
	repeat with t in tabs of windows
	tell t
		if URL equals lastpaused
			set state to execute javascript "
			document.querySelectorAll('div[class*=\"-mode\"]')[0].className.match(/(playing|paused|ended)-mode/)[1]"
			if state equals "paused" then
				execute javascript "
    			var player = document.getElementById('movie_player') || document.getElementsByTagName('embed')[0];

    			if (player) {
      			document.getElementsByClassName('ytp-play-button')[0].click()
	    		}
    			"
    			set lastpaused to ""
				return
				end if
			end if
		end tell
	end repeat

	-- find a paused video to play
	repeat with t in tabs of windows
	tell t
		if URL starts with "http://www.youtube.com/watch" or URL starts with "https://www.youtube.com/watch" then
			set state to execute javascript "
			document.querySelectorAll('div[class*=\"-mode\"]')[0].className.match(/(playing|paused|ended)-mode/)[1]"
			if state equals "paused" then
				execute javascript "
    			var player = document.getElementById('movie_player') || document.getElementsByTagName('embed')[0];

    			if (player) {
      			document.getElementsByClassName('ytp-play-button')[0].click()
	    		}
    			"
				return
				end if
			end if
		end tell
	end repeat

	-- find an ended video to repeat
	repeat with t in tabs of windows
		tell t
			if URL starts with "http://www.youtube.com/watch" or URL starts with "https://www.youtube.com/watch" then
				set state to execute javascript "
				document.querySelectorAll('div[class*=\"-mode\"]')[0].className.match(/(playing|paused|ended)-mode/)[1]"
				if state equals "ended" then
					execute javascript "
    				var player = document.getElementById('movie_player') || document.getElementsByTagName('embed')[0];

    				if (player) {
      				document.getElementsByClassName('ytp-play-button')[0].click()
	    			}
    				"
					return
				end if
			end if
		end tell
	end repeat
end tell