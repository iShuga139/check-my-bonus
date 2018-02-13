require 'spec_helper'

describe 'Server' do # rubocop:disable Metrics/BlockLength
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do
    it 'responds succesfully' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('Welcome to Check My Bonus!'.to_json)
    end
  end

  describe 'GET /bonus' do
    base_url = '/api/v1/bonus'
    params = '?percentage_chief=50&salary=100100.10'

    it 'responds failure' do
      get base_url + params
      expect(last_response.status).to eq(422)
      expect(last_response.body).to eq('Missing parameters'.to_json)
    end

    it 'responds successfully' do
      get base_url + params + '&percentage_company=100&percentage_salary=10'
      expect(last_response).to be_ok
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('Bonus to receive: 7507.51'.to_json)
    end
  end
end
