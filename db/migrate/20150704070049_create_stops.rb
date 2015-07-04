class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.references :voyage, index: true, foreign_key: true
      t.references :port, index: true, foreign_key: true
      t.datetime :arrival
      t.datetime :departure

      t.timestamps null: false
    end
  end
end
