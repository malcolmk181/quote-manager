class QuotesHaveManyTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :quotes, :topic_id

    create_table :quote_topics do |t|
      t.references :quote
      t.references :topic
    end
  end
end
