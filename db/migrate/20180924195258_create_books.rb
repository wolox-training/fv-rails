class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :genero
      t.string :autor
      t.string :image
      t.string :titulo
      t.string :editor
      t.string :año

      t.timestamps
    end
  end
end
