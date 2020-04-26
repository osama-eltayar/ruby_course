class AddModelRefToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :model, null: false, foreign_key: true
  end
end
