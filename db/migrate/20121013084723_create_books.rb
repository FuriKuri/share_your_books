class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :owner_id
      t.integer :lent_to_user_id

      t.timestamps
    end
  end
end
