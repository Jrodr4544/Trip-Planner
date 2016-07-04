class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string      :title
      t.belongs_to  :user,  index:  true
    end
  end
end
