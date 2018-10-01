class FixBookColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :titulo, :title
    change_column_null :books, :title, false

    rename_column :books, :autor, :author
    change_column_null :books, :author, false

    rename_column :books, :año, :year
    change_column_null :books, :year, false

    rename_column :books, :editor, :publisher
    change_column_null :books, :publisher, false

    rename_column :books, :genero, :genre
    change_column_null :books, :genre, false
  end
end
