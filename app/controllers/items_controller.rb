class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explain, :category_id, :condition_id, :shipping_charge_id, :shipment_source_id, :shipment_date_id, :price).merge(user_id: current_user.id)
  end
end
