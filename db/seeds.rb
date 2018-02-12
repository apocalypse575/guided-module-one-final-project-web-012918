people_list = ["Tom","Dick","Harry", "John", "York", "Paul", "Jax", "Ashe", "Sona", "Lucian", "Katarina", "Feeder", "Noobert"]
people_list.each do |new_person|
  Person.create(name: new_person)
end
