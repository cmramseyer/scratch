class Api::V1::BackScratchersController < ActionController::API

  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = Item.all
    render json: @items, status: :ok
  end

  def show
    render json: @item, status: :ok
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: {message: 'Item was created'}, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: {message: 'Item was updated'}, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    render json: {message: 'Item was destroyed'}, status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.permit(:id, :item_name, :item_description, :item_cost)
  end
end
