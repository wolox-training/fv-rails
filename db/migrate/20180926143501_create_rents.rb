class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :initial_date
      t.date :final_date

      t.timestamps
    end
  end
end
