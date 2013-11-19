class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find_by(id: params[:id])
  end

  def new
  end

  def create
    @account = Account.new
    @account.nickname = params[:nickname]
    @account.person1 = params[:person1]
    @account.person2 = params[:person2]
    @account.person1_email = params[:person1_email]
    @account.person2_email = params[:person2_email]
    @account.password_digest = params[:password_digest]

    if @account.save
      redirect_to accounts_url, notice: "Account created successfully."
    else
      render 'new'
    end
  end

  def edit
    @account = Account.find_by(id: params[:id])
  end

  def update
    @account = Account.find_by(id: params[:id])
    @account.nickname = params[:nickname]
    @account.person1 = params[:person1]
    @account.person2 = params[:person2]
    @account.person1_email = params[:person1_email]
    @account.person2_email = params[:person2_email]
    @account.password_digest = params[:password_digest]

    if @account.save
      redirect_to accounts_url, notice: "Account updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @account = Account.find_by(id: params[:id])
    @account.destroy

    redirect_to accounts_url, notice: "Account deleted."
  end
end
