class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.timestamp :date
      t.string :image_url

    end
  end
end
