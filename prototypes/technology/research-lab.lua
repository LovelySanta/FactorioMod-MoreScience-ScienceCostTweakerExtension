require "lib/utilities/prototyping"



-- lab
addRecipeUnlock("basic-automation", "sct-lab1-construction")
addRecipeUnlock("basic-automation", "sct-lab1-mechanization")



-- sct-lab-2
removeRecipeUnlock("automation-2", "sct-lab2-construction")
addRecipeUnlock("basic-science-research-1", "sct-lab2-construction")

removeRecipeUnlock("automation-2", "sct-lab2-automatization")
addRecipeUnlock("basic-science-research-1", "sct-lab2-automatization")

removeRecipeUnlock("automation-2", "sct-lab-2")
addRecipeUnlock("basic-science-research-1", "sct-lab-2")



-- sct-lab-3
removeRecipeUnlock("advanced-electronics", "sct-lab3-construction")
addRecipeUnlock("basic-science-research-2", "sct-lab3-construction")

removeRecipeUnlock("advanced-electronics", "sct-lab3-optics")
addRecipeUnlock("basic-science-research-2", "sct-lab3-optics")

removeRecipeUnlock("advanced-electronics", "sct-lab-3")
addRecipeUnlock("basic-science-research-2", "sct-lab-3")
