require "lib/utilities/debug"


script.on_event(defines.events.on_player_created, function(e)
  -- give items
  --Debug:giveItems(e.player_index)
end)


-- on load game for first time
script.on_init(function(_)

  if Debug.enabled then
    --game.forces["player"].research_all_technologies()
    Debug:reseachAllTechnologies()
  end
  
end)
