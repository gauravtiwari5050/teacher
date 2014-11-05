class AddVersionToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :version, :string
  end
end
