require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) { get users_path }
    it 'Should include the placeholder text' do
      expect(response.body).to include('All users or user id will be displayed here')
    end

    it 'should have a response status of 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the correspondig page' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before(:each) { get user_path id: 20 }

    it 'should have a response status of 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the corresponding page' do
      expect(response).to render_template(:show)
    end

    it 'Should include the placeholder text' do
      expect(response.body).to include('All details for a particular user id will be displayed here')
    end
  end
end
