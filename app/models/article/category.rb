class Article::Category < ApplicationRecord
  has_many :articles
end
