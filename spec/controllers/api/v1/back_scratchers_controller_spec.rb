require 'rails_helper'

RSpec.describe Api::V1::BackScratchersController, type: :controller do

  before(:all) do
    @user = User.new(username: 'admin', password: 'pass1234')
    @user.save!
  end
  
  it "get returns status 200" do
    # allow all requests
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    get :index
    expect(response).to have_http_status(200)
  end

  it "post with invalid params return 422" do
    # allow all requests
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    post :create, params: {item_name: '', item_description: '', item_cost: '-4'}
    expect(response).to have_http_status(422)
  end

  it "post with valid params return 200 and a new Item is added" do
    # allow all requests
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    post :create, params: {item_name: 'name', item_description: 'desc', item_cost: '10.0'}
    expect(response).to have_http_status(200)
  end

end
