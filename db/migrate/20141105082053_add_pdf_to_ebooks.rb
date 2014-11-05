class AddPdfToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :pdf, :string
    add_column :ebooks, :amazon_link, :string
    add_column :ebooks, :smashwords_link, :string
  end
end
