class RemoveCityStateCountryFromObjective < ActiveRecord::Migration[5.0]
  def change
    remove_column :objectives, :city, :string
    remove_column :objectives, :state, :string
    remove_column :objectives, :country, :string
  end
end
