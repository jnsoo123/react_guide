class ItemsController < ApplicationController
  respond_to :html
  respond_to :js, only: :create

  def index
    @items = Item.all
  end

  def create
    @item = Item.create(item_params)
    respond_with(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
