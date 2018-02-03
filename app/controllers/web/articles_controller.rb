class Web::ArticlesController < Web::ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = find_article
  end

  def new
    @article = Article.new
  end

  def edit
    @article = find_article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = find_article

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = find_article
    @article.destroy

    redirect_to articles_path
  end

  def moderate
    article = find_article
    article.moderate

    redirect_to article
  end

  private

  def find_article
    Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, links_attributes: [:id, :url, :destroy])
  end
end
