class BooksController < ApplicationController
  def index
    @books = Book.all.order('is_recommended desc')
  end
end
