class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.text :author
      t.integer :fact_id

      t.timestamps
    end
  end
end
