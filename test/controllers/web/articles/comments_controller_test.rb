require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:published)
  end

  test "posts create" do
    article_comment_attrs = { body: 'body', commentor: 'commentor' }
    post article_comments_url(@article.id), params: { article_comment: article_comment_attrs }

    comment = @article.comments.find_by(body: 'body', commentor: 'commentor')
    assert(comment.persisted?)
  end

  test 'deletes destroy' do
    comment = article_comments(:one)

    delete article_comment_url(comment.article_id, comment.id)

    assert { !comment.article.comments.exists?(comment.id) }
  end
end
