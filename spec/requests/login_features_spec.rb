require 'rails_helper'

RSpec.describe "LoginFeatures", type: :request do
  describe "GET /login_features" do
    it "works! (now write some real specs)" do
      get login_features_path
      expect(response).to have_http_status(200)
    end
  end
end
