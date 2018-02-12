class CreateBeers < ActiveRecord::Migration
  def change
  create_table :beers do |t|
    t.integer :beer_id
    t.integer :person_id
    end
  end
end
