JSON = assert(loadfile "/home/chris/.i3/JSON.lua")()

function conky_mpd()
    return JSON:encode(conky_parse("${mpd_smart}"));
end

function conky_spotify()
    return JSON:encode(conky_parse("${exec spotifyctl c}"));
end
