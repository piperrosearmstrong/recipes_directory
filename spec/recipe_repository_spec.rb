require_relative '../lib/recipe_repository'

RSpec.describe RecipeRepository do
  def reset_recipes_end
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_recipes_end
  end

  it "returns all recipes" do
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 4

    expect(recipes[0].id).to eq "1"
    expect(recipes[0].name).to eq "Tofu Surprise"
    expect(recipes[0].cooking_time).to eq "5"
    expect(recipes[0].rating).to eq "4"

    expect(recipes[1].id).to eq "2"
    expect(recipes[1].name).to eq "Ratatouille"
    expect(recipes[1].cooking_time).to eq "10"
    expect(recipes[1].rating).to eq "3"

    expect(recipes[2].id).to eq "3"
    expect(recipes[2].name).to eq "Turkey Sandwich"
    expect(recipes[2].cooking_time).to eq "6"
    expect(recipes[2].rating).to eq "2"

    expect(recipes[3].id).to eq "4"
    expect(recipes[3].name).to eq "Waffles"
    expect(recipes[3].cooking_time).to eq "5"
    expect(recipes[3].rating).to eq "5"
  end

  it 'returns a single recipe tofu surprise' do
    repo = RecipeRepository.new

    recipe = repo.find(1)

    expect(recipe.id).to eq "1"
    expect(recipe.name).to eq "Tofu Surprise"
    expect(recipe.cooking_time).to eq "5"
    expect(recipe.rating).to eq "4"
  end

  it "returns a single recipe ratatouille" do
    repo = RecipeRepository.new

      recipe = repo.find(2)

      expect(recipe.id).to eq "2"
      expect(recipe.name).to eq "Ratatouille"
      expect(recipe.cooking_time).to eq "10"
      expect(recipe.rating).to eq "3"
  end
end