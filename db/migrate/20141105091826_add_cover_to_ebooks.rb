class AddCoverToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :cover, :string
  end
end
