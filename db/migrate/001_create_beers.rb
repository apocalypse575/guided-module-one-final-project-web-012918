class CreateBeers < ActiveRecord::Migration[4.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :person_id
      t.integer :brewery_id
    end
  end
end
