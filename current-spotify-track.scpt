#!/usr/bin/osascript
set info to ""
tell application "System Events"
  set spotify_proc to count (every process whose name is "Spotify")
end tell
if spotify_proc > 0 then
  tell application "Spotify"
    if player state is playing then
      set track_name to name of current track
      set track_artist to artist of current track
      set info to track_name & " - " & track_artist
    end if
  end tell
end if
return info