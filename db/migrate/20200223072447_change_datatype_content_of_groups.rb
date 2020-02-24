class ChangeDatatypeContentOfGroups < ActiveRecord::Migration[5.0]
  def change
    change_column :groups, :content, :text
  end
end
