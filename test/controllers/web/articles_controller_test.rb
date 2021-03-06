require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:draft)
  end

  test "gets index" do
    get articles_url

    assert_response :success
  end

  test "gets show" do
    get article_url(@article)

    assert_response :success
  end

  test "gets new" do
    get new_article_url

    assert_response :success
  end

  test "posts create" do
    article_attrs = { title: 'title', links_attributes: [{ url: "some url" }]}

    post articles_url, params: { article: article_attrs }

    new_article = Article.find_by(title: 'title')

    assert(new_article.links.any?)
    assert(new_article.persisted?)
  end

  test "gets edit" do
    get edit_article_url(@article)

    assert_response :success
  end

  test "patch update" do
    patch article_url(@article), params: { article: { title: 'new_title' } }

    updated_article = @article.reload
    assert { updated_article.title == 'new_title' }
  end

  test 'deteles destroy' do
    delete article_url(@article)

    assert { !Article.exists?(@article.id) }
  end

  test 'patch moderate' do
    patch moderate_article_url(@article)

    updated_article = @article.reload
    assert { updated_article.on_moderation? }
  end
end
