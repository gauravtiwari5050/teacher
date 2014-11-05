class EbooksController < ApplicationController
  def list
  end
  def show
    @ebook = Ebook.find_by_uniq_url(params[:book_uniq_url])
    #TODO redirect to the list url
    if @ebook.nil?
      redirect_to '/'
    end  
  end
end
