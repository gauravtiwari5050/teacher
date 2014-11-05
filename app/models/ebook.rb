class Ebook < ActiveRecord::Base
  validates :uniq_id ,:uniqueness => :true,:presence => :true
  validates :uniq_url ,:uniqueness => :true,:presence => :true
  validates :category ,:presence => :true
  acts_as_taggable
  mount_uploader :cover, CoverUploader
  def rendered_content
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    if Rails.env.production?
      return markdown.render(content.to_s)
    else
      return markdown.render(File.read("#{Rails.application.config.ebooks_repo_root}/#{category}/#{uniq_id}/content.md"))
    end
  end
end
