class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :birthplace
      t.string :deathplace
      t.datetime :birthdate
      t.datetime :deathdate
      t.string :notability

      t.timestamps null: false
    end
  end
end
