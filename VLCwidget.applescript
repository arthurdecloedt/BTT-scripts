set maxsize to 20
if application "VLC" is running then
    tell application "VLC"
        try
            set n to name of current item
            if playing then
                set r to n
            else
                log n
                set r to "Paused"
            end if
            if length of r is greater than maxsize then
                set r to text 1 thru (maxsize - 3) of r & "..."
            end if
            return r
        on error
            return ""
        end try
    end tell
else
    return ""
end if