class AddDefaultStatusToRentals < ActiveRecord::Migration[7.0]
  def change
    change_column_default :rentals, :status, "Pending"
  end
end
