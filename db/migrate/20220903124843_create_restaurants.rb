class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string    :name
      t.string    :city
      t.string    :image_url
      t.string    :phone_numer
      t.string    :address
      t.string    :type_food
      t.timestamps
    end
  end
end
