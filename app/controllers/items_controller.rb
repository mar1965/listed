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

  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "To do item was deleted successfully."
    else
      flash[:alert] = "To do item couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
