#load book into database from book dir
def load_book(category,book_uniq_id,book_dir)
  #load book details
  book_details = JSON.parse(File.read("#{book_dir}/details.json"))
  #book_uniq_url
  book_uniq_url = book_details['uniq_url']
  if book_uniq_url.nil?
    book_uniq_url = book_uniq_id
  end 
  #find or initialize a new book
  ebook = Ebook.where(uniq_id:book_uniq_id).first_or_create do |eb|
    eb.uniq_id = book_uniq_id 
    eb.uniq_url = book_uniq_url
    eb.category = category
  end
  book_content_md = File.read("#{book_dir}/content.md")
  ebook.update(title:book_details['title'],uniq_url: book_uniq_url,category: category,content: book_content_md)
  ebook.cover.store!(File.open("#{book_dir}/cover.png"))

  ebook.save!
  puts ebook.inspect.to_s
  puts ebook.cover.url
  puts ebook.cover.url(:thumb)


  puts "Done"
  
   
end
#iterate thru all the books in a given category directory
def load_books(category,dir)
  puts "Loading books in directory #{dir}".blue
  book_dirs = Dir.entries(dir).select {|entry| File.directory? File.join(dir,entry) and !(entry =='.' || entry == '..') } 
  book_dirs.each do |book_dir|
    load_book(category,book_dir, "#{dir}/#{book_dir}")
  end
end


#__main__
#read location of ebooks from config
ebooks_root = "#{Rails.application.config.ebooks_repo_root}"

puts "Starting to Load Ebooks from #{ebooks_root}".blue

#load the config from ebooks_root
config = JSON.parse(File.read("#{ebooks_root}/conf.json"))


#iterate through the categories
config['categories'].each do |category|
  puts "Loading up category  - #{category}".green
  load_books(category,"#{ebooks_root}/#{category}")
end

