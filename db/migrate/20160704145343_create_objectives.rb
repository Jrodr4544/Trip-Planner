class CreateObjectives < ActiveRecord::Migration[5.0]
  def change
    create_table :objectives do |t|
      t.string      :title
      t.string      :city
      t.string      :country
      t.string      :state
      t.text        :notes
      t.belongs_to  :trip
    end
  end
end
