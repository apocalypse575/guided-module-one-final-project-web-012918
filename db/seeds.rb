breweries_list = ["Blue Point Brewery", "Samuel Adams Brewery", "Brooklyn Brewery", "Long Trail Brewery", "Coney Island Brewery", "Montauk Brewery", "Rolling Rock Brewery", "Saranac Brewery"]

breweries_list.each do |new_brewery|
  Brewery.create(name: new_brewery)
end
