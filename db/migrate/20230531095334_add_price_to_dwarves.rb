class AddPriceToDwarves < ActiveRecord::Migration[7.0]
  def change
    add_column :dwarves, :price, :integer
  end
end
