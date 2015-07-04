class CreateEmbarkedPassengers < ActiveRecord::Migration
  def change
    create_table :embarked_passengers do |t|
      t.references :stop, index: true, foreign_key: true
      t.references :passenger, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
