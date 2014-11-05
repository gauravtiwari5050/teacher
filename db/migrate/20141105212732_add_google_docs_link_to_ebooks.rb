class AddGoogleDocsLinkToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :google_docs_link, :text
  end
end
