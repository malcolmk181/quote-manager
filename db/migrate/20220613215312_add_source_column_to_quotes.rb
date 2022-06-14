class AddSourceColumnToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :source, :string
  end
end
