class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :post, polymorphic: true, null: false

      t.timestamps
    end
  end
end
