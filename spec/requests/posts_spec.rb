require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  before { get user_posts_path(user_id: User.first.id) }
  describe 'GET /posts' do
    before { user_posts_path(1) }

    it 'returns correct status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render index template' do
      expect(response).to render_template(:index)
    end

    it 'Should have text Index Posts' do
      expect(response.body).to include('Index Posts')
    end
  end

  describe 'GET /posts/:id' do
    before { get user_post_path(1, 1) }
    it 'returns correct status code' do
      get user_post_path(User.first.id, id: Post.first.id)
      expect(response).to have_http_status(200)
    end

    it 'Should render show template' do
      expect(response).to render_template(:show)
    end

    it 'Should have text Show Post' do
      expect(response.body).to include('Show Post')
    end
  end
end
