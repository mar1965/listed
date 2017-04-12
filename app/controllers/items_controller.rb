class ItemsController < ApplicationController
  after_action :verify_authorized, except: [:index]

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item

    if @item.save
      flash[:notice]  = "To do item was saved."
      redirect_to [@item]
    else
      flash.now[:alert] = "Sorry, there was an error saving the to do item. Please try again."
      render.new
    end

    private

    def item_params
      params.require(:item).permit(:name)
    end

  end

end
