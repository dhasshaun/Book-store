class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(current_user.id)
    user_books_orders = []
    user.orders.each do |order|
      user_books_orders << {
        books: order.books.map{|book| { id: book.id, name: book.name, price: book.price.to_f }},
        total_price: order.grand_total
      }
    end
    render json: { email: user.email, created_at: user.created_at.strftime('%d/%m/%Y'), orders: user_books_orders }
  end

  def update
    user = User.find(current_user.id)
    permitted_params = params.require('users').permit(:first_name, :last_name, :date_of_birth)
    birthdate = permitted_params['date_of_birth'].split('/')
    user.update(
      first_name: permitted_params['first_name'],
      last_name: permitted_params['last_name'],
      date_of_birth: Date.new(birthdate[2].to_i, birthdate[1].to_i, birthdate[0].to_i) # '24/08/1992'
    )
    render json: { status: :ok }
  end

end
