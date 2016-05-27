class ItemsController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @items = Item.unscoped.all
  end

  def sold
    @item = Item.find(params[:id])
    @item.sold = true
    @item.save
    redirect_to items_path
  end

  def unsold
    @item = Item.unscoped.find(params[:id])
    @item.sold = false
    @item.save
    redirect_to items_path
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :primary_image, :secondary_image_urls, :description, :details_link)
  end

end
