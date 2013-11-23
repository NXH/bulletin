class CategoriesController < ApplicationController

  before_action :authenticate_account!
  before_action :set_category, :only => [:show, :edit, :update, :destroy]
  before_action :account_must_own_category, :only => [:show, :edit, :update, :destroy]

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def account_must_own_category
    unless @category.account_id == current_account
      redirect_to root_url, :alert => "You are not authorized to do that."
    end
  end

  def index
    @categories = current_account.categories.find(:all, :order => 'name'.downcase)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.name = params[:name]
    @category.account_id = current_account.id

    if @category.save
      redirect_to categories_url, notice: "Category created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @category.name = params[:name]
    @category.account_id = current_account.id

    if @category.save
      redirect_to categories_url, notice: "Category updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_url, notice: "Category deleted."
  end
end
