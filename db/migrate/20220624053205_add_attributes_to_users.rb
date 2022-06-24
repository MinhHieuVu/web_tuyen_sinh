class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, limit: 32
    add_column :users, :name, :string, limit: 64
    add_column :users, :role, :integer, default: 0
    add_column :users, :slug, :string
    add_column :users, :status, :integer, default: 1

    # Profile
    add_column :users, :avatar, :string
    add_column :users, :birthday, :date
    add_column :users, :sex, :boolean
    add_column :users, :phone, :string, limit: 20
    add_column :users, :address, :string, limit: 1000
    add_column :users, :current_class, :integer
    add_column :users, :current_year, :integer, limit: 4

    add_index :users, :slug, unique: true

    # Add Omniauth
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
