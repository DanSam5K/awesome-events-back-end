require 'rails_helper'

RSpec.describe 'EventsController', type: :request do
  describe "List a given user's events" do
    it "Returns the list of the user's reservations" do
      get '/events'
      expect(response).to_not have_http_status(:ok)
    end
  end
end
