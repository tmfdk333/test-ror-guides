class AddBuyToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :buy, :boolean
  end
end
