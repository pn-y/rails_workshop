class ModerationArticleForm < Article
  include ApplicationForm

  permit :category_id, :state_event

  validates :category, presence: true
end
