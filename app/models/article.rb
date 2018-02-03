class Article < ApplicationRecord
  include ArticleStateMachine

  has_many :comments, dependent: :destroy
  belongs_to :category, required: false
  validates :title, presence: true,
                    length: { minimum: 5 }
end
