class AddUsernameToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :username, :string
    add_index :comments, :username
  end
end
