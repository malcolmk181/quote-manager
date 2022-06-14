class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :message
      t.integer :year
      t.string :url

      t.integer :author_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
