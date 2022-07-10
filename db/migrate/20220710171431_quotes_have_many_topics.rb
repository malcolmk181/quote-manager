class QuotesHaveManyTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :quotes, :topic_id

    add_table :quotes_topics do |t|
      t.integer :quote_id
      t.integer :topic_id
    end
  end
end
