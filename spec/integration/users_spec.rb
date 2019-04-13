require 'swagger_helper'

describe 'Users ( info, delete, create order)' do
  path '/users' do

    get 'Fetch User information (Login required)' do
      tags 'User\'s order'
      consumes 'application/json'
      parameter in: :header, name: :Authorization, schema: {
        type: :string
      }

      response '200', 'Return user\'s informations' do
        run_test!
      end
    end

    delete 'Remove user and orders (Login required)' do
      tags 'Remove user and orders'
      consumes 'application/json'
      parameter in: :header, name: :Authorization, schema: {
        type: :string
      }

      response '204', 'User and orders has been removed.' do
        run_test!
      end
    end

  end

  path '/users/orders' do
    post 'Create Order with book ids' do
      tags 'Create Order'
      consumes 'application/json'
      response '200', 'Successful order books.' do
        parameter in: :header, name: :Authorization, schema: { type: :string }

        parameter in: :body, name: :book_ids, schema: {
            type: :object,
            properties: {
              orders: { type: :object,
              properties: {
                book_ids: { type: :string }
              }}
            },
          },
          description: 'eg. Value of book_ids is [4,5]'
        run_test!
      end
    end
  end


end
