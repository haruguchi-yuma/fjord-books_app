class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, default: 'test_user'
    add_column :users, :postal_code, :integer
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
