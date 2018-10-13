class ItemsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.create(item_params)
    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    @item.destroy
    @item = @category.items.first
    if @item != nil
      redirect_to edit_category_item_path(@category, @item)
    else
      redirect_to category_path(@category)
    end
  end

  def edit
    @categories = Category.all
    @category = @categories.find(params[:category_id])
    @items = @category.items.all.order(check: :desc).order(updated_at: :desc)
    @item = @category.items.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])

    if @item.update(item_check_params)
      redirect_to category_path(@category)
    else
      redirect_to 'edit'
    end
  end

  def update_check
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])

    if @item.check
      @item.update_attribute(:check, false)
    else
      @item.update_attribute(:check, true)
    end
    redirect_to category_path(@category)
  end
  # https://stackoverflow.com/questions/29619447/button-click-changes-boolean-to-true

  private
    def item_params
      params.require(:item).permit(:image, :address, :check)
    end

    def item_check_params
      params.require(:item).permit(:check)
    end
end
