class Web::Moderation::ArticlesController < Web::Moderation::ApplicationController
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result
  end

  def show
    @article = find_article
  end

  def edit
    @article = find_article
  end

  def update
    @article = find_article

    if @article.update(article_params)
      redirect_to moderation_article_url(@article)
    else
      render 'edit'
    end
  end

  private

  def articles
    Article.with_state(:on_moderation)
  end

  def find_article
    articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :state_event)
  end
end
