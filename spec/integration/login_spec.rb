require 'swagger_helper'

describe "Login" do
  path '/login' do
    post 'Login' do
      tags 'Authentication'
      consumes 'application/json'
      response '200', 'Logged in' do
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: { type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }}
          },
        }, required: [ 'email', 'password' ]
        run_test!
      end
      response '401', 'Unable to Login' do
        run_test!
      end
    end
  end
end
