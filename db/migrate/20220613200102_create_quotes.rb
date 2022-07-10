class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :message
      t.integer :year
      t.string :url

      t.references :author
      t.references :topic

      t.timestamps
    end
  end
end
