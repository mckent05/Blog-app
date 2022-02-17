require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path user_id: 30 }
    it 'Should include the placeholder text' do
      expect(response.body).to include('All post for a particular user id will be displayed here')
    end

    it 'should have a response status of 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the correspondig page' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before(:each) { get user_post_path user_id: 30, id: 20 }

    it 'should have a response status of 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the corresponding page' do
      expect(response).to render_template(:show)
    end

    it 'Should include the placeholder text' do
      text = 'All details about a specific post for a particular user id will be displayed here.'
      expect(response.body).to include(text)
    end
  end
end
