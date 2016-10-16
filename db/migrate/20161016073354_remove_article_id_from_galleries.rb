class RemoveArticleIdFromGalleries < ActiveRecord::Migration
  def change
    remove_column :galleries, :article_id, :integer
  end
end
