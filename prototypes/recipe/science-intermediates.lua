require "lib/utilities/prototyping"



-- disable ingredients for the lab added by sct
disableRecipe("sct-lab1-construction")
disableRecipe("sct-lab1-mechanization")

-- change coils require cables instead of plates
editRecipeIngredient("sct-t1-magnet-coils", "copper-plate", "copper-cable", 2)
