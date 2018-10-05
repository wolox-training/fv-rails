class AddValidationsToRents < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:rents, :user_id, false)
    change_column_null(:rents, :book_id, false)
    change_column_null(:rents, :initial_date, false)
    change_column_null(:rents, :final_date, false)
  end
end
