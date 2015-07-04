class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.date :launched

      t.timestamps null: false
    end
  end
end
