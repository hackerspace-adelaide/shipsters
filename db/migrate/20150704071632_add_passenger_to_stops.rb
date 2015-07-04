class AddPassengerToStops < ActiveRecord::Migration
  def change
    add_reference :stops, :passenger, index: true, foreign_key: true
  end
end
