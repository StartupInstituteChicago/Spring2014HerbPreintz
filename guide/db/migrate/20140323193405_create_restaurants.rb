class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number

      t.timestamps
    end
  end
end
