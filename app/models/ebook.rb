class Ebook < ActiveRecord::Base
  validates :uniq_id ,:uniqueness => :true
  validates :uniq_url ,:uniqueness => :true
  acts_as_taggable
end
