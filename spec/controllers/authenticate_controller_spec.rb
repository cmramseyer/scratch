require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do

  describe "probando" do

    before(:all) do
      user = User.new(username: 'admin', password: 'pass1234')
      user.save!
    end
    
    it "user ok" do
      post :authenticate, params: { username: 'admin', password: 'pass1234' }
      expect(response).to have_http_status(200)
    end

    it "user mal" do
      post :authenticate, params: { username: 'adminaa', password: 'pass1234' }
      expect(response).to have_http_status(401)
    end

    
  end


end
