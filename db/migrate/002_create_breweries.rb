class CreateBreweries < ActiveRecord::Migration[4.2]
  def change
    create_table :breweries do |t|
      t.string :name
    end
  end
end
