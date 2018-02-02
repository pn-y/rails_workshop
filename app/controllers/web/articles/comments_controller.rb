class Web::Articles::CommentsController < Web::Articles::ApplicationController
  http_basic_authenticate_with name: "viraj", password: "password", only: :destroy

  def create
    @article = resource_article
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = resource_article
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:article_comment).permit(:commentor, :body)
  end
end
