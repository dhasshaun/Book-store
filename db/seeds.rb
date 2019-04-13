require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts('Get books from service.... ')
books_response = RestClient.get('https://scb-test-book-publisher.herokuapp.com/books')

puts('Get recommended books from service...')
books_recommended_response = RestClient.get('https://scb-test-book-publisher.herokuapp.com/books/recommendation')

books = JSON.parse(books_response.body)
recommended_books = JSON.parse(books_recommended_response.body)

puts('Creating books....')
books.each do |book|
  new_book = Book.new(
    name: book['book_name'],
    price: book['price'],
    author: book['author_name']
  )
  puts("Saving #{new_book.name}")
  new_book.save
end

puts 'Updating Recommended books'

recommended_books.each do |rec_book|
  book = Book.where(name: rec_book['book_name']).first
  if book.present?
    book.update(is_recommended: true)
  end
end
