require "lib/utilities/debug"


script.on_event(defines.events.on_player_created, function(e)
  -- research all tech
  game.players[e.player_index].force.research_all_technologies()

  -- give items
  Debug:giveItems(e.player_index)
end)
