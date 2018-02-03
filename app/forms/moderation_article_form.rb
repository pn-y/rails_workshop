class ModerationArticleForm < Article
  validates :category, presence: true
end
