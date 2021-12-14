-- channelSpecifiedMarker
-- author: Samuel Spagl
-- description: This is a small script to make it possible to jump to specified marker positions upon selecting a channel

-- How to modify: As this is a really dumb and simply written script, just add another if cause with the Channelname and the right marker.

-- IMPORTANT: rn to stop the script a channel with the Channelname "END" is needed, if this channel is reached the Loop will stop.
lastTrack = ""

function Loop()
  trackCount = reaper.GetSelectedTrack(0,0)
  isLoopActive = true
  retrf, name = reaper.GetTrackName(trackCount)
  if name ~= lastTrack then
    -- GoToMarker([Project Integer, must be 0], [Marker on the timeline from 1-n], [true])
    -- reaper.ShowConsoleMsg("|| " .. lastTrack .. " - " .. name .. " ||")
    if name == "Track 1" then
      reaper.GoToMarker(0,1,true)
    end
    if name == "Track 2" then
      reaper.GoToMarker(0,2,true)
      --reaper.ShowConsoleMsg("Stuff2")
    end
    if name == "Track 3" then
      reaper.GoToMarker(0,3,true)
      --reaper.ShowConsoleMsg("Stuff3")
    end
    if name == "END" then 
    isLoopActive = false
    end
  end
  lastTrack = name
  if isLoopActive == true then
    reaper.defer(Loop)
  else 
    return 
  end
end

Loop()

