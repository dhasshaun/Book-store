class SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user
  respond_to :json

  def destroy
    @user = User.find(current_user.id)
    @user.orders.destroy_all
    @user.destroy
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
