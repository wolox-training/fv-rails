class UpdateUserJsonAndTimeStamps < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.json :tokens
    end
  end
end
