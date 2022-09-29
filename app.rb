require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')

sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])

result.each do |record|
  p record
end
