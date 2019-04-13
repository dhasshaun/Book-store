require 'rails_helper'

RSpec.describe "POST /users/orders", type: :request do
  context "create order with book ids" do

    it 'should create order' do
      user = User.create(email: 'me@me.com', password: '12341234')
      sign_in(user)
      post '/users/orders', params: {
        orders: {
          book_ids: [4,5]
        }
      }
      expect(response).to have_http_status(200)
      expect(response.body).to match_json_schema('success_order')
    end

    it 'should return 401 unauthorized' do
      post '/users/orders'
      expect(response).to have_http_status(401)
    end

  end

end
