RSpec.describe 'Users Controller', type: :request do
  describe 'GET /index' do
    context 'when the page is loaded' do
      before do
        get '/users'
      end
      it 'returns a 200 status code' do
        expect(response).to have_http_status(200)
      end
      it 'renders the index template' do
        expect(response).to render_template('index')
        expect(response.body).to render_template('index')
      end
    end
  end

  describe 'GET /show' do
    let!(:user) { User.create(name: 'Monica', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
    context 'when the page is loaded' do
      before do
        get user_path(user.id)
      end
      it 'returns a 200 status code' do
        expect(response).to have_http_status(200)
      end
      it 'renders the show template' do
        expect(response).to render_template('show')
        expect(response.body).to render_template('show')
      end
      it 'includes see all posts' do
        expect(response.body).to include('See all posts')
      end
    end
  end
end
