class Person < ActiveRecord::Base
has_many :beers
has_many :breweries, through: :beers
end
