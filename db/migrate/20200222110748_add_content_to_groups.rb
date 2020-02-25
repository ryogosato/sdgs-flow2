class AddContentToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :content, :string
  end
end
