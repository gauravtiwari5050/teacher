class CreateEbooks < ActiveRecord::Migration
  def change
    create_table :ebooks do |t|
      t.string :uniq_id
      t.string :uniq_url
      t.string :category
      t.string :tags
      t.binary :content,:limit => 16.megabyte

      t.timestamps
    end
  end
end
