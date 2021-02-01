class Post < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content 
      t.belongs_to :user, foreign_key: true 
      t.belongs_to :topic, foreign_key: true 


    t.timestamps
  end
end
