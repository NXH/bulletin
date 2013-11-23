class AccountsController < ApplicationController

  before_action :set_account, :only =>[:show, :edit, :update, :destroy]

  def set_account
    @account = Account.find_by(id: params [:id])
  end

  def index
    @accounts = Account.find(:all, :order => 'nickname'.downcase)
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new
    @account.nickname = params[:nickname]
    @account.person1 = params[:person1]
    @account.person2 = params[:person2]
    @account.person1_email = params[:person1_email]
    @account.person2_email = params[:person2_email]
    @account.person1_picture = params[:person1_picture]
    @account.person2_picture = params[:person2_picture]


    if @account.save
      redirect_to accounts_url, notice: "Account created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @account.nickname = params[:nickname]
    @account.person1 = params[:person1]
    @account.person2 = params[:person2]
    @account.person1_email = params[:person1_email]
    @account.person2_email = params[:person2_email]
    @account.person1_picture = params[:person1_picture]
    @account.person2_picture = params[:person2_picture]

    if @account.save
      redirect_to accounts_url, notice: "Account updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @account.destroy

    redirect_to accounts_url, notice: "Account deleted."
  end
end
