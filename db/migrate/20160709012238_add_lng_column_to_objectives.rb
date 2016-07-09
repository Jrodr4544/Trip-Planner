class AddLngColumnToObjectives < ActiveRecord::Migration[5.0]
  def change
    add_column :objectives, :lng, :float
  end
end
