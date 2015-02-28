class ArticlesController < ApplicationController
  before_action :logged_in_user , only: [:create, :destroy]
  #before_action :correct_user , only: [:create]
  before_action :admin_user, only: [:create, :destroy]

  def new
    @article = Article.new
    @genres = Genre.all
  end

  def index
    if params[:genre_id].blank?
      @genre = nil
      @articles = Article.paginate(page: params[:page])
    else
      @genre = Genre.find(params[:genre_id])
      @articles = @genre.articles.paginate(page: params[:page])
    end
  end

  def show
    @article = Article.find(params[:id])
    @reviews = @article.reviews.paginate(page: params[:page])
    @review = Review.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "文章发布成功"
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "文章删除成功"
    redirect_to users_url
  end

  private

    def article_params
      params.require(:article).permit(:title, :genre_id, :content, :views_count)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
       redirect_to login_url
      end
    end

    #def correct_user
      #@user = User.find(params[:id])
      #redirect_to(root_url) unless current_user?(@user)
    #end

    def admin_user
      redirect_to(root_url) unless logged_admin?
    end

end
