class RemoveForeignKeyFromComments < ActiveRecord::Migration
  def change
    remove_reference :comments, :topic, index: true
    remove_foreign_key :comments, :topic
  end
end
