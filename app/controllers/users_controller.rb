class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def index
    @search = User.search(params[:search])
    @users = @search.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end
  
  def profile
    @user = @current_user
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @user.destroy
  end
  
  protected
  
    def find_user
      @user = User.find params[:id]
    end
end
