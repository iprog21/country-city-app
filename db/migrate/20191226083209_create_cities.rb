class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.references :country
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
