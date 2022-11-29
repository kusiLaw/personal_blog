class CreateJoinTableUserPost < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :posts, table_name: :likes do |t|
      # t.index [:user_id, :post_id]
      # t.index [:post_id, :user_id]
      t.timestamps
    end
    create_join_table :users, :posts, table_name: :comments do |t|
      # t.index [:user_id, :post_id]
      # t.index [:post_id, :user_id]
      t.text :text

      t.timestamps
    end
  end
end
