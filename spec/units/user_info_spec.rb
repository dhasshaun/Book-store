require 'rails_helper'

RSpec.describe 'GET /users', type: :request do

  context 'successful retrieve info' do

    it 'return 200 and user info' do
      user = User.create(email: 'me@me.com', password: '12341234')
      sign_in(user)
      get '/users'
      expect(response.status).to eq(200)
      expect(response.body).to match_json_schema('info')
      sign_out(user)
    end

    it 'return 401 user not login' do
      get '/users'
      expect(response).to have_http_status(401)
    end

  end
end
