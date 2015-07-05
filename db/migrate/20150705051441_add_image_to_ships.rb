class AddImageToShips < ActiveRecord::Migration
  def change
    add_column :ships, :image, :string
  end
end
