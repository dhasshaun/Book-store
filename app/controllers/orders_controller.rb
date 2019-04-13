class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { orders: Order.where(user_id: current_user.id) }
  end

  def create
    permitted_params = params.require(:orders).permit(book_ids: [])
    books_orders = Book.where(id: permitted_params[:book_ids])
    new_order = Order.new
    new_order.user_id = current_user.id
    new_order.books = books_orders
    new_order.save
    render json: { status: 200, price: new_order.grand_total }
  end

end
