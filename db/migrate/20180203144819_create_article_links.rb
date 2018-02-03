class CreateArticleLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :article_links do |t|
      t.belongs_to :article
      t.string :url

      t.timestamps
    end
  end
end
