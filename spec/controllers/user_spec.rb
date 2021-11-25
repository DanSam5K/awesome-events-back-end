require 'rails_helper'

RSpec.describe 'LoggedInUserController', type: :request do
  let!(:user) { create(:user) }

  describe 'User sign up' do
    let!(:user) { create(:user) }

    it 'Succeeds for a new user name' do
      headers = {
        'HTTP_ACCEPT' => 'application/json'
      }
      post '/users', params: { user:
                                { name: 'John Snow',
                                  email: 'john@example.com',
                                  password: '123456',
                                  password_confirmation: '123456' } },
                     headers: headers

      expect(response).to have_http_status(200)
    end

    it 'success and valid email' do
      headers = {
        'HTTP_ACCEPT' => 'application/json'
      }
      post '/users', params: { user: { name: user.email } },
                     headers: headers

      expect(response).to have_http_status(200)
    end
  end
end
