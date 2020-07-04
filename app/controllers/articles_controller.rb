class ArticlesController < ApplicationController
  before_action:authenticate_user!, except: [:index,:show]
  before_action:ensure_correct_user, only: [:edit,:update,:destroy]
 

  def index
    @article=Article.includes(:user)
  end

  def new
    @article=Article.new
  end

  def create
    @article=Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  def show
    @article=Article.find(params[:id])
    @user = @article.user
    @comments = @article.comments
    @comment = @article.comments.build
  end

  def edit
    @article=Article.find(params[:id])
  end

  def update
    @article=Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def ensure_correct_user
    @article=Article.find(params[:id])
    if @article.user_id != current_user.id
      flash[:notice] = '君に編集する権限はないよーーーーーーーーーん'
      redirect_to root_path
    end
  end
  

  private
    def article_params
      params.require(:article).permit(:title,:category,:content,:image)
    end
end
