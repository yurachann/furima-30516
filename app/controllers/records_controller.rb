class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  
  def index
    redirect_to root_path if current_user.id == @item.user_id
    @record_address = RecordAddress.new
  end
  
  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      return redirect_to root_path
    else
      render action: :index
    end
  end
  
  private
  
  def record_params
    params.require(:record_address).permit(:postal_code, :shipment_source_id, :city, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
