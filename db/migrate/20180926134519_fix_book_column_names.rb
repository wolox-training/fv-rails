class FixBookColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :titulo, :title
    rename_column :books, :autor, :author
    rename_column :books, :año, :year
    rename_column :books, :editor, :publisher
    rename_column :books, :genero, :genre
  end
end
