class AddStatusToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :status, :integer
  end
end
