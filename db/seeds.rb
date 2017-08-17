
require 'open-uri'

Ingredient.destroy_all

#json = ActiveSupport::JSON.decode(File.read('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'))
json = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list') { |result| result.read })

json["drinks"].each do |element|
  Ingredient.create(name: element["strIngredient1"])
end
