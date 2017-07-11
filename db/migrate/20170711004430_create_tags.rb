class CreateTags < ActiveRecord::Migration[5.1]
  def change

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :associations do |t|
      t.integer :product_id
      t.integer :tag_id
      t.timestamps
    end

  end
end
