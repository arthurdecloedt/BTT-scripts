tell application "Google Chrome"
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
					return
				end if
			end if
		end tell
	end repeat

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