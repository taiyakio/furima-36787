class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :create]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to "/"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :condision_id, :shippingcharges_id, :area_id, :shippingdate_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
