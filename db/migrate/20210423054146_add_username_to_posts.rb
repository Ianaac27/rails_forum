class AddUsernameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :username, :string
    add_index :posts, :username
  end
end
