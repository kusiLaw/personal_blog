class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: 'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG.png'
      t.string :bio
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
