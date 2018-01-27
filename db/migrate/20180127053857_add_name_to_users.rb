class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string, :unique => true
    add_column :users, :image, :string
    add_column :users, :introduction, :text

  end
end
