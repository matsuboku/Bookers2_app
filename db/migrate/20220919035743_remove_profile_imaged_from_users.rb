class RemoveProfileImagedFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :profile_imaged, :string
    remove_column :users, :profile_imaged_id, :string
  end
end
