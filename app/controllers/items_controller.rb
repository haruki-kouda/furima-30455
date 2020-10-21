class ItemsController < ApplicationController
  def index
    @item = Item.includes(:user).order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :goods_condition_id, :postage_type_id, :delivery_area_id, :preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
