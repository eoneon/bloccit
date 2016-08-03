class RemoveForeignKey < ActiveRecord::Migration
  def change
    remove_reference :comments, :post, index: true
    remove_foreign_key :comments, :post
  end
end
