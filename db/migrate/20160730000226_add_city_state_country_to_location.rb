class AddCityStateCountryToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :country, :string
  end
end
