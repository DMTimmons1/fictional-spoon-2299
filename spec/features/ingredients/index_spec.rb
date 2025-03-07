require 'rails_helper'

RSpec.describe "The ingredients index" do
  describe "User Story 1" do
    it "shows the visitor a list of all the ingredients including their name and cost" do
      ingredient_1 = Ingredient.create!(name: 'Beans', cost: 420)
      ingredient_2 = Ingredient.create!(name: 'Banana', cost: 90)

      visit '/ingredients'

      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_1.cost)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_2.cost)
    end
  end

  describe "Extension 1" do
    it "shows the visitor a a list of all the ingredients including their name and cost, sorted alphabetically" do 
      ingredient_1 = Ingredient.create!(name: 'Beans', cost: 420)
      ingredient_2 = Ingredient.create!(name: 'Banana', cost: 90)
      @ingredients = Ingredient.all.order(name: :asc)

      visit '/ingredients'

      expect(@ingredients).to eq([ingredient_2, ingredient_1])

    end
  end
end