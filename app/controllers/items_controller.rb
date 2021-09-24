class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condision_id, :shippingcharges_id, :area_id, :shippindate_id, :image).merge(user_id: current_user.id)
  end

end
