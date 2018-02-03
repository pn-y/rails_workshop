class ModerationArticleForm < Article
  validates :category_id, presence: true
end
