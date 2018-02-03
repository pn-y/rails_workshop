class Article < ApplicationRecord
  include ArticleStateMachine

  has_many :comments, dependent: :destroy
  has_many :links, inverse_of: :article
  belongs_to :category, required: false

  validates :title, presence: true,
                    length: { minimum: 5 }

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true
end
