class AddLatColumnToObjectives < ActiveRecord::Migration[5.0]
  def change
    add_column :objectives, :lat, :float
  end
end
