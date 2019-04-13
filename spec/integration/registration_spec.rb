require 'swagger_helper'

describe "Sign Up" do
  path '/users' do
    post 'Sign-up' do
      tags 'Authentication'
      consumes 'application/json'
      response '200', 'Successful sign-up' do
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: { type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              first_name: { type: :string },
              last_name: { type: :string },
              date_of_birth: { type: :string}
            }}
          },
          required: [ 'email', 'password' ],
          descriptions: 'Date of Birth should format : 01/01/1990'
        }
        run_test!
      end
      response '401', 'Unable to Login' do
        run_test!
      end
    end
  end
end
