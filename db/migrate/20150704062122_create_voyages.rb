class CreateVoyages < ActiveRecord::Migration
  def change
    create_table :voyages do |t|
      t.references :ship, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
