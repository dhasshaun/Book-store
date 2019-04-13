require 'rails_helper'

RSpec.describe 'GET /books', type: :request do
  let(:url) { '/books' }

  context 'Fetch all Books' do

    it 'returns 200' do
      get url, as: :json
      expect(response.body).to match_json_schema('book')
    end

  end

end