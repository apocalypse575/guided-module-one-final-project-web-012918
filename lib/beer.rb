class Beer < ActiveRecord::Base
  belongs_to :person
  belongs_to :brewery
end
