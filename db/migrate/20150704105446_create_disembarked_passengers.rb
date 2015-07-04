class CreateDisembarkedPassengers < ActiveRecord::Migration
  def change
    create_table :disembarked_passengers do |t|
      t.references :stop, index: true, foreign_key: true
      t.references :passenger, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
