breweries_list = ["Blue Point Brewery", "Samuel Adams Brewery", "Brooklyn Brewery", "Long Trail Brewery", "Coney Island Brewery", "Montauk Brewery", "Rolling Rock Brewery", "Saranac Brewery"]

breweries_list.each do |new_brewery|
  Brewery.create(name: new_brewery)
end

people_list = ["Tom","Dick","Harry", "John", "York", "Paul", "Jax", "Ashe", "Sona", "Lucian", "Katarina", "Feeder", "Noobert"]

people_list.each do |new_person|
  Person.create(name: new_person)
end

beers_list = ["Blue Point Beer", "Samuel Adams Beer", "Brooklyn Beer", "Long Trail Beer", "Coney Island Beer", "Montauk Beer", "Rolling Rock Beer", "Saranac Beer"]

  beers_list.each do |new_beer|
    Beer.create(name: new_beer)
  end
