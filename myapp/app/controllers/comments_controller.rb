class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_buy_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def update_buy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.buy
      @comment.update_attribute(:buy, false)
    else
      @comment.update_attribute(:buy, true)
    end
    redirect_to article_path(@article)
  end
  # https://stackoverflow.com/questions/29619447/button-click-changes-boolean-to-true

  private
    def comment_params
      params.require(:comment).permit(:commetner, :body, :buy)
    end

    def comment_buy_params
      params.require(:comment).permit(:buy)
    end
end
