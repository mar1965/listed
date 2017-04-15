class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice]  = "To do item was saved."
      redirect_to users_show_path
    else
      flash.now[:alert] = "Sorry, there was an error saving the to do item. Please try again."
      render.new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
