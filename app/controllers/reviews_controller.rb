class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.article_id = params[:article_id]
    @article = Article.find(params[:article_id])
    if @review.save
      flash[:success] = "文章发布成功"
     else
      flash[:error] = "发布失败+#{}"
    end
    redirect_to @article
  end

  private

    def review_params
      params.require(:review).permit(:user, :content)
    end

end
