class AddForeignKeyRentalsToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :rental, index: true
  end
end
