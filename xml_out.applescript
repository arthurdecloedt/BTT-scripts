tell application "Music"
	activate
end tell
tell application "System Events"
	tell process "Muziek"
		set frontmost to true
		delay 0.15
		click menu item "Exporteer bibliotheek…" of menu of menu item "Bibliotheek" of menu "Archief" of menu bar 1
		delay 0.15
		set value of text field "Bewaar als:" of window "Bewaar" to "iTunes Music Library.xml"
		delay 0.15
		keystroke "g" using {shift down, command down}
		delay 0.15
		set value of combo box "Ga naar de map:" of sheet 1 of window "Bewaar" to "/Users/arthurdecloedt/Music/iTunes"
		delay 0.15
		click button "Ga" of sheet 1 of window "Bewaar"
		delay 0.15
		
		click button "Bewaar" of window "Bewaar"
		delay 0.2
		click button "Vervang" of window "Bewaar"
	end tell
	
end tell
