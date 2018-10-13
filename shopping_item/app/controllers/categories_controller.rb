class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @items = @category.items.all.order(check: :desc).order(updated_at: :desc)
    @item = @items.first
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to action: 'index'
      # https://stackoverflow.com/questions/10439724/redirect-to-index-rather-than-show-after-save/10439833
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
