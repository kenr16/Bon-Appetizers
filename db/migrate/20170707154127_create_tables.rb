class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :category, :string
      t.column :price, :decimal

      t.timestamps
    end

    create_table :reviews do |t|
      t.column :author, :string
      t.column :rating, :integer
      t.column :content, :string
      t.column :product_id, :integer

      t.timestamps
    end

    create_table :users do |t|
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.column :admin, :boolean
      t.column :name, :string
    end

  end
end
