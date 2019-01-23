require 'rails_helper'

RSpec.describe Api::V1::BackScratchersController, type: :controller do

  before(:each) do
    @user = User.new(username: 'admin', password: 'pass1234')
    @user.save!
    @item = items(:simple_back_scratcher)
  end
  
  it "get index returns status 200" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    get :index
    expect(response).to have_http_status(200)
  end

  it "get show with valid item_id returns status 200" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    get :index, params: {id: @item.id}
    expect(response).to have_http_status(200)
  end

  it "get show with invalid item_id returns status 404" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    get :show, params: {id: 12345}
    expect(response).to have_http_status(404)
  end

  it "post with invalid params returns 422" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    post :create, params: {item_name: '', item_description: '', item_cost: '-4'}
    expect(response).to have_http_status(422)
  end

  it "post with valid params returns 200 and a new Item is added" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    post :create, params: {item_name: 'name', item_description: 'desc', item_cost: '10.0'}
    expect(response).to have_http_status(200)
  end

  it "update with valid params returns 200" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    patch :update, params: {id: @item.id, item_name: 'name', item_description: 'desc', item_cost: '10.0'}
    expect(response).to have_http_status(200)
  end

  it "update with invalid params returns 422" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    patch :update, params: {id: @item.id, item_name: '', item_description: 'desc', item_cost: '10.0'}
    expect(response).to have_http_status(422)
  end

  it "update with invalid item_id returns 404" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    patch :update, params: {id: 12345, item_name: 'name', item_description: 'desc', item_cost: '10.0'}
    expect(response).to have_http_status(404)
  end

  it "destroy with valid item_id returns 200" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    delete :destroy, params: {id: @item.id}
    expect(response).to have_http_status(200)
  end

  it "destroy with invalid item_id returns 404" do
    AuthorizeApiRequest.any_instance.stub(:run).and_return(@user)
    delete :destroy, params: {id: 12345}
    expect(response).to have_http_status(404)
  end

end
