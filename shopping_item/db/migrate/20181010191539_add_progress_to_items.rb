class AddProgressToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :check, :boolean
  end
end
