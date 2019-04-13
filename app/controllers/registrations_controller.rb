class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    sign_up_params = params.require('user').permit(:email, :password, :first_name, :last_name, :date_of_birth)
    if sign_up_params[:date_of_birth].present?
      birthdate = sign_up_params[:date_of_birth].split('/')
      sign_up_params[:date_of_birth] = Date.new(birthdate[2].to_i, birthdate[1].to_i, birthdate[0].to_i) # '24/08/1992'
    end
    build_resource(sign_up_params)
    resource.save
    render_resource(resource)
  end

end
