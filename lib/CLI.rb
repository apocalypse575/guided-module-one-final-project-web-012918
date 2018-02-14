
class CommandLineInterface

  complete_beers = RestClient.get('https://api.punkapi.com/v2/beers')

  def greet
    puts 'Welcome to BeerPairingApp, the command line solution that suggest a beer and meal to pair with!'
  end

  def gets_user_input_abv
    puts "What ABV (Alcohol by Volume) strength beer would you like to drink this time? The higher, the yummier! (Scale of 1 - 10)"
    puts "Enter it here to get started!"
    num = gets.chomp.to_i

    if num < 1 || num > 10
      puts "Nice try, do it again."
      gets_user_input_abv
    else
      puts "Good number!"
    end
    num
  end

  def gets_user_input_ingredient
    puts "What food ingredient would you like in your meal?"
    gets.chomp
  end

  def run
    greet
    input_abv = gets_user_input_abv

    input_ingredient = gets_user_input_ingredient.downcase.to_s
    # find_beer(input_abv)
    # find_meal(input_ingredient)

    find_pairing(input_abv, input_ingredient)
  end

  def find_beer(input_abv)
    integer = input_abv.to_i.floor
    mod_uri = "https://api.punkapi.com/v2/beers?abv_lt=#{integer}"
    abv = RestClient.get(mod_uri)
    json_abv = JSON.parse(abv)

    list_of_beers = json_abv.select {|each_beer| each_beer['abv'] <= integer}
    list_of_beers

  end

  def find_meal(input_ingredient)
    mod_uri = "https://api.punkapi.com/v2/beers?food=#{input_ingredient}"
    ingredient = RestClient.get(mod_uri)
    json_ingredient = JSON.parse(ingredient)

    # list_of_meals = json_ingredient.select {|each_meal| each_meal['food_pairing'].
    # include?("#{input_ingredient}")}

    json_ingredient

    # pairing = json_ingredient.sample['food_pairing'].select {|num| num.include?("#{input_ingredient}")}.sample()
    # "#{pairing} would be an excellent choice to prepare with #{input_ingredient}!"
  end



  def find_pairing(input_abv, input_ingredient)
    # Get main hash, then find ABV and find ingredient, then return beer!

    beers = find_beer(input_abv)
    meals = find_meal(input_ingredient)
    # binding.pry

    beer_id = beers.map {|each_beer| each_beer['id']}
    beer_id

    meal_id = meals.map {|each_meal| each_meal['id']}
    meal_id

    matches = beer_id & meal_id
    # binding.pry
    if matches == []
      self.run
    else

    integer = input_abv.to_i.floor
    mod_uri = "https://api.punkapi.com/v2/beers?abv_lt=#{integer}"
    abv = RestClient.get(mod_uri)
    json_abv = JSON.parse(abv)

    final_match = json_abv.find do |each_beer|

      # write conditional that checks for nil, run again

      each_beer['id'] == matches.sample

      # if final_match == nil || final_match == NilClass
      #   find_pairing(input_abv, input_ingredient)
      # end

    end

    # final_match = json_abv.find do |each_beer|
    #   # write conditional to account for nil
    #   binding.pry
    #   each_beer['id'] == matches.sample
    # end

    # NoMethodError: undefined method `[]' for nil:NilClass
    # from /Users/paulelis/Desktop/Module 1/final_project/guided-module-one-final-project-web-012918/lib/CLI.rb:95:in `find_pairing'
    # binding.pry
    final_beer_name = final_match['name']

    final_beer_description = final_match['description']
    final_meal = final_match['food_pairing'].select {|num| num.include?(input_ingredient)}.sample

    puts "Excellent choice!"
    puts "We believe #{final_beer_name} would be an excellent choice to drink alongside a delicious meal of #{final_meal}."
    puts "This beer and food pairing is based upon your selected #{input_abv} ABV and #{input_ingredient}.\n"
    puts "#{final_beer_name}: #{final_beer_description}"

    end

  end



  # def show_pairings(pairings)
  # pairings.each do |pairing|
  #   #how could we output each line's name here?
  #   pairing.name
  #   end
  # end

end
