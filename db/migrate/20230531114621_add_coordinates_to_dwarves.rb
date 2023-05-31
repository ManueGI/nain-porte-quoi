class AddCoordinatesToDwarves < ActiveRecord::Migration[7.0]
  def change
    add_column :dwarves, :latitude, :float
    add_column :dwarves, :longitude, :float
  end
end
