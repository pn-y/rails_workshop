class Web::Moderation::ArticlesController < Web::Moderation::ApplicationController
  def index
    default_search = { state_eq: 'on_moderation' }
    @q = Article.ransack(params[:q] || default_search)
    @articles = @q.result
  end

  def show
    @article = find_article
  end

  def edit
    @article = ModerationArticleForm.find(params[:id])
  end

  def update
    @article = ModerationArticleForm.find(params[:id])

    if @article.update(params[:moderation_article_form])
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
end
