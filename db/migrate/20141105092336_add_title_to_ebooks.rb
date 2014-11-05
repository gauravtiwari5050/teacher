class AddTitleToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :title, :string
  end
end
