class CreateFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :facts do |t|
      t.string :tweet
      t.string :username

      t.timestamps
    end
  end
end
