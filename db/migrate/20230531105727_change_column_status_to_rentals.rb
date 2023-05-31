class ChangeColumnStatusToRentals < ActiveRecord::Migration[7.0]
  def change
    remove_column :rentals, :status
    add_column :rentals, :status, :integer, default: 0
  end
end
