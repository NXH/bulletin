class CategoriesController < ApplicationController

  def index
    @categories = Category.find(:all, :order => 'name'.downcase)
  end

  def show
    @category = Category.find_by(id: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.name = params[:name]
    @category.account_id = params[:account_id]

    if @category.save
      redirect_to categories_url, notice: "Category created successfully."
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.name = params[:name]
    @category.account_id = params[:account_id]

    if @category.save
      redirect_to categories_url, notice: "Category updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy

    redirect_to categories_url, notice: "Category deleted."
  end
end
