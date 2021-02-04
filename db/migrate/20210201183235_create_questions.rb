class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :content
      t.boolean :answered, default: false
      t.belongs_to :user, foreign_key: true 
      t.belongs_to :topic, foreign_key: true 

      t.timestamps
    end
  end
end
