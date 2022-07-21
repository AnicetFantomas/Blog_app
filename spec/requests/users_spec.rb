require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET /users' do
    before { get users_path }
    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render index template' do
      expect(response).to render_template(:index)
    end

    it 'Should have text Index Users' do
      expect(response.body).to include('Index Users')
    end
  end

  describe 'GET /users/:id' do
    before { get user_path(1) }
    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render show template' do
      expect(response).to render_template(:show)
    end

    it 'Should have text Show Users' do
      expect(response.body).to include('Show User')
    end
  end
end
