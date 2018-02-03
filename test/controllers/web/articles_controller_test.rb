require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "gets index" do
    get articles_url

    assert_response :success
  end

  test "gets show" do
    article = articles(:published)

    get article_url(article)

    assert_response :success
  end

  test "gets new" do
    get new_article_url

    assert_response :success
  end

  test "posts create" do
    article_attrs = { title: 'title' }

    post articles_url, params: { article: article_attrs }

    new_article = Article.find_by(title: 'title')
    assert(new_article.persisted?)
  end

  test "gets edit" do
    article = articles(:published)

    get edit_article_url(article)

    assert_response :success
  end

  test "patch update" do
    article = articles(:published)

    patch article_url(article), params: { article: { title: 'new_title' } }

    assert { article.reload.title = 'new_title' }
  end

  test 'deteles destroy' do
    article = articles(:published)

    delete article_url(article)

    assert { Article.find_by(id: article.id).nil? }
  end
end
