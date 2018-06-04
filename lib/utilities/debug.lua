
Debug = {}

Debug.enabled = false
Debug.returnValue = 10

function Debug:giveItems(playerIndex)
  local itemNames = {
    "lab-burner",
    "lab",
    "sct-lab-2",
    "sct-lab-3",
    "sct-lab-4",
    "lab-mk2",
  }
  for _, itemName in pairs(itemNames) do
    game.players[playerIndex].get_main_inventory().insert(itemName)
  end
end



function Debug:reseachAllTechnologies()
  force = game.forces["player"]

  local function researchTechnology(technologyName)
    if force.technologies[technologyName] and force.technologies[technologyName].enabled then
      -- check prerequisites
      for _,prerequisite in pairs(force.technologies[technologyName].prerequisites) do
        if not prerequisite.researched then
          return false
        end
      end
      -- do the research
      force.technologies[technologyName].researched = true
      return true
    end
    return false
  end


--------------------------------------------------------------------------------
----- Start of the game: minor defence and automation of power             -----
--------------------------------------------------------------------------------

  -- Automation & Logistics: smelter setup
  researchTechnology("basic-automation")

end
