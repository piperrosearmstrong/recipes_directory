# Recipes Directory Repository Class Design Recipe

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).

## 1. Design and create the Table

```
Table: recipes

Columns:
id | name | cooking_time | rating
```

## 2. Create Test SQL seeds

```sql

TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes (name, cooking_time, rating) VALUES ('Tofu Surprise', 5, 4);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Ratatouille', 10, 3);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Turkey Sandwich', 6, 2);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Waffles', 5, 5);
```

```bash
psql -h 127.0.0.1 recipes_directory_test < seeds_recipe.sql
```

## 3. Define the class names

```ruby
class Recipe

end

class RecipeRepository

end
```

## 4. Implement the Model class

```ruby
class Recipe

  attr_accessor :id, :name, :cooking_time, :rating
end

```

## 5. Define the Repository Class interface

```ruby

class RecipeRepository

  def all
    # SELECT id, name, cooking_time, rating FROM recipes;

  end

  def find(id)
    # SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;

  end

end
```

## 6. Write Test Examples

```ruby
# 1
# Get all recipes

repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  4

recipes[0].id # =>  1
recipes[0].name # =>  "Tofu Surprise"
recipes[0].cooking_time # =>  5
recipes[0].rating # => 4

recipes[1].id # =>  2
recipes[1].name # =>  "Ratatouille"
recipes[1].cooking_time # =>  10
recipes[1].rating # => 3

recipes[2].id # =>  3
recipes[2].name # =>  "Turkey Sandwich"
recipes[2].cooking_time # =>  6
recipes[2].rating # => 2

recipes[3].id # =>  4
recipes[3].name # =>  "Waffles"
recipes[3].cooking_time # =>  5
recipes[3].rating # => 5

# 2
# Get a single recipe Tofu Surprise

repo = RecipeRepository.new

recipe = repo.find(1)

recipe.id # =>  1
recipe.name # =>  "Tofu Surprise"
recipe.cooking_time # =>  "5"
recipe.rating # => "4"

# 2
# Get a single recipe Ratatouille

repo = RecipeRepository.new

recipe = repo.find(2)

recipe.id # =>  2
recipe.name # =>  "Ratatouille"
recipe.cooking_time # =>  "10"
recipe.rating # => "3"

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

```ruby

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

