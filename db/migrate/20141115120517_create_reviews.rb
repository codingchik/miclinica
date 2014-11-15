class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :upvotes
      t.references :clinic, index: true

      t.timestamps
    end
  end
end
