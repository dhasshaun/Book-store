require 'swagger_helper'

describe 'Book API' do
  path '/books' do
    get 'Fetch Books (Login not required)' do
      tags 'Books'
      consumes 'application/json'

      response '200', 'All books in Database order by recommended books' do
        run_test!
      end
    end
  end
end
