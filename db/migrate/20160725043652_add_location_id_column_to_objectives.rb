class AddLocationIdColumnToObjectives < ActiveRecord::Migration[5.0]
  def change
    add_column :objectives, :location_id, :integer
  end
end
