class UsersController < ApplicationController
  def index
    @users = User.includes(:articles)
  end

  def show
    @user = User.find(params[:id])
    @article = @user.articles
  end

end
